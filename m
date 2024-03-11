Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF93E46D
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710159320; cv=none; b=SG+3kySX1Oqs2eHiCtMFcTLnxUN97aJPuYWdPz5J4zNTySZmEfPGgHtDQU0Xdi2gXZbGlLroFuIQH8oGDXdTU+ZwvIISYjHAIvucPlxFmiLIQzs1sB5UbPtJoIeasNuEF4wFyd2Y7bxhK44kFRsIyDU+cdUG46CvRm7Izzo6TAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710159320; c=relaxed/simple;
	bh=SjkFqXSkz1hIkByBo/orIVFUFLL2Nj7YOlLsVLd7fEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EuHXy+z2z8QK1UmFpYgLJxt9m80NaXU1e9SUph341Bfz2NNeaHfVInN/O2Uz+yqwARnJ9S+7WOItzFKcIMd4pyZ7b+dMRkI/U3p2jUS7QAaRrMmWP0PMNi5oReSIygXHHhtCYtukgAMM76B2ZY1xHmppWYl1PuXzuARfVYqg/78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAX7qMDI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAX7qMDI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1A0C433C7
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710159319;
	bh=SjkFqXSkz1hIkByBo/orIVFUFLL2Nj7YOlLsVLd7fEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kAX7qMDImHIvW8NgMMTwjaRITtNfACgDPwDVRvk05NGX9vFeMr64IfeVmudsM7wrP
	 wBsVNPAt4Mku7+Ur1AcpQ9z14+Emq9cvsZoRdssWmPQJUd3LOlfVdywH2oqjm/Ln6O
	 YuICBg5+vrtOr10n04mdlwmvMczkhuuuRPXunCu7eDA0ujGDkBJUw7Ap0f+yBqFsyL
	 F7sWM6DUD0myv27E6KHftAiSpgNAtlitWOiCcE7j7Y+DUHqYXiSRO50mckPfNv5maw
	 UzNt3GC8hj3zxrFT29AVyJJP1MSrLwtmS+G5H+FAGKWZS9qjMw5alo3JpFRRl5JurP
	 +UHgDojBua6mA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d309a23d76so45599481fa.1
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 05:15:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoofakL875hslUiBK5UwnD1Vj9CvsyndJ68SdjUXdCLSTjmBzlZ799IRtz4ZagUR7Y58e4da3FeVbbpErQmeTq7j6D5w==
X-Gm-Message-State: AOJu0Yw3Ll3hAc/F8P+SYUFTqAtuQXlZMIEL3RHZCTWeFLdAQXRHQOMt
	WZ8IdnL14NrTem1J16ugZxYdTeMxKuFRps1Wony3hSXgMOgn5IrRWSlurkjyfXkC5JNyu9fF7By
	obHWwZmNxHJv+s+HXTJQsQgYNhWg=
X-Google-Smtp-Source: AGHT+IGGf56D55iPeuYivYlAM9NObenLrBxlXlWajOB5LDHy6ubd2yi9jW5ivzOYkzeq51voo2OV3FCne++atBTfbUQ=
X-Received: by 2002:a2e:8504:0:b0:2d4:3f56:eeef with SMTP id
 j4-20020a2e8504000000b002d43f56eeefmr593652lji.10.1710159318104; Mon, 11 Mar
 2024 05:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org> <20240311-arm32-cfi-v3-7-224a0f0a45c2@linaro.org>
In-Reply-To: <20240311-arm32-cfi-v3-7-224a0f0a45c2@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 11 Mar 2024 13:15:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE_DoxrxXaeLG7SoD=PgJ0JQ=-wyQEjBLzzrtRXsHjy7g@mail.gmail.com>
Message-ID: <CAMj1kXE_DoxrxXaeLG7SoD=PgJ0JQ=-wyQEjBLzzrtRXsHjy7g@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] ARM: page: Turn highpage accesses into static inlines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Mar 2024 at 10:15, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Clearing and copying pages in highmem uses either the cpu_user
> vtable or the __glue() assembler stubs to call into per-CPU
> versions of these functions.
>
> This is all really confusing for KCFI so wrap these into static
> inlines and prefix each inline function with __nocfi.
>
> __cpu_clear_user_highpage() and __cpu_copy_user_highpage() are
> exported in arch/arm/mm/proc-syms.c which causes a problem with
> using static inlines, but it turns out that these exports are
> completely unused, so we can just delete them.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/include/asm/page.h | 36 +++++++++++++++++++++++++++++-------
>  arch/arm/mm/proc-syms.c     |  7 +------
>  2 files changed, 30 insertions(+), 13 deletions(-)
>

Are you sure this patch is needed?

> diff --git a/arch/arm/include/asm/page.h b/arch/arm/include/asm/page.h
> index 119aa85d1feb..8bf297228627 100644
> --- a/arch/arm/include/asm/page.h
> +++ b/arch/arm/include/asm/page.h
> @@ -138,17 +138,39 @@ void xscale_mc_clear_user_highpage(struct page *page, unsigned long vaddr);
>  #ifdef MULTI_USER
>  extern struct cpu_user_fns cpu_user;
>
> -#define __cpu_clear_user_highpage      cpu_user.cpu_clear_user_highpage
> -#define __cpu_copy_user_highpage       cpu_user.cpu_copy_user_highpage
> +static inline void __nocfi __cpu_clear_user_highpage(struct page *page,
> +                                                    unsigned long vaddr)
> +{
> +       cpu_user.cpu_clear_user_highpage(page, vaddr);
> +}
> +
> +static inline void __nocfi __cpu_copy_user_highpage(struct page *to,
> +                       struct page *from, unsigned long vaddr,
> +                       struct vm_area_struct *vma)
> +{
> +       cpu_user.cpu_copy_user_highpage(to, from, vaddr, vma);
> +}
>
>  #else
>
> -#define __cpu_clear_user_highpage      __glue(_USER,_clear_user_highpage)
> -#define __cpu_copy_user_highpage       __glue(_USER,_copy_user_highpage)
> +/* These turn into function declarations for each per-CPU glue function */
> +void __glue(_USER,_clear_user_highpage)(struct page *page, unsigned long vaddr);
> +void __glue(_USER,_copy_user_highpage)(struct page *to, struct page *from,
> +               unsigned long vaddr, struct vm_area_struct *vma);
> +
> +static inline void __nocfi __cpu_clear_user_highpage(struct page *page,
> +                                                    unsigned long vaddr)
> +{
> +       __glue(_USER,_clear_user_highpage)(page, vaddr);
> +}
> +
> +static inline void __nocfi __cpu_copy_user_highpage(struct page *to,
> +                       struct page *from, unsigned long vaddr,
> +                       struct vm_area_struct *vma)
> +{
> +       __glue(_USER,_copy_user_highpage)(to, from, vaddr, vma);
> +}
>
> -extern void __cpu_clear_user_highpage(struct page *page, unsigned long vaddr);
> -extern void __cpu_copy_user_highpage(struct page *to, struct page *from,
> -                       unsigned long vaddr, struct vm_area_struct *vma);
>  #endif
>
>  #define clear_user_highpage(page,vaddr)                \
> diff --git a/arch/arm/mm/proc-syms.c b/arch/arm/mm/proc-syms.c
> index e21249548e9f..c93fec38d9f4 100644
> --- a/arch/arm/mm/proc-syms.c
> +++ b/arch/arm/mm/proc-syms.c
> @@ -31,14 +31,9 @@ EXPORT_SYMBOL(__cpuc_flush_dcache_area);
>  EXPORT_SYMBOL(cpu_cache);
>  #endif
>
> -#ifdef CONFIG_MMU
> -#ifndef MULTI_USER
> -EXPORT_SYMBOL(__cpu_clear_user_highpage);
> -EXPORT_SYMBOL(__cpu_copy_user_highpage);
> -#else
> +#if defined(CONFIG_MMU) && defined(MULTI_USER)
>  EXPORT_SYMBOL(cpu_user);
>  #endif
> -#endif
>
>  /*
>   * No module should need to touch the TLB (and currently
>
> --
> 2.34.1
>
