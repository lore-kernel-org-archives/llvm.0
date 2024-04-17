Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A50653
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342672; cv=none; b=IivFjpG9AUDcBmGUGC6QlMR3qywmoyob8NrRm2haUIsIwolKrn5MOu+R/9wwx5GVlvG+cyo1saNPQc+qMZ35u+4jqRKJUY5NghNjczswsN6Pl2qBxVjRRLfRVLjBIme44OOCt03lAVeTq/3kCS7gMtyemdX5kMrzWKZc58H1kA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342672; c=relaxed/simple;
	bh=SH/EfGp7EaQQjMzvWoZDREv7Maa+bN4A/27QIZkw+zQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5A2izkYMJLpAC+KM7F0uayKniDtcmFpLLHhWeO7NC/hF9ntS8AwdprCuTcq0LgtL0H0vOv4EUi0zf3S58qnwzNiCBcimSM5x+oJ9oprH7M28CVPeBUHVs0PHV7UNaS2EZK1LmkqIbLkK/ccyoJYO4O6MvSKIhELI7MNB/Ucgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Onydb7QH; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Onydb7QH"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d756eb74so6602844e87.3
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342667; x=1713947467; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rmUoilvRHDOfrOC8IoOhQyzd0IjuLq/jUsxEzabH94=;
        b=Onydb7QHZ/bRMiBTrL2AY/xJQptI+xX6VBFg60/vPQLmYESAlXYuCPzc0WYMBqb9Ft
         U2OhN5HlpoZQmMC6BSzjlJHFTYVrxwc8zGsNULSt4FgJbSpzC/vabyY16NVyfb9dr4g6
         x+7HhMkPWkr+mEJ8AtfiAdCGWRA2XD2MRv+7PDAY4ZfXujj6B1Wug8WOFxzKQr/khvHI
         w6PD3/Xe3HlimDSvGyvmbDNi6eGmvdPpFmL5SKXKuJ1pvYqMcjkFOgsspKcyjrhpwWk7
         8SMkayTXBd/N4kwvucBW733kWVTlUf7dgOaiXh2EwXc14eZJqm2Sfw+zrkSSubdnRf98
         whDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342667; x=1713947467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rmUoilvRHDOfrOC8IoOhQyzd0IjuLq/jUsxEzabH94=;
        b=MYkblxt7ES75vQmSTQHAiDe9O+okJJW8JTjuod7eBLOajmCL00JQQefzxgfnbncCUo
         7q5qx1V6xFcfDlTVuTa38dkmV7B0t48BaGRNEx4hqOSxJ736qd/fBNarZgYPTmzwtY2a
         i9PHx+I+OXKu+x/gVVojXYUIINuGgOt5Y/r53Uzcb1FTU3xpJicckgPSLjav3b7Fej9E
         YDI9JhM9ENxUGtczczZl7Gl3aSM26X/G+QKwwXqkqn85Lmp+njGN8MB/aUsgBAzcrRqY
         hoc4pTrN/GL4fB3v07HfD/kQcGHEguE2TjVto9YLMhJMOWldT8NIIyn7OG2C1waLf74W
         Rxtg==
X-Forwarded-Encrypted: i=1; AJvYcCVbsZ9/3VbjqQjgIyyz0LrWAS5F3TUq0nxY5ONDDqYMWl2pz/RNEdpb8hwLQvzTRG/KYnVyxJDzdOQCUTyBD8b8pCHl2w==
X-Gm-Message-State: AOJu0Yxh7xiNPCU2fU34zdDqx3CbFrPjC/bUL+IALnDhHtasBhQbsnpz
	Hv6ZR/SouIrZrSDqGWUtqMOH0W3VLZpMpfUg8qnK/h0aWJFseQNzaMy3cNGaohk=
X-Google-Smtp-Source: AGHT+IECvH16oAZV447mEfcLi4j4yO98HTdwBcgoIVgB+Fmaeykb8zdoObEKhRrYV88TWpCkYmU24A==
X-Received: by 2002:ac2:464a:0:b0:518:9950:9079 with SMTP id s10-20020ac2464a000000b0051899509079mr8700605lfo.2.1713342666827;
        Wed, 17 Apr 2024 01:31:06 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:31:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:30:55 +0200
Subject: [PATCH v6 06/11] ARM: mm: Rewrite cacheflush vtables in CFI safe C
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-arm32-cfi-v6-6-6486385eb136@linaro.org>
References: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
In-Reply-To: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

Instead of defining all cache flush operations with an assembly
macro in proc-macros.S, provide an explicit struct cpu_cache_fns
for each CPU cache type in mm/cache.c.

As a side effect from rewriting the vtables in C, we can
avoid the aliasing for the "louis" cache callback, instead we
can just assign the NN_flush_kern_cache_all() function to the
louis callback in the C vtable.

As the louis cache callback is called explicitly (not through the
vtable) if we only have one type of cache support compiled in, we
need an ifdef quirk for this in the !MULTI_CACHE case.

Feroceon and XScale have some dma mapping quirk, in this case we
can just define two structs and assign all but one callback to the
main implementation; since each of them invoked define_cache_functions
twice they require MULTI_CACHE by definition so the compiled-in
shortcut is not used on these variants.

Tested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/glue-cache.h |  28 +-
 arch/arm/mm/Makefile              |   1 +
 arch/arm/mm/cache-b15-rac.c       |   1 +
 arch/arm/mm/cache-fa.S            |   8 -
 arch/arm/mm/cache-nop.S           |   8 -
 arch/arm/mm/cache-v4.S            |   8 -
 arch/arm/mm/cache-v4wb.S          |   8 -
 arch/arm/mm/cache-v4wt.S          |   8 -
 arch/arm/mm/cache-v6.S            |   8 -
 arch/arm/mm/cache-v7.S            |  25 --
 arch/arm/mm/cache-v7m.S           |   8 -
 arch/arm/mm/cache.c               | 663 ++++++++++++++++++++++++++++++++++++++
 arch/arm/mm/proc-arm1020.S        |   6 -
 arch/arm/mm/proc-arm1020e.S       |   6 -
 arch/arm/mm/proc-arm1022.S        |   6 -
 arch/arm/mm/proc-arm1026.S        |   6 -
 arch/arm/mm/proc-arm920.S         |   5 -
 arch/arm/mm/proc-arm922.S         |   6 -
 arch/arm/mm/proc-arm925.S         |   6 -
 arch/arm/mm/proc-arm926.S         |   6 -
 arch/arm/mm/proc-arm940.S         |   6 -
 arch/arm/mm/proc-arm946.S         |   6 -
 arch/arm/mm/proc-feroceon.S       |  27 --
 arch/arm/mm/proc-macros.S         |  18 --
 arch/arm/mm/proc-mohawk.S         |   6 -
 arch/arm/mm/proc-xsc3.S           |   6 -
 arch/arm/mm/proc-xscale.S         |  57 +---
 27 files changed, 688 insertions(+), 259 deletions(-)

diff --git a/arch/arm/include/asm/glue-cache.h b/arch/arm/include/asm/glue-cache.h
index 724f8dac1e5b..4186fbf7341f 100644
--- a/arch/arm/include/asm/glue-cache.h
+++ b/arch/arm/include/asm/glue-cache.h
@@ -118,6 +118,10 @@
 # define MULTI_CACHE 1
 #endif
 
+#ifdef CONFIG_CPU_CACHE_NOP
+#  define MULTI_CACHE 1
+#endif
+
 #if defined(CONFIG_CPU_V7M)
 #  define MULTI_CACHE 1
 #endif
@@ -126,29 +130,15 @@
 #error Unknown cache maintenance model
 #endif
 
-#ifndef __ASSEMBLER__
-static inline void nop_flush_icache_all(void) { }
-static inline void nop_flush_kern_cache_all(void) { }
-static inline void nop_flush_kern_cache_louis(void) { }
-static inline void nop_flush_user_cache_all(void) { }
-static inline void nop_flush_user_cache_range(unsigned long a,
-		unsigned long b, unsigned int c) { }
-
-static inline void nop_coherent_kern_range(unsigned long a, unsigned long b) { }
-static inline int nop_coherent_user_range(unsigned long a,
-		unsigned long b) { return 0; }
-static inline void nop_flush_kern_dcache_area(void *a, size_t s) { }
-
-static inline void nop_dma_flush_range(const void *a, const void *b) { }
-
-static inline void nop_dma_map_area(const void *s, size_t l, int f) { }
-static inline void nop_dma_unmap_area(const void *s, size_t l, int f) { }
-#endif
-
 #ifndef MULTI_CACHE
 #define __cpuc_flush_icache_all		__glue(_CACHE,_flush_icache_all)
 #define __cpuc_flush_kern_all		__glue(_CACHE,_flush_kern_cache_all)
+/* This function only has a dedicated assembly callback on the v7 cache */
+#ifdef CONFIG_CPU_CACHE_V7
 #define __cpuc_flush_kern_louis		__glue(_CACHE,_flush_kern_cache_louis)
+#else
+#define __cpuc_flush_kern_louis		__glue(_CACHE,_flush_kern_cache_all)
+#endif
 #define __cpuc_flush_user_all		__glue(_CACHE,_flush_user_cache_all)
 #define __cpuc_flush_user_range		__glue(_CACHE,_flush_user_cache_range)
 #define __cpuc_coherent_kern_range	__glue(_CACHE,_coherent_kern_range)
diff --git a/arch/arm/mm/Makefile b/arch/arm/mm/Makefile
index cc8255fdf56e..17665381be96 100644
--- a/arch/arm/mm/Makefile
+++ b/arch/arm/mm/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_CPU_CACHE_V7)	+= cache-v7.o
 obj-$(CONFIG_CPU_CACHE_FA)	+= cache-fa.o
 obj-$(CONFIG_CPU_CACHE_NOP)	+= cache-nop.o
 obj-$(CONFIG_CPU_CACHE_V7M)	+= cache-v7m.o
+obj-y				+= cache.o
 
 obj-$(CONFIG_CPU_COPY_V4WT)	+= copypage-v4wt.o
 obj-$(CONFIG_CPU_COPY_V4WB)	+= copypage-v4wb.o
diff --git a/arch/arm/mm/cache-b15-rac.c b/arch/arm/mm/cache-b15-rac.c
index 9c1172f26885..6f63b90f9e1a 100644
--- a/arch/arm/mm/cache-b15-rac.c
+++ b/arch/arm/mm/cache-b15-rac.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015-2016 Broadcom
  */
 
+#include <linux/cfi_types.h>
 #include <linux/err.h>
 #include <linux/spinlock.h>
 #include <linux/io.h>
diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index 6fe06608f34e..4610105e058c 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -241,11 +241,3 @@ SYM_FUNC_END(fa_dma_map_area)
 SYM_TYPED_FUNC_START(fa_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(fa_dma_unmap_area)
-
-	.globl	fa_flush_kern_cache_louis
-	.equ	fa_flush_kern_cache_louis, fa_flush_kern_cache_all
-
-	__INITDATA
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions fa
diff --git a/arch/arm/mm/cache-nop.S b/arch/arm/mm/cache-nop.S
index cd191aa90313..f68dde2014ee 100644
--- a/arch/arm/mm/cache-nop.S
+++ b/arch/arm/mm/cache-nop.S
@@ -18,9 +18,6 @@ SYM_TYPED_FUNC_START(nop_flush_kern_cache_all)
 	ret	lr
 SYM_FUNC_END(nop_flush_kern_cache_all)
 
-	.globl nop_flush_kern_cache_louis
-	.equ nop_flush_kern_cache_louis, nop_flush_icache_all
-
 SYM_TYPED_FUNC_START(nop_flush_user_cache_all)
 	ret	lr
 SYM_FUNC_END(nop_flush_user_cache_all)
@@ -50,11 +47,6 @@ SYM_TYPED_FUNC_START(nop_dma_map_area)
 	ret	lr
 SYM_FUNC_END(nop_dma_map_area)
 
-	__INITDATA
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions nop
-
 SYM_TYPED_FUNC_START(nop_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(nop_dma_unmap_area)
diff --git a/arch/arm/mm/cache-v4.S b/arch/arm/mm/cache-v4.S
index f7b7e498d3b6..0df97a610026 100644
--- a/arch/arm/mm/cache-v4.S
+++ b/arch/arm/mm/cache-v4.S
@@ -144,11 +144,3 @@ SYM_FUNC_END(v4_dma_unmap_area)
 SYM_TYPED_FUNC_START(v4_dma_map_area)
 	ret	lr
 SYM_FUNC_END(v4_dma_map_area)
-
-	.globl	v4_flush_kern_cache_louis
-	.equ	v4_flush_kern_cache_louis, v4_flush_kern_cache_all
-
-	__INITDATA
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions v4
diff --git a/arch/arm/mm/cache-v4wb.S b/arch/arm/mm/cache-v4wb.S
index 19fae44b89cd..945a7881cc94 100644
--- a/arch/arm/mm/cache-v4wb.S
+++ b/arch/arm/mm/cache-v4wb.S
@@ -251,11 +251,3 @@ SYM_FUNC_END(v4wb_dma_map_area)
 SYM_TYPED_FUNC_START(v4wb_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(v4wb_dma_unmap_area)
-
-	.globl	v4wb_flush_kern_cache_louis
-	.equ	v4wb_flush_kern_cache_louis, v4wb_flush_kern_cache_all
-
-	__INITDATA
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions v4wb
diff --git a/arch/arm/mm/cache-v4wt.S b/arch/arm/mm/cache-v4wt.S
index 5be76ff861d7..d788962e2ed8 100644
--- a/arch/arm/mm/cache-v4wt.S
+++ b/arch/arm/mm/cache-v4wt.S
@@ -198,11 +198,3 @@ SYM_FUNC_END(v4wt_dma_unmap_area)
 SYM_TYPED_FUNC_START(v4wt_dma_map_area)
 	ret	lr
 SYM_FUNC_END(v4wt_dma_map_area)
-
-	.globl	v4wt_flush_kern_cache_louis
-	.equ	v4wt_flush_kern_cache_louis, v4wt_flush_kern_cache_all
-
-	__INITDATA
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions v4wt
diff --git a/arch/arm/mm/cache-v6.S b/arch/arm/mm/cache-v6.S
index a590044b7282..ebe96d40907a 100644
--- a/arch/arm/mm/cache-v6.S
+++ b/arch/arm/mm/cache-v6.S
@@ -296,11 +296,3 @@ SYM_TYPED_FUNC_START(v6_dma_unmap_area)
 	bne	v6_dma_inv_range
 	ret	lr
 SYM_FUNC_END(v6_dma_unmap_area)
-
-	.globl	v6_flush_kern_cache_louis
-	.equ	v6_flush_kern_cache_louis, v6_flush_kern_cache_all
-
-	__INITDATA
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions v6
diff --git a/arch/arm/mm/cache-v7.S b/arch/arm/mm/cache-v7.S
index 6c0bc756d29a..c0ebe1aa0f02 100644
--- a/arch/arm/mm/cache-v7.S
+++ b/arch/arm/mm/cache-v7.S
@@ -454,28 +454,3 @@ SYM_TYPED_FUNC_START(v7_dma_unmap_area)
 	bne	v7_dma_inv_range
 	ret	lr
 SYM_FUNC_END(v7_dma_unmap_area)
-
-	__INITDATA
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions v7
-
-	/* The Broadcom Brahma-B15 read-ahead cache requires some modifications
-	 * to the v7_cache_fns, we only override the ones we need
-	 */
-#ifndef CONFIG_CACHE_B15_RAC
-	globl_equ	b15_flush_kern_cache_all,	v7_flush_kern_cache_all
-#endif
-	globl_equ	b15_flush_icache_all,		v7_flush_icache_all
-	globl_equ	b15_flush_kern_cache_louis,	v7_flush_kern_cache_louis
-	globl_equ	b15_flush_user_cache_all,	v7_flush_user_cache_all
-	globl_equ	b15_flush_user_cache_range,	v7_flush_user_cache_range
-	globl_equ	b15_coherent_kern_range,	v7_coherent_kern_range
-	globl_equ	b15_coherent_user_range,	v7_coherent_user_range
-	globl_equ	b15_flush_kern_dcache_area,	v7_flush_kern_dcache_area
-
-	globl_equ	b15_dma_map_area,		v7_dma_map_area
-	globl_equ	b15_dma_unmap_area,		v7_dma_unmap_area
-	globl_equ	b15_dma_flush_range,		v7_dma_flush_range
-
-	define_cache_functions b15
diff --git a/arch/arm/mm/cache-v7m.S b/arch/arm/mm/cache-v7m.S
index 5a62b9a224e1..4e670697eabc 100644
--- a/arch/arm/mm/cache-v7m.S
+++ b/arch/arm/mm/cache-v7m.S
@@ -447,11 +447,3 @@ SYM_TYPED_FUNC_START(v7m_dma_unmap_area)
 	bne	v7m_dma_inv_range
 	ret	lr
 SYM_FUNC_END(v7m_dma_unmap_area)
-
-	.globl	v7m_flush_kern_cache_louis
-	.equ	v7m_flush_kern_cache_louis, v7m_flush_kern_cache_all
-
-	__INITDATA
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions v7m
diff --git a/arch/arm/mm/cache.c b/arch/arm/mm/cache.c
new file mode 100644
index 000000000000..e6fbc599c9ed
--- /dev/null
+++ b/arch/arm/mm/cache.c
@@ -0,0 +1,663 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * This file defines C prototypes for the low-level cache assembly functions
+ * and populates a vtable for each selected ARM CPU cache type.
+ */
+
+#include <linux/types.h>
+#include <asm/cacheflush.h>
+
+#ifdef CONFIG_CPU_CACHE_V4
+void v4_flush_icache_all(void);
+void v4_flush_kern_cache_all(void);
+void v4_flush_user_cache_all(void);
+void v4_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void v4_coherent_kern_range(unsigned long, unsigned long);
+int v4_coherent_user_range(unsigned long, unsigned long);
+void v4_flush_kern_dcache_area(void *, size_t);
+void v4_dma_map_area(const void *, size_t, int);
+void v4_dma_unmap_area(const void *, size_t, int);
+void v4_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns v4_cache_fns __initconst = {
+	.flush_icache_all = v4_flush_icache_all,
+	.flush_kern_all = v4_flush_kern_cache_all,
+	.flush_kern_louis = v4_flush_kern_cache_all,
+	.flush_user_all = v4_flush_user_cache_all,
+	.flush_user_range = v4_flush_user_cache_range,
+	.coherent_kern_range = v4_coherent_kern_range,
+	.coherent_user_range = v4_coherent_user_range,
+	.flush_kern_dcache_area = v4_flush_kern_dcache_area,
+	.dma_map_area = v4_dma_map_area,
+	.dma_unmap_area = v4_dma_unmap_area,
+	.dma_flush_range = v4_dma_flush_range,
+};
+#endif
+
+/* V4 write-back cache "V4WB" */
+#ifdef CONFIG_CPU_CACHE_V4WB
+void v4wb_flush_icache_all(void);
+void v4wb_flush_kern_cache_all(void);
+void v4wb_flush_user_cache_all(void);
+void v4wb_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void v4wb_coherent_kern_range(unsigned long, unsigned long);
+int v4wb_coherent_user_range(unsigned long, unsigned long);
+void v4wb_flush_kern_dcache_area(void *, size_t);
+void v4wb_dma_map_area(const void *, size_t, int);
+void v4wb_dma_unmap_area(const void *, size_t, int);
+void v4wb_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns v4wb_cache_fns __initconst = {
+	.flush_icache_all = v4wb_flush_icache_all,
+	.flush_kern_all = v4wb_flush_kern_cache_all,
+	.flush_kern_louis = v4wb_flush_kern_cache_all,
+	.flush_user_all = v4wb_flush_user_cache_all,
+	.flush_user_range = v4wb_flush_user_cache_range,
+	.coherent_kern_range = v4wb_coherent_kern_range,
+	.coherent_user_range = v4wb_coherent_user_range,
+	.flush_kern_dcache_area = v4wb_flush_kern_dcache_area,
+	.dma_map_area = v4wb_dma_map_area,
+	.dma_unmap_area = v4wb_dma_unmap_area,
+	.dma_flush_range = v4wb_dma_flush_range,
+};
+#endif
+
+/* V4 write-through cache "V4WT" */
+#ifdef CONFIG_CPU_CACHE_V4WT
+void v4wt_flush_icache_all(void);
+void v4wt_flush_kern_cache_all(void);
+void v4wt_flush_user_cache_all(void);
+void v4wt_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void v4wt_coherent_kern_range(unsigned long, unsigned long);
+int v4wt_coherent_user_range(unsigned long, unsigned long);
+void v4wt_flush_kern_dcache_area(void *, size_t);
+void v4wt_dma_map_area(const void *, size_t, int);
+void v4wt_dma_unmap_area(const void *, size_t, int);
+void v4wt_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns v4wt_cache_fns __initconst = {
+	.flush_icache_all = v4wt_flush_icache_all,
+	.flush_kern_all = v4wt_flush_kern_cache_all,
+	.flush_kern_louis = v4wt_flush_kern_cache_all,
+	.flush_user_all = v4wt_flush_user_cache_all,
+	.flush_user_range = v4wt_flush_user_cache_range,
+	.coherent_kern_range = v4wt_coherent_kern_range,
+	.coherent_user_range = v4wt_coherent_user_range,
+	.flush_kern_dcache_area = v4wt_flush_kern_dcache_area,
+	.dma_map_area = v4wt_dma_map_area,
+	.dma_unmap_area = v4wt_dma_unmap_area,
+	.dma_flush_range = v4wt_dma_flush_range,
+};
+#endif
+
+/* Faraday FA526 cache */
+#ifdef CONFIG_CPU_CACHE_FA
+void fa_flush_icache_all(void);
+void fa_flush_kern_cache_all(void);
+void fa_flush_user_cache_all(void);
+void fa_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void fa_coherent_kern_range(unsigned long, unsigned long);
+int fa_coherent_user_range(unsigned long, unsigned long);
+void fa_flush_kern_dcache_area(void *, size_t);
+void fa_dma_map_area(const void *, size_t, int);
+void fa_dma_unmap_area(const void *, size_t, int);
+void fa_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns fa_cache_fns __initconst = {
+	.flush_icache_all = fa_flush_icache_all,
+	.flush_kern_all = fa_flush_kern_cache_all,
+	.flush_kern_louis = fa_flush_kern_cache_all,
+	.flush_user_all = fa_flush_user_cache_all,
+	.flush_user_range = fa_flush_user_cache_range,
+	.coherent_kern_range = fa_coherent_kern_range,
+	.coherent_user_range = fa_coherent_user_range,
+	.flush_kern_dcache_area = fa_flush_kern_dcache_area,
+	.dma_map_area = fa_dma_map_area,
+	.dma_unmap_area = fa_dma_unmap_area,
+	.dma_flush_range = fa_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_CACHE_V6
+void v6_flush_icache_all(void);
+void v6_flush_kern_cache_all(void);
+void v6_flush_user_cache_all(void);
+void v6_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void v6_coherent_kern_range(unsigned long, unsigned long);
+int v6_coherent_user_range(unsigned long, unsigned long);
+void v6_flush_kern_dcache_area(void *, size_t);
+void v6_dma_map_area(const void *, size_t, int);
+void v6_dma_unmap_area(const void *, size_t, int);
+void v6_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns v6_cache_fns __initconst = {
+	.flush_icache_all = v6_flush_icache_all,
+	.flush_kern_all = v6_flush_kern_cache_all,
+	.flush_kern_louis = v6_flush_kern_cache_all,
+	.flush_user_all = v6_flush_user_cache_all,
+	.flush_user_range = v6_flush_user_cache_range,
+	.coherent_kern_range = v6_coherent_kern_range,
+	.coherent_user_range = v6_coherent_user_range,
+	.flush_kern_dcache_area = v6_flush_kern_dcache_area,
+	.dma_map_area = v6_dma_map_area,
+	.dma_unmap_area = v6_dma_unmap_area,
+	.dma_flush_range = v6_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_CACHE_V7
+void v7_flush_icache_all(void);
+void v7_flush_kern_cache_all(void);
+void v7_flush_kern_cache_louis(void);
+void v7_flush_user_cache_all(void);
+void v7_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void v7_coherent_kern_range(unsigned long, unsigned long);
+int v7_coherent_user_range(unsigned long, unsigned long);
+void v7_flush_kern_dcache_area(void *, size_t);
+void v7_dma_map_area(const void *, size_t, int);
+void v7_dma_unmap_area(const void *, size_t, int);
+void v7_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns v7_cache_fns __initconst = {
+	.flush_icache_all = v7_flush_icache_all,
+	.flush_kern_all = v7_flush_kern_cache_all,
+	.flush_kern_louis = v7_flush_kern_cache_louis,
+	.flush_user_all = v7_flush_user_cache_all,
+	.flush_user_range = v7_flush_user_cache_range,
+	.coherent_kern_range = v7_coherent_kern_range,
+	.coherent_user_range = v7_coherent_user_range,
+	.flush_kern_dcache_area = v7_flush_kern_dcache_area,
+	.dma_map_area = v7_dma_map_area,
+	.dma_unmap_area = v7_dma_unmap_area,
+	.dma_flush_range = v7_dma_flush_range,
+};
+
+/* Special quirky cache flush function for Broadcom B15 v7 caches */
+void b15_flush_kern_cache_all(void);
+
+struct cpu_cache_fns b15_cache_fns __initconst = {
+	.flush_icache_all = v7_flush_icache_all,
+#ifdef CONFIG_CACHE_B15_RAC
+	.flush_kern_all = b15_flush_kern_cache_all,
+#else
+	.flush_kern_all = v7_flush_kern_cache_all,
+#endif
+	.flush_kern_louis = v7_flush_kern_cache_louis,
+	.flush_user_all = v7_flush_user_cache_all,
+	.flush_user_range = v7_flush_user_cache_range,
+	.coherent_kern_range = v7_coherent_kern_range,
+	.coherent_user_range = v7_coherent_user_range,
+	.flush_kern_dcache_area = v7_flush_kern_dcache_area,
+	.dma_map_area = v7_dma_map_area,
+	.dma_unmap_area = v7_dma_unmap_area,
+	.dma_flush_range = v7_dma_flush_range,
+};
+#endif
+
+/* The NOP cache is just a set of dummy stubs that by definition does nothing */
+#ifdef CONFIG_CPU_CACHE_NOP
+void nop_flush_icache_all(void);
+void nop_flush_kern_cache_all(void);
+void nop_flush_user_cache_all(void);
+void nop_flush_user_cache_range(unsigned long start, unsigned long end, unsigned int flags);
+void nop_coherent_kern_range(unsigned long start, unsigned long end);
+int nop_coherent_user_range(unsigned long, unsigned long);
+void nop_flush_kern_dcache_area(void *kaddr, size_t size);
+void nop_dma_map_area(const void *start, size_t size, int flags);
+void nop_dma_unmap_area(const void *start, size_t size, int flags);
+void nop_dma_flush_range(const void *start, const void *end);
+
+struct cpu_cache_fns nop_cache_fns __initconst = {
+	.flush_icache_all = nop_flush_icache_all,
+	.flush_kern_all = nop_flush_kern_cache_all,
+	.flush_kern_louis = nop_flush_kern_cache_all,
+	.flush_user_all = nop_flush_user_cache_all,
+	.flush_user_range = nop_flush_user_cache_range,
+	.coherent_kern_range = nop_coherent_kern_range,
+	.coherent_user_range = nop_coherent_user_range,
+	.flush_kern_dcache_area = nop_flush_kern_dcache_area,
+	.dma_map_area = nop_dma_map_area,
+	.dma_unmap_area = nop_dma_unmap_area,
+	.dma_flush_range = nop_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_CACHE_V7M
+void v7m_flush_icache_all(void);
+void v7m_flush_kern_cache_all(void);
+void v7m_flush_user_cache_all(void);
+void v7m_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void v7m_coherent_kern_range(unsigned long, unsigned long);
+int v7m_coherent_user_range(unsigned long, unsigned long);
+void v7m_flush_kern_dcache_area(void *, size_t);
+void v7m_dma_map_area(const void *, size_t, int);
+void v7m_dma_unmap_area(const void *, size_t, int);
+void v7m_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns v7m_cache_fns __initconst = {
+	.flush_icache_all = v7m_flush_icache_all,
+	.flush_kern_all = v7m_flush_kern_cache_all,
+	.flush_kern_louis = v7m_flush_kern_cache_all,
+	.flush_user_all = v7m_flush_user_cache_all,
+	.flush_user_range = v7m_flush_user_cache_range,
+	.coherent_kern_range = v7m_coherent_kern_range,
+	.coherent_user_range = v7m_coherent_user_range,
+	.flush_kern_dcache_area = v7m_flush_kern_dcache_area,
+	.dma_map_area = v7m_dma_map_area,
+	.dma_unmap_area = v7m_dma_unmap_area,
+	.dma_flush_range = v7m_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_ARM1020
+void arm1020_flush_icache_all(void);
+void arm1020_flush_kern_cache_all(void);
+void arm1020_flush_user_cache_all(void);
+void arm1020_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm1020_coherent_kern_range(unsigned long, unsigned long);
+int arm1020_coherent_user_range(unsigned long, unsigned long);
+void arm1020_flush_kern_dcache_area(void *, size_t);
+void arm1020_dma_map_area(const void *, size_t, int);
+void arm1020_dma_unmap_area(const void *, size_t, int);
+void arm1020_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm1020_cache_fns __initconst = {
+	.flush_icache_all = arm1020_flush_icache_all,
+	.flush_kern_all = arm1020_flush_kern_cache_all,
+	.flush_kern_louis = arm1020_flush_kern_cache_all,
+	.flush_user_all = arm1020_flush_user_cache_all,
+	.flush_user_range = arm1020_flush_user_cache_range,
+	.coherent_kern_range = arm1020_coherent_kern_range,
+	.coherent_user_range = arm1020_coherent_user_range,
+	.flush_kern_dcache_area = arm1020_flush_kern_dcache_area,
+	.dma_map_area = arm1020_dma_map_area,
+	.dma_unmap_area = arm1020_dma_unmap_area,
+	.dma_flush_range = arm1020_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_ARM1020E
+void arm1020e_flush_icache_all(void);
+void arm1020e_flush_kern_cache_all(void);
+void arm1020e_flush_user_cache_all(void);
+void arm1020e_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm1020e_coherent_kern_range(unsigned long, unsigned long);
+int arm1020e_coherent_user_range(unsigned long, unsigned long);
+void arm1020e_flush_kern_dcache_area(void *, size_t);
+void arm1020e_dma_map_area(const void *, size_t, int);
+void arm1020e_dma_unmap_area(const void *, size_t, int);
+void arm1020e_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm1020e_cache_fns __initconst = {
+	.flush_icache_all = arm1020e_flush_icache_all,
+	.flush_kern_all = arm1020e_flush_kern_cache_all,
+	.flush_kern_louis = arm1020e_flush_kern_cache_all,
+	.flush_user_all = arm1020e_flush_user_cache_all,
+	.flush_user_range = arm1020e_flush_user_cache_range,
+	.coherent_kern_range = arm1020e_coherent_kern_range,
+	.coherent_user_range = arm1020e_coherent_user_range,
+	.flush_kern_dcache_area = arm1020e_flush_kern_dcache_area,
+	.dma_map_area = arm1020e_dma_map_area,
+	.dma_unmap_area = arm1020e_dma_unmap_area,
+	.dma_flush_range = arm1020e_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_ARM1022
+void arm1022_flush_icache_all(void);
+void arm1022_flush_kern_cache_all(void);
+void arm1022_flush_user_cache_all(void);
+void arm1022_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm1022_coherent_kern_range(unsigned long, unsigned long);
+int arm1022_coherent_user_range(unsigned long, unsigned long);
+void arm1022_flush_kern_dcache_area(void *, size_t);
+void arm1022_dma_map_area(const void *, size_t, int);
+void arm1022_dma_unmap_area(const void *, size_t, int);
+void arm1022_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm1022_cache_fns __initconst = {
+	.flush_icache_all = arm1022_flush_icache_all,
+	.flush_kern_all = arm1022_flush_kern_cache_all,
+	.flush_kern_louis = arm1022_flush_kern_cache_all,
+	.flush_user_all = arm1022_flush_user_cache_all,
+	.flush_user_range = arm1022_flush_user_cache_range,
+	.coherent_kern_range = arm1022_coherent_kern_range,
+	.coherent_user_range = arm1022_coherent_user_range,
+	.flush_kern_dcache_area = arm1022_flush_kern_dcache_area,
+	.dma_map_area = arm1022_dma_map_area,
+	.dma_unmap_area = arm1022_dma_unmap_area,
+	.dma_flush_range = arm1022_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_ARM1026
+void arm1026_flush_icache_all(void);
+void arm1026_flush_kern_cache_all(void);
+void arm1026_flush_user_cache_all(void);
+void arm1026_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm1026_coherent_kern_range(unsigned long, unsigned long);
+int arm1026_coherent_user_range(unsigned long, unsigned long);
+void arm1026_flush_kern_dcache_area(void *, size_t);
+void arm1026_dma_map_area(const void *, size_t, int);
+void arm1026_dma_unmap_area(const void *, size_t, int);
+void arm1026_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm1026_cache_fns __initconst = {
+	.flush_icache_all = arm1026_flush_icache_all,
+	.flush_kern_all = arm1026_flush_kern_cache_all,
+	.flush_kern_louis = arm1026_flush_kern_cache_all,
+	.flush_user_all = arm1026_flush_user_cache_all,
+	.flush_user_range = arm1026_flush_user_cache_range,
+	.coherent_kern_range = arm1026_coherent_kern_range,
+	.coherent_user_range = arm1026_coherent_user_range,
+	.flush_kern_dcache_area = arm1026_flush_kern_dcache_area,
+	.dma_map_area = arm1026_dma_map_area,
+	.dma_unmap_area = arm1026_dma_unmap_area,
+	.dma_flush_range = arm1026_dma_flush_range,
+};
+#endif
+
+#if defined(CONFIG_CPU_ARM920T) && !defined(CONFIG_CPU_DCACHE_WRITETHROUGH)
+void arm920_flush_icache_all(void);
+void arm920_flush_kern_cache_all(void);
+void arm920_flush_user_cache_all(void);
+void arm920_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm920_coherent_kern_range(unsigned long, unsigned long);
+int arm920_coherent_user_range(unsigned long, unsigned long);
+void arm920_flush_kern_dcache_area(void *, size_t);
+void arm920_dma_map_area(const void *, size_t, int);
+void arm920_dma_unmap_area(const void *, size_t, int);
+void arm920_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm920_cache_fns __initconst = {
+	.flush_icache_all = arm920_flush_icache_all,
+	.flush_kern_all = arm920_flush_kern_cache_all,
+	.flush_kern_louis = arm920_flush_kern_cache_all,
+	.flush_user_all = arm920_flush_user_cache_all,
+	.flush_user_range = arm920_flush_user_cache_range,
+	.coherent_kern_range = arm920_coherent_kern_range,
+	.coherent_user_range = arm920_coherent_user_range,
+	.flush_kern_dcache_area = arm920_flush_kern_dcache_area,
+	.dma_map_area = arm920_dma_map_area,
+	.dma_unmap_area = arm920_dma_unmap_area,
+	.dma_flush_range = arm920_dma_flush_range,
+};
+#endif
+
+#if defined(CONFIG_CPU_ARM922T) && !defined(CONFIG_CPU_DCACHE_WRITETHROUGH)
+void arm922_flush_icache_all(void);
+void arm922_flush_kern_cache_all(void);
+void arm922_flush_user_cache_all(void);
+void arm922_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm922_coherent_kern_range(unsigned long, unsigned long);
+int arm922_coherent_user_range(unsigned long, unsigned long);
+void arm922_flush_kern_dcache_area(void *, size_t);
+void arm922_dma_map_area(const void *, size_t, int);
+void arm922_dma_unmap_area(const void *, size_t, int);
+void arm922_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm922_cache_fns __initconst = {
+	.flush_icache_all = arm922_flush_icache_all,
+	.flush_kern_all = arm922_flush_kern_cache_all,
+	.flush_kern_louis = arm922_flush_kern_cache_all,
+	.flush_user_all = arm922_flush_user_cache_all,
+	.flush_user_range = arm922_flush_user_cache_range,
+	.coherent_kern_range = arm922_coherent_kern_range,
+	.coherent_user_range = arm922_coherent_user_range,
+	.flush_kern_dcache_area = arm922_flush_kern_dcache_area,
+	.dma_map_area = arm922_dma_map_area,
+	.dma_unmap_area = arm922_dma_unmap_area,
+	.dma_flush_range = arm922_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_ARM925T
+void arm925_flush_icache_all(void);
+void arm925_flush_kern_cache_all(void);
+void arm925_flush_user_cache_all(void);
+void arm925_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm925_coherent_kern_range(unsigned long, unsigned long);
+int arm925_coherent_user_range(unsigned long, unsigned long);
+void arm925_flush_kern_dcache_area(void *, size_t);
+void arm925_dma_map_area(const void *, size_t, int);
+void arm925_dma_unmap_area(const void *, size_t, int);
+void arm925_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm925_cache_fns __initconst = {
+	.flush_icache_all = arm925_flush_icache_all,
+	.flush_kern_all = arm925_flush_kern_cache_all,
+	.flush_kern_louis = arm925_flush_kern_cache_all,
+	.flush_user_all = arm925_flush_user_cache_all,
+	.flush_user_range = arm925_flush_user_cache_range,
+	.coherent_kern_range = arm925_coherent_kern_range,
+	.coherent_user_range = arm925_coherent_user_range,
+	.flush_kern_dcache_area = arm925_flush_kern_dcache_area,
+	.dma_map_area = arm925_dma_map_area,
+	.dma_unmap_area = arm925_dma_unmap_area,
+	.dma_flush_range = arm925_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_ARM926T
+void arm926_flush_icache_all(void);
+void arm926_flush_kern_cache_all(void);
+void arm926_flush_user_cache_all(void);
+void arm926_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm926_coherent_kern_range(unsigned long, unsigned long);
+int arm926_coherent_user_range(unsigned long, unsigned long);
+void arm926_flush_kern_dcache_area(void *, size_t);
+void arm926_dma_map_area(const void *, size_t, int);
+void arm926_dma_unmap_area(const void *, size_t, int);
+void arm926_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm926_cache_fns __initconst = {
+	.flush_icache_all = arm926_flush_icache_all,
+	.flush_kern_all = arm926_flush_kern_cache_all,
+	.flush_kern_louis = arm926_flush_kern_cache_all,
+	.flush_user_all = arm926_flush_user_cache_all,
+	.flush_user_range = arm926_flush_user_cache_range,
+	.coherent_kern_range = arm926_coherent_kern_range,
+	.coherent_user_range = arm926_coherent_user_range,
+	.flush_kern_dcache_area = arm926_flush_kern_dcache_area,
+	.dma_map_area = arm926_dma_map_area,
+	.dma_unmap_area = arm926_dma_unmap_area,
+	.dma_flush_range = arm926_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_ARM940T
+void arm940_flush_icache_all(void);
+void arm940_flush_kern_cache_all(void);
+void arm940_flush_user_cache_all(void);
+void arm940_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm940_coherent_kern_range(unsigned long, unsigned long);
+int arm940_coherent_user_range(unsigned long, unsigned long);
+void arm940_flush_kern_dcache_area(void *, size_t);
+void arm940_dma_map_area(const void *, size_t, int);
+void arm940_dma_unmap_area(const void *, size_t, int);
+void arm940_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm940_cache_fns __initconst = {
+	.flush_icache_all = arm940_flush_icache_all,
+	.flush_kern_all = arm940_flush_kern_cache_all,
+	.flush_kern_louis = arm940_flush_kern_cache_all,
+	.flush_user_all = arm940_flush_user_cache_all,
+	.flush_user_range = arm940_flush_user_cache_range,
+	.coherent_kern_range = arm940_coherent_kern_range,
+	.coherent_user_range = arm940_coherent_user_range,
+	.flush_kern_dcache_area = arm940_flush_kern_dcache_area,
+	.dma_map_area = arm940_dma_map_area,
+	.dma_unmap_area = arm940_dma_unmap_area,
+	.dma_flush_range = arm940_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_ARM946E
+void arm946_flush_icache_all(void);
+void arm946_flush_kern_cache_all(void);
+void arm946_flush_user_cache_all(void);
+void arm946_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void arm946_coherent_kern_range(unsigned long, unsigned long);
+int arm946_coherent_user_range(unsigned long, unsigned long);
+void arm946_flush_kern_dcache_area(void *, size_t);
+void arm946_dma_map_area(const void *, size_t, int);
+void arm946_dma_unmap_area(const void *, size_t, int);
+void arm946_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns arm946_cache_fns __initconst = {
+	.flush_icache_all = arm946_flush_icache_all,
+	.flush_kern_all = arm946_flush_kern_cache_all,
+	.flush_kern_louis = arm946_flush_kern_cache_all,
+	.flush_user_all = arm946_flush_user_cache_all,
+	.flush_user_range = arm946_flush_user_cache_range,
+	.coherent_kern_range = arm946_coherent_kern_range,
+	.coherent_user_range = arm946_coherent_user_range,
+	.flush_kern_dcache_area = arm946_flush_kern_dcache_area,
+	.dma_map_area = arm946_dma_map_area,
+	.dma_unmap_area = arm946_dma_unmap_area,
+	.dma_flush_range = arm946_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_XSCALE
+void xscale_flush_icache_all(void);
+void xscale_flush_kern_cache_all(void);
+void xscale_flush_user_cache_all(void);
+void xscale_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void xscale_coherent_kern_range(unsigned long, unsigned long);
+int xscale_coherent_user_range(unsigned long, unsigned long);
+void xscale_flush_kern_dcache_area(void *, size_t);
+void xscale_dma_map_area(const void *, size_t, int);
+void xscale_dma_unmap_area(const void *, size_t, int);
+void xscale_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns xscale_cache_fns __initconst = {
+	.flush_icache_all = xscale_flush_icache_all,
+	.flush_kern_all = xscale_flush_kern_cache_all,
+	.flush_kern_louis = xscale_flush_kern_cache_all,
+	.flush_user_all = xscale_flush_user_cache_all,
+	.flush_user_range = xscale_flush_user_cache_range,
+	.coherent_kern_range = xscale_coherent_kern_range,
+	.coherent_user_range = xscale_coherent_user_range,
+	.flush_kern_dcache_area = xscale_flush_kern_dcache_area,
+	.dma_map_area = xscale_dma_map_area,
+	.dma_unmap_area = xscale_dma_unmap_area,
+	.dma_flush_range = xscale_dma_flush_range,
+};
+
+/* The 80200 A0 and A1 need a special quirk for dma_map_area() */
+void xscale_80200_A0_A1_dma_map_area(const void *, size_t, int);
+
+struct cpu_cache_fns xscale_80200_A0_A1_cache_fns __initconst = {
+	.flush_icache_all = xscale_flush_icache_all,
+	.flush_kern_all = xscale_flush_kern_cache_all,
+	.flush_kern_louis = xscale_flush_kern_cache_all,
+	.flush_user_all = xscale_flush_user_cache_all,
+	.flush_user_range = xscale_flush_user_cache_range,
+	.coherent_kern_range = xscale_coherent_kern_range,
+	.coherent_user_range = xscale_coherent_user_range,
+	.flush_kern_dcache_area = xscale_flush_kern_dcache_area,
+	.dma_map_area = xscale_80200_A0_A1_dma_map_area,
+	.dma_unmap_area = xscale_dma_unmap_area,
+	.dma_flush_range = xscale_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_XSC3
+void xsc3_flush_icache_all(void);
+void xsc3_flush_kern_cache_all(void);
+void xsc3_flush_user_cache_all(void);
+void xsc3_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void xsc3_coherent_kern_range(unsigned long, unsigned long);
+int xsc3_coherent_user_range(unsigned long, unsigned long);
+void xsc3_flush_kern_dcache_area(void *, size_t);
+void xsc3_dma_map_area(const void *, size_t, int);
+void xsc3_dma_unmap_area(const void *, size_t, int);
+void xsc3_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns xsc3_cache_fns __initconst = {
+	.flush_icache_all = xsc3_flush_icache_all,
+	.flush_kern_all = xsc3_flush_kern_cache_all,
+	.flush_kern_louis = xsc3_flush_kern_cache_all,
+	.flush_user_all = xsc3_flush_user_cache_all,
+	.flush_user_range = xsc3_flush_user_cache_range,
+	.coherent_kern_range = xsc3_coherent_kern_range,
+	.coherent_user_range = xsc3_coherent_user_range,
+	.flush_kern_dcache_area = xsc3_flush_kern_dcache_area,
+	.dma_map_area = xsc3_dma_map_area,
+	.dma_unmap_area = xsc3_dma_unmap_area,
+	.dma_flush_range = xsc3_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_MOHAWK
+void mohawk_flush_icache_all(void);
+void mohawk_flush_kern_cache_all(void);
+void mohawk_flush_user_cache_all(void);
+void mohawk_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void mohawk_coherent_kern_range(unsigned long, unsigned long);
+int mohawk_coherent_user_range(unsigned long, unsigned long);
+void mohawk_flush_kern_dcache_area(void *, size_t);
+void mohawk_dma_map_area(const void *, size_t, int);
+void mohawk_dma_unmap_area(const void *, size_t, int);
+void mohawk_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns mohawk_cache_fns __initconst = {
+	.flush_icache_all = mohawk_flush_icache_all,
+	.flush_kern_all = mohawk_flush_kern_cache_all,
+	.flush_kern_louis = mohawk_flush_kern_cache_all,
+	.flush_user_all = mohawk_flush_user_cache_all,
+	.flush_user_range = mohawk_flush_user_cache_range,
+	.coherent_kern_range = mohawk_coherent_kern_range,
+	.coherent_user_range = mohawk_coherent_user_range,
+	.flush_kern_dcache_area = mohawk_flush_kern_dcache_area,
+	.dma_map_area = mohawk_dma_map_area,
+	.dma_unmap_area = mohawk_dma_unmap_area,
+	.dma_flush_range = mohawk_dma_flush_range,
+};
+#endif
+
+#ifdef CONFIG_CPU_FEROCEON
+void feroceon_flush_icache_all(void);
+void feroceon_flush_kern_cache_all(void);
+void feroceon_flush_user_cache_all(void);
+void feroceon_flush_user_cache_range(unsigned long, unsigned long, unsigned int);
+void feroceon_coherent_kern_range(unsigned long, unsigned long);
+int feroceon_coherent_user_range(unsigned long, unsigned long);
+void feroceon_flush_kern_dcache_area(void *, size_t);
+void feroceon_dma_map_area(const void *, size_t, int);
+void feroceon_dma_unmap_area(const void *, size_t, int);
+void feroceon_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns feroceon_cache_fns __initconst = {
+	.flush_icache_all = feroceon_flush_icache_all,
+	.flush_kern_all = feroceon_flush_kern_cache_all,
+	.flush_kern_louis = feroceon_flush_kern_cache_all,
+	.flush_user_all = feroceon_flush_user_cache_all,
+	.flush_user_range = feroceon_flush_user_cache_range,
+	.coherent_kern_range = feroceon_coherent_kern_range,
+	.coherent_user_range = feroceon_coherent_user_range,
+	.flush_kern_dcache_area = feroceon_flush_kern_dcache_area,
+	.dma_map_area = feroceon_dma_map_area,
+	.dma_unmap_area = feroceon_dma_unmap_area,
+	.dma_flush_range = feroceon_dma_flush_range,
+};
+
+void feroceon_range_flush_kern_dcache_area(void *, size_t);
+void feroceon_range_dma_map_area(const void *, size_t, int);
+void feroceon_range_dma_flush_range(const void *, const void *);
+
+struct cpu_cache_fns feroceon_range_cache_fns __initconst = {
+	.flush_icache_all = feroceon_flush_icache_all,
+	.flush_kern_all = feroceon_flush_kern_cache_all,
+	.flush_kern_louis = feroceon_flush_kern_cache_all,
+	.flush_user_all = feroceon_flush_user_cache_all,
+	.flush_user_range = feroceon_flush_user_cache_range,
+	.coherent_kern_range = feroceon_coherent_kern_range,
+	.coherent_user_range = feroceon_coherent_user_range,
+	.flush_kern_dcache_area = feroceon_range_flush_kern_dcache_area,
+	.dma_map_area = feroceon_range_dma_map_area,
+	.dma_unmap_area = feroceon_dma_unmap_area,
+	.dma_flush_range = feroceon_range_dma_flush_range,
+};
+#endif
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index 379628e8ef4e..1e014cc5b4d1 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -357,12 +357,6 @@ SYM_TYPED_FUNC_START(arm1020_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm1020_dma_unmap_area)
 
-	.globl	arm1020_flush_kern_cache_louis
-	.equ	arm1020_flush_kern_cache_louis, arm1020_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm1020
-
 	.align	5
 ENTRY(cpu_arm1020_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_DISABLE
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index b5846fbea040..7d80761f207a 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -344,12 +344,6 @@ SYM_TYPED_FUNC_START(arm1020e_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm1020e_dma_unmap_area)
 
-	.globl	arm1020e_flush_kern_cache_louis
-	.equ	arm1020e_flush_kern_cache_louis, arm1020e_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm1020e
-
 	.align	5
 ENTRY(cpu_arm1020e_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_DISABLE
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index c40b268cc274..53b1541c50d8 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -343,12 +343,6 @@ SYM_TYPED_FUNC_START(arm1022_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm1022_dma_unmap_area)
 
-	.globl	arm1022_flush_kern_cache_louis
-	.equ	arm1022_flush_kern_cache_louis, arm1022_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm1022
-
 	.align	5
 ENTRY(cpu_arm1022_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_DISABLE
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 7ef2c6d88dc0..6c6ea0357a77 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -338,12 +338,6 @@ SYM_TYPED_FUNC_START(arm1026_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm1026_dma_unmap_area)
 
-	.globl	arm1026_flush_kern_cache_louis
-	.equ	arm1026_flush_kern_cache_louis, arm1026_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm1026
-
 	.align	5
 ENTRY(cpu_arm1026_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_DISABLE
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index eb89a322a534..08a5bac0d89d 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -309,11 +309,6 @@ SYM_TYPED_FUNC_START(arm920_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm920_dma_unmap_area)
 
-	.globl	arm920_flush_kern_cache_louis
-	.equ	arm920_flush_kern_cache_louis, arm920_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm920
 #endif /* !CONFIG_CPU_DCACHE_WRITETHROUGH */
 
 
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index 035a1d1a26b0..8bcc0b913ba0 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -311,12 +311,6 @@ SYM_TYPED_FUNC_START(arm922_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm922_dma_unmap_area)
 
-	.globl	arm922_flush_kern_cache_louis
-	.equ	arm922_flush_kern_cache_louis, arm922_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm922
-
 #endif /* !CONFIG_CPU_DCACHE_WRITETHROUGH */
 
 ENTRY(cpu_arm922_dcache_clean_area)
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index 2510722647b4..d0d87f9705d3 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -366,12 +366,6 @@ SYM_TYPED_FUNC_START(arm925_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm925_dma_unmap_area)
 
-	.globl	arm925_flush_kern_cache_louis
-	.equ	arm925_flush_kern_cache_louis, arm925_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm925
-
 ENTRY(cpu_arm925_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index dac4a22369ba..6cb98b7a0fee 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -329,12 +329,6 @@ SYM_TYPED_FUNC_START(arm926_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm926_dma_unmap_area)
 
-	.globl	arm926_flush_kern_cache_louis
-	.equ	arm926_flush_kern_cache_louis, arm926_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm926
-
 ENTRY(cpu_arm926_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index 7c2268059536..527f1c044683 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -267,12 +267,6 @@ SYM_TYPED_FUNC_START(arm940_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm940_dma_unmap_area)
 
-	.globl	arm940_flush_kern_cache_louis
-	.equ	arm940_flush_kern_cache_louis, arm940_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm940
-
 	.type	__arm940_setup, #function
 __arm940_setup:
 	mov	r0, #0
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 3955be1f4521..3155e819ae5f 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -310,12 +310,6 @@ SYM_TYPED_FUNC_START(arm946_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(arm946_dma_unmap_area)
 
-	.globl	arm946_flush_kern_cache_louis
-	.equ	arm946_flush_kern_cache_louis, arm946_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions arm946
-
 ENTRY(cpu_arm946_dcache_clean_area)
 #ifndef CONFIG_CPU_DCACHE_WRITETHROUGH
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index 9b1570ea6858..af9482b07a4f 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -412,33 +412,6 @@ SYM_TYPED_FUNC_START(feroceon_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(feroceon_dma_unmap_area)
 
-	.globl	feroceon_flush_kern_cache_louis
-	.equ	feroceon_flush_kern_cache_louis, feroceon_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions feroceon
-
-.macro range_alias basename
-	.globl feroceon_range_\basename
-	.type feroceon_range_\basename , %function
-	.equ feroceon_range_\basename , feroceon_\basename
-.endm
-
-/*
- * Most of the cache functions are unchanged for this case.
- * Export suitable alias symbols for the unchanged functions:
- */
-	range_alias flush_icache_all
-	range_alias flush_user_cache_all
-	range_alias flush_kern_cache_all
-	range_alias flush_kern_cache_louis
-	range_alias flush_user_cache_range
-	range_alias coherent_kern_range
-	range_alias coherent_user_range
-	range_alias dma_unmap_area
-
-	define_cache_functions feroceon_range
-
 	.align	5
 ENTRY(cpu_feroceon_dcache_clean_area)
 #if defined(CONFIG_CACHE_FEROCEON_L2) && \
diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
index c0acfeac3e84..e388c4cc0c44 100644
--- a/arch/arm/mm/proc-macros.S
+++ b/arch/arm/mm/proc-macros.S
@@ -320,24 +320,6 @@ ENTRY(\name\()_processor_functions)
 #endif
 .endm
 
-.macro define_cache_functions name:req
-	.align 2
-	.type	\name\()_cache_fns, #object
-ENTRY(\name\()_cache_fns)
-	.long	\name\()_flush_icache_all
-	.long	\name\()_flush_kern_cache_all
-	.long   \name\()_flush_kern_cache_louis
-	.long	\name\()_flush_user_cache_all
-	.long	\name\()_flush_user_cache_range
-	.long	\name\()_coherent_kern_range
-	.long	\name\()_coherent_user_range
-	.long	\name\()_flush_kern_dcache_area
-	.long	\name\()_dma_map_area
-	.long	\name\()_dma_unmap_area
-	.long	\name\()_dma_flush_range
-	.size	\name\()_cache_fns, . - \name\()_cache_fns
-.endm
-
 .macro globl_equ x, y
 	.globl	\x
 	.equ	\x, \y
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 0a94cb0464d8..be3a1a997838 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -294,12 +294,6 @@ SYM_TYPED_FUNC_START(mohawk_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(mohawk_dma_unmap_area)
 
-	.globl	mohawk_flush_kern_cache_louis
-	.equ	mohawk_flush_kern_cache_louis, mohawk_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions mohawk
-
 ENTRY(cpu_mohawk_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHE_DLINESIZE
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index b2d907d748e9..7975f93b1e14 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -339,12 +339,6 @@ SYM_TYPED_FUNC_START(xsc3_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(xsc3_dma_unmap_area)
 
-	.globl	xsc3_flush_kern_cache_louis
-	.equ	xsc3_flush_kern_cache_louis, xsc3_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions xsc3
-
 ENTRY(cpu_xsc3_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean L1 D line
 	add	r0, r0, #CACHELINESIZE
diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index 05d9ed952983..bbf1e94ba554 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -391,6 +391,20 @@ SYM_TYPED_FUNC_START(xscale_dma_map_area)
 	b	xscale_dma_flush_range
 SYM_FUNC_END(xscale_dma_map_area)
 
+/*
+ * On stepping A0/A1 of the 80200, invalidating D-cache by line doesn't
+ * clear the dirty bits, which means that if we invalidate a dirty line,
+ * the dirty data can still be written back to external memory later on.
+ *
+ * The recommended workaround is to always do a clean D-cache line before
+ * doing an invalidate D-cache line, so on the affected processors,
+ * dma_inv_range() is implemented as dma_flush_range().
+ *
+ * See erratum #25 of "Intel 80200 Processor Specification Update",
+ * revision January 22, 2003, available at:
+ *     http://www.intel.com/design/iio/specupdt/273415.htm
+ */
+
 /*
  *	dma_map_area(start, size, dir)
  *	- start	- kernel virtual start address
@@ -414,49 +428,6 @@ SYM_TYPED_FUNC_START(xscale_dma_unmap_area)
 	ret	lr
 SYM_FUNC_END(xscale_dma_unmap_area)
 
-	.globl	xscale_flush_kern_cache_louis
-	.equ	xscale_flush_kern_cache_louis, xscale_flush_kern_cache_all
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions xscale
-
-/*
- * On stepping A0/A1 of the 80200, invalidating D-cache by line doesn't
- * clear the dirty bits, which means that if we invalidate a dirty line,
- * the dirty data can still be written back to external memory later on.
- *
- * The recommended workaround is to always do a clean D-cache line before
- * doing an invalidate D-cache line, so on the affected processors,
- * dma_inv_range() is implemented as dma_flush_range().
- *
- * See erratum #25 of "Intel 80200 Processor Specification Update",
- * revision January 22, 2003, available at:
- *     http://www.intel.com/design/iio/specupdt/273415.htm
- */
-.macro a0_alias basename
-	.globl xscale_80200_A0_A1_\basename
-	.type xscale_80200_A0_A1_\basename , %function
-	.equ xscale_80200_A0_A1_\basename , xscale_\basename
-.endm
-
-/*
- * Most of the cache functions are unchanged for these processor revisions.
- * Export suitable alias symbols for the unchanged functions:
- */
-	a0_alias flush_icache_all
-	a0_alias flush_user_cache_all
-	a0_alias flush_kern_cache_all
-	a0_alias flush_kern_cache_louis
-	a0_alias flush_user_cache_range
-	a0_alias coherent_kern_range
-	a0_alias coherent_user_range
-	a0_alias flush_kern_dcache_area
-	a0_alias dma_flush_range
-	a0_alias dma_unmap_area
-
-	@ define struct cpu_cache_fns (see <asm/cacheflush.h> and proc-macros.S)
-	define_cache_functions xscale_80200_A0_A1
-
 ENTRY(cpu_xscale_dcache_clean_area)
 1:	mcr	p15, 0, r0, c7, c10, 1		@ clean D entry
 	add	r0, r0, #CACHELINESIZE

-- 
2.44.0

