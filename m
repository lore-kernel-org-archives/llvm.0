Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1461FC9
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 03:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0358C43140
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 03:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666150654;
	bh=EBF7VIq95F0DlBovf75OXNo51TgwpOaJQk8sFi+3rGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UGg9XV5EIZthWJmdnrWrxtPEA4SN8lCB3zDnH4dLN9nwDYjDWHlR440bIlui36/LY
	 DF8X7ZslF+D5wzuGoOooFhPss2UAYFMLqOdptKBWzHRk0tAC2kg6hmCCN8rtCM66Dp
	 R5CThAhrZxSRzjhX0YxFaXuWs1unVvDHtUFD7mhzpdfGXxsZiTlCP2fnA38eRcfHWf
	 cP+7RcvupWGiozxXtrAWavzX5ZlBed6krW4ZKPpiRTW9UXbR4eGito1gwGczZ1t3AU
	 TwTTB9XsBxAScv1+BPuljdsFkrMpgIEiXvjOiBud3Uud4HfgPItn7GzdUUhO8xQCjR
	 18z/2JZR5VFxA==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-134072c15c1so19237718fac.2
        for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 20:37:34 -0700 (PDT)
X-Gm-Message-State: ACrzQf3yR0Dfo7ZAkY6S+ZX+TVT3p0OAHAWNI0Xl+utCohVDffUtdgc0
	yHdcPoKMV7o8ItKbVsMOLrAxEdFCUiGhew4FL7w=
X-Google-Smtp-Source: AMsMyM6s66yoxrTHtul+Q7dLuF9JNyuwHLHxceRCvOIwSBtvoSv327hMUd/fYCGuUid+/N63e/gy/y1T88F8Ij1MX3w=
X-Received: by 2002:a05:6870:4413:b0:136:66cc:6af8 with SMTP id
 u19-20020a056870441300b0013666cc6af8mr20753144oah.112.1666150653930; Tue, 18
 Oct 2022 20:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220928162007.3791-1-jszhang@kernel.org> <20220928162007.3791-3-jszhang@kernel.org>
In-Reply-To: <20220928162007.3791-3-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 Oct 2022 11:37:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQNiv=HSZUcgOeLWmvoEgx6=YdGAruH56LOhUv-gG2HMQ@mail.gmail.com>
Message-ID: <CAJF2gTQNiv=HSZUcgOeLWmvoEgx6=YdGAruH56LOhUv-gG2HMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: consolidate ret_from_kernel_thread into ret_from_fork
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I would involve this patch in the generic entry series. It would help
remove the ret_from_kernel_thread part in the entry.S.

On Thu, Sep 29, 2022 at 12:29 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> The ret_from_kernel_thread() behaves similarly with ret_from_fork(),
> the only difference is whether call the fn(arg) or not, this can be
> acchieved by testing fn is NULL or not, I.E s0 is 0 or not.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/entry.S   | 11 +++--------
>  arch/riscv/kernel/process.c |  5 ++---
>  2 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 2207cf44a3bc..a3e1ed2fa2ac 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -323,20 +323,15 @@ END(handle_kernel_stack_overflow)
>
>  ENTRY(ret_from_fork)
>         call schedule_tail
> -       move a0, sp /* pt_regs */
> -       la ra, ret_from_exception
> -       tail syscall_exit_to_user_mode
> -ENDPROC(ret_from_fork)
> -
> -ENTRY(ret_from_kernel_thread)
> -       call schedule_tail
> +       beqz s0, 1f     /* not from kernel thread */
>         /* Call fn(arg) */
>         move a0, s1
>         jalr s0
> +1:
>         move a0, sp /* pt_regs */
>         la ra, ret_from_exception
>         tail syscall_exit_to_user_mode
> -ENDPROC(ret_from_kernel_thread)
> +ENDPROC(ret_from_fork)
>
>  #ifdef CONFIG_IRQ_STACKS
>  ENTRY(call_on_stack)
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index ceb9ebab6558..67e7cd123ceb 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -34,7 +34,6 @@ EXPORT_SYMBOL(__stack_chk_guard);
>  #endif
>
>  extern asmlinkage void ret_from_fork(void);
> -extern asmlinkage void ret_from_kernel_thread(void);
>
>  void arch_cpu_idle(void)
>  {
> @@ -172,7 +171,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>                 /* Supervisor/Machine, irqs on: */
>                 childregs->status = SR_PP | SR_PIE;
>
> -               p->thread.ra = (unsigned long)ret_from_kernel_thread;
>                 p->thread.s[0] = (unsigned long)args->fn;
>                 p->thread.s[1] = (unsigned long)args->fn_arg;
>         } else {
> @@ -182,8 +180,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>                 if (clone_flags & CLONE_SETTLS)
>                         childregs->tp = tls;
>                 childregs->a0 = 0; /* Return value of fork() */
> -               p->thread.ra = (unsigned long)ret_from_fork;
> +               p->thread.s[0] = 0;
>         }
> +       p->thread.ra = (unsigned long)ret_from_fork;
>         p->thread.sp = (unsigned long)childregs; /* kernel sp */
>         return 0;
>  }
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren
