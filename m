Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03C77491
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 21:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FCFC340F5;
	Tue,  8 Mar 2022 21:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646776621;
	bh=kZiBj8WpI2fstszcS5G2ImYcEYy1OBAxph3sAglZWZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P/v3lLMIxlIPHFA/PnpXNemtS0XpAMXf8tpt5zjVUDIWnVsaZZH2aBng6tCm0ArRJ
	 7PYoMuwz8FVCbkjSLOkQSge61tlXQqa47vYOqwBxQ3EEG23e2yu5TApxzZ/Ofe2ll+
	 nxZKZYELICcE3cjcMcGMcGC9rmfbsWpBs7TYC6ZC4OZ4WFYAzeI0ELECGARqu5UIAU
	 6SIg0Fh2aGPfK8sdAvGyY051HgY7JTYA3LQ5kR1PWlgcfMHWw6Sp22qRapbHav0Yds
	 63Tfbz+jXGgv9geBl5ROGwefc5TIPszPaLb1qMRNA4MGAyzBj2t0S/5ZYVMkeH6Y4H
	 OwmsGkztuLGrQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: alexs@kernel.org,
	arnd@arndb.de,
	arnd@kernel.org,
	dsterba@suse.com,
	elver@google.com,
	jani.nikula@intel.com,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mark.rutland@arm.com,
	ndesaulniers@google.com,
	ojeda@kernel.org,
	torvalds@linux-foundation.org
Subject: [PATCH 2/4] [v4] Kbuild: use -Wdeclaration-after-statement
Date: Tue,  8 Mar 2022 22:56:13 +0100
Message-Id: <20220308215615.14183-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220308215615.14183-1-arnd@kernel.org>
References: <20220308215615.14183-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mark Rutland <mark.rutland@arm.com>

The kernel is moving from using `-std=gnu89` to `-std=gnu11`, permitting
the use of additional C11 features such as for-loop initial declarations.

One contentious aspect of C99 is that it permits mixed declarations and
code, and for now at least, it seems preferable to enforce that
declarations must come first.

These warnings were already enabled in the kernel itself, but not
for KBUILD_USERCFLAGS or the compat VDSO on arch/arm64, which uses
a separate set of CFLAGS.

This patch fixes an existing violation in modpost.c, which is not
reported because of the missing flag in KBUILD_USERCFLAGS:

| scripts/mod/modpost.c: In function ‘match’:
| scripts/mod/modpost.c:837:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
|   837 |   const char *endp = p + strlen(p) - 1;
|       |   ^~~~~

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
[arnd: don't add a duplicate flag to the default set, update changelog]
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
[v4]
  move ahead of actual std=gnu11 change
---
 Makefile                          | 3 ++-
 arch/arm64/kernel/vdso32/Makefile | 1 +
 scripts/mod/modpost.c             | 4 +++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a82095c69fdd..c791bfd5a471 100644
--- a/Makefile
+++ b/Makefile
@@ -432,7 +432,8 @@ HOSTCXX	= g++
 endif
 
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
-			 -O2 -fomit-frame-pointer -std=gnu89
+			 -O2 -fomit-frame-pointer -std=gnu89 \
+			 -Wdeclaration-after-statement
 KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
 KBUILD_USERLDFLAGS := $(USERLDFLAGS)
 
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 6c01b63ff56d..f46457f1f4f0 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -68,6 +68,7 @@ VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                -fno-strict-aliasing -fno-common \
                -Werror-implicit-function-declaration \
                -Wno-format-security \
+               -Wdeclaration-after-statement \
                -std=gnu89
 VDSO_CFLAGS  += -O2
 # Some useful compiler-dependent flags from top-level Makefile
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 6bfa33217914..fe693304b120 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -833,8 +833,10 @@ static int match(const char *sym, const char * const pat[])
 {
 	const char *p;
 	while (*pat) {
+		const char *endp;
+
 		p = *pat++;
-		const char *endp = p + strlen(p) - 1;
+		endp = p + strlen(p) - 1;
 
 		/* "*foo*" */
 		if (*p == '*' && *endp == '*') {
-- 
2.29.2

