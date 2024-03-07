Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9E12D750
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821336; cv=none; b=doIkxMl9c157YRDk6mNqDlzRpL9qUGBIGR1+Lb0Wa9WGuLzlN1HO99bBIYFzfX6Ptll/6iO3cdfo9LaBBpku9iXLBTxvLEknPEZjBju6zKz6Z+a8pZhNpVNWYNdDj78SeBQyVdV5c1YqdJkZ6VfZXlkCnOsSdIRrqpKM2FtCgWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821336; c=relaxed/simple;
	bh=amin5G4OUB2TOd8qhHcFmiCbc8Lio6xBnelTIHekVoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKNvQtlp/+kfCV8pbptd4vcp5BE2+0kpvry86gsYM4W1s+0VEXRmi1LnnJkV1QCTJJgkqlf5LW76CSBIs1k9PD07nszNObT4G30lACMpFU3l9vAIB/sWCcE4pNCU4s0zwWYx5tnt/+HYxR+G4GadWzJKeZF91Jg5nkI/aHlyHYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dxD4PSuw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dxD4PSuw"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51325c38d10so1984253e87.1
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821332; x=1710426132; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqBogdja5tMMOO5wTCklLeqAnS4o63/YOLSFeJQB8FQ=;
        b=dxD4PSuwp6ySLxBRFQwuTXMEmXwPz67j9MRDUo2M5jJyeyWqOXAxUNvLc/LDnb4g/g
         Nux8tRdEl4JmD2B6eB4wqhLcWxKixFh6ztMZ3+2ZR2awgfEY2RrhqFquXbJPEPVcNr5R
         pOvMwuSF8NLyRCDhYQBGSqmo04aqiubeaHiqd/TkVoh9y5ZTOszhpWgWL0+7nxKGtbOR
         3WRYjsVll7MthSQftO+X9i0G162v914Bl8Uk14aPSAOy2FZynqAex5ZjCs4eTD6mnACg
         iZVSyWv/N2MWokynvHDEOVR5IheI79yjNWp0+Bja00gBzGcVeBMPkdcOD+1eQQ8ECMXx
         Oh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821332; x=1710426132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqBogdja5tMMOO5wTCklLeqAnS4o63/YOLSFeJQB8FQ=;
        b=ukzFyBCE45WrptpkngxUAyF9zuva1aOGdP+hUvcPul6JWSmrz5FDcHEXHDsrTL8WMj
         XCE9N6D3ediXSnZgkHGuLxIRZQYGlxK03IW3JxGVhrb9k89RfueRWIB6ztVuea1OHlvi
         bbTrCB5U0b2ZQVqt5E+T0mvXAHIFGAIyriVqPr6xxy42sNm8EV5q2OIl9aTz9K655d9f
         k4xRkOC+0PoxoUc+3iw84fbuIsKLcJMXSj//eRz73chb1W3uzacNmCljkciu7SyYck0Q
         HSEg2bHS8u4jzZutKkg8xKno0KsP9lBqGPRS1n9n+avTOHrmB+DHh91cIyAHJENINW2n
         EY8g==
X-Forwarded-Encrypted: i=1; AJvYcCV6J1vnOXWOJUTTvR0fQEIIexN/cI7QMW/230op/21cT0SQxGe4PlGFXJGZAA8edStdylaGEPMPPm9mERS8DVyZmGCxhg==
X-Gm-Message-State: AOJu0Yw+iRbbSH9+F8v/OwBK/gPRjH9SQstCas4xOsjz2G5ixt8phIw8
	2EFyrlCkjxQ0AJwbH8pScYTTdtqkUs3GL3MICnUNondMABBGNUOoveC1o9sgXWc=
X-Google-Smtp-Source: AGHT+IGHiABAzZ0gzslhFBFFCHaQfxDyREIPjRltUdsCGKwCOVgo5+NjSeovE0CeKpTNYEbNM0cxZA==
X-Received: by 2002:a19:ca1d:0:b0:513:3b3e:c361 with SMTP id a29-20020a19ca1d000000b005133b3ec361mr610924lfg.2.1709821332426;
        Thu, 07 Mar 2024 06:22:12 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:11 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 07 Mar 2024 15:22:06 +0100
Subject: [PATCH v2 7/9] ARM: page: Turn highpage accesses into static
 inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-arm32-cfi-v2-7-cc74ea0306b3@linaro.org>
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

Clearing and copying pages in highmem uses either the cpu_user
vtable or the __glue() assembler stubs to call into per-CPU
versions of these functions.

This is all really confusing for KCFI so wrap these into static
inlines and prefix each inline function with __nocfi.

__cpu_clear_user_highpage() and __cpu_copy_user_highpage() are
exported in arch/arm/mm/proc-syms.c which causes a problem with
using static inlines, but it turns out that these exports are
completely unused, so we can just delete them.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/page.h | 36 +++++++++++++++++++++++++++++-------
 arch/arm/mm/proc-syms.c     |  7 +------
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/arch/arm/include/asm/page.h b/arch/arm/include/asm/page.h
index 119aa85d1feb..8bf297228627 100644
--- a/arch/arm/include/asm/page.h
+++ b/arch/arm/include/asm/page.h
@@ -138,17 +138,39 @@ void xscale_mc_clear_user_highpage(struct page *page, unsigned long vaddr);
 #ifdef MULTI_USER
 extern struct cpu_user_fns cpu_user;
 
-#define __cpu_clear_user_highpage	cpu_user.cpu_clear_user_highpage
-#define __cpu_copy_user_highpage	cpu_user.cpu_copy_user_highpage
+static inline void __nocfi __cpu_clear_user_highpage(struct page *page,
+						     unsigned long vaddr)
+{
+	cpu_user.cpu_clear_user_highpage(page, vaddr);
+}
+
+static inline void __nocfi __cpu_copy_user_highpage(struct page *to,
+			struct page *from, unsigned long vaddr,
+			struct vm_area_struct *vma)
+{
+	cpu_user.cpu_copy_user_highpage(to, from, vaddr, vma);
+}
 
 #else
 
-#define __cpu_clear_user_highpage	__glue(_USER,_clear_user_highpage)
-#define __cpu_copy_user_highpage	__glue(_USER,_copy_user_highpage)
+/* These turn into function declarations for each per-CPU glue function */
+void __glue(_USER,_clear_user_highpage)(struct page *page, unsigned long vaddr);
+void __glue(_USER,_copy_user_highpage)(struct page *to, struct page *from,
+		unsigned long vaddr, struct vm_area_struct *vma);
+
+static inline void __nocfi __cpu_clear_user_highpage(struct page *page,
+						     unsigned long vaddr)
+{
+	__glue(_USER,_clear_user_highpage)(page, vaddr);
+}
+
+static inline void __nocfi __cpu_copy_user_highpage(struct page *to,
+			struct page *from, unsigned long vaddr,
+			struct vm_area_struct *vma)
+{
+	__glue(_USER,_copy_user_highpage)(to, from, vaddr, vma);
+}
 
-extern void __cpu_clear_user_highpage(struct page *page, unsigned long vaddr);
-extern void __cpu_copy_user_highpage(struct page *to, struct page *from,
-			unsigned long vaddr, struct vm_area_struct *vma);
 #endif
 
 #define clear_user_highpage(page,vaddr)		\
diff --git a/arch/arm/mm/proc-syms.c b/arch/arm/mm/proc-syms.c
index e21249548e9f..c93fec38d9f4 100644
--- a/arch/arm/mm/proc-syms.c
+++ b/arch/arm/mm/proc-syms.c
@@ -31,14 +31,9 @@ EXPORT_SYMBOL(__cpuc_flush_dcache_area);
 EXPORT_SYMBOL(cpu_cache);
 #endif
 
-#ifdef CONFIG_MMU
-#ifndef MULTI_USER
-EXPORT_SYMBOL(__cpu_clear_user_highpage);
-EXPORT_SYMBOL(__cpu_copy_user_highpage);
-#else
+#if defined(CONFIG_MMU) && defined(MULTI_USER)
 EXPORT_SYMBOL(cpu_user);
 #endif
-#endif
 
 /*
  * No module should need to touch the TLB (and currently

-- 
2.34.1

