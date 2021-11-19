Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82F568
	for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 14:35:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E986661265;
	Fri, 19 Nov 2021 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1637332513;
	bh=zYm+OC90toLHxP3CTAFlczxNKxyn8AJSWDJPGHFf2aM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=jK0Sk0B6Q8YHlET3r9J6m9owiwY5vo6fI4Ry72ELVAjzGVY+jcWK+ZH6jAopT1ilC
	 XhM9dCuKcP4cZ9iYSsC5QjtIJBEOPi6y0V309PocYUh8oN22+pTEQjwQbtax6/S6QE
	 GeoGCjVA3u0DNSZRBFUzNGXNP68vtELg3BckUI94=
Subject: Patch "scripts/lld-version.sh: Rewrite based on upstream ld-version.sh" has been added to the 5.10-stable tree
To: gregkh@linuxfoundation.org,llvm@lists.linux.dev,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 19 Nov 2021 15:34:55 +0100
In-Reply-To: <20211115164322.560965-1-nathan@kernel.org>
Message-ID: <163733249524920@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    scripts/lld-version.sh: Rewrite based on upstream ld-version.sh

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     scripts-lld-version.sh-rewrite-based-on-upstream-ld-version.sh.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Fri Nov 19 15:27:39 2021
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 15 Nov 2021 09:43:23 -0700
Subject: scripts/lld-version.sh: Rewrite based on upstream ld-version.sh
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org, llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Message-ID: <20211115164322.560965-1-nathan@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This patch is for linux-5.10.y only.

When scripts/lld-version.sh was initially written, it did not account
for the LLD_VENDOR cmake flag, which changes the output of ld.lld's
--version flag slightly.

Without LLD_VENDOR:

$ ld.lld --version
LLD 14.0.0 (compatible with GNU linkers)

With LLD_VENDOR:

$ ld.lld --version
Debian LLD 14.0.0 (compatible with GNU linkers)

As a result, CONFIG_LLD_VERSION is messed up and configuration values
that are dependent on it cannot be selected:

scripts/lld-version.sh: 20: printf: LLD: expected numeric value
scripts/lld-version.sh: 20: printf: LLD: expected numeric value
scripts/lld-version.sh: 20: printf: LLD: expected numeric value
init/Kconfig:52:warning: 'LLD_VERSION': number is invalid
.config:11:warning: symbol value '00000' invalid for LLD_VERSION
.config:8800:warning: override: CPU_BIG_ENDIAN changes choice state

This was fixed upstream by commit 1f09af062556 ("kbuild: Fix
ld-version.sh script if LLD was built with LLD_VENDOR") in 5.12 but that
was done to ld-version.sh after it was massively rewritten in
commit 02aff8592204 ("kbuild: check the minimum linker version in
Kconfig").

To avoid bringing in that change plus its prerequisites and fixes, just
modify lld-version.sh to make it similar to the upstream ld-version.sh,
which handles ld.lld with or without LLD_VENDOR and ld.bfd without any
errors.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 scripts/lld-version.sh |   35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

--- a/scripts/lld-version.sh
+++ b/scripts/lld-version.sh
@@ -6,15 +6,32 @@
 # Print the linker version of `ld.lld' in a 5 or 6-digit form
 # such as `100001' for ld.lld 10.0.1 etc.
 
-linker_string="$($* --version)"
+set -e
 
-if ! ( echo $linker_string | grep -q LLD ); then
+# Convert the version string x.y.z to a canonical 5 or 6-digit form.
+get_canonical_version()
+{
+	IFS=.
+	set -- $1
+
+	# If the 2nd or 3rd field is missing, fill it with a zero.
+	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
+}
+
+# Get the first line of the --version output.
+IFS='
+'
+set -- $(LC_ALL=C "$@" --version)
+
+# Split the line on spaces.
+IFS=' '
+set -- $1
+
+while [ $# -gt 1 -a "$1" != "LLD" ]; do
+	shift
+done
+if [ "$1" = LLD ]; then
+	echo $(get_canonical_version ${2%-*})
+else
 	echo 0
-	exit 1
 fi
-
-VERSION=$(echo $linker_string | cut -d ' ' -f 2)
-MAJOR=$(echo $VERSION | cut -d . -f 1)
-MINOR=$(echo $VERSION | cut -d . -f 2)
-PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
-printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.10/fortify-explicitly-disable-clang-support.patch
queue-5.10/scripts-lld-version.sh-rewrite-based-on-upstream-ld-version.sh.patch
queue-5.10/arm64-vdso32-suppress-error-message-for-make-mrproper.patch
