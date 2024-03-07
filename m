Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1417D12DDA1
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821334; cv=none; b=swrrNjK9FlF9+zJ+ZY81vvNkZYu5u7rpBRoa8SrKQpZRxRewMMlMzVc7ZJyolYeg1kMtF1SvhUvtjuJybJNWyAacfj8WYBC1Y3blxU3idYFOKbI14DXw2sTXsO9vWEIvZG3s7XF9VTTIBDgV39QItZXYs3fr1VXNnHXySB58nts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821334; c=relaxed/simple;
	bh=+6Aq4tI7NATXLTxD3OjZObQWjA81Hf0PFu/KNy4tl7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GsETkngRWX8BEmHnIwP9pIQRsZsVwe7q6DyOYFVGejMNv8YVqimvXyQCFRy0RT4B1sqZilYc/hkEWvoC0K7tLAwTtSHxPm+21wTLxTHr8uQstTU5BJyI86yOQBU3zVSWJXF8cHbnfS3Im+VGINL/6ODgpHH8cdF/EgtlhlNRUgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WXhKpHbO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WXhKpHbO"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51323dfce59so884500e87.3
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821331; x=1710426131; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdBurprtbHQ0vf8zuRQqqoRGQBp+uV6pNFNeBm4lwRE=;
        b=WXhKpHbOGZweim/FhU4MJPAPN5Xht0P8o4uVRWxd7i9DBn9yEZLuQPaRatE2ji2aSy
         zaZ+2nkzkShGMhIrcpcrP3WMIUPyMsdFE8xLB6Fj8PUAUJfAJFcWdxggglYcDyZyPQKs
         k5C/r+HNgXl/LRnh96ABBiK0Q1uvZoMbYp/hUBg25py/CLv3Vk0keQnQYdTapB1hYzA1
         FzAZo3VOngtTm6YNs30j9qUCFjbAT8T2HyfAPSK+sR1hxweJfC69xVzfPzqbPsgpKy5t
         JGtGfeX0ogmq3gFHKXlfzQIveNfwlr1U3j711qBendc8eoJ2qgOLWOl7jhTig913DcvO
         orng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821331; x=1710426131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdBurprtbHQ0vf8zuRQqqoRGQBp+uV6pNFNeBm4lwRE=;
        b=HlNPN/kq0RqiUJorG1NO0HFFHUh7t0WZpYeCJgEZGtl8OoKr+I8d6u8PurMsQplGvJ
         XEmgpr91XTEqReE3tfyUU1rewm7YJYRDhVUPjkQfxaxM9PhRC1ORXs0x4T0ueALz/60i
         80JuzF9GIF1K0g1MOl+LIFEoe0294DxZVDGzqFUI9dWT9NONgySF0ZizCTXHP1cFlfrI
         3tY7Sg+IgKHTiZQS3zwlQ4aCzA53NR8iVysLOusqfnZ9XPwxAkrnI+MnXOZQqPUX8nPk
         DZ8NIe5r8G4Z4xUMutiSAOD1Dk4ROEIKyKF/1iDjT9HcrBs9O0ww73ey5lbSParep0Wh
         +hGg==
X-Forwarded-Encrypted: i=1; AJvYcCWlkYWSjMZlpt0HadA89YFbr8VXJCqWjscOQBNmXYaDJt9pq1vyJlMZPTLp/TyJTj17tMDlhUZm71SGd/lj8+oy1Pdi+A==
X-Gm-Message-State: AOJu0YyeotmhT7/DQ8/HSl4GK13EHMVs+uomriRMbPE1O4UbeABQi9ou
	1EzH90IvlYA2YC4QhJea7sy3QsYGSHu8AbmmTCo1oG5rWcioYUH5OIJ+4QPDUrs=
X-Google-Smtp-Source: AGHT+IF1nk9H64kQ8tJhZkw9Mweac5JVWSD30bjZZ4qOdm9T9dqmbpu8DjJBXk4PnLtBpqOSRtMGzw==
X-Received: by 2002:a05:6512:10c3:b0:513:2643:873d with SMTP id k3-20020a05651210c300b005132643873dmr2066032lfg.36.1709821331003;
        Thu, 07 Mar 2024 06:22:11 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:10 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 07 Mar 2024 15:22:05 +0100
Subject: [PATCH v2 6/9] ARM: turn CPU cache flush functions into static
 inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-arm32-cfi-v2-6-cc74ea0306b3@linaro.org>
References: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
In-Reply-To: <20240307-arm32-cfi-v2-0-cc74ea0306b3@linaro.org>
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

