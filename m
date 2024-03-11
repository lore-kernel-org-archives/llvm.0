Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0A17557
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148551; cv=none; b=FGRSX8IIW7mwMdtgpvYj3Vl3risEheFLsTuu6TD1h7Z4iwpMdMxH8+Oe7BgOpVYO6sRrRVwmUaJmNd7nIJIaNwhKVPKaCe/QrOU9nh28y8jyp7EZO+LUvhBnmmFPjky8pgkXMn+FX7ddOPwt511E6cq+SJvY8+jjroLrYArz8dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148551; c=relaxed/simple;
	bh=+6Aq4tI7NATXLTxD3OjZObQWjA81Hf0PFu/KNy4tl7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sy1cl8LpWzgxVYg4Ha1JfrqCvakYtjgvY0Ie+J5r0062UMITfywGhhOHOkYFLBrR+b61Gd/j6k+6hNeFK4Js+ASDQaiXXNvfL2hYx7Kjvw7G+qtJMzNOoowJMUCGbBkJyneaxx/Hp/qhuocDSQHOLbEcHgaVBBJSozgjMm57ZwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLze9orp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLze9orp"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a449c5411e1so527748166b.1
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148548; x=1710753348; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdBurprtbHQ0vf8zuRQqqoRGQBp+uV6pNFNeBm4lwRE=;
        b=nLze9orpbI52mndtFo7iOafYC4U3j/SUBmVwzHSe3JWj4FX4j5FCLZOd5LKDdI1Wbl
         4RbYtxqiDyBfvQZuZTXXxnSavKjPl2BPdD+zxZ9DdCtwVKsCtzDaCGI+HFuNAuqYpj6i
         M6v96SSwbl4xqhpHmGghaF/nvY2huP12J95TlWohTiKY6LAhC/w0ABYUZEAqNs4Pv/ca
         qh8ZXFvRL6WKNY+vOpGfFiJ7PaeUayBY/OCfdAnohiPwx8S91Bqbuq9ZskVRuhCBusgF
         wzDa/4BZNHCYxm59By4j+cUFCFqqC9isR98UdChRI5nuMK/mgSAK5nhwxxoHDdbdSSLg
         oOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148548; x=1710753348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdBurprtbHQ0vf8zuRQqqoRGQBp+uV6pNFNeBm4lwRE=;
        b=amw9oTu4fEkfcVLz5dDGsn5VOQnccVUDo4GF31uReyaDsiu0iaZoEMpIE9D2iuZB5T
         QLVkaw7X5/zRstUyOSBXYBhe7KnAF3kBxGEb0v1HBeYf+AMWTjQDhVlVfdJya5jFv+Mn
         5ZoleUInwUHT6GCKg1cN5qFGriK8AaggC6iSMW63TcBJ9k/kDDbSXKPmWMYNUk5Uq83K
         8Mq2NeEh80NOmpgNdOUXgIM1j134JOPhgeS9X7JncGkLXgP3xI1ZpP6/R0omvNAJFKax
         N/wozrWwzR7hZ3kxT348Xqm+WbWVTg27TQU00vyhIJCaqPTFEavWHB7XDGwx3h/1dlhM
         U/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf8q3/mj02aJKlmpNYbunnfd7N4PRHxwrbbaaKAdDIdPX3Rq9PGWDSVZOxHuVV7CSXX9LIgPB84SaMYeTBYGrel7t2aA==
X-Gm-Message-State: AOJu0Yzo6+oTftj3BrPL3XYXBeSpV/AK7/cNLGdAN4pi3Z1OUgyyyYYg
	UlZ/9B7DQmWro2IoTlHaacKu+uKgX+RGxLIzeHrr0cma8yJkmOD6ENZiiFiqxYU=
X-Google-Smtp-Source: AGHT+IGCKVRCMNm4d7RaSP2AIHUR6qOcRrq2AW65Wn2VjdPU4Vxx7Xtxb1FBgRbUXJM6bi+wUUzI9A==
X-Received: by 2002:a17:907:a706:b0:a3e:b263:d769 with SMTP id vw6-20020a170907a70600b00a3eb263d769mr4089359ejc.4.1710148547853;
        Mon, 11 Mar 2024 02:15:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:47 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 10:15:43 +0100
Subject: [PATCH v3 6/9] ARM: turn CPU cache flush functions into static
 inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-arm32-cfi-v3-6-224a0f0a45c2@linaro.org>
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
In-Reply-To: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The members of the vector table struct cpu_cache_fns cpu_cache
are called directly using defines, but this is really confusing
for KCFI. Wrap the calls in static inlines and tag them with
__nocfi so things start to work.

Conversely a similar approach is used for the __glue() helpers
which define their way into an assembly ENTRY(symbol) for respective
CPU variant. We wrap these into static inlines and prefix them
with __nocfi as well. (This happens on !MULTI_CACHE systems.)
For this case we also need to invoke the __glue() macro to
provide a proper function prototype for the inner function.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/cacheflush.h | 45 +++++++++++++++++++++++++++++++--------
 arch/arm/mm/dma.h                 | 28 ++++++++++++++++++------
 2 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/arch/arm/include/asm/cacheflush.h b/arch/arm/include/asm/cacheflush.h
index 1075534b0a2e..76fb665162a4 100644
--- a/arch/arm/include/asm/cacheflush.h
+++ b/arch/arm/include/asm/cacheflush.h
@@ -122,14 +122,38 @@ struct cpu_cache_fns {
 
 extern struct cpu_cache_fns cpu_cache;
 
-#define __cpuc_flush_icache_all		cpu_cache.flush_icache_all
-#define __cpuc_flush_kern_all		cpu_cache.flush_kern_all
-#define __cpuc_flush_kern_louis		cpu_cache.flush_kern_louis
-#define __cpuc_flush_user_all		cpu_cache.flush_user_all
-#define __cpuc_flush_user_range		cpu_cache.flush_user_range
-#define __cpuc_coherent_kern_range	cpu_cache.coherent_kern_range
-#define __cpuc_coherent_user_range	cpu_cache.coherent_user_range
-#define __cpuc_flush_dcache_area	cpu_cache.flush_kern_dcache_area
+static inline void __nocfi __cpuc_flush_icache_all(void)
+{
+	cpu_cache.flush_icache_all();
+}
+static inline void __nocfi __cpuc_flush_kern_all(void)
+{
+	cpu_cache.flush_icache_all();
+}
+static inline void __nocfi __cpuc_flush_kern_louis(void)
+{
+	cpu_cache.flush_kern_louis();
+}
+static inline void __nocfi __cpuc_flush_user_all(void)
+{
+	cpu_cache.flush_user_all();
+}
+static inline void __nocfi __cpuc_flush_user_range(unsigned long start, unsigned long end, unsigned int flags)
+{
+	cpu_cache.flush_user_range(start, end, flags);
+}
+static inline void __nocfi __cpuc_coherent_kern_range(unsigned long start, unsigned long end)
+{
+	cpu_cache.coherent_kern_range(start, end);
+}
+static inline int __nocfi __cpuc_coherent_user_range(unsigned long start, unsigned long end)
+{
+	return cpu_cache.coherent_user_range(start, end);
+}
+static inline void __nocfi __cpuc_flush_dcache_area(void *kaddr, size_t sz)
+{
+	cpu_cache.flush_kern_dcache_area(kaddr, sz);
+}
 
 /*
  * These are private to the dma-mapping API.  Do not use directly.
@@ -137,7 +161,10 @@ extern struct cpu_cache_fns cpu_cache;
  * is visible to DMA, or data written by DMA to system memory is
  * visible to the CPU.
  */
-#define dmac_flush_range		cpu_cache.dma_flush_range
+static inline void __nocfi dmac_flush_range(const void *start, const void *end)
+{
+	cpu_cache.dma_flush_range(start, end);
+}
 
 #else
 
diff --git a/arch/arm/mm/dma.h b/arch/arm/mm/dma.h
index aaef64b7f177..251b8a9fffc1 100644
--- a/arch/arm/mm/dma.h
+++ b/arch/arm/mm/dma.h
@@ -5,8 +5,6 @@
 #include <asm/glue-cache.h>
 
 #ifndef MULTI_CACHE
-#define dmac_map_area			__glue(_CACHE,_dma_map_area)
-#define dmac_unmap_area 		__glue(_CACHE,_dma_unmap_area)
 
 /*
  * These are private to the dma-mapping API.  Do not use directly.
@@ -14,8 +12,20 @@
  * is visible to DMA, or data written by DMA to system memory is
  * visible to the CPU.
  */
-extern void dmac_map_area(const void *, size_t, int);
-extern void dmac_unmap_area(const void *, size_t, int);
+
+/* These turn into function declarations for each per-CPU glue function */
+void __glue(_CACHE,_dma_map_area)(const void *, size_t, int);
+void __glue(_CACHE,_dma_unmap_area)(const void *, size_t, int);
+
+static inline void __nocfi dmac_map_area(const void *start, size_t sz, int flags)
+{
+	__glue(_CACHE,_dma_map_area)(start, sz, flags);
+}
+
+static inline void __nocfi dmac_unmap_area(const void *start, size_t sz, int flags)
+{
+	__glue(_CACHE,_dma_unmap_area)(start, sz, flags);
+}
 
 #else
 
@@ -25,8 +35,14 @@ extern void dmac_unmap_area(const void *, size_t, int);
  * is visible to DMA, or data written by DMA to system memory is
  * visible to the CPU.
  */
-#define dmac_map_area			cpu_cache.dma_map_area
-#define dmac_unmap_area 		cpu_cache.dma_unmap_area
+static inline void __nocfi dmac_map_area(const void *start, size_t sz, int flags)
+{
+	cpu_cache.dma_map_area(start, sz, flags);
+}
+static inline void __nocfi dmac_unmap_area(const void *start, size_t sz, int flags)
+{
+	cpu_cache.dma_unmap_area(start, sz, flags);
+}
 
 #endif
 

-- 
2.34.1

