Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D0C482C5
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828126; cv=none; b=ENpjBseZUoqlQo2vSOd2bVGmEKqBMSGzySjTjkWpmx6gFmVfaVndaF9HNz/Ci812EFrm1zho1kvXboDak5u1ivnjGc97sHkEaS29K8SKAQGmbtID/L58eY7NS24SS0GxwTHz5ADXIPF5ZmCzH/flw07KjcK8GIyfuqR+ZWH0EFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828126; c=relaxed/simple;
	bh=YMvF0ORfuPi3XAD0k0pDL8v73CKkqlg6+lbGX9kyTzw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gQsPoesAssF7ZNt+Osmcglm8SHJVA0rJGbb13WZz+22CJN7sj6R5vfbgpqa987FVY07ktvMSXOTm+XhbiJ7col1QIwmp+iK0Kikh5kAxDlBA7yPchKfvo/glAQglpcxgkbLX+M1LxrRW0Zv/RKWvJnU5YDtmjK0PAurMbKcb2AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VGXj4LP2; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VGXj4LP2"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4114d21fca5so8010355e9.2
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 04:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707828123; x=1708432923; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IntT6izjYhpSpfiju4QdrJP91shTnHbBbhRa2UK23MU=;
        b=VGXj4LP2GMugP2Qr81aHXX0vqxO4EL6HlvZ9rP2+bPP8VaRw4+A4suIK4WofmFUG/q
         cNSANCGr5ZmDDfYK06jOSMhgz/+uh6Bozjy0wjnqG11uFDvYmE7kQiUt1gQs2xlUfGe7
         dnvbX8hROlxY2QwqPoI7c1G/lp5xRahHfaWhtR3LA2RPDMsLfmjSfY/BXRtrnQDug7SU
         iJBeVBfEVHH5FffKMDT2uxhfmtaUkaGgMb71jXXLZ8yqpBRwuWHz6Z16DF/YU3CvFPV2
         IqXYB84xm4Ixmb/5ZiRqMJVt5McG7Fh/gf4QG7mC+zoZl0G2cKEPbf0QboKATxduJPoy
         yaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707828123; x=1708432923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IntT6izjYhpSpfiju4QdrJP91shTnHbBbhRa2UK23MU=;
        b=I9nfjVA6XNnXyWmMyVeiHIqjevufN88PVb6cWBtsrETxaKcrmzoIafHmFkWgDperNB
         4qnvWig/jnWXGqnG9glTVS4PQt4jKaLeBpNWyF1RGo5cJnOQq6fISQjnKsrQvz+i01RB
         YytC0eWwv4ucDw5lL+8rREsaFWtXHBGBxOGyguyDLiuf/YswKCyRsHeeGMjLVb8bs8jw
         g5NPEGVlHxj6ejZccJ2h+2ZQBrQnZLsbbkthze3NS7SQ3KkqkGrhX2MQ2ApaSqAvAzfN
         +uTKiimNWK3gKblHtYxY1gH/Y5J5PhJkE/T6FMpbV/pW8DqVM/4jaVkpu93HBV9hT6Yw
         sbsg==
X-Forwarded-Encrypted: i=1; AJvYcCUn/H0ETXaeqkeL0rPsKkwIiAa/nLsIRSZfBlM1Bf39Mq0ASfHGnpzGa6pr2te0+jjBCHf9KY7+UQUiBrG4OpHZ772CEw==
X-Gm-Message-State: AOJu0YwNhrXlCXHVl5u4I+WJSPXTjB7Cuecu3sByH1k2F9/MEbUEOoj1
	oyjJuhmhzitk1sjDNuQjvDv4P+MLSrLlpFH/KHcYI9XXljHxz2GGDAhZP4eJC6ILxkM1gg==
X-Google-Smtp-Source: AGHT+IGO4JBfeGvnTwxmmn7JIMK9YckhUWh4H18sWfV5jiwrBdxJzdJIlnTTVHSvArGFHZiJixRxORXb
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:518a:b0:411:a802:700d with SMTP id
 fa10-20020a05600c518a00b00411a802700dmr70870wmb.2.1707828123104; Tue, 13 Feb
 2024 04:42:03 -0800 (PST)
Date: Tue, 13 Feb 2024 13:41:45 +0100
In-Reply-To: <20240213124143.1484862-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240213124143.1484862-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6089; i=ardb@kernel.org;
 h=from:subject; bh=BsdoewkQfg4v5NoT6opMjWi0Vrg2mA8a392y9Jxs7FU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIfV0cueOKzuMyz5W71o5TYp9kdW5Wa0xu5br/SkOjb++u
 +9vHS9XRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIkguMDDu+bZC0ZT+Yvm5u
 Ise2zLtZBuoPpiZea4wzc1/5zzhy1XOG/2G3FvnknSyvm3xqo5Hi+U/3rS7NzF25v9om6r3Ekno 9Nx4A
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213124143.1484862-14-ardb+git@google.com>
Subject: [PATCH v4 01/11] x86/startup_64: Simplify global variable accesses in
 GDT/IDT programming
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

There are two code paths in the startup code to program an IDT: one that
runs from the 1:1 mapping and one that runs from the virtual kernel
mapping. Currently, these are strictly separate because fixup_pointer()
is used on the 1:1 path, which will produce the wrong value when used
while executing from the virtual kernel mapping.

Switch to RIP_REL_REF() so that the two code paths can be merged. Also,
move the GDT and IDT descriptors to the stack so that they can be
referenced directly, rather than via RIP_REL_REF().

Rename startup_64_setup_env() to startup_64_setup_gdt_idt() while at it,
to make the call from assembler self-documenting.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/setup.h |  2 +-
 arch/x86/kernel/head64.c     | 56 +++++++-------------
 arch/x86/kernel/head_64.S    |  4 +-
 3 files changed, 22 insertions(+), 40 deletions(-)

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 5c83729c8e71..e61e68d71cba 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -48,7 +48,7 @@ extern unsigned long saved_video_mode;
 extern void reserve_standard_io_resources(void);
 extern void i386_reserve_resources(void);
 extern unsigned long __startup_64(unsigned long physaddr, struct boot_params *bp);
-extern void startup_64_setup_env(unsigned long physbase);
+extern void startup_64_setup_gdt_idt(void);
 extern void early_setup_idt(void);
 extern void __init do_early_exception(struct pt_regs *regs, int trapnr);
 
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index dc0956067944..9d7f12829f2d 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -22,6 +22,7 @@
 #include <linux/cc_platform.h>
 #include <linux/pgtable.h>
 
+#include <asm/asm.h>
 #include <asm/processor.h>
 #include <asm/proto.h>
 #include <asm/smp.h>
@@ -76,15 +77,6 @@ static struct desc_struct startup_gdt[GDT_ENTRIES] __initdata = {
 	[GDT_ENTRY_KERNEL_DS]           = GDT_ENTRY_INIT(DESC_DATA64, 0, 0xfffff),
 };
 
-/*
- * Address needs to be set at runtime because it references the startup_gdt
- * while the kernel still uses a direct mapping.
- */
-static struct desc_ptr startup_gdt_descr __initdata = {
-	.size = sizeof(startup_gdt)-1,
-	.address = 0,
-};
-
 static void __head *fixup_pointer(void *ptr, unsigned long physaddr)
 {
 	return ptr - (void *)_text + (void *)physaddr;
@@ -569,12 +561,7 @@ void __init __noreturn x86_64_start_reservations(char *real_mode_data)
  */
 static gate_desc bringup_idt_table[NUM_EXCEPTION_VECTORS] __page_aligned_data;
 
-static struct desc_ptr bringup_idt_descr = {
-	.size		= (NUM_EXCEPTION_VECTORS * sizeof(gate_desc)) - 1,
-	.address	= 0, /* Set at runtime */
-};
-
-static void set_bringup_idt_handler(gate_desc *idt, int n, void *handler)
+static void __head set_bringup_idt_handler(gate_desc *idt, int n, void *handler)
 {
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 	struct idt_data data;
@@ -586,45 +573,42 @@ static void set_bringup_idt_handler(gate_desc *idt, int n, void *handler)
 #endif
 }
 
-/* This runs while still in the direct mapping */
-static void __head startup_64_load_idt(unsigned long physbase)
+/* This may run while still in the direct mapping */
+static void __head startup_64_load_idt(void *handler)
 {
-	struct desc_ptr *desc = fixup_pointer(&bringup_idt_descr, physbase);
-	gate_desc *idt = fixup_pointer(bringup_idt_table, physbase);
-
-
-	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT)) {
-		void *handler;
+	struct desc_ptr desc = {
+		.address	= (unsigned long)&RIP_REL_REF(bringup_idt_table),
+		.size		= sizeof(bringup_idt_table) - 1,
+	};
+	gate_desc *idt = (gate_desc *)desc.address;
 
+	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT))
 		/* VMM Communication Exception */
-		handler = fixup_pointer(vc_no_ghcb, physbase);
 		set_bringup_idt_handler(idt, X86_TRAP_VC, handler);
-	}
 
-	desc->address = (unsigned long)idt;
-	native_load_idt(desc);
+	native_load_idt(&desc);
 }
 
 /* This is used when running on kernel addresses */
 void early_setup_idt(void)
 {
-	/* VMM Communication Exception */
-	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT)) {
+	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT))
 		setup_ghcb();
-		set_bringup_idt_handler(bringup_idt_table, X86_TRAP_VC, vc_boot_ghcb);
-	}
 
-	bringup_idt_descr.address = (unsigned long)bringup_idt_table;
-	native_load_idt(&bringup_idt_descr);
+	startup_64_load_idt(vc_boot_ghcb);
 }
 
 /*
  * Setup boot CPU state needed before kernel switches to virtual addresses.
  */
-void __head startup_64_setup_env(unsigned long physbase)
+void __head startup_64_setup_gdt_idt(void)
 {
+	struct desc_ptr startup_gdt_descr = {
+		.address	= (unsigned long)&RIP_REL_REF(startup_gdt),
+		.size		= sizeof(startup_gdt) - 1,
+	};
+
 	/* Load GDT */
-	startup_gdt_descr.address = (unsigned long)fixup_pointer(startup_gdt, physbase);
 	native_load_gdt(&startup_gdt_descr);
 
 	/* New GDT is live - reload data segment registers */
@@ -632,5 +616,5 @@ void __head startup_64_setup_env(unsigned long physbase)
 		     "movl %%eax, %%ss\n"
 		     "movl %%eax, %%es\n" : : "a"(__KERNEL_DS) : "memory");
 
-	startup_64_load_idt(physbase);
+	startup_64_load_idt(&RIP_REL_REF(vc_no_ghcb));
 }
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index d4918d03efb4..3cac98c61066 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -68,8 +68,6 @@ SYM_CODE_START_NOALIGN(startup_64)
 	/* Set up the stack for verify_cpu() */
 	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
 
-	leaq	_text(%rip), %rdi
-
 	/* Setup GSBASE to allow stack canary access for C code */
 	movl	$MSR_GS_BASE, %ecx
 	leaq	INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
@@ -77,7 +75,7 @@ SYM_CODE_START_NOALIGN(startup_64)
 	shrq	$32,  %rdx
 	wrmsr
 
-	call	startup_64_setup_env
+	call	startup_64_setup_gdt_idt
 
 	/* Now switch to __KERNEL_CS so IRET works reliably */
 	pushq	$__KERNEL_CS
-- 
2.43.0.687.g38aa6559b0-goog

