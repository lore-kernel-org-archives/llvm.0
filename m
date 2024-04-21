Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46EF3C471
	for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713724118; cv=none; b=OLVJZBn0bQpVydEcDnDtzh6csgo3EwwmjTtf8rbhokgavrww1h9SSicfH3tEVXS108PbKHWuB2Ch6BGCt6cxOUKt5en15535Yd6sz+hPjx3vEqM7om7N2kJs750I6cFC6CgdI1dREfqLtyDv6oHR19cPxNMs/xFsWtQeTpA4ONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713724118; c=relaxed/simple;
	bh=57qF1jKo3BSDHeS8siXf9fNk2J3CajFjNKEEPxcgvQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kUpqd0m1VEVVRWWuTXLNyHHzMovA3NAhr8VFlLAO2E4Y1jBKjLoVTN+FP0DcfrGJ8PTD2Jv5pvjefIqejlTKMUYcFN1zD+ycJvJNJViQnKPpoAEl/5rIgVlAePDtPzmItgJ+hKngO/OXfyDh5lx/bflW1vqs29obd1aCDrCzrLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wWRSsv8f; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wWRSsv8f"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516d6c1e238so4648217e87.2
        for <llvm@lists.linux.dev>; Sun, 21 Apr 2024 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713724114; x=1714328914; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXHI6Nsz1rAVeXFpM1eB04t0yjhK7F1Xu95evrEKmZs=;
        b=wWRSsv8fT9Uc6hfRyu4DmVh3oQQRO+HPjJNotaoXq1t6c9vuYIn+nh1M+WFks8LtCr
         kVqyTXFN7uEzsiNIr3P2KVCTAFf9GzAIBDw2j38gWuPMfFypRm6WYSBf+Fx7lCnGSYE7
         8YtZmFm7x5O+Icbfppok0heIjbHHoGks2epChbKV16BwSd82KQTC0vG/uZsJwasoCWjn
         eq2jwgvZKv8xGvS285rq8ztvn7QwH7NVOlCeR5L2AjoFwlo6kw7aPplpNJ0FFI2vFddK
         7vnn/dG/NQN/Gvv3i81n1wS3loCMLR6sLiDi0uGkJsA/Ce4xRSYtyLgeT6onRxSFXQ1Q
         eZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713724114; x=1714328914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXHI6Nsz1rAVeXFpM1eB04t0yjhK7F1Xu95evrEKmZs=;
        b=XhWBtq6TmTrBHUSxJlIIpT+MljL//s2jyiDzFUDRB1l+UqXirG3zycGs8nX/sEjCxa
         EBpcP4/ObpOQfaEbFWZhQNndr788755VNQimJWI7prNcF2NrQ2DAnM4lXpnK21pzWsGc
         j93aEFc0VvaTgRUCJUoGXXzneQzG8T4uHmMgsslixSdfy+GowRLn5L/oL/rw9TSBhaOB
         r2famghvlEBMtCg6/y/2P2Z7928bSZRGf8muGVZQ6SAmBANHpJurlmaFS6jnNndzizH1
         SNyfGKgoc3wM6nC0aWmxYnUl+nn/CB9b2r87b5Qt5o5pJbsNxNIAartThuLoMYstibjb
         mMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2uyNwKw1oW09Aw9jIrd7O9JSGtVhTUnPpk38TEv3U2QdXlFAVSLeRz9ldr3lkZPSE7IQ5/37elU6O3pbNzqKv8XHdOg==
X-Gm-Message-State: AOJu0Yysv4M1ZM6hACeLCWIcHfkV9QfkEN0uj+L3Ueejb3YkDO4vvbq+
	04oDTsFegkMnoCeIK39aaDVIq1KtPAr/+XxeR4gVOrKqeq/WW/Cy5gKGQCBG0WM=
X-Google-Smtp-Source: AGHT+IHI8ubfJRuhzDC3wOhjJfX8IdVvqx4QDIuynL2C6QRXvbonShxzT1osPb6N5EYCnQ8weeSVfA==
X-Received: by 2002:a05:6512:98c:b0:516:e8b1:9ed5 with SMTP id w12-20020a056512098c00b00516e8b19ed5mr4373789lft.59.1713724113900;
        Sun, 21 Apr 2024 11:28:33 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b005188ea5d2b5sm1549641lfc.303.2024.04.21.11.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 11:28:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 21 Apr 2024 20:28:31 +0200
Subject: [PATCH v7 05/11] ARM: mm: Use symbol alias for two cache functions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240421-arm32-cfi-v7-5-6e132a948cc8@linaro.org>
References: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
In-Reply-To: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

The cache functions to flush user cache (*_flush_user_cache_all)
and coherent kernel range (*_coherent_kern_range) are in many
cases just a branch to the corresponfing userspace or kernelspace
function. These functions also have the same arguments.

Simplify these two by using SYM_FUNC_ALIAS() in all affected sites.

The NOP cache has very many similar calls which are just returns,
but it would be confusing to use aliases here, so leave all the
explicit returns and drop a comment on why we are not using aliases.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/cache-fa.S      | 8 ++------
 arch/arm/mm/cache-nop.S     | 4 ++++
 arch/arm/mm/cache-v4.S      | 4 +---
 arch/arm/mm/cache-v4wb.S    | 8 ++------
 arch/arm/mm/cache-v4wt.S    | 8 ++------
 arch/arm/mm/cache-v6.S      | 4 +---
 arch/arm/mm/cache-v7.S      | 4 +---
 arch/arm/mm/proc-arm1020.S  | 8 ++------
 arch/arm/mm/proc-arm1020e.S | 8 ++------
 arch/arm/mm/proc-arm1022.S  | 8 ++------
 arch/arm/mm/proc-arm1026.S  | 8 ++------
 arch/arm/mm/proc-arm920.S   | 8 ++------
 arch/arm/mm/proc-arm922.S   | 8 ++------
 arch/arm/mm/proc-arm925.S   | 8 ++------
 arch/arm/mm/proc-arm926.S   | 8 ++------
 arch/arm/mm/proc-arm940.S   | 8 ++------
 arch/arm/mm/proc-arm946.S   | 8 ++------
 arch/arm/mm/proc-feroceon.S | 8 ++------
 arch/arm/mm/proc-mohawk.S   | 8 ++------
 arch/arm/mm/proc-xsc3.S     | 8 ++------
 arch/arm/mm/proc-xscale.S   | 4 +---
 21 files changed, 40 insertions(+), 108 deletions(-)

diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index c3642d5daf38..6fe06608f34e 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -52,9 +52,7 @@ SYM_FUNC_END(fa_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(fa_flush_user_cache_all)
-	b	fa_flush_kern_cache_all
-SYM_FUNC_END(fa_flush_user_cache_all)
+SYM_FUNC_ALIAS(fa_flush_user_cache_all, fa_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -113,9 +111,7 @@ SYM_FUNC_END(fa_flush_user_cache_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-SYM_TYPED_FUNC_START(fa_coherent_kern_range)
-	b	fa_coherent_user_range
-SYM_FUNC_END(fa_coherent_kern_range)
+SYM_FUNC_ALIAS(fa_coherent_kern_range, fa_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/cache-nop.S b/arch/arm/mm/cache-nop.S
index 56e94091a55f..cd191aa90313 100644
--- a/arch/arm/mm/cache-nop.S
+++ b/arch/arm/mm/cache-nop.S
@@ -6,6 +6,10 @@
 
 #include "proc-macros.S"
 
+/*
+ * These are all open-coded instead of aliased, to make clear
+ * what is going on here: all functions are stubbed out.
+ */
 SYM_TYPED_FUNC_START(nop_flush_icache_all)
 	ret	lr
 SYM_FUNC_END(nop_flush_icache_all)
diff --git a/arch/arm/mm/cache-v4.S b/arch/arm/mm/cache-v4.S
index 22d9c9d9e0d7..f7b7e498d3b6 100644
--- a/arch/arm/mm/cache-v4.S
+++ b/arch/arm/mm/cache-v4.S
@@ -28,9 +28,7 @@ SYM_FUNC_END(v4_flush_icache_all)
  *
  *	- mm	- mm_struct describing address space
  */
-SYM_TYPED_FUNC_START(v4_flush_user_cache_all)
-	b	v4_flush_kern_cache_all
-SYM_FUNC_END(v4_flush_user_cache_all)
+SYM_FUNC_ALIAS(v4_flush_user_cache_all, v4_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
diff --git a/arch/arm/mm/cache-v4wb.S b/arch/arm/mm/cache-v4wb.S
index 0d97b594e23f..19fae44b89cd 100644
--- a/arch/arm/mm/cache-v4wb.S
+++ b/arch/arm/mm/cache-v4wb.S
@@ -66,9 +66,7 @@ SYM_FUNC_END(v4wb_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(v4wb_flush_user_cache_all)
-	b	v4wb_flush_kern_cache_all
-SYM_FUNC_END(v4wb_flush_user_cache_all)
+SYM_FUNC_ALIAS(v4wb_flush_user_cache_all, v4wb_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -151,9 +149,7 @@ SYM_FUNC_END(v4wb_flush_kern_dcache_area)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-SYM_TYPED_FUNC_START(v4wb_coherent_kern_range)
-	b	v4wb_coherent_user_range
-SYM_FUNC_END(v4wb_coherent_kern_range)
+SYM_FUNC_ALIAS(v4wb_coherent_kern_range, v4wb_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/cache-v4wt.S b/arch/arm/mm/cache-v4wt.S
index eee6d8f06b4d..5be76ff861d7 100644
--- a/arch/arm/mm/cache-v4wt.S
+++ b/arch/arm/mm/cache-v4wt.S
@@ -56,9 +56,7 @@ SYM_FUNC_END(v4wt_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(v4wt_flush_user_cache_all)
-	b	v4wt_flush_kern_cache_all
-SYM_FUNC_END(v4wt_flush_user_cache_all)
+SYM_FUNC_ALIAS(v4wt_flush_user_cache_all, v4wt_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -109,9 +107,7 @@ SYM_FUNC_END(v4wt_flush_user_cache_range)
  *	- start  - virtual start address
  *	- end	 - virtual end address
  */
-SYM_TYPED_FUNC_START(v4wt_coherent_kern_range)
-	b	v4wt_coherent_user_range
-SYM_FUNC_END(v4wt_coherent_kern_range)
+SYM_FUNC_ALIAS(v4wt_coherent_kern_range, v4wt_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/cache-v6.S b/arch/arm/mm/cache-v6.S
index 5c7549a49db5..a590044b7282 100644
--- a/arch/arm/mm/cache-v6.S
+++ b/arch/arm/mm/cache-v6.S
@@ -116,9 +116,7 @@ SYM_FUNC_END(v6_flush_user_cache_range)
  *	It is assumed that:
  *	- the Icache does not read data from the write buffer
  */
-SYM_TYPED_FUNC_START(v6_coherent_kern_range)
-	b	v6_coherent_user_range
-SYM_FUNC_END(v6_coherent_kern_range)
+SYM_FUNC_ALIAS(v6_coherent_kern_range, v6_coherent_user_range)
 
 /*
  *	v6_coherent_user_range(start,end)
diff --git a/arch/arm/mm/cache-v7.S b/arch/arm/mm/cache-v7.S
index 5908dd54de47..6c0bc756d29a 100644
--- a/arch/arm/mm/cache-v7.S
+++ b/arch/arm/mm/cache-v7.S
@@ -260,9 +260,7 @@ SYM_FUNC_END(v7_flush_user_cache_range)
  *	It is assumed that:
  *	- the Icache does not read data from the write buffer
  */
-SYM_TYPED_FUNC_START(v7_coherent_kern_range)
-	b	v7_coherent_user_range
-SYM_FUNC_END(v7_coherent_kern_range)
+SYM_FUNC_ALIAS(v7_coherent_kern_range, v7_coherent_user_range)
 
 /*
  *	v7_coherent_user_range(start,end)
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index a3f99e1c1186..379628e8ef4e 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -127,9 +127,7 @@ SYM_FUNC_END(arm1020_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(arm1020_flush_user_cache_all)
-	b	arm1020_flush_kern_cache_all
-SYM_FUNC_END(arm1020_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm1020_flush_user_cache_all, arm1020_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -201,9 +199,7 @@ SYM_FUNC_END(arm1020_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm1020_coherent_kern_range)
-	b	arm1020_coherent_user_range
-SYM_FUNC_END(arm1020_coherent_kern_range)
+SYM_FUNC_ALIAS(arm1020_coherent_kern_range, arm1020_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index 64c63eb5d830..b5846fbea040 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -127,9 +127,7 @@ SYM_FUNC_END(arm1020e_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(arm1020e_flush_user_cache_all)
-	b	arm1020e_flush_kern_cache_all
-SYM_FUNC_END(arm1020e_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm1020e_flush_user_cache_all, arm1020e_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -198,9 +196,7 @@ SYM_FUNC_END(arm1020e_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm1020e_coherent_kern_range)
-	b	arm1020e_coherent_user_range
-SYM_FUNC_END(arm1020e_coherent_kern_range)
+SYM_FUNC_ALIAS(arm1020e_coherent_kern_range, arm1020e_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index e170497353ae..c40b268cc274 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -127,9 +127,7 @@ SYM_FUNC_END(arm1022_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(arm1022_flush_user_cache_all)
-	b	arm1022_flush_kern_cache_all
-SYM_FUNC_END(arm1022_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm1022_flush_user_cache_all, arm1022_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -197,9 +195,7 @@ SYM_FUNC_END(arm1022_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm1022_coherent_kern_range)
-	b	arm1022_coherent_user_range
-SYM_FUNC_END(arm1022_coherent_kern_range)
+SYM_FUNC_ALIAS(arm1022_coherent_kern_range, arm1022_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 4b5a4849ad85..7ef2c6d88dc0 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -127,9 +127,7 @@ SYM_FUNC_END(arm1026_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(arm1026_flush_user_cache_all)
-	b	arm1026_flush_kern_cache_all
-SYM_FUNC_END(arm1026_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm1026_flush_user_cache_all, arm1026_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -192,9 +190,7 @@ SYM_FUNC_END(arm1026_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm1026_coherent_kern_range)
-	b	arm1026_coherent_user_range
-SYM_FUNC_END(arm1026_coherent_kern_range)
+SYM_FUNC_ALIAS(arm1026_coherent_kern_range, arm1026_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index fbf8937eae85..eb89a322a534 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -116,9 +116,7 @@ SYM_FUNC_END(arm920_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(arm920_flush_user_cache_all)
-	b	arm920_flush_kern_cache_all
-SYM_FUNC_END(arm920_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm920_flush_user_cache_all, arm920_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -179,9 +177,7 @@ SYM_FUNC_END(arm920_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm920_coherent_kern_range)
-	b	arm920_coherent_user_range
-SYM_FUNC_END(arm920_coherent_kern_range)
+SYM_FUNC_ALIAS(arm920_coherent_kern_range, arm920_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index ccfff2b65f49..035a1d1a26b0 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -118,9 +118,7 @@ SYM_FUNC_END(arm922_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular
  *	address space.
  */
-SYM_TYPED_FUNC_START(arm922_flush_user_cache_all)
-	b	arm922_flush_kern_cache_all
-SYM_FUNC_END(arm922_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm922_flush_user_cache_all, arm922_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -181,9 +179,7 @@ SYM_FUNC_END(arm922_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm922_coherent_kern_range)
-	b	arm922_coherent_user_range
-SYM_FUNC_END(arm922_coherent_kern_range)
+SYM_FUNC_ALIAS(arm922_coherent_kern_range, arm922_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index d0f73242f70a..2510722647b4 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -151,9 +151,7 @@ SYM_FUNC_END(arm925_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular
  *	address space.
  */
-SYM_TYPED_FUNC_START(arm925_flush_user_cache_all)
-	b	arm925_flush_kern_cache_all
-SYM_FUNC_END(arm925_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm925_flush_user_cache_all, arm925_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -227,9 +225,7 @@ SYM_FUNC_END(arm925_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm925_coherent_kern_range)
-	b	arm925_coherent_user_range
-SYM_FUNC_END(arm925_coherent_kern_range)
+SYM_FUNC_ALIAS(arm925_coherent_kern_range, arm925_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index 00f953dee122..dac4a22369ba 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -117,9 +117,7 @@ SYM_FUNC_END(arm926_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular
  *	address space.
  */
-SYM_TYPED_FUNC_START(arm926_flush_user_cache_all)
-	b	arm926_flush_kern_cache_all
-SYM_FUNC_END(arm926_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm926_flush_user_cache_all, arm926_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -190,9 +188,7 @@ SYM_FUNC_END(arm926_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm926_coherent_kern_range)
-	b	arm926_coherent_user_range
-SYM_FUNC_END(arm926_coherent_kern_range)
+SYM_FUNC_ALIAS(arm926_coherent_kern_range, arm926_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index 7e32ec271e8a..7c2268059536 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -81,9 +81,7 @@ SYM_FUNC_END(arm940_flush_icache_all)
 /*
  *	flush_user_cache_all()
  */
-SYM_TYPED_FUNC_START(arm940_flush_user_cache_all)
-	b	arm940_flush_kern_cache_all
-SYM_FUNC_END(arm940_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm940_flush_user_cache_all, arm940_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -134,9 +132,7 @@ SYM_FUNC_END(arm940_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm940_coherent_kern_range)
-	b	arm940_flush_kern_dcache_area
-SYM_FUNC_END(arm940_coherent_kern_range)
+SYM_FUNC_ALIAS(arm940_coherent_kern_range, arm940_flush_kern_dcache_area)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 4fc883572e19..3955be1f4521 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -88,9 +88,7 @@ SYM_FUNC_END(arm946_flush_icache_all)
 /*
  *	flush_user_cache_all()
  */
-SYM_TYPED_FUNC_START(arm946_flush_user_cache_all)
-	b	arm946_flush_kern_cache_all
-SYM_FUNC_END(arm946_flush_user_cache_all)
+SYM_FUNC_ALIAS(arm946_flush_user_cache_all, arm946_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -168,9 +166,7 @@ SYM_FUNC_END(arm946_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(arm946_coherent_kern_range)
-	b	arm946_coherent_user_range
-SYM_FUNC_END(arm946_coherent_kern_range)
+SYM_FUNC_ALIAS(arm946_coherent_kern_range, arm946_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index ee936c23cac5..9b1570ea6858 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -136,9 +136,7 @@ SYM_FUNC_END(feroceon_flush_icache_all)
  *	address space.
  */
 	.align	5
-SYM_TYPED_FUNC_START(feroceon_flush_user_cache_all)
-	b	feroceon_flush_kern_cache_all
-SYM_FUNC_END(feroceon_flush_user_cache_all)
+SYM_FUNC_ALIAS(feroceon_flush_user_cache_all, feroceon_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -206,9 +204,7 @@ SYM_FUNC_END(feroceon_flush_user_cache_range)
  *	- end	- virtual end address
  */
 	.align	5
-SYM_TYPED_FUNC_START(feroceon_coherent_kern_range)
-	b	feroceon_coherent_user_range
-SYM_FUNC_END(feroceon_coherent_kern_range)
+SYM_FUNC_ALIAS(feroceon_coherent_kern_range, feroceon_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 519b7ff2c589..0a94cb0464d8 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -100,9 +100,7 @@ SYM_FUNC_END(mohawk_flush_icache_all)
  *	Clean and invalidate all cache entries in a particular
  *	address space.
  */
-SYM_TYPED_FUNC_START(mohawk_flush_user_cache_all)
-	b	mohawk_flush_kern_cache_all
-SYM_FUNC_END(mohawk_flush_user_cache_all)
+SYM_FUNC_ALIAS(mohawk_flush_user_cache_all, mohawk_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -161,9 +159,7 @@ SYM_FUNC_END(mohawk_flush_user_cache_range)
  *	- start	- virtual start address
  *	- end	- virtual end address
  */
-SYM_TYPED_FUNC_START(mohawk_coherent_kern_range)
-	b	mohawk_coherent_user_range
-SYM_FUNC_END(mohawk_coherent_kern_range)
+SYM_FUNC_ALIAS(mohawk_coherent_kern_range, mohawk_coherent_user_range)
 
 /*
  *	coherent_user_range(start, end)
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index f08b3fce4c95..b2d907d748e9 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -157,9 +157,7 @@ SYM_FUNC_END(xsc3_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(xsc3_flush_user_cache_all)
-	b	xsc3_flush_kern_cache_all
-SYM_FUNC_END(xsc3_flush_user_cache_all)
+SYM_FUNC_ALIAS(xsc3_flush_user_cache_all, xsc3_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()
@@ -221,9 +219,7 @@ SYM_FUNC_END(xsc3_flush_user_cache_range)
  *	Note: single I-cache line invalidation isn't used here since
  *	it also trashes the mini I-cache used by JTAG debuggers.
  */
-SYM_TYPED_FUNC_START(xsc3_coherent_kern_range)
-	b	xsc3_coherent_user_range
-SYM_FUNC_END(xsc3_coherent_kern_range)
+SYM_FUNC_ALIAS(xsc3_coherent_kern_range, xsc3_coherent_user_range)
 
 SYM_TYPED_FUNC_START(xsc3_coherent_user_range)
 	bic	r0, r0, #CACHELINESIZE - 1
diff --git a/arch/arm/mm/proc-xscale.S b/arch/arm/mm/proc-xscale.S
index 3e427db18d5b..05d9ed952983 100644
--- a/arch/arm/mm/proc-xscale.S
+++ b/arch/arm/mm/proc-xscale.S
@@ -199,9 +199,7 @@ SYM_FUNC_END(xscale_flush_icache_all)
  *	Invalidate all cache entries in a particular address
  *	space.
  */
-SYM_TYPED_FUNC_START(xscale_flush_user_cache_all)
-	b	xscale_flush_kern_cache_all
-SYM_FUNC_END(xscale_flush_user_cache_all)
+SYM_FUNC_ALIAS(xscale_flush_user_cache_all, xscale_flush_kern_cache_all)
 
 /*
  *	flush_kern_cache_all()

-- 
2.44.0

