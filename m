Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C9A1C04
	for <llvm@lists.linux.dev>; Wed, 23 Nov 2022 17:02:53 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id k7so17180649pll.6
        for <llvm@lists.linux.dev>; Wed, 23 Nov 2022 09:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtW9VVC8Ry6rEP8bZmq8bnNRziAwFnWeXTCQ6xclNuc=;
        b=vs/bCMbK9G+RjRRs+gCpuLqVMrRBwRhZdKbPRvMZmjaSBjiPfozEYv5YjRFiIFJJKb
         9YB9inrWj1a2+QvkL4aCrKoh5lFxtDBZmH9YyKCkbFXRTjBXuDn6KcjLJjrOc2d3PsyF
         xb5qdisDgO/g++1jC+AcCdUfXOi09YAcYZKFJmx9ApyjBBTMMS/wulTrDHBh2iLKOVdh
         CVMwD9tkyJLbJvCSfpCUgO3inTMVJEWFYEnltWUEk27HT4AsIIJA0L03VE+SVfAQWG8w
         RM4VPLkx/g//7y2N/hV5flQrIAvBOhRaSAHNHLrjGzjqTIVsAeokY72x4iU7afA2tGqI
         bjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtW9VVC8Ry6rEP8bZmq8bnNRziAwFnWeXTCQ6xclNuc=;
        b=vJzzUe+mb4rmwEufHiGySbWpb0L5db/Fk8waWJBJ1ONvK7affdCjERW9KQgzSsCeHn
         w6OnpwlH4TVfIqtw7uLyu0+PLdL00p2vTmVZJJQtqALOzW/cghSh422FlacuuvDP7mH/
         8yNO5GH1CueAFDMl2looCZjcFqk05rdR898nEhv/YQgOIjXfM65j1YrS7VxEM6tnI4iy
         IBqOOza8otSsZYAXQao4Ued/N6ajWFxhKzyWMNvO9DJ2Q0PrxKuXUn7w27fWnQsUSdO5
         qxb2swn1zJj2LoKNXUzDIIOxNhVuA3p/VHJmLP8rEKfl9Q3Vczk6kOizAPpCVJsUfAo9
         JfNA==
X-Gm-Message-State: ANoB5pmmEES6pBkpFNXvM7FlbkdQaNd5aibsTRG2Vq5ZD9HhQanLPB08
	HqE+euDw+l12qFZb0580MJmrTg==
X-Google-Smtp-Source: AA0mqf7QBn41JsKc0E74UeARJdwT69yD+Nf84EGNKTDQvFbVw6ZlvvxfQEoJBYIA042rqG+qq7FXdA==
X-Received: by 2002:a17:90a:d581:b0:212:b43b:ffe5 with SMTP id v1-20020a17090ad58100b00212b43bffe5mr31841949pju.32.1669222972487;
        Wed, 23 Nov 2022 09:02:52 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id j5-20020a170903024500b0017849a2b56asm14740970plh.46.2022.11.23.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 09:02:51 -0800 (PST)
Date: Wed, 23 Nov 2022 09:02:50 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 3/4] riscv: fix race when vmap stack overflow and remove
 shadow_stack
Message-ID: <20221123170250.GA2855837@debug.ba.rivosinc.com>
References: <20220925175356.681-1-jszhang@kernel.org>
 <20220925175356.681-4-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220925175356.681-4-jszhang@kernel.org>

On Mon, Sep 26, 2022 at 01:53:55AM +0800, Jisheng Zhang wrote:
>Currently, when detecting vmap stack overflow, riscv firstly switches
>to the so called shadow stack, then use this shadow stack to call the
>get_overflow_stack() to get the overflow stack. However, there's
>a race here if two or more harts use the same shadow stack at the same
>time.
>
>To solve this race, we rely on two facts:
>1. the kernel thread pointer I.E "tp" register can still be gotten from
>the CSR_SCRATCH register, thus we can clobber tp under the condition
>that we restore tp from CSR_SCRATCH later.
>
>2. Once vmap stack overflow happen, panic is coming soon, no
>performance concern at all, so we don't need to define the overflow
>stack as percpu var, we can simplify it into an array.
>
>Thus we can use tp as a tmp register to get the cpu id to calculate
>the offset of overflow stack for each cpu w/o shadow stack any more.
>Thus the race condition is removed as side effect.
>
>NOTE: we can use similar mechanism to let each cpu use different shadow
>stack to fix the race codition, but if we can remove shadow stack usage
>totally, why not.

I've a different patch to solve the same problem.
Using an asm macro which allows obtaining per cpu symbols.
Thus we can switch to overflow_stack directly from entry.S
Patch coming soon.

>
>Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
>---
> arch/riscv/include/asm/asm-prototypes.h |  1 -
> arch/riscv/include/asm/thread_info.h    |  4 +-
> arch/riscv/kernel/asm-offsets.c         |  1 +
> arch/riscv/kernel/entry.S               | 54 ++++---------------------
> arch/riscv/kernel/traps.c               | 15 +------
> 5 files changed, 11 insertions(+), 64 deletions(-)
>
>diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
>index ef386fcf3939..4a06fa0f6493 100644
>--- a/arch/riscv/include/asm/asm-prototypes.h
>+++ b/arch/riscv/include/asm/asm-prototypes.h
>@@ -25,7 +25,6 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
> DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
> DECLARE_DO_ERROR_INFO(do_trap_break);
>
>-asmlinkage unsigned long get_overflow_stack(void);
> asmlinkage void handle_bad_stack(struct pt_regs *regs);
>
> #endif /* _ASM_RISCV_PROTOTYPES_H */
>diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>index c970d41dc4c6..c604a5212a73 100644
>--- a/arch/riscv/include/asm/thread_info.h
>+++ b/arch/riscv/include/asm/thread_info.h
>@@ -28,14 +28,12 @@
>
> #define THREAD_SHIFT            (PAGE_SHIFT + THREAD_SIZE_ORDER)
> #define OVERFLOW_STACK_SIZE     SZ_4K
>-#define SHADOW_OVERFLOW_STACK_SIZE (1024)
>+#define OVERFLOW_STACK_SHIFT	12
>
> #define IRQ_STACK_SIZE		THREAD_SIZE
>
> #ifndef __ASSEMBLY__
>
>-extern long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE / sizeof(long)];
>-
> #include <asm/processor.h>
> #include <asm/csr.h>
>
>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>index df9444397908..62bf3bacc322 100644
>--- a/arch/riscv/kernel/asm-offsets.c
>+++ b/arch/riscv/kernel/asm-offsets.c
>@@ -37,6 +37,7 @@ void asm_offsets(void)
> 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
> 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
>+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>
> 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
> 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
>diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>index a3e1ed2fa2ac..442d93beffcf 100644
>--- a/arch/riscv/kernel/entry.S
>+++ b/arch/riscv/kernel/entry.S
>@@ -223,54 +223,14 @@ END(ret_from_exception)
>
> #ifdef CONFIG_VMAP_STACK
> ENTRY(handle_kernel_stack_overflow)
>-	la sp, shadow_stack
>-	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
>-
>-	//save caller register to shadow stack
>-	addi sp, sp, -(PT_SIZE_ON_STACK)
>-	REG_S x1,  PT_RA(sp)
>-	REG_S x5,  PT_T0(sp)
>-	REG_S x6,  PT_T1(sp)
>-	REG_S x7,  PT_T2(sp)
>-	REG_S x10, PT_A0(sp)
>-	REG_S x11, PT_A1(sp)
>-	REG_S x12, PT_A2(sp)
>-	REG_S x13, PT_A3(sp)
>-	REG_S x14, PT_A4(sp)
>-	REG_S x15, PT_A5(sp)
>-	REG_S x16, PT_A6(sp)
>-	REG_S x17, PT_A7(sp)
>-	REG_S x28, PT_T3(sp)
>-	REG_S x29, PT_T4(sp)
>-	REG_S x30, PT_T5(sp)
>-	REG_S x31, PT_T6(sp)
>-
>-	la ra, restore_caller_reg
>-	tail get_overflow_stack
>-
>-restore_caller_reg:
>-	//save per-cpu overflow stack
>-	REG_S a0, -8(sp)
>-	//restore caller register from shadow_stack
>-	REG_L x1,  PT_RA(sp)
>-	REG_L x5,  PT_T0(sp)
>-	REG_L x6,  PT_T1(sp)
>-	REG_L x7,  PT_T2(sp)
>-	REG_L x10, PT_A0(sp)
>-	REG_L x11, PT_A1(sp)
>-	REG_L x12, PT_A2(sp)
>-	REG_L x13, PT_A3(sp)
>-	REG_L x14, PT_A4(sp)
>-	REG_L x15, PT_A5(sp)
>-	REG_L x16, PT_A6(sp)
>-	REG_L x17, PT_A7(sp)
>-	REG_L x28, PT_T3(sp)
>-	REG_L x29, PT_T4(sp)
>-	REG_L x30, PT_T5(sp)
>-	REG_L x31, PT_T6(sp)
>+	la sp, overflow_stack
>+	/* use tp as tmp register since we can restore it from CSR_SCRATCH */
>+	REG_L tp, TASK_TI_CPU(tp)
>+	addi tp, tp, 1
>+	slli tp, tp, OVERFLOW_STACK_SHIFT
>+	add sp, sp, tp
>+	csrr tp, CSR_SCRATCH
>
>-	//load per-cpu overflow stack
>-	REG_L sp, -8(sp)
> 	addi sp, sp, -(PT_SIZE_ON_STACK)
>
> 	//save context to overflow stack
>diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>index 73f06cd149d9..2a2a977c1eff 100644
>--- a/arch/riscv/kernel/traps.c
>+++ b/arch/riscv/kernel/traps.c
>@@ -216,23 +216,12 @@ int is_valid_bugaddr(unsigned long pc)
> #endif /* CONFIG_GENERIC_BUG */
>
> #ifdef CONFIG_VMAP_STACK
>-static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
>-		overflow_stack)__aligned(16);
>-/*
>- * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
>- * to get per-cpu overflow stack(get_overflow_stack).
>- */
>-long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
>-asmlinkage unsigned long get_overflow_stack(void)
>-{
>-	return (unsigned long)this_cpu_ptr(overflow_stack) +
>-		OVERFLOW_STACK_SIZE;
>-}
>+unsigned long overflow_stack[NR_CPUS][OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
>
> asmlinkage void handle_bad_stack(struct pt_regs *regs)
> {
> 	unsigned long tsk_stk = (unsigned long)current->stack;
>-	unsigned long ovf_stk = (unsigned long)this_cpu_ptr(overflow_stack);
>+	unsigned long ovf_stk = (unsigned long)overflow_stack[raw_smp_processor_id()];
>
> 	console_verbose();
>
>-- 
>2.34.1
>
