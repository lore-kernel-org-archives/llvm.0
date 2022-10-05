Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7A3136B
	for <llvm@lists.linux.dev>; Wed,  5 Oct 2022 11:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD643C433C1;
	Wed,  5 Oct 2022 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664969354;
	bh=GD/8VNoRB31Cv36aOUsSyXcKbYwAnyUco5nuh/udgvo=;
	h=Subject:To:Cc:From:Date:From;
	b=LqGNedCQ0i1plinK2Mq9euihVKC3oweCy6mddQXAVDLUx4O1PCfPC6Z4Z3x+rKAC9
	 5xd4W9m7OPDVJZ9kwrFi8rHID+H7cqxQZPS+8+uTlyAtiDEvVVO6qu2up2O+XfRu8V
	 k9pI0bwmJqZIqT5TkxTEGH9B8BfP0TwHBEKw0Fy8=
Subject: Patch "hardening: Remove Clang's enable flag for -ftrivial-auto-var-init=zero" has been added to the 5.19-stable tree
To: gregkh@linuxfoundation.org,keescook@chromium.org,llvm@lists.linux.dev,masahiroy@kernel.org,nathan@kernel.org,ndesaulniers@google.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 05 Oct 2022 13:29:03 +0200
Message-ID: <166496934312883@kroah.com>
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

    hardening: Remove Clang's enable flag for -ftrivial-auto-var-init=zero

to the 5.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     hardening-remove-clang-s-enable-flag-for-ftrivial-auto-var-init-zero.patch
and it can be found in the queue-5.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 607e57c6c62c00965ae276902c166834ce73014a Mon Sep 17 00:00:00 2001
From: Kees Cook <keescook@chromium.org>
Date: Thu, 29 Sep 2022 22:57:43 -0700
Subject: hardening: Remove Clang's enable flag for -ftrivial-auto-var-init=zero

From: Kees Cook <keescook@chromium.org>

commit 607e57c6c62c00965ae276902c166834ce73014a upstream.

Now that Clang's -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
option is no longer required, remove it from the command line. Clang 16
and later will warn when it is used, which will cause Kconfig to think
it can't use -ftrivial-auto-var-init=zero at all. Check for whether it
is required and only use it when so.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kbuild@vger.kernel.org
Cc: llvm@lists.linux.dev
Cc: stable@vger.kernel.org
Fixes: f02003c860d9 ("hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO")
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile                   |    4 ++--
 security/Kconfig.hardening |   14 ++++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -830,8 +830,8 @@ endif
 # Initialize all stack variables with a zero value.
 ifdef CONFIG_INIT_STACK_ALL_ZERO
 KBUILD_CFLAGS	+= -ftrivial-auto-var-init=zero
-ifdef CONFIG_CC_IS_CLANG
-# https://bugs.llvm.org/show_bug.cgi?id=45497
+ifdef CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER
+# https://github.com/llvm/llvm-project/issues/44842
 KBUILD_CFLAGS	+= -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
 endif
 endif
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -22,11 +22,17 @@ menu "Memory initialization"
 config CC_HAS_AUTO_VAR_INIT_PATTERN
 	def_bool $(cc-option,-ftrivial-auto-var-init=pattern)
 
-config CC_HAS_AUTO_VAR_INIT_ZERO
-	# GCC ignores the -enable flag, so we can test for the feature with
-	# a single invocation using the flag, but drop it as appropriate in
-	# the Makefile, depending on the presence of Clang.
+config CC_HAS_AUTO_VAR_INIT_ZERO_BARE
+	def_bool $(cc-option,-ftrivial-auto-var-init=zero)
+
+config CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER
+	# Clang 16 and later warn about using the -enable flag, but it
+	# is required before then.
 	def_bool $(cc-option,-ftrivial-auto-var-init=zero -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang)
+	depends on !CC_HAS_AUTO_VAR_INIT_ZERO_BARE
+
+config CC_HAS_AUTO_VAR_INIT_ZERO
+	def_bool CC_HAS_AUTO_VAR_INIT_ZERO_BARE || CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER
 
 choice
 	prompt "Initialize kernel stack variables at function entry"


Patches currently in stable-queue which might be from keescook@chromium.org are

queue-5.19/sparc-unbreak-the-build.patch
queue-5.19/makefile.extrawarn-move-wcast-function-type-strict-to-w-1.patch
queue-5.19/hardening-remove-clang-s-enable-flag-for-ftrivial-auto-var-init-zero.patch
