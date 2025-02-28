Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE05250BF5
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732719; cv=none; b=EuGDpRGHmZnVJsfhNgFvPtCDVR5n4KT2fE/K7s8S1BrenmFH2/tHzodv3BM1mGYshOW3cgt3w+9kZlWh93mbRHLs/QQShn/e/GP9A6x75A7Fm9riOVszVWy35KySJ2fmJgYwNEImS5cyx9kRw1tz7VssYxgRlf7cnPzKIaQqbIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732719; c=relaxed/simple;
	bh=w1nkcyVPYvi3ysyji3YioOLi0vdTNcSe4/LKECgEAAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Due+Cj7dPPB3slTOKnybWZz5rlO3x6/3cWxf/AK4P5WMonT8mi18L2OWW2GVY9LECTfMFI6m/SljG8Xbxs5+RFrGPzBm8fKf3UD7JYUcZ+W7MQF2bmJ3kKCpFTFfWzzcDmEaECfrb3hKUrHh5WgSuOO8jt8Hk+W9bQfwwKxjwMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT+uT23o; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT+uT23o"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abbb12bea54so345166766b.0
        for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 00:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740732714; x=1741337514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEUyB5EmHNCT4puS4PQuhKUh0TILreNeaPohAZsCzXk=;
        b=nT+uT23ova/f+TRf8b9WGpf+eEZ0KeRJwfLIyHBjsWzZ9EoIh4KfndaW8RGXIZOzDc
         vQe2mvXoH4zud3z9L1pbbDtlAcOzE0S00citZ5AozisvWrc1FENwJJSUSxVUq/Re5viG
         Uyyl/dacLT17bYFrvqIT67OWe+sWIc5DAVlmtrPRzrkw6AbVxH3r9d7Y/6TySPCLLIyx
         XB8pEiVCLoB4jkm2fWqOVr5uqecP09WxLkFYfCcXYnEbHgTX16qJ0B95z4tuz/fimAcn
         BMcPQkTU1tJzKPYUrZ/Al80yyUjeYV0AFaXfkQFpGaCQNs/IU9Q82XaxU1lmjf8lVhxv
         Mrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732714; x=1741337514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEUyB5EmHNCT4puS4PQuhKUh0TILreNeaPohAZsCzXk=;
        b=mICLsXYyZMci9ZLWa8l/PE0P/dgpj//cVuQQ4h/9958ZRHgRjgozezzRraDs3ragA8
         NipBHk+znwGF2Lf1ek7LfYbN3H+eu/3ixH8Fd055qam9FIn+0OBzsR8Muv3fnSCaIbnN
         oEMfNtYnxzREtkIuMlaJtNxmbLiCLFigFjPunZSPIb0Uujwa2LtfoVD95IZvwXPdgsiT
         XQzREJwMrzzJfeIW8vtibG+w7+Dgy9Dtn7jAR3Khmaz0yIvp0QLGFW6wSCC2d5Syi5nA
         bPSbMKzSGo3KPcvhp3v77ArP5sWY2jsmjSCAjK3R8VWnjADisT+N/GcaiOsWlPX4dc42
         mslg==
X-Forwarded-Encrypted: i=1; AJvYcCVMl6FX+lj3PAJrB6iUvigY7rQybDmXLKdI/qgWVT/HCqMGm3GOKIETJbVaqS/hHB5i/d5b@lists.linux.dev
X-Gm-Message-State: AOJu0YzkZJPG8jfmbtIh6DtbsH5XDIrLV74D4stnnAu4OVF7qbBgpDcP
	BeQRl9Y5m1hXG0vjajoGb5qyU79k6S1Sz2iRgu8oM2WP5FjfMQB0
X-Gm-Gg: ASbGncuBv1Oo2qLMHmPt7UHBux/x4KgJemlif9YI97OSawKjrIS0SWSJRkpe1B55sBq
	4tC70eZ94rPSjI2C3fw2y5Q3MNAqedYBNVqJWAkZYU9ocbijM8KbCg81VvfNHWsprWUJPol9YNh
	76Q6flzS79QGgZv8gbkMzHk9GebsOpwncaegjYvgLoLpGhLxElGPlzvZIvtBlvT5SWVLroce0Qj
	BjaRTPrTAqOrajcSS8v6erzMLGWCTRNAxkXl2YkzeKlxUqYK+CuMi0iLeMC8ASqXxIdz1bcjzbJ
	U6n/67xj/6ETDQSkyAiQCfBL6IXtKl5V4AWX
X-Google-Smtp-Source: AGHT+IHE75BPNmxqkumsfahz4rxW/WI+EewYpDWNQmoLci96OwuaE8twUPv7rhKoapoaVWJclJMkvA==
X-Received: by 2002:a17:907:c29:b0:ab7:f2da:8126 with SMTP id a640c23a62f3a-abf25fa2bb1mr244795666b.11.1740732713983;
        Fri, 28 Feb 2025 00:51:53 -0800 (PST)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0dc5d5sm261091666b.63.2025.02.28.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:51:53 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: [PATCH] x86/locking: Remove semicolon from "lock" prefix
Date: Fri, 28 Feb 2025 09:51:15 +0100
Message-ID: <20250228085149.2478245-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minimum version of binutils required to compile the kernel is 2.25.
This version correctly handles the "lock" prefix, so it is possible
to remove the semicolon, which was used to support ancient versions
of GNU as.

Due to the semicolon, the compiler considers "lock; insn" as two
separate instructions. Removing the semicolon makes asm length
calculations more accurate, consequently making scheduling and
inlining decisions of the compiler more accurate.

Removing the semicolon also enables assembler checks involving lock
prefix. Trying to assemble e.g. "lock andl %eax, %ebx" results in:

  Error: expecting lockable instruction after `lock'

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
---
 arch/x86/include/asm/alternative.h |  2 +-
 arch/x86/include/asm/barrier.h     |  8 ++++----
 arch/x86/include/asm/cmpxchg.h     |  4 ++--
 arch/x86/include/asm/cmpxchg_32.h  |  4 ++--
 arch/x86/include/asm/edac.h        |  2 +-
 arch/x86/include/asm/sync_bitops.h | 12 ++++++------
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
index 853fbcf68719..2b9547dc1f23 100644
--- a/arch/x86/include/asm/alternative.h
+++ b/arch/x86/include/asm/alternative.h
@@ -48,7 +48,7 @@
 		".popsection\n"				\
 		"671:"
 
-#define LOCK_PREFIX LOCK_PREFIX_HERE "\n\tlock; "
+#define LOCK_PREFIX LOCK_PREFIX_HERE "\n\tlock "
 
 #else /* ! CONFIG_SMP */
 #define LOCK_PREFIX_HERE ""
diff --git a/arch/x86/include/asm/barrier.h b/arch/x86/include/asm/barrier.h
index 7b44b3c4cce1..db70832232d4 100644
--- a/arch/x86/include/asm/barrier.h
+++ b/arch/x86/include/asm/barrier.h
@@ -12,11 +12,11 @@
  */
 
 #ifdef CONFIG_X86_32
-#define mb() asm volatile(ALTERNATIVE("lock; addl $0,-4(%%esp)", "mfence", \
+#define mb() asm volatile(ALTERNATIVE("lock addl $0,-4(%%esp)", "mfence", \
 				      X86_FEATURE_XMM2) ::: "memory", "cc")
-#define rmb() asm volatile(ALTERNATIVE("lock; addl $0,-4(%%esp)", "lfence", \
+#define rmb() asm volatile(ALTERNATIVE("lock addl $0,-4(%%esp)", "lfence", \
 				       X86_FEATURE_XMM2) ::: "memory", "cc")
-#define wmb() asm volatile(ALTERNATIVE("lock; addl $0,-4(%%esp)", "sfence", \
+#define wmb() asm volatile(ALTERNATIVE("lock addl $0,-4(%%esp)", "sfence", \
 				       X86_FEATURE_XMM2) ::: "memory", "cc")
 #else
 #define __mb()	asm volatile("mfence":::"memory")
@@ -50,7 +50,7 @@
 #define __dma_rmb()	barrier()
 #define __dma_wmb()	barrier()
 
-#define __smp_mb()	asm volatile("lock; addl $0,-4(%%" _ASM_SP ")" ::: "memory", "cc")
+#define __smp_mb()	asm volatile("lock addl $0,-4(%%" _ASM_SP ")" ::: "memory", "cc")
 
 #define __smp_rmb()	dma_rmb()
 #define __smp_wmb()	barrier()
diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index 5612648b0202..fd8afc1f5f6b 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -134,7 +134,7 @@ extern void __add_wrong_size(void)
 	__raw_cmpxchg((ptr), (old), (new), (size), LOCK_PREFIX)
 
 #define __sync_cmpxchg(ptr, old, new, size)				\
-	__raw_cmpxchg((ptr), (old), (new), (size), "lock; ")
+	__raw_cmpxchg((ptr), (old), (new), (size), "lock ")
 
 #define __cmpxchg_local(ptr, old, new, size)				\
 	__raw_cmpxchg((ptr), (old), (new), (size), "")
@@ -222,7 +222,7 @@ extern void __add_wrong_size(void)
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
 
 #define __sync_try_cmpxchg(ptr, pold, new, size)			\
-	__raw_try_cmpxchg((ptr), (pold), (new), (size), "lock; ")
+	__raw_try_cmpxchg((ptr), (pold), (new), (size), "lock ")
 
 #define __try_cmpxchg_local(ptr, pold, new, size)			\
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), "")
diff --git a/arch/x86/include/asm/cmpxchg_32.h b/arch/x86/include/asm/cmpxchg_32.h
index 95b5f990ca88..8806c646d452 100644
--- a/arch/x86/include/asm/cmpxchg_32.h
+++ b/arch/x86/include/asm/cmpxchg_32.h
@@ -105,7 +105,7 @@ static __always_inline bool __try_cmpxchg64_local(volatile u64 *ptr, u64 *oldp,
 
 static __always_inline u64 arch_cmpxchg64(volatile u64 *ptr, u64 old, u64 new)
 {
-	return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock; ");
+	return __arch_cmpxchg64_emu(ptr, old, new, LOCK_PREFIX_HERE, "lock ");
 }
 #define arch_cmpxchg64 arch_cmpxchg64
 
@@ -140,7 +140,7 @@ static __always_inline u64 arch_cmpxchg64_local(volatile u64 *ptr, u64 old, u64
 
 static __always_inline bool arch_try_cmpxchg64(volatile u64 *ptr, u64 *oldp, u64 new)
 {
-	return __arch_try_cmpxchg64_emu(ptr, oldp, new, LOCK_PREFIX_HERE, "lock; ");
+	return __arch_try_cmpxchg64_emu(ptr, oldp, new, LOCK_PREFIX_HERE, "lock ");
 }
 #define arch_try_cmpxchg64 arch_try_cmpxchg64
 
diff --git a/arch/x86/include/asm/edac.h b/arch/x86/include/asm/edac.h
index 426fc53ff803..dfbd1ebb9f10 100644
--- a/arch/x86/include/asm/edac.h
+++ b/arch/x86/include/asm/edac.h
@@ -13,7 +13,7 @@ static inline void edac_atomic_scrub(void *va, u32 size)
 	 * are interrupt, DMA and SMP safe.
 	 */
 	for (i = 0; i < size / 4; i++, virt_addr++)
-		asm volatile("lock; addl $0, %0"::"m" (*virt_addr));
+		asm volatile("lock addl $0, %0"::"m" (*virt_addr));
 }
 
 #endif /* _ASM_X86_EDAC_H */
diff --git a/arch/x86/include/asm/sync_bitops.h b/arch/x86/include/asm/sync_bitops.h
index 6d8d6bc183b7..cd21a0405ac5 100644
--- a/arch/x86/include/asm/sync_bitops.h
+++ b/arch/x86/include/asm/sync_bitops.h
@@ -31,7 +31,7 @@
  */
 static inline void sync_set_bit(long nr, volatile unsigned long *addr)
 {
-	asm volatile("lock; " __ASM_SIZE(bts) " %1,%0"
+	asm volatile("lock " __ASM_SIZE(bts) " %1,%0"
 		     : "+m" (ADDR)
 		     : "Ir" (nr)
 		     : "memory");
@@ -49,7 +49,7 @@ static inline void sync_set_bit(long nr, volatile unsigned long *addr)
  */
 static inline void sync_clear_bit(long nr, volatile unsigned long *addr)
 {
-	asm volatile("lock; " __ASM_SIZE(btr) " %1,%0"
+	asm volatile("lock " __ASM_SIZE(btr) " %1,%0"
 		     : "+m" (ADDR)
 		     : "Ir" (nr)
 		     : "memory");
@@ -66,7 +66,7 @@ static inline void sync_clear_bit(long nr, volatile unsigned long *addr)
  */
 static inline void sync_change_bit(long nr, volatile unsigned long *addr)
 {
-	asm volatile("lock; " __ASM_SIZE(btc) " %1,%0"
+	asm volatile("lock " __ASM_SIZE(btc) " %1,%0"
 		     : "+m" (ADDR)
 		     : "Ir" (nr)
 		     : "memory");
@@ -82,7 +82,7 @@ static inline void sync_change_bit(long nr, volatile unsigned long *addr)
  */
 static inline bool sync_test_and_set_bit(long nr, volatile unsigned long *addr)
 {
-	return GEN_BINARY_RMWcc("lock; " __ASM_SIZE(bts), *addr, c, "Ir", nr);
+	return GEN_BINARY_RMWcc("lock " __ASM_SIZE(bts), *addr, c, "Ir", nr);
 }
 
 /**
@@ -95,7 +95,7 @@ static inline bool sync_test_and_set_bit(long nr, volatile unsigned long *addr)
  */
 static inline int sync_test_and_clear_bit(long nr, volatile unsigned long *addr)
 {
-	return GEN_BINARY_RMWcc("lock; " __ASM_SIZE(btr), *addr, c, "Ir", nr);
+	return GEN_BINARY_RMWcc("lock " __ASM_SIZE(btr), *addr, c, "Ir", nr);
 }
 
 /**
@@ -108,7 +108,7 @@ static inline int sync_test_and_clear_bit(long nr, volatile unsigned long *addr)
  */
 static inline int sync_test_and_change_bit(long nr, volatile unsigned long *addr)
 {
-	return GEN_BINARY_RMWcc("lock; " __ASM_SIZE(btc), *addr, c, "Ir", nr);
+	return GEN_BINARY_RMWcc("lock " __ASM_SIZE(btc), *addr, c, "Ir", nr);
 }
 
 #define sync_test_bit(nr, addr) test_bit(nr, addr)
-- 
2.48.1

