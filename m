Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3195836D9FA
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388456; cv=pass; b=Io0/2mpekzYQwRAIsyDOuOmvxRWpQQRGJl/wGqQiae5pgSIQtsVVi7AXZ0UxiVCqB1vhzFohUBYcdUFapcSGDhH8xBaHSICztS9kNhR2lshhvVd1SPqe7fbvj6QBT5nU69QadGLiEwDvdIBhbMclVwYn/yoIoXPPKA/0jBi5qWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388456; c=relaxed/simple;
	bh=j1ef4kJ+WO8+K/PNRjAFXWRz4Mkoz/udGwUj8sJa1wU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiHBZ4yliIatGXwupfMVFjnOaWEqA0kPlJXNS37Z9T2gafwsUfn4xgcg22EnWUWuYWbqcg4+6Ff3iPqcOm8ySNjFx8HmvIxI+aWK1xnOYEknUa8pYNhZ+TgpGiJR7qT80Tiy6RonGcZdOjcuLbiQzkDzgImG8j7l/4AoLG1Tbro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o8KKiIJH; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o8KKiIJH"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso16207751fa.1
        for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 00:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773388451; cv=none;
        d=google.com; s=arc-20240605;
        b=DILvnyvzsE5g8WQQAXYShlDK16mA1BugN1rJmfmNXnJmMbKtd9aYfLdjtWwU1pLHgZ
         UoNKWCXx4KjxLPkIZBuCKeitwLsh4GJvw9KSPVtTLo/C0VJ7cy8sSpj6qvOmlVVOLDH6
         NJALxnSWwlTYiBSJvXeq+qmQ+mE1GtVEoeh9a9XxNCNQQBAkQhkrdvZy7ub3B8VoKhrw
         Bx+fTChbMNdEmKBhz3wDPUEf5HKkqyBOs8Un4bL8mVowx8ugqmPq+Tm+fVgBloIhdvMo
         eKdbBNj8BId0zQ2qsvX24ocU10Ar9XbJ9rpnUj20FMrl4NvP4Y1ijm/xb3Ja3lbkOnRl
         UqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Bj+FMDTJ2vgGbk/HLVPiBK5ntoHbLcepXuzXt4slZA=;
        fh=W2tDjzZtFjdk7UtC/qRZ5MyvxQ8sNw0Dz07rK4kGLBQ=;
        b=DT+hBKO/wn38MawALsuMDFjKxwFxQslaPQCi8YPqU9i/hRsBvBeqQ2VuQWKa+HFnvb
         zHuZE6bTSDNG0PhYK/U1HlEaRtm4j5NqtBgN79VzvBfUvxC4mB1HpOVNgzXw0yDK/YG9
         jifKZIwoJb67pZjNSSsziTEZT2eI9FJVi4Mk/G2gJoLA5ObFNId/KkYo8Ps+hDnO6WwY
         vvpG7ShMZcgcpTDMm0/fnx8vdZ73vOaLM4E33EOdUmnJKXxf/lkXeDq7A85fqFlgwUVH
         8QtXYCJZnk3BMSc4nIQccc7YaqrmlCcTEVcPHHu6+cHe5M9SmFSliXNzoApFQFwGAZdq
         CDNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773388451; x=1773993251; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Bj+FMDTJ2vgGbk/HLVPiBK5ntoHbLcepXuzXt4slZA=;
        b=o8KKiIJHhBXu7tsicDHFzqbljcRF/Ii18b7HOJyvyLkEHaSSetqmGpnebZ0PznoNtC
         LNC7f7RYor23x9IPV1VwcjlxtkFJQ5tOBY6QdoINEiO/fVeWcPG6sLhVBWuf0jnNW+KU
         493Py1CcxFNYBaEL+OUMPL4vBGvHMxiyeTnWx7c9hFKZwep2hKW/vxUzybbsa7oDOGb7
         csaA6+XLjQmqNwON/XjpuoJ398DFZTapK0/FTSWqkGLPuFsimDcD3CezBMzFozh+bPDb
         dMSdxcZeGNeyEAPw4B29qg5ZAnykWBm0V8cxA6DZ1qRFPsHqGDFNMZ3OenDx67Q5VVqh
         N43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388451; x=1773993251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Bj+FMDTJ2vgGbk/HLVPiBK5ntoHbLcepXuzXt4slZA=;
        b=AkVzmTe6ZaEbiTWgOGVtQolTy5/DRbiYfMq8+Dr2hcqFITlPefzqeIeer+k5cK8IQg
         fD/9UdU0+oBnnjacH4hyHBEoIMOOpMRs6eBbYMakKBgFv/LPaeYQQ0iV9iyimMnEEfgZ
         O9tEoXi1i4pH2gVbVBkUmF2BDaLn6ms3Emc0nb1rp397BvXHEKN7PKNE8eBgIvd57KTU
         l5mH0IWBALRBXdQ3Z96AaqyRvGJfjuAjprdzaCe+V/vUjaqWorc/3g1pVoLrGlT2meG7
         WALSEhV6nDQpc4Zzb9ryHr7gd/U+3/0r7Enak7VSC+UJawI/rJjh9vP2B7TA+krQt/Yr
         O21Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1IxZtMwq0sZcK/CcGBby4VuNyzdhqPtm3Exiu5x9qh/mzFN9tNZPfd2LA5pCJDZougSJ8@lists.linux.dev
X-Gm-Message-State: AOJu0YzCliCG+3brYDtE6IyGyigHdN+15F3E4y7KB1byNEVkDvOR1Wy5
	fmnKXk+fOUThIAjN5WD4EG/msTp9932y5kwOM6ScJox9xHSeBtCtG4qU6mxqyndCXKP8Vfpz8Ic
	LCQBVl0MY6QHLZVpq4jpRQ1HswaH6Ta73pQn2QpTR
X-Gm-Gg: ATEYQzx6+67klO483Cxud0WsxkaTa8IETTDeaYuYVSlTCTqnPXTdfhfmz3C5xqGWJFM
	aP+DPkEcpOrwQ5Lflm22k+5u+rVMfuEq6VvbqeAJGa6ThjjQH64cn9gsExs4PsLFNDkNNCYwHps
	NEfulaNz8ZgMwAL1856L7JoZSsqHyPpHsa5IKw4DPuDYRR0f2a/43wn/roUmCsqz7woZ1zG8z4j
	7XoOVQjqNJXpGBcixAZP5ZeGdqVVhogwv/NYQKxb6UW3Hc+Y9fF8/CEYyGGZJdWQXlkkZ1q1/eu
	t/4OkwC1o5I8L6ESrFcHwOYutHBveWwnTtlAMbuEPB7Tl3QLL5vYgZw9uUuR+z1AOg4lH2qhUVn
	cFbtY
X-Received: by 2002:a2e:9f12:0:b0:389:e2e8:4f4c with SMTP id
 38308e7fff4ca-38a728aa0cbmr16705021fa.21.1773388450755; Fri, 13 Mar 2026
 00:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com> <20260311-kcov-extrecord-v1-2-68f03c4a05ad@google.com>
In-Reply-To: <20260311-kcov-extrecord-v1-2-68f03c4a05ad@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 13 Mar 2026 08:53:59 +0100
X-Gm-Features: AaiRm539V1eMRmIPPN47qW2qO7ovV9s2gPkBXtowMNsfxK87T7KGuW0w_5Nue8c
Message-ID: <CACT4Y+aLx-ZG7FqYNrhrABi1bgNo6AnG5JL9tq+mCPRAnx37Tg@mail.gmail.com>
Subject: Re: [PATCH 2/3] kcov: wire up compiler instrumentation for CONFIG_KCOV_EXT_RECORDS
To: Jann Horn <jannh@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 at 22:06, Jann Horn <jannh@google.com> wrote:
>
> This is the first half of CONFIG_KCOV_EXT_RECORDS.
>
> Set the appropriate compiler flags to call separate hooks for function
> entry/exit, and provide these hooks, but don't make it visible in the KCOV
> UAPI yet.
>
> With -fsanitize-coverage=trace-pc-entry-exit, the compiler behavior changes
> as follows:
>
> - The __sanitizer_cov_trace_pc() call on function entry is replaced with a
>   call to __sanitizer_cov_trace_pc_entry(); so for now,
>   __sanitizer_cov_trace_pc_entry() must be treated the same way as
>   __sanitizer_cov_trace_pc().
>  - On function exit, an extra call to __sanitizer_cov_trace_pc_exit()
>    happens; since function exit produced no coverage in the old UAPI,
>    __sanitizer_cov_trace_pc_exit() should do nothing for now.
>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  include/linux/kcov.h  |  2 ++
>  kernel/kcov.c         | 30 +++++++++++++++++++++++-------
>  lib/Kconfig.debug     | 14 ++++++++++++++
>  scripts/Makefile.kcov |  2 ++
>  tools/objtool/check.c |  2 ++
>  5 files changed, 43 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> index 0143358874b0..e5502d674029 100644
> --- a/include/linux/kcov.h
> +++ b/include/linux/kcov.h
> @@ -81,6 +81,8 @@ typedef unsigned long long kcov_u64;
>  #endif
>
>  void __sanitizer_cov_trace_pc(void);
> +void __sanitizer_cov_trace_pc_entry(void);
> +void __sanitizer_cov_trace_pc_exit(void);
>  void __sanitizer_cov_trace_cmp1(u8 arg1, u8 arg2);
>  void __sanitizer_cov_trace_cmp2(u16 arg1, u16 arg2);
>  void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 0b369e88c7c9..2cc48b65384b 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -202,15 +202,10 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
>         return ip;
>  }
>
> -/*
> - * Entry point from instrumented code.
> - * This is called once per basic-block/edge.
> - */
> -void notrace __sanitizer_cov_trace_pc(void)
> +static void notrace kcov_add_pc_record(unsigned long record)
>  {
>         struct task_struct *t;
>         unsigned long *area;
> -       unsigned long ip = canonicalize_ip(_RET_IP_);
>         unsigned long pos;
>
>         t = current;
> @@ -230,11 +225,32 @@ void notrace __sanitizer_cov_trace_pc(void)
>                  */
>                 WRITE_ONCE(area[0], pos);
>                 barrier();
> -               area[pos] = ip;
> +               area[pos] = record;
>         }
>  }
> +
> +/*
> + * Entry point from instrumented code.
> + * This is called once per basic-block/edge.
> + */
> +void notrace __sanitizer_cov_trace_pc(void)
> +{
> +       kcov_add_pc_record(canonicalize_ip(_RET_IP_));
> +}
>  EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
>
> +#ifdef CONFIG_KCOV_EXT_RECORDS
> +void notrace __sanitizer_cov_trace_pc_entry(void)
> +{
> +       unsigned long record = canonicalize_ip(_RET_IP_);
> +
> +       kcov_add_pc_record(record);
> +}
> +void notrace __sanitizer_cov_trace_pc_exit(void)
> +{
> +}
> +#endif
> +
>  #ifdef CONFIG_KCOV_ENABLE_COMPARISONS
>  static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
>  {
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 93f356d2b3d9..dddc330ad3ca 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2215,6 +2215,20 @@ config KCOV
>
>           For more details, see Documentation/dev-tools/kcov.rst.
>
> +config KCOV_EXT_RECORDS
> +       bool "Support extended KCOV records with function entry/exit records"
> +       depends on KCOV
> +       depends on 64BIT
> +       # TODO: check CLANG_VERSION instead once this has landed in an LLVM
> +       # release

I think the compiler option check is actually better, since it will
allow us to test earlier and supports compiler backports.
But it may be good to add a reference to the compiler patch in the
commit description.

Otherwise:

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> +       depends on $(cc-option,-fsanitize-coverage=trace-pc-entry-exit)
> +       help
> +         Extended KCOV records allow distinguishing between multiple types of
> +         records: Normal edge coverage, function entry, and function exit.
> +
> +         This will likely cause a small additional slowdown compared to normal
> +         KCOV.
> +
>  config KCOV_ENABLE_COMPARISONS
>         bool "Enable comparison operands collection by KCOV"
>         depends on KCOV
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 78305a84ba9d..aa0be904268f 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -1,10 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  kcov-flags-y                                   += -fsanitize-coverage=trace-pc
> +kcov-flags-$(CONFIG_KCOV_EXT_RECORDS)          += -fsanitize-coverage=trace-pc-entry-exit
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   += -fsanitize-coverage=trace-cmp
>
>  kcov-rflags-y                                  += -Cpasses=sancov-module
>  kcov-rflags-y                                  += -Cllvm-args=-sanitizer-coverage-level=3
>  kcov-rflags-y                                  += -Cllvm-args=-sanitizer-coverage-trace-pc
> +kcov-rflags-$(CONFIG_KCOV_EXT_RECORDS)         += -Cllvm-args=-sanitizer-coverage-trace-pc-entry-exit
>  kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  += -Cllvm-args=-sanitizer-coverage-trace-compares
>
>  export CFLAGS_KCOV := $(kcov-flags-y)
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index a30379e4ff97..ae3127227621 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -1251,6 +1251,8 @@ static const char *uaccess_safe_builtin[] = {
>         "write_comp_data",
>         "check_kcov_mode",
>         "__sanitizer_cov_trace_pc",
> +       "__sanitizer_cov_trace_pc_entry",
> +       "__sanitizer_cov_trace_pc_exit",
>         "__sanitizer_cov_trace_const_cmp1",
>         "__sanitizer_cov_trace_const_cmp2",
>         "__sanitizer_cov_trace_const_cmp4",
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
