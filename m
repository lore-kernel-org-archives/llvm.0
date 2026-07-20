Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E40F248F57
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 01:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784512218; cv=none; b=ewasClEe3avpxW2XZfkEKGEsHkavJU1jEIUpwMXSqyiZUt/HTbhZYiOr51y0/QNsUqWc3qlw7YFryDMcDlhr39ibr8SFbqt/3vx5+v7tPDjnjXpDbZcy6TLTuaGhlkdr/MUMtqQ1PtKK+Ixsa4xunVyeJttPTBvsmS/dCdG3m4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784512218; c=relaxed/simple;
	bh=DU6Ckuf48f/4NqmZmoos0Ko9YBwcRdS4grncBFeBkzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y5waEuTRfSOMbHpVMPQetjjUrJASFkK+FhuVMQI2gS3NhNBx9V4JSrDTvZkiVNPl3T5Nh31vDe3b+DwANxWbIAkspG9D8fSdq3RS5A8rWEEOv6/SPOFf23NwWCfn9GaallkZd9K28HBdzxM4S7ktzu00CWytlc9kyg50U1sey4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNlJAUio; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNlJAUio"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cad4170e8eso129319885ad.3
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 18:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784512217; x=1785117017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YStLGv1jhTctpq6ANWoNwXrNsS0VLH3pxJYPZv46zjc=;
        b=QNlJAUio4e1uCGsr3Hx6/PgZqlRwmh6cXYw6OyuSZrs7hh6RLMz7FFjhAJp0W05kR3
         ohaKlozr1n4+Knr7FPFIoNuurfkF2RTdleBdECyKUW/pgSF39x16tzU5V8MAI2yphX2X
         Lq0eclF1+FuWCnwPthpBgAkqfob76epI7JLP0cMxTzroanFidbjG6DNVq7FXMK9qGxDb
         eOhB+q9KXDGFs3H+7pqQru5MsjwX6tRgRmkwozZXsCHJvbXRbyNVrQlZFZabmy90RUfN
         11YPk+TRTh0bYZ/jppi8lqWmDxtOSFBrJJNyspwPdTZxP79Gd2vNTj4Ayl8kyWsuT2VE
         TLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784512217; x=1785117017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YStLGv1jhTctpq6ANWoNwXrNsS0VLH3pxJYPZv46zjc=;
        b=jdHX1vkiS10Ee6Cyj+5CPC0NA6koAsFemWokZpbv5bOzp4nHDw7Hj8BVSkUeYVPc1O
         O7eHwhpx5ZcHMPPK9YaqJrO48uoFZoLgLF2LOLRTWO6tvjlR19qgdUJPI0sx9lQv5gqB
         ub4J3r7l172vH1BAAsMlfEKZO5hBBW7XWA+w2tobYXXxpe1B4ybeFIvtfGDgUPxyIJE5
         uUNOCuHoNyfU13VU5YquPIigp9WAlF2PaUhdCVdYIzG0L9iTf1uw/z1L5hsYhdwpqFfc
         2ZsrMROkb8hB7CM9QIvw5he7quYPSXl913Lud6nm4hXgyl8hiVbIVgdtyk6OnTTq1IU7
         MCbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZ8BoBvw0qqd1xZuNKPGoVgk18ciAAGmegEXsURTH5MdO+QCd33atgwSynkVQ63ajJAsi6@lists.linux.dev
X-Gm-Message-State: AOJu0Yx95cDrk95WefYWdAWoXIY/T5amap5Rf656oewU9NxHGysyS5jj
	XNbQqNCW4SJwK+wniziMrRbw0UYqLKDHIUUNFyAFlFmTOANfs9gtBzB2
X-Gm-Gg: AfdE7clEB+RPimXMEMe8KivYaWdC4jBUp6lwt9SlMbcANpZLiGTeZYrlNXV4DZ3BZBv
	iIzk4cRDm/QfkhyVMyOIQTiWFBwL97S+z6IMxIjrmFcyypOIAl0wAB26ZvfQ0ys8CbA6CsEmjA9
	/pYoVvELfhoECz0UVbyZYVmYhz+xaM28emVwSr0YPtigE+DKeE3msJfqJiUiBrnuymy0QAJoMlG
	xO+gnZingbywYN29F+SzqRMqtn20PIygzCeVxCTC28blonCqig5TmP5/jDWic9pgzM14IKhw4PC
	KRtUSoyXNT4Z/lGI44vT8lg1Qjd5EOmmkK1JsWhlHXV9n5aTsc2UkhqIkXgY5ME1OIZmW8F31v/
	JXzfIyJ2rFrUBpocviVO+JXpVp76b9MNBGxYShRUXcOVeLI05sUl0GtF8nx3kTNtQ2nV4Dkq616
	G8vXskoVq2kYGwEOMqH5k2aTsJnvmaK3iOZeuNFn1etSoewGr75P/EIVuNUlt8OQIDbwl40RijS
	bYSRg5szUD3KhcMwQWCG2hBdN2X5cYDXrjEucido+r0k+k1DFKwPgU=
X-Received: by 2002:a17:902:d588:b0:2c9:e86e:a9f5 with SMTP id d9443c01a7336-2cf348669c4mr143330315ad.18.1784512216823;
        Sun, 19 Jul 2026 18:50:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm47174655ad.24.2026.07.19.18.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:50:16 -0700 (PDT)
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
Subject: [PATCH] ata: pata_pxa: use devres for DMA channel management
Date: Sun, 19 Jul 2026 18:50:14 -0700
Message-ID: <20260720015014.1912040-1-rosenp@gmail.com>
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

Devres releases in LIFO order, so the managed host detach registered
by ata_host_activate() runs before the DMA channel is released, which
preserves the previous teardown ordering.

Built as a module for arm/pxa_defconfig (CONFIG_PATA_PXA=m) with
LLVM=1 W=1; no new warnings.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/ata/pata_pxa.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/ata/pata_pxa.c b/drivers/ata/pata_pxa.c
index c816997dc0a9..a08b852dd9f9 100644
--- a/drivers/ata/pata_pxa.c
+++ b/drivers/ata/pata_pxa.c
@@ -262,33 +262,26 @@ static int pxa_ata_probe(struct platform_device *pdev)
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
 }
 
 static void pxa_ata_remove(struct platform_device *pdev)
 {
 	struct ata_host *host = platform_get_drvdata(pdev);
-	struct pata_pxa_data *data = host->ports[0]->private_data;
-
-	dma_release_channel(data->dma_chan);
 
 	ata_host_detach(host);
 }
-- 
2.55.0

