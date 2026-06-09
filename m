Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3840403B1E
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043607; cv=none; b=nyLtcbLhSFCpZHFUSmeW8BOFJD3Jtbg7xvGLcMvXtMn0ONfV7dvx0besWU71sl4KYLTUoEPL4DyGCeAmWIDAr78qjHSPfOfaEGrx97E7S4rxpZg2P5AFj6YduljhlKrsKjSgA6XtHh44SB+i1zJuDnI+e9v1cP2hi9rZLFw5AUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043607; c=relaxed/simple;
	bh=lAp8VELf1WIzDtTXvES1MckgNe5J8JcBQCSWSAEzxUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVFpyahl6Gk7iGaVECzRm0blr18kAbGLeotncTyE8c2Gh5u0d5281D7qDXQHLFSyjZpaGmzv3hStZjtAMrbVGF0dyPYGK8eaOaAm+SQWjGCVn4uRZJRypoy2s2fhGuq8N/tcs7wGaUs7mRAbR9gNwqodSeR5syUOMLp4G4WzUIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQ96xZFX; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQ96xZFX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85a297d2d2so3589694a12.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043601; x=1781648401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txLeeHxUVUSX7wi9aUsbTgq6v6+yCgWQ3OKqqrJje5Y=;
        b=HQ96xZFXuwgIgNHZI9Pd3BHAFyOuylMyfo/4GuYjgQz8vcchM/AbfYKSrZigwHCHow
         d4ReEAaDuNxGxv/K7WkOhG51i2g8LViHkgQh7mseNhGBruwW57g0dedbzpXk/XBZJRva
         /ff9XucyzkniafX8zmmFLOGHK7FuVFEZ0wfizfYnAC1XSeJxxlo6bQMi11KD8iWMav2P
         RAGApVKDWRdUE7ZTBeB9iUFPzSCzLXjstTeXKwjwMKYUmwszq7BN+vo8dhmXxUpelWOF
         kbLssM9JVU9gMsGeg/jI38rcM6zM+FoxRJWrIH1r8TE8Gzl0H4aDpQVJwRqU2BF+sftb
         8FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043601; x=1781648401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txLeeHxUVUSX7wi9aUsbTgq6v6+yCgWQ3OKqqrJje5Y=;
        b=hD6JCs1xeTkEM1MMmPGk4AUpQRNErL+Z3K6Ts+QpuP9hJWj/883L1R4X7s3kec4P4b
         lwxuDLBOsYdlnHyZmi8wpXxNx55zgfkxMXZCUNAqSq0PpV4qUUOQzIjpXFPSJxyjQz8X
         2nNcUGbgLOPw3ax2kL2lfuVWyhtycw9P50XArELXCfzIndPY16GlENWwvTj3cMP/EzCO
         D/Wt1VAcAXSY+6Cw2oVWPsp3k9D/q28i+5fIolgNy1FRIdm24OOCE3sVaug1oao4ONpY
         enAiSTTixAvzkyPoh17oGkNhxKPq2SR4eB2iZw84sZJ3UbPnlmIycQEx9BLj7V7KXE7k
         SOXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uiBs3mZ6K3OCXkC4ZHwGtr30yTBSfERq1k6lJ8r617JkzC5bRCEudToCe8XisXom/OZav@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk+k/gpSuvwEGdWZ90C+9fNR2wDPR68bJcjgLWOF9hHnQ7qQKk
	EzPQyNibc8ZgENwjpwNe6Dk2m/ZNZADmTDzmn0WDBeMSiiMafPqimoXD
X-Gm-Gg: Acq92OFdQL0so0cVmj1IMieQxv7kA0EpnANfB/j7i8sjeC+dZ3XDfyEaGRNrYuMhjnP
	NRbmUrPe589TBx5d7bPVxHDDARfwyMT68sI9bhx5XuipbZHjF4rDBo3giasOSn5G+zGaWH5nuy3
	NvAl/QGhKPsj4JSWsw+m/dCWmMGWTBn4jGbBerT/Te1MJuDEEAD341yUrPqBBpSoe6mnqQh+doY
	grWCol7PYaLG+59YsT9N/ofoUswoA4yoigalzus3ifBrcJqpN7tK4KDfwvVJa3IlZPH4V/qFrcN
	Eb+3Pk0nC+qbV+k0oFD6iT2ra52HV1xp4l7FdmNEgORYnzM/up/Gwu04vlb1MzDeW/WwsZ8+yih
	2os9E39xelIhAIJ+V/tQB4yqAmFjdhxn6N8UTsb8wsO3Bp4voKojmjDHLgaVEkYCK/U3iK9gKAm
	KiiqbX90fu+P9ns94QErv2b0wRFDnDGYjVsiUiOlxuirUGAPALtNIOD8ZbDytX0bvn5AV3dpBOR
	ZVkPjMm3QZ2W3AVjawNlGQr8/s/1deN4BXQcqJWngIB4A==
X-Received: by 2002:a05:6a21:4c16:b0:3b4:8ad2:5ea8 with SMTP id adf61e73a8af0-3b4ccf81eebmr27631680637.30.1781043600819;
        Tue, 09 Jun 2026 15:20:00 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv3 08/15] dmaengine: fsldma: convert to platform_get_irq_optional()
Date: Tue,  9 Jun 2026 15:19:19 -0700
Message-ID: <20260609221926.35538-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609221926.35538-1-rosenp@gmail.com>
References: <20260609221926.35538-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-controller irq_of_parse_and_map() call with
platform_get_irq_optional(). The controller IRQ is optional -- when
absent (-ENXIO) the driver falls back to per-channel IRQs. Any other
error is treated as fatal. The corresponding irq_dispose_mapping()
calls in the probe error path and remove function are removed.

The per-channel IRQ mapping in fsl_dma_chan_probe() uses a child
device_node rather than the platform device's of_node, so it is not
converted here.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index c04a7fbd2ed0..eba194d64105 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1213,7 +1213,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 	spin_unlock_bh(&chan->desc_lock);
 
 	tasklet_kill(&chan->tasklet);
-	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
 	kfree(chan);
@@ -1248,7 +1247,14 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
-	fdev->irq = irq_of_parse_and_map(op->dev.of_node, 0);
+	fdev->irq = platform_get_irq_optional(op, 0);
+	if (fdev->irq < 0) {
+		if (fdev->irq != -ENXIO) {
+			err = fdev->irq;
+			goto out_iounmap;
+		}
+		fdev->irq = 0;
+	}
 
 	dma_cap_set(DMA_MEMCPY, fdev->common.cap_mask);
 	dma_cap_set(DMA_SLAVE, fdev->common.cap_mask);
@@ -1317,7 +1323,7 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
+out_iounmap:
 	iounmap(fdev->regs);
 out_free:
 	kfree(fdev);
@@ -1353,7 +1359,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (chans[i])
 			fsl_dma_chan_remove(chans[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
 
 	iounmap(fdev->regs);
 	kfree(fdev);
-- 
2.54.0

