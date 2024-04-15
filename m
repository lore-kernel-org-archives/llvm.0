Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A0D73506
	for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188618; cv=none; b=d+WBAcBKfFsEWjLwgfYBmKPPIsSclLkWNdt/tYS958Mk0yAi4oGrZC3At+hnOPVKcFqfHyEvebGMiXiyQVeZDnkw3DI8c2x/0lhXfAFXHxFWPqioqHFQHF6KJ7zdc0U+JKjliecdy7j1boZWuXJ5SxQLVkRwQtkervQ8U5UMpgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188618; c=relaxed/simple;
	bh=RiaAdhkxss8WwH90lNcPx9GjWOJRJr7rpQVVoo9QjSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1DyF3DJR6o97mXA4EJIr/QhoVNp11112Dy9/VoHB5iICQxw23yUS/JwEJ7Wdojwew4vOjlvi9ioic74HP+cXrjbjeBJs37f7n6WRbgwHSkfBeEbpncabD5LeUY/YLxJIt4thn0l1CHJ6Gc23r/wHmUmF8n881CC0gSyzQ7zolg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=irqOUAuY; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="irqOUAuY"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2da01cb187cso58256601fa.0
        for <llvm@lists.linux.dev>; Mon, 15 Apr 2024 06:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713188615; x=1713793415; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RTNeV4li+DU0s3fUIcbK2lqyEFO9l8a9eRKgSj1QCA=;
        b=irqOUAuYPY1ZT79jkzMtcNr2454Y0o9gxXhy07Nr0nkmB748ta08fVHWRNpWoyHezW
         fGX/3lMlaKnQ0n/cfv2c6ubqbnxp3r4/lz6PTNlZokTqodzpPKcxRDUWjIpSwMR0Igl2
         Tk/fEjk/NFhjfa8FWpK8qHXCX+kdISbqKW6H21E3iOQ70Yy1k+m5JyF2xYrkZkWsegoa
         BDcQp9VXNK7nguv6pSxwfh8IzStKHg/J+BSQexDjIuZi02GtdF+VE3Bh/3cdu/G2AhDd
         aaaNUFr2LxB+xAILGj4YscbW6m7Vh1UqJhl7QkZ5x0obIFYwPNnQ2TsJqtbK01V6Moqs
         yM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188615; x=1713793415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RTNeV4li+DU0s3fUIcbK2lqyEFO9l8a9eRKgSj1QCA=;
        b=Lrq+SfFd7xrAO+CVrb0oFa6ORgOtRQCJaWHUpCtU6pv+te1mfzSiGxAWT1Jqw0vUtV
         DcRN90tt+GooK9dzSXHZFcuT0zjGFCYszP0IP2JuK8PQyOHB4KiqNLlDd1bJymlbVS/z
         UalX8G/3ZUw5Xs0QEGhLKnNJZ6sQREIdfjS0DuR4YHwnn7cI93yHUCamHAAqbx3hRIEQ
         bB0Wk1mQSvVlzGxHZHqTPQ06oBxVp/PXf8HeXJtNmQPdB92Lzg4QifxlgX9DditMbkcO
         E8pT4aMIsBvWgrT5pEpVXllOfUo1DBII6jGUZw4acePIC0bH8wDIwu/dmKuquTF0RBn1
         dFCg==
X-Forwarded-Encrypted: i=1; AJvYcCWtAmLH9ScdwJ0ZmZV0CoIjCSubfBEx9tHaicFOdQtvqGVC8yXX0DigizkK7uAMnRjAkABHGp2aM7HW6U1+S2OwCJj87w==
X-Gm-Message-State: AOJu0YynMSYc1uA+lp21RDDaaV2InH+qGprFvBsolNWhsljH1MbMaV0y
	qN531acO1x6EP5g+4VzjoAU7vL7tM9YrTwD3TNiVbBRMRZqOGzzMq2os8dvpWcc=
X-Google-Smtp-Source: AGHT+IHeTbYcsqWsWMTAUscGgTjMK5JmF5D2R389zEY9FUqm8slfuBjBY0UxJoSe8WMFKhVs7KMtww==
X-Received: by 2002:a2e:7e0a:0:b0:2d8:39cf:5368 with SMTP id z10-20020a2e7e0a000000b002d839cf5368mr8447850ljc.29.1713188614856;
        Mon, 15 Apr 2024 06:43:34 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id p11-20020a2eb98b000000b002d43737e2d7sm1297988ljp.30.2024.04.15.06.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:43:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Apr 2024 15:43:22 +0200
Subject: [PATCH v5 03/10] ARM: mm: Make tlbflush routines CFI safe
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-arm32-cfi-v5-3-ff11093eeccc@linaro.org>
References: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
In-Reply-To: <20240415-arm32-cfi-v5-0-ff11093eeccc@linaro.org>
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

