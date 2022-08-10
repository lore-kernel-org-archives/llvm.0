Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A392F3E
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 23:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AABC433C1;
	Wed, 10 Aug 2022 23:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660172505;
	bh=NnDvxipWRWd22orltCAXMkg0yBGFjX0zipam7lQ+xZk=;
	h=From:To:Cc:Subject:Date:From;
	b=fQxNqwPVBp5/BwVHJmmCpTrKNt8De6t9ihL+6vUTvAmr8X94LXBb1Kr1ATSYdCpp7
	 5795/Y/AupALDlYajNSBCEJsSYz44G3JlGqSkE0776U+lFbAj8TA3ooZwWD+rVEEiS
	 41EueM3llhm6ZoHPJK3oG52p2khuVOlPNUbBfc8okBbFsOx6acrpuFhjiZwRrcibeX
	 4B70Xbe5flokCaxsL5cjvTWEVP6BeDVQaKNsEaVhegJ1ZeUq3ROqnTzpIeCRggwD9d
	 oxYKF60xbEmGx/vyc1ER0LVhwdIdJBJ30ljgMYcSyhxcktgoE1hlEKfX+X+0RryuBG
	 F2DQuYibHMKPA==
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] scripts/Makefile.extrawarn: Do not disable clang's -Wformat-zero-length
Date: Wed, 10 Aug 2022 16:01:33 -0700
Message-Id: <20220810230133.1895778-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no instances of this warning in the tree across several
difference architectures and configurations. This was added by
commit 26ea6bb1fef0 ("kbuild, LLVMLinux: Supress warnings unless W=1-3")
back in 2014, where it might have been necessary, but there are no
instances of it now so stop disabling it to increase warning coverage
for clang.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 9bbaf7112a9b..69cec45c4e71 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -48,7 +48,6 @@ else
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-initializer-overrides
 KBUILD_CFLAGS += -Wno-sign-compare
-KBUILD_CFLAGS += -Wno-format-zero-length
 KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
 KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 KBUILD_CFLAGS += $(call cc-disable-warning, unaligned-access)

base-commit: aeb6e6ac18c73ec287b3b1e2c913520699358c13
-- 
2.37.1

