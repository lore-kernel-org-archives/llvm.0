Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640039733E
	for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 22:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674486; cv=none; b=Y7n62jjaeN30/XJL4yIORLjvul5gtE47/67WvBhOKT0FzsN46f+2OCYqvwpPwqYx6ldlxARh3UpGFrnaDrOPjovj8q/Db2F0LKW+6/eLOBmRegPfv7Pu1u1iKTA6ySGPL5whhElSeOQnQw/OYvsp4J2Y2F/cEa+/2WU+C5krDqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674486; c=relaxed/simple;
	bh=l3T1ZwxPhm4j4ZjqPoXWyL63holaH//cXTmXIHO2F4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=riAt3d/bYwTnGzOmNbgm5ny3lObCbwNIpiVlUb1V/vqgj0ao8H9Dz0MkcQQ5MhE7sf3j4NjW5j6qJ6vyHrhWjXtDv8Jez8s0pN4Q7XzOM7IHZVIi1QkVKv4XoYPPMYnWdkM64VVcQBXN+8vhPaR660IqGNjzjHvCWk1XQjh8dJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNL4Yx2p; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNL4Yx2p"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so5437703a91.1
        for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 15:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784674484; x=1785279284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QbIg1IxIIpMZeFpgIXtG09JmNMcRp9S88gerpDxWPSU=;
        b=UNL4Yx2phTxoAlWXK0OXmwS1bMEM1sYUkJbEpz/AcriLj3oLVW//ezlpUzP15lFKKf
         YOKlw7gc/Gx9u+Vp5M+Z5xDcKaFBlyuUWu/kqz8sl0xI0QO1pM8m/T53+dZmzaK0mIHt
         k8do5Yhv/SGP25EWXI4CWWsqE62RomVb4X4BA8sYb0WLvfrHZNM636Z4KPZGoNIvplb8
         V/ZGKST2Pszrzs/kMEH4B1g8LGM4WDQVJ4vA4GSyTchnmQ7NKlr6OUqOfulCuGP2aXJu
         Cg9qzish/F4pGQtXsZSJ+ZaaXTW6VvHV+Pe/6mKemJ+vC4ZfL+TP2LFnq7ZEvVG9w30e
         dmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674484; x=1785279284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbIg1IxIIpMZeFpgIXtG09JmNMcRp9S88gerpDxWPSU=;
        b=fgq50g+b/7+ReUvf9RP+LYg4zWlZYZAArNsehchAsPWe+tH7Djc7G+dfj0nsrlYx2m
         sAhBPKvVf8asfK7AoyrDSMLDak42wKC11efVHzHrvYjq+N0JtrGnX5PqXZ//ZwLPLZJy
         HUfhmwNB8VzG7f3M8S4zStbffCXLbyyYgfNmis6/I3wrcS0QTolydcDzr+PQ3mrp64Dr
         bilovDiNOe4clSs8yCTFvK9gAt3AxZxc6B3BNqO+Z8uVvUkJZh4y2lzsir3Jl+aFz1GT
         g0O8q4KCxBLSsxDnuqoGt3Y1BeWn3OJhiNsiy4BlVhdZK5S8fgcxTEg6m6tJUZiO58Ks
         tUhg==
X-Forwarded-Encrypted: i=1; AHgh+RpUTQcCX2C3QWF/fKAQ8qUZ7V/KpHgnNxzSCfnP8EseCNWqHTeL2QBiIVg37QL3Oh6eXdYK@lists.linux.dev
X-Gm-Message-State: AOJu0YymIut9tawYLsAeLD1+ACRHRSdVoZCKtb5kQnw9W99/YPXfbcgD
	CqavMadMQOfEZv2rD8sZMCsp/j9iBaN+8UAAPStKBZPgaYJfjoHKqMQj
X-Gm-Gg: AR+sD10hZ7pHaYUkk2rTD4WTAjiJRtl1XGjwrLkYk9AHY9utge91rKwGeM1WYQzkGS1
	3jDS1T0pVu173+D4QDqiSM0PvG9IqQBgff9up5z9aNQLDWzEudqkWVw+qs0S0uOpFfznORWqRF4
	ND493kewwEDkPVArf5fJ69085Lc+r2hut23+PncTfWjitO0cdhwz1wIGFufPejUsmLsUIpqPYce
	0QQYtTHThx7aewVqPLqaWWDvkhqf3Dxfxx5AFSQJMSWWn6ONhCslkI5/SixSnjkT1+QXgl2cF7e
	7q1jEmxMpaUJx9Qk8uMKgygypkIOSqhP8VC43eXvukR7t8NtTzVAUA8RygnkP9ybn6J6MP2ppaI
	Uc2QaXD+w869c2lnGylmn2Zqvv2WWzngFB7r3BCvsHu3+f9Qj4hCfmGyNzlx8rRtXIeX88FTrYe
	M0zGRaMEze2fur8/EacgnEYQXIkDfUfre7cVKewQnsih98s9eWF3+BbaLsRJrCWOXvOWsGzmHOG
	HdxiUbby+gdlCPJ8/vhSK2wNJWwna4u5xzfLIMnFR2+Twsj1srjbWGsCuO66fxAtw==
X-Received: by 2002:a17:90b:2ec6:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-38e6a446b78mr8745830a91.0.1784674484427;
        Tue, 21 Jul 2026 15:54:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7aff836sm39369a91.15.2026.07.21.15.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:54:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC SOUND DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ASoC: fsl: dma: use platform helpers and devm cleanup
Date: Tue, 21 Jul 2026 15:54:42 -0700
Message-ID: <20260721225442.817787-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fsl_soc_dma_probe() to managed APIs. Replace the open-coded
of_address_to_resource()/of_iomap() of the DMA channel registers with
devm_platform_ioremap_resource(), and irq_of_parse_and_map() with
platform_get_irq() (which returns a negative errno instead of 0).
Switch the allocation to devm_kzalloc() and register the component via
the devm variant, dropping the now-unneeded error-path cleanup and the
manual fsl_soc_dma_remove().

The SSI node's register resource is still read via of_address_to_resource()
to compute the SSI FIFO physical addresses (dma->ssi_stx_phys /
ssi_srx_phys); only the DMA controller window is mapped.

The DMA controller register window is owned solely by this driver, so the
new region request from devm_platform_ioremap_resource() cannot conflict
with another claimant, and it is mapped exactly once (no double mapping).

The local channel pointer is declared as void __iomem * so the
devm_platform_ioremap_resource() result can be stored before assignment
to dma->channel.

No functional change; built for powerpc (allmodconfig + CONFIG_SND_SOC_FSL_DMA)
with LLVM=1 and sound/soc/fsl/fsl_dma.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/fsl/fsl_dma.c | 68 ++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 41 deletions(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index b12474880185..b1b341132dd6 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -18,8 +18,6 @@
 #include <linux/delay.h>
 #include <linux/gfp.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/list.h>
 #include <linux/slab.h>
 
@@ -824,9 +822,34 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *ssi_np;
 	struct resource res;
+	void __iomem *channel;
 	const uint32_t *iprop;
+	int irq;
 	int ret;
 
+	channel = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(channel))
+		return PTR_ERR(channel);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	dma = devm_kzalloc(&pdev->dev, sizeof(*dma), GFP_KERNEL);
+	if (!dma)
+		return -ENOMEM;
+
+	dma->dai.name = DRV_NAME;
+	dma->dai.open = fsl_dma_open;
+	dma->dai.close = fsl_dma_close;
+	dma->dai.hw_params = fsl_dma_hw_params;
+	dma->dai.hw_free = fsl_dma_hw_free;
+	dma->dai.pointer = fsl_dma_pointer;
+	dma->dai.pcm_new = fsl_dma_new;
+
+	dma->channel = channel;
+	dma->irq = irq;
+
 	/* Find the SSI node that points to us. */
 	ssi_np = find_ssi_node(np);
 	if (!ssi_np) {
@@ -842,55 +865,19 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dma = kzalloc_obj(*dma);
-	if (!dma) {
-		of_node_put(ssi_np);
-		return -ENOMEM;
-	}
-
-	dma->dai.name = DRV_NAME;
-	dma->dai.open = fsl_dma_open;
-	dma->dai.close = fsl_dma_close;
-	dma->dai.hw_params = fsl_dma_hw_params;
-	dma->dai.hw_free = fsl_dma_hw_free;
-	dma->dai.pointer = fsl_dma_pointer;
-	dma->dai.pcm_new = fsl_dma_new;
-
 	/* Store the SSI-specific information that we need */
 	dma->ssi_stx_phys = res.start + REG_SSI_STX0;
 	dma->ssi_srx_phys = res.start + REG_SSI_SRX0;
 
 	iprop = of_get_property(ssi_np, "fsl,fifo-depth", NULL);
+	of_node_put(ssi_np);
 	if (iprop)
 		dma->ssi_fifo_depth = be32_to_cpup(iprop);
 	else
                 /* Older 8610 DTs didn't have the fifo-depth property */
 		dma->ssi_fifo_depth = 8;
 
-	of_node_put(ssi_np);
-
-	ret = devm_snd_soc_register_component(&pdev->dev, &dma->dai, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "could not register platform\n");
-		kfree(dma);
-		return ret;
-	}
-
-	dma->channel = of_iomap(np, 0);
-	dma->irq = irq_of_parse_and_map(np, 0);
-
-	dev_set_drvdata(&pdev->dev, dma);
-
-	return 0;
-}
-
-static void fsl_soc_dma_remove(struct platform_device *pdev)
-{
-	struct dma_object *dma = dev_get_drvdata(&pdev->dev);
-
-	iounmap(dma->channel);
-	irq_dispose_mapping(dma->irq);
-	kfree(dma);
+	return devm_snd_soc_register_component(&pdev->dev, &dma->dai, NULL, 0);
 }
 
 static const struct of_device_id fsl_soc_dma_ids[] = {
@@ -905,7 +892,6 @@ static struct platform_driver fsl_soc_dma_driver = {
 		.of_match_table = fsl_soc_dma_ids,
 	},
 	.probe = fsl_soc_dma_probe,
-	.remove = fsl_soc_dma_remove,
 };
 
 module_platform_driver(fsl_soc_dma_driver);
-- 
2.55.0

