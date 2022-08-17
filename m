Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9213C29
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 18:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760D0C433C1;
	Wed, 17 Aug 2022 18:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660762586;
	bh=eXADiVpfHcg0p9ebNKYLyPPBKa0498jYFVcf8rw3DfU=;
	h=From:To:Cc:Subject:Date:From;
	b=uNWnWrGa/iA9AbTblZpKPjGugAP02+5bUCO0KgE8GYJ+AbiTtX7Oj3AJO6Penfi4H
	 kCaRdNt4a4M1NjPJJJRO+uXXqbUL1LcC+rjJbbaTw4Bha+MjS6xlfCIIAGcnE+nOhm
	 7i0hNyv8kavo3JM1CgW+IV5/73keVGbmszNIPkdYvVMA4wHUvMXHh7U9gvSwl03Oh/
	 4Waosb7Zt9klX+ERpUpQorjzACE7TAk2RjVPiAeCCAIPpYrmu1MSvSmKR5GB30RlBO
	 K9do2XoSZ++RS3wyxcb8PA63VR9ofENLGDiFwpypjpF/Y415zsxdCscOqACtN1l8qb
	 grEMlSj3LnaRQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] x86/build: Move '-mindirect-branch-cs-prefix' out of GCC-only block
Date: Wed, 17 Aug 2022 11:54:11 -0700
Message-Id: <20220817185410.1174782-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LLVM 16 will have support for this flag so move it out of the GCC-only
block to allow LLVM builds to take advantage of it.

Link: https://github.com/ClangBuiltLinux/linux/issues/1665
Link: https://github.com/llvm/llvm-project/commit/6f867f9102838ebe314c1f3661fdf95700386e5a
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

I was not sure if this information is relevant for the commit message
but I can boot without any issues on my test machines (two Intel and one
AMD).

 arch/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 7854685c5f25..987da87c7778 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -14,13 +14,13 @@ endif
 
 ifdef CONFIG_CC_IS_GCC
 RETPOLINE_CFLAGS	:= $(call cc-option,-mindirect-branch=thunk-extern -mindirect-branch-register)
-RETPOLINE_CFLAGS	+= $(call cc-option,-mindirect-branch-cs-prefix)
 RETPOLINE_VDSO_CFLAGS	:= $(call cc-option,-mindirect-branch=thunk-inline -mindirect-branch-register)
 endif
 ifdef CONFIG_CC_IS_CLANG
 RETPOLINE_CFLAGS	:= -mretpoline-external-thunk
 RETPOLINE_VDSO_CFLAGS	:= -mretpoline
 endif
+RETPOLINE_CFLAGS	+= $(call cc-option,-mindirect-branch-cs-prefix)
 
 ifdef CONFIG_RETHUNK
 RETHUNK_CFLAGS		:= -mfunction-return=thunk-extern

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.2

