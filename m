Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F480136338
	for <llvm@lists.linux.dev>; Tue, 22 Oct 2024 01:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729562363; cv=none; b=fIl5wYPoqyFYLGeh5/REl6/x+JXbmlMnCsnyiZCINYBmOGt/DOl0lARTRDNhTz2aazCtu7wMKQZf11QIVOU57zMkQV9vgxr7bNHQJdlcaUzCKwA2O94c/U7xRn74jhKwK3eLrVIANMcv8lZcmPt4BKQwZGfby9U86lSnxlQqdE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729562363; c=relaxed/simple;
	bh=HSEfPsPiUBnxTzmMef4BmRun0qrOrmSw4r/gFQ8im9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SVjQes/AXK2ZimiGbkTtJz2iKsSTJ9DF6xAh1UooYrLh5nQtzho6qEWUBUBtYsnrS8CTvS/L8dn+2eMdp/0mgnVuRUi460kL5B16D9O5WrONvMwzLiPSnaK7nSXJFoJlAMXZFFPR2haQiRRk1VjBGZAzECSZWC8Eww+vgKm6X8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=l7H9lNPQ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l7H9lNPQ"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e57d89ffaso3957918b3a.1
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 18:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729562360; x=1730167160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Af9tK0JLBBTeDXRGuA1c/z94Xn/abI+OOOquUfcf3I8=;
        b=l7H9lNPQte8FxQcFPRg/+SAR9Hvnm9zZyLXvtM6Mfi1m8OEEu0i3WgpVkTgtrAayEf
         tTxaiTbib3M23ylV3KkFrauNEM2Ra7WWLms/1QgHqP32PsVlKQzrjMbQ5Rm+MKF3YyKE
         y5x8FjZgIE0NEYnYCC/IURBv5gxf6T7xCWgRd2XVi3RJUBWbIbWpIgjOm9eRakMktlHW
         QnMDFqSeJtKSkNzXG57vQh3prC/GDV7vG+NHl9BC8rc/ZkTlHJGSu/qTCxzqfDJcNsK/
         TULItcwb2H19qW3smW7dKql+Wc+xqRUzLgNY5QyPqjHnd7NJbBpEDuTA+X65gwnx+/t7
         +YbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729562360; x=1730167160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af9tK0JLBBTeDXRGuA1c/z94Xn/abI+OOOquUfcf3I8=;
        b=ibb/fKY/ZNePIzB2d+lA5FPdH1XbJCkCkn2eYz77kA/q4b/ACBWgxQ1xqYtkgDDkey
         OMKeFVnnenZ4XAlGJGmDo6Vt2b9Ph9uHTiAKo4YR57aqUb6QqqJMGIe3dSX/E4xmAe9S
         jGi1EZ5ytXM2vN1kN8gIXcX7TTVELy3yr7v8+LCNafGwGYHSkbl0kkfV9HvWUvvqRCqE
         CKulv354n3r0KMBP9i0gicC4b8vNNOr/MiFg5NzDCv+AMche7w7YNb7ye7lBK94+bm/9
         GuLEwJV6rFNro+gNPxW6kvHudFlvxtNEvs2En5dwjf14tNzT5nopXh08pRd93xRR++UY
         jfew==
X-Gm-Message-State: AOJu0Yxuu1FZjHmR3wL6w+2WD7rJNmCmyDMpb78qDv+AjqkTkQrV7ALY
	3AcX+FIA3PdePZNwux+q126HgQmjZoerQqqughCUAiNfjUHS9t+Uipl4HUb3EGg=
X-Google-Smtp-Source: AGHT+IH5wPAzHdVfv0MMInx9ySs4Jc9bkPSFs6F+LS8CNw/7mEjClw2+t/2vEVp2yPC3jOJm28L3Qw==
X-Received: by 2002:a05:6a00:4610:b0:71e:6489:d06 with SMTP id d2e1a72fcca58-71edb972451mr3011651b3a.0.1729562359943;
        Mon, 21 Oct 2024 18:59:19 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec132ffdcsm3600710b3a.46.2024.10.21.18.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 18:59:19 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 2/9] kasan: sw_tags: Check kasan_flag_enabled at runtime
Date: Mon, 21 Oct 2024 18:57:10 -0700
Message-ID: <20241022015913.3524425-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241022015913.3524425-1-samuel.holland@sifive.com>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
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

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

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

