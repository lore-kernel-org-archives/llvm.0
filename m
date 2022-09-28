Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AFB46A8
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F829C43141;
	Wed, 28 Sep 2022 16:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664382585;
	bh=fdpi10kQlRazyTr+SlOn77cvFkgoSevjT+ijKpXJ/sA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U0eXGiUahBnc1trC2eUbTTEwU5CEKFe9nfnL69aZSqjDFhV5csBJpIPA3O/lJHOGz
	 6ueK5LQQWpAxqL5F6PTiirlV2lRUsZ+JsvJ+Nj4sfinwpH+ygi+nu6yF/Mje9NKdrf
	 aSlYNx4/TRcIwBg4ii4b2wa9SnsEXV0iihHfqQB+hTbbqXx5g+nWVTx2KGS20FGpc9
	 G65p5G/+hBO6kLnoKsHeYTG0UZX2IuWwjazSyocGMF9GRvc+nnRucazD481qZfTpcS
	 R+T8Z14mSVtgsbmOZjGJPg1R4Tl/IfO2Sevq0ecqYGjs7nlblOjRKzAE1MQp/B1jlB
	 BBqYmLiwhZvlA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 4/4] riscv: entry: consolidate general regs saving into save_gp
Date: Thu, 29 Sep 2022 00:20:07 +0800
Message-Id: <20220928162007.3791-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928162007.3791-1-jszhang@kernel.org>
References: <20220928162007.3791-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate the saving/restoring GPs(except ra, sp and tp) into
save_gp/restore_gp macro.

No functional change intended.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/asm.h   | 65 +++++++++++++++++++++++++
 arch/riscv/kernel/entry.S      | 87 ++--------------------------------
 arch/riscv/kernel/mcount-dyn.S | 58 +----------------------
 3 files changed, 70 insertions(+), 140 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 1b471ff73178..2f3b49536e9d 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -68,6 +68,7 @@
 #endif
 
 #ifdef __ASSEMBLY__
+#include <asm/asm-offsets.h>
 
 /* Common assembly source macros */
 
@@ -80,6 +81,70 @@
 	.endr
 .endm
 
+	/* save all GPs except ra, sp and tp */
+	.macro save_gp
+	REG_S x3,  PT_GP(sp)
+	REG_S x5,  PT_T0(sp)
+	REG_S x6,  PT_T1(sp)
+	REG_S x7,  PT_T2(sp)
+	REG_S x8,  PT_S0(sp)
+	REG_S x9,  PT_S1(sp)
+	REG_S x10, PT_A0(sp)
+	REG_S x11, PT_A1(sp)
+	REG_S x12, PT_A2(sp)
+	REG_S x13, PT_A3(sp)
+	REG_S x14, PT_A4(sp)
+	REG_S x15, PT_A5(sp)
+	REG_S x16, PT_A6(sp)
+	REG_S x17, PT_A7(sp)
+	REG_S x18, PT_S2(sp)
+	REG_S x19, PT_S3(sp)
+	REG_S x20, PT_S4(sp)
+	REG_S x21, PT_S5(sp)
+	REG_S x22, PT_S6(sp)
+	REG_S x23, PT_S7(sp)
+	REG_S x24, PT_S8(sp)
+	REG_S x25, PT_S9(sp)
+	REG_S x26, PT_S10(sp)
+	REG_S x27, PT_S11(sp)
+	REG_S x28, PT_T3(sp)
+	REG_S x29, PT_T4(sp)
+	REG_S x30, PT_T5(sp)
+	REG_S x31, PT_T6(sp)
+	.endm
+
+	/* restore all GPs except ra, sp and tp */
+	.macro restore_gp
+	REG_L x3,  PT_GP(sp)
+	REG_L x5,  PT_T0(sp)
+	REG_L x6,  PT_T1(sp)
+	REG_L x7,  PT_T2(sp)
+	REG_L x8,  PT_S0(sp)
+	REG_L x9,  PT_S1(sp)
+	REG_L x10, PT_A0(sp)
+	REG_L x11, PT_A1(sp)
+	REG_L x12, PT_A2(sp)
+	REG_L x13, PT_A3(sp)
+	REG_L x14, PT_A4(sp)
+	REG_L x15, PT_A5(sp)
+	REG_L x16, PT_A6(sp)
+	REG_L x17, PT_A7(sp)
+	REG_L x18, PT_S2(sp)
+	REG_L x19, PT_S3(sp)
+	REG_L x20, PT_S4(sp)
+	REG_L x21, PT_S5(sp)
+	REG_L x22, PT_S6(sp)
+	REG_L x23, PT_S7(sp)
+	REG_L x24, PT_S8(sp)
+	REG_L x25, PT_S9(sp)
+	REG_L x26, PT_S10(sp)
+	REG_L x27, PT_S11(sp)
+	REG_L x28, PT_T3(sp)
+	REG_L x29, PT_T4(sp)
+	REG_L x30, PT_T5(sp)
+	REG_L x31, PT_T6(sp)
+	.endm
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_ASM_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 5a6171a90d81..a90f17ed2822 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -40,34 +40,7 @@ _save_context:
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 	REG_S x1,  PT_RA(sp)
-	REG_S x3,  PT_GP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
-	REG_S x10, PT_A0(sp)
-	REG_S x11, PT_A1(sp)
-	REG_S x12, PT_A2(sp)
-	REG_S x13, PT_A3(sp)
-	REG_S x14, PT_A4(sp)
-	REG_S x15, PT_A5(sp)
-	REG_S x16, PT_A6(sp)
-	REG_S x17, PT_A7(sp)
-	REG_S x18, PT_S2(sp)
-	REG_S x19, PT_S3(sp)
-	REG_S x20, PT_S4(sp)
-	REG_S x21, PT_S5(sp)
-	REG_S x22, PT_S6(sp)
-	REG_S x23, PT_S7(sp)
-	REG_S x24, PT_S8(sp)
-	REG_S x25, PT_S9(sp)
-	REG_S x26, PT_S10(sp)
-	REG_S x27, PT_S11(sp)
-	REG_S x28, PT_T3(sp)
-	REG_S x29, PT_T4(sp)
-	REG_S x30, PT_T5(sp)
-	REG_S x31, PT_T6(sp)
+	save_gp
 
 	/*
 	 * Disable user-mode memory access as it should only be set in the
@@ -182,35 +155,8 @@ ENTRY(ret_from_exception)
 	csrw CSR_STATUS, a0
 
 	REG_L x1,  PT_RA(sp)
-	REG_L x3,  PT_GP(sp)
 	REG_L x4,  PT_TP(sp)
-	REG_L x5,  PT_T0(sp)
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x8,  PT_S0(sp)
-	REG_L x9,  PT_S1(sp)
-	REG_L x10, PT_A0(sp)
-	REG_L x11, PT_A1(sp)
-	REG_L x12, PT_A2(sp)
-	REG_L x13, PT_A3(sp)
-	REG_L x14, PT_A4(sp)
-	REG_L x15, PT_A5(sp)
-	REG_L x16, PT_A6(sp)
-	REG_L x17, PT_A7(sp)
-	REG_L x18, PT_S2(sp)
-	REG_L x19, PT_S3(sp)
-	REG_L x20, PT_S4(sp)
-	REG_L x21, PT_S5(sp)
-	REG_L x22, PT_S6(sp)
-	REG_L x23, PT_S7(sp)
-	REG_L x24, PT_S8(sp)
-	REG_L x25, PT_S9(sp)
-	REG_L x26, PT_S10(sp)
-	REG_L x27, PT_S11(sp)
-	REG_L x28, PT_T3(sp)
-	REG_L x29, PT_T4(sp)
-	REG_L x30, PT_T5(sp)
-	REG_L x31, PT_T6(sp)
+	restore_gp
 
 	REG_L x2,  PT_SP(sp)
 
@@ -237,34 +183,7 @@ ENTRY(handle_kernel_stack_overflow)
 
 	//save context to overflow stack
 	REG_S x1,  PT_RA(sp)
-	REG_S x3,  PT_GP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
-	REG_S x10, PT_A0(sp)
-	REG_S x11, PT_A1(sp)
-	REG_S x12, PT_A2(sp)
-	REG_S x13, PT_A3(sp)
-	REG_S x14, PT_A4(sp)
-	REG_S x15, PT_A5(sp)
-	REG_S x16, PT_A6(sp)
-	REG_S x17, PT_A7(sp)
-	REG_S x18, PT_S2(sp)
-	REG_S x19, PT_S3(sp)
-	REG_S x20, PT_S4(sp)
-	REG_S x21, PT_S5(sp)
-	REG_S x22, PT_S6(sp)
-	REG_S x23, PT_S7(sp)
-	REG_S x24, PT_S8(sp)
-	REG_S x25, PT_S9(sp)
-	REG_S x26, PT_S10(sp)
-	REG_S x27, PT_S11(sp)
-	REG_S x28, PT_T3(sp)
-	REG_S x29, PT_T4(sp)
-	REG_S x30, PT_T5(sp)
-	REG_S x31, PT_T6(sp)
+	save_gp
 
 	REG_L s0, TASK_TI_KERNEL_SP(tp)
 	csrr s1, CSR_STATUS
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index d171eca623b6..1b4b0aecf4f5 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -68,35 +68,8 @@
 	REG_L x1,  PT_EPC(sp)
 
 	REG_S x2,  PT_SP(sp)
-	REG_S x3,  PT_GP(sp)
 	REG_S x4,  PT_TP(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x8,  PT_S0(sp)
-	REG_S x9,  PT_S1(sp)
-	REG_S x10, PT_A0(sp)
-	REG_S x11, PT_A1(sp)
-	REG_S x12, PT_A2(sp)
-	REG_S x13, PT_A3(sp)
-	REG_S x14, PT_A4(sp)
-	REG_S x15, PT_A5(sp)
-	REG_S x16, PT_A6(sp)
-	REG_S x17, PT_A7(sp)
-	REG_S x18, PT_S2(sp)
-	REG_S x19, PT_S3(sp)
-	REG_S x20, PT_S4(sp)
-	REG_S x21, PT_S5(sp)
-	REG_S x22, PT_S6(sp)
-	REG_S x23, PT_S7(sp)
-	REG_S x24, PT_S8(sp)
-	REG_S x25, PT_S9(sp)
-	REG_S x26, PT_S10(sp)
-	REG_S x27, PT_S11(sp)
-	REG_S x28, PT_T3(sp)
-	REG_S x29, PT_T4(sp)
-	REG_S x30, PT_T5(sp)
-	REG_S x31, PT_T6(sp)
+	save_gp
 	.endm
 
 	.macro RESTORE_ALL
@@ -106,35 +79,8 @@
 	addi	sp, sp, -PT_SIZE_ON_STACK
 	REG_L x1,  PT_EPC(sp)
 	REG_L x2,  PT_SP(sp)
-	REG_L x3,  PT_GP(sp)
 	REG_L x4,  PT_TP(sp)
-	REG_L x5,  PT_T0(sp)
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x8,  PT_S0(sp)
-	REG_L x9,  PT_S1(sp)
-	REG_L x10, PT_A0(sp)
-	REG_L x11, PT_A1(sp)
-	REG_L x12, PT_A2(sp)
-	REG_L x13, PT_A3(sp)
-	REG_L x14, PT_A4(sp)
-	REG_L x15, PT_A5(sp)
-	REG_L x16, PT_A6(sp)
-	REG_L x17, PT_A7(sp)
-	REG_L x18, PT_S2(sp)
-	REG_L x19, PT_S3(sp)
-	REG_L x20, PT_S4(sp)
-	REG_L x21, PT_S5(sp)
-	REG_L x22, PT_S6(sp)
-	REG_L x23, PT_S7(sp)
-	REG_L x24, PT_S8(sp)
-	REG_L x25, PT_S9(sp)
-	REG_L x26, PT_S10(sp)
-	REG_L x27, PT_S11(sp)
-	REG_L x28, PT_T3(sp)
-	REG_L x29, PT_T4(sp)
-	REG_L x30, PT_T5(sp)
-	REG_L x31, PT_T6(sp)
+	restore_gp
 
 	addi	sp, sp, PT_SIZE_ON_STACK
 	addi	sp, sp, SZREG
-- 
2.34.1

