Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8653A1755B
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148552; cv=none; b=Mx3YIXysOaUOliArRR//2QNQDXeiLfXcl5m7ziwc8H3vWRwgjXjPtmodqB9xpiWYMUXHPwenvQaVJbTsvjKNK9q4dxJ/ECjSEWNDpZ3x0xPtntRZm8LXWgUwHbeBSYqCMLIeqhe0MENHC4MsZWHH4MSqVes86NuezEaVRt4RkYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148552; c=relaxed/simple;
	bh=amin5G4OUB2TOd8qhHcFmiCbc8Lio6xBnelTIHekVoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsRNn9j88BZ0Jb9DW4orIjhkCY7jtyEdetLQ9+qv/utWdcPMiAmbZz4O8CCegKtiwx29XPm+5lG6p20c2wlXC2POAVi9me3nmNza9zBkUcUSYtelXclnFkORvrAj5AAN7daONHR5aupfA3sxXDrodu1RX1RhXkQqA9tb/aKmjag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0/yHUNc; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0/yHUNc"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a44cdb2d3a6so568932866b.2
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148549; x=1710753349; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqBogdja5tMMOO5wTCklLeqAnS4o63/YOLSFeJQB8FQ=;
        b=Z0/yHUNcX9q59B3Gc4EKZh8pn1DpcOajFasxpNzM6Pvj1Ga249Aw1FoI5kHBQmSxEz
         5NbB+0EicLWTHZjMs0tG4Z1bCeDFEoctqunBYwaww6O/h1FX87Z4Yav9zMEtLU5Iz/NI
         rQlJCj7j7LWK/jr4UPszRKYpySt+zkqc9j4VrpdwXUqeW2ECiw24Xot97QRogPlU5Tof
         ezAI8UjnRAwhiAIe0SqUl7xFrfJilqpZRjf89JgCn2FDM35gv9YnJiQH2shQ61ldpO3n
         QvmP9+4wDOAMoUZ1CyDNHZobv06kp/F0czelX4Vn+oaOlKDq5YlYm/tw7REKqeIm0G3U
         hZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148549; x=1710753349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqBogdja5tMMOO5wTCklLeqAnS4o63/YOLSFeJQB8FQ=;
        b=NzPsmOWlmCErz8WKSQq2Y23sTPkKhJW/Zj0XJvX0x/gLyAGKQ2c/0yCx0QIy98mbpd
         MQd3c+YiQnFssXuvWLyM8GiNpXRBz1yK/jE2oq+hWHf/Wr/+Nu/KC3mmWNe0Ou65SHkp
         W1FfYHyaKT6yo4m10A8mXw9J28K8ZOlwy1c7CNGlsOHjuR2mbjVp6JRbHyoznTPJvyCe
         fmDPOCwvyrjcKNVXDSS1kiWmmU1/crEyLmNjux2yoOeJeVzVq0BXhjWMZHkqW9GdDfIc
         KUYI/yMbm4ts4+zUy9kHU3oWBVz/6bkE9oXkXA7Og06/UH62Pt9j7gS5emz3YHwS/CAD
         epVw==
X-Forwarded-Encrypted: i=1; AJvYcCW8G7pCyHmk2YkjhxJkEFztU9anUypmuaF3cGbDMO5gR5v5YPxQdHK8IdfN+JO46J+mWPKkG5Rzehqk28S0olFmHKJjUw==
X-Gm-Message-State: AOJu0YxPIWx8afxwYw//CoxF8beGwfjlTBQIC0LXvymdKkT9dNasOP9Q
	jipZZTCtbgVoxupfj+PGQVeVPapBqUFo9+wGVIAACyi47D3K1Wv+klF+HGEaM8Q=
X-Google-Smtp-Source: AGHT+IEP1SSz9yPrDJnqOEruTPOynch6dZWKvcAjOUpOIrdb62bA7bA/LhoylzwSep0OofKyhGJhog==
X-Received: by 2002:a17:906:b14b:b0:a3e:d2ea:ff5e with SMTP id bt11-20020a170906b14b00b00a3ed2eaff5emr3888747ejb.58.1710148549011;
        Mon, 11 Mar 2024 02:15:49 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 10:15:44 +0100
Subject: [PATCH v3 7/9] ARM: page: Turn highpage accesses into static
 inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-arm32-cfi-v3-7-224a0f0a45c2@linaro.org>
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

