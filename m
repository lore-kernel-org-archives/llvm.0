Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED912590
	for <llvm@lists.linux.dev>; Mon, 24 Oct 2022 12:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B34AC433D6;
	Mon, 24 Oct 2022 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666613976;
	bh=6w1m8oTCk9uzWFr7+T1Vk2k2FAMBopqrgJZpxzytLWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y0CzeDKyCSEmCuUMjLnd+gUt73PzT0Ht9NdPR6jnPko1Ue8xaeegCz9kwvv7mlz06
	 MpQw7p9BWqPXm+lsN+P/Cc4h2YNSx+yGZWNk+0LgPJEKEJIaJP6FgFSG88jSbJNPw9
	 dJSunFrfrEvKwc/px0O9O+zOqRczaCBS9f5P3BlM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Kees Cook <keescook@chromium.org>
Subject: [PATCH 5.10 055/390] hardening: Remove Clangs enable flag for -ftrivial-auto-var-init=zero
Date: Mon, 24 Oct 2022 13:27:32 +0200
Message-Id: <20221024113024.968446156@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221024113022.510008560@linuxfoundation.org>
References: <20221024113022.510008560@linuxfoundation.org>
User-Agent: quilt/0.67
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile                   |    4 ++--
 security/Kconfig.hardening |   14 ++++++++++----
 2 files changed, 12 insertions(+), 6 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -817,8 +817,8 @@ endif
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


