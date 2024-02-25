Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A6E17997
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708891702; cv=none; b=o2dUjp7r92+UgxbxAACeOwb7NZvmviRRmpDSu9r8K0GOymQiKW1tvGZXPe64hJSNL/0ZrRDW+J/SK3K7XShRDfZ3PUgbkmJPOCTYVN/L8OorZ/daoxcBKNTm9+zpZ0TICFl2uABGe/gtZBSwCJ7OZsNn9P9uE84bX1p1LsRU2CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708891702; c=relaxed/simple;
	bh=+6Aq4tI7NATXLTxD3OjZObQWjA81Hf0PFu/KNy4tl7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxMadMv/whXEUvmz942U/aNbT3fHbslLVkoIRf+53pEvw1/Fwe7AxItsulCwIcQvmj9I5olPsw9pBKKgzbIvS30CtEK0JcB9iN7nmNbdBY5tG/FI39TMg5oDC9bftAyKOPB+/ZtaqyvvlKebRV8WAtUGYRabKKa67JbLBd+i4UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XovmT81Z; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XovmT81Z"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-563c0f13cabso2957276a12.3
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708891698; x=1709496498; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdBurprtbHQ0vf8zuRQqqoRGQBp+uV6pNFNeBm4lwRE=;
        b=XovmT81ZEbpf5KHers25RCm0muThViQajKAAszoX2lZbm9OLOnDkfjcl4ncugOLdqT
         4Fze9ywbWPJZeqryNovmhTOjIOTecHOE1NCVaCNvZ9WD7xrAXBDj4POvUrOkGqRIJlN8
         oFdnQU8FGMqO0o4WxnRF4WCUvdMuIjdoW+9wGJ6peOaRXrUD+2cZ2QHAzQQ9d7HqjqOI
         HZU65hqH30WchfOY6R9M/g0UHLS5bE6gy0LT0pTbnWCBtfiTRKnn4MO4EXftzr8IL6kv
         Zl+UM9ht+35KmE/VLyuK97IXfi/6pNryf9KCvQzhwUeGlxCQgqyf3qJaeDs0q1XVYiK3
         rWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708891698; x=1709496498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdBurprtbHQ0vf8zuRQqqoRGQBp+uV6pNFNeBm4lwRE=;
        b=CesaARhAqbQ7c+lAd1lnwtii82XKBacd4HeOw33zOxab/NDP/Jc5bI5ARlMRLJK3bV
         Q0Xp7ngicI+XEyuLsIHQ6FAvEQ+Cv2AKyumlISiPf9IDRZGnCI0LcTST0eWaPl7F9Yne
         SvwcJmJVnu09yEZkdjZhocjiNjC7YaSw2MTtplmtRCBsx739lmcBzqN+akozute3OyYA
         IKTp0rI5WT9u035l7OCsWlpIA5qT+i2unWa/OFAJ3FYGxRAM+Gg146LwXilkGEcJrAoW
         BnvXFbFp2705yMe6AX62rlCoHgFzXOZwz8l9L4Ge7E5TUrTNTvnFfj5TderEr+yI8ZYH
         PMcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh2RIBIHXiWoSY/LBX249JG1IibFfKlk7UZcyhPQ3TuzQjgHIPaujQd5Mbo2IAqXosOt4dvRZTO6sZd1F3e66HzGtsPA==
X-Gm-Message-State: AOJu0YzH42Ij37LklJ9TNBlrXoxQusO/Tr5dukytPfc6U+jRrjW4pER1
	2MOOMLNrhcBiLg52yNldafMfQPntVcOEaNxG4IA3AmsGK79jF42COaKJNl9VybI=
X-Google-Smtp-Source: AGHT+IGvoPNI50CVDNAYE+aVj9zM2DSyGYeEYRqrj2AMI1bqHKAqqb7zFpBKsWASbUgdGEAsOR89SA==
X-Received: by 2002:a17:907:9905:b0:a3e:998a:cab6 with SMTP id ka5-20020a170907990500b00a3e998acab6mr3511234ejc.74.1708891698443;
        Sun, 25 Feb 2024 12:08:18 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id hu14-20020a170907a08e00b00a4340138ab5sm504621ejc.5.2024.02.25.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:08:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 25 Feb 2024 21:08:15 +0100
Subject: [PATCH 6/7] ARM: turn CPU cache flush functions into static
 inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-arm32-cfi-v1-6-6943306f065b@linaro.org>
References: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
In-Reply-To: <20240225-arm32-cfi-v1-0-6943306f065b@linaro.org>
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

