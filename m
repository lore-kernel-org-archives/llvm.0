Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479573F8ED
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856800; cv=none; b=TjAy/3RLqgO33r1QpP/DXujog4s7GUEeC0fs4dUu5Qqu1qJLQ6uQLNiNltgxAYWQ3qwcHb+0b3Kc2tSnaCrr8FS7m9oTyXli+Nji96s1Ek1bJzNrS3pFCQLVfKrHvVcX0coxgBr5bk8wdNRROArWOIaZOCQLhJJh2ct+izewxrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856800; c=relaxed/simple;
	bh=bm/3fhuYxHyBR2nBOasIkONLbzwCCl0LgoCDFqR1Zb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bno0KA2kKQSiBdEubBTnGHfGqdkg0BOZc1y2nM4NS3hSMVi8tmbJImeAynJnjVhbrq5QoToyZGB/YmtIerfHzlImC9BGHCYYm+rznQsOgJoxKl59gkYXViaca4vylbzYpcIbVEnYhSPQY8tzd8PFPV0edFPLmpzlLWZOQLYN4/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fd0kkLNS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fd0kkLNS"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2dac77cdf43so68853291fa.2
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 00:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713856793; x=1714461593; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HYIAWGeBs6RNxcejF8+vnm12piI7ywFnQiNKIqtiEQ=;
        b=Fd0kkLNS0mv9Ya6x/StPi0RZpvCNeaBm7gWKdBTVATOzSxSHTIqPD2EwWCrupxHGfE
         /m8pUq8KT0DWNyaJavTdPDf5JbtCtTIp1ufHqvtI5C1jtaiuuUM7oQtbtJda/g4HV1BX
         QECWAFUyiINpYs7b4A75i1BBybmvFRHTAme7nldJhOK6HrRozpbAum2PVRLZwMHU5rgJ
         WZwLErMF4AaYsmNIWYVosRuz/J9Uh6TJ1TiWst4zoPhcYNTg0efoN41StuDWGY1Ezo4E
         LUSs2c6zzzCL6gEr0qXm+0lKmlGji7CNyKuI9LZE1eeS/9ELBFfIl7k9p6FxgroMUiBK
         dvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713856793; x=1714461593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HYIAWGeBs6RNxcejF8+vnm12piI7ywFnQiNKIqtiEQ=;
        b=URPZLF8ScvXDmPenphlqVZJau8jEizDgt7W2F7mm/IqRXMqGrhrgXnbBeXjOBF7KIN
         BL3WYZF46djOAxKO9cLwqzbWngBIzcpA9E6bdIdZLQsGIhNwsEgIFgGOM4uiE+vCdOK6
         U519iGcltS1zYJPa7V7+rMJHz5/xqll9W5URAsbn05mR82UuNANrL73PoYaQWtclhdI5
         /r/KuxD/lnH9gN3Mygpax96gk+5p4ttaRFg1eRERXExSjB+PKOWCww5pIS5y5+fmGrV5
         8q6Tr4ZFtpWi3EZxMTp3E+JXQBh8YWOyZpBbY5skHx3L4cFOe8enqjsq3me+bFIbeBur
         YpMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXproQqfyJGymn9hDps3BA+411mN5sb/PXgJcIlmUvr6lr3nvhYe+s1l/g/V616xYWjNJc37R1QoJ4T0fLS5XxSVLun2Q==
X-Gm-Message-State: AOJu0YyXMBiuYdI8el97G+7WBtp7bxIwC5sPCRghnG5WpnuWrI27d2ZC
	NGe79oVKmQiZbmTjR6ivcEkYOhQbYG+T0j8cADP2FUNy0Mx/eGTK1QptrmkGmSE=
X-Google-Smtp-Source: AGHT+IHXwOOQod/z1ZCpegvXtcn/c8IaYT0ltHvI0olCNXf/1ZqQdaHe9GcWPk9ltOP+pS6xSXEHgw==
X-Received: by 2002:a05:6512:683:b0:51b:bb0f:b43f with SMTP id t3-20020a056512068300b0051bbb0fb43fmr54193lfe.43.1713856792711;
        Tue, 23 Apr 2024 00:19:52 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f13-20020a056512360d00b0051ad4552454sm1307588lfs.148.2024.04.23.00.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:19:52 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 09:19:48 +0200
Subject: [PATCH v8 2/9] ARM: mm: Type-annotate all cache assembly routines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-arm32-cfi-v8-2-08f10f5d9297@linaro.org>
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
In-Reply-To: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

Tag all references to assembly functions with SYM_TYPED_FUNC_START()
and SYM_FUNC_END() so they also become CFI-safe.

When we add SYM_TYPED_FUNC_START() to assembly calls, a function
prototype signature will be emitted into the object file at
(pc-4) at the call site, so that the KCFI runtime check can compare
this to the expected call. Example:

8011ae38:       a540670c        .word   0xa540670c

8011ae3c <v7_flush_icache_all>:
8011ae3c:       e3a00000        mov     r0, #0
8011ae40:       ee070f11        mcr     15, 0, r0, cr7, cr1, {0}
8011ae44:       e12fff1e        bx      lr

This means no "fallthrough" code can enter a SYM_TYPED_FUNC_START()
call from above it: there will be a function prototype signature
there, so those are consistently converted to a branch or ret lr
depending on context.

Tested-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/cache-fa.S      | 39 +++++++++++++++++++++-------------
 arch/arm/mm/cache-nop.S     | 51 ++++++++++++++++++++++++++-------------------
 arch/arm/mm/cache-v4.S      | 47 ++++++++++++++++++++++++-----------------
 arch/arm/mm/cache-v4wb.S    | 39 ++++++++++++++++++++--------------
 arch/arm/mm/cache-v4wt.S    | 47 ++++++++++++++++++++++++-----------------
 arch/arm/mm/cache-v6.S      | 41 ++++++++++++++++++++----------------
 arch/arm/mm/cache-v7.S      | 49 ++++++++++++++++++++++---------------------
 arch/arm/mm/cache-v7m.S     | 45 ++++++++++++++++++++-------------------
 arch/arm/mm/proc-arm1020.S  | 39 +++++++++++++++++++++-------------
 arch/arm/mm/proc-arm1020e.S | 40 ++++++++++++++++++++++-------------
 arch/arm/mm/proc-arm1022.S  | 39 +++++++++++++++++++++-------------
 arch/arm/mm/proc-arm1026.S  | 40 ++++++++++++++++++++++-------------
 arch/arm/mm/proc-arm920.S   | 40 +++++++++++++++++++++--------------
 arch/arm/mm/proc-arm922.S   | 40 +++++++++++++++++++++--------------
 arch/arm/mm/proc-arm925.S   | 38 ++++++++++++++++++++-------------
 arch/arm/mm/proc-arm926.S   | 38 ++++++++++++++++++++-------------
 arch/arm/mm/proc-arm940.S   | 42 ++++++++++++++++++++++---------------
 arch/arm/mm/proc-arm946.S   | 38 ++++++++++++++++++++-------------
 arch/arm/mm/proc-feroceon.S | 48 +++++++++++++++++++++++++-----------------
 arch/arm/mm/proc-mohawk.S   | 38 ++++++++++++++++++++-------------
 arch/arm/mm/proc-xsc3.S     | 39 +++++++++++++++++++++-------------
 arch/arm/mm/proc-xscale.S   | 40 +++++++++++++++++++++--------------
 22 files changed, 544 insertions(+), 373 deletions(-)

diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index 71c64e92dead..c3642d5daf38 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -12,6 +12,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/page.h>
 
@@ -39,11 +40,11 @@
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(fa_flush_icache_all)
+SYM_TYPED_FUNC_START(fa_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(fa_flush_icache_all)
+SYM_FUNC_END(fa_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -51,14 +52,16 @@ ENDPROC(fa_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(fa_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(fa_flush_user_cache_all)
+	b	fa_flush_kern_cache_all
+SYM_FUNC_END(fa_flush_user_cache_all)
+
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(fa_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(fa_flush_kern_cache_all)
 	mov	ip, #0
 	mov	r2, #VM_EXEC
 __flush_whole_cache:
@@ -69,6 +72,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain write buffer
 	mcrne	p15, 0, ip, c7, c5, 4		@ prefetch flush
 	ret	lr
+SYM_FUNC_END(fa_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -80,7 +84,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive, page aligned)
  *	- flags	- vma_area_struct flags describing address space
  */
-ENTRY(fa_flush_user_cache_range)
+SYM_TYPED_FUNC_START(fa_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT		@ total size >= limit?
@@ -97,6 +101,7 @@ ENTRY(fa_flush_user_cache_range)
 	mcrne	p15, 0, ip, c7, c10, 4		@ data write barrier
 	mcrne	p15, 0, ip, c7, c5, 4		@ prefetch flush
 	ret	lr
+SYM_FUNC_END(fa_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -108,8 +113,9 @@ ENTRY(fa_flush_user_cache_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(fa_coherent_kern_range)
-	/* fall through */
+SYM_TYPED_FUNC_START(fa_coherent_kern_range)
+	b	fa_coherent_user_range
+SYM_FUNC_END(fa_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -121,7 +127,7 @@ ENTRY(fa_coherent_kern_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(fa_coherent_user_range)
+SYM_TYPED_FUNC_START(fa_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean and invalidate D entry
 	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
@@ -133,6 +139,7 @@ ENTRY(fa_coherent_user_range)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
 	mcr	p15, 0, r0, c7, c5, 4		@ prefetch flush
 	ret	lr
+SYM_FUNC_END(fa_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -143,7 +150,7 @@ ENTRY(fa_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- size of region
  */
-ENTRY(fa_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(fa_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean & invalidate D line
 	add	r0, r0, #CACHE_DLINESIZE
@@ -153,6 +160,7 @@ ENTRY(fa_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
 	ret	lr
+SYM_FUNC_END(fa_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -203,7 +211,7 @@ fa_dma_clean_range:
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-ENTRY(fa_dma_flush_range)
+SYM_TYPED_FUNC_START(fa_dma_flush_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean & invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -212,6 +220,7 @@ ENTRY(fa_dma_flush_range)
 	mov	r0, #0	
 	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
 	ret	lr
+SYM_FUNC_END(fa_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -219,13 +228,13 @@ ENTRY(fa_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(fa_dma_map_area)
+SYM_TYPED_FUNC_START(fa_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	fa_dma_clean_range
 	bcs	fa_dma_inv_range
 	b	fa_dma_flush_range
-ENDPROC(fa_dma_map_area)
+SYM_FUNC_END(fa_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -233,9 +242,9 @@ ENDPROC(fa_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(fa_dma_unmap_area)
+SYM_TYPED_FUNC_START(fa_dma_unmap_area)
 	ret	lr
-ENDPROC(fa_dma_unmap_area)
+SYM_FUNC_END(fa_dma_unmap_area)
 
 	.globl	fa_flush_kern_cache_louis
 	.equ	fa_flush_kern_cache_louis, fa_flush_kern_cache_all
diff --git a/arch/arm/mm/cache-nop.S b/arch/arm/mm/cache-nop.S
index 72d939ef8798..56e94091a55f 100644
--- a/arch/arm/mm/cache-nop.S
+++ b/arch/arm/mm/cache-nop.S
@@ -1,47 +1,56 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 
 #include "proc-macros.S"
 
-ENTRY(nop_flush_icache_all)
+SYM_TYPED_FUNC_START(nop_flush_icache_all)
 	ret	lr
-ENDPROC(nop_flush_icache_all)
+SYM_FUNC_END(nop_flush_icache_all)
 
-	.globl nop_flush_kern_cache_all
-	.equ nop_flush_kern_cache_all, nop_flush_icache_all
+SYM_TYPED_FUNC_START(nop_flush_kern_cache_all)
+	ret	lr
+SYM_FUNC_END(nop_flush_kern_cache_all)
 
 	.globl nop_flush_kern_cache_louis
 	.equ nop_flush_kern_cache_louis, nop_flush_icache_all
 
-	.globl nop_flush_user_cache_all
-	.equ nop_flush_user_cache_all, nop_flush_icache_all
+SYM_TYPED_FUNC_START(nop_flush_user_cache_all)
+	ret	lr
+SYM_FUNC_END(nop_flush_user_cache_all)
 
-	.globl nop_flush_user_cache_range
-	.equ nop_flush_user_cache_range, nop_flush_icache_all
+SYM_TYPED_FUNC_START(nop_flush_user_cache_range)
+	ret	lr
+SYM_FUNC_END(nop_flush_user_cache_range)
 
-	.globl nop_coherent_kern_range
-	.equ nop_coherent_kern_range, nop_flush_icache_all
+SYM_TYPED_FUNC_START(nop_coherent_kern_range)
+	ret	lr
+SYM_FUNC_END(nop_coherent_kern_range)
 
-ENTRY(nop_coherent_user_range)
+SYM_TYPED_FUNC_START(nop_coherent_user_range)
 	mov	r0, 0
 	ret	lr
-ENDPROC(nop_coherent_user_range)
-
-	.globl nop_flush_kern_dcache_area
-	.equ nop_flush_kern_dcache_area, nop_flush_icache_all
+SYM_FUNC_END(nop_coherent_user_range)
 
-	.globl nop_dma_flush_range
-	.equ nop_dma_flush_range, nop_flush_icache_all
+SYM_TYPED_FUNC_START(nop_flush_kern_dcache_area)
+	ret	lr
+SYM_FUNC_END(nop_flush_kern_dcache_area)
 
-	.globl nop_dma_map_area
-	.equ nop_dma_map_area, nop_flush_icache_all
+SYM_TYPED_FUNC_START(nop_dma_flush_range)
+	ret	lr
+SYM_FUNC_END(nop_dma_flush_range)
 
-	.globl nop_dma_unmap_area
-	.equ nop_dma_unmap_area, nop_flush_icache_all
+SYM_TYPED_FUNC_START(nop_dma_map_area)
+	ret	lr
+SYM_FUNC_END(nop_dma_map_area)
 
 	__INITDATA
 
 	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
 	define_cache_functions nop
+
+SYM_TYPED_FUNC_START(nop_dma_unmap_area)
+	ret	lr
+SYM_FUNC_END(nop_dma_unmap_area)
diff --git a/arch/arm/mm/cache-v4.S b/arch/arm/mm/cache-v4.S
index 7787057e4990..22d9c9d9e0d7 100644
--- a/arch/arm/mm/cache-v4.S
+++ b/arch/arm/mm/cache-v4.S
@@ -6,6 +6,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/page.h>
 #include "proc-macros.S"
@@ -15,9 +16,9 @@
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(v4_flush_icache_all)
+SYM_TYPED_FUNC_START(v4_flush_icache_all)
 	ret	lr
-ENDPROC(v4_flush_icache_all)
+SYM_FUNC_END(v4_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -27,21 +28,24 @@ ENDPROC(v4_flush_icache_all)
  *
  *	- mm	- mm_struct describing address space
  */
-ENTRY(v4_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(v4_flush_user_cache_all)
+	b	v4_flush_kern_cache_all
+SYM_FUNC_END(v4_flush_user_cache_all)
+
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(v4_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(v4_flush_kern_cache_all)
 #ifdef CONFIG_CPU_CP15
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c7, 0		@ flush ID cache
 	ret	lr
 #else
-	/* FALLTHROUGH */
+	ret	lr
 #endif
+SYM_FUNC_END(v4_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -53,14 +57,15 @@ ENTRY(v4_flush_kern_cache_all)
  *	- end	- end address (exclusive, may not be aligned)
  *	- flags	- vma_area_struct flags describing address space
  */
-ENTRY(v4_flush_user_cache_range)
+SYM_TYPED_FUNC_START(v4_flush_user_cache_range)
 #ifdef CONFIG_CPU_CP15
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c7, 0		@ flush ID cache
 	ret	lr
 #else
-	/* FALLTHROUGH */
+	ret	lr
 #endif
+SYM_FUNC_END(v4_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -72,8 +77,9 @@ ENTRY(v4_flush_user_cache_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(v4_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(v4_coherent_kern_range)
+	ret	lr
+SYM_FUNC_END(v4_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -85,9 +91,10 @@ ENTRY(v4_coherent_kern_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(v4_coherent_user_range)
+SYM_TYPED_FUNC_START(v4_coherent_user_range)
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(v4_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -98,8 +105,9 @@ ENTRY(v4_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(v4_flush_kern_dcache_area)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(v4_flush_kern_dcache_area)
+	b	v4_dma_flush_range
+SYM_FUNC_END(v4_flush_kern_dcache_area)
 
 /*
  *	dma_flush_range(start, end)
@@ -109,12 +117,13 @@ ENTRY(v4_flush_kern_dcache_area)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(v4_dma_flush_range)
+SYM_TYPED_FUNC_START(v4_dma_flush_range)
 #ifdef CONFIG_CPU_CP15
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c7, 0		@ flush ID cache
 #endif
 	ret	lr
+SYM_FUNC_END(v4_dma_flush_range)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -122,10 +131,11 @@ ENTRY(v4_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4_dma_unmap_area)
+SYM_TYPED_FUNC_START(v4_dma_unmap_area)
 	teq	r2, #DMA_TO_DEVICE
 	bne	v4_dma_flush_range
-	/* FALLTHROUGH */
+	ret	lr
+SYM_FUNC_END(v4_dma_unmap_area)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -133,10 +143,9 @@ ENTRY(v4_dma_unmap_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4_dma_map_area)
+SYM_TYPED_FUNC_START(v4_dma_map_area)
 	ret	lr
-ENDPROC(v4_dma_unmap_area)
-ENDPROC(v4_dma_map_area)
+SYM_FUNC_END(v4_dma_map_area)
 
 	.globl	v4_flush_kern_cache_louis
 	.equ	v4_flush_kern_cache_louis, v4_flush_kern_cache_all
diff --git a/arch/arm/mm/cache-v4wb.S b/arch/arm/mm/cache-v4wb.S
index ad382cee0fdb..0d97b594e23f 100644
--- a/arch/arm/mm/cache-v4wb.S
+++ b/arch/arm/mm/cache-v4wb.S
@@ -6,6 +6,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/page.h>
 #include "proc-macros.S"
@@ -53,11 +54,11 @@ flush_base:
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(v4wb_flush_icache_all)
+SYM_TYPED_FUNC_START(v4wb_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(v4wb_flush_icache_all)
+SYM_FUNC_END(v4wb_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -65,14 +66,16 @@ ENDPROC(v4wb_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(v4wb_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(v4wb_flush_user_cache_all)
+	b	v4wb_flush_kern_cache_all
+SYM_FUNC_END(v4wb_flush_user_cache_all)
+
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(v4wb_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(v4wb_flush_kern_cache_all)
 	mov	ip, #0
 	mcr	p15, 0, ip, c7, c5, 0		@ invalidate I cache
 __flush_whole_cache:
@@ -93,6 +96,7 @@ __flush_whole_cache:
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain write buffer
 	ret	lr
+SYM_FUNC_END(v4wb_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -104,7 +108,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive, page aligned)
  *	- flags	- vma_area_struct flags describing address space
  */
-ENTRY(v4wb_flush_user_cache_range)
+SYM_TYPED_FUNC_START(v4wb_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	tst	r2, #VM_EXEC			@ executable region?
@@ -121,6 +125,7 @@ ENTRY(v4wb_flush_user_cache_range)
 	tst	r2, #VM_EXEC
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain write buffer
 	ret	lr
+SYM_FUNC_END(v4wb_flush_user_cache_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -131,9 +136,10 @@ ENTRY(v4wb_flush_user_cache_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(v4wb_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(v4wb_flush_kern_dcache_area)
 	add	r1, r0, r1
-	/* fall through */
+	b	v4wb_coherent_user_range
+SYM_FUNC_END(v4wb_flush_kern_dcache_area)
 
 /*
  *	coherent_kern_range(start, end)
@@ -145,8 +151,9 @@ ENTRY(v4wb_flush_kern_dcache_area)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(v4wb_coherent_kern_range)
-	/* fall through */
+SYM_TYPED_FUNC_START(v4wb_coherent_kern_range)
+	b	v4wb_coherent_user_range
+SYM_FUNC_END(v4wb_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -158,7 +165,7 @@ ENTRY(v4wb_coherent_kern_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(v4wb_coherent_user_range)
+SYM_TYPED_FUNC_START(v4wb_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c6, 1		@ invalidate D entry
@@ -169,7 +176,7 @@ ENTRY(v4wb_coherent_user_range)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
-
+SYM_FUNC_END(v4wb_coherent_user_range)
 
 /*
  *	dma_inv_range(start, end)
@@ -231,13 +238,13 @@ v4wb_dma_clean_range:
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4wb_dma_map_area)
+SYM_TYPED_FUNC_START(v4wb_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	v4wb_dma_clean_range
 	bcs	v4wb_dma_inv_range
 	b	v4wb_dma_flush_range
-ENDPROC(v4wb_dma_map_area)
+SYM_FUNC_END(v4wb_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -245,9 +252,9 @@ ENDPROC(v4wb_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4wb_dma_unmap_area)
+SYM_TYPED_FUNC_START(v4wb_dma_unmap_area)
 	ret	lr
-ENDPROC(v4wb_dma_unmap_area)
+SYM_FUNC_END(v4wb_dma_unmap_area)
 
 	.globl	v4wb_flush_kern_cache_louis
 	.equ	v4wb_flush_kern_cache_louis, v4wb_flush_kern_cache_all
diff --git a/arch/arm/mm/cache-v4wt.S b/arch/arm/mm/cache-v4wt.S
index 0b290c25a99d..eee6d8f06b4d 100644
--- a/arch/arm/mm/cache-v4wt.S
+++ b/arch/arm/mm/cache-v4wt.S
@@ -10,6 +10,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/page.h>
 #include "proc-macros.S"
@@ -43,11 +44,11 @@
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(v4wt_flush_icache_all)
+SYM_TYPED_FUNC_START(v4wt_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(v4wt_flush_icache_all)
+SYM_FUNC_END(v4wt_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -55,14 +56,16 @@ ENDPROC(v4wt_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(v4wt_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(v4wt_flush_user_cache_all)
+	b	v4wt_flush_kern_cache_all
+SYM_FUNC_END(v4wt_flush_user_cache_all)
+
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(v4wt_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(v4wt_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -70,6 +73,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, ip, c7, c6, 0		@ invalidate D cache
 	ret	lr
+SYM_FUNC_END(v4wt_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -81,7 +85,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive, page aligned)
  *	- flags	- vma_area_struct flags describing address space
  */
-ENTRY(v4wt_flush_user_cache_range)
+SYM_TYPED_FUNC_START(v4wt_flush_user_cache_range)
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
 	bhs	__flush_whole_cache
@@ -93,6 +97,7 @@ ENTRY(v4wt_flush_user_cache_range)
 	cmp	r0, r1
 	blo	1b
 	ret	lr
+SYM_FUNC_END(v4wt_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -104,8 +109,9 @@ ENTRY(v4wt_flush_user_cache_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(v4wt_coherent_kern_range)
-	/* FALLTRHOUGH */
+SYM_TYPED_FUNC_START(v4wt_coherent_kern_range)
+	b	v4wt_coherent_user_range
+SYM_FUNC_END(v4wt_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -117,7 +123,7 @@ ENTRY(v4wt_coherent_kern_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(v4wt_coherent_user_range)
+SYM_TYPED_FUNC_START(v4wt_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -125,6 +131,7 @@ ENTRY(v4wt_coherent_user_range)
 	blo	1b
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(v4wt_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -135,11 +142,12 @@ ENTRY(v4wt_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(v4wt_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(v4wt_flush_kern_dcache_area)
 	mov	r2, #0
 	mcr	p15, 0, r2, c7, c5, 0		@ invalidate I cache
 	add	r1, r0, r1
-	/* fallthrough */
+	b	v4wt_dma_inv_range
+SYM_FUNC_END(v4wt_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -167,9 +175,10 @@ v4wt_dma_inv_range:
  *
  *	- start  - virtual start address
  *	- end	 - virtual end address
- */
-	.globl	v4wt_dma_flush_range
-	.equ	v4wt_dma_flush_range, v4wt_dma_inv_range
+*/
+SYM_TYPED_FUNC_START(v4wt_dma_flush_range)
+	b	v4wt_dma_inv_range
+SYM_FUNC_END(v4wt_dma_flush_range)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -177,11 +186,12 @@ v4wt_dma_inv_range:
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4wt_dma_unmap_area)
+SYM_TYPED_FUNC_START(v4wt_dma_unmap_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_TO_DEVICE
 	bne	v4wt_dma_inv_range
-	/* FALLTHROUGH */
+	ret	lr
+SYM_FUNC_END(v4wt_dma_unmap_area)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -189,10 +199,9 @@ ENTRY(v4wt_dma_unmap_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v4wt_dma_map_area)
+SYM_TYPED_FUNC_START(v4wt_dma_map_area)
 	ret	lr
-ENDPROC(v4wt_dma_unmap_area)
-ENDPROC(v4wt_dma_map_area)
+SYM_FUNC_END(v4wt_dma_map_area)
 
 	.globl	v4wt_flush_kern_cache_louis
 	.equ	v4wt_flush_kern_cache_louis, v4wt_flush_kern_cache_all
diff --git a/arch/arm/mm/cache-v6.S b/arch/arm/mm/cache-v6.S
index 44211d8a296f..5c7549a49db5 100644
--- a/arch/arm/mm/cache-v6.S
+++ b/arch/arm/mm/cache-v6.S
@@ -8,6 +8,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/errno.h>
 #include <asm/unwind.h>
@@ -34,7 +35,7 @@
  *	r0 - set to 0
  *	r1 - corrupted
  */
-ENTRY(v6_flush_icache_all)
+SYM_TYPED_FUNC_START(v6_flush_icache_all)
 	mov	r0, #0
 #ifdef CONFIG_ARM_ERRATA_411920
 	mrs	r1, cpsr
@@ -51,7 +52,7 @@ ENTRY(v6_flush_icache_all)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I-cache
 #endif
 	ret	lr
-ENDPROC(v6_flush_icache_all)
+SYM_FUNC_END(v6_flush_icache_all)
 
 /*
  *	v6_flush_cache_all()
@@ -60,7 +61,7 @@ ENDPROC(v6_flush_icache_all)
  *
  *	It is assumed that:
  */
-ENTRY(v6_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(v6_flush_kern_cache_all)
 	mov	r0, #0
 #ifdef HARVARD_CACHE
 	mcr	p15, 0, r0, c7, c14, 0		@ D cache clean+invalidate
@@ -73,6 +74,7 @@ ENTRY(v6_flush_kern_cache_all)
 	mcr	p15, 0, r0, c7, c15, 0		@ Cache clean+invalidate
 #endif
 	ret	lr
+SYM_FUNC_END(v6_flush_kern_cache_all)
 
 /*
  *	v6_flush_cache_all()
@@ -81,8 +83,9 @@ ENTRY(v6_flush_kern_cache_all)
  *
  *	- mm    - mm_struct describing address space
  */
-ENTRY(v6_flush_user_cache_all)
-	/*FALLTHROUGH*/
+SYM_TYPED_FUNC_START(v6_flush_user_cache_all)
+	ret	lr
+SYM_FUNC_END(v6_flush_user_cache_all)
 
 /*
  *	v6_flush_cache_range(start, end, flags)
@@ -96,8 +99,9 @@ ENTRY(v6_flush_user_cache_all)
  *	It is assumed that:
  *	- we have a VIPT cache.
  */
-ENTRY(v6_flush_user_cache_range)
+SYM_TYPED_FUNC_START(v6_flush_user_cache_range)
 	ret	lr
+SYM_FUNC_END(v6_flush_user_cache_range)
 
 /*
  *	v6_coherent_kern_range(start,end)
@@ -112,8 +116,9 @@ ENTRY(v6_flush_user_cache_range)
  *	It is assumed that:
  *	- the Icache does not read data from the write buffer
  */
-ENTRY(v6_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(v6_coherent_kern_range)
+	b	v6_coherent_user_range
+SYM_FUNC_END(v6_coherent_kern_range)
 
 /*
  *	v6_coherent_user_range(start,end)
@@ -128,7 +133,7 @@ ENTRY(v6_coherent_kern_range)
  *	It is assumed that:
  *	- the Icache does not read data from the write buffer
  */
-ENTRY(v6_coherent_user_range)
+SYM_TYPED_FUNC_START(v6_coherent_user_range)
  UNWIND(.fnstart		)
 #ifdef HARVARD_CACHE
 	bic	r0, r0, #CACHE_LINE_SIZE - 1
@@ -159,8 +164,7 @@ ENTRY(v6_coherent_user_range)
 	mov	r0, #-EFAULT
 	ret	lr
  UNWIND(.fnend		)
-ENDPROC(v6_coherent_user_range)
-ENDPROC(v6_coherent_kern_range)
+SYM_FUNC_END(v6_coherent_user_range)
 
 /*
  *	v6_flush_kern_dcache_area(void *addr, size_t size)
@@ -171,7 +175,7 @@ ENDPROC(v6_coherent_kern_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(v6_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(v6_flush_kern_dcache_area)
 	add	r1, r0, r1
 	bic	r0, r0, #D_CACHE_LINE_SIZE - 1
 1:
@@ -188,7 +192,7 @@ ENTRY(v6_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c10, 4
 #endif
 	ret	lr
-
+SYM_FUNC_END(v6_flush_kern_dcache_area)
 
 /*
  *	v6_dma_inv_range(start,end)
@@ -253,7 +257,7 @@ v6_dma_clean_range:
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-ENTRY(v6_dma_flush_range)
+SYM_TYPED_FUNC_START(v6_dma_flush_range)
 	bic	r0, r0, #D_CACHE_LINE_SIZE - 1
 1:
 #ifdef HARVARD_CACHE
@@ -267,6 +271,7 @@ ENTRY(v6_dma_flush_range)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c10, 4		@ drain write buffer
 	ret	lr
+SYM_FUNC_END(v6_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -274,12 +279,12 @@ ENTRY(v6_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v6_dma_map_area)
+SYM_TYPED_FUNC_START(v6_dma_map_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_FROM_DEVICE
 	beq	v6_dma_inv_range
 	b	v6_dma_clean_range
-ENDPROC(v6_dma_map_area)
+SYM_FUNC_END(v6_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -287,12 +292,12 @@ ENDPROC(v6_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v6_dma_unmap_area)
+SYM_TYPED_FUNC_START(v6_dma_unmap_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_TO_DEVICE
 	bne	v6_dma_inv_range
 	ret	lr
-ENDPROC(v6_dma_unmap_area)
+SYM_FUNC_END(v6_dma_unmap_area)
 
 	.globl	v6_flush_kern_cache_louis
 	.equ	v6_flush_kern_cache_louis, v6_flush_kern_cache_all
diff --git a/arch/arm/mm/cache-v7.S b/arch/arm/mm/cache-v7.S
index 127afe2096ba..5908dd54de47 100644
--- a/arch/arm/mm/cache-v7.S
+++ b/arch/arm/mm/cache-v7.S
@@ -9,6 +9,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/errno.h>
 #include <asm/unwind.h>
@@ -80,12 +81,12 @@ ENDPROC(v7_invalidate_l1)
  *	Registers:
  *	r0 - set to 0
  */
-ENTRY(v7_flush_icache_all)
+SYM_TYPED_FUNC_START(v7_flush_icache_all)
 	mov	r0, #0
 	ALT_SMP(mcr	p15, 0, r0, c7, c1, 0)		@ invalidate I-cache inner shareable
 	ALT_UP(mcr	p15, 0, r0, c7, c5, 0)		@ I+BTB cache invalidate
 	ret	lr
-ENDPROC(v7_flush_icache_all)
+SYM_FUNC_END(v7_flush_icache_all)
 
  /*
  *     v7_flush_dcache_louis()
@@ -193,7 +194,7 @@ ENDPROC(v7_flush_dcache_all)
  *  unification in a single instruction.
  *
  */
-ENTRY(v7_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(v7_flush_kern_cache_all)
 	stmfd	sp!, {r4-r6, r9-r10, lr}
 	bl	v7_flush_dcache_all
 	mov	r0, #0
@@ -201,7 +202,7 @@ ENTRY(v7_flush_kern_cache_all)
 	ALT_UP(mcr	p15, 0, r0, c7, c5, 0)	@ I+BTB cache invalidate
 	ldmfd	sp!, {r4-r6, r9-r10, lr}
 	ret	lr
-ENDPROC(v7_flush_kern_cache_all)
+SYM_FUNC_END(v7_flush_kern_cache_all)
 
  /*
  *     v7_flush_kern_cache_louis(void)
@@ -209,7 +210,7 @@ ENDPROC(v7_flush_kern_cache_all)
  *     Flush the data cache up to Level of Unification Inner Shareable.
  *     Invalidate the I-cache to the point of unification.
  */
-ENTRY(v7_flush_kern_cache_louis)
+SYM_TYPED_FUNC_START(v7_flush_kern_cache_louis)
 	stmfd	sp!, {r4-r6, r9-r10, lr}
 	bl	v7_flush_dcache_louis
 	mov	r0, #0
@@ -217,7 +218,7 @@ ENTRY(v7_flush_kern_cache_louis)
 	ALT_UP(mcr	p15, 0, r0, c7, c5, 0)	@ I+BTB cache invalidate
 	ldmfd	sp!, {r4-r6, r9-r10, lr}
 	ret	lr
-ENDPROC(v7_flush_kern_cache_louis)
+SYM_FUNC_END(v7_flush_kern_cache_louis)
 
 /*
  *	v7_flush_cache_all()
@@ -226,8 +227,9 @@ ENDPROC(v7_flush_kern_cache_louis)
  *
  *	- mm    - mm_struct describing address space
  */
-ENTRY(v7_flush_user_cache_all)
-	/*FALLTHROUGH*/
+SYM_TYPED_FUNC_START(v7_flush_user_cache_all)
+	ret	lr
+SYM_FUNC_END(v7_flush_user_cache_all)
 
 /*
  *	v7_flush_cache_range(start, end, flags)
@@ -241,10 +243,9 @@ ENTRY(v7_flush_user_cache_all)
  *	It is assumed that:
  *	- we have a VIPT cache.
  */
-ENTRY(v7_flush_user_cache_range)
+SYM_TYPED_FUNC_START(v7_flush_user_cache_range)
 	ret	lr
-ENDPROC(v7_flush_user_cache_all)
-ENDPROC(v7_flush_user_cache_range)
+SYM_FUNC_END(v7_flush_user_cache_range)
 
 /*
  *	v7_coherent_kern_range(start,end)
@@ -259,8 +260,9 @@ ENDPROC(v7_flush_user_cache_range)
  *	It is assumed that:
  *	- the Icache does not read data from the write buffer
  */
-ENTRY(v7_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(v7_coherent_kern_range)
+	b	v7_coherent_user_range
+SYM_FUNC_END(v7_coherent_kern_range)
 
 /*
  *	v7_coherent_user_range(start,end)
@@ -275,7 +277,7 @@ ENTRY(v7_coherent_kern_range)
  *	It is assumed that:
  *	- the Icache does not read data from the write buffer
  */
-ENTRY(v7_coherent_user_range)
+SYM_TYPED_FUNC_START(v7_coherent_user_range)
  UNWIND(.fnstart		)
 	dcache_line_size r2, r3
 	sub	r3, r2, #1
@@ -321,8 +323,7 @@ ENTRY(v7_coherent_user_range)
 	mov	r0, #-EFAULT
 	ret	lr
  UNWIND(.fnend		)
-ENDPROC(v7_coherent_kern_range)
-ENDPROC(v7_coherent_user_range)
+SYM_FUNC_END(v7_coherent_user_range)
 
 /*
  *	v7_flush_kern_dcache_area(void *addr, size_t size)
@@ -333,7 +334,7 @@ ENDPROC(v7_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(v7_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(v7_flush_kern_dcache_area)
 	dcache_line_size r2, r3
 	add	r1, r0, r1
 	sub	r3, r2, #1
@@ -349,7 +350,7 @@ ENTRY(v7_flush_kern_dcache_area)
 	blo	1b
 	dsb	st
 	ret	lr
-ENDPROC(v7_flush_kern_dcache_area)
+SYM_FUNC_END(v7_flush_kern_dcache_area)
 
 /*
  *	v7_dma_inv_range(start,end)
@@ -413,7 +414,7 @@ ENDPROC(v7_dma_clean_range)
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-ENTRY(v7_dma_flush_range)
+SYM_TYPED_FUNC_START(v7_dma_flush_range)
 	dcache_line_size r2, r3
 	sub	r3, r2, #1
 	bic	r0, r0, r3
@@ -428,7 +429,7 @@ ENTRY(v7_dma_flush_range)
 	blo	1b
 	dsb	st
 	ret	lr
-ENDPROC(v7_dma_flush_range)
+SYM_FUNC_END(v7_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -436,12 +437,12 @@ ENDPROC(v7_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v7_dma_map_area)
+SYM_TYPED_FUNC_START(v7_dma_map_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_FROM_DEVICE
 	beq	v7_dma_inv_range
 	b	v7_dma_clean_range
-ENDPROC(v7_dma_map_area)
+SYM_FUNC_END(v7_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -449,12 +450,12 @@ ENDPROC(v7_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v7_dma_unmap_area)
+SYM_TYPED_FUNC_START(v7_dma_unmap_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_TO_DEVICE
 	bne	v7_dma_inv_range
 	ret	lr
-ENDPROC(v7_dma_unmap_area)
+SYM_FUNC_END(v7_dma_unmap_area)
 
 	__INITDATA
 
diff --git a/arch/arm/mm/cache-v7m.S b/arch/arm/mm/cache-v7m.S
index eb60b5e5e2ad..5a62b9a224e1 100644
--- a/arch/arm/mm/cache-v7m.S
+++ b/arch/arm/mm/cache-v7m.S
@@ -11,6 +11,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/errno.h>
 #include <asm/unwind.h>
@@ -159,10 +160,10 @@ ENDPROC(v7m_invalidate_l1)
  *	Registers:
  *	r0 - set to 0
  */
-ENTRY(v7m_flush_icache_all)
+SYM_TYPED_FUNC_START(v7m_flush_icache_all)
 	invalidate_icache r0
 	ret	lr
-ENDPROC(v7m_flush_icache_all)
+SYM_FUNC_END(v7m_flush_icache_all)
 
 /*
  *	v7m_flush_dcache_all()
@@ -236,13 +237,13 @@ ENDPROC(v7m_flush_dcache_all)
  *  unification in a single instruction.
  *
  */
-ENTRY(v7m_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(v7m_flush_kern_cache_all)
 	stmfd	sp!, {r4-r7, r9-r11, lr}
 	bl	v7m_flush_dcache_all
 	invalidate_icache r0
 	ldmfd	sp!, {r4-r7, r9-r11, lr}
 	ret	lr
-ENDPROC(v7m_flush_kern_cache_all)
+SYM_FUNC_END(v7m_flush_kern_cache_all)
 
 /*
  *	v7m_flush_cache_all()
@@ -251,8 +252,9 @@ ENDPROC(v7m_flush_kern_cache_all)
  *
  *	- mm    - mm_struct describing address space
  */
-ENTRY(v7m_flush_user_cache_all)
-	/*FALLTHROUGH*/
+SYM_TYPED_FUNC_START(v7m_flush_user_cache_all)
+	ret	lr
+SYM_FUNC_END(v7m_flush_user_cache_all)
 
 /*
  *	v7m_flush_cache_range(start, end, flags)
@@ -266,10 +268,9 @@ ENTRY(v7m_flush_user_cache_all)
  *	It is assumed that:
  *	- we have a VIPT cache.
  */
-ENTRY(v7m_flush_user_cache_range)
+SYM_TYPED_FUNC_START(v7m_flush_user_cache_range)
 	ret	lr
-ENDPROC(v7m_flush_user_cache_all)
-ENDPROC(v7m_flush_user_cache_range)
+SYM_FUNC_END(v7m_flush_user_cache_range)
 
 /*
  *	v7m_coherent_kern_range(start,end)
@@ -284,8 +285,9 @@ ENDPROC(v7m_flush_user_cache_range)
  *	It is assumed that:
  *	- the Icache does not read data from the write buffer
  */
-ENTRY(v7m_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(v7m_coherent_kern_range)
+	b	v7m_coherent_user_range
+SYM_FUNC_END(v7m_coherent_kern_range)
 
 /*
  *	v7m_coherent_user_range(start,end)
@@ -300,7 +302,7 @@ ENTRY(v7m_coherent_kern_range)
  *	It is assumed that:
  *	- the Icache does not read data from the write buffer
  */
-ENTRY(v7m_coherent_user_range)
+SYM_TYPED_FUNC_START(v7m_coherent_user_range)
  UNWIND(.fnstart		)
 	dcache_line_size r2, r3
 	sub	r3, r2, #1
@@ -328,8 +330,7 @@ ENTRY(v7m_coherent_user_range)
 	isb
 	ret	lr
  UNWIND(.fnend		)
-ENDPROC(v7m_coherent_kern_range)
-ENDPROC(v7m_coherent_user_range)
+SYM_FUNC_END(v7m_coherent_user_range)
 
 /*
  *	v7m_flush_kern_dcache_area(void *addr, size_t size)
@@ -340,7 +341,7 @@ ENDPROC(v7m_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(v7m_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(v7m_flush_kern_dcache_area)
 	dcache_line_size r2, r3
 	add	r1, r0, r1
 	sub	r3, r2, #1
@@ -352,7 +353,7 @@ ENTRY(v7m_flush_kern_dcache_area)
 	blo	1b
 	dsb	st
 	ret	lr
-ENDPROC(v7m_flush_kern_dcache_area)
+SYM_FUNC_END(v7m_flush_kern_dcache_area)
 
 /*
  *	v7m_dma_inv_range(start,end)
@@ -408,7 +409,7 @@ ENDPROC(v7m_dma_clean_range)
  *	- start   - virtual start address of region
  *	- end     - virtual end address of region
  */
-ENTRY(v7m_dma_flush_range)
+SYM_TYPED_FUNC_START(v7m_dma_flush_range)
 	dcache_line_size r2, r3
 	sub	r3, r2, #1
 	bic	r0, r0, r3
@@ -419,7 +420,7 @@ ENTRY(v7m_dma_flush_range)
 	blo	1b
 	dsb	st
 	ret	lr
-ENDPROC(v7m_dma_flush_range)
+SYM_FUNC_END(v7m_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -427,12 +428,12 @@ ENDPROC(v7m_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v7m_dma_map_area)
+SYM_TYPED_FUNC_START(v7m_dma_map_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_FROM_DEVICE
 	beq	v7m_dma_inv_range
 	b	v7m_dma_clean_range
-ENDPROC(v7m_dma_map_area)
+SYM_FUNC_END(v7m_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -440,12 +441,12 @@ ENDPROC(v7m_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(v7m_dma_unmap_area)
+SYM_TYPED_FUNC_START(v7m_dma_unmap_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_TO_DEVICE
 	bne	v7m_dma_inv_range
 	ret	lr
-ENDPROC(v7m_dma_unmap_area)
+SYM_FUNC_END(v7m_dma_unmap_area)
 
 	.globl	v7m_flush_kern_cache_louis
 	.equ	v7m_flush_kern_cache_louis, v7m_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index 6837cf7a4812..a3f99e1c1186 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -11,6 +11,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -112,13 +113,13 @@ ENTRY(cpu_arm1020_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm1020_flush_icache_all)
+SYM_TYPED_FUNC_START(arm1020_flush_icache_all)
 #ifndef CONFIG_CPU_ICACHE_DISABLE
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 #endif
 	ret	lr
-ENDPROC(arm1020_flush_icache_all)
+SYM_FUNC_END(arm1020_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -126,14 +127,16 @@ ENDPROC(arm1020_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(arm1020_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm1020_flush_user_cache_all)
+	b	arm1020_flush_kern_cache_all
+SYM_FUNC_END(arm1020_flush_user_cache_all)
+
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm1020_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm1020_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -154,6 +157,7 @@ __flush_whole_cache:
 #endif
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1020_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -165,7 +169,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive)
  *	- flags	- vm_flags for this space
  */
-ENTRY(arm1020_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm1020_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -185,6 +189,7 @@ ENTRY(arm1020_flush_user_cache_range)
 #endif
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1020_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -196,8 +201,9 @@ ENTRY(arm1020_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1020_coherent_kern_range)
-	/* FALLTRHOUGH */
+SYM_TYPED_FUNC_START(arm1020_coherent_kern_range)
+	b	arm1020_coherent_user_range
+SYM_FUNC_END(arm1020_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -209,7 +215,7 @@ ENTRY(arm1020_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1020_coherent_user_range)
+SYM_TYPED_FUNC_START(arm1020_coherent_user_range)
 	mov	ip, #0
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 	mcr	p15, 0, ip, c7, c10, 4
@@ -227,6 +233,7 @@ ENTRY(arm1020_coherent_user_range)
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(arm1020_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -237,7 +244,7 @@ ENTRY(arm1020_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(arm1020_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm1020_flush_kern_dcache_area)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	add	r1, r0, r1
@@ -249,6 +256,7 @@ ENTRY(arm1020_flush_kern_dcache_area)
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1020_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -314,7 +322,7 @@ arm1020_dma_clean_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1020_dma_flush_range)
+SYM_TYPED_FUNC_START(arm1020_dma_flush_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	bic	r0, r0, #CACHE_DLINESIZE - 1
@@ -327,6 +335,7 @@ ENTRY(arm1020_dma_flush_range)
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1020_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -334,13 +343,13 @@ ENTRY(arm1020_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm1020_dma_map_area)
+SYM_TYPED_FUNC_START(arm1020_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1020_dma_clean_range
 	bcs	arm1020_dma_inv_range
 	b	arm1020_dma_flush_range
-ENDPROC(arm1020_dma_map_area)
+SYM_FUNC_END(arm1020_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -348,9 +357,9 @@ ENDPROC(arm1020_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm1020_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm1020_dma_unmap_area)
 	ret	lr
-ENDPROC(arm1020_dma_unmap_area)
+SYM_FUNC_END(arm1020_dma_unmap_area)
 
 	.globl	arm1020_flush_kern_cache_louis
 	.equ	arm1020_flush_kern_cache_louis, arm1020_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index df49b10250b8..64c63eb5d830 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -11,6 +11,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -112,13 +113,13 @@ ENTRY(cpu_arm1020e_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm1020e_flush_icache_all)
+SYM_TYPED_FUNC_START(arm1020e_flush_icache_all)
 #ifndef CONFIG_CPU_ICACHE_DISABLE
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 #endif
 	ret	lr
-ENDPROC(arm1020e_flush_icache_all)
+SYM_FUNC_END(arm1020e_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -126,14 +127,16 @@ ENDPROC(arm1020e_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(arm1020e_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm1020e_flush_user_cache_all)
+	b	arm1020e_flush_kern_cache_all
+SYM_FUNC_END(arm1020e_flush_user_cache_all)
+
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm1020e_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm1020e_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -153,6 +156,7 @@ __flush_whole_cache:
 #endif
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1020e_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -164,7 +168,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive)
  *	- flags	- vm_flags for this space
  */
-ENTRY(arm1020e_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm1020e_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -182,6 +186,7 @@ ENTRY(arm1020e_flush_user_cache_range)
 #endif
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1020e_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -193,8 +198,10 @@ ENTRY(arm1020e_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1020e_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm1020e_coherent_kern_range)
+	b	arm1020e_coherent_user_range
+SYM_FUNC_END(arm1020e_coherent_kern_range)
+
 /*
  *	coherent_user_range(start, end)
  *
@@ -205,7 +212,7 @@ ENTRY(arm1020e_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1020e_coherent_user_range)
+SYM_TYPED_FUNC_START(arm1020e_coherent_user_range)
 	mov	ip, #0
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:
@@ -221,6 +228,7 @@ ENTRY(arm1020e_coherent_user_range)
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(arm1020e_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -231,7 +239,7 @@ ENTRY(arm1020e_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(arm1020e_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm1020e_flush_kern_dcache_area)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	add	r1, r0, r1
@@ -242,6 +250,7 @@ ENTRY(arm1020e_flush_kern_dcache_area)
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1020e_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -302,7 +311,7 @@ arm1020e_dma_clean_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1020e_dma_flush_range)
+SYM_TYPED_FUNC_START(arm1020e_dma_flush_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	bic	r0, r0, #CACHE_DLINESIZE - 1
@@ -313,6 +322,7 @@ ENTRY(arm1020e_dma_flush_range)
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1020e_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -320,13 +330,13 @@ ENTRY(arm1020e_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm1020e_dma_map_area)
+SYM_TYPED_FUNC_START(arm1020e_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1020e_dma_clean_range
 	bcs	arm1020e_dma_inv_range
 	b	arm1020e_dma_flush_range
-ENDPROC(arm1020e_dma_map_area)
+SYM_FUNC_END(arm1020e_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -334,9 +344,9 @@ ENDPROC(arm1020e_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm1020e_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm1020e_dma_unmap_area)
 	ret	lr
-ENDPROC(arm1020e_dma_unmap_area)
+SYM_FUNC_END(arm1020e_dma_unmap_area)
 
 	.globl	arm1020e_flush_kern_cache_louis
 	.equ	arm1020e_flush_kern_cache_louis, arm1020e_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index e89ce467f672..e170497353ae 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -11,6 +11,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -112,13 +113,13 @@ ENTRY(cpu_arm1022_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm1022_flush_icache_all)
+SYM_TYPED_FUNC_START(arm1022_flush_icache_all)
 #ifndef CONFIG_CPU_ICACHE_DISABLE
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 #endif
 	ret	lr
-ENDPROC(arm1022_flush_icache_all)
+SYM_FUNC_END(arm1022_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -126,14 +127,16 @@ ENDPROC(arm1022_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(arm1022_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm1022_flush_user_cache_all)
+	b	arm1022_flush_kern_cache_all
+SYM_FUNC_END(arm1022_flush_user_cache_all)
+
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm1022_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm1022_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -152,6 +155,7 @@ __flush_whole_cache:
 #endif
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1022_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -163,7 +167,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive)
  *	- flags	- vm_flags for this space
  */
-ENTRY(arm1022_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm1022_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -181,6 +185,7 @@ ENTRY(arm1022_flush_user_cache_range)
 #endif
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1022_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -192,8 +197,9 @@ ENTRY(arm1022_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1022_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm1022_coherent_kern_range)
+	b	arm1022_coherent_user_range
+SYM_FUNC_END(arm1022_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -205,7 +211,7 @@ ENTRY(arm1022_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1022_coherent_user_range)
+SYM_TYPED_FUNC_START(arm1022_coherent_user_range)
 	mov	ip, #0
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:
@@ -221,6 +227,7 @@ ENTRY(arm1022_coherent_user_range)
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(arm1022_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -231,7 +238,7 @@ ENTRY(arm1022_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(arm1022_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm1022_flush_kern_dcache_area)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	add	r1, r0, r1
@@ -242,6 +249,7 @@ ENTRY(arm1022_flush_kern_dcache_area)
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1022_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -302,7 +310,7 @@ arm1022_dma_clean_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1022_dma_flush_range)
+SYM_TYPED_FUNC_START(arm1022_dma_flush_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	bic	r0, r0, #CACHE_DLINESIZE - 1
@@ -313,6 +321,7 @@ ENTRY(arm1022_dma_flush_range)
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1022_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -320,13 +329,13 @@ ENTRY(arm1022_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm1022_dma_map_area)
+SYM_TYPED_FUNC_START(arm1022_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1022_dma_clean_range
 	bcs	arm1022_dma_inv_range
 	b	arm1022_dma_flush_range
-ENDPROC(arm1022_dma_map_area)
+SYM_FUNC_END(arm1022_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -334,9 +343,9 @@ ENDPROC(arm1022_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm1022_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm1022_dma_unmap_area)
 	ret	lr
-ENDPROC(arm1022_dma_unmap_area)
+SYM_FUNC_END(arm1022_dma_unmap_area)
 
 	.globl	arm1022_flush_kern_cache_louis
 	.equ	arm1022_flush_kern_cache_louis, arm1022_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 7fdd1a205e8e..4b5a4849ad85 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -11,6 +11,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
@@ -112,13 +113,13 @@ ENTRY(cpu_arm1026_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm1026_flush_icache_all)
+SYM_TYPED_FUNC_START(arm1026_flush_icache_all)
 #ifndef CONFIG_CPU_ICACHE_DISABLE
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 #endif
 	ret	lr
-ENDPROC(arm1026_flush_icache_all)
+SYM_FUNC_END(arm1026_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -126,14 +127,16 @@ ENDPROC(arm1026_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(arm1026_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm1026_flush_user_cache_all)
+	b	arm1026_flush_kern_cache_all
+SYM_FUNC_END(arm1026_flush_user_cache_all)
+
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm1026_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm1026_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -147,6 +150,7 @@ __flush_whole_cache:
 #endif
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1026_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -158,7 +162,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive)
  *	- flags	- vm_flags for this space
  */
-ENTRY(arm1026_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm1026_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -176,6 +180,7 @@ ENTRY(arm1026_flush_user_cache_range)
 #endif
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1026_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -187,8 +192,10 @@ ENTRY(arm1026_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1026_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm1026_coherent_kern_range)
+	b	arm1026_coherent_user_range
+SYM_FUNC_END(arm1026_coherent_kern_range)
+
 /*
  *	coherent_user_range(start, end)
  *
@@ -199,7 +206,7 @@ ENTRY(arm1026_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1026_coherent_user_range)
+SYM_TYPED_FUNC_START(arm1026_coherent_user_range)
 	mov	ip, #0
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:
@@ -215,6 +222,7 @@ ENTRY(arm1026_coherent_user_range)
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(arm1026_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -225,7 +233,7 @@ ENTRY(arm1026_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(arm1026_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm1026_flush_kern_dcache_area)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	add	r1, r0, r1
@@ -236,6 +244,7 @@ ENTRY(arm1026_flush_kern_dcache_area)
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1026_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -296,7 +305,7 @@ arm1026_dma_clean_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm1026_dma_flush_range)
+SYM_TYPED_FUNC_START(arm1026_dma_flush_range)
 	mov	ip, #0
 #ifndef CONFIG_CPU_DCACHE_DISABLE
 	bic	r0, r0, #CACHE_DLINESIZE - 1
@@ -307,6 +316,7 @@ ENTRY(arm1026_dma_flush_range)
 #endif
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm1026_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -314,13 +324,13 @@ ENTRY(arm1026_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm1026_dma_map_area)
+SYM_TYPED_FUNC_START(arm1026_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm1026_dma_clean_range
 	bcs	arm1026_dma_inv_range
 	b	arm1026_dma_flush_range
-ENDPROC(arm1026_dma_map_area)
+SYM_FUNC_END(arm1026_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -328,9 +338,9 @@ ENDPROC(arm1026_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm1026_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm1026_dma_unmap_area)
 	ret	lr
-ENDPROC(arm1026_dma_unmap_area)
+SYM_FUNC_END(arm1026_dma_unmap_area)
 
 	.globl	arm1026_flush_kern_cache_louis
 	.equ	arm1026_flush_kern_cache_louis, arm1026_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index a234cd8ba5e6..fbf8937eae85 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -13,6 +13,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -103,11 +104,11 @@ ENTRY(cpu_arm920_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm920_flush_icache_all)
+SYM_TYPED_FUNC_START(arm920_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(arm920_flush_icache_all)
+SYM_FUNC_END(arm920_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -115,15 +116,16 @@ ENDPROC(arm920_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(arm920_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm920_flush_user_cache_all)
+	b	arm920_flush_kern_cache_all
+SYM_FUNC_END(arm920_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm920_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm920_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -138,6 +140,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c5, 0		@ invalidate I cache
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm920_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -149,7 +152,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive)
  *	- flags	- vm_flags for address space
  */
-ENTRY(arm920_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm920_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -164,6 +167,7 @@ ENTRY(arm920_flush_user_cache_range)
 	tst	r2, #VM_EXEC
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm920_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -175,8 +179,9 @@ ENTRY(arm920_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm920_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm920_coherent_kern_range)
+	b	arm920_coherent_user_range
+SYM_FUNC_END(arm920_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -188,7 +193,7 @@ ENTRY(arm920_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm920_coherent_user_range)
+SYM_TYPED_FUNC_START(arm920_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
@@ -198,6 +203,7 @@ ENTRY(arm920_coherent_user_range)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(arm920_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -208,7 +214,7 @@ ENTRY(arm920_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(arm920_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm920_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -218,6 +224,7 @@ ENTRY(arm920_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm920_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -272,7 +279,7 @@ arm920_dma_clean_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm920_dma_flush_range)
+SYM_TYPED_FUNC_START(arm920_dma_flush_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -280,6 +287,7 @@ ENTRY(arm920_dma_flush_range)
 	blo	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm920_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -287,13 +295,13 @@ ENTRY(arm920_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm920_dma_map_area)
+SYM_TYPED_FUNC_START(arm920_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm920_dma_clean_range
 	bcs	arm920_dma_inv_range
 	b	arm920_dma_flush_range
-ENDPROC(arm920_dma_map_area)
+SYM_FUNC_END(arm920_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -301,16 +309,16 @@ ENDPROC(arm920_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm920_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm920_dma_unmap_area)
 	ret	lr
-ENDPROC(arm920_dma_unmap_area)
+SYM_FUNC_END(arm920_dma_unmap_area)
 
 	.globl	arm920_flush_kern_cache_louis
 	.equ	arm920_flush_kern_cache_louis, arm920_flush_kern_cache_all
 
 	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
 	define_cache_functions arm920
-#endif
+#endif /* !CONFIG_CPU_DCACHE_WRITETHROUGH */
 
 
 ENTRY(cpu_arm920_dcache_clean_area)
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index 53c029dcfd83..ccfff2b65f49 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -14,6 +14,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -105,11 +106,11 @@ ENTRY(cpu_arm922_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm922_flush_icache_all)
+SYM_TYPED_FUNC_START(arm922_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(arm922_flush_icache_all)
+SYM_FUNC_END(arm922_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -117,15 +118,16 @@ ENDPROC(arm922_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular
  *	address space.
  */
-ENTRY(arm922_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm922_flush_user_cache_all)
+	b	arm922_flush_kern_cache_all
+SYM_FUNC_END(arm922_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm922_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm922_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -140,6 +142,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c5, 0		@ invalidate I cache
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm922_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -151,7 +154,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive)
  *	- flags	- vm_flags describing address space
  */
-ENTRY(arm922_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm922_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -166,6 +169,7 @@ ENTRY(arm922_flush_user_cache_range)
 	tst	r2, #VM_EXEC
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm922_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -177,8 +181,9 @@ ENTRY(arm922_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm922_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm922_coherent_kern_range)
+	b	arm922_coherent_user_range
+SYM_FUNC_END(arm922_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -190,7 +195,7 @@ ENTRY(arm922_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm922_coherent_user_range)
+SYM_TYPED_FUNC_START(arm922_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
@@ -200,6 +205,7 @@ ENTRY(arm922_coherent_user_range)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(arm922_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -210,7 +216,7 @@ ENTRY(arm922_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(arm922_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm922_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -220,6 +226,7 @@ ENTRY(arm922_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm922_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -274,7 +281,7 @@ arm922_dma_clean_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm922_dma_flush_range)
+SYM_TYPED_FUNC_START(arm922_dma_flush_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -282,6 +289,7 @@ ENTRY(arm922_dma_flush_range)
 	blo	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm922_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -289,13 +297,13 @@ ENTRY(arm922_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm922_dma_map_area)
+SYM_TYPED_FUNC_START(arm922_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm922_dma_clean_range
 	bcs	arm922_dma_inv_range
 	b	arm922_dma_flush_range
-ENDPROC(arm922_dma_map_area)
+SYM_FUNC_END(arm922_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -303,17 +311,17 @@ ENDPROC(arm922_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm922_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm922_dma_unmap_area)
 	ret	lr
-ENDPROC(arm922_dma_unmap_area)
+SYM_FUNC_END(arm922_dma_unmap_area)
 
 	.globl	arm922_flush_kern_cache_louis
 	.equ	arm922_flush_kern_cache_louis, arm922_flush_kern_cache_all
 
 	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
 	define_cache_functions arm922
-#endif
 
+#endif /* !CONFIG_CPU_DCACHE_WRITETHROUGH */
 
 ENTRY(cpu_arm922_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 0bfad62ea858..d0f73242f70a 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -37,6 +37,7 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -138,11 +139,11 @@ ENTRY(cpu_arm925_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm925_flush_icache_all)
+SYM_TYPED_FUNC_START(arm925_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(arm925_flush_icache_all)
+SYM_FUNC_END(arm925_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -150,15 +151,16 @@ ENDPROC(arm925_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular
  *	address space.
  */
-ENTRY(arm925_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm925_flush_user_cache_all)
+	b	arm925_flush_kern_cache_all
+SYM_FUNC_END(arm925_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm925_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm925_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -175,6 +177,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c5, 0		@ invalidate I cache
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm925_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -186,7 +189,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive)
  *	- flags	- vm_flags describing address space
  */
-ENTRY(arm925_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm925_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -212,6 +215,7 @@ ENTRY(arm925_flush_user_cache_range)
 	tst	r2, #VM_EXEC
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm925_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -223,8 +227,9 @@ ENTRY(arm925_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm925_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm925_coherent_kern_range)
+	b	arm925_coherent_user_range
+SYM_FUNC_END(arm925_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -236,7 +241,7 @@ ENTRY(arm925_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm925_coherent_user_range)
+SYM_TYPED_FUNC_START(arm925_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
@@ -246,6 +251,7 @@ ENTRY(arm925_coherent_user_range)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(arm925_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -256,7 +262,7 @@ ENTRY(arm925_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(arm925_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm925_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -266,6 +272,7 @@ ENTRY(arm925_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm925_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -324,7 +331,7 @@ arm925_dma_clean_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm925_dma_flush_range)
+SYM_TYPED_FUNC_START(arm925_dma_flush_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
@@ -337,6 +344,7 @@ ENTRY(arm925_dma_flush_range)
 	blo	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm925_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -344,13 +352,13 @@ ENTRY(arm925_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm925_dma_map_area)
+SYM_TYPED_FUNC_START(arm925_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm925_dma_clean_range
 	bcs	arm925_dma_inv_range
 	b	arm925_dma_flush_range
-ENDPROC(arm925_dma_map_area)
+SYM_FUNC_END(arm925_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -358,9 +366,9 @@ ENDPROC(arm925_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm925_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm925_dma_unmap_area)
 	ret	lr
-ENDPROC(arm925_dma_unmap_area)
+SYM_FUNC_END(arm925_dma_unmap_area)
 
 	.globl	arm925_flush_kern_cache_louis
 	.equ	arm925_flush_kern_cache_louis, arm925_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index 0487a2c3439b..00f953dee122 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -13,6 +13,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -104,11 +105,11 @@ ENTRY(cpu_arm926_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm926_flush_icache_all)
+SYM_TYPED_FUNC_START(arm926_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(arm926_flush_icache_all)
+SYM_FUNC_END(arm926_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -116,15 +117,16 @@ ENDPROC(arm926_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular
  *	address space.
  */
-ENTRY(arm926_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm926_flush_user_cache_all)
+	b	arm926_flush_kern_cache_all
+SYM_FUNC_END(arm926_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm926_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm926_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -138,6 +140,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c5, 0		@ invalidate I cache
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm926_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -149,7 +152,7 @@ __flush_whole_cache:
  *	- end	- end address (exclusive)
  *	- flags	- vm_flags describing address space
  */
-ENTRY(arm926_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm926_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -175,6 +178,7 @@ ENTRY(arm926_flush_user_cache_range)
 	tst	r2, #VM_EXEC
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm926_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -186,8 +190,9 @@ ENTRY(arm926_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm926_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm926_coherent_kern_range)
+	b	arm926_coherent_user_range
+SYM_FUNC_END(arm926_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -199,7 +204,7 @@ ENTRY(arm926_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm926_coherent_user_range)
+SYM_TYPED_FUNC_START(arm926_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
@@ -209,6 +214,7 @@ ENTRY(arm926_coherent_user_range)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(arm926_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -219,7 +225,7 @@ ENTRY(arm926_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(arm926_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm926_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -229,6 +235,7 @@ ENTRY(arm926_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm926_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -287,7 +294,7 @@ arm926_dma_clean_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm926_dma_flush_range)
+SYM_TYPED_FUNC_START(arm926_dma_flush_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
@@ -300,6 +307,7 @@ ENTRY(arm926_dma_flush_range)
 	blo	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm926_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -307,13 +315,13 @@ ENTRY(arm926_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm926_dma_map_area)
+SYM_TYPED_FUNC_START(arm926_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm926_dma_clean_range
 	bcs	arm926_dma_inv_range
 	b	arm926_dma_flush_range
-ENDPROC(arm926_dma_map_area)
+SYM_FUNC_END(arm926_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -321,9 +329,9 @@ ENDPROC(arm926_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm926_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm926_dma_unmap_area)
 	ret	lr
-ENDPROC(arm926_dma_unmap_area)
+SYM_FUNC_END(arm926_dma_unmap_area)
 
 	.globl	arm926_flush_kern_cache_louis
 	.equ	arm926_flush_kern_cache_louis, arm926_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index cf9bfcc825ca..7e32ec271e8a 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -6,6 +6,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -71,26 +72,28 @@ ENTRY(cpu_arm940_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm940_flush_icache_all)
+SYM_TYPED_FUNC_START(arm940_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(arm940_flush_icache_all)
+SYM_FUNC_END(arm940_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
  */
-ENTRY(arm940_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm940_flush_user_cache_all)
+	b	arm940_flush_kern_cache_all
+SYM_FUNC_END(arm940_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm940_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm940_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
-	/* FALLTHROUGH */
+	b	arm940_flush_user_cache_range
+SYM_FUNC_END(arm940_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -102,7 +105,7 @@ ENTRY(arm940_flush_kern_cache_all)
  *	- end	- end address (exclusive)
  *	- flags	- vm_flags describing address space
  */
-ENTRY(arm940_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm940_flush_user_cache_range)
 	mov	ip, #0
 #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
 	mcr	p15, 0, ip, c7, c6, 0		@ flush D cache
@@ -119,6 +122,7 @@ ENTRY(arm940_flush_user_cache_range)
 	mcrne	p15, 0, ip, c7, c5, 0		@ invalidate I cache
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm940_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -130,8 +134,9 @@ ENTRY(arm940_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm940_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm940_coherent_kern_range)
+	b	arm940_flush_kern_dcache_area
+SYM_FUNC_END(arm940_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -143,8 +148,9 @@ ENTRY(arm940_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm940_coherent_user_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm940_coherent_user_range)
+	b	arm940_flush_kern_dcache_area
+SYM_FUNC_END(arm940_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -155,7 +161,7 @@ ENTRY(arm940_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(arm940_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm940_flush_kern_dcache_area)
 	mov	r0, #0
 	mov	r1, #(CACHE_DSEGMENTS - 1) << 4	@ 4 segments
 1:	orr	r3, r1, #(CACHE_DENTRIES - 1) << 26 @ 64 entries
@@ -167,6 +173,7 @@ ENTRY(arm940_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm940_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -222,7 +229,7 @@ ENTRY(cpu_arm940_dcache_clean_area)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm940_dma_flush_range)
+SYM_TYPED_FUNC_START(arm940_dma_flush_range)
 	mov	ip, #0
 	mov	r1, #(CACHE_DSEGMENTS - 1) << 4	@ 4 segments
 1:	orr	r3, r1, #(CACHE_DENTRIES - 1) << 26 @ 64 entries
@@ -238,6 +245,7 @@ ENTRY(arm940_dma_flush_range)
 	bcs	1b				@ segments 7 to 0
 	mcr	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm940_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -245,13 +253,13 @@ ENTRY(arm940_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm940_dma_map_area)
+SYM_TYPED_FUNC_START(arm940_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm940_dma_clean_range
 	bcs	arm940_dma_inv_range
 	b	arm940_dma_flush_range
-ENDPROC(arm940_dma_map_area)
+SYM_FUNC_END(arm940_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -259,9 +267,9 @@ ENDPROC(arm940_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm940_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm940_dma_unmap_area)
 	ret	lr
-ENDPROC(arm940_dma_unmap_area)
+SYM_FUNC_END(arm940_dma_unmap_area)
 
 	.globl	arm940_flush_kern_cache_louis
 	.equ	arm940_flush_kern_cache_louis, arm940_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 6fb3898ad1cd..4fc883572e19 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -8,6 +8,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -78,24 +79,25 @@ ENTRY(cpu_arm946_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(arm946_flush_icache_all)
+SYM_TYPED_FUNC_START(arm946_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(arm946_flush_icache_all)
+SYM_FUNC_END(arm946_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
  */
-ENTRY(arm946_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm946_flush_user_cache_all)
+	b	arm946_flush_kern_cache_all
+SYM_FUNC_END(arm946_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(arm946_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(arm946_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -114,6 +116,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c5, 0		@ flush I cache
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm946_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -126,7 +129,7 @@ __flush_whole_cache:
  *	- flags	- vm_flags describing address space
  * (same as arm926)
  */
-ENTRY(arm946_flush_user_cache_range)
+SYM_TYPED_FUNC_START(arm946_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -153,6 +156,7 @@ ENTRY(arm946_flush_user_cache_range)
 	tst	r2, #VM_EXEC
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm946_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -164,8 +168,9 @@ ENTRY(arm946_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(arm946_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(arm946_coherent_kern_range)
+	b	arm946_coherent_user_range
+SYM_FUNC_END(arm946_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -178,7 +183,7 @@ ENTRY(arm946_coherent_kern_range)
  *	- end	- virtual end address
  * (same as arm926)
  */
-ENTRY(arm946_coherent_user_range)
+SYM_TYPED_FUNC_START(arm946_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
@@ -188,6 +193,7 @@ ENTRY(arm946_coherent_user_range)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(arm946_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -199,7 +205,7 @@ ENTRY(arm946_coherent_user_range)
  *	- size	- region size
  * (same as arm926)
  */
-ENTRY(arm946_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(arm946_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -209,6 +215,7 @@ ENTRY(arm946_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm946_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -268,7 +275,7 @@ arm946_dma_clean_range:
  *
  * (same as arm926)
  */
-ENTRY(arm946_dma_flush_range)
+SYM_TYPED_FUNC_START(arm946_dma_flush_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
@@ -281,6 +288,7 @@ ENTRY(arm946_dma_flush_range)
 	blo	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(arm946_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -288,13 +296,13 @@ ENTRY(arm946_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm946_dma_map_area)
+SYM_TYPED_FUNC_START(arm946_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	arm946_dma_clean_range
 	bcs	arm946_dma_inv_range
 	b	arm946_dma_flush_range
-ENDPROC(arm946_dma_map_area)
+SYM_FUNC_END(arm946_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -302,9 +310,9 @@ ENDPROC(arm946_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(arm946_dma_unmap_area)
+SYM_TYPED_FUNC_START(arm946_dma_unmap_area)
 	ret	lr
-ENDPROC(arm946_dma_unmap_area)
+SYM_FUNC_END(arm946_dma_unmap_area)
 
 	.globl	arm946_flush_kern_cache_louis
 	.equ	arm946_flush_kern_cache_louis, arm946_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index 072ff9b451f8..ee936c23cac5 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -8,6 +8,7 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -122,11 +123,11 @@ ENTRY(cpu_feroceon_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(feroceon_flush_icache_all)
+SYM_TYPED_FUNC_START(feroceon_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(feroceon_flush_icache_all)
+SYM_FUNC_END(feroceon_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -135,15 +136,16 @@ ENDPROC(feroceon_flush_icache_all)
  *	address space.
  */
 	.align	5
-ENTRY(feroceon_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(feroceon_flush_user_cache_all)
+	b	feroceon_flush_kern_cache_all
+SYM_FUNC_END(feroceon_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(feroceon_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(feroceon_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 
 __flush_whole_cache:
@@ -161,6 +163,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c5, 0		@ invalidate I cache
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(feroceon_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -173,7 +176,7 @@ __flush_whole_cache:
  *	- flags	- vm_flags describing address space
  */
 	.align	5
-ENTRY(feroceon_flush_user_cache_range)
+SYM_TYPED_FUNC_START(feroceon_flush_user_cache_range)
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
 	bgt	__flush_whole_cache
@@ -190,6 +193,7 @@ ENTRY(feroceon_flush_user_cache_range)
 	mov	ip, #0
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(feroceon_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -202,8 +206,9 @@ ENTRY(feroceon_flush_user_cache_range)
  *	- end	- virtual end address
  */
 	.align	5
-ENTRY(feroceon_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(feroceon_coherent_kern_range)
+	b	feroceon_coherent_user_range
+SYM_FUNC_END(feroceon_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -215,7 +220,7 @@ ENTRY(feroceon_coherent_kern_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(feroceon_coherent_user_range)
+SYM_TYPED_FUNC_START(feroceon_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
@@ -225,6 +230,7 @@ ENTRY(feroceon_coherent_user_range)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(feroceon_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -236,7 +242,7 @@ ENTRY(feroceon_coherent_user_range)
  *	- size	- region size
  */
 	.align	5
-ENTRY(feroceon_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(feroceon_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -246,9 +252,10 @@ ENTRY(feroceon_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(feroceon_flush_kern_dcache_area)
 
 	.align	5
-ENTRY(feroceon_range_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(feroceon_range_flush_kern_dcache_area)
 	mrs	r2, cpsr
 	add	r1, r0, #PAGE_SZ - CACHE_DLINESIZE	@ top addr is inclusive
 	orr	r3, r2, #PSR_I_BIT
@@ -260,6 +267,7 @@ ENTRY(feroceon_range_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(feroceon_range_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -346,7 +354,7 @@ feroceon_range_dma_clean_range:
  *	- end	- virtual end address
  */
 	.align	5
-ENTRY(feroceon_dma_flush_range)
+SYM_TYPED_FUNC_START(feroceon_dma_flush_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -354,9 +362,10 @@ ENTRY(feroceon_dma_flush_range)
 	blo	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(feroceon_dma_flush_range)
 
 	.align	5
-ENTRY(feroceon_range_dma_flush_range)
+SYM_TYPED_FUNC_START(feroceon_range_dma_flush_range)
 	mrs	r2, cpsr
 	cmp	r1, r0
 	subne	r1, r1, #1			@ top address is inclusive
@@ -367,6 +376,7 @@ ENTRY(feroceon_range_dma_flush_range)
 	msr	cpsr_c, r2			@ restore interrupts
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(feroceon_range_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -374,13 +384,13 @@ ENTRY(feroceon_range_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(feroceon_dma_map_area)
+SYM_TYPED_FUNC_START(feroceon_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	feroceon_dma_clean_range
 	bcs	feroceon_dma_inv_range
 	b	feroceon_dma_flush_range
-ENDPROC(feroceon_dma_map_area)
+SYM_FUNC_END(feroceon_dma_map_area)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -388,13 +398,13 @@ ENDPROC(feroceon_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(feroceon_range_dma_map_area)
+SYM_TYPED_FUNC_START(feroceon_range_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	feroceon_range_dma_clean_range
 	bcs	feroceon_range_dma_inv_range
 	b	feroceon_range_dma_flush_range
-ENDPROC(feroceon_range_dma_map_area)
+SYM_FUNC_END(feroceon_range_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -402,9 +412,9 @@ ENDPROC(feroceon_range_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(feroceon_dma_unmap_area)
+SYM_TYPED_FUNC_START(feroceon_dma_unmap_area)
 	ret	lr
-ENDPROC(feroceon_dma_unmap_area)
+SYM_FUNC_END(feroceon_dma_unmap_area)
 
 	.globl	feroceon_flush_kern_cache_louis
 	.equ	feroceon_flush_kern_cache_louis, feroceon_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 1645ccaffe96..519b7ff2c589 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -9,6 +9,7 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -87,11 +88,11 @@ ENTRY(cpu_mohawk_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(mohawk_flush_icache_all)
+SYM_TYPED_FUNC_START(mohawk_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(mohawk_flush_icache_all)
+SYM_FUNC_END(mohawk_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -99,15 +100,16 @@ ENDPROC(mohawk_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular
  *	address space.
  */
-ENTRY(mohawk_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(mohawk_flush_user_cache_all)
+	b	mohawk_flush_kern_cache_all
+SYM_FUNC_END(mohawk_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(mohawk_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(mohawk_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -116,6 +118,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c5, 0		@ invalidate I cache
 	mcrne	p15, 0, ip, c7, c10, 0		@ drain write buffer
 	ret	lr
+SYM_FUNC_END(mohawk_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, flags)
@@ -129,7 +132,7 @@ __flush_whole_cache:
  *
  * (same as arm926)
  */
-ENTRY(mohawk_flush_user_cache_range)
+SYM_TYPED_FUNC_START(mohawk_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #CACHE_DLIMIT
@@ -146,6 +149,7 @@ ENTRY(mohawk_flush_user_cache_range)
 	tst	r2, #VM_EXEC
 	mcrne	p15, 0, ip, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(mohawk_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -157,8 +161,9 @@ ENTRY(mohawk_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(mohawk_coherent_kern_range)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(mohawk_coherent_kern_range)
+	b	mohawk_coherent_user_range
+SYM_FUNC_END(mohawk_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -172,7 +177,7 @@ ENTRY(mohawk_coherent_kern_range)
  *
  * (same as arm926)
  */
-ENTRY(mohawk_coherent_user_range)
+SYM_TYPED_FUNC_START(mohawk_coherent_user_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c5, 1		@ invalidate I entry
@@ -182,6 +187,7 @@ ENTRY(mohawk_coherent_user_range)
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	mov	r0, #0
 	ret	lr
+SYM_FUNC_END(mohawk_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -192,7 +198,7 @@ ENTRY(mohawk_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(mohawk_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(mohawk_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
 	add	r0, r0, #CACHE_DLINESIZE
@@ -202,6 +208,7 @@ ENTRY(mohawk_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(mohawk_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -256,7 +263,7 @@ mohawk_dma_clean_range:
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-ENTRY(mohawk_dma_flush_range)
+SYM_TYPED_FUNC_START(mohawk_dma_flush_range)
 	bic	r0, r0, #CACHE_DLINESIZE - 1
 1:
 	mcr	p15, 0, r0, c7, c14, 1		@ clean+invalidate D entry
@@ -265,6 +272,7 @@ ENTRY(mohawk_dma_flush_range)
 	blo	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ drain WB
 	ret	lr
+SYM_FUNC_END(mohawk_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -272,13 +280,13 @@ ENTRY(mohawk_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(mohawk_dma_map_area)
+SYM_TYPED_FUNC_START(mohawk_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	mohawk_dma_clean_range
 	bcs	mohawk_dma_inv_range
 	b	mohawk_dma_flush_range
-ENDPROC(mohawk_dma_map_area)
+SYM_FUNC_END(mohawk_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -286,9 +294,9 @@ ENDPROC(mohawk_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(mohawk_dma_unmap_area)
+SYM_TYPED_FUNC_START(mohawk_dma_unmap_area)
 	ret	lr
-ENDPROC(mohawk_dma_unmap_area)
+SYM_FUNC_END(mohawk_dma_unmap_area)
 
 	.globl	mohawk_flush_kern_cache_louis
 	.equ	mohawk_flush_kern_cache_louis, mohawk_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index a17afe7e195a..f08b3fce4c95 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -23,6 +23,7 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -144,11 +145,11 @@ ENTRY(cpu_xsc3_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(xsc3_flush_icache_all)
+SYM_TYPED_FUNC_START(xsc3_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(xsc3_flush_icache_all)
+SYM_FUNC_END(xsc3_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -156,15 +157,16 @@ ENDPROC(xsc3_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(xsc3_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(xsc3_flush_user_cache_all)
+	b	xsc3_flush_kern_cache_all
+SYM_FUNC_END(xsc3_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(xsc3_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(xsc3_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -174,6 +176,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c10, 4		@ data write barrier
 	mcrne	p15, 0, ip, c7, c5, 4		@ prefetch flush
 	ret	lr
+SYM_FUNC_END(xsc3_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, vm_flags)
@@ -186,7 +189,7 @@ __flush_whole_cache:
  *	- vma	- vma_area_struct describing address space
  */
 	.align	5
-ENTRY(xsc3_flush_user_cache_range)
+SYM_TYPED_FUNC_START(xsc3_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #MAX_AREA_SIZE
@@ -203,6 +206,7 @@ ENTRY(xsc3_flush_user_cache_range)
 	mcrne	p15, 0, ip, c7, c10, 4		@ data write barrier
 	mcrne	p15, 0, ip, c7, c5, 4		@ prefetch flush
 	ret	lr
+SYM_FUNC_END(xsc3_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -217,9 +221,11 @@ ENTRY(xsc3_flush_user_cache_range)
  *	Note: single I-cache line invalidation isn't used here since
  *	it also trashes the mini I-cache used by JTAG debuggers.
  */
-ENTRY(xsc3_coherent_kern_range)
-/* FALLTHROUGH */
-ENTRY(xsc3_coherent_user_range)
+SYM_TYPED_FUNC_START(xsc3_coherent_kern_range)
+	b	xsc3_coherent_user_range
+SYM_FUNC_END(xsc3_coherent_kern_range)
+
+SYM_TYPED_FUNC_START(xsc3_coherent_user_range)
 	bic	r0, r0, #CACHELINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean L1 D line
 	add	r0, r0, #CACHELINESIZE
@@ -230,6 +236,7 @@ ENTRY(xsc3_coherent_user_range)
 	mcr	p15, 0, r0, c7, c10, 4		@ data write barrier
 	mcr	p15, 0, r0, c7, c5, 4		@ prefetch flush
 	ret	lr
+SYM_FUNC_END(xsc3_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -240,7 +247,7 @@ ENTRY(xsc3_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(xsc3_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(xsc3_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean/invalidate L1 D line
 	add	r0, r0, #CACHELINESIZE
@@ -251,6 +258,7 @@ ENTRY(xsc3_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c10, 4		@ data write barrier
 	mcr	p15, 0, r0, c7, c5, 4		@ prefetch flush
 	ret	lr
+SYM_FUNC_END(xsc3_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -301,7 +309,7 @@ xsc3_dma_clean_range:
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(xsc3_dma_flush_range)
+SYM_TYPED_FUNC_START(xsc3_dma_flush_range)
 	bic	r0, r0, #CACHELINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c14, 1		@ clean/invalidate L1 D line
 	add	r0, r0, #CACHELINESIZE
@@ -309,6 +317,7 @@ ENTRY(xsc3_dma_flush_range)
 	blo	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ data write barrier
 	ret	lr
+SYM_FUNC_END(xsc3_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -316,13 +325,13 @@ ENTRY(xsc3_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(xsc3_dma_map_area)
+SYM_TYPED_FUNC_START(xsc3_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	xsc3_dma_clean_range
 	bcs	xsc3_dma_inv_range
 	b	xsc3_dma_flush_range
-ENDPROC(xsc3_dma_map_area)
+SYM_FUNC_END(xsc3_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -330,9 +339,9 @@ ENDPROC(xsc3_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(xsc3_dma_unmap_area)
+SYM_TYPED_FUNC_START(xsc3_dma_unmap_area)
 	ret	lr
-ENDPROC(xsc3_dma_unmap_area)
+SYM_FUNC_END(xsc3_dma_unmap_area)
 
 	.globl	xsc3_flush_kern_cache_louis
 	.equ	xsc3_flush_kern_cache_louis, xsc3_flush_kern_cache_all
diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index d82590aa71c0..3e427db18d5b 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -19,6 +19,7 @@
 
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <linux/pgtable.h>
 #include <asm/assembler.h>
 #include <asm/hwcap.h>
@@ -186,11 +187,11 @@ ENTRY(cpu_xscale_do_idle)
  *
  *	Unconditionally clean and invalidate the entire icache.
  */
-ENTRY(xscale_flush_icache_all)
+SYM_TYPED_FUNC_START(xscale_flush_icache_all)
 	mov	r0, #0
 	mcr	p15, 0, r0, c7, c5, 0		@ invalidate I cache
 	ret	lr
-ENDPROC(xscale_flush_icache_all)
+SYM_FUNC_END(xscale_flush_icache_all)
 
 /*
  *	flush_user_cache_all()
@@ -198,15 +199,16 @@ ENDPROC(xscale_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-ENTRY(xscale_flush_user_cache_all)
-	/* FALLTHROUGH */
+SYM_TYPED_FUNC_START(xscale_flush_user_cache_all)
+	b	xscale_flush_kern_cache_all
+SYM_FUNC_END(xscale_flush_user_cache_all)
 
 /*
  *	flush_kern_cache_all()
  *
  *	Clean and invalidate the entire cache.
  */
-ENTRY(xscale_flush_kern_cache_all)
+SYM_TYPED_FUNC_START(xscale_flush_kern_cache_all)
 	mov	r2, #VM_EXEC
 	mov	ip, #0
 __flush_whole_cache:
@@ -215,6 +217,7 @@ __flush_whole_cache:
 	mcrne	p15, 0, ip, c7, c5, 0		@ Invalidate I cache & BTB
 	mcrne	p15, 0, ip, c7, c10, 4		@ Drain Write (& Fill) Buffer
 	ret	lr
+SYM_FUNC_END(xscale_flush_kern_cache_all)
 
 /*
  *	flush_user_cache_range(start, end, vm_flags)
@@ -227,7 +230,7 @@ __flush_whole_cache:
  *	- vma	- vma_area_struct describing address space
  */
 	.align	5
-ENTRY(xscale_flush_user_cache_range)
+SYM_TYPED_FUNC_START(xscale_flush_user_cache_range)
 	mov	ip, #0
 	sub	r3, r1, r0			@ calculate total size
 	cmp	r3, #MAX_AREA_SIZE
@@ -244,6 +247,7 @@ ENTRY(xscale_flush_user_cache_range)
 	mcrne	p15, 0, ip, c7, c5, 6		@ Invalidate BTB
 	mcrne	p15, 0, ip, c7, c10, 4		@ Drain Write (& Fill) Buffer
 	ret	lr
+SYM_FUNC_END(xscale_flush_user_cache_range)
 
 /*
  *	coherent_kern_range(start, end)
@@ -258,7 +262,7 @@ ENTRY(xscale_flush_user_cache_range)
  *	Note: single I-cache line invalidation isn't used here since
  *	it also trashes the mini I-cache used by JTAG debuggers.
  */
-ENTRY(xscale_coherent_kern_range)
+SYM_TYPED_FUNC_START(xscale_coherent_kern_range)
 	bic	r0, r0, #CACHELINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHELINESIZE
@@ -268,6 +272,7 @@ ENTRY(xscale_coherent_kern_range)
 	mcr	p15, 0, r0, c7, c5, 0		@ Invalidate I cache & BTB
 	mcr	p15, 0, r0, c7, c10, 4		@ Drain Write (& Fill) Buffer
 	ret	lr
+SYM_FUNC_END(xscale_coherent_kern_range)
 
 /*
  *	coherent_user_range(start, end)
@@ -279,7 +284,7 @@ ENTRY(xscale_coherent_kern_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(xscale_coherent_user_range)
+SYM_TYPED_FUNC_START(xscale_coherent_user_range)
 	bic	r0, r0, #CACHELINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c5, 1		@ Invalidate I cache entry
@@ -290,6 +295,7 @@ ENTRY(xscale_coherent_user_range)
 	mcr	p15, 0, r0, c7, c5, 6		@ Invalidate BTB
 	mcr	p15, 0, r0, c7, c10, 4		@ Drain Write (& Fill) Buffer
 	ret	lr
+SYM_FUNC_END(xscale_coherent_user_range)
 
 /*
  *	flush_kern_dcache_area(void *addr, size_t size)
@@ -300,7 +306,7 @@ ENTRY(xscale_coherent_user_range)
  *	- addr	- kernel address
  *	- size	- region size
  */
-ENTRY(xscale_flush_kern_dcache_area)
+SYM_TYPED_FUNC_START(xscale_flush_kern_dcache_area)
 	add	r1, r0, r1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c6, 1		@ invalidate D entry
@@ -311,6 +317,7 @@ ENTRY(xscale_flush_kern_dcache_area)
 	mcr	p15, 0, r0, c7, c5, 0		@ Invalidate I cache & BTB
 	mcr	p15, 0, r0, c7, c10, 4		@ Drain Write (& Fill) Buffer
 	ret	lr
+SYM_FUNC_END(xscale_flush_kern_dcache_area)
 
 /*
  *	dma_inv_range(start, end)
@@ -361,7 +368,7 @@ xscale_dma_clean_range:
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-ENTRY(xscale_dma_flush_range)
+SYM_TYPED_FUNC_START(xscale_dma_flush_range)
 	bic	r0, r0, #CACHELINESIZE - 1
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	mcr	p15, 0, r0, c7, c6, 1		@ invalidate D entry
@@ -370,6 +377,7 @@ ENTRY(xscale_dma_flush_range)
 	blo	1b
 	mcr	p15, 0, r0, c7, c10, 4		@ Drain Write (& Fill) Buffer
 	ret	lr
+SYM_FUNC_END(xscale_dma_flush_range)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -377,13 +385,13 @@ ENTRY(xscale_dma_flush_range)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(xscale_dma_map_area)
+SYM_TYPED_FUNC_START(xscale_dma_map_area)
 	add	r1, r1, r0
 	cmp	r2, #DMA_TO_DEVICE
 	beq	xscale_dma_clean_range
 	bcs	xscale_dma_inv_range
 	b	xscale_dma_flush_range
-ENDPROC(xscale_dma_map_area)
+SYM_FUNC_END(xscale_dma_map_area)
 
 /*
  *	dma_map_area(start, size, dir)
@@ -391,12 +399,12 @@ ENDPROC(xscale_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(xscale_80200_A0_A1_dma_map_area)
+SYM_TYPED_FUNC_START(xscale_80200_A0_A1_dma_map_area)
 	add	r1, r1, r0
 	teq	r2, #DMA_TO_DEVICE
 	beq	xscale_dma_clean_range
 	b	xscale_dma_flush_range
-ENDPROC(xscale_80200_A0_A1_dma_map_area)
+SYM_FUNC_END(xscale_80200_A0_A1_dma_map_area)
 
 /*
  *	dma_unmap_area(start, size, dir)
@@ -404,9 +412,9 @@ ENDPROC(xscale_80200_A0_A1_dma_map_area)
  *	- size	- size of region
  *	- dir	- DMA direction
  */
-ENTRY(xscale_dma_unmap_area)
+SYM_TYPED_FUNC_START(xscale_dma_unmap_area)
 	ret	lr
-ENDPROC(xscale_dma_unmap_area)
+SYM_FUNC_END(xscale_dma_unmap_area)
 
 	.globl	xscale_flush_kern_cache_louis
 	.equ	xscale_flush_kern_cache_louis, xscale_flush_kern_cache_all

-- 
2.44.0

