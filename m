Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CF212DDB5
	for <llvm@lists.linux.dev>; Thu,  7 Mar 2024 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709821332; cv=none; b=tSY/ubhbrqUx2AkCf6hrvdPGtRHG7RDZm+UFZdrLu+hsCIduwzAseSMLqNpb4PYlhw3Alc0hv+G7WpGzR2cVVrnjY4XA6aRJhNGlgP8Rbo8XM6t9KC5WR/HJgsMGvmO/uy4yyiO6b9j1NvZ++doNFFGSTAQNE6Q9aHhz/EJOQNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709821332; c=relaxed/simple;
	bh=5SGDm7QNCUVYjMa5HHJMDC7JvUxru9Eq4fafddtS4Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iCniCVZg5SMC/9xmnOgXYp4D+6O9HwpycPNKTLnRvTZ4St6wWSBU6KDvsenX3LoiOB/5Fh4Bpd3TzDCiRkV9k7cCqain7vNFg0znkyJqb2dhFW6LktzTRQhs6G7sf8fqjqauRNiEYR70DnfJ26rJ2++uiUZpn27sYKSgxhIYWvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMGJgdxo; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMGJgdxo"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513298d6859so832911e87.3
        for <llvm@lists.linux.dev>; Thu, 07 Mar 2024 06:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709821329; x=1710426129; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hQVFeBxn1IenYJfJewA7K4YjroRXq1981Lcc541jow=;
        b=dMGJgdxo9y9CYUfpcfeiEFrZWVTDfDMJoHuiBBMTYMNaEVXCDdg08L0CFeD64p8TCY
         xy8wBcNX4QaYAOrs7pH+Qz9pRrrHSGQ/DNRiANYtOcHuhgfgz4/FeEc1niss/FsAmeUF
         JYMPg/t1KvBOKz9kcRVSgZiRanOUwkaVZs1GzepkWdi9/W25JKP+4sm7UwPr0x1xxKk1
         z9wHN/8tGhpP5rvl58DbKfUhxut+REg6UhL687j5fuFsYf1g7HWmPt9tjDBFJAzXjC4h
         p5gUDnCX8LkZj/6clmlssNa5rbY5znoFkvabG+u7aKDYaL8WV6DrabKJjhFOwQyIozHw
         NaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821329; x=1710426129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hQVFeBxn1IenYJfJewA7K4YjroRXq1981Lcc541jow=;
        b=Bb4h4t6J+z0yje8dw61KJcQDx/9xO3aKbEgeSad7PfRMOBcudwAFXOn8bbNzGAOOZG
         a3iJYvj5NjT+pUZ3crG1jSzJUjZeKNWfYK4NECU3+MrZW9vv+Lsb1C+y0+TDMZABBSR8
         k8l3p49qeWiDqJJQPZdaohN1kEEYYEDDVIW6+BhthRizPRM/wHSfdEQmrpIR9ghj27pw
         nCkBjppsLYO+PuDWG+frnYoqyOehoiXhip7yYfNJlOhJShbXyZFAdzraLgkRRiHpIyDr
         +jQ+hnr/wIjTylrWLKoi1Fiip61v1OSlUIM45LAwX4dbq5CxY+7/Pti5KmpI8GlX2sYa
         oDfw==
X-Forwarded-Encrypted: i=1; AJvYcCU69f2+xOErkF2MNxkLfTUJmnAiJ6ROpRJbRiC8qHWoWH9q5gTsBDNX/RmPVF3+1FnDrV+E6CEVzcrA7m3li3hcWGGWSA==
X-Gm-Message-State: AOJu0Yyebl+vXRXbaR507VODH8U+f/kZA80cjbLi4bq1GJf83t7+nvIH
	13+AVlOvxWWe8B5W//5pEUCeK/2LJWd3nJ7WIoPSA2w0M16S6p0ixupIHco4yzA=
X-Google-Smtp-Source: AGHT+IEQGnmVcalNP3Hec44WlB/kQtAuRD4bDECAOf1RXnT2QXtjQ6JZsUFXdFMtMvyH8obZ0o6x1g==
X-Received: by 2002:a05:6512:e94:b0:512:da6d:23aa with SMTP id bi20-20020a0565120e9400b00512da6d23aamr1760365lfb.67.1709821329648;
        Thu, 07 Mar 2024 06:22:09 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x11-20020a19e00b000000b005133b381a5csm2417137lfg.90.2024.03.07.06.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:22:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 07 Mar 2024 15:22:04 +0100
Subject: [PATCH v2 5/9] ARM: delay: Turn delay functions into static
 inlines
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240307-arm32-cfi-v2-5-cc74ea0306b3@linaro.org>
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

