Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E345C157E97
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551549; cv=none; b=dcveXMcqxGHmGhY9F6BqKg77IWfPWkwmAvyiEXivT3K7cR+JH2i2ieShhMv8hFHf9k6aRy+nwUJbAz+z/pXwwWY+VFYGl6VUv6E9dA1i8V63D+yoQHXfQP7yR2Wr5zaHktm/vw8CZCGeHMSTTKGPt6q+RuyMw5+SM7lPAOFo/+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551549; c=relaxed/simple;
	bh=WA3GaPDqZzEz1qs5YrhEzMU8VCRLnQnkxmbA8Q+jrL4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wa3NhDkpgrYWcTY4NdMqKMLkYT2B8L8iNfTnmY5IA5Qbatcv67eqgiJ9cAIu97jDaTzKFzoFRbNxg6fbW43q9K0ebgST38KdfIezZOxozC4vU6+vwX3HFuwqj8bELsPXSjlKeo4xEDyEFvM/efKp2TNrlPlAJbF5JelyS4Yzy+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hlYSJHyr; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hlYSJHyr"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-40e4478a3afso14963795e9.1
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706551546; x=1707156346; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=doBLlrV3uqsZT11TuQPgH059AZeb19QGBGbs9zJgK3U=;
        b=hlYSJHyrst5UccP6KNK8NqUC36pvZmuq2Rzsh09YRp/Q/GeCvTN2qk6+rbxhpMmTsI
         Locy3Wm6d7JYculoLdebbXUOZ1KUNLWB1vtX9ExK+cvzgcK040JnwdF7Sr0AMPe4iO2Z
         qtZ4KPfkj+06a9AcFSz4WZFghbsVBqbop2qbcN0+HJAKICQWB7Dl3ILEYRlj25RUuN61
         ZZQVy4GOj5XToERiR4ILM7tDhjJaRhe8Q5h1jcaK+Q2lckCMVdpubItxJd7wZ4Yh9sYU
         dc1/VBeA2URTtgpkc78a0Eq2BcvBE92Dv3SuhrD3sHFmqR3Z/qr7RW0PngHf/e5zxTO5
         iPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551546; x=1707156346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=doBLlrV3uqsZT11TuQPgH059AZeb19QGBGbs9zJgK3U=;
        b=OwCCh5wnrO2LIX1dcYYklwKLSlDZnEDnJ83HpAboZsCb8rMMbUaKWQEn9ZeZvFN3Gn
         zzarFXMI3YExmTE/FJQia4ZX5TYkZovPDlkamNYGGg9vJAW4ZEsy7/me7pFxCJLV06Sa
         O6ui4ORz0WSJqLKarGHpBihuoxtg1NF442GBsQqHg9uzPdQSVKQKsoFYLShSIslg7iAP
         Y4hIKNISMDSRFj2a9Aqi7bg13a1tDY+qeIcbTHZ/Ef9UvIRQ4XhUsFVmdW43YwBgFLqn
         wJqnRxeQ50+qepksZWrd98oxDu25kewPAyFB7ahhnKXn9GGFipakPH3KoHMGOPO1f9fp
         eskQ==
X-Gm-Message-State: AOJu0YyMW3rYuXcB/jWv0hbAZZQ2Q6pStftogys6e4ebXFMjMNIHjqWj
	Z9tV3wrrffVxAU97tfNoQvafFE076BTevlNnjtV6EhMp1RYQnelYxTeF6/xIXGJR0NW/ag==
X-Google-Smtp-Source: AGHT+IGgLvB19x2zAJjRldl0JEb/xb9QA3oXZZrv8DOC9t5a0RO4E+sxtTda+dI1q6WUKq+yPoiI36ws
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:6003:b0:40e:fc7f:56d5 with SMTP id
 az3-20020a05600c600300b0040efc7f56d5mr2818wmb.2.1706551545993; Mon, 29 Jan
 2024 10:05:45 -0800 (PST)
Date: Mon, 29 Jan 2024 19:05:10 +0100
In-Reply-To: <20240129180502.4069817-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319; i=ardb@kernel.org;
 h=from:subject; bh=+6neEz5nbm/aVlO1e2fNUKJ40Al3PcnJxf6DJ7u3+Uc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXX7i2sfjtrc7f3APb8q8oWkdEncnIuz/V6+7d5ssnK9v
 rNa2+qNHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAilawM/8NErkz3/zatq/+f
 L/fj020ntBoMtp0V9dVZ1bdptmTND2dGhnnC9kwqy0+rX35ZxMBYltTQvDvxIHejVca1+mRfDqY fPAA=
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129180502.4069817-28-ardb+git@google.com>
Subject: [PATCH v3 07/19] x86/startup_64: Simplify virtual switch on primary boot
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The secondary startup code is used on the primary boot path as well, but
in this case, the initial part runs from a 1:1 mapping, until an
explicit cross-jump is made to the kernel virtual mapping of the same
code.

On the secondary boot path, this jump is pointless as the code already
executes from the mapping targeted by the jump. So combine this
cross-jump with the jump from startup_64() into the common boot path.
This simplifies the execution flow, and clearly separates code that runs
from a 1:1 mapping from code that runs from the kernel virtual mapping.

Note that this requires a page table switch, so hoist the CR3 assignment
into startup_64() as well.

Given that the secondary startup code does not require a special
placement inside the executable, move it to the .text section.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head_64.S | 41 +++++++++-----------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index ca46995205d4..953b82be4cd4 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -39,7 +39,6 @@ L4_START_KERNEL = l4_index(__START_KERNEL_map)
 
 L3_START_KERNEL = pud_index(__START_KERNEL_map)
 
-	.text
 	__HEAD
 	.code64
 SYM_CODE_START_NOALIGN(startup_64)
@@ -128,9 +127,19 @@ SYM_CODE_START_NOALIGN(startup_64)
 	call	sev_verify_cbit
 #endif
 
-	jmp 1f
+	/*
+	 * Switch to early_top_pgt which still has the identity mappings
+	 * present.
+	 */
+	movq	%rax, %cr3
+
+	/* Branch to the common startup code at its kernel virtual address */
+	movq	$common_startup_64, %rax
+	ANNOTATE_RETPOLINE_SAFE
+	jmp	*%rax
 SYM_CODE_END(startup_64)
 
+	.text
 SYM_CODE_START(secondary_startup_64)
 	UNWIND_HINT_END_OF_STACK
 	ANNOTATE_NOENDBR
@@ -176,8 +185,15 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 	addq	sme_me_mask(%rip), %rax
 #endif
+	/*
+	 * Switch to the init_top_pgt here, away from the trampoline_pgd and
+	 * unmap the identity mapped ranges.
+	 */
+	movq	%rax, %cr3
 
-1:
+SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
+	UNWIND_HINT_END_OF_STACK
+	ANNOTATE_NOENDBR // above
 
 	/*
 	 * Define a mask of CR4 bits to preserve. PAE and LA57 cannot be
@@ -195,17 +211,6 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 	 */
 	orl	$X86_CR4_MCE, %edx
 #endif
-
-	/*
-	 * Switch to new page-table
-	 *
-	 * For the boot CPU this switches to early_top_pgt which still has the
-	 * identity mappings present. The secondary CPUs will switch to the
-	 * init_top_pgt here, away from the trampoline_pgd and unmap the
-	 * identity mapped ranges.
-	 */
-	movq	%rax, %cr3
-
 	/*
 	 * Do a global TLB flush after the CR3 switch to make sure the TLB
 	 * entries from the identity mapping are flushed.
@@ -216,14 +221,6 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 	movq	%rcx, %cr4
 	jc	0b
 
-	/* Ensure I am executing from virtual addresses */
-	movq	$1f, %rax
-	ANNOTATE_RETPOLINE_SAFE
-	jmp	*%rax
-1:
-	UNWIND_HINT_END_OF_STACK
-	ANNOTATE_NOENDBR // above
-
 #ifdef CONFIG_SMP
 	/*
 	 * For parallel boot, the APIC ID is read from the APIC, and then
-- 
2.43.0.429.g432eaa2c6b-goog

