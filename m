Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E4ED8
	for <llvm@lists.linux.dev>; Sun, 16 Oct 2022 13:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9B0C433D6;
	Sun, 16 Oct 2022 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1665925404;
	bh=AlMhoJR/gwF4fTaAgHcwWTWDmySoU0/SvBpsoS7+bOI=;
	h=Subject:To:Cc:From:Date:From;
	b=zLxFchi+PQ39oLimFeQ2qIyAl/fbJLI+8jCHNMo8s4AwmX9SX/HHG4rfc8nPNs7zd
	 cwpacmK+ZI45BDfoUMw3ObzVjSva88vHfJ1AtCwVo1UIn1HjLLXb9a+bVhc2PEL583
	 aKEHgmMAp1Vh6TU+tFz/rVEjmJd3M3AYaHuNELwE=
Subject: Patch "hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO" has been added to the 5.10-stable tree
To: gregkh@linuxfoundation.org,keescook@chromium.org,llvm@lists.linux.dev,masahiroy@kernel.org,nathan@kernel.org,ndesaulniers@google.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 16 Oct 2022 15:04:06 +0200
Message-ID: <16659254461882@kroah.com>
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

    hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     hardening-avoid-harmless-clang-option-under-config_init_stack_all_zero.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Oct 16 03:03:28 PM CEST 2022
From: Kees Cook <keescook@chromium.org>
Date: Tue, 14 Sep 2021 12:49:03 -0700
Subject: hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO

From: Kees Cook <keescook@chromium.org>

commit f02003c860d921171be4a27e2893766eb3bc6871 upstream.

Currently under Clang, CC_HAS_AUTO_VAR_INIT_ZERO requires an extra
-enable flag compared to CC_HAS_AUTO_VAR_INIT_PATTERN. GCC 12[1] will
not, and will happily ignore the Clang-specific flag. However, its
presence on the command-line is both cumbersome and confusing. Due to
GCC's tolerant behavior, though, we can continue to use a single Kconfig
cc-option test for the feature on both compilers, but then drop the
Clang-specific option in the Makefile.

In other words, this patch does not change anything other than making the
compiler command line shorter once GCC supports -ftrivial-auto-var-init=zero.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=a25e0b5e6ac8a77a71c229e0a7b744603365b0e9

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev
Fixes: dcb7c0b9461c ("hardening: Clarify Kconfig text for auto-var-init")
Suggested-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/lkml/20210914102837.6172-1-will@kernel.org/
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile                   |    6 +++---
 security/Kconfig.hardening |    5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -816,12 +816,12 @@ endif
 
 # Initialize all stack variables with a zero value.
 ifdef CONFIG_INIT_STACK_ALL_ZERO
-# Future support for zero initialization is still being debated, see
-# https://bugs.llvm.org/show_bug.cgi?id=45497. These flags are subject to being
-# renamed or dropped.
 KBUILD_CFLAGS	+= -ftrivial-auto-var-init=zero
+ifdef CONFIG_CC_IS_CLANG
+# https://bugs.llvm.org/show_bug.cgi?id=45497
 KBUILD_CFLAGS	+= -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
 endif
+endif
 
 DEBUG_CFLAGS	:=
 
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -23,13 +23,16 @@ config CC_HAS_AUTO_VAR_INIT_PATTERN
 	def_bool $(cc-option,-ftrivial-auto-var-init=pattern)
 
 config CC_HAS_AUTO_VAR_INIT_ZERO
+	# GCC ignores the -enable flag, so we can test for the feature with
+	# a single invocation using the flag, but drop it as appropriate in
+	# the Makefile, depending on the presence of Clang.
 	def_bool $(cc-option,-ftrivial-auto-var-init=zero -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang)
 
 choice
 	prompt "Initialize kernel stack variables at function entry"
 	default GCC_PLUGIN_STRUCTLEAK_BYREF_ALL if COMPILE_TEST && GCC_PLUGINS
 	default INIT_STACK_ALL_PATTERN if COMPILE_TEST && CC_HAS_AUTO_VAR_INIT_PATTERN
-	default INIT_STACK_ALL_ZERO if CC_HAS_AUTO_VAR_INIT_PATTERN
+	default INIT_STACK_ALL_ZERO if CC_HAS_AUTO_VAR_INIT_ZERO
 	default INIT_STACK_NONE
 	help
 	  This option enables initialization of stack variables at


Patches currently in stable-queue which might be from keescook@chromium.org are

queue-5.10/hardening-avoid-harmless-clang-option-under-config_init_stack_all_zero.patch
queue-5.10/hardening-remove-clang-s-enable-flag-for-ftrivial-auto-var-init-zero.patch
queue-5.10/hardening-clarify-kconfig-text-for-auto-var-init.patch
