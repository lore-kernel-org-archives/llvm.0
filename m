Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D63DBA0
	for <llvm@lists.linux.dev>; Sat,  9 May 2026 00:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286898; cv=none; b=ofKEocvSP2VCMKCjatkOkGzm6992USqALMdVdH8CITsC27M2Bvj6oCEJHq2RIVahZSBAVOWGEPDE5y/TXKUx7qsHbSIG2DnDbXSxSKIIcTWxIrrThRf4gy78Zjtwx55L8vzqAcW+kPkR9ALVlt54k0s0sWsSNYXFMysvZ9OeNsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286898; c=relaxed/simple;
	bh=ptcjVPEI8PMcugoxtvfq2tBFzpfpZITTxcsgKiNiIUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxQC9QjEvgfKdLX3Vufz7N1FcCt1gO2gL5at0ESLf7ZnJSMlVWWUe8+nfUvOPlT9Wzdo4k5VkHGS8t1FQwO0pRHN1ZLxvJXKDplg4p96Vtm/Uy/Cc5628N2hAcTrgow/N2Dd5VtchhbuUjBPKPaRfaP9x+ZONKWJ3XSXEaUzGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrquUENk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrquUENk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aaed195901so12907255ad.0
        for <llvm@lists.linux.dev>; Fri, 08 May 2026 17:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286896; x=1778891696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcKVwdgCxNmEiNuNU9ws2Zlv9ka8LThv4VYDHowFaFg=;
        b=FrquUENk5LPZK7OasOozweMLKOFZksHUeZX/zDZsptOplVtpzR1QFAvQkX14UNNIs5
         +iUtfsO4DbmfbqKYMb6IWbF+NjtXtZs8zxJY4RewzXt5SLt/sQ/paVaqENBRgmH4pRzL
         szeGzZ4u60s4ZOBWxqCwFldnw0OY/UbeOOf4nP1z3KbGajv2oXjqpdt+DLkBH4ka0HXu
         F0t3qIxW1w94/HyhyZlxOAKgjseUeuWV3KfI8zZ4M0YaYakGQ8wpuvTHZoqd/Es0bn5v
         IIG9LMnhW/WMww/zPK340lsRy56aDiVS/9pbQUvNbqYna14faoFL4ibLtGIlIBfOunvv
         VJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286896; x=1778891696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcKVwdgCxNmEiNuNU9ws2Zlv9ka8LThv4VYDHowFaFg=;
        b=RiJkS9rUH/My6iWx2wvN7+xC9tkZE+9fwxoSH/Q3M8bAcPTtogN70+EtsKBCPETV3s
         9UZJ88wIim82WbMtPNG4hmQH78Ux1vH73PwX4wc7BJVrPzX015Zp1+bD55Kh0/iZn3MC
         nIiQfp5gBIjjnVci4mLlKJgmdqWYlyRsVTgQy7VWoYQc8p/hNAu0P0x9egJx+pubz9lq
         5ZkzjsCQxwwiEe2v5yXpwIh4zUgkwlgMe/G1HTM70snNQtgyZj/CDdkpr5075JnXSrbY
         kmiofZZUKD0yBV4T7b986pIiSjDeIlafcE8xE8YkFLR3BcOj+xtdYs1Y5q1OQoLE9sBd
         VKCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gdX5F0w8oSzAAfWribzQKXJ6rOnh5tFTN00sea/plVJtNm9LoEeMHtRTVHhNpM20ZIe3u@lists.linux.dev
X-Gm-Message-State: AOJu0YyWY0JHtVZSX2jEhRvmoePEOzrneDSL183F5/d4YLGOf/WVHD/m
	TFwCEhdEe01RWLG0Bk8r9X9RSzUrKO/HE8sVgnvnIFqBK1RED4l0Xt1M
X-Gm-Gg: Acq92OFubdzt4q0EoZ1IrM+L4wlnzIyXlvHEa1wHKhlvkZsuoniRXnmB66vauUHGv7+
	xkLQJUJKXRFTQVqutdPpFquGzda5I2Qc2Sy6Y0Yst8iG9WNicpfvJ4cJWBeOFREBn77KB/uUKvO
	bUQhnPeuPPJT/68+WFbkF97WnWFXtzCshAFFYo/RZtK4aKk9HnYvLLC8+uMSoAPpS30HCvfj4BA
	FhgFEuZ1H+z966DorKlt5ymiY2RQlF0qSke3xcElw3hsC4MScI9z4gjTxtuEsozlWrZChQ3TpU5
	lcmbIVWq429IDruCZdzP76k9Bhhb7wH1q9mDoxvBNosnhHH51corgDVm/NcXreYFEa1+RYrIuzz
	4126TdMYuUETrV2qj+4JTl7ZyeQqvXs2T3ofaYDT8Y81fLDoqzG/H0VQVbtsDXo1ifPT7yiOvic
	dFDvm+UqEo3VRG3tUHR2DCJsRbXIThhG5G5heuWj16NPTRbs3ZvNYN9Q18STS5n0GBL/Dpa3ekN
	9PFcQchUp/34DcHaSMALlTeWN4QnG1H8DY=
X-Received: by 2002:a17:903:1b0c:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2bc7aa1f5bcmr4395505ad.22.1778286896345;
        Fri, 08 May 2026 17:34:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm35086295ad.28.2026.05.08.17.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:34:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] gpio: zevio: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 17:34:38 -0700
Message-ID: <20260509003438.956051-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ZEVIO GPIO driver uses generic platform, MMIO, and gpiolib interfaces.
Allow it to build with COMPILE_TEST so it gets coverage on non-ARM
platforms.

Drop the ARM-specific IOMEM() casts around the register pointer.  The
pointer is already __iomem, so readl() and writel() can use it directly.

Tested with:
make LLVM=1 ARCH=loongarch drivers/gpio/gpio-zevio.o

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/Kconfig      | 2 +-
 drivers/gpio/gpio-zevio.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 16c798446c46..f8e34b16fd99 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -859,7 +859,7 @@ config GPIO_XTENSA
 
 config GPIO_ZEVIO
 	bool "LSI ZEVIO SoC memory mapped GPIOs"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	help
 	  Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
 
diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 29375bea2289..af0158522ac5 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -64,14 +64,14 @@ static inline u32 zevio_gpio_port_get(struct zevio_gpio *c, unsigned pin,
 					unsigned port_offset)
 {
 	unsigned section_offset = ((pin >> 3) & 3)*ZEVIO_GPIO_SECTION_SIZE;
-	return readl(IOMEM(c->regs + section_offset + port_offset));
+	return readl(c->regs + section_offset + port_offset);
 }
 
 static inline void zevio_gpio_port_set(struct zevio_gpio *c, unsigned pin,
 					unsigned port_offset, u32 val)
 {
 	unsigned section_offset = ((pin >> 3) & 3)*ZEVIO_GPIO_SECTION_SIZE;
-	writel(val, IOMEM(c->regs + section_offset + port_offset));
+	writel(val, c->regs + section_offset + port_offset);
 }
 
 /* Functions for struct gpio_chip */
-- 
2.54.0

