Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E905A639
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713198929; cv=none; b=PDNpXQsZ1v1eB+FCh0bLL2cvASh6Tjn4lcDxrUiudZIu3UkNYVFYlh9X33cQlO9o9UYnzHb9qqk5BGoZe2/MkKfFGUAyT9TbuY8FcRqgkS7kaUXhe2OruROlaLGjc80klRvd3rwP/o6+1jFkVnEype4Vx4P52UfhEn/4mv7Rwi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713198929; c=relaxed/simple;
	bh=6QQbzOX2DHe9/uxI02t+O2g5OTuzB7CWUqupbqV41Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPpwmaLfTnkqEeG+FIOUIU4daop6s+KWeXkOn5gTOnuAzw3G+DmKW0+cA34BzPGYu9qv/OJ7JwMjW0sqbR9OMRt0mSFGoO2LOkUOqf18sZ64Ox/E4AfHDDowm+PD6g37bNzKLVeSLYj0FJCmSrEczZW1l9EwSIXbQ2WnYZhoPEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biAkwa+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biAkwa+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833D2C4AF08
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713198928;
	bh=6QQbzOX2DHe9/uxI02t+O2g5OTuzB7CWUqupbqV41Qg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=biAkwa+tmF9wZBN5TPxIy08Ooua5nNc8yfrBHwIoKNt+rYim6wbUEMHyu82GUkGRH
	 3FrcnIxeL9Y/vMwgPE/I1BkkrCBg61xrIssPtyg88CsIJt81c+BOZOUnwGWeDjOavg
	 lG3fT6RYX4oeKZYmAa6uoJdtZ68V7of2+DYSL5s0Wijt/g0W2xoMcWd9FH9nmgt02X
	 4QYrdr4UrFHdXEUndlbYff6LqP6GvYiVnwJCpBWEvnx/qtlBHE0/mSHbKHJePRUdqh
	 KHeckAJsViBFcmXXc4ha18+QUZhEkTJu3QdWIOWqMXZdxfx9JRBn+/2rCsCz33PNN+
	 6Y82faPX9c7jQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2da0b3f7ad3so38642031fa.1
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 09:35:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOT/p6KVE5wbdQxeGNlxmByMReDejHxgdQaraWDAyz0N6ck+4Riiw8SfNRHDwIZzwKHdk0lyl7QFBvJQ/LQ9HhLfnjGQ==
X-Gm-Message-State: AOJu0YyPkiQLr6TfSKNmjy1o3Ufs/yTQsDXM28X0QGas8pqm0qzw2a7X
	LAKh1Fu6j/6+1R/EW37T4mqJJhOfsd5wNnyHSqkl3b/oE4vps9nB4MyM6ojqkuKHMH3YJu17+P1
	MkVvTEintcH85DZdm1fXSibeiz/Y=
X-Google-Smtp-Source: AGHT+IH7k09nNrAcLea0/uVXxT+uEFysrzImRpBftwXSUs+LWIdUoyzUYhregvVzdXOeeQRoeLM4Fff9fZKzN8DnmEg=
X-Received: by 2002:a05:651c:1310:b0:2d8:71d4:4bb3 with SMTP id
 u16-20020a05651c131000b002d871d44bb3mr5508428lja.26.1713198926793; Mon, 15
 Apr 2024 09:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org> <20240415-arm32-cfi-v5-4-ff11093eeccc@linaro.org>
In-Reply-To: <20240415-arm32-cfi-v5-4-ff11093eeccc@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 15 Apr 2024 18:35:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGhgQD=+fJDfswSA3HbO6bEgPdpkBthD-E06YWS9gOcng@mail.gmail.com>
Message-ID: <CAMj1kXGhgQD=+fJDfswSA3HbO6bEgPdpkBthD-E06YWS9gOcng@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] ARM: mm: Type-annotate all cache assembly routines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Mon, 15 Apr 2024 at 15:43, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Tag all references to assembly functions with SYM_TYPED_FUNC_START()
> and SYM_FUNC_END() so they also become CFI-safe.
>
> When we add SYM_TYPED_FUNC_START() to assembly calls, a function
> prototype signature will be emitted into the object file at
> (pc-4) at the call site, so that the KCFI runtime check can compare
> this to the expected call. Example:
>
> 8011ae38:       a540670c        .word   0xa540670c
>
> 8011ae3c <v7_flush_icache_all>:
> 8011ae3c:       e3a00000        mov     r0, #0
> 8011ae40:       ee070f11        mcr     15, 0, r0, cr7, cr1, {0}
> 8011ae44:       e12fff1e        bx      lr
>
> This means no "fallthrough" code can enter a SYM_TYPED_FUNC_START()
> call from above it: there will be a function prototype signature
> there, so those are consistently converted to a branch or ret lr
> depending on context.
>
> Tested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/mm/cache-fa.S      | 39 +++++++++++++++++++++-------------
>  arch/arm/mm/cache-nop.S     | 51 ++++++++++++++++++++++++++-------------------
>  arch/arm/mm/cache-v4.S      | 47 ++++++++++++++++++++++++-----------------
>  arch/arm/mm/cache-v4wb.S    | 39 ++++++++++++++++++++--------------
>  arch/arm/mm/cache-v4wt.S    | 47 ++++++++++++++++++++++++-----------------
>  arch/arm/mm/cache-v6.S      | 41 ++++++++++++++++++++----------------
>  arch/arm/mm/cache-v7.S      | 49 ++++++++++++++++++++++---------------------
>  arch/arm/mm/cache-v7m.S     | 45 ++++++++++++++++++++-------------------
>  arch/arm/mm/proc-arm1020.S  | 39 +++++++++++++++++++++-------------
>  arch/arm/mm/proc-arm1020e.S | 40 ++++++++++++++++++++++-------------
>  arch/arm/mm/proc-arm1022.S  | 39 +++++++++++++++++++++-------------
>  arch/arm/mm/proc-arm1026.S  | 40 ++++++++++++++++++++++-------------
>  arch/arm/mm/proc-arm920.S   | 40 +++++++++++++++++++++--------------
>  arch/arm/mm/proc-arm922.S   | 40 +++++++++++++++++++++--------------
>  arch/arm/mm/proc-arm925.S   | 38 ++++++++++++++++++++-------------
>  arch/arm/mm/proc-arm926.S   | 38 ++++++++++++++++++++-------------
>  arch/arm/mm/proc-arm940.S   | 42 ++++++++++++++++++++++---------------
>  arch/arm/mm/proc-arm946.S   | 38 ++++++++++++++++++++-------------
>  arch/arm/mm/proc-feroceon.S | 48 +++++++++++++++++++++++++-----------------
>  arch/arm/mm/proc-mohawk.S   | 38 ++++++++++++++++++++-------------
>  arch/arm/mm/proc-xsc3.S     | 39 +++++++++++++++++++++-------------
>  arch/arm/mm/proc-xscale.S   | 40 +++++++++++++++++++++--------------
>  22 files changed, 544 insertions(+), 373 deletions(-)
>
> diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
> index 71c64e92dead..c3642d5daf38 100644
> --- a/arch/arm/mm/cache-fa.S
> +++ b/arch/arm/mm/cache-fa.S
> @@ -12,6 +12,7 @@
>   */
>  #include <linux/linkage.h>
>  #include <linux/init.h>
> +#include <linux/cfi_types.h>
>  #include <asm/assembler.h>
>  #include <asm/page.h>
>
> @@ -39,11 +40,11 @@
>   *
>   *     Unconditionally clean and invalidate the entire icache.
>   */
> -ENTRY(fa_flush_icache_all)
> +SYM_TYPED_FUNC_START(fa_flush_icache_all)
>         mov     r0, #0
>         mcr     p15, 0, r0, c7, c5, 0           @ invalidate I cache
>         ret     lr
> -ENDPROC(fa_flush_icache_all)
> +SYM_FUNC_END(fa_flush_icache_all)
>
>  /*
>   *     flush_user_cache_all()
> @@ -51,14 +52,16 @@ ENDPROC(fa_flush_icache_all)
>   *     Clean and invalidate all cache entries in a particular address
>   *     space.
>   */
> -ENTRY(fa_flush_user_cache_all)
> -       /* FALLTHROUGH */
> +SYM_TYPED_FUNC_START(fa_flush_user_cache_all)
> +       b       fa_flush_kern_cache_all
> +SYM_FUNC_END(fa_flush_user_cache_all)
> +

Given that the prototypes are identical (and therefore compatible as
far as kCFI is concerned), we might just define an alias

SYM_FUNC_ALIAS(fa_flush_user_cache_all, fa_flush_kern_cache_all)

rather than generate different code.

>  /*
>   *     flush_kern_cache_all()
>   *
>   *     Clean and invalidate the entire cache.
>   */
> -ENTRY(fa_flush_kern_cache_all)
> +SYM_TYPED_FUNC_START(fa_flush_kern_cache_all)
>         mov     ip, #0
>         mov     r2, #VM_EXEC
>  __flush_whole_cache:
> @@ -69,6 +72,7 @@ __flush_whole_cache:
>         mcrne   p15, 0, ip, c7, c10, 4          @ drain write buffer
>         mcrne   p15, 0, ip, c7, c5, 4           @ prefetch flush
>         ret     lr
> +SYM_FUNC_END(fa_flush_kern_cache_all)
>
>  /*
>   *     flush_user_cache_range(start, end, flags)
> @@ -80,7 +84,7 @@ __flush_whole_cache:
>   *     - end   - end address (exclusive, page aligned)
>   *     - flags - vma_area_struct flags describing address space
>   */
> -ENTRY(fa_flush_user_cache_range)
> +SYM_TYPED_FUNC_START(fa_flush_user_cache_range)
>         mov     ip, #0
>         sub     r3, r1, r0                      @ calculate total size
>         cmp     r3, #CACHE_DLIMIT               @ total size >= limit?
> @@ -97,6 +101,7 @@ ENTRY(fa_flush_user_cache_range)
>         mcrne   p15, 0, ip, c7, c10, 4          @ data write barrier
>         mcrne   p15, 0, ip, c7, c5, 4           @ prefetch flush
>         ret     lr
> +SYM_FUNC_END(fa_flush_user_cache_range)
>
>  /*
>   *     coherent_kern_range(start, end)
> @@ -108,8 +113,9 @@ ENTRY(fa_flush_user_cache_range)
>   *     - start  - virtual start address
>   *     - end    - virtual end address
>   */
> -ENTRY(fa_coherent_kern_range)
> -       /* fall through */
> +SYM_TYPED_FUNC_START(fa_coherent_kern_range)
> +       b       fa_coherent_user_range
> +SYM_FUNC_END(fa_coherent_kern_range)
>

Same here.

>  /*
>   *     coherent_user_range(start, end)
> @@ -121,7 +127,7 @@ ENTRY(fa_coherent_kern_range)
>   *     - start  - virtual start address
>   *     - end    - virtual end address
>   */
> -ENTRY(fa_coherent_user_range)
> +SYM_TYPED_FUNC_START(fa_coherent_user_range)
>         bic     r0, r0, #CACHE_DLINESIZE - 1
>  1:     mcr     p15, 0, r0, c7, c14, 1          @ clean and invalidate D entry
>         mcr     p15, 0, r0, c7, c5, 1           @ invalidate I entry
> @@ -133,6 +139,7 @@ ENTRY(fa_coherent_user_range)
>         mcr     p15, 0, r0, c7, c10, 4          @ drain write buffer
>         mcr     p15, 0, r0, c7, c5, 4           @ prefetch flush
>         ret     lr
> +SYM_FUNC_END(fa_coherent_user_range)
>
>  /*
>   *     flush_kern_dcache_area(void *addr, size_t size)
> @@ -143,7 +150,7 @@ ENTRY(fa_coherent_user_range)
>   *     - addr  - kernel address
>   *     - size  - size of region
>   */
> -ENTRY(fa_flush_kern_dcache_area)
> +SYM_TYPED_FUNC_START(fa_flush_kern_dcache_area)
>         add     r1, r0, r1
>  1:     mcr     p15, 0, r0, c7, c14, 1          @ clean & invalidate D line
>         add     r0, r0, #CACHE_DLINESIZE
> @@ -153,6 +160,7 @@ ENTRY(fa_flush_kern_dcache_area)
>         mcr     p15, 0, r0, c7, c5, 0           @ invalidate I cache
>         mcr     p15, 0, r0, c7, c10, 4          @ drain write buffer
>         ret     lr
> +SYM_FUNC_END(fa_flush_kern_dcache_area)
>
>  /*
>   *     dma_inv_range(start, end)
> @@ -203,7 +211,7 @@ fa_dma_clean_range:
>   *     - start   - virtual start address of region
>   *     - end     - virtual end address of region
>   */
> -ENTRY(fa_dma_flush_range)
> +SYM_TYPED_FUNC_START(fa_dma_flush_range)
>         bic     r0, r0, #CACHE_DLINESIZE - 1
>  1:     mcr     p15, 0, r0, c7, c14, 1          @ clean & invalidate D entry
>         add     r0, r0, #CACHE_DLINESIZE
> @@ -212,6 +220,7 @@ ENTRY(fa_dma_flush_range)
>         mov     r0, #0
>         mcr     p15, 0, r0, c7, c10, 4          @ drain write buffer
>         ret     lr
> +SYM_FUNC_END(fa_dma_flush_range)
>
>  /*
>   *     dma_map_area(start, size, dir)
> @@ -219,13 +228,13 @@ ENTRY(fa_dma_flush_range)
>   *     - size  - size of region
>   *     - dir   - DMA direction
>   */
> -ENTRY(fa_dma_map_area)
> +SYM_TYPED_FUNC_START(fa_dma_map_area)
>         add     r1, r1, r0
>         cmp     r2, #DMA_TO_DEVICE
>         beq     fa_dma_clean_range
>         bcs     fa_dma_inv_range
>         b       fa_dma_flush_range
> -ENDPROC(fa_dma_map_area)
> +SYM_FUNC_END(fa_dma_map_area)
>
>  /*
>   *     dma_unmap_area(start, size, dir)
> @@ -233,9 +242,9 @@ ENDPROC(fa_dma_map_area)
>   *     - size  - size of region
>   *     - dir   - DMA direction
>   */
> -ENTRY(fa_dma_unmap_area)
> +SYM_TYPED_FUNC_START(fa_dma_unmap_area)
>         ret     lr
> -ENDPROC(fa_dma_unmap_area)
> +SYM_FUNC_END(fa_dma_unmap_area)
>
>         .globl  fa_flush_kern_cache_louis
>         .equ    fa_flush_kern_cache_louis, fa_flush_kern_cache_all
> diff --git a/arch/arm/mm/cache-nop.S b/arch/arm/mm/cache-nop.S
> index 72d939ef8798..56e94091a55f 100644
> --- a/arch/arm/mm/cache-nop.S
> +++ b/arch/arm/mm/cache-nop.S
> @@ -1,47 +1,56 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  #include <linux/linkage.h>
>  #include <linux/init.h>
> +#include <linux/cfi_types.h>
>  #include <asm/assembler.h>
>
>  #include "proc-macros.S"
>
> -ENTRY(nop_flush_icache_all)
> +SYM_TYPED_FUNC_START(nop_flush_icache_all)
>         ret     lr
> -ENDPROC(nop_flush_icache_all)
> +SYM_FUNC_END(nop_flush_icache_all)
>
> -       .globl nop_flush_kern_cache_all
> -       .equ nop_flush_kern_cache_all, nop_flush_icache_all
> +SYM_TYPED_FUNC_START(nop_flush_kern_cache_all)
> +       ret     lr
> +SYM_FUNC_END(nop_flush_kern_cache_all)
>
>         .globl nop_flush_kern_cache_louis
>         .equ nop_flush_kern_cache_louis, nop_flush_icache_all
>
> -       .globl nop_flush_user_cache_all
> -       .equ nop_flush_user_cache_all, nop_flush_icache_all
> +SYM_TYPED_FUNC_START(nop_flush_user_cache_all)
> +       ret     lr
> +SYM_FUNC_END(nop_flush_user_cache_all)
>
> -       .globl nop_flush_user_cache_range
> -       .equ nop_flush_user_cache_range, nop_flush_icache_all
> +SYM_TYPED_FUNC_START(nop_flush_user_cache_range)
> +       ret     lr
> +SYM_FUNC_END(nop_flush_user_cache_range)
>
> -       .globl nop_coherent_kern_range
> -       .equ nop_coherent_kern_range, nop_flush_icache_all
> +SYM_TYPED_FUNC_START(nop_coherent_kern_range)
> +       ret     lr
> +SYM_FUNC_END(nop_coherent_kern_range)
>
> -ENTRY(nop_coherent_user_range)
> +SYM_TYPED_FUNC_START(nop_coherent_user_range)
>         mov     r0, 0
>         ret     lr
> -ENDPROC(nop_coherent_user_range)
> -
> -       .globl nop_flush_kern_dcache_area
> -       .equ nop_flush_kern_dcache_area, nop_flush_icache_all
> +SYM_FUNC_END(nop_coherent_user_range)
>
> -       .globl nop_dma_flush_range
> -       .equ nop_dma_flush_range, nop_flush_icache_all
> +SYM_TYPED_FUNC_START(nop_flush_kern_dcache_area)
> +       ret     lr
> +SYM_FUNC_END(nop_flush_kern_dcache_area)
>
> -       .globl nop_dma_map_area
> -       .equ nop_dma_map_area, nop_flush_icache_all
> +SYM_TYPED_FUNC_START(nop_dma_flush_range)
> +       ret     lr
> +SYM_FUNC_END(nop_dma_flush_range)
>
> -       .globl nop_dma_unmap_area
> -       .equ nop_dma_unmap_area, nop_flush_icache_all
> +SYM_TYPED_FUNC_START(nop_dma_map_area)
> +       ret     lr
> +SYM_FUNC_END(nop_dma_map_area)
>
>         __INITDATA
>
>         @ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
>         define_cache_functions nop
> +
> +SYM_TYPED_FUNC_START(nop_dma_unmap_area)
> +       ret     lr
> +SYM_FUNC_END(nop_dma_unmap_area)
> diff --git a/arch/arm/mm/cache-v4.S b/arch/arm/mm/cache-v4.S
> index 7787057e4990..22d9c9d9e0d7 100644
> --- a/arch/arm/mm/cache-v4.S
> +++ b/arch/arm/mm/cache-v4.S
> @@ -6,6 +6,7 @@
>   */
>  #include <linux/linkage.h>
>  #include <linux/init.h>
> +#include <linux/cfi_types.h>
>  #include <asm/assembler.h>
>  #include <asm/page.h>
>  #include "proc-macros.S"
> @@ -15,9 +16,9 @@
>   *
>   *     Unconditionally clean and invalidate the entire icache.
>   */
> -ENTRY(v4_flush_icache_all)
> +SYM_TYPED_FUNC_START(v4_flush_icache_all)
>         ret     lr
> -ENDPROC(v4_flush_icache_all)
> +SYM_FUNC_END(v4_flush_icache_all)
>
>  /*
>   *     flush_user_cache_all()
> @@ -27,21 +28,24 @@ ENDPROC(v4_flush_icache_all)
>   *
>   *     - mm    - mm_struct describing address space
>   */
> -ENTRY(v4_flush_user_cache_all)
> -       /* FALLTHROUGH */
> +SYM_TYPED_FUNC_START(v4_flush_user_cache_all)
> +       b       v4_flush_kern_cache_all
> +SYM_FUNC_END(v4_flush_user_cache_all)
> +
>  /*
>   *     flush_kern_cache_all()
>   *
>   *     Clean and invalidate the entire cache.
>   */
> -ENTRY(v4_flush_kern_cache_all)
> +SYM_TYPED_FUNC_START(v4_flush_kern_cache_all)
>  #ifdef CONFIG_CPU_CP15
>         mov     r0, #0
>         mcr     p15, 0, r0, c7, c7, 0           @ flush ID cache
>         ret     lr
>  #else
> -       /* FALLTHROUGH */
> +       ret     lr
>  #endif
> +SYM_FUNC_END(v4_flush_kern_cache_all)
>

Yeah, this is needlessly obfuscated, falling through twice to a 'ret lr' :-)

You could still use SYM_FUNC_ALIAS() here if the prototypes are identical.
