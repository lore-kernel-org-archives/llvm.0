Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A246A8
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 16:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BDEC43141;
	Wed, 28 Sep 2022 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664382580;
	bh=ddcSdAqJtV7YjhFUF+/+mxLRCnz8byHozG9Vd7pQWN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L0yMrfgpP/2Wki358yrQPk1PxJHQLaBxbk+n47BfB27WnVmsqgC3/CaeoNc+bLY+1
	 ZdfkPb6x80BIld7W2UThJT6FSnlg/loBoZt7bXM68ftsUzhGNHJWdnCOdXE1R5F9Ao
	 zmhIP1O78RhuJ2UxlUV3J/viOaeh/sOkVyZ/XEQwt/4tqO9F0oCLttRrvGiAYpk/Ji
	 iLRllCWwUZX/hmm7k2ig29XvO9RPwSv2OJ4MzpddQcI77zkSZbqlrxbQud/sNfZr/h
	 0v1WYIBbLG0+CJ3TKV2bS6wqbtkHb8i3nJXYhwxCUG2levbRMH0TIBCO+sr9/ObtYS
	 go3GpoUmDwFnQ==
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
Subject: [PATCH v2 2/4] riscv: consolidate ret_from_kernel_thread into ret_from_fork
Date: Thu, 29 Sep 2022 00:20:05 +0800
Message-Id: <20220928162007.3791-3-jszhang@kernel.org>
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

The ret_from_kernel_thread() behaves similarly with ret_from_fork(),
the only difference is whether call the fn(arg) or not, this can be
acchieved by testing fn is NULL or not, I.E s0 is 0 or not.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/entry.S   | 11 +++--------
 arch/riscv/kernel/process.c |  5 ++---
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 2207cf44a3bc..a3e1ed2fa2ac 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -323,20 +323,15 @@ END(handle_kernel_stack_overflow)
 
 ENTRY(ret_from_fork)
 	call schedule_tail
-	move a0, sp /* pt_regs */
-	la ra, ret_from_exception
-	tail syscall_exit_to_user_mode
-ENDPROC(ret_from_fork)
-
-ENTRY(ret_from_kernel_thread)
-	call schedule_tail
+	beqz s0, 1f	/* not from kernel thread */
 	/* Call fn(arg) */
 	move a0, s1
 	jalr s0
+1:
 	move a0, sp /* pt_regs */
 	la ra, ret_from_exception
 	tail syscall_exit_to_user_mode
-ENDPROC(ret_from_kernel_thread)
+ENDPROC(ret_from_fork)
 
 #ifdef CONFIG_IRQ_STACKS
 ENTRY(call_on_stack)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ceb9ebab6558..67e7cd123ceb 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -34,7 +34,6 @@ EXPORT_SYMBOL(__stack_chk_guard);
 #endif
 
 extern asmlinkage void ret_from_fork(void);
-extern asmlinkage void ret_from_kernel_thread(void);
 
 void arch_cpu_idle(void)
 {
@@ -172,7 +171,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		/* Supervisor/Machine, irqs on: */
 		childregs->status = SR_PP | SR_PIE;
 
-		p->thread.ra = (unsigned long)ret_from_kernel_thread;
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 	} else {
@@ -182,8 +180,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		if (clone_flags & CLONE_SETTLS)
 			childregs->tp = tls;
 		childregs->a0 = 0; /* Return value of fork() */
-		p->thread.ra = (unsigned long)ret_from_fork;
+		p->thread.s[0] = 0;
 	}
+	p->thread.ra = (unsigned long)ret_from_fork;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
-- 
2.34.1

