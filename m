Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595D13AF8
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 19:58:42 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d782a2ba9f9so7060169276.0
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 12:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693252722; x=1693857522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SyPtEI03Xg1fBX3TZi3WfjXMOPTYu0dO+LXPL6FV3JY=;
        b=aeycJH5+6uxe8GlNC+YyRdXkjill87qRi7L6FkS96p4g2q1s4N94P2OZ5QDES1S1TC
         MfwdeCDtem0I3jQ+onVBjqfV8svuERSpLpxq6jjZ+Ufji5mcFbBp+g6ChKwsHhVNFNna
         LQonssHhBVrDczuTEO5l5yf74aTZFJ60kJfW3XcL7yn1/dPDDGFUudDGC9NGcXlPudY4
         BuAw3Yfd3OAcCpnpMMIFLgvMXpik/3/GT/wQbEzdRIYCNBGI57sXpX998s0bzbLp+XDr
         +aCFpNwXtn4mlGFVj/IbkR53Q4xdpfP+oJruefxqPB++Dgcy9SSWoWGeTGKWxGTCKkQQ
         XlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693252722; x=1693857522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyPtEI03Xg1fBX3TZi3WfjXMOPTYu0dO+LXPL6FV3JY=;
        b=hP5xwUSIfx8mBkEHeGG29ImnzMlbV3fDa099iFeaVWtm8otkgg5CgIIgzDhyXcpVi3
         c5fgqj39yziqis848jDGxtb61LfQUH2P6KfidmdDm6uv59vp0f9g93FJTNiF94J4fTgG
         P9d7VZcglYRboNnjNfvAmMpahCtpzanSouoq1HhjlfMxWCZoBm/Zg4ngHCdiQTxybWAv
         zVjAf4I0iHQsNE1PW6ttySd8n+8RZ2OIoOSFGT3HV+ulCYy+XNVSj8sZCT35lQsytQpS
         8MjvV+3cYT6BnNRMR4NHBdnzoiK2ig2y8zDPcGcL/c9ihcWgpjTRqQguVlVxWT3PGReZ
         +H0A==
X-Gm-Message-State: AOJu0YxhlJFIwSoGUGwTb903GSyoFdqudTva78mg1qBihxMCGTRYcI60
	TSTgySNVZwCXmsIOyBHdUZfGcqGLPH5UPe2GcfQ=
X-Google-Smtp-Source: AGHT+IFJVA5tn0i/teRMdLPB4BUylObsezBXemw+f2wLcIS31CUsFOoZ7JWpR/ILow1bMm25R+eFhC5JiSZJ6WzUrIw=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6902:100d:b0:d47:3d35:1604 with
 SMTP id w13-20020a056902100d00b00d473d351604mr24925ybt.2.1693252722088; Mon,
 28 Aug 2023 12:58:42 -0700 (PDT)
Date: Mon, 28 Aug 2023 19:58:36 +0000
In-Reply-To: <20230828195833.756747-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230828195833.756747-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=6654; i=samitolvanen@google.com;
 h=from:subject; bh=wnBUbn/4zTqpJwVvv6oK/jRIJiyG33tTx6IcCOYR/uQ=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk7PxqgcThGLqOU6/Nh1FKa2ioMm4jOSxmZxX+a
 sZvOfWhvQCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZOz8agAKCRBMtfaEi7xW
 7qN/DACO5167AKEHcx/87vqquJtHBN9KGNAuOkAYwEvKikfyASynXP4pukx0I5Ac1cOyZbdSKL8
 Ce0qro1KPSj+B7uJLugyfen0UVTnlQTtNm24YRU2AnuqLCWm7zflBibZwWzhTqJsGZzImyJVLkB
 Yr3GszptMkh3O1gX6Tv2tmDjb+qkBlUMMRdltW45f/g9ibmbfcG5SO/vWQqcc3SMWqsc6m7JYwk
 keXj7naHVlBrPYSo+984uuAqdsHZ9q0aEVwqYIJOJIWhP5XgrEZZe3AJIp8OF8ZaefGmW5LiQ0I
 ixCukGxRFhOHpj9R9wdn6BFhLwcyzYzLwTqRW+Y7ko261wZrwLuApeBe44ru+05jqQ5SVj+y501
 vjpXz+IlnWoGzvDP7e5QFY1rNNe2X4QdPODLjs6C/p2TfoPH/k92JNa6S7ITaa1o90sUmL9p4bO NCj0TY91rJ1SesDvIqMSsrklIMv4du5khyVUbh1YZyymDHBkAXomC5VVAKeZHqxyNk6oQ=
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230828195833.756747-10-samitolvanen@google.com>
Subject: [PATCH v3 2/6] riscv: Deduplicate IRQ stack switching
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_IRQ_STACKS, we switch to a separate per-CPU IRQ stack
before calling handle_riscv_irq or __do_softirq. We currently
have duplicate inline assembly snippets for stack switching in
both code paths. Now that we can access per-CPU variables in
assembly, implement call_on_irq_stack in assembly, and use that
instead of redudant inline assembly.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/include/asm/asm.h       |  5 +++++
 arch/riscv/include/asm/irq_stack.h |  3 +++
 arch/riscv/kernel/asm-offsets.c    |  5 +++++
 arch/riscv/kernel/entry.S          | 30 +++++++++++++++++++++++++
 arch/riscv/kernel/irq.c            | 35 +++++++-----------------------
 arch/riscv/kernel/traps.c          | 32 ++++-----------------------
 6 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index bfb4c26f113c..8e446be2d57c 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -104,6 +104,11 @@
 .endm
 #endif /* CONFIG_SMP */
 
+.macro load_per_cpu dst ptr tmp
+	asm_per_cpu \dst \ptr \tmp
+	REG_L \dst, 0(\dst)
+.endm
+
 	/* save all GPs except x1 ~ x5 */
 	.macro save_from_x6_to_x31
 	REG_S x6,  PT_T1(sp)
diff --git a/arch/riscv/include/asm/irq_stack.h b/arch/riscv/include/asm/irq_stack.h
index e4042d297580..6441ded3b0cf 100644
--- a/arch/riscv/include/asm/irq_stack.h
+++ b/arch/riscv/include/asm/irq_stack.h
@@ -12,6 +12,9 @@
 
 DECLARE_PER_CPU(ulong *, irq_stack_ptr);
 
+asmlinkage void call_on_irq_stack(struct pt_regs *regs,
+				  void (*func)(struct pt_regs *));
+
 #ifdef CONFIG_VMAP_STACK
 /*
  * To ensure that VMAP'd stack overflow detection works correctly, all VMAP'd
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 9f535d5de33f..0af8860f9d68 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -14,6 +14,7 @@
 #include <asm/thread_info.h>
 #include <asm/ptrace.h>
 #include <asm/cpu_ops_sbi.h>
+#include <asm/stacktrace.h>
 #include <asm/suspend.h>
 
 void asm_offsets(void);
@@ -480,4 +481,8 @@ void asm_offsets(void)
 	OFFSET(KERNEL_MAP_VIRT_ADDR, kernel_mapping, virt_addr);
 	OFFSET(SBI_HART_BOOT_TASK_PTR_OFFSET, sbi_hart_boot_data, task_ptr);
 	OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
+
+	DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe), STACK_ALIGN));
+	OFFSET(STACKFRAME_FP, stackframe, fp);
+	OFFSET(STACKFRAME_RA, stackframe, ra);
 }
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3d11aa3af105..a306562636e4 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -218,6 +218,36 @@ SYM_CODE_START(ret_from_fork)
 	tail syscall_exit_to_user_mode
 SYM_CODE_END(ret_from_fork)
 
+#ifdef CONFIG_IRQ_STACKS
+/*
+ * void call_on_irq_stack(struct pt_regs *regs,
+ * 		          void (*func)(struct pt_regs *));
+ *
+ * Calls func(regs) using the per-CPU IRQ stack.
+ */
+SYM_FUNC_START(call_on_irq_stack)
+	/* Create a frame record to save ra and s0 (fp) */
+	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
+	REG_S	ra, STACKFRAME_RA(sp)
+	REG_S	s0, STACKFRAME_FP(sp)
+	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
+
+	/* Switch to the per-CPU IRQ stack and call the handler */
+	load_per_cpu t0, irq_stack_ptr, t1
+	li	t1, IRQ_STACK_SIZE
+	add	sp, t0, t1
+	jalr	a1
+
+	/* Switch back to the thread stack and restore ra and s0 */
+	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
+	REG_L	ra, STACKFRAME_RA(sp)
+	REG_L	s0, STACKFRAME_FP(sp)
+	addi	sp, sp, STACKFRAME_SIZE_ON_STACK
+
+	ret
+SYM_FUNC_END(call_on_irq_stack)
+#endif /* CONFIG_IRQ_STACKS */
+
 /*
  * Integer register context switch
  * The callee-saved registers must be saved and restored.
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index a8efa053c4a5..95dafdcbd135 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -61,35 +61,16 @@ static void init_irq_stacks(void)
 #endif /* CONFIG_VMAP_STACK */
 
 #ifdef CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
+static void ___do_softirq(struct pt_regs *regs)
+{
+	__do_softirq();
+}
+
 void do_softirq_own_stack(void)
 {
-#ifdef CONFIG_IRQ_STACKS
-	if (on_thread_stack()) {
-		ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id())
-					+ IRQ_STACK_SIZE/sizeof(ulong);
-		__asm__ __volatile(
-		"addi	sp, sp, -"RISCV_SZPTR  "\n"
-		REG_S"  ra, (sp)		\n"
-		"addi	sp, sp, -"RISCV_SZPTR  "\n"
-		REG_S"  s0, (sp)		\n"
-		"addi	s0, sp, 2*"RISCV_SZPTR "\n"
-		"move	sp, %[sp]		\n"
-		"call	__do_softirq		\n"
-		"addi	sp, s0, -2*"RISCV_SZPTR"\n"
-		REG_L"  s0, (sp)		\n"
-		"addi	sp, sp, "RISCV_SZPTR   "\n"
-		REG_L"  ra, (sp)		\n"
-		"addi	sp, sp, "RISCV_SZPTR   "\n"
-		:
-		: [sp] "r" (sp)
-		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
-#ifndef CONFIG_FRAME_POINTER
-		  "s0",
-#endif
-		  "memory");
-	} else
-#endif
+	if (on_thread_stack())
+		call_on_irq_stack(NULL, ___do_softirq);
+	else
 		__do_softirq();
 }
 #endif /* CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK */
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index a05905d88802..1fe6b475cdfb 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -350,34 +350,10 @@ static void noinstr handle_riscv_irq(struct pt_regs *regs)
 asmlinkage void noinstr do_irq(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
-#ifdef CONFIG_IRQ_STACKS
-	if (on_thread_stack()) {
-		ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id())
-					+ IRQ_STACK_SIZE/sizeof(ulong);
-		__asm__ __volatile(
-		"addi	sp, sp, -"RISCV_SZPTR  "\n"
-		REG_S"  ra, (sp)		\n"
-		"addi	sp, sp, -"RISCV_SZPTR  "\n"
-		REG_S"  s0, (sp)		\n"
-		"addi	s0, sp, 2*"RISCV_SZPTR "\n"
-		"move	sp, %[sp]		\n"
-		"move	a0, %[regs]		\n"
-		"call	handle_riscv_irq	\n"
-		"addi	sp, s0, -2*"RISCV_SZPTR"\n"
-		REG_L"  s0, (sp)		\n"
-		"addi	sp, sp, "RISCV_SZPTR   "\n"
-		REG_L"  ra, (sp)		\n"
-		"addi	sp, sp, "RISCV_SZPTR   "\n"
-		:
-		: [sp] "r" (sp), [regs] "r" (regs)
-		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
-#ifndef CONFIG_FRAME_POINTER
-		  "s0",
-#endif
-		  "memory");
-	} else
-#endif
+
+	if (IS_ENABLED(CONFIG_IRQ_STACKS) && on_thread_stack())
+		call_on_irq_stack(regs, handle_riscv_irq);
+	else
 		handle_riscv_irq(regs);
 
 	irqentry_exit(regs, state);
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

