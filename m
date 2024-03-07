Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3312D771
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821328; cv=none; b=LDTODG3ALBwnXa/7FsQsC7cQkpkkl5HOgM6KuFwQg1jp2dOnbFYZ80zMhPbeibCPA+4TXUS+vuNVKSAlwT+dT8y9R1BUyuRW2HO2jKY3xCnZXoaUzqPeKZJDIlXUqZr6jZp7K568XekYzD/quc3U+es/GWaFLOPZh4ByVT/2kvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821328; c=relaxed/simple;
	bh=6UMk5mSXx4+IV4UQzgRJhE2stZQTf+Eo3MpUZgvR2As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBvdu2Wln8L3LRh5x6CbWT0NmdQN/+xDTD+eayEJbGN3JhrAtOwQx7RWtM6SRzxLtZGJd39s9YMJH/LNWp6ADI7k6+F4rmnkc/zEpo18DV0sqTVTVREMHF076S4BsJZMtrH3JJWUYOi3oZGg2OBOsGg0DVTm1A5bc822lr7FvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ojTxjHEU; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ojTxjHEU"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so12017481fa.3
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821325; x=1710426125; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8Pxmb+SJtaf6Rq8IgIflwtKkppPo4bfFWLJbSoBsFk=;
        b=ojTxjHEU6n3y2XH6UwdrQxyhvTn7anKLxHNtcJAdan72ArrX09G4NlA9TcmeHEChXq
         DoMBFcW4WtDFDXkLail/wtBU0LZRa8bfI2vflctYMTVa13TFiDZEJwlq+pyuTYDcv+zI
         p2c0lhNSTodm8gBodlIhzOnYpvsjirxJ6Epb9ru2gzHPnX/mqkbvoH7y9wztRvFdKJrP
         fd3H7j6tG8C0DPFOen5saPC69d6NDK5vQ7Ny989Owi5bUMn7TdavV4+v7et4jUXl0kHy
         4cBdAdV+jsNGrlaiR/KQD3lOqYECrdve/ixXDMB9qchpSsINeraH8pixoL1NjU1/gmGt
         qTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821325; x=1710426125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8Pxmb+SJtaf6Rq8IgIflwtKkppPo4bfFWLJbSoBsFk=;
        b=ItRrY8Z4gWTlJAcwP4Ya9aSFzeVFYh5Hibr/oxpK367Cy8Uenqj2ePIGR9Zbz6bgwT
         wEra/nf6kuyaZtzQhFCTrczHrfqrRperC7YIAgSZYy0ImhSZufCp31nPZS3EYSz0tsyH
         JGw9b9+xvi8Bg2W040r6CSmFE1WKKwYOiEtFHS+0JSqTaX/vH7uUkWR99jgpZqmX6doK
         CvZ/Pzs8GTRiQ56o8WCHJk1soaM88JdVTI9kbWyjSosfDj+X21tyRhSJ7WrQuks07fE9
         1kZAELKlxNLFxq/Y/yBjjmQ5w2dcGwmTJ97OlgVwiXG1JBACo5fLK8t+fkEOTkFlSo6y
         b1ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCV16V7thAeyYfvIoQiuMmtqVTOfIZM7263kpyLu5oy1DY0UpHg8ovXH7D57cw1DWimRgM8zmMHlGPgrVIkCFWBebG/g==
X-Gm-Message-State: AOJu0Yz43ELLmH864gG653QKSxVlLhPO+mxAlNtvtKngre7b9DuAb7ct
	N3N5iqA6pI5ZgrEZ00SQWeHok0Nyxex3B1+mpEPb/Bpe35Ppe5J5QbEvPNqx+FM=
X-Google-Smtp-Source: AGHT+IEsEJyP5Gecw/WvzollfZYjFKnEe7nllK/88gszUJ80WnmTVHMiLEEuKZmKX560jolbjhl1ug==
X-Received: by 2002:a05:6512:3d26:b0:513:1c47:5381 with SMTP id d38-20020a0565123d2600b005131c475381mr2115492lfv.2.1709821324688;
        Thu, 07 Mar 2024 06:22:04 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 07 Mar 2024 15:22:01 +0100
Subject: [PATCH v2 2/9] ARM: tlbflush: Make TLB flushes into static inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-arm32-cfi-v2-2-cc74ea0306b3@linaro.org>
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

Instead of just using defines to define the TLB flush functions,
use static inlines.

This has the upside that we can tag those as __nocfi so we can
execute a CFI-enabled kernel.

Move the variables around a bit so the functions can find their
global variable cpu_tlb.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/tlbflush.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/tlbflush.h b/arch/arm/include/asm/tlbflush.h
index 38c6e4a2a0b6..7340518ee0e9 100644
--- a/arch/arm/include/asm/tlbflush.h
+++ b/arch/arm/include/asm/tlbflush.h
@@ -210,13 +210,23 @@ struct cpu_tlb_fns {
 	unsigned long tlb_flags;
 };
 
+extern struct cpu_tlb_fns cpu_tlb;
+
+#define __cpu_tlb_flags			cpu_tlb.tlb_flags
+
 /*
  * Select the calling method
  */
 #ifdef MULTI_TLB
 
-#define __cpu_flush_user_tlb_range	cpu_tlb.flush_user_range
-#define __cpu_flush_kern_tlb_range	cpu_tlb.flush_kern_range
+static inline void __nocfi __cpu_flush_user_tlb_range(unsigned long s, unsigned long e, struct vm_area_struct *vma)
+{
+	cpu_tlb.flush_user_range(s, e, vma);
+}
+static inline void __nocfi __cpu_flush_kern_tlb_range(unsigned long s, unsigned long e)
+{
+	cpu_tlb.flush_kern_range(s, e);
+}
 
 #else
 
@@ -228,10 +238,6 @@ extern void __cpu_flush_kern_tlb_range(unsigned long, unsigned long);
 
 #endif
 
-extern struct cpu_tlb_fns cpu_tlb;
-
-#define __cpu_tlb_flags			cpu_tlb.tlb_flags
-
 /*
  *	TLB Management
  *	==============

-- 
2.34.1

