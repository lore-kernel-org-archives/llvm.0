Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53B139F
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342670; cv=none; b=rBUhL4nIWzHDPGPyDHpFusQZT82XKEEdhVQsms5Lj8J7/UYyoL6pi+2aj81TrDiDM3jqYp7/xUZjZvadvUsANhVv51dMVfmdQepYVwYqQJwxd4mqSAWi0M1kqr23joxIcNmTBWTPEfz4CMPMLtHFuJOEXceoeqSfTBFfQATN7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342670; c=relaxed/simple;
	bh=57qF1jKo3BSDHeS8siXf9fNk2J3CajFjNKEEPxcgvQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QElkJAkmFKcrBQVMF/RZFeCP5MD5Alewk89PzgeH/Y1dCwbX6EBTk4p2tw9XOhccXLfIl4IeuSUGM1Z2DpJyawh3Mm/plvIY+ZBvpI7TMANYYcWsmvKaD7bHYnQgvxD2qLvgSVyDdqGTXgzU/DJbZzcptBZKkGmt9eG+B+lKLVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tygB+b4Y; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tygB+b4Y"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-516d1c8dc79so6814555e87.1
        for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 01:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713342666; x=1713947466; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXHI6Nsz1rAVeXFpM1eB04t0yjhK7F1Xu95evrEKmZs=;
        b=tygB+b4YoHq8hHzkD3pdg4UxAHStsBaeptj7YTQPpYVCci1sqDLww9WV8w2/mpcMqs
         TdnUvz2vusliZav0seg0/5SmoQ3VLK9bKqJ6imnFq6v/tAyYsHcVSt1F4d4k0uN5xhy+
         aWpHAwELksQ6VKEGz6mwgQqQDao6PKTyPnO0/+i1j6rpJUWMhpqXX1ZNuuWLUJqxg351
         gvpjvXkeS+uN5RSOVj9NAxAoKC633Neb5FWYlzZnv6oN2+HBZcxJEICQBYhkSjAFm1Nq
         oKa3nZpJzQOYT3aJbByJkXguepy/NqN1tMc2+2uIxlSqXFvPklRwFTDCquVHWwurcdkN
         qZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713342666; x=1713947466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXHI6Nsz1rAVeXFpM1eB04t0yjhK7F1Xu95evrEKmZs=;
        b=nY5H27NaHpF5c/MmUzl7NKlsp90iEe4+bR2JRSiSN5lxQNntjyFaoHFBxGL0WNKpVL
         4D2Y9GJS5jxZ4mpoEddr97/euaavKUqVLetOsFQmvLXpauSB5oBxjm302sUo3DQpv1yz
         hxpzIAh/qUDxXshaOjyngT5A1vEBiNWx8m5nyd2+xqx+5hS9CNVy0dJDlutNDWDZqyK3
         95shqL/suE5XwtwlyiDwCuBHG+VL9pQFjLAJyvNmR4fi20ZxaUmBqGmBegsb5j7o2hmk
         x/ZRmom9f1lrH4VYOtF+RAAhICf2a85ED1toSNxhQMP24bAT7+Fyd+/RHa+PXPME2pd7
         okjw==
X-Forwarded-Encrypted: i=1; AJvYcCWxEQUBNMYP3DFbxJxwsXB1af0gdBZfGAo1lSqOapCXKzjKrknlQ0QEFwdT5i9REc+l7AF5Y/erNMF9a6LNF21GVWtmiw==
X-Gm-Message-State: AOJu0YwHBpIEzF88ehdImWdvBkrhZ1FAcVwLm2lmWxpDfsEq5QLviqHk
	gOv/bWxgPwwGpNWn5edrvlnrj+S5tI9FrUZeia/k5tE8MEUBOqLItwd9z5DvKqM=
X-Google-Smtp-Source: AGHT+IHB8JCX6D6ARLtFbTFppzo86HK5yM6Uifs8urhKBhLeAmtBKFR3966aqUEppyYYtX8U6nusCA==
X-Received: by 2002:ac2:41ca:0:b0:516:cebc:f294 with SMTP id d10-20020ac241ca000000b00516cebcf294mr10328987lfi.16.1713342665726;
        Wed, 17 Apr 2024 01:31:05 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id d10-20020ac24c8a000000b00516d2489f16sm1873151lfl.260.2024.04.17.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 01:31:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:30:54 +0200
Subject: [PATCH v6 05/11] ARM: mm: Use symbol alias for two cache functions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-arm32-cfi-v6-5-6486385eb136@linaro.org>
References: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
In-Reply-To: <20240417-arm32-cfi-v6-0-6486385eb136@linaro.org>
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

