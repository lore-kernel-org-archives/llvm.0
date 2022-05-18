Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A8323A3
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 20:45:29 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id p4so4267912lfg.4
        for <llvm@lists.linux.dev>; Wed, 18 May 2022 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yZJJPAZDkDqR7UoeGKaC6qUbpF8wvLcJmxmRJ8kYOSU=;
        b=i+FtS1BM+D5y1Fijev4TprJqlINgopPryrnYc3eI6KH1HzKaxQQqr0voU6ZpMOGKv1
         HmhzABK4RSTo3+zqOytKGeu8fgmUxsk+DnBWCyp2jEJpRzn2OrEsvlH5ZwanpF1UVsCv
         7jpzINan8lrclloeNnX9ohq+oRKKFzXhjqbRqmLLBMrGZyU7PLFmaMfOFkSYwONUsZlE
         zadkzm2Vn+/5danHpEmCddVSLy6WFBPBcZsybyx6pk68M7WjscnNfqGopIHAXXkRKk41
         MQkaGVfEN1oCsCqAI9edLvMJ9OXhS0J6cnlSLWwzuHVJ7QoubRxmasZ/pwwfnfrNRUTV
         acZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yZJJPAZDkDqR7UoeGKaC6qUbpF8wvLcJmxmRJ8kYOSU=;
        b=RgEM+EyPIxS6S6ULnpK0gp9pDjbxxFJYEs1S/kA28uoy4/2/Q8M7adUbnUJGoY2Iy7
         n8r6CW6bnMe2vi4mBafBqzvbdELN4/NKS3pp/P/p3Nh9ZUsebW6V8CoaC2s1NLgL5kP5
         l+fCiJMnSdoAC4shJZJNMKC9GmIXHXkGGr9h2Fvco5PFABWBLBcCB6D8gzI1pS22VBac
         jCGuJZYRIliXnrvavzErLnHAWj1vbyhr3TxZtL3jyK09f0yfr3glCf4FZKBQJ8h/5Aah
         U4l/acBkaUCFCfG3TaPZ2ZU61UEuSMTXyKIap3tG3DK69qus6cgFIRuGu3fej6PEPkQf
         /ciQ==
X-Gm-Message-State: AOAM532O0R12JIvpOTwg76QxEh5gBEqxcXSIRbVdg6uKhybNNETLuRlQ
	qjS+QDksWULwSEj9ipMe1vvr8zDDLBoOI4zek5U+JA==
X-Google-Smtp-Source: ABdhPJzEuMLqq/YYkPJUgoDmG+EduOgOoFxh5PSOdtGXfVwKSqpQ0R2rlP/M7Z0qDdr7a4AlDOaaEEA/hCVff3/7Axk=
X-Received: by 2002:a05:6512:1105:b0:477:b97f:4971 with SMTP id
 l5-20020a056512110500b00477b97f4971mr883037lfg.87.1652906727396; Wed, 18 May
 2022 13:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220518184529.454008-1-nathan@kernel.org>
In-Reply-To: <20220518184529.454008-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 May 2022 13:45:15 -0700
Message-ID: <CAKwvOdk3HZkiZwtp1+xZULbm8BkOjdCQxPqsOHDJ5CboVy5ONw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix ALT_THEAD_PMA's asm parameters
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 18, 2022 at 11:45 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit a35707c3d850 ("riscv: add memory-type errata for T-Head"),
> builds with LLVM's integrated assembler fail like:
>
>   In file included from arch/riscv/kernel/asm-offsets.c:10:
>   In file included from ./include/linux/mm.h:29:
>   In file included from ./include/linux/pgtable.h:6:
>   In file included from ./arch/riscv/include/asm/pgtable.h:114:
>   ./arch/riscv/include/asm/pgtable-64.h:210:2: error: invalid input constraint '0' in asm
>           ALT_THEAD_PMA(prot_val);
>           ^
>   ./arch/riscv/include/asm/errata_list.h:88:4: note: expanded from macro 'ALT_THEAD_PMA'
>           : "0"(_val),                                                    \
>             ^
>
> This was reported upstream to LLVM where Jessica pointed out a couple of
> issues with the existing implementation of ALT_THEAD_PMA:
>
> * t3 is modified but not listed in the clobbers list.
>
> * "+r"(_val) marks _val as both an input and output of the asm but then
>   "0"(_val) marks _val as an input matching constraint, which does not
>   make much sense in this situation, as %1 is not actually used in the
>   asm and matching constraints are designed to be used for different
>   inputs that need to use the same register.
>
> Drop the matching contraint and shift all the operands by one, as %1 is

s/contraint/constraint/

Thanks for the fix!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> unused, and mark t3 as clobbered. This resolves the build error and goes
> not cause any problems with GNU as.
>
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1641
> Link: https://github.com/llvm/llvm-project/issues/55514
> Link: https://gcc.gnu.org/onlinedocs/gcc/Simple-Constraints.html
> Suggested-by: Jessica Clarke <jrtc27@jrtc27.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/include/asm/errata_list.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 9e2888dbb5b1..416ead0f9a65 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -75,20 +75,20 @@ asm volatile(ALTERNATIVE(                                           \
>         "nop\n\t"                                                       \
>         "nop\n\t"                                                       \
>         "nop",                                                          \
> -       "li      t3, %2\n\t"                                            \
> -       "slli    t3, t3, %4\n\t"                                        \
> +       "li      t3, %1\n\t"                                            \
> +       "slli    t3, t3, %3\n\t"                                        \
>         "and     t3, %0, t3\n\t"                                        \
>         "bne     t3, zero, 2f\n\t"                                      \
> -       "li      t3, %3\n\t"                                            \
> -       "slli    t3, t3, %4\n\t"                                        \
> +       "li      t3, %2\n\t"                                            \
> +       "slli    t3, t3, %3\n\t"                                        \
>         "or      %0, %0, t3\n\t"                                        \
>         "2:",  THEAD_VENDOR_ID,                                         \
>                 ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)            \
>         : "+r"(_val)                                                    \
> -       : "0"(_val),                                                    \
> -         "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),              \
> +       : "I"(_PAGE_MTMASK_THEAD >> ALT_THEAD_PBMT_SHIFT),              \
>           "I"(_PAGE_PMA_THEAD >> ALT_THEAD_PBMT_SHIFT),                 \
> -         "I"(ALT_THEAD_PBMT_SHIFT))
> +         "I"(ALT_THEAD_PBMT_SHIFT)                                     \
> +       : "t3")
>  #else
>  #define ALT_THEAD_PMA(_val)
>  #endif
>
> base-commit: 93c0651617a62a69717299f1464dda798af8bebb
> --
> 2.36.1
>


-- 
Thanks,
~Nick Desaulniers
