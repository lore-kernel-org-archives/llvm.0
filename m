Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59651199BE
	for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708891703; cv=none; b=Rd/qlN0wvIQF4AGMKcTJrE9B8eGV7dsVK9pr6EU88fkxhTye2+KQE+3ANsEyOWRnZD+AaAA1tOSpxRjXJMeAwuQgA9XDKJr+HQvZIzulga/MjKnsD3PGWpIyVDiJFIHzvf9p+iqKDrAONBXft/af5Nox01Lb9IfC1N0UNA0++Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708891703; c=relaxed/simple;
	bh=amin5G4OUB2TOd8qhHcFmiCbc8Lio6xBnelTIHekVoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P6VGpGsSpLlaCrsofGSFOJbUBnLNZXWDblJ349XK+F0IQTm1FOagpUkosC/aw6BHq/zpRca4MyhjNmr4vRu5WC21AzPIEpDdHO1xcJriRGo+10mB5+JvnHvWO0/L/NX5V1p/lO6c5Jb161RTmCw3OyjeAz1Q+oEuQcVJ96nnSa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RuTTlm8E; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuTTlm8E"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-512f3e75391so992216e87.2
        for <llvm@lists.linux.dev>; Sun, 25 Feb 2024 12:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708891699; x=1709496499; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqBogdja5tMMOO5wTCklLeqAnS4o63/YOLSFeJQB8FQ=;
        b=RuTTlm8EMcsGHmejKxfSXRUSuCF9ihRUJfnIdC/xWhe8GesOpECF5+yUaPo6TUWMHZ
         lOlUlkjZ9HPchdzZs6Hv+xVD+MEggEIB66LdplGrOZCr0/txGOVW9T6iirVkuJ2wB+EP
         33Hv0PxpluOwT8iwnyxDQmkMI/NZysMjNLX29ODls8hh6ZVRHAVyup2ajxkNmhT+t1gJ
         BZbZPFP8850cn/TmFvTa9hEPJNnZYciejVg1MKCYBGmh2tyNzHxfnr6b4Whzw6qBZFKa
         sNj3A1wd2Qi+kkjKkoziGY/fSFy89oJRTfZGzM0NlpxDzJJNI4v97ROqzJmCzssau9gq
         xpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708891699; x=1709496499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqBogdja5tMMOO5wTCklLeqAnS4o63/YOLSFeJQB8FQ=;
        b=F/A7Rnd1NKK+tRqpqxcFjVDuP1nDulte274TUHVXZu46oCELei+MptpyqEhDR7E9kq
         Z3zdgUUm43EeSd3XR8AT3lQPQtHqLOZ9/LTrGcxh5a3rInC8Md6IzW3tJKE1HYfuv4CR
         e4wqQHD6fZ1myZ7vojkgNnRyavNCqNVxYPEXw7lAx5sXxSMJUB+EnUxPvIq919aqDG3Z
         ctJ9l1J/yz2oUZ4PvY6O/3mFfDq802yYa1CNF4RA/FflJxTVCOz+nnLyE34W+bg9XVjN
         QO/Zdb2apTSjFfSMPvXqE5Vel8r5/pXKggfcphPEsSUdCLXIs76+C+YHwIuSgGNhv7NQ
         YbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsQek9fPwcEchOP+L8E4bNlB1ZbPk5wdjvS06kBhGfAEuAV3c5VFSAlTFyzj09ti/Cu18EI90LvIGuYVasNhKehmEKjA==
X-Gm-Message-State: AOJu0YzrmwJNQz1E7XnsCjc7NYoIMItJNkgkpqVO+UCn1cvtfbQGwFD/
	qchnGlKKcvgDR32mSnowfHRwU4hudGkGvt8XF0ZO0m1ja4mGLBqpNp2bBgz6kjM=
X-Google-Smtp-Source: AGHT+IFk3ZUSgR50Q//sWITHnD3B/uSdVym8AuueDMcQPsH+TIpsuF27riPyDlhFM+zdSEFscG/Dsw==
X-Received: by 2002:a05:6512:46c:b0:512:db3f:436 with SMTP id x12-20020a056512046c00b00512db3f0436mr2992602lfd.36.1708891699608;
        Sun, 25 Feb 2024 12:08:19 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id hu14-20020a170907a08e00b00a4340138ab5sm504621ejc.5.2024.02.25.12.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:08:19 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 25 Feb 2024 21:08:16 +0100
Subject: [PATCH 7/7] ARM: page: Turn highpage accesses into static inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-arm32-cfi-v1-7-6943306f065b@linaro.org>
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

