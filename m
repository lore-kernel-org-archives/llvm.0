Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090A03DD507
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696930; cv=none; b=sOGS103KOoY78IOvWaIM7L+pBhRU46Cc38A0nn6t90oR6PM7toHX3FdnzcBnwmGrDZZ6D8qYoUEBdRoe8rPNZ0DdrjYNjWtg8x6rpGTZfiK+rJE1Bi1KAkAHO1R25ebvZqdiVTDQZrUK2kNUDQJKOgeUp+yarhF1H294WYJUKhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696930; c=relaxed/simple;
	bh=ZIbZrZAamM8DHdzetSAyNZ32dsZlWnuLa36YcV5UTMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeM2r7LpqbUGmTsY3oojX+6X40SOVoQpx/E0In7eOz4dPd1kkM64+/ptry/EoH2fAS+fVQIEYLAcdAwWMA7PjUHsZ0eWiqvLpf5Z6SWtA+hFh0EQt8JjxM4kA+6/0KC8wN3QnaLhJeOI4nl2lgX8LNyE69E6cqz2fYx11oSqSLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z49Kc1W0; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z49Kc1W0"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8422871b42dso1479399b3a.3
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696928; x=1781301728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsujHfWeeEl/d7h28VlfSKrBHdpgYMwwQ54lzvrhDbE=;
        b=Z49Kc1W0w8YXcvAkk1evhst6cYw/RDrrUcH9NjewvVkWd+mot7H7xw0aXr2kxtuktO
         rSI8Qywqlg8E1RBNjQ2/jA4tKwbjGf38SxqrzO9i3XM8wHaoAzNeO6HLQmmjr4luJ+NI
         bdZ5H8TkobcfD3d3AxoxPDryoKFhsbfm+452Bhc+JnAThnqCxT9Jp0tB6HtS9TT/zwqs
         67wS+fLp6nHxGtyEzOIokA9fLDIVE/4QbUkBJYGaGkkhxjFInLfkeyZ2Rugxw4oeFKE2
         YzSmeizDqsY/OVB9ODefJFGkQBUjqVjgvuIQf6oCyw0NzGw3jhfZXrXlaZGNCNqSpSUB
         JARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696928; x=1781301728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XsujHfWeeEl/d7h28VlfSKrBHdpgYMwwQ54lzvrhDbE=;
        b=Q4kRJPU9vEsuKuxccXSvwnUFNV4PmB+ac/XT5XJrh2GKVth86hlh1MS5QECy0Zcnm0
         9cfjHGk28CKvYrw9EMJUpaTQW/QzTR+TejaFDOPuYBdJ06UK4oVJrYfvN7RnwAL8KupD
         ymDZ1E6O7piBtZANKGEd6Ru45NnrIO91PLFkNNAczRSFkcs4Ge4nz/YO44NiSSEhFDMm
         wTKJgdxlOuhFu2wb4NiHMMJDTKvJeKF1WqxUYoxdfnOzAiC94e/2TzxumOXN9qrxXlf8
         V+oaxjiqjpj1q6PYuBOtUiMR6gX1SEZquMywvCdW8nZRfCd+UHumL1K5+7ERjEuzWfdI
         n1+w==
X-Forwarded-Encrypted: i=1; AFNElJ/w0sqTQYFub14NlucwbYVMZREwjAR4s5/vOWzQ61/4rgIQaxC1hcN/5EXlYTg7bQtlvSbG@lists.linux.dev
X-Gm-Message-State: AOJu0YxiTDgIkSW8B+WlZXt5hk9fRRbCOBo0oGXr9+7Bt0/A3SH3Tj1g
	egwI9X4YVfbWO6tEKCk6zPAI9+7XaBmpTE7D3P81Ww3AtgTYxF1TZAkI
X-Gm-Gg: Acq92OErHWZc40njGeg86YOQ9gUskFYGKk+yL5U7cWDLveKYeBuZ0Khjop3xI/S81xI
	GtxHggzjcS7cYsBbrE3NGuTBFfz1Mxh6ZBhz7t+QHLJC0TMVkpI2zBDyjRDteDhvxzj0nBm2Qyr
	gZh1Wk//7bs31VtlzoukT62Mfnxm/hFBEgozz4IGF8qt+tymT5ciIdAy4PEQS1KkUd9qngzxFlf
	Uot5z7CVuALzo9ptag2dzT3EUigCkkvsN8HW4yznIlW87uYRVRYz6rF/MA486G8wgY+iedjzGWc
	7IMUYHwCm2U74eEa3rpcN0x5dpZuWVQJcO/Pv6omNebxxKn9pb0E8BIEcHL359/hHvk6DVAcaSI
	+UW7l7W9l3/ovQ6L/+DVQXaPVjfwl9nbYefmYOalcs8fEuZDHo4bRtW1gcP7/pRLKmWRT0rO7vE
	Braagm9KSzE0uNLWH+G/h8U5vGA6EzIfMEx+8BYwT0r85S4lkd/sKWW/jbXGtN5EoSv5Co1HmP8
	sszfQCn8WoO5oSsYZx9Wm3YUQsiIIWKkTohtkf3IR5x+g==
X-Received: by 2002:a05:6a00:a13:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-842b0e3da19mr5756498b3a.32.1780696928113;
        Fri, 05 Jun 2026 15:02:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:02:07 -0700 (PDT)
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
Subject: [PATCH 09/10] dmaengine: fsldma: convert to devm_request_irq
Date: Fri,  5 Jun 2026 15:01:33 -0700
Message-ID: <20260605220134.43295-10-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605220134.43295-1-rosenp@gmail.com>
References: <20260605220134.43295-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace request_irq/free_irq with devm_request_irq, tying IRQ
lifetimes to the parent DMA device. This removes fsldma_free_irqs()
entirely, eliminates the out_unwind error unwind label, and drops
the explicit free_irq call from fsldma_of_remove.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 50 ++++++--------------------------------------
 1 file changed, 6 insertions(+), 44 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 79a268139b9f..01c9cd27e795 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1027,26 +1027,6 @@ static irqreturn_t fsldma_ctrl_irq(int irq, void *data)
 	return IRQ_RETVAL(handled);
 }
 
-static void fsldma_free_irqs(struct fsldma_device *fdev)
-{
-	struct fsldma_chan *chan;
-	int i;
-
-	if (fdev->irq) {
-		dev_dbg(fdev->dev, "free per-controller IRQ\n");
-		free_irq(fdev->irq, fdev);
-		return;
-	}
-
-	for (i = 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
-		chan = fdev->chan[i];
-		if (chan && chan->irq) {
-			chan_dbg(chan, "free per-channel IRQ\n");
-			free_irq(chan->irq, chan);
-		}
-	}
-}
-
 static int fsldma_request_irqs(struct fsldma_device *fdev)
 {
 	struct fsldma_chan *chan;
@@ -1056,9 +1036,8 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
 	/* if we have a per-controller IRQ, use that */
 	if (fdev->irq) {
 		dev_dbg(fdev->dev, "request per-controller IRQ\n");
-		ret = request_irq(fdev->irq, fsldma_ctrl_irq, IRQF_SHARED,
-				  "fsldma-controller", fdev);
-		return ret;
+		return devm_request_irq(fdev->dev, fdev->irq, fsldma_ctrl_irq,
+				       IRQF_SHARED, "fsldma-controller", fdev);
 	}
 
 	/* no per-controller IRQ, use the per-channel IRQs */
@@ -1069,34 +1048,19 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
 
 		if (chan->irq <= 0) {
 			chan_err(chan, "interrupts property missing in device tree\n");
-			ret = -ENODEV;
-			goto out_unwind;
+			return -ENODEV;
 		}
 
 		chan_dbg(chan, "request per-channel IRQ\n");
-		ret = request_irq(chan->irq, fsldma_chan_irq, IRQF_SHARED,
-				  "fsldma-chan", chan);
+		ret = devm_request_irq(fdev->dev, chan->irq, fsldma_chan_irq,
+				       IRQF_SHARED, "fsldma-chan", chan);
 		if (ret) {
 			chan_err(chan, "unable to request per-channel IRQ\n");
-			goto out_unwind;
+			return ret;
 		}
 	}
 
 	return 0;
-
-out_unwind:
-	for (/* none */; i >= 0; i--) {
-		chan = fdev->chan[i];
-		if (!chan)
-			continue;
-
-		if (chan->irq <= 0)
-			continue;
-
-		free_irq(chan->irq, chan);
-	}
-
-	return ret;
 }
 
 /*----------------------------------------------------------------------------*/
@@ -1304,8 +1268,6 @@ static void fsldma_of_remove(struct platform_device *op)
 	fdev = platform_get_drvdata(op);
 	dma_async_device_unregister(&fdev->common);
 
-	fsldma_free_irqs(fdev);
-
 	for (i = 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
-- 
2.54.0

