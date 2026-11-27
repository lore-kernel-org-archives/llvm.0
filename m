Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789441;
	b=3EO6Hj2d7ohGfwXSLgLIyDkpHrrWBuhQhIU3J1soR7k7nL2PoSHUkz5EkKe/Qpf+3iNk
	 wQCDMcrULsiTgfyWDu9/Te3MLIGgE5xYXv27jqOACnNXrKN4WrG+DDTvMis8KolL3KjMP
	 JVd6R521DQ4Y0LGlX0QnQ3eWpWVkfl1Yar0z/GYPOAXR16bALr9UDg34B0+VF5oXcuVkj
	 y+ISYekoXUIOZ7qsx7vMkh0yM7Y5IZ6lA/Gq48OqJKfzcjkAhryhWXU5LY20QtQekWbBd
	 o8DM7HUxIzm1CbK5LwjW/nTFOrVrowXX5IHxTtspxyqIGpLHUyFBxDTMBCsKG1pPvkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nst+cq+RCQZd8DKJagmNoo0PO23xtVq1JOUVv/rZqj4=;
	b=J1i80hrEMMGol/1ant72HWhXD1F//b2TaTKmaQCpH9sq/94aEITKZImFCv6FdAUMfMTy
	 qqf5tRz/2PD2Ze8yWFhOLt9WG+MqcrHHZI4s4VhVxv1TBH3nYWYBYQ04+SKPOg44Jpn0V
	 5IVIQKr1hTeaob2tak9nIeTqxq+KVExq4lb3Y6+AfMYTajpjNA+mxikCIVWIhomtTAoNy
	 lKMfwWJAA5X6Y4Mp8dZOxVftiuYk8zSASOTpQCd/f9DGDAS9W2JeNmSb3ENFqUXu6pIzV
	 gkfC9DDZMun9f9LYb+G64BsqoQWsLvpgV5XKlStGdxIE5ZfPHWXhptkQFgmIBDoG8NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pd7yrvJO;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB77606A334
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 14:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB77606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pd7yrvJO
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e00f3929bso4689328f8f.0
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 06:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795789440; x=1796394240; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nst+cq+RCQZd8DKJagmNoo0PO23xtVq1JOUVv/rZqj4=;
        b=Pd7yrvJOhrLOFYMIwSSrqSy9X3RWTtY4lLZTVFaePxFK/sDFM5WbHGXJMFjR5lu0yg
         yi++L9gWKAeA7XTqerof3cKBydLhFeS0GiHpZwOVlVnCBK7HQYwmKLGaO9mhUvhqN4fE
         oSBrsWES5xH21o615QQrqXGawoWa1hZvydKn8ntaGIcrbbNzmzdYY5376IiaXfrXQ511
         s1dz1WFfPZq3qCF1OThRmimQiYQHDK+blY5KIQyt5Y4z/7V4NHrtNhWrpaaG4Wjm0lny
         cP5OmnnF0jNXe8pbVL9yyav1UYxdpslkOFNuQ9SYFXpfcYydFJmYAUp2zPEu8s7Xn7/+
         cusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789440; x=1796394240;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nst+cq+RCQZd8DKJagmNoo0PO23xtVq1JOUVv/rZqj4=;
        b=V/VHb4selyXmOe1JlXnYcaxqWJMLDxG9L9jw4pqkraIdLKWkqT1r48z5bP58eq7a8N
         amkoegxtQLU444q+2Za7p2o+wwVjVoU+9AYhUEgOjLG9N+RzKirlRpjovLjcJURzuE0r
         fYnMz9qVt1WHyuGOGtv9qoB75et1Fn1mTrdXQ6cFFzZ5vk/SgRpslThRpzZrcsNylWJ0
         /qGoMLIMjUdYKE9Yo1fNs2ICt0CfOuAh7OsS4dqpZm2BSvYgzbrLzy+v91N1CG8Q6UvW
         ZgG2qs7K4AuG38GMNqduRokli8w4CtxfqsB0Ks1SR8C+hIQ7SRG35t3cj3zmWWGFm4Nc
         NMvA==
X-Forwarded-Encrypted: i=1; AL+hErGk0JokFWg1LelkwweGsoLjutwyrcX5hu0n5nwEIT4TdrC1p5ch99eHlo41hgLtY1q5V7NT@lists.linux.dev
X-Gm-Message-State: APuU4Z9SEKv5iUsTTjxgW46cMbIG28YIEOgB6Lmv12/igHPNTbyk9Kol
	s2geBMzt398PImQPixKUS6Br/JZ0W8GDM0OIPhd9m2gt5TSV1JpBIx7Oc3T6GXLUamJQbOSYsQ=
	=
X-Received: from wmaq25.prod.google.com ([2002:a05:600c:6c99:b0:4bb:73d5:ab38])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e0b:b0:49e:65f2:db64
 with SMTP id 5b1f17b1804b1-4bb887fb66cmr519561025e9.5.1795789439448; Fri, 27
 Nov 2026 06:23:59 -0800 (PST)
Date: Fri, 27 Nov 2026 15:23:49 +0100
In-Reply-To: <20261127142346.788995-4-ardb+git@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261127142346.788995-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7019; i=ardb@kernel.org;
 h=from:subject; bh=rx8m1dggkQbZeJXP7IVHLUsRFHtLh+mS/d71BeR3Ugg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZtzUulvLvnoMB5h9TaOk5tVTig/PczL/uuw0L1tGj9uL
 +r8zZjfUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbyvYOR4anWXf7kMN6fbhM+
 16zl1NRKLk8ou3s1Xn7lFnemBb/O2TD80zU1/1qq+aP7RYFXxts/HTceXJtzVsuiNWhGmNJ1i20 cTAA=
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127142346.788995-6-ardb+git@google.com>
Subject: [PATCH 2/2] x86/stackprotector: Use a named address space for the
 Clang stack guard
From: Ard Biesheuvel <ardb+git@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

When Clang finds an existing declaration of the variable passed via
-mstack-protector-guard-symbol=, it uses it as is, and only emits the
segment prefix if it resides in the matching named address space. This is
why the guard is currently referenced via an alias that never appears in
C code.

Instead, declare __stack_chk_guard in the %gs/%fs named address space when
building with Clang, and access it via an unqualified per-CPU lvalue from
C code, permitting the alias, and the export from asm, to be dropped.

Once CONFIG_USE_X86_SEG_SUPPORT=y is implemented by all supported
compilers, this workaround can be dropped.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/Makefile                     |  2 +-
 arch/x86/entry/entry.S                | 14 ----------
 arch/x86/include/asm/asm-prototypes.h |  4 ---
 arch/x86/include/asm/percpu.h         | 10 +++----
 arch/x86/include/asm/stackprotector.h | 29 ++++++++++++++++++--
 arch/x86/kernel/cpu/common.c          |  4 +--
 arch/x86/kernel/vmlinux.lds.S         |  3 --
 7 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index b7e08519b8c1..116700da7988 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -183,7 +183,7 @@ endif
 ifeq ($(CONFIG_STACKPROTECTOR),y)
     ifeq ($(CONFIG_SMP),y)
 	KBUILD_CFLAGS += -mstack-protector-guard-reg=$(percpu_seg)
-	KBUILD_CFLAGS += -mstack-protector-guard-symbol=__ref_stack_chk_guard
+	KBUILD_CFLAGS += -mstack-protector-guard-symbol=__stack_chk_guard
     else
 	KBUILD_CFLAGS += -mstack-protector-guard=global
     endif
diff --git a/arch/x86/entry/entry.S b/arch/x86/entry/entry.S
index 2bc217bb5475..f88021f4467e 100644
--- a/arch/x86/entry/entry.S
+++ b/arch/x86/entry/entry.S
@@ -62,20 +62,6 @@ EXPORT_SYMBOL_FOR_KVM(x86_verw_sel);
 
 THUNK warn_thunk_thunk, __warn_thunk
 
-/*
- * Clang's implementation of TLS stack cookies requires the variable in
- * question to be a TLS variable. If the variable happens to be defined as an
- * ordinary variable with external linkage in the same compilation unit (which
- * amounts to the whole of vmlinux with LTO enabled), Clang will drop the
- * segment register prefix from the references, resulting in broken code. Work
- * around this by avoiding the symbol used in -mstack-protector-guard-symbol=
- * entirely in the C code, and use an alias emitted by the linker script
- * instead.
- */
-#if defined(CONFIG_STACKPROTECTOR) && defined(CONFIG_SMP)
-EXPORT_SYMBOL(__ref_stack_chk_guard);
-#endif
-
 #if IS_ENABLED(CONFIG_KVM_INTEL)
 .macro IDT_DO_EVENT_IRQOFF call_insn call_target
 	/*
diff --git a/arch/x86/include/asm/asm-prototypes.h b/arch/x86/include/asm/asm-prototypes.h
index 11c6fecc3ad7..b04015ef12a9 100644
--- a/arch/x86/include/asm/asm-prototypes.h
+++ b/arch/x86/include/asm/asm-prototypes.h
@@ -19,7 +19,3 @@
 #ifndef CONFIG_X86_CX8
 extern void cmpxchg8b_emu(void);
 #endif
-
-#ifdef CONFIG_STACKPROTECTOR
-extern unsigned long __ref_stack_chk_guard;
-#endif
diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index cef9a4ca9841..f7e37722913e 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -28,17 +28,17 @@
 #include <linux/stringify.h>
 #include <asm/asm.h>
 
+#ifdef __CHECKER__
+# define __seg_gs		__attribute__((address_space(__seg_gs)))
+# define __seg_fs		__attribute__((address_space(__seg_fs)))
+#endif
+
 #ifdef CONFIG_SMP
 
 #define __force_percpu_prefix	"%%"__stringify(__percpu_seg)":"
 
 #ifdef CONFIG_CC_HAS_NAMED_AS
 
-#ifdef __CHECKER__
-# define __seg_gs		__attribute__((address_space(__seg_gs)))
-# define __seg_fs		__attribute__((address_space(__seg_fs)))
-#endif
-
 #define __percpu_prefix
 
 #else /* !CONFIG_CC_HAS_NAMED_AS: */
diff --git a/arch/x86/include/asm/stackprotector.h b/arch/x86/include/asm/stackprotector.h
index cd761b14eb02..184c630452a7 100644
--- a/arch/x86/include/asm/stackprotector.h
+++ b/arch/x86/include/asm/stackprotector.h
@@ -20,7 +20,28 @@
 
 #include <linux/sched.h>
 
-DECLARE_PER_CPU_CACHE_HOT(unsigned long, __stack_chk_guard);
+/*
+ * If a per-CPU C declaration of __stack_chk_guard is observable by Clang, it
+ * will emit the memory operand with the segment prefix only when the C
+ * declaration is annotated with the correct address space.  Otherwise, Clang
+ * will ignore -mstack-protector-guard-reg=%fs/%gs, and emit the bare unshifted
+ * memory operand. 'Observable' means part of the same translation unit, which
+ * amounts to all of vmlinux when LTO is enabled.
+ *
+ * So use an address space annotation for the stack canary even when using a
+ * Clang version that does not support CONFIG_USE_X86_SEG_SUPPORT=y fully.
+ */
+#if defined(CONFIG_SMP) && defined(CONFIG_CC_IS_CLANG) && \
+    !defined(CONFIG_USE_X86_SEG_SUPPORT)
+#define __stack_chk_guard_seg	CONCATENATE(__seg_, __percpu_seg)
+#define __pcpu_stack_chk_guard	\
+	*(unsigned long __percpu *)(__force unsigned long)&__stack_chk_guard
+#else
+#define __stack_chk_guard_seg
+#define __pcpu_stack_chk_guard	__stack_chk_guard
+#endif
+
+DECLARE_PER_CPU_CACHE_HOT(unsigned long __stack_chk_guard_seg, __stack_chk_guard);
 
 /*
  * Initialize the stackprotector canary value.
@@ -38,14 +59,16 @@ static __always_inline void boot_init_stack_canary(void)
 	unsigned long canary = get_random_canary();
 
 	current->stack_canary = canary;
-	this_cpu_write(__stack_chk_guard, canary);
+	this_cpu_write(__pcpu_stack_chk_guard, canary);
 }
 
 static inline void cpu_init_stack_canary(int cpu, struct task_struct *idle)
 {
-	per_cpu(__stack_chk_guard, cpu) = idle->stack_canary;
+	per_cpu(__pcpu_stack_chk_guard, cpu) = idle->stack_canary;
 }
 
+#undef __pcpu_stack_chk_guard
+
 #else	/* STACKPROTECTOR */
 
 /* dummy boot_init_stack_canary() is defined in linux/stackprotector.h */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 9bd50c68cd7e..5d0d29ec8974 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2322,11 +2322,9 @@ void syscall_init(void)
 #endif /* CONFIG_X86_64 */
 
 #ifdef CONFIG_STACKPROTECTOR
-DEFINE_PER_CPU_CACHE_HOT(unsigned long, __stack_chk_guard);
-#ifndef CONFIG_SMP
+DEFINE_PER_CPU_CACHE_HOT(unsigned long __stack_chk_guard_seg, __stack_chk_guard);
 EXPORT_PER_CPU_SYMBOL(__stack_chk_guard);
 #endif
-#endif
 
 static void initialize_debug_regs(void)
 {
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2438b89a4620..61173c38a951 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -475,9 +475,6 @@ SECTIONS
 	   "kernel image bigger than KERNEL_IMAGE_SIZE");
 #endif
 
-/* needed for Clang - see arch/x86/entry/entry.S */
-PROVIDE(__ref_stack_chk_guard = __stack_chk_guard);
-
 #ifdef CONFIG_X86_64
 
 #ifdef CONFIG_MITIGATION_UNRET_ENTRY
-- 
2.56.1.839.g22a8290db9-goog

