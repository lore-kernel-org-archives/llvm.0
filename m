Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603805;
	b=ArKixl92glLzsexlMeQaAYAYbjNi35e52jyUXTy49FOTCRC2lKEk4UE6SJd5UuV4AmGy
	 eRAg2DHLBJYCejeCDQl60M7XyaJOVU04n57eV8AYk70KN0WbWFzmWXrIY8iy8YLcTxLOp
	 LO/4X81+M2fDufJ8eVPbC69l3X+ZgGDwtiC2SQJAPI7oqmVqJ1IMZ0iayuCFsAqlgaZBS
	 ktwUtgbp1/IsUZPMTEKplLmq5hzu5gOX/QGE1VEABO5E1Unt6Pt7L9zVmIl9BAyZNC/mS
	 gRS1DhAPvock+cblMXmKU6GOf+NzAI4HH30VWSxsV2ihiTXHFk9mMbL1vJ0mDJq73jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:Subject:
	 From:To:Cc:Content-Type;
	bh=iNsoMr6T6H6tXBBcGO5QuTopXNx9EbRoa5Eh8+XiL8s=;
	b=DKsQ4TW9tmDcuT2XP9Kz92vwotK/KJqnrwwTEMvz6ayimShVFZDxFjgzu+8gxEg1VrlR
	 +G1sirIPOR+BBjgJXkeqSnnjOTNg8AlgpkCnyuiXLA6dPkuflY/krNjflMX/NYhlk0ZRG
	 QVDNsY9jwzX5bHaGPxTO0MZc7bele2B5K/w5lggQ+dShxOXHOkdqcA59LfmqewSyZbZrg
	 pQAx+sTiyDDdMXWWwbwJcPekAODD4UgjdZ9kYRHY6ewJQDLYwiw03NMPtXuv/WC1JrVoa
	 kNmALJmWK2PEL7NHCbcPInojN2BSMKNnMCM1oj0hSlKVwsemQx8oMgY7yMvgjk2u7NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="V/kB3GDA";
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F4606A326
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 10:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0F4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V/kB3GDA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so39864235e9.2
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795603803; x=1796208603; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNsoMr6T6H6tXBBcGO5QuTopXNx9EbRoa5Eh8+XiL8s=;
        b=V/kB3GDAoGGQPCfwWTLdEFMwI/7m3q3gdMyNS1tLB/XiAtqFFN8U67IxKpPbljL/wR
         QhwhCWjrcQqs0Yk0J1FfpUPjJNFfLSYOmNGJ4Qefzjez4Mvq6DFiNy29jkZh2GEy7vYw
         k8WSwyKBBdkWzEM/Ueoi1Uiu+B93sUZ35JUKCb8GsfqEywcESRxlSQgDu/pio22q2nxH
         riWm2l8e2y3AXnINIk1UEPOEKKAgC4AXySssH9gO37KYnC8VKCeUxb3AHnWpSSlbCe/Q
         6/46qTDNIm7LCLIpic473bwnaCBKV4uty1WULtlUBaFINJNud0By5gLGf+qghoeObNzs
         JunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603803; x=1796208603;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNsoMr6T6H6tXBBcGO5QuTopXNx9EbRoa5Eh8+XiL8s=;
        b=qpH56tyjl1DK+Bv63d5Qg+XUOM0DqgXsAU8rDAv2r5pieuL7+4I5bvBnKuNNVKtjFE
         WO3TwJ1nVXEZGmWNUIcr7FLgN+kQ11AJEQMRD4tDS055B5aqyhKIRJyE9u/GltD7kCyP
         igNPljGKMFKVyKtt4rqhO4Czq3LM7TJT5Rgs/GtIIx+nKxYw4IYOgn4phRddmq4rzSy4
         GNix6Ta65RpZ22a1Rt2HHMHrFrBeA1gwH8OdbG7gke0pw9jN9EspiW+r7qcmguqjsIVN
         sPHdk3EQ9rkWMFWowevP1rmDLC4dJhwl1AlXpkWCQBZznswCQCieX9LF6ZjteW92Q+9Z
         4UZQ==
X-Forwarded-Encrypted: i=1; AL+hErH9EijCbc3rEYNP2aZuukfs5hTD/RO0Yp8cWVlZmBk0weF98LU32TA71lIfG7qPx/IXaPN9@lists.linux.dev
X-Gm-Message-State: APuU4Z+CoJ9OVSYKC9gNs2ngnBxGDzYp3Hhlz949E5g/p/CqBJ7a/R2x
	kBPyGEPJXu+1xcFE/jrrG/GFSpMattnXjZRBbuzS8fzo+fa6HvX3dwfOQVoxTze3QvpW8+B62Q=
	=
X-Received: from wmdp22.prod.google.com ([2002:a05:600c:5d6:b0:4a2:1824:f77d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fc1:b0:4bb:53e4:a7cc
 with SMTP id 5b1f17b1804b1-4bb88820741mr391672135e9.30.1795603803163; Wed, 25
 Nov 2026 02:50:03 -0800 (PST)
Date: Wed, 25 Nov 2026 11:49:54 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3347; i=ardb@kernel.org;
 h=from:subject; bh=xnrI87ZBQQSKaohYJde0WQjUe3lWmPb1HGDjkOQx43Q=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZttb1CThVWc8y5vbfFdwlWLblg7Na/yWDJP43WKVuXyx
 R3ld5Z0lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIn8LGRkOHVTes33gwV3b87W
 MNNTFpqsuO26quC/nJSNR56H/lO5+orhf7ryo5Rn/74n6BlOq7X/aMhq9iXynGPSgnbbt/lpG9R 3MQMA
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125104953.381561-2-ardb+git@google.com>
Subject: [PATCH] x86/percpu: Use address space loads for per-CPU reads when
 using Clang
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Clang never discards inline asm with memory operands, even if its result
is unused [0]. This means unused per-CPU reads are always emitted,
including the load of this_cpu_off by this_cpu_ptr() in cases where the
resulting pointer is never dereferenced.

Clang's support for the __seg_gs/__seg_fs named address space qualifiers
is insufficient for full CONFIG_USE_X86_SEG_SUPPORT, but works well
enough [1] for plain loads, and is present in all versions of Clang that
Linux still cares about. So use those to implement __raw_cpu_read() on
SMP, permitting the compiler to elide them when the result is unused.

On a v7.4-rc1 defconfig build, this gets rid of 174 spurious per-CPU
loads, 136 of which are loads of this_cpu_off from this_cpu_ptr().

[0] https://github.com/llvm/llvm-project/issues/245738
[1] Exclude KMSAN, which ignores the segment base when instrumenting
    such loads.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: llvm@lists.linux.dev
Cc: x86@kernel.org

This supersedes "locking/local_lock: Don't evaluate the per-CPU lock
pointer if unused"

https://lore.kernel.org/all/20261122105646.2223131-2-ardb+git@google.com/

 arch/x86/include/asm/percpu.h | 25 ++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index cef9a4ca9841..40262edef878 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -32,13 +32,13 @@
 
 #define __force_percpu_prefix	"%%"__stringify(__percpu_seg)":"
 
-#ifdef CONFIG_CC_HAS_NAMED_AS
-
 #ifdef __CHECKER__
 # define __seg_gs		__attribute__((address_space(__seg_gs)))
 # define __seg_fs		__attribute__((address_space(__seg_fs)))
 #endif
 
+#ifdef CONFIG_CC_HAS_NAMED_AS
+
 #define __percpu_prefix
 
 #else /* !CONFIG_CC_HAS_NAMED_AS: */
@@ -144,6 +144,25 @@ do {										\
 
 #else /* !CONFIG_USE_X86_SEG_SUPPORT: */
 
+#if defined(CONFIG_SMP) && defined(CONFIG_CC_IS_CLANG) && !defined(CONFIG_KMSAN)
+
+/*
+ * Clang never discards inline asm with memory operands, even if its result is
+ * unused. Its named address space support is sufficient for plain loads, so
+ * use those instead, allowing unused per-CPU reads to be elided. KMSAN is
+ * excluded as it ignores the segment base when instrumenting such loads.
+ *
+ * Once CONFIG_USE_X86_SEG_SUPPORT is fully implemented in Clang, this version
+ * can be dropped.
+ */
+#define __raw_cpu_read(size, qual, _var)				\
+({									\
+	*(qual TYPEOF_UNQUAL(_var) CONCATENATE(__seg_, __percpu_seg) * __force) \
+		(__force uintptr_t)&(_var);				\
+})
+
+#else
+
 #define __raw_cpu_read(size, qual, _var)				\
 ({									\
 	__pcpu_type_##size pfo_val__;					\
@@ -156,6 +175,8 @@ do {										\
 	(typeof(_var))(unsigned long) pfo_val__;			\
 })
 
+#endif
+
 #define __raw_cpu_write(size, qual, _var, _val)				\
 do {									\
 	__pcpu_type_##size pto_val__ = __pcpu_cast_##size(_val);	\
-- 
2.56.1.831.g720f3f5937-goog

