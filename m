Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D0EA2
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 03:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEC8C433D6
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 03:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664423953;
	bh=XOD2tRg3K+Mi1S8FGjXss48nG6ZOBDiplumgb8d5atI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vQL/1FfWBEQBWWjd6iue8tl1RqG5V6gjV+VdRwdBJgqHDinR36dkBW+7sVDgfrOHm
	 yt0582JgT2RpaXJzZgGlu67LiM8JWiK9v2Mbgu24aSsmsPI0q7JrMaoZm4Fm0HIN3S
	 IVANIK3WPtcuZw1+ztVK1EeA1q+bJF+Y94U8e+nt57rslWH6JhdMaSdgc50W45WToB
	 wjwcih7/OnVRf18sIp1Mp4FYtATbaw8ev1wdaSsMz3u0wU9kAjGh/wIrM4ti/oCqDu
	 lk5b/1aA0H6tvJamSFNai59k0fd9HixV7Z+BE2KI0bjToBkizo81HfOCvbZ+dpSxFb
	 SiZ+aweC4wd0w==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1280590722dso464104fac.1
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 20:59:13 -0700 (PDT)
X-Gm-Message-State: ACrzQf3c+sCkiJ60ZVHoAvwwAReth1XYy1BSpD8Z0WGJDc5bFHz512li
	Zom8QFQpCd9ZK0rCnjjDuqIz+7zSUTjoLrm6EJg=
X-Google-Smtp-Source: AMsMyM7FE/g6U6bfnW4OnoVKQxP4lrWveOlhh3IhnehLt0qZPyatLHOEhEtYnl/UbBvNB23SjsokJzZJgx4XUazQV00=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr7072889oap.19.1664423952849; Wed, 28 Sep
 2022 20:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220928162007.3791-1-jszhang@kernel.org> <20220928162007.3791-5-jszhang@kernel.org>
In-Reply-To: <20220928162007.3791-5-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 29 Sep 2022 11:59:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com>
Message-ID: <CAJF2gTTADq-JpUtitSr0nw1aDPZrsB6f1jA-04WmOVcrxYeakw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] riscv: entry: consolidate general regs saving into save_gp
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 12:29 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Consolidate the saving/restoring GPs(except ra, sp and tp) into
> save_gp/restore_gp macro.
>
> No functional change intended.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/asm.h   | 65 +++++++++++++++++++++++++
>  arch/riscv/kernel/entry.S      | 87 ++--------------------------------
>  arch/riscv/kernel/mcount-dyn.S | 58 +----------------------
>  3 files changed, 70 insertions(+), 140 deletions(-)
>
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 1b471ff73178..2f3b49536e9d 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -68,6 +68,7 @@
>  #endif
>
>  #ifdef __ASSEMBLY__
> +#include <asm/asm-offsets.h>
>
>  /* Common assembly source macros */
>
> @@ -80,6 +81,70 @@
>         .endr
>  .endm
>
> +       /* save all GPs except ra, sp and tp */
> +       .macro save_gp
How about leave x3(gp) out of the macro, and define:
.marco save_from_x5_to_x31
.marco restore_from_x5_to_x31

> +       REG_S x3,  PT_GP(sp)
> +       REG_S x5,  PT_T0(sp)
> +       REG_S x6,  PT_T1(sp)
> +       REG_S x7,  PT_T2(sp)
> +       REG_S x8,  PT_S0(sp)
> +       REG_S x9,  PT_S1(sp)
> +       REG_S x10, PT_A0(sp)
> +       REG_S x11, PT_A1(sp)
> +       REG_S x12, PT_A2(sp)
> +       REG_S x13, PT_A3(sp)
> +       REG_S x14, PT_A4(sp)
> +       REG_S x15, PT_A5(sp)
> +       REG_S x16, PT_A6(sp)
> +       REG_S x17, PT_A7(sp)
> +       REG_S x18, PT_S2(sp)
> +       REG_S x19, PT_S3(sp)
> +       REG_S x20, PT_S4(sp)
> +       REG_S x21, PT_S5(sp)
> +       REG_S x22, PT_S6(sp)
> +       REG_S x23, PT_S7(sp)
> +       REG_S x24, PT_S8(sp)
> +       REG_S x25, PT_S9(sp)
> +       REG_S x26, PT_S10(sp)
> +       REG_S x27, PT_S11(sp)
> +       REG_S x28, PT_T3(sp)
> +       REG_S x29, PT_T4(sp)
> +       REG_S x30, PT_T5(sp)
> +       REG_S x31, PT_T6(sp)
> +       .endm
> +
> +       /* restore all GPs except ra, sp and tp */
> +       .macro restore_gp
> +       REG_L x3,  PT_GP(sp)
> +       REG_L x5,  PT_T0(sp)
> +       REG_L x6,  PT_T1(sp)
> +       REG_L x7,  PT_T2(sp)
> +       REG_L x8,  PT_S0(sp)
> +       REG_L x9,  PT_S1(sp)
> +       REG_L x10, PT_A0(sp)
> +       REG_L x11, PT_A1(sp)
> +       REG_L x12, PT_A2(sp)
> +       REG_L x13, PT_A3(sp)
> +       REG_L x14, PT_A4(sp)
> +       REG_L x15, PT_A5(sp)
> +       REG_L x16, PT_A6(sp)
> +       REG_L x17, PT_A7(sp)
> +       REG_L x18, PT_S2(sp)
> +       REG_L x19, PT_S3(sp)
> +       REG_L x20, PT_S4(sp)
> +       REG_L x21, PT_S5(sp)
> +       REG_L x22, PT_S6(sp)
> +       REG_L x23, PT_S7(sp)
> +       REG_L x24, PT_S8(sp)
> +       REG_L x25, PT_S9(sp)
> +       REG_L x26, PT_S10(sp)
> +       REG_L x27, PT_S11(sp)
> +       REG_L x28, PT_T3(sp)
> +       REG_L x29, PT_T4(sp)
> +       REG_L x30, PT_T5(sp)
> +       REG_L x31, PT_T6(sp)
> +       .endm
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* _ASM_RISCV_ASM_H */
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 5a6171a90d81..a90f17ed2822 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -40,34 +40,7 @@ _save_context:
>         REG_L sp, TASK_TI_KERNEL_SP(tp)
>         addi sp, sp, -(PT_SIZE_ON_STACK)
>         REG_S x1,  PT_RA(sp)
> -       REG_S x3,  PT_GP(sp)
> -       REG_S x5,  PT_T0(sp)
> -       REG_S x6,  PT_T1(sp)
> -       REG_S x7,  PT_T2(sp)
> -       REG_S x8,  PT_S0(sp)
> -       REG_S x9,  PT_S1(sp)
> -       REG_S x10, PT_A0(sp)
> -       REG_S x11, PT_A1(sp)
> -       REG_S x12, PT_A2(sp)
> -       REG_S x13, PT_A3(sp)
> -       REG_S x14, PT_A4(sp)
> -       REG_S x15, PT_A5(sp)
> -       REG_S x16, PT_A6(sp)
> -       REG_S x17, PT_A7(sp)
> -       REG_S x18, PT_S2(sp)
> -       REG_S x19, PT_S3(sp)
> -       REG_S x20, PT_S4(sp)
> -       REG_S x21, PT_S5(sp)
> -       REG_S x22, PT_S6(sp)
> -       REG_S x23, PT_S7(sp)
> -       REG_S x24, PT_S8(sp)
> -       REG_S x25, PT_S9(sp)
> -       REG_S x26, PT_S10(sp)
> -       REG_S x27, PT_S11(sp)
> -       REG_S x28, PT_T3(sp)
> -       REG_S x29, PT_T4(sp)
> -       REG_S x30, PT_T5(sp)
> -       REG_S x31, PT_T6(sp)
> +       save_gp
>
>         /*
>          * Disable user-mode memory access as it should only be set in the
> @@ -182,35 +155,8 @@ ENTRY(ret_from_exception)
>         csrw CSR_STATUS, a0
>
>         REG_L x1,  PT_RA(sp)
> -       REG_L x3,  PT_GP(sp)
>         REG_L x4,  PT_TP(sp)
> -       REG_L x5,  PT_T0(sp)
> -       REG_L x6,  PT_T1(sp)
> -       REG_L x7,  PT_T2(sp)
> -       REG_L x8,  PT_S0(sp)
> -       REG_L x9,  PT_S1(sp)
> -       REG_L x10, PT_A0(sp)
> -       REG_L x11, PT_A1(sp)
> -       REG_L x12, PT_A2(sp)
> -       REG_L x13, PT_A3(sp)
> -       REG_L x14, PT_A4(sp)
> -       REG_L x15, PT_A5(sp)
> -       REG_L x16, PT_A6(sp)
> -       REG_L x17, PT_A7(sp)
> -       REG_L x18, PT_S2(sp)
> -       REG_L x19, PT_S3(sp)
> -       REG_L x20, PT_S4(sp)
> -       REG_L x21, PT_S5(sp)
> -       REG_L x22, PT_S6(sp)
> -       REG_L x23, PT_S7(sp)
> -       REG_L x24, PT_S8(sp)
> -       REG_L x25, PT_S9(sp)
> -       REG_L x26, PT_S10(sp)
> -       REG_L x27, PT_S11(sp)
> -       REG_L x28, PT_T3(sp)
> -       REG_L x29, PT_T4(sp)
> -       REG_L x30, PT_T5(sp)
> -       REG_L x31, PT_T6(sp)
> +       restore_gp
>
>         REG_L x2,  PT_SP(sp)
>
> @@ -237,34 +183,7 @@ ENTRY(handle_kernel_stack_overflow)
>
>         //save context to overflow stack
>         REG_S x1,  PT_RA(sp)
> -       REG_S x3,  PT_GP(sp)
> -       REG_S x5,  PT_T0(sp)
> -       REG_S x6,  PT_T1(sp)
> -       REG_S x7,  PT_T2(sp)
> -       REG_S x8,  PT_S0(sp)
> -       REG_S x9,  PT_S1(sp)
> -       REG_S x10, PT_A0(sp)
> -       REG_S x11, PT_A1(sp)
> -       REG_S x12, PT_A2(sp)
> -       REG_S x13, PT_A3(sp)
> -       REG_S x14, PT_A4(sp)
> -       REG_S x15, PT_A5(sp)
> -       REG_S x16, PT_A6(sp)
> -       REG_S x17, PT_A7(sp)
> -       REG_S x18, PT_S2(sp)
> -       REG_S x19, PT_S3(sp)
> -       REG_S x20, PT_S4(sp)
> -       REG_S x21, PT_S5(sp)
> -       REG_S x22, PT_S6(sp)
> -       REG_S x23, PT_S7(sp)
> -       REG_S x24, PT_S8(sp)
> -       REG_S x25, PT_S9(sp)
> -       REG_S x26, PT_S10(sp)
> -       REG_S x27, PT_S11(sp)
> -       REG_S x28, PT_T3(sp)
> -       REG_S x29, PT_T4(sp)
> -       REG_S x30, PT_T5(sp)
> -       REG_S x31, PT_T6(sp)
> +       save_gp
>
>         REG_L s0, TASK_TI_KERNEL_SP(tp)
>         csrr s1, CSR_STATUS
> diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
> index d171eca623b6..1b4b0aecf4f5 100644
> --- a/arch/riscv/kernel/mcount-dyn.S
> +++ b/arch/riscv/kernel/mcount-dyn.S
> @@ -68,35 +68,8 @@
>         REG_L x1,  PT_EPC(sp)
>
>         REG_S x2,  PT_SP(sp)
> -       REG_S x3,  PT_GP(sp)
>         REG_S x4,  PT_TP(sp)
> -       REG_S x5,  PT_T0(sp)
> -       REG_S x6,  PT_T1(sp)
> -       REG_S x7,  PT_T2(sp)
> -       REG_S x8,  PT_S0(sp)
> -       REG_S x9,  PT_S1(sp)
> -       REG_S x10, PT_A0(sp)
> -       REG_S x11, PT_A1(sp)
> -       REG_S x12, PT_A2(sp)
> -       REG_S x13, PT_A3(sp)
> -       REG_S x14, PT_A4(sp)
> -       REG_S x15, PT_A5(sp)
> -       REG_S x16, PT_A6(sp)
> -       REG_S x17, PT_A7(sp)
> -       REG_S x18, PT_S2(sp)
> -       REG_S x19, PT_S3(sp)
> -       REG_S x20, PT_S4(sp)
> -       REG_S x21, PT_S5(sp)
> -       REG_S x22, PT_S6(sp)
> -       REG_S x23, PT_S7(sp)
> -       REG_S x24, PT_S8(sp)
> -       REG_S x25, PT_S9(sp)
> -       REG_S x26, PT_S10(sp)
> -       REG_S x27, PT_S11(sp)
> -       REG_S x28, PT_T3(sp)
> -       REG_S x29, PT_T4(sp)
> -       REG_S x30, PT_T5(sp)
> -       REG_S x31, PT_T6(sp)
> +       save_gp
>         .endm
>
>         .macro RESTORE_ALL
> @@ -106,35 +79,8 @@
>         addi    sp, sp, -PT_SIZE_ON_STACK
>         REG_L x1,  PT_EPC(sp)
>         REG_L x2,  PT_SP(sp)
> -       REG_L x3,  PT_GP(sp)
>         REG_L x4,  PT_TP(sp)
> -       REG_L x5,  PT_T0(sp)
> -       REG_L x6,  PT_T1(sp)
> -       REG_L x7,  PT_T2(sp)
> -       REG_L x8,  PT_S0(sp)
> -       REG_L x9,  PT_S1(sp)
> -       REG_L x10, PT_A0(sp)
> -       REG_L x11, PT_A1(sp)
> -       REG_L x12, PT_A2(sp)
> -       REG_L x13, PT_A3(sp)
> -       REG_L x14, PT_A4(sp)
> -       REG_L x15, PT_A5(sp)
> -       REG_L x16, PT_A6(sp)
> -       REG_L x17, PT_A7(sp)
> -       REG_L x18, PT_S2(sp)
> -       REG_L x19, PT_S3(sp)
> -       REG_L x20, PT_S4(sp)
> -       REG_L x21, PT_S5(sp)
> -       REG_L x22, PT_S6(sp)
> -       REG_L x23, PT_S7(sp)
> -       REG_L x24, PT_S8(sp)
> -       REG_L x25, PT_S9(sp)
> -       REG_L x26, PT_S10(sp)
> -       REG_L x27, PT_S11(sp)
> -       REG_L x28, PT_T3(sp)
> -       REG_L x29, PT_T4(sp)
> -       REG_L x30, PT_T5(sp)
> -       REG_L x31, PT_T6(sp)
> +       restore_gp
>
>         addi    sp, sp, PT_SIZE_ON_STACK
>         addi    sp, sp, SZREG
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren
