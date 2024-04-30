Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362F2BB07
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 08:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714465576; cv=none; b=Y72XGFLEAlnkN8nQA+zxJGtMzND7fRSNRXoZ6X85Nv8/19nL7ftgAumk/eklPn6xMSFaBwqnK1ZFhbKwhS41jLN67/MPpMrScSnte5HmLBJJS/HGFjPZII0CNcMayTMFT01KnhfbtafWOIEUckmu+ki12ugjKh2KAtuoEFSDk6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714465576; c=relaxed/simple;
	bh=3Py5bN69W5+LfhKjOb7inUjTwA0PbeaqzwPcySuT2No=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vCVs/592Kxp9vGKSygM/+djLWihwzGPCS147hioKwrYtinhrKIPBbWnbx40du6wwctni4XXFEKSB2V/cJgzW5Ppha2sSbYtCWJ6OV61lhdxWYa/8rCdEqXMF5Ck90JwPDQrn5+aPJVouq/DT2dnc8tyBrtBZOY4QJtclh2Low1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rr2zJHCF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rr2zJHCF"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5171a529224so6851438e87.0
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714465572; x=1715070372; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbepfIIly+2zOWoRWVio5HC/0g7hYTynmHI9V7auNMA=;
        b=Rr2zJHCFpB/NKwcE7uHEwm5iL20LcHflo11AGl2D3ZaWkj5nuA7ywUdIl2Nk7wG800
         AK/WHlw9iObPqNbM93njL+GGeWsQ1tsGwp6YZG/Osbmt1HDwTQNwf13rDivaNFEl3vOW
         TYBdtfkjdNaV7FINULO2MpVnYyYt1tZRD5BwsVuAd7F/BVUNlK4XlhYUiecmCSxIqFVO
         QYn1z3p6XMuEwLgOkicEZzu0bpDeGeXwfLf8mKtdHiSv4hJHhoUWM3cAZmPMmp0+lsz7
         nfav9WmmOfKn3EpFQhgsk3TELRYj2PPgqmH5aYNk7/GhVZiZajVzynTBfWOv0LgL3sCr
         mNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714465572; x=1715070372;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbepfIIly+2zOWoRWVio5HC/0g7hYTynmHI9V7auNMA=;
        b=UuLazD9yGyoBtB7O5kuBCGvYWDKKCyMu54FexcXo8JvZsiahT3FJwTVt2hH5mn4st1
         PM3bFbHxn5rIgS5VRzzizvSVUjW9qxRfOQAx8Uirtd7HK6eHqUcL1clCYuyv8JdwDc8I
         sFTvxk5YPWFvq1vplImCOcSn8dA9rVNyPTaAgJW/LvOdYcR/M6L1z3PFv6oVK0JXyXJR
         CB+uYXRvlznoDGZeZzizskJyCJWwSUFfM4374ao/bXarViTPQtZKPeKxFOF+yrUrpZmJ
         4XyFcvzvDOs5v0tq2MrY75IppW9vpZ+9lPONYvpnrsh8wEOrQ/jIeKeWiSUtWCfFb+8A
         CZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIoeYpOqNZMEQoFp6zFGqJi2XNbaExhaAwQILRcQIVWQ1eVakVmXr/z/yHRJOLz+kBLrh8afn79Me+PSkrBYU6Xh708w==
X-Gm-Message-State: AOJu0YzdfxLhXlTTgFRdfThx9I87qfVel5E/ZmbuQcYI3zJh/wSjkAJL
	SCVuOTeFxXiWWL2WRFed8d4XGTqJ47anW46EVRuCM3xsflwAjCO+nHrNAfDAnszVPQ1JfHvUk5t
	y
X-Google-Smtp-Source: AGHT+IGegH9IzPT7zD/pIQJWIVkVOAdfe7Q3gwlWbxjLDClbmPcS2rBeLMauEcknzkw235BA9fZhyQ==
X-Received: by 2002:ac2:5a5c:0:b0:517:87ba:aff3 with SMTP id r28-20020ac25a5c000000b0051787baaff3mr1389406lfn.43.1714465571946;
        Tue, 30 Apr 2024 01:26:11 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a18-20020a056512201200b0051bbe521349sm2468942lfb.248.2024.04.30.01.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 01:26:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Apr 2024 10:26:10 +0200
Subject: [PATCH] ARM: Use conditionals for CFI branches
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-arm32-cfi-topping-v1-1-4cb6a15552aa@linaro.org>
X-B4-Tracking: v=1; b=H4sIACGrMGYC/x3MPQqAMAxA4atIZgNpow5eRRz8SWsGa2lFBPHuF
 sdveO+BLEklQ189kOTSrEcoMHUFyzYFL6hrMViyDTVMOKWdLS5O8Txi1OCRbcuzMSt3RFC6mMT
 p/T+H8X0/YY7rY2MAAAA=
To: Russell King <linux@armlinux.org.uk>, 
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.13.0

Commit 9385/2 introduced a few branches inside function
prototypes when using CFI in order to deal with the situation
where CFI inserts a few bytes of function information in front
of the symbol.

This is not good for older CPUs where every cycle counts.

Commit 9386/2 alleviated the situation a bit by using aliases
for the cache functions with identical signatures.

This leaves the coherent cache flush functions
*_coherent_kern_range() with these branches to the corresponing
*_coherent_user_range() around, since their return type differ and
they therefore cannot be aliased.

Solve this by a simple ifdef so at least we can use fallthroughs
when compiling without CFI enabled.

Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/Zi+e9M%2Ff5b%2FSto9H@shell.armlinux.org.uk/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mm/cache-fa.S      | 2 ++
 arch/arm/mm/cache-v4.S      | 2 ++
 arch/arm/mm/cache-v4wb.S    | 4 ++++
 arch/arm/mm/cache-v4wt.S    | 2 ++
 arch/arm/mm/cache-v6.S      | 2 ++
 arch/arm/mm/cache-v7.S      | 2 ++
 arch/arm/mm/cache-v7m.S     | 2 ++
 arch/arm/mm/proc-arm1020.S  | 2 ++
 arch/arm/mm/proc-arm1020e.S | 2 ++
 arch/arm/mm/proc-arm1022.S  | 2 ++
 arch/arm/mm/proc-arm1026.S  | 2 ++
 arch/arm/mm/proc-arm920.S   | 2 ++
 arch/arm/mm/proc-arm922.S   | 2 ++
 arch/arm/mm/proc-arm925.S   | 2 ++
 arch/arm/mm/proc-arm926.S   | 2 ++
 arch/arm/mm/proc-arm940.S   | 2 ++
 arch/arm/mm/proc-arm946.S   | 2 ++
 arch/arm/mm/proc-feroceon.S | 2 ++
 arch/arm/mm/proc-mohawk.S   | 2 ++
 arch/arm/mm/proc-xsc3.S     | 2 ++
 20 files changed, 42 insertions(+)

diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
index db454033b76f..4a3668b52a2d 100644
--- a/arch/arm/mm/cache-fa.S
+++ b/arch/arm/mm/cache-fa.S
@@ -112,7 +112,9 @@ SYM_FUNC_END(fa_flush_user_cache_range)
  *	- end	 - virtual end address
  */
 SYM_TYPED_FUNC_START(fa_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	fa_coherent_user_range
+#endif
 SYM_FUNC_END(fa_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/cache-v4.S b/arch/arm/mm/cache-v4.S
index 0df97a610026..0e94e5193dbd 100644
--- a/arch/arm/mm/cache-v4.S
+++ b/arch/arm/mm/cache-v4.S
@@ -104,7 +104,9 @@ SYM_FUNC_END(v4_coherent_user_range)
  *	- size	- region size
  */
 SYM_TYPED_FUNC_START(v4_flush_kern_dcache_area)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	v4_dma_flush_range
+#endif
 SYM_FUNC_END(v4_flush_kern_dcache_area)
 
 /*
diff --git a/arch/arm/mm/cache-v4wb.S b/arch/arm/mm/cache-v4wb.S
index 1912f559968c..ce55a2eef5da 100644
--- a/arch/arm/mm/cache-v4wb.S
+++ b/arch/arm/mm/cache-v4wb.S
@@ -136,7 +136,9 @@ SYM_FUNC_END(v4wb_flush_user_cache_range)
  */
 SYM_TYPED_FUNC_START(v4wb_flush_kern_dcache_area)
 	add	r1, r0, r1
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	v4wb_coherent_user_range
+#endif
 SYM_FUNC_END(v4wb_flush_kern_dcache_area)
 
 /*
@@ -150,7 +152,9 @@ SYM_FUNC_END(v4wb_flush_kern_dcache_area)
  *	- end	 - virtual end address
  */
 SYM_TYPED_FUNC_START(v4wb_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	v4wb_coherent_user_range
+#endif
 SYM_FUNC_END(v4wb_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/cache-v4wt.S b/arch/arm/mm/cache-v4wt.S
index 43b4275ab680..a97dc267b3b0 100644
--- a/arch/arm/mm/cache-v4wt.S
+++ b/arch/arm/mm/cache-v4wt.S
@@ -108,7 +108,9 @@ SYM_FUNC_END(v4wt_flush_user_cache_range)
  *	- end	 - virtual end address
  */
 SYM_TYPED_FUNC_START(v4wt_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	v4wt_coherent_user_range
+#endif
 SYM_FUNC_END(v4wt_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/cache-v6.S b/arch/arm/mm/cache-v6.S
index 86affd60d6d4..9f415476e218 100644
--- a/arch/arm/mm/cache-v6.S
+++ b/arch/arm/mm/cache-v6.S
@@ -117,7 +117,9 @@ SYM_FUNC_END(v6_flush_user_cache_range)
  *	- the Icache does not read data from the write buffer
  */
 SYM_TYPED_FUNC_START(v6_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	v6_coherent_user_range
+#endif
 SYM_FUNC_END(v6_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/cache-v7.S b/arch/arm/mm/cache-v7.S
index 170b9ac72331..201ca05436fa 100644
--- a/arch/arm/mm/cache-v7.S
+++ b/arch/arm/mm/cache-v7.S
@@ -261,7 +261,9 @@ SYM_FUNC_END(v7_flush_user_cache_range)
  *	- the Icache does not read data from the write buffer
  */
 SYM_TYPED_FUNC_START(v7_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	v7_coherent_user_range
+#endif
 SYM_FUNC_END(v7_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/cache-v7m.S b/arch/arm/mm/cache-v7m.S
index 4e670697eabc..14d719eba729 100644
--- a/arch/arm/mm/cache-v7m.S
+++ b/arch/arm/mm/cache-v7m.S
@@ -286,7 +286,9 @@ SYM_FUNC_END(v7m_flush_user_cache_range)
  *	- the Icache does not read data from the write buffer
  */
 SYM_TYPED_FUNC_START(v7m_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	v7m_coherent_user_range
+#endif
 SYM_FUNC_END(v7m_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm1020.S b/arch/arm/mm/proc-arm1020.S
index ddda04929dae..d0ce3414a13e 100644
--- a/arch/arm/mm/proc-arm1020.S
+++ b/arch/arm/mm/proc-arm1020.S
@@ -203,7 +203,9 @@ SYM_FUNC_END(arm1020_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm1020_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm1020_coherent_user_range
+#endif
 SYM_FUNC_END(arm1020_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm1020e.S b/arch/arm/mm/proc-arm1020e.S
index 60169f4ca391..64f031bf6eff 100644
--- a/arch/arm/mm/proc-arm1020e.S
+++ b/arch/arm/mm/proc-arm1020e.S
@@ -200,7 +200,9 @@ SYM_FUNC_END(arm1020e_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm1020e_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm1020e_coherent_user_range
+#endif
 SYM_FUNC_END(arm1020e_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm1022.S b/arch/arm/mm/proc-arm1022.S
index 30b0e4d05a05..42ed5ed07252 100644
--- a/arch/arm/mm/proc-arm1022.S
+++ b/arch/arm/mm/proc-arm1022.S
@@ -199,7 +199,9 @@ SYM_FUNC_END(arm1022_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm1022_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm1022_coherent_user_range
+#endif
 SYM_FUNC_END(arm1022_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm1026.S b/arch/arm/mm/proc-arm1026.S
index ae06262ca779..b3ae62cd553a 100644
--- a/arch/arm/mm/proc-arm1026.S
+++ b/arch/arm/mm/proc-arm1026.S
@@ -194,7 +194,9 @@ SYM_FUNC_END(arm1026_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm1026_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm1026_coherent_user_range
+#endif
 SYM_FUNC_END(arm1026_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm920.S b/arch/arm/mm/proc-arm920.S
index e47411243b08..a30df54ad5fa 100644
--- a/arch/arm/mm/proc-arm920.S
+++ b/arch/arm/mm/proc-arm920.S
@@ -180,7 +180,9 @@ SYM_FUNC_END(arm920_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm920_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm920_coherent_user_range
+#endif
 SYM_FUNC_END(arm920_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm922.S b/arch/arm/mm/proc-arm922.S
index 092f8b7656a7..aac4e048100d 100644
--- a/arch/arm/mm/proc-arm922.S
+++ b/arch/arm/mm/proc-arm922.S
@@ -182,7 +182,9 @@ SYM_FUNC_END(arm922_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm922_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm922_coherent_user_range
+#endif
 SYM_FUNC_END(arm922_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
index a06039a3b2a8..035941faeb2e 100644
--- a/arch/arm/mm/proc-arm925.S
+++ b/arch/arm/mm/proc-arm925.S
@@ -229,7 +229,9 @@ SYM_FUNC_END(arm925_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm925_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm925_coherent_user_range
+#endif
 SYM_FUNC_END(arm925_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm926.S b/arch/arm/mm/proc-arm926.S
index 2c8b93d446a9..6f43d6af2d9a 100644
--- a/arch/arm/mm/proc-arm926.S
+++ b/arch/arm/mm/proc-arm926.S
@@ -192,7 +192,9 @@ SYM_FUNC_END(arm926_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm926_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm926_coherent_user_range
+#endif
 SYM_FUNC_END(arm926_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm940.S b/arch/arm/mm/proc-arm940.S
index fbe168213ec1..0d30bb25c42b 100644
--- a/arch/arm/mm/proc-arm940.S
+++ b/arch/arm/mm/proc-arm940.S
@@ -153,7 +153,9 @@ SYM_FUNC_END(arm940_coherent_kern_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm940_coherent_user_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm940_flush_kern_dcache_area
+#endif
 SYM_FUNC_END(arm940_coherent_user_range)
 
 /*
diff --git a/arch/arm/mm/proc-arm946.S b/arch/arm/mm/proc-arm946.S
index 4772b46064e6..27750ace2ced 100644
--- a/arch/arm/mm/proc-arm946.S
+++ b/arch/arm/mm/proc-arm946.S
@@ -173,7 +173,9 @@ SYM_FUNC_END(arm946_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(arm946_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	arm946_coherent_user_range
+#endif
 SYM_FUNC_END(arm946_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-feroceon.S b/arch/arm/mm/proc-feroceon.S
index 8519ff60e512..f67b2ffac854 100644
--- a/arch/arm/mm/proc-feroceon.S
+++ b/arch/arm/mm/proc-feroceon.S
@@ -208,7 +208,9 @@ SYM_FUNC_END(feroceon_flush_user_cache_range)
  */
 	.align	5
 SYM_TYPED_FUNC_START(feroceon_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	feroceon_coherent_user_range
+#endif
 SYM_FUNC_END(feroceon_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-mohawk.S b/arch/arm/mm/proc-mohawk.S
index 091f6c6719a8..8e9f38da863a 100644
--- a/arch/arm/mm/proc-mohawk.S
+++ b/arch/arm/mm/proc-mohawk.S
@@ -163,7 +163,9 @@ SYM_FUNC_END(mohawk_flush_user_cache_range)
  *	- end	- virtual end address
  */
 SYM_TYPED_FUNC_START(mohawk_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	mohawk_coherent_user_range
+#endif
 SYM_FUNC_END(mohawk_coherent_kern_range)
 
 /*
diff --git a/arch/arm/mm/proc-xsc3.S b/arch/arm/mm/proc-xsc3.S
index f4889911eca2..14927b380452 100644
--- a/arch/arm/mm/proc-xsc3.S
+++ b/arch/arm/mm/proc-xsc3.S
@@ -223,7 +223,9 @@ SYM_FUNC_END(xsc3_flush_user_cache_range)
  *	it also trashes the mini I-cache used by JTAG debuggers.
  */
 SYM_TYPED_FUNC_START(xsc3_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
 	b	xsc3_coherent_user_range
+#endif
 SYM_FUNC_END(xsc3_coherent_kern_range)
 
 SYM_TYPED_FUNC_START(xsc3_coherent_user_range)

---
base-commit: b42bf708a0c9d6c7303bd623a6b615b6d599dc75
change-id: 20240430-arm32-cfi-topping-3253b11d3600

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

