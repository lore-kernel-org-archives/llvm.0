Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA51FA0
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 10:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E412C4339B;
	Tue, 18 Apr 2023 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681813034;
	bh=XKZwz4P8O0e62G3O5xxH7JMbuzIq5EsWgKxd/pr6fVM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=a1UsiC23X1N8diBmG8YLHWyVKlN9ZrwR3DBnCAq+lyzQnoxrlka/IjpQF0Eh3Sf03
	 QNfg92cs+9xdvXflNcf43Ud9OgwCVIRM9aL0zdeRUy6KF/ry69frkM5vXgqGVgE1V+
	 /LYrEcCza6GaPcqu+IfYsTObH1jsSbJwQzZUeEkY=
Subject: Patch "kbuild: Switch to 'f' variants of integrated assembler flag" has been added to the 5.10-stable tree
To: conor@kernel.org,gregkh@linuxfoundation.org,llvm@lists.linux.dev,masahiroy@kernel.org,nathan@kernel.org,ndesaulniers@google.com,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 18 Apr 2023 12:16:57 +0200
In-Reply-To: <20230328-riscv-zifencei-zicsr-5-10-v1-2-bccb3e16dc46@kernel.org>
Message-ID: <2023041857-purge-stumble-c060@gregkh>
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

    kbuild: Switch to 'f' variants of integrated assembler flag

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kbuild-switch-to-f-variants-of-integrated-assembler-flag.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable-owner@vger.kernel.org Wed Mar 29 02:08:38 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Mar 2023 17:08:30 -0700
Subject: kbuild: Switch to 'f' variants of integrated assembler flag
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: conor@kernel.org, stable@vger.kernel.org, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Message-ID: <20230328-riscv-zifencei-zicsr-5-10-v1-2-bccb3e16dc46@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

commit 2185a7e4b0ade86c2c57fc63d4a7535c40254bd0 upstream.

It has been brought up a few times in various code reviews that clang
3.5 introduced -f{,no-}integrated-as as the preferred way to enable and
disable the integrated assembler, mentioning that -{no-,}integrated-as
are now considered legacy flags.

Switch the kernel over to using those variants in case there is ever a
time where clang decides to remove the non-'f' variants of the flag.

Also, fix a typo in a comment ("intergrated" -> "integrated").

Link: https://releases.llvm.org/3.5.0/tools/clang/docs/ReleaseNotes.html#new-compiler-flags
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
[nathan: Backport to 5.10]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile              |    4 ++--
 scripts/as-version.sh |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -581,9 +581,9 @@ ifneq ($(GCC_TOOLCHAIN),)
 CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
 ifeq ($(LLVM_IAS),1)
-CLANG_FLAGS	+= -integrated-as
+CLANG_FLAGS	+= -fintegrated-as
 else
-CLANG_FLAGS	+= -no-integrated-as
+CLANG_FLAGS	+= -fno-integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
--- a/scripts/as-version.sh
+++ b/scripts/as-version.sh
@@ -21,14 +21,14 @@ get_canonical_version()
 	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
 }
 
-# Clang fails to handle -Wa,--version unless -no-integrated-as is given.
-# We check -(f)integrated-as, expecting it is explicitly passed in for the
+# Clang fails to handle -Wa,--version unless -fno-integrated-as is given.
+# We check -fintegrated-as, expecting it is explicitly passed in for the
 # integrated assembler case.
 check_integrated_as()
 {
 	while [ $# -gt 0 ]; do
-		if [ "$1" = -integrated-as -o "$1" = -fintegrated-as ]; then
-			# For the intergrated assembler, we do not check the
+		if [ "$1" = -fintegrated-as ]; then
+			# For the integrated assembler, we do not check the
 			# version here. It is the same as the clang version, and
 			# it has been already checked by scripts/cc-version.sh.
 			echo LLVM 0


Patches currently in stable-queue which might be from stable-owner@vger.kernel.org are

queue-5.10/kbuild-check-the-minimum-assembler-version-in-kconfig.patch
queue-5.10/cgroup-cpuset-make-cpuset_fork-handle-clone_into_cgroup-properly.patch
queue-5.10/kbuild-check-config_as_is_llvm-instead-of-llvm_ias.patch
queue-5.10/riscv-handle-zicsr-zifencei-issues-between-clang-and-binutils.patch
queue-5.10/kbuild-switch-to-f-variants-of-integrated-assembler-flag.patch
queue-5.10/cgroup-cpuset-add-cpuset_can_fork-and-cpuset_cancel_fork-methods.patch
queue-5.10/cgroup-cpuset-change-references-of-cpuset_mutex-to-cpuset_rwsem.patch
queue-5.10/cgroup-cpuset-skip-spread-flags-update-on-v2.patch
