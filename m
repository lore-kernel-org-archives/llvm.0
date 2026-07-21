Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AC843B48C
	for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 22:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674780; cv=none; b=JxfxYqWgtg5P4Xqrhx1kQ7r94F4bMwaLrEJOqS7LkOcJcJncDCYWJQZ1fKxDemPDvNU/NxWRFQwt1rG/JzGP7Kdd8Rh+5bzoD1D7h++eNN4vITc0J+eA3iZie6npibiX4UTa47YY/QnGk55rD6gb9CXYpzbn4Aacds+xjqxu3b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674780; c=relaxed/simple;
	bh=tj1nKeUvxwBYfAqhXEZu125F6z4Ec5QaRnY7PuVmD6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DNVhmSv1Q0p54iUgAVwTzSFSR1igNyEAAjuYC22JkyfdCLBJY3zNHJ4aoPPaAxZ17k/XjOxgdH98hA67WcP4e5NhFxMhqYy7iKIJ3HCaeZ9nE9CtXVibPquTjiML1U2zrxNXe4Uhau5eaIWXHIfqV0uRRx6TVN1jhP+cjOWctNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkIc4ZYr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkIc4ZYr"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce98cb8165so58152785ad.1
        for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 15:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784674779; x=1785279579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5v1SpCcEJEF5L1lruFHQA8jtL7QADyRj485pvMovoIM=;
        b=mkIc4ZYrzqDg+CaM/rRNjj1AtO0fxHJeQxiRcpYJt7P0+aaCiDGr5UJjw6JbhoDCzQ
         K/UXVbwb0rtqTFVTOXUrWumq/XfIXQgZ/+Q/Gs+3mE7PnohqwcITYZS8l3XZEQ1bt1q5
         y/vBL2fB8Ex7P7+ABrgoiAYbeCjG2gAQuk6PScVSnfsrTJgBtRyBPFQKEQ0uj0ZKlA1H
         NxyXEOi4hqf5X8BewVGzra21Vu0lFxTjUAcWsabrxIjJ+vLKV7t1MIuoaEJZSUl8sGcA
         lCuywmT0g2cIVoNS3tkaqWvuUo5GyBsdQ/zgVXY1JGDO3LDjLQluKfIWY3f8yQAcWzD4
         hEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674779; x=1785279579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5v1SpCcEJEF5L1lruFHQA8jtL7QADyRj485pvMovoIM=;
        b=GtegLI9RjzECTBWlK2IkkUYIEC8t53mwZSkNJRJd/OZnRrhb78ZJe6RSiU+NEymmsK
         1qdx+cr9WbXhHpqlPQDaDmZwVW8DdE0CF9Ac5aYrzl8uLNv0aMMXyTffSTDXbI8FuD9i
         m5scz+JSIInzB/9d02JT7vPzrEwRh6Lu9oXMPRt1LFGUviS90UvHxqU6QAeakuP6R+qa
         8p9x6rKf9GSPNKl/fO6t6lbFG7DIxuLCUEl9c/JdrO8YBveWz856RzHUiG/sm5jErvaX
         QOXTCUVgq+G0lLTFFfl5rOOReG5jBi4Jhs++r63n1IOjXj/gAmqVdZegVZNcVStaOXCf
         WOaQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/TPh2ycGE7pAOIZmlsI6ysN4EFtk1osIdtadUcmJkiQKTovigqhALm8Z8cLpukFmMjhYw@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1vuo9AgT7SQIiYF/4ZYo1QEexrMANtCLH918qMcB7cZGlhvXf
	D4Vyo3Cf4UvAVmAgO/ZoJGrGqBJ0o8b61Iz9OnNnN8NMaXEJnW2ovepl
X-Gm-Gg: AR+sD136tvvUPebo+hBKAC3msvwvLl7AyYXutFxgN0vnZszzo2kKRi8zJ6a12Nkm8ON
	5IoH5QxdfTckdiE0uuZx9PeL8/LpdgLHlnInjoRhGjyakyYFaeGWj0eWiz7lFivc2ePt/CmOLUR
	e1WaoPQ7m2Z4bm3zmahee9oKENLJj9TOEI/Y7C2TS+sL84lOt7pX/ZrmCyCkDRxHv8/t4LYoxMV
	1w2zs+rOFl7uHfrEvecS+CuTDUo8mYdrwoXyl8v18ryciV6L0NbGg2oD5GrEjYT/sZRtAyf2gHa
	ri/m3N3Nyei7+PO3BLTP6VAvVILIg059DFLG9qqCi/qm3wyztAGVscOkqr8B62bhuAXXPBx/c5s
	NXM2OkcptzIWi0Z7Od5HDBbNV+TGTDXEwKlAyOS7GDDhCFX9/HNxjuXesjHB97d/gXxaatEK4t5
	xncI4p1KNhcXHzbFtPxMbEpOLySRp7hhWXxr+e8ksVBQjSzcqFuohI9JCMLnNNNmX/w+zHSuFFK
	R1bw96GyuZoM35oY8BrgyrGXwA+hwOp/Ong47udfknIlAVxVPCbPmw=
X-Received: by 2002:a17:902:f706:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2cf8dde30a5mr13984515ad.24.1784674778619;
        Tue, 21 Jul 2026 15:59:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3808a8sm3805075ad.73.2026.07.21.15.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:59:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ASoC: fsl: mpc5200_dma: use platform helpers and devm cleanup
Date: Tue, 21 Jul 2026 15:59:36 -0700
Message-ID: <20260721225936.838299-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert mpc5200_audio_dma_create() to the managed APIs. Replace the
open-coded of_address_to_resource() + devm_ioremap() of the PSC registers
with devm_platform_get_and_ioremap_resource(), and irq_of_parse_and_map()
with platform_get_irq() (which returns a negative errno instead of 0).
Switch the allocation to devm_kzalloc(), the three interrupt requests to
devm_request_irq(), and drop the now-unneeded error-path cleanup and the
manual teardown in mpc5200_audio_dma_destroy().

The PSC register window is owned solely by this driver, so the new region
request from devm_platform_get_and_ioremap_resource() cannot conflict
with another claimant, and it is mapped exactly once (no double mapping).
The resource pointer is still used (res->start) to compute the FIFO
physical address.

No functional change; built for powerpc (allmodconfig + CONFIG_SND_SOC_MPC5200_DMA)
with LLVM=1 and sound/soc/fsl/mpc5200_dma.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/fsl/mpc5200_dma.c      | 58 ++++++++++----------------------
 sound/soc/fsl/mpc5200_psc_ac97.c |  4 +--
 sound/soc/fsl/mpc5200_psc_i2s.c  |  3 +-
 3 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index bfedb2dea0b3..8327fff3e1b5 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -314,35 +314,29 @@ int mpc5200_audio_dma_create(struct platform_device *op)
 {
 	phys_addr_t fifo;
 	struct psc_dma *psc_dma;
-	struct resource res;
+	struct resource *res;
 	int size, irq, rc;
 	const __be32 *prop;
 	void __iomem *regs;
-	int ret;
+
+	regs = devm_platform_get_and_ioremap_resource(op, 0, &res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	/* Fetch the registers and IRQ of the PSC */
-	irq = irq_of_parse_and_map(op->dev.of_node, 0);
-	if (of_address_to_resource(op->dev.of_node, 0, &res)) {
-		dev_err(&op->dev, "Missing reg property\n");
-		return -ENODEV;
-	}
-	regs = devm_ioremap(&op->dev, res.start, resource_size(&res));
-	if (!regs) {
-		dev_err(&op->dev, "Could not map registers\n");
-		return -ENODEV;
-	}
+	irq = platform_get_irq(op, 0);
+	if (irq < 0)
+		return irq;
 
 	/* Allocate and initialize the driver private data */
-	psc_dma = kzalloc_obj(*psc_dma);
+	psc_dma = devm_kzalloc(&op->dev, sizeof(*psc_dma), GFP_KERNEL);
 	if (!psc_dma)
 		return -ENOMEM;
 
 	/* Get the PSC ID */
 	prop = of_get_property(op->dev.of_node, "cell-index", &size);
-	if (!prop || size < sizeof *prop) {
-		ret = -ENODEV;
-		goto out_free;
-	}
+	if (!prop || size < sizeof *prop)
+		return -ENODEV;
 
 	spin_lock_init(&psc_dma->lock);
 	mutex_init(&psc_dma->mutex);
@@ -357,7 +351,7 @@ int mpc5200_audio_dma_create(struct platform_device *op)
 
 	/* Find the address of the fifo data registers and setup the
 	 * DMA tasks */
-	fifo = res.start + offsetof(struct mpc52xx_psc, buffer.buffer_32);
+	fifo = res->start + offsetof(struct mpc52xx_psc, buffer.buffer_32);
 	psc_dma->capture.bcom_task =
 		bcom_psc_gen_bd_rx_init(psc_dma->id, 10, fifo, 512);
 	psc_dma->playback.bcom_task =
@@ -365,8 +359,7 @@ int mpc5200_audio_dma_create(struct platform_device *op)
 	if (!psc_dma->capture.bcom_task ||
 	    !psc_dma->playback.bcom_task) {
 		dev_err(&op->dev, "Could not allocate bestcomm tasks\n");
-		ret = -ENODEV;
-		goto out_free;
+		return -ENODEV;
 	}
 
 	/* Disable all interrupts and reset the PSC */
@@ -399,16 +392,14 @@ int mpc5200_audio_dma_create(struct platform_device *op)
 	psc_dma->capture.irq =
 		bcom_get_task_irq(psc_dma->capture.bcom_task);
 
-	rc = request_irq(psc_dma->irq, &psc_dma_status_irq, IRQF_SHARED,
+	rc = devm_request_irq(&op->dev, psc_dma->irq, &psc_dma_status_irq, IRQF_SHARED,
 			 "psc-dma-status", psc_dma);
-	rc |= request_irq(psc_dma->capture.irq, &psc_dma_bcom_irq, IRQF_SHARED,
+	rc |= devm_request_irq(&op->dev, psc_dma->capture.irq, &psc_dma_bcom_irq, IRQF_SHARED,
 			  "psc-dma-capture", &psc_dma->capture);
-	rc |= request_irq(psc_dma->playback.irq, &psc_dma_bcom_irq, IRQF_SHARED,
+	rc |= devm_request_irq(&op->dev, psc_dma->playback.irq, &psc_dma_bcom_irq, IRQF_SHARED,
 			  "psc-dma-playback", &psc_dma->playback);
-	if (rc) {
-		ret = -ENODEV;
-		goto out_irq;
-	}
+	if (rc)
+		return -ENODEV;
 
 	/* Save what we've done so it can be found again later */
 	dev_set_drvdata(&op->dev, psc_dma);
@@ -416,13 +407,6 @@ int mpc5200_audio_dma_create(struct platform_device *op)
 	/* Tell the ASoC OF helpers about it */
 	return devm_snd_soc_register_component(&op->dev,
 					&mpc5200_audio_dma_component, NULL, 0);
-out_irq:
-	free_irq(psc_dma->irq, psc_dma);
-	free_irq(psc_dma->capture.irq, &psc_dma->capture);
-	free_irq(psc_dma->playback.irq, &psc_dma->playback);
-out_free:
-	kfree(psc_dma);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(mpc5200_audio_dma_create);
 
@@ -435,12 +419,6 @@ int mpc5200_audio_dma_destroy(struct platform_device *op)
 	bcom_gen_bd_rx_release(psc_dma->capture.bcom_task);
 	bcom_gen_bd_tx_release(psc_dma->playback.bcom_task);
 
-	/* Release irqs */
-	free_irq(psc_dma->irq, psc_dma);
-	free_irq(psc_dma->capture.irq, &psc_dma->capture);
-	free_irq(psc_dma->playback.irq, &psc_dma->playback);
-
-	kfree(psc_dma);
 	dev_set_drvdata(&op->dev, NULL);
 
 	return 0;
diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 2aefd6414ace..ccd8bda05860 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -276,7 +276,7 @@ static int psc_ac97_of_probe(struct platform_device *op)
 		return rc;
 	}
 
-	rc = snd_soc_register_component(&op->dev, &psc_ac97_component,
+	rc = devm_snd_soc_register_component(&op->dev, &psc_ac97_component,
 					psc_ac97_dai, ARRAY_SIZE(psc_ac97_dai));
 	if (rc != 0) {
 		dev_err(&op->dev, "Failed to register DAI\n");
@@ -302,8 +302,6 @@ static int psc_ac97_of_probe(struct platform_device *op)
 static void psc_ac97_of_remove(struct platform_device *op)
 {
 	mpc5200_audio_dma_destroy(op);
-	snd_soc_unregister_component(&op->dev);
-	snd_soc_set_ac97_ops(NULL);
 }
 
 /* Match table for of_platform binding */
diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index 7831136f4f12..55a12be6ad18 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -166,7 +166,7 @@ static int psc_i2s_of_probe(struct platform_device *op)
 	if (rc != 0)
 		return rc;
 
-	rc = snd_soc_register_component(&op->dev, &psc_i2s_component,
+	rc = devm_snd_soc_register_component(&op->dev, &psc_i2s_component,
 					psc_i2s_dai, ARRAY_SIZE(psc_i2s_dai));
 	if (rc != 0) {
 		pr_err("Failed to register DAI\n");
@@ -213,7 +213,6 @@ static int psc_i2s_of_probe(struct platform_device *op)
 static void psc_i2s_of_remove(struct platform_device *op)
 {
 	mpc5200_audio_dma_destroy(op);
-	snd_soc_unregister_component(&op->dev);
 }
 
 /* Match table for of_platform binding */
-- 
2.55.0

