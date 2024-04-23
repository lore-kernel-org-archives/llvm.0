Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB8645BE1
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713856797; cv=none; b=YfH5Sm2u+IxJnIIKtG/wiDalUI+FZW1r6DxBulY9tu7e9P2MYneP8cxrmu8fYyCfKyRuIsll0r6cleTz1o4cOeDg6Wl5HgtcYVfMKUd196mMdV1iMDl94h6lLqVFwrlgyx4trkOkHB++Xflvw8rq0WshuOHKppFUD/Kbdc+UOag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713856797; c=relaxed/simple;
	bh=BcVWCV+I7qpcS+lFl1esXBWU8wGYTh+FmFE+JHkmasU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZMRXduoTxk4Zs22P4UL6QbF0KtKxHIPA82X6UjFtSDN60J793IRrsr83k6BKwTJjCxAuW0g1kRuRpW/9iLB9OnkPeUPkE9FyW3erm9P9SF4xAaS9/IpeKaao54f/yws4lFQQ2U+BDWt7uksv5cenusxe1WOfaZYpN2Y8/zj6vXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VvmSCZSY; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VvmSCZSY"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51ac5923ef6so3085356e87.0
        for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 00:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713856793; x=1714461593; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jY3aMsYXht28XY+o0T72BEo4hY2r+9R344zGJb2n/w0=;
        b=VvmSCZSY0enJkl7JfJ1a01qOPXz+TvAqnj4cH6rjz+phMUlLfkgytCTP/RKnS2t3W4
         wWp7mclnFO6tMn0/uHA3vNVEUEJrgEHcks1gY26bwpnURZNbDwMyEQclJlCzC0SaDel/
         ACjlLPiIjoSN+LsGM+jaxDzkKG/dcpeecdWsMwIrMeQoPWMcjvBckhqxQTdaU8FPbcZQ
         u8a5xEfIKR8MG+MmzEh4ROhZkJYL1dIae7jekwBVrJogmTbwYo2G/FPzsVL5xiXydbsw
         s49QhcnNRmSJh3o+ymiaBrgumC7xKDMCplHUj1gRQ4i6Sa+BJSOJPPzV3Muzy4unGAxj
         6SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713856793; x=1714461593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jY3aMsYXht28XY+o0T72BEo4hY2r+9R344zGJb2n/w0=;
        b=FPGZi0HZiRNJfFU3hSAw+xNHCnlpP2Txs6K83Os0IdYQU6IMB7NNt4HWrlsy+Il7sn
         1KZUi0nXmnMECoHNI31F1+2M/LLqGNODI9NwEhsLsm6ljeqEnj5rakj5KrhAdD0bP6sQ
         psVGwtIWOwN3VDAL9SO7JVN910ScfRPy8uzn+6z+fifUVyAPFd6lhJ/U+U7RpbqVKvzG
         Jd+af1oYSFpjSGJv6cD6sCCOBlaizX/nzqreL0kTW862W55NgkgRkhfZjPfSTA+nd/i/
         xTKMckqOvp5vUgJLy3YMx68aBu9LNiNxZAysHBLsoDWF4RYqH4haXB3HaATUL+foV6rS
         OwAw==
X-Forwarded-Encrypted: i=1; AJvYcCWrV8ivbVNLzK+Bk3mgUTILvbXmr421VW4Yn+O626Dqk8mNJjCMujp+g0zIxrOd8xizSlbo3JCtZDHLZGDbJfEoiUsdKg==
X-Gm-Message-State: AOJu0Yy2POdzlKUpXvmsSUc6DIcZj1wgb0E+1ewgIo0ZolEod0j2FL+O
	nuMRLA2yZBhToOMqhmFQ/oD0ocv04e+Yk6x/+xB09fjOSvTWSAeFkxl7R31gU/0=
X-Google-Smtp-Source: AGHT+IFL/H+Ihy2xTG6h/G19kpbn4QUwzF3b9YxWJq/XoKRNhjTUTbtWz379lv3xrQSmuUG5SnCHOw==
X-Received: by 2002:ac2:5bc4:0:b0:518:930d:17c7 with SMTP id u4-20020ac25bc4000000b00518930d17c7mr550434lfn.29.1713856793567;
        Tue, 23 Apr 2024 00:19:53 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f13-20020a056512360d00b0051ad4552454sm1307588lfs.148.2024.04.23.00.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:19:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2024 09:19:49 +0200
Subject: [PATCH v8 3/9] ARM: mm: Use symbol alias for two cache functions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240423-arm32-cfi-v8-3-08f10f5d9297@linaro.org>
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
In-Reply-To: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

The cache functions to flush user cache (*_flush_user_cache_all)
are in many cases just a branch to the corresponfing userspace or
kernelspace function. These functions also have the same arguments.

Simplify these two by using SYM_FUNC_ALIAS() in all affected sites.

The NOP cache has very many similar calls which are just returns,
but it would be confusing to use aliases here, so leave all the
explicit returns and drop a comment on why we are not using aliases.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/cache-fa.S      | 4 +---
 arch/arm/mm/cache-nop.S     | 4 ++++
 arch/arm/mm/cache-v4.S      | 4 +---
 arch/arm/mm/cache-v4wb.S    | 4 +---
 arch/arm/mm/cache-v4wt.S    | 4 +---
 arch/arm/mm/proc-arm1020.S  | 4 +---
 arch/arm/mm/proc-arm1020e.S | 4 +---
 arch/arm/mm/proc-arm1022.S  | 4 +---
 arch/arm/mm/proc-arm1026.S  | 4 +---
 arch/arm/mm/proc-arm920.S   | 4 +---
 arch/arm/mm/proc-arm922.S   | 4 +---
 arch/arm/mm/proc-arm925.S   | 4 +---
 arch/arm/mm/proc-arm926.S   | 4 +---
 arch/arm/mm/proc-arm940.S   | 4 +---
 arch/arm/mm/proc-arm946.S   | 4 +---
 arch/arm/mm/proc-feroceon.S | 4 +---
 arch/arm/mm/proc-mohawk.S   | 4 +---
 arch/arm/mm/proc-xsc3.S     | 4 +---
 arch/arm/mm/proc-xscale.S   | 4 +---
 19 files changed, 22 insertions(+), 54 deletions(-)

diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index c3642d5daf38..ecd08bf440cb 100644
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
index 0d97b594e23f..00488108a873 100644
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
diff --git a/arch/arm/mm/cache-v4wt.S b/arch/arm/mm/cache-v4wt.S
index eee6d8f06b4d..573f65271cbb 100644
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
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index a3f99e1c1186..2c873e65a5b9 100644
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
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index 64c63eb5d830..d8217737a60b 100644
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
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index e170497353ae..5348cebe7e71 100644
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
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index 4b5a4849ad85..466f861d750c 100644
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
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index fbf8937eae85..6a6e26850a54 100644
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
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index ccfff2b65f49..56230e547762 100644
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
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index d0f73242f70a..aeb4ee16dcc9 100644
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
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index 00f953dee122..221aada5d288 100644
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
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index 7e32ec271e8a..23646bf801e1 100644
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
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 4fc883572e19..763a5a9bc735 100644
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
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index ee936c23cac5..d31fe58bf475 100644
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
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 519b7ff2c589..949e2f254779 100644
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
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index f08b3fce4c95..ac3d99b49cc0 100644
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

