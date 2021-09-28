Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1EE72
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 15:42:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39AAB6124A;
	Tue, 28 Sep 2021 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632843722;
	bh=ChBTgQnPISjb8SQT8vWLdwVriUt/cxd344Ze2iJ0p7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNHfa5g3ugbxuSJXsdCVKKN4KoBMnKJ4s8mwhvIKTWsRj937WLHOkG4ks4dwPIt1V
	 nas4ZGB/oIlv2dSmA21whS129X4oalvkfH00iw1ZTCSm2JobngMJ3k7SuFjCOQurXl
	 iGdC+a5DwwMk0exGZd+pmCSvL0+kHBEK2ZzwsZHn+myS0M7Mhgy1wBNpxZ+lnKWCcN
	 Ujwag5g28nLObpQDE4swreLoALz6evy8c6kPi15g7R3f10Q2Cyoi4wbL6HtbJ7nt/D
	 mIm/gsuA4BttvHd+0nRVFjFU3qwg6rsjDm5YxeoMxwA4bDNVkc+Os5tLQCBYlWiNIX
	 Y5oGtyzEZc0Aw==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH 02/14] ARM: patch: fix BE32 compilation
Date: Tue, 28 Sep 2021 17:41:31 +0200
Message-Id: <20210928154143.2106903-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210928154143.2106903-1-arnd@kernel.org>
References: <20210928154143.2106903-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On BE32 kernels, the __opcode_to_mem_thumb32() interface is intentionally
not defined, but it is referenced whenever runtime patching is enabled
for the kernel, which may be for ftrace, jump label, kprobes or kgdb:

arch/arm/kernel/patch.c: In function '__patch_text_real':
arch/arm/kernel/patch.c:94:32: error: implicit declaration of function '__opcode_to_mem_thumb32' [-Werror=implicit-function-declaration]
   94 |                         insn = __opcode_to_mem_thumb32(insn);
      |                                ^~~~~~~~~~~~~~~~~~~~~~~

Since BE32 kernels never run Thumb2 code, we never end up using the
result of this call, so providing an extern declaration without
a definition makes it build correctly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/opcodes.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/opcodes.h b/arch/arm/include/asm/opcodes.h
index 6bff94b2372b..38e3eabff5c3 100644
--- a/arch/arm/include/asm/opcodes.h
+++ b/arch/arm/include/asm/opcodes.h
@@ -110,12 +110,17 @@ extern asmlinkage unsigned int arm_check_condition(u32 opcode, u32 psr);
 #define __opcode_to_mem_thumb16(x) ___opcode_identity16(x)
 #define ___asm_opcode_to_mem_arm(x) ___asm_opcode_identity32(x)
 #define ___asm_opcode_to_mem_thumb16(x) ___asm_opcode_identity16(x)
-#ifndef CONFIG_CPU_ENDIAN_BE32
+#ifdef CONFIG_CPU_ENDIAN_BE32
+#ifndef __ASSEMBLY__
 /*
  * On BE32 systems, using 32-bit accesses to store Thumb instructions will not
  * work in all cases, due to alignment constraints.  For now, a correct
- * version is not provided for BE32.
+ * version is not provided for BE32, but the prototype needs to be there
+ * to compile patch.c.
  */
+extern __u32 __opcode_to_mem_thumb32(__u32);
+#endif
+#else
 #define __opcode_to_mem_thumb32(x) ___opcode_swahw32(x)
 #define ___asm_opcode_to_mem_thumb32(x) ___asm_opcode_swahw32(x)
 #endif
-- 
2.29.2

