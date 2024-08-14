Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D93142E70
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723625787; cv=none; b=FCZCwRfR8Gkvdk7uqkbLAmTuD69xilfCozszZ4zQIA/cLQPkmRCie7qZzQVB4F08xt4rUuq2cJTBskttrOmT4SLPw2ZPAid3C3V13EQ6NRtpEw9gCFmmRIKGi9VS7+/G7KqjlVcyJTHSWpJ/DY1ebotT+sv1yzR9NtjOcpWu/jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723625787; c=relaxed/simple;
	bh=QNPV6YAxAwjPr8tRapnFeYxKReX2lKJudVzzSx9QcNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXhJpo6Ho4/z9/OLfX1U9RIAvbIqCcY1gh4cvWevkwcLy3ZrrwyYfqCc0Wd7L5CscNak1ZNdf58RXqvCxwCZtQGLGI5JlL4H55H7IZ6eJuT2/fS+9hZ1JFfvsRYhxP6D8sIuSWMIL7jZE2BjaxnCL3PHAIDib/bm1crz6r670vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=g5ApzLoi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="g5ApzLoi"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc66fc35f2so5183245ad.0
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 01:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723625784; x=1724230584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOU7P9jn4wor6Rdt5JEa4HOxmny7NogNXhx9YRYE+tY=;
        b=g5ApzLoiWmPdaNhxAQvKNmT58KsMcmhcPRdHL1FrZya8kwUk6/jcDkJwNdBEpe/Dix
         A/jdYGUqfuB7xz4R2LQ3bCEnDNLLLoVlNZuutxsHVLhel5V3BdcfyaiHYfVbNG6122LB
         S0mokdHOSxHq86auryOGZ4RoCYZ6FM4Yb3rUoU9RkGCl18szV5B+cQmN0RIUxo1M5XCe
         Dy3id2c89/uJ+3vFZCtk/IUScK19d8ISRkF70JYgp2LASjJ3ie7bvW07ReoF3vIAidDU
         KIpKpXTB8pPEWA5MLFMH8J29GrVsZTG4BQYz4T46mUcfyOuPCg4ZnxK8XhEZLAjaZg51
         yZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723625784; x=1724230584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOU7P9jn4wor6Rdt5JEa4HOxmny7NogNXhx9YRYE+tY=;
        b=v3v6+eol5/TSR/Un6hyta7IJpWcTktw71y7OUKGO5r7wgAaN8prfBIANJJiF7lzelz
         Yny5csgdRnJYKHcoCAmR94YlAuunh2NCEuqU8Q5JPECk59QzLU1eGG97ID0KVuwvcSSQ
         9GC/XhPDA1BtuzQok4YmUySD+BJN/Lhithpqr21dxeaY96PBJUQ+7b+6Uec37ISpfw3g
         m1nnN++CySetYrWguCc/AyyI04zM1tKcYJiRqzNGAlFImRwCHGKmC8OtKL37WODPi3SO
         ehZK+Mn+wIUY4fHgT7vlr/zNDq1S47vEIX3+EIj4z6I2+wUdEBrUu9ayhhh9KKx83P4v
         aeFg==
X-Gm-Message-State: AOJu0YwswBpxYYbf1SJ2HvHn+r9arTEeqlzXBWR7FPpxmTuxiPQ7In7D
	9Gln/6piWB0EuobjNzMdC4+2gAl4zfEbEimMkHpug6VqLOqlJBfK1qeVxfyuDjd/TQljUADPMBo
	j
X-Google-Smtp-Source: AGHT+IHtUXL6qE88NcA742NNnvRZ3OwS1PEsV1FbKiWQihqr5xxMbeis8+zR2wt/Qw0zy68klcF0mw==
X-Received: by 2002:a17:902:e741:b0:201:dc7b:a88f with SMTP id d9443c01a7336-201dc7bae70mr15567155ad.25.1723625783955;
        Wed, 14 Aug 2024 01:56:23 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14a7b8sm25439615ad.100.2024.08.14.01.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:56:23 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 2/7] kasan: sw_tags: Check kasan_flag_enabled at runtime
Date: Wed, 14 Aug 2024 01:55:30 -0700
Message-ID: <20240814085618.968833-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814085618.968833-1-samuel.holland@sifive.com>
References: <20240814085618.968833-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On RISC-V, the ISA extension required to dereference tagged pointers is
optional, and the interface to enable pointer masking requires firmware
support. Therefore, we must detect at runtime if sw_tags is usable on a
given machine. Reuse the logic from hw_tags to dynamically enable KASAN.

This commit makes no functional change to the KASAN_HW_TAGS code path.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/linux/kasan-enabled.h | 15 +++++----------
 mm/kasan/hw_tags.c            | 10 ----------
 mm/kasan/tags.c               | 10 ++++++++++
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 6f612d69ea0c..648bda9495b7 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -4,7 +4,7 @@
 
 #include <linux/static_key.h>
 
-#ifdef CONFIG_KASAN_HW_TAGS
+#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
 
 DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
 
@@ -13,23 +13,18 @@ static __always_inline bool kasan_enabled(void)
 	return static_branch_likely(&kasan_flag_enabled);
 }
 
-static inline bool kasan_hw_tags_enabled(void)
-{
-	return kasan_enabled();
-}
-
-#else /* CONFIG_KASAN_HW_TAGS */
+#else /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS */
 
 static inline bool kasan_enabled(void)
 {
 	return IS_ENABLED(CONFIG_KASAN);
 }
 
+#endif /* CONFIG_KASAN_SW_TAGS || CONFIG_KASAN_HW_TAGS */
+
 static inline bool kasan_hw_tags_enabled(void)
 {
-	return false;
+	return IS_ENABLED(CONFIG_KASAN_HW_TAGS) && kasan_enabled();
 }
 
-#endif /* CONFIG_KASAN_HW_TAGS */
-
 #endif /* LINUX_KASAN_ENABLED_H */
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index 9958ebc15d38..c3beeb94efa5 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -43,13 +43,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
 static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
 static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
 
-/*
- * Whether KASAN is enabled at all.
- * The value remains false until KASAN is initialized by kasan_init_hw_tags().
- */
-DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
-EXPORT_SYMBOL(kasan_flag_enabled);
-
 /*
  * Whether the selected mode is synchronous, asynchronous, or asymmetric.
  * Defaults to KASAN_MODE_SYNC.
@@ -257,9 +250,6 @@ void __init kasan_init_hw_tags(void)
 
 	kasan_init_tags();
 
-	/* KASAN is now initialized, enable it. */
-	static_branch_enable(&kasan_flag_enabled);
-
 	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s)\n",
 		kasan_mode_info(),
 		kasan_vmalloc_enabled() ? "on" : "off",
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index d65d48b85f90..c111d98961ed 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -32,6 +32,13 @@ enum kasan_arg_stacktrace {
 
 static enum kasan_arg_stacktrace kasan_arg_stacktrace __initdata;
 
+/*
+ * Whether KASAN is enabled at all.
+ * The value remains false until KASAN is initialized by kasan_init_tags().
+ */
+DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
+EXPORT_SYMBOL(kasan_flag_enabled);
+
 /* Whether to collect alloc/free stack traces. */
 DEFINE_STATIC_KEY_TRUE(kasan_flag_stacktrace);
 
@@ -92,6 +99,9 @@ void __init kasan_init_tags(void)
 		if (WARN_ON(!stack_ring.entries))
 			static_branch_disable(&kasan_flag_stacktrace);
 	}
+
+	/* KASAN is now initialized, enable it. */
+	static_branch_enable(&kasan_flag_enabled);
 }
 
 static void save_stack_info(struct kmem_cache *cache, void *object,
-- 
2.45.1

