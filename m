Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC9814296
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710148550; cv=none; b=ZwPcmmd7xP8AadfKHmdxgAAO1foQv5+iZ3VS09/bTr6wxzmG0R+D9bYS3hSyxd3JanlnuQtJ6Uls/zaRts0FL94JsKgXtf9ID6q8BS8SNjjluhOMPK1IXoKOywLikCafmfkZRb4vMcTmfPuBUU1ZvIy6wqoLUFQORJiOL8Tg0tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710148550; c=relaxed/simple;
	bh=5SGDm7QNCUVYjMa5HHJMDC7JvUxru9Eq4fafddtS4Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ca8mTGSHiOQrjj/54WyqRb0QkOui+EypcliFjAAjP4sxK3XJmcGQEAsF0whe8jSX4PM2C3o1gh+amzx7E4UqrOFXfs6z5ga4ujmDqSNFv+5Dx5BAq5clBRv+v/FsaWa/ekPZWf1ndub7px8Qm6byIaOAWO8K+ur+KNvfrW4F2sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qQTGqx4s; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQTGqx4s"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a462b068416so67547166b.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 02:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710148547; x=1710753347; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hQVFeBxn1IenYJfJewA7K4YjroRXq1981Lcc541jow=;
        b=qQTGqx4syI086JgWltF3RuO0YoQbPJ8dL4S+xaXsFDqod4Y7C8TjOP84DMheG3RILx
         LPA1gIeCtRQnwvfFcrkbNLeEuzahzp9u12U3KeGZMXFbKemm3AnsG7JDJSri07QyZJSF
         pqGuhN7L17Wq29u6jRovW1KUVS2bqyxTjRxpNHTp/qm6JJVFHt8VPm+QkogpY2OUvrO8
         UpU0nm/rWE59flaDzUKTZZF1v2dX9zF6msaqHm4+OrVUrACgUABwZ2OvHLNsaKKudStb
         TlBLSo/lb4aTM0gMx4lJvgD+B/FxqPXqV4X5mCpx19CyGxU6MZ3Hnws3+WDHTMsBJohs
         fQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710148547; x=1710753347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hQVFeBxn1IenYJfJewA7K4YjroRXq1981Lcc541jow=;
        b=iKxsUD8AL4nW+s1PxmzjXn203TVVc2b+v5l3EqMjOTbb938Su2a5nnjs3osYR7VYcf
         3GulozGcDJAaixdL+v7eN9OgYO0p3cl9sLcKzkTH0Vehuh4i/N+xJ29jFcgVPvM+M9ar
         BsmRgIzZSqv1VJYbOSFBHmuA09TujEFx5FZ3amsKTtK4gs8s2kX1xvUzLrsI829CaUe3
         W/t3HIB+5Q+oND665YS7UbM8+iH41ejS27hWx9RUIYQnGgGD0yK0E5ZyCCrKXHtY0Dpa
         JmYilMdE0G82wxTMyvAAK/3W37n0qOV+fTgzY3ZkSmcvVgSVGUEgwnoF6W0NmDr4X7k/
         bKIg==
X-Forwarded-Encrypted: i=1; AJvYcCVMho/dN81EduHtgA4GZxPHKNvbUeWAWq7QwLLgCN9NgVLTKwFlrVeuVOQ09R2Gjf8RP3veYnkzsvfSmftd21ZRJ9SQeg==
X-Gm-Message-State: AOJu0YyCLWvikBgfFkqekeNb7eUZAyHpkuxgEKUpeKoyT+oHeStGjdtv
	6tcgaK60Ae0S5z5dBs4JJego9hQBIcqlQaMjBgAW+G9/rwwEayapw6SbMUJTMVU=
X-Google-Smtp-Source: AGHT+IFDXnaYHHTTgZuS1DCu5RDa1CgSEWMP0DDGbrndqbxQOnJOhpVIekT1w4Oo9V+VkBJC3FDrvg==
X-Received: by 2002:a17:907:c247:b0:a45:5328:8432 with SMTP id tj7-20020a170907c24700b00a4553288432mr4898816ejc.50.1710148546796;
        Mon, 11 Mar 2024 02:15:46 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id js23-20020a170906ca9700b00a4617f1ccf3sm1601256ejb.169.2024.03.11.02.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 02:15:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 10:15:42 +0100
Subject: [PATCH v3 5/9] ARM: delay: Turn delay functions into static
 inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-arm32-cfi-v3-5-224a0f0a45c2@linaro.org>
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

The members of the vector table arm_delay_ops are called
directly using defines, but this is really confusing for
KCFI. Wrap the calls in static inlines and tag them with
__nocfi so things start to work.

Without this patch, platforms without a delay timer will
not boot (sticks in calibrating loop etc).

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/include/asm/delay.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/delay.h b/arch/arm/include/asm/delay.h
index 1d069e558d8d..7d611b810b6c 100644
--- a/arch/arm/include/asm/delay.h
+++ b/arch/arm/include/asm/delay.h
@@ -55,7 +55,10 @@ extern struct arm_delay_ops {
 	unsigned long ticks_per_jiffy;
 } arm_delay_ops;
 
-#define __delay(n)		arm_delay_ops.delay(n)
+static inline void __nocfi __delay(unsigned long n)
+{
+	arm_delay_ops.delay(n);
+}
 
 /*
  * This function intentionally does not exist; if you see references to
@@ -76,8 +79,15 @@ extern void __bad_udelay(void);
  * first constant multiplications gets optimized away if the delay is
  * a constant)
  */
-#define __udelay(n)		arm_delay_ops.udelay(n)
-#define __const_udelay(n)	arm_delay_ops.const_udelay(n)
+static inline void __nocfi __udelay(unsigned long n)
+{
+	arm_delay_ops.udelay(n);
+}
+
+static inline void __nocfi __const_udelay(unsigned long n)
+{
+	arm_delay_ops.const_udelay(n);
+}
 
 #define udelay(n)							\
 	(__builtin_constant_p(n) ?					\

-- 
2.34.1

