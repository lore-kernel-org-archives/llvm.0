Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4460244AB9F
	for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674455; cv=none; b=Rn3J6SAyYV+o6XkLrjHzqe2TeNIlAknXn+7tLvrYvgvag8W2Q9bCZJ0XIqkbJxtLvUMzs+M1D2fRMl2j43/84FFtDg3so6BgK3wtGO+6R3NoA7rSnQyf0CJUabVasgyncmQKEf258Fg4GWChM5Kewm8LckhLJ0aHQgMidnhjGcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674455; c=relaxed/simple;
	bh=MBjhWcgOvvehp0elF3oz48EUBUyyETA5XSihwakMXr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A7i7MFFdKD99NS9iRuj8jue2/1vC8lLxoExie8adS/bImfTFYSg9deTIjdF8Whp5L5awDyjpioXqJLTA1lodgz7tpTANnIzK5HIdZxxNvdoHX1jdFtXq1TtfpfdjClca30HAyHA2LZ72eFt6Msw4THqzDJSXm6XrtE/Mq2xfLHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7Yi28Ox; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7Yi28Ox"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso8052687a12.2
        for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 15:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784674453; x=1785279253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGYc1TdXcvIKmo54F2N01YiaD23wedJvo9tZPTjUvCE=;
        b=Z7Yi28OxVzGLx+DO64FNu2b55Qu0e4JkYjrcjmKAhMGzB8fk+4wwJq++JHJmlrO6bU
         65bwUCG5FBc/Fi/UkCIf6zWpUqYH79EHQ/UttzyUwnRWPJiIzB1ihQBaG2cnuizSjauj
         s713PZp8USSq0xpLIwjniDU8cNE4lnQpehrIswXLPPCWdApUUMaTIg956Mprt9OKqod1
         1MWIkvN3BvPmA0vpKeWDsMXsvNsMqFYXerfTBu9DRU/+ltBNGomamblVRpZJ440D4jqZ
         KmRyBksfQIMzZ+2RnCxcJJgfzK93fiIXMsDhXW4L8NtT61QRpEf4K8eGHM7eneVvANLc
         QGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674453; x=1785279253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGYc1TdXcvIKmo54F2N01YiaD23wedJvo9tZPTjUvCE=;
        b=WHVyxF2hdP5NPrJEXYAmdFrCNfcCZEVtoVK+RvAzYTEjMQIL05j/oeYIMUjycEams6
         q09pyDUlMGGb/EnWogy1myg5MAW0f0JoK7Q7SabrSLbZ4+JBVv2nTOFsX6Yb8HZDCrBw
         fwkcEWsvEyVbOeUiVLNKNgpe+CBF+G3zNMevLxPR04JEe0fN78Ym/qhXdS3Vb/BMT3wn
         PauVfQOVc2Pfxq/HUA+2qdfPWHUbBFU9Ej8Kx8F5gbD0zvnWbRf+FyZGtDWi+F+V/H5D
         Jo73E0TGe8B2Md5DUHRZa26gaNtq0nGrJ3/SKXk3a2AmcDdtBgl7GWE9tL3945OvFWJT
         sIAg==
X-Forwarded-Encrypted: i=1; AHgh+RpyKU4pdKAi/5/adzPlzIK3CikzKUgZSAXnFH6/hMr0Ghdw9NzQRoQT675xUMhCKbxjEFkF@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1CLGIKqhckSDEdS34vJCYAnmo5g8D94NmzMqe0KgWlVtVbOJ1
	AhLJxDiOxuV9IUhEzAP7guIh/KuGZtmon37tw0DUMPq13JH0vwgl+s/x
X-Gm-Gg: AR+sD10L6msDeqntnqjWWoMUQnbLaxNXCJFEmLcWDK2xLX5gZV+JhI/4x5wb9x5HsiG
	zq8LDfrAAdRPu4JMms65LLVfr5pQRfMR/J3LiVrA7Xx2Ynt3smJWFdhyA1g9KjFp9nClVBBgRG2
	uPvpcycC8PWIdM4213/rkOXYZcI/PAkLctwOvjuKtrObzU4MKO0POUCH6qCsJXpQwebquziT3dw
	dJwDTjDWo+6VxV4GtYt7IwRPc+zpWFLa2GXSjL7nvoDJgV0etlN6Gor/7/l5oHAorX/LCWjq3yz
	7pFPFHO5X7hgR5LLCSGlEHDe8aIulKE7nEVQlqfu9Glc66RSFV/E/y/7v1EQFmsrigDeLHMsxPj
	OXfhiypLOxLW8cW5Nov4QtoC/GpGKkKL2WU3Wg65z/cHVlzsImDcbHMm9a2zM+rxHDMmGDqqLUr
	ymq2HLMS5PcIw+EiLddeoILPvqtHvBFuzqtY8ACT0geEmGgnEu2gR5xvnRjafhGV2WXEv8tCbVD
	/xO5hHEydBMtYR1wKRJCRXi3BZ2FtCAIBL39uQqDWP7Eys5c+JqlN8=
X-Received: by 2002:a05:6a21:7008:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3c3ad7a3d10mr23380821637.23.1784674453530;
        Tue, 21 Jul 2026 15:54:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a884esm199994a12.23.2026.07.21.15.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:54:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ALSA: atmel: ac97c: use platform helpers and devm cleanup
Date: Tue, 21 Jul 2026 15:54:11 -0700
Message-ID: <20260721225411.815553-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert atmel_ac97c_probe() to the managed APIs. Replace the open-coded
platform_get_resource() + ioremap() with devm_platform_ioremap_resource(),
which requests and maps the AC97C register window in one call. Switch the
clock to devm_clk_get_enabled(), the card to snd_devm_card_new(), and the
interrupt to devm_request_irq(). The now-unnecessary error-path cleanup
and the manual teardown in atmel_ac97c_remove() are dropped, since devm
handles them.

platform_get_irq() was already used; tighten its error check to irq < 0.

Both resource and IRQ lookups are equivalent for a platform-backed
device. The AC97C register window is owned solely by this driver, so the
new region request cannot conflict with another claimant, and it is
mapped exactly once (no double mapping).

No functional change; built for ARM (allmodconfig + SND_ATMEL_AC97C)
with LLVM=1 and sound/atmel/ac97c.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/atmel/ac97c.c | 67 ++++++++++++---------------------------------
 1 file changed, 17 insertions(+), 50 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index e394205f469b..234549e17351 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -693,7 +693,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	struct snd_card			*card;
 	struct atmel_ac97c		*chip;
-	struct resource			*regs;
+	void __iomem			*regs;
 	struct clk			*pclk;
 	static const struct snd_ac97_bus_ops	ops = {
 		.write	= atmel_ac97c_write,
@@ -702,42 +702,34 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	int				retval;
 	int				irq;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!regs) {
-		dev_dbg(&pdev->dev, "no memory resource\n");
-		return -ENXIO;
-	}
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_dbg(&pdev->dev, "could not get irq: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
-	pclk = clk_get(&pdev->dev, "ac97_clk");
+	pclk = devm_clk_get_enabled(&pdev->dev, "ac97_clk");
 	if (IS_ERR(pclk)) {
 		dev_dbg(&pdev->dev, "no peripheral clock\n");
 		return PTR_ERR(pclk);
 	}
-	retval = clk_prepare_enable(pclk);
-	if (retval)
-		goto err_prepare_enable;
 
-	retval = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
+	retval = snd_devm_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
 			      SNDRV_DEFAULT_STR1, THIS_MODULE,
 			      sizeof(struct atmel_ac97c), &card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not create sound card device\n");
-		goto err_snd_card_new;
+		return retval;
 	}
 
 	chip = get_chip(card);
 
-	retval = request_irq(irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
-	if (retval) {
-		dev_dbg(&pdev->dev, "unable to request irq %d\n", irq);
-		goto err_request_irq;
-	}
+	retval = devm_request_irq(&pdev->dev, irq, atmel_ac97c_interrupt, 0, "AC97C", chip);
+	if (retval)
+		return retval;
+
 	chip->irq = irq;
 
 	spin_lock_init(&chip->lock);
@@ -749,13 +741,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	chip->card = card;
 	chip->pclk = pclk;
 	chip->pdev = pdev;
-	chip->regs = ioremap(regs->start, resource_size(regs));
-
-	if (!chip->regs) {
-		dev_dbg(&pdev->dev, "could not remap register memory\n");
-		retval = -ENOMEM;
-		goto err_ioremap;
-	}
+	chip->regs = regs;
 
 	chip->reset_pin = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_OUT_HIGH);
 	if (IS_ERR(chip->reset_pin))
@@ -770,25 +756,25 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	retval = snd_ac97_bus(card, 0, &ops, chip, &chip->ac97_bus);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register on ac97 bus\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	retval = atmel_ac97c_mixer_new(chip);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register ac97 mixer\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	retval = atmel_ac97c_pcm_new(chip);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register ac97 pcm device\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	retval = snd_card_register(card);
 	if (retval) {
 		dev_dbg(&pdev->dev, "could not register sound card\n");
-		goto err_ac97_bus;
+		return retval;
 	}
 
 	platform_set_drvdata(pdev, card);
@@ -797,18 +783,6 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 			chip->regs, irq);
 
 	return 0;
-
-err_ac97_bus:
-	iounmap(chip->regs);
-err_ioremap:
-	free_irq(irq, chip);
-err_request_irq:
-	snd_card_free(card);
-err_snd_card_new:
-	clk_disable_unprepare(pclk);
-err_prepare_enable:
-	clk_put(pclk);
-	return retval;
 }
 
 static int atmel_ac97c_suspend(struct device *pdev)
@@ -839,13 +813,6 @@ static void atmel_ac97c_remove(struct platform_device *pdev)
 	ac97c_writel(chip, CAMR, 0);
 	ac97c_writel(chip, COMR, 0);
 	ac97c_writel(chip, MR,   0);
-
-	clk_disable_unprepare(chip->pclk);
-	clk_put(chip->pclk);
-	iounmap(chip->regs);
-	free_irq(chip->irq, chip);
-
-	snd_card_free(card);
 }
 
 static struct platform_driver atmel_ac97c_driver = {
-- 
2.55.0

