Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001943AC34
	for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713724116; cv=none; b=fg7KXdnIl/EGb7tXe6cI93Oh3ObNahtx+rFFvc9WhT4LafqWT83bZMRd2l9JUiVeqfCcPSoWTcYkTAEovq42F0oNvR3trvX5wG80ItGreYQ/N4canJEuC9eTZQlXPBNPz/P76dFKs1ytCdmsJ4W2Ilx+hTYMK0ReNen+dB4qJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713724116; c=relaxed/simple;
	bh=RiaAdhkxss8WwH90lNcPx9GjWOJRJr7rpQVVoo9QjSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oeIYEWDDl9Bh06m6+wgr8Rbiur1vdi4ZL8ajGLYRKfc3EG2dkkDsYKH7VjhR/3vd04MQQkFsud2HMXeSiafxtqyJIPuMSMTbogubA7tCpcPFt9+erowY1IqoytlYnglkNjG218OdQnqZld2w1q4gpJ4Ir/0+EhrN3l7iuSEZnEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=piG4RrHX; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="piG4RrHX"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso3474290e87.1
        for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 11:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713724112; x=1714328912; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RTNeV4li+DU0s3fUIcbK2lqyEFO9l8a9eRKgSj1QCA=;
        b=piG4RrHXKbANAm3ZTJN12ibbeB2e45xtPOhKp0ki3yeJbMHRlCNVIRemzRbhn4SWFI
         3gSwKTIjZoPVzlfsQlOXjpmt6d0HjgkMUthlMeX66OdlTHpv5+WlNa48y4oQjl3ThogL
         59z0l5u6PuDrd98pgeSzqq0wiU43vk438/1GeHC4mJZbO/xgmvDqRBsHFRZXH30IlXaM
         vk54HuesRMYiPkll6G6Q41qyZptadsL/xhPcPg5hJADHknjhut9iotY0ah4sgL1ab0Cg
         VrSsNNcNCHkVOkroTyTXIdg7wetlrPEpNh0jyYPKOoidnkrE/yXcSHh+2CgC1hyimCzL
         2V6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713724112; x=1714328912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RTNeV4li+DU0s3fUIcbK2lqyEFO9l8a9eRKgSj1QCA=;
        b=sZJ6pBd22qEqzSca/WzjwLdh8mF9HVr51irp2YQDjB4XsD1MJNboBby7SQ5FEJSrD+
         GMnJjM5T5jDfE1xStnCCXWBiw2VZddRKdToxEReX7A9Gcp+mlN+2c1yYPGKIJ1OghTDp
         W0qj9EwbRnEcMM+YrpnNzdmrneARlOi3OTc6+0ysx+UGvuAAgCQHdbc9AsvZiorg8wBP
         h9kbP4OOKJKbQh3Kt+dghpB/rnwqQBYKZbG3vD2rO5Toe1a7J2XYyOwVLghu3a9C7vVT
         ogEjoXJcepczo/e49KJLeYB7zdeIbmXUQ0LYvmWdG4/4O7kAcZixGp/rD7NOoGPJftLM
         dBGg==
X-Forwarded-Encrypted: i=1; AJvYcCVR3e3eKwTCbTEWYY9loHYQAw2WItu3bBDeHELrwpxo1sbtsVFNcR5orI7WyG8/kVOtjBPazu7gQQgdeVLXVtTGcfm5aQ==
X-Gm-Message-State: AOJu0YxvF+yPUW8u0Mqt0thiY8bGeadtt3j8S4kXIydsg+OfRYtRqurd
	WT75xmUMA4cfjFTG4M2po8+oyulo7c9SR5R7BU6NH/Aonout5hf/WmTLK3oO85c=
X-Google-Smtp-Source: AGHT+IGEri83XqiaNY3JP7cfMUlDk+IIgO92+uFqPCCqOh9Tdj12LCfiAaI8A8GP2fJdSDtQ3Ir5Mw==
X-Received: by 2002:a05:6512:1101:b0:51a:b7ee:deed with SMTP id l1-20020a056512110100b0051ab7eedeedmr2827140lfg.14.1713724112051;
        Sun, 21 Apr 2024 11:28:32 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b005188ea5d2b5sm1549641lfc.303.2024.04.21.11.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 11:28:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Apr 2024 20:28:29 +0200
Subject: [PATCH v7 03/11] ARM: mm: Make tlbflush routines CFI safe
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240421-arm32-cfi-v7-3-6e132a948cc8@linaro.org>
References: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
In-Reply-To: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

From: Ard Biesheuvel <ardb@kernel.org>

Instead of avoiding CFI entirely on the TLB flush helpers, reorganize
the code so that the CFI machinery can deal with it. The important
things to take into account are:
- functions in asm called indirectly from C need to be defined using
  SYM_TYPED_FUNC_START()
- a reference to the asm function needs to be visible to the compiler,
  in order to get it to emit the typeid symbol.

The latter means that defining the cpu_tlb_fns structs is best done from
C code, so that the references in the static initializers will be
visible to the compiler.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/Makefile      |  1 +
 arch/arm/mm/proc-macros.S | 15 ---------
 arch/arm/mm/tlb-fa.S      | 12 +++----
 arch/arm/mm/tlb-v4.S      | 15 +++++----
 arch/arm/mm/tlb-v4wb.S    | 12 +++----
 arch/arm/mm/tlb-v4wbi.S   | 12 +++----
 arch/arm/mm/tlb-v6.S      | 12 +++----
 arch/arm/mm/tlb-v7.S      | 14 +++-----
 arch/arm/mm/tlb.c         | 84 +++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 119 insertions(+), 58 deletions(-)

diff --git a/arch/arm/mm/Makefile b/arch/arm/mm/Makefile
index 71b858c9b10c..cc8255fdf56e 100644
--- a/arch/arm/mm/Makefile
+++ b/arch/arm/mm/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_CPU_TLB_FEROCEON)	+= tlb-v4wbi.o	# reuse v4wbi TLB functions
 obj-$(CONFIG_CPU_TLB_V6)	+= tlb-v6.o
 obj-$(CONFIG_CPU_TLB_V7)	+= tlb-v7.o
 obj-$(CONFIG_CPU_TLB_FA)	+= tlb-fa.o
+obj-y				+= tlb.o
 
 obj-$(CONFIG_CPU_ARM7TDMI)	+= proc-arm7tdmi.o
 obj-$(CONFIG_CPU_ARM720T)	+= proc-arm720.o
diff --git a/arch/arm/mm/proc-macros.S b/arch/arm/mm/proc-macros.S
index e43f6d716b4b..c0acfeac3e84 100644
--- a/arch/arm/mm/proc-macros.S
+++ b/arch/arm/mm/proc-macros.S
@@ -338,21 +338,6 @@ ENTRY(\name\()_cache_fns)
 	.size	\name\()_cache_fns, . - \name\()_cache_fns
 .endm
 
-.macro define_tlb_functions name:req, flags_up:req, flags_smp
-	.type	\name\()_tlb_fns, #object
-	.align 2
-ENTRY(\name\()_tlb_fns)
-	.long	\name\()_flush_user_tlb_range
-	.long	\name\()_flush_kern_tlb_range
-	.ifnb \flags_smp
-		ALT_SMP(.long	\flags_smp )
-		ALT_UP(.long	\flags_up )
-	.else
-		.long	\flags_up
-	.endif
-	.size	\name\()_tlb_fns, . - \name\()_tlb_fns
-.endm
-
 .macro globl_equ x, y
 	.globl	\x
 	.equ	\x, \y
diff --git a/arch/arm/mm/tlb-fa.S b/arch/arm/mm/tlb-fa.S
index def6161ec452..85a6fe766b21 100644
--- a/arch/arm/mm/tlb-fa.S
+++ b/arch/arm/mm/tlb-fa.S
@@ -15,6 +15,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/tlbflush.h>
@@ -31,7 +32,7 @@
  *	- mm    - mm_struct describing address space
  */
 	.align	4
-ENTRY(fa_flush_user_tlb_range)
+SYM_TYPED_FUNC_START(fa_flush_user_tlb_range)
 	vma_vm_mm ip, r2
 	act_mm	r3				@ get current->active_mm
 	eors	r3, ip, r3			@ == mm ?
@@ -46,9 +47,10 @@ ENTRY(fa_flush_user_tlb_range)
 	blo	1b
 	mcr	p15, 0, r3, c7, c10, 4		@ data write barrier
 	ret	lr
+SYM_FUNC_END(fa_flush_user_tlb_range)
 
 
-ENTRY(fa_flush_kern_tlb_range)
+SYM_TYPED_FUNC_START(fa_flush_kern_tlb_range)
 	mov	r3, #0
 	mcr	p15, 0, r3, c7, c10, 4		@ drain WB
 	bic	r0, r0, #0x0ff
@@ -60,8 +62,4 @@ ENTRY(fa_flush_kern_tlb_range)
 	mcr	p15, 0, r3, c7, c10, 4		@ data write barrier
 	mcr	p15, 0, r3, c7, c5, 4		@ prefetch flush (isb)
 	ret	lr
-
-	__INITDATA
-
-	/* define struct cpu_tlb_fns (see <asm/tlbflush.h> and proc-macros.S) */
-	define_tlb_functions fa, fa_tlb_flags
+SYM_FUNC_END(fa_flush_kern_tlb_range)
diff --git a/arch/arm/mm/tlb-v4.S b/arch/arm/mm/tlb-v4.S
index b962b4e75158..09ff69008d94 100644
--- a/arch/arm/mm/tlb-v4.S
+++ b/arch/arm/mm/tlb-v4.S
@@ -11,6 +11,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/tlbflush.h>
@@ -27,7 +28,7 @@
  *	- mm    - mm_struct describing address space
  */
 	.align	5
-ENTRY(v4_flush_user_tlb_range)
+SYM_TYPED_FUNC_START(v4_flush_user_tlb_range)
 	vma_vm_mm ip, r2
 	act_mm	r3				@ get current->active_mm
 	eors	r3, ip, r3				@ == mm ?
@@ -40,6 +41,7 @@ ENTRY(v4_flush_user_tlb_range)
 	cmp	r0, r1
 	blo	1b
 	ret	lr
+SYM_FUNC_END(v4_flush_user_tlb_range)
 
 /*
  *	v4_flush_kern_tlb_range(start, end)
@@ -50,10 +52,11 @@ ENTRY(v4_flush_user_tlb_range)
  *	- start - virtual address (may not be aligned)
  *	- end   - virtual address (may not be aligned)
  */
+#ifdef CONFIG_CFI_CLANG
+SYM_TYPED_FUNC_START(v4_flush_kern_tlb_range)
+	b	.v4_flush_kern_tlb_range
+SYM_FUNC_END(v4_flush_kern_tlb_range)
+#else
 .globl v4_flush_kern_tlb_range
 .equ v4_flush_kern_tlb_range, .v4_flush_kern_tlb_range
-
-	__INITDATA
-
-	/* define struct cpu_tlb_fns (see <asm/tlbflush.h> and proc-macros.S) */
-	define_tlb_functions v4, v4_tlb_flags
+#endif
diff --git a/arch/arm/mm/tlb-v4wb.S b/arch/arm/mm/tlb-v4wb.S
index 9348bba7586a..04e46c359e75 100644
--- a/arch/arm/mm/tlb-v4wb.S
+++ b/arch/arm/mm/tlb-v4wb.S
@@ -11,6 +11,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/tlbflush.h>
@@ -27,7 +28,7 @@
  *	- mm    - mm_struct describing address space
  */
 	.align	5
-ENTRY(v4wb_flush_user_tlb_range)
+SYM_TYPED_FUNC_START(v4wb_flush_user_tlb_range)
 	vma_vm_mm ip, r2
 	act_mm	r3				@ get current->active_mm
 	eors	r3, ip, r3				@ == mm ?
@@ -43,6 +44,7 @@ ENTRY(v4wb_flush_user_tlb_range)
 	cmp	r0, r1
 	blo	1b
 	ret	lr
+SYM_FUNC_END(v4wb_flush_user_tlb_range)
 
 /*
  *	v4_flush_kern_tlb_range(start, end)
@@ -53,7 +55,7 @@ ENTRY(v4wb_flush_user_tlb_range)
  *	- start - virtual address (may not be aligned)
  *	- end   - virtual address (may not be aligned)
  */
-ENTRY(v4wb_flush_kern_tlb_range)
+SYM_TYPED_FUNC_START(v4wb_flush_kern_tlb_range)
 	mov	r3, #0
 	mcr	p15, 0, r3, c7, c10, 4		@ drain WB
 	bic	r0, r0, #0x0ff
@@ -64,8 +66,4 @@ ENTRY(v4wb_flush_kern_tlb_range)
 	cmp	r0, r1
 	blo	1b
 	ret	lr
-
-	__INITDATA
-
-	/* define struct cpu_tlb_fns (see <asm/tlbflush.h> and proc-macros.S) */
-	define_tlb_functions v4wb, v4wb_tlb_flags
+SYM_FUNC_END(v4wb_flush_kern_tlb_range)
diff --git a/arch/arm/mm/tlb-v4wbi.S b/arch/arm/mm/tlb-v4wbi.S
index d4f9040a4111..502dfe5628a3 100644
--- a/arch/arm/mm/tlb-v4wbi.S
+++ b/arch/arm/mm/tlb-v4wbi.S
@@ -11,6 +11,7 @@
  */
 #include <linux/linkage.h>
 #include <linux/init.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/tlbflush.h>
@@ -26,7 +27,7 @@
  *	- mm    - mm_struct describing address space
  */
 	.align	5
-ENTRY(v4wbi_flush_user_tlb_range)
+SYM_TYPED_FUNC_START(v4wbi_flush_user_tlb_range)
 	vma_vm_mm ip, r2
 	act_mm	r3				@ get current->active_mm
 	eors	r3, ip, r3			@ == mm ?
@@ -43,8 +44,9 @@ ENTRY(v4wbi_flush_user_tlb_range)
 	cmp	r0, r1
 	blo	1b
 	ret	lr
+SYM_FUNC_END(v4wbi_flush_user_tlb_range)
 
-ENTRY(v4wbi_flush_kern_tlb_range)
+SYM_TYPED_FUNC_START(v4wbi_flush_kern_tlb_range)
 	mov	r3, #0
 	mcr	p15, 0, r3, c7, c10, 4		@ drain WB
 	bic	r0, r0, #0x0ff
@@ -55,8 +57,4 @@ ENTRY(v4wbi_flush_kern_tlb_range)
 	cmp	r0, r1
 	blo	1b
 	ret	lr
-
-	__INITDATA
-
-	/* define struct cpu_tlb_fns (see <asm/tlbflush.h> and proc-macros.S) */
-	define_tlb_functions v4wbi, v4wbi_tlb_flags
+SYM_FUNC_END(v4wbi_flush_kern_tlb_range)
diff --git a/arch/arm/mm/tlb-v6.S b/arch/arm/mm/tlb-v6.S
index 1d91e49b2c2d..8256a67ac654 100644
--- a/arch/arm/mm/tlb-v6.S
+++ b/arch/arm/mm/tlb-v6.S
@@ -9,6 +9,7 @@
  */
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm-offsets.h>
 #include <asm/assembler.h>
 #include <asm/page.h>
@@ -32,7 +33,7 @@
  *	- the "Invalidate single entry" instruction will invalidate
  *	  both the I and the D TLBs on Harvard-style TLBs
  */
-ENTRY(v6wbi_flush_user_tlb_range)
+SYM_TYPED_FUNC_START(v6wbi_flush_user_tlb_range)
 	vma_vm_mm r3, r2			@ get vma->vm_mm
 	mov	ip, #0
 	mmid	r3, r3				@ get vm_mm->context.id
@@ -56,6 +57,7 @@ ENTRY(v6wbi_flush_user_tlb_range)
 	blo	1b
 	mcr	p15, 0, ip, c7, c10, 4		@ data synchronization barrier
 	ret	lr
+SYM_FUNC_END(v6wbi_flush_user_tlb_range)
 
 /*
  *	v6wbi_flush_kern_tlb_range(start,end)
@@ -65,7 +67,7 @@ ENTRY(v6wbi_flush_user_tlb_range)
  *	- start - start address (may not be aligned)
  *	- end   - end address (exclusive, may not be aligned)
  */
-ENTRY(v6wbi_flush_kern_tlb_range)
+SYM_TYPED_FUNC_START(v6wbi_flush_kern_tlb_range)
 	mov	r2, #0
 	mcr	p15, 0, r2, c7, c10, 4		@ drain write buffer
 	mov	r0, r0, lsr #PAGE_SHIFT		@ align address
@@ -85,8 +87,4 @@ ENTRY(v6wbi_flush_kern_tlb_range)
 	mcr	p15, 0, r2, c7, c10, 4		@ data synchronization barrier
 	mcr	p15, 0, r2, c7, c5, 4		@ prefetch flush (isb)
 	ret	lr
-
-	__INIT
-
-	/* define struct cpu_tlb_fns (see <asm/tlbflush.h> and proc-macros.S) */
-	define_tlb_functions v6wbi, v6wbi_tlb_flags
+SYM_FUNC_END(v6wbi_flush_kern_tlb_range)
diff --git a/arch/arm/mm/tlb-v7.S b/arch/arm/mm/tlb-v7.S
index 35fd6d4f0d03..f1aa0764a2cc 100644
--- a/arch/arm/mm/tlb-v7.S
+++ b/arch/arm/mm/tlb-v7.S
@@ -10,6 +10,7 @@
  */
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/assembler.h>
 #include <asm/asm-offsets.h>
 #include <asm/page.h>
@@ -31,7 +32,7 @@
  *	- the "Invalidate single entry" instruction will invalidate
  *	  both the I and the D TLBs on Harvard-style TLBs
  */
-ENTRY(v7wbi_flush_user_tlb_range)
+SYM_TYPED_FUNC_START(v7wbi_flush_user_tlb_range)
 	vma_vm_mm r3, r2			@ get vma->vm_mm
 	mmid	r3, r3				@ get vm_mm->context.id
 	dsb	ish
@@ -57,7 +58,7 @@ ENTRY(v7wbi_flush_user_tlb_range)
 	blo	1b
 	dsb	ish
 	ret	lr
-ENDPROC(v7wbi_flush_user_tlb_range)
+SYM_FUNC_END(v7wbi_flush_user_tlb_range)
 
 /*
  *	v7wbi_flush_kern_tlb_range(start,end)
@@ -67,7 +68,7 @@ ENDPROC(v7wbi_flush_user_tlb_range)
  *	- start - start address (may not be aligned)
  *	- end   - end address (exclusive, may not be aligned)
  */
-ENTRY(v7wbi_flush_kern_tlb_range)
+SYM_TYPED_FUNC_START(v7wbi_flush_kern_tlb_range)
 	dsb	ish
 	mov	r0, r0, lsr #PAGE_SHIFT		@ align address
 	mov	r1, r1, lsr #PAGE_SHIFT
@@ -86,9 +87,4 @@ ENTRY(v7wbi_flush_kern_tlb_range)
 	dsb	ish
 	isb
 	ret	lr
-ENDPROC(v7wbi_flush_kern_tlb_range)
-
-	__INIT
-
-	/* define struct cpu_tlb_fns (see <asm/tlbflush.h> and proc-macros.S) */
-	define_tlb_functions v7wbi, v7wbi_tlb_flags_up, flags_smp=v7wbi_tlb_flags_smp
+SYM_FUNC_END(v7wbi_flush_kern_tlb_range)
diff --git a/arch/arm/mm/tlb.c b/arch/arm/mm/tlb.c
new file mode 100644
index 000000000000..42359793120b
--- /dev/null
+++ b/arch/arm/mm/tlb.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright 2024 Google LLC
+// Author: Ard Biesheuvel <ardb@google.com>
+
+#include <linux/types.h>
+#include <asm/tlbflush.h>
+
+#ifdef CONFIG_CPU_TLB_V4WT
+void v4_flush_user_tlb_range(unsigned long, unsigned long, struct vm_area_struct *);
+void v4_flush_kern_tlb_range(unsigned long, unsigned long);
+
+struct cpu_tlb_fns v4_tlb_fns __initconst = {
+	.flush_user_range	= v4_flush_user_tlb_range,
+	.flush_kern_range	= v4_flush_kern_tlb_range,
+	.tlb_flags		= v4_tlb_flags,
+};
+#endif
+
+#ifdef CONFIG_CPU_TLB_V4WB
+void v4wb_flush_user_tlb_range(unsigned long, unsigned long, struct vm_area_struct *);
+void v4wb_flush_kern_tlb_range(unsigned long, unsigned long);
+
+struct cpu_tlb_fns v4wb_tlb_fns __initconst = {
+	.flush_user_range	= v4wb_flush_user_tlb_range,
+	.flush_kern_range	= v4wb_flush_kern_tlb_range,
+	.tlb_flags		= v4wb_tlb_flags,
+};
+#endif
+
+#if defined(CONFIG_CPU_TLB_V4WBI) || defined(CONFIG_CPU_TLB_FEROCEON)
+void v4wbi_flush_user_tlb_range(unsigned long, unsigned long, struct vm_area_struct *);
+void v4wbi_flush_kern_tlb_range(unsigned long, unsigned long);
+
+struct cpu_tlb_fns v4wbi_tlb_fns __initconst = {
+	.flush_user_range	= v4wbi_flush_user_tlb_range,
+	.flush_kern_range	= v4wbi_flush_kern_tlb_range,
+	.tlb_flags		= v4wbi_tlb_flags,
+};
+#endif
+
+#ifdef CONFIG_CPU_TLB_V6
+void v6wbi_flush_user_tlb_range(unsigned long, unsigned long, struct vm_area_struct *);
+void v6wbi_flush_kern_tlb_range(unsigned long, unsigned long);
+
+struct cpu_tlb_fns v6wbi_tlb_fns __initconst = {
+	.flush_user_range	= v6wbi_flush_user_tlb_range,
+	.flush_kern_range	= v6wbi_flush_kern_tlb_range,
+	.tlb_flags		= v6wbi_tlb_flags,
+};
+#endif
+
+#ifdef CONFIG_CPU_TLB_V7
+void v7wbi_flush_user_tlb_range(unsigned long, unsigned long, struct vm_area_struct *);
+void v7wbi_flush_kern_tlb_range(unsigned long, unsigned long);
+
+struct cpu_tlb_fns v7wbi_tlb_fns __initconst = {
+	.flush_user_range	= v7wbi_flush_user_tlb_range,
+	.flush_kern_range	= v7wbi_flush_kern_tlb_range,
+	.tlb_flags		= IS_ENABLED(CONFIG_SMP) ? v7wbi_tlb_flags_smp
+							 : v7wbi_tlb_flags_up,
+};
+
+#ifdef CONFIG_SMP_ON_UP
+/* This will be run-time patched so the offset better be right */
+static_assert(offsetof(struct cpu_tlb_fns, tlb_flags) == 8);
+
+asm("	.pushsection	\".alt.smp.init\", \"a\"		\n" \
+    "	.align		2					\n" \
+    "	.long		v7wbi_tlb_fns + 8 - .			\n" \
+    "	.long "  	__stringify(v7wbi_tlb_flags_up) "	\n" \
+    "	.popsection						\n");
+#endif
+#endif
+
+#ifdef CONFIG_CPU_TLB_FA
+void fa_flush_user_tlb_range(unsigned long, unsigned long, struct vm_area_struct *);
+void fa_flush_kern_tlb_range(unsigned long, unsigned long);
+
+struct cpu_tlb_fns fa_tlb_fns __initconst = {
+	.flush_user_range	= fa_flush_user_tlb_range,
+	.flush_kern_range	= fa_flush_kern_tlb_range,
+	.tlb_flags		= fa_tlb_flags,
+};
+#endif

-- 
2.44.0

