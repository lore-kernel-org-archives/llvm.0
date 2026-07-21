Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F953FF8B6
	for <llvm@lists.linux.dev>; Tue, 21 Jul 2026 01:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784599142; cv=none; b=jCp+O4ke2J8leTJc3J4DJ1K75mjIyDTfZUfNxaKwnmPnz7wT5km9rGgH5vcxNQIq22BW1gqFd5ONBUEs5zFMCOiGeWHC6odqkwtAxVTyLap7R8UJMwzZSScGDA8W1IklitljZ8hU0EVmyVJm8ZDsrGDEN0/mqRFy/2iUHAmbV54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784599142; c=relaxed/simple;
	bh=64BryWhazFiSQGTHWsvVf9n0qNYmhx/nkK0q5awa1cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KatRawS6VZVmOG1PVSd3Ys2y1UfeX4dsIFeo45JRVbqnPbr6B7ZbA+lGhj+4k6Fca/2Sn4+NG7W4yXZTyohf8atIHjODHPo+4knNYjo1Xc1DT08Btzij8q0BmODM8DL/pbkRFT1AOv56Ep4dHQYULEDzTTn8awyEfxdVcGGo3LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJOvLer6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJOvLer6"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so3155210a91.0
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 18:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784599139; x=1785203939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4L7OFyjs0agWHOOlRPNJjGmbLFr+eh96a4dzibePYvg=;
        b=pJOvLer6/zujobu1shYDtpRHIbWX43nVpKmWwhtMAOps7cTaI93TIHNJ2lxKGhGYtc
         SVeG8NEmTYzdp83EvQ0mygGJpkbPyTcoyqkMSTYiEfoVpkcfi8kBNFokHNxjgIwKfj/E
         4UIh2oLT0cm5M0E9AyRJkvJteVDte+yuF8ykbCJlIAFqEMIk4ned0/+8zRgaZsUjw8Cb
         YRQWUDiYsLTCYma+UoKUMnnRxpiQlqGys6H65ag9f5/AwrEm1oHGcNGHG3JlsBHf5LH4
         dZtOQjlRlzVcVfBiVmymXLKX/tv0cZRvi+1fqKN4dUUiXtno9zOMbOCJTJzqXQWuCmBF
         eRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784599139; x=1785203939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4L7OFyjs0agWHOOlRPNJjGmbLFr+eh96a4dzibePYvg=;
        b=CY67VF+DtZdZNJblgv2DGjRtwUedyt0tL3Z6zzFEqC0giOF6doBwn4QXjpz2mdS5d9
         95WVE8wF+IlvjsyNbLkdmx++4Eu9elhCHQ1O8Oh+U2Obw/zuEnr0a9qgEDEnHk4gsemh
         gXi3+jJv53twQ4nlyQ5RM0tZPnSHig4qw63+zjg9Q9G2OGo7TM4g+GYI/mhv8eibOdZQ
         +RHJuL2mhP63DjNOUju55fIjZia7b0V2Woss8vofEeP3v6l/riHxFoeirjAYxnwO0NRc
         IYiMilZZNu4BZ0zGNfEHDD7niJP4JFQbDCCcTw4rUThOSeo1/RZoSYZep/JizTVIydkc
         PaHA==
X-Forwarded-Encrypted: i=1; AHgh+RpUZgi+66N1IOGtIwc6W3WnalvRXe8naY1TL6+gueyHoMVD+SOMTAwv3hYJpMF4MDqUVXfn@lists.linux.dev
X-Gm-Message-State: AOJu0YwBLtLDqaXTowZ7Wy1SCP+um449XPJUa3jNZaU5BjLIDP4xlfhf
	koqbULSyMSEgT6O1ntdL6SefXtue6jXntstErbnKVnpu414vwbraUkus
X-Gm-Gg: AR+sD13vcm+E0m+gKO/AI3F+27tuMLR9DuLoeZomPLfVM8bkq+Sjy7QIVw535z7a2Lr
	+Bd1RUNbu7ZnSXSpc6K8MGJCMlL59WqwvgktIO1OTwMNcjZrzCF8E1TnkINbp/kFgvGuWww2Bsn
	XkKeqb+5ZHX1A7OF1XPYoTNu4+bvdXsKwpJY6zK3k6UFf+IN97z89CInZNQEZZVf0kz+QHbIuGi
	iD9g8DQD/37gu4fWEtY39gIzKSIaSdtzBMkMOO1bu8gaaeRhjfTUpVFt8cpqEhGdS+Fawr9sHut
	Ea/gz9zy9ZcPKKFzMZYHpoYVv5q23cUz0W/8LDteGwbWC8yDn6nAjkTOxojqTN0MdoKXbFSkhg3
	BPxDsMN1mk3hZa1zkNSjlVku/HOhnNIdnR/NJel7U6Ej4zU9Mv3CZWzG2TwA9pYw853QxreeCHW
	oTUkRw0QNZgeiBCI+Zc9G7e0jFP2fJ1L12xEwAFJFI4JvYloe+3J4TO4OuvEvFHWYPJbsaXlpuT
	aGtFfqT612fVmPRXaG3VG0VZtQtfyJvNH9Mod3FByVsQuyU+gWmttY=
X-Received: by 2002:a17:90b:2891:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38e4b68268bmr15320913a91.15.1784599138974;
        Mon, 20 Jul 2026 18:58:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92064c77sm620646a91.1.2026.07.20.18.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 18:58:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-ide@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] ata: pata_pxa: use devres for DMA channel management
Date: Mon, 20 Jul 2026 18:58:56 -0700
Message-ID: <20260721015856.17503-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the DMA channel request to devm_dma_request_chan() so the
channel is released automatically on device teardown. This removes
the explicit dma_release_channel() calls in the probe error paths
and in pxa_ata_remove(), simplifying the driver.

Use ata_platform_remove_one() which is now equivalent to what remains of
the remove function after dma_release_channel() removal.

Built as a module for arm/pxa_defconfig (CONFIG_PATA_PXA=m) with
LLVM=1 W=1; no new warnings.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: Use ata_platform_remove_one()
 drivers/ata/pata_pxa.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/ata/pata_pxa.c b/drivers/ata/pata_pxa.c
index c816997dc0a9..a694f6a178e3 100644
--- a/drivers/ata/pata_pxa.c
+++ b/drivers/ata/pata_pxa.c
@@ -262,40 +262,26 @@ static int pxa_ata_probe(struct platform_device *pdev)
 	/*
 	 * Request the DMA channel
 	 */
-	data->dma_chan = dma_request_chan(&pdev->dev, "data");
+	data->dma_chan = devm_dma_request_chan(&pdev->dev, "data");
 	if (IS_ERR(data->dma_chan))
 		return PTR_ERR(data->dma_chan);
+
 	ret = dmaengine_slave_config(data->dma_chan, &config);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "dma configuration failed: %d\n", ret);
-		dma_release_channel(data->dma_chan);
 		return ret;
 	}
 
 	/*
 	 * Activate the ATA host
 	 */
-	ret = ata_host_activate(host, irq, ata_sff_interrupt,
+	return ata_host_activate(host, irq, ata_sff_interrupt,
 				pdata->irq_flags, &pxa_ata_sht);
-	if (ret)
-		dma_release_channel(data->dma_chan);
-
-	return ret;
-}
-
-static void pxa_ata_remove(struct platform_device *pdev)
-{
-	struct ata_host *host = platform_get_drvdata(pdev);
-	struct pata_pxa_data *data = host->ports[0]->private_data;
-
-	dma_release_channel(data->dma_chan);
-
-	ata_host_detach(host);
 }
 
 static struct platform_driver pxa_ata_driver = {
 	.probe		= pxa_ata_probe,
-	.remove		= pxa_ata_remove,
+	.remove		= ata_platform_remove_one,
 	.driver		= {
 		.name		= DRV_NAME,
 	},
-- 
2.55.0

