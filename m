Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9D15AD7
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 20:34:51 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-26b3b1a0bd3so3221593a91.3
        for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 13:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692131691; x=1692736491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WrfRqvXS/YQAQD3rvUURRhi4O4V3buFLgz+cT4E6CXY=;
        b=0b0AfFag2OqtlzKfyBXLWRGSF8gW1eMeleZQdhIEnHmK7L+mnBqsuJuqNSwV6rtOEU
         u0s8fw9OKaQxUqiJRpnU0Hj7p2gKX/LzNZrGl2doSZ/b3K7fqQBZZ0gtHwr3NNrZmsmB
         bElC4ZVwGPAE2nH9h5njd1+8dir9Iv7EJaT4Lvaplu8can7LpTu0q410aYDm4oygCKG6
         CfmWyM/5WXnsrFI9sYk8nJqgbKJWDH+e0Ftx6cUw7Ad5/bw0dCu4KZjUmFeQGgW27LQW
         b1+64f0E00cHsDKGcITMxivXieyFjcRQHcbigwhvU5bczQjxjY4/w6pRvIEHpu+0KRhz
         IQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692131691; x=1692736491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrfRqvXS/YQAQD3rvUURRhi4O4V3buFLgz+cT4E6CXY=;
        b=ZXvEpWfnYbKAzLvTIEiE6h57XUpvtCxxLANc/edSDYt4PQsJSfwAr96Q3k/K/0p61L
         KluCkTU5tYZiRb3T6N6TN+aQnCpW5atKbmpTIaj5QkGHalug1oRqghsbfm9iOav+i/8D
         2aToYXnvY1sBAGB1R3nQotYRZwVkWuTR6cmEeK7cz1KHjWB3ohzOsRaA+V/PkDKyF5Rw
         mW+zXtLNWzvLSXAivlvGhG3FDBYaf5hKgWcFXhRZliy4YqudCvHdsImgAWXykHS5to9O
         GqU1Ly/ExbC/al5SYN98sd+Ve5Dmz/Vlrs/LZSZP26SCclMWK7laXt2C8ZU/srCBWtZA
         JvhQ==
X-Gm-Message-State: AOJu0Yy5anOZwQJEiqq9ZZ3JiMshX2R8Wji48hiNO2wwDZsrjurKGqjq
	HcnBFyjw0T/fGW6r2xkYqfPe9KawjhzgSuI5m9I=
X-Google-Smtp-Source: AGHT+IEchNZaBEINpLlSn/GPNkBO+VrwWfHXdxqZqQVAkBDyQGibTsdMvRWQoxISxiHRWmaP5XqKzzpcu2EXo/lIxzI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:d502:b0:26b:5fe2:5892 with
 SMTP id t2-20020a17090ad50200b0026b5fe25892mr1185559pju.6.1692131690966; Tue,
 15 Aug 2023 13:34:50 -0700 (PDT)
Date: Tue, 15 Aug 2023 20:34:45 +0000
In-Reply-To: <20230815203442.1608773-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230815203442.1608773-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5593; i=samitolvanen@google.com;
 h=from:subject; bh=fOkgWkASfAqgpBfAvGFiQ8Ap5BTE+sMjcVhFVqoevU4=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk2+FiD9deMgIJ3fhkaSc5TjCFw9aOJgO3lojDl
 IJKQL6WcO2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZNvhYgAKCRBMtfaEi7xW
 7uETC/oDWTmoCmprkVOzJT880FOolG/86ApcG+2Vp5pFm9jTSXw0uhsv0QJYCKBTupTIjofrNuk
 yID9Hm9vbntt8SHaS+jwKoheRWZDOAdh0tJuWru56EB0QyTPLLuI6f2NTAFPPDF7/N0MEfFY9Q2
 73sbckQRqQxt7tkF7oxFDkS6SMsogOzT8IZ2NuTszPpFCpFOybsEIX+sds97QqG22w0LjKn120J
 ABr9wCeGmcRNk7+5igryjV3nOw6/uMjWyZwGKIyzWrC3FFDqbHm5AuDcIgkhUd0DK5YK13HFgls
 qtnla0SK6MtOkM/Zg37Tt4SMgUlX9a75WKGDlVjX1j6KQSvU3TGRjp1Lyas587+RFyuvHXVjdX1
 qYlEOUKf8qQjIcqiNnCqllRAsCjzds/YrdVFgoHxrkzeXt+aq89oaE2tLG8gh3OC9y2pQ04Bpz8 vLLi1qj7Wm/3TWsrEydTvIulNO8xWEYLDag4+LI+L8CYYpBAwjrgoVvB0cCcF1VGQ0U5Y=
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230815203442.1608773-10-samitolvanen@google.com>
Subject: [PATCH v2 2/6] riscv: Deduplicate IRQ stack switching
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_IRQ_STACKS, we switch to a separate per-CPU IRQ stack
before calling handle_riscv_irq or __do_softirq. We currently
have duplicate inline assembly snippets for stack switching in
both code paths. Now that we can access per-CPU variables in
assembly, implement call_on_irq_stack in assembly, and use that
instead of redudant inline assembly.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/include/asm/asm.h       |  5 +++++
 arch/riscv/include/asm/irq_stack.h |  3 +++
 arch/riscv/kernel/entry.S          | 32 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/irq.c            | 32 ++++++++----------------------
 arch/riscv/kernel/traps.c          | 29 ++++-----------------------
 5 files changed, 52 insertions(+), 49 deletions(-)

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
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3d11aa3af105..39875f5e08a6 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -218,6 +218,38 @@ SYM_CODE_START(ret_from_fork)
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
+	addi	sp, sp, -RISCV_SZPTR
+	REG_S	ra, (sp)
+	addi	sp, sp, -RISCV_SZPTR
+	REG_S	s0, (sp)
+	addi	s0, sp, 2*RISCV_SZPTR
+
+	/* Switch to the per-CPU IRQ stack and call the handler */
+	load_per_cpu t0, irq_stack_ptr, t1
+	li	t1, IRQ_STACK_SIZE
+	add	sp, t0, t1
+	jalr	a1
+
+	/* Switch back to the thread stack and restore ra and s0 */
+	addi	sp, s0, -2*RISCV_SZPTR
+	REG_L	s0, (sp)
+	addi	sp, sp, RISCV_SZPTR
+	REG_L	ra, (sp)
+	addi	sp, sp, RISCV_SZPTR
+
+	ret
+SYM_FUNC_END(call_on_irq_stack)
+#endif /* CONFIG_IRQ_STACKS */
+
 /*
  * Integer register context switch
  * The callee-saved registers must be saved and restored.
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index d0577cc6a081..95dafdcbd135 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -61,32 +61,16 @@ static void init_irq_stacks(void)
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
index deb2144d9143..83319b6816da 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -350,31 +350,10 @@ static void noinstr handle_riscv_irq(struct pt_regs *regs)
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
2.41.0.694.ge786442a9b-goog

