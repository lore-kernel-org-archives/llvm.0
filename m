Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74E132C957
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150001; cv=none; b=n7+4FNesSbYWxGWmgXTF7sIf2N7Nq7mcLOtOWk/ncfKn18kx8vSdI8PIkXQUwFpRRCcpkG7/9r41uwNsFTQ4HYwZ/aL5j9ZbYDMpUOUT+b0WInJlX8S6mZJfFKU2K/vkfO0eWiFs/kRha4vt6yEG455OyWogtJgiAgkkYxWFAGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150001; c=relaxed/simple;
	bh=Gx3zpLu6WtzzCPNIoXGM3SzeP5Zd9wP8Spx+zDr1Wyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9DRmYXw5CIkdDq4XgzC+lFbHw8RcTEHRUg7UpIRUKcEzAqeaQ38QtBAMI3ZYrtRz0YC572j7MsToepMPXB0eHKQ30wpmK/KvV0wlYQUEo1T90gIHH0YkXJQAEeVMCdel+9wQOnaQ+dCDPZYzCJqVLzCr/ShEhTo7cCYwLamak4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpD297Ko; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpD297Ko"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso7406289a91.2
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149999; x=1781754799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh/mpsi9dKYVr7XXt/nowqZiSrF2hHl6kTiAGF+2p2s=;
        b=ZpD297Ko2Y22Xb/fL7zxKMvlEAPlhZbdpzhdzmwG6q3yeYBZ+rJHJLsVQJPBjallYE
         sV9UMSxGOiQihB4oUQkI6l2wGlvh0ra2PuKkCIiRZC+uEjjBMJ5xzQUfng6SzZth7uyt
         HhHsqWJ82EgszSPtCbwpdQBxZQkw5+p+DQoxNAP5vOiyBPh88V9ph75YXespeTQ7KzCP
         0sRIJx8yIgCPBuhEiZdXzv0ErA0ysAF535V4HXr6F11BsY+hSKW+o6WMok3iRyy8sTSJ
         9cMTaSHJmMOzn96gtd6rYp9jxs9ZLMcSfZAPyJxZGplbCyftN+l9ftMEDM3LEJ+6gs0B
         4b1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149999; x=1781754799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zh/mpsi9dKYVr7XXt/nowqZiSrF2hHl6kTiAGF+2p2s=;
        b=S55EtP4VlFg+oDyUxW6ORAvvJX/A4u9XB6FD6vbW2Ui5EdyMDmqZtluuozZ6uMZVSd
         k9T6Od7NsNXry1zuPWVOFVzKHvq+6m+Od0lbfwWBWXig5zVdcwYzuS1aIF1WiBZPyNsn
         R0FjPVFtM12TG/ttJsPc9F8ora37JSpK0Wa6sC5ECoNW/pKBN4Slvtux1NRAjk6CVqqd
         /hsGSoLFb/MRsx/foBZJSxv641ijcOPZY+1u3FBbbdj9zCAY0/YFGxyxB94pn/pqisrW
         TWCRpFEPQc94vFXV+ya0AUMW2xXOPNFA6F2HDZmZg6ryKcQ2klIPVHlT65iKj76Fb3zw
         rkCg==
X-Forwarded-Encrypted: i=1; AFNElJ9I5bx8PZzqZcM1/HNDfYbybvlMfm5wZTCRH7ayAdnsX1BvaQOfADJw8ZRPNVUvMupRFhog@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd4LOKjzv4JfOiCTrly19HvMEBI4EdI4mHlhnQZLxRksJ2foQE
	A1nl7qJuKEDXZIbeZMsGvHSA6Q4JoffnMfEIX1Yb0DcnBDnQSbaxdDhd
X-Gm-Gg: Acq92OGCYBvGRUfs03lPGhHczY2K2R39LrJdAkC4awMGcU0JkHJ4BV6qg9hJkwiqRCZ
	fwxf6g9unMzxDC6ctZJ5F7CZoko5PnItYhIoNiPMksWoXV9vQcAZkAFKK00EtywrAlSp4GvyMsv
	lT4TXOtXmXVh17GPkLtrPpJW6YpjjJunv9y1GWRmLnTXX49o48ROl9PGLX8E7m3xCbMnUCgbFdm
	lCDEP9LID35ThVgkTyAmnfj25b7N/yYwrrufTR1/OzyYdKsdkL+7REr/qsLuk1ogQCvpeu4yHjh
	Ot6erFl0LON8Xo6nuGRLS5q0jmMJ5EZ/pV3JhCaa0O+UEVCO+hb3jYwG0W8iwMRuMQZj2qmyQm3
	6O1+2QYcyGT12UZhall/A3ZnC4hZz94fuPG0A7QMI3keiWfYzoM9xGlzKURgJpQzSKQIYmrzY+f
	Z8Ut7jdU8HFMcyB9cR35tvpDYfzSCzkDW2kPvyhW/H57fL1nKhiVEjYKL5ofOKZPzhxWAjZ5GKL
	61SxPPyrNiGvoV2kcm02fXRrJliKULC/H89xEaBeCjUyA==
X-Received: by 2002:a17:90b:5204:b0:36d:f28b:72e2 with SMTP id 98e67ed59e1d1-3779f092a96mr1323967a91.8.1781149999281;
        Wed, 10 Jun 2026 20:53:19 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:18 -0700 (PDT)
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
Subject: [PATCHv4 11/15] dmaengine: fsldma: convert channel allocation to devm_kzalloc()
Date: Wed, 10 Jun 2026 20:52:41 -0700
Message-ID: <20260611035245.13439-12-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611035245.13439-1-rosenp@gmail.com>
References: <20260611035245.13439-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fsl_dma_chan_probe from kzalloc_obj() to devm_kzalloc(), tying
the channel lifetime to the parent DMA device. Remove kfree(chan) in both
the probe error path and the remove function.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index e4a3315a7d9d..0df09789187d 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1114,11 +1114,9 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	int err;
 
 	/* alloc channel */
-	chan = kzalloc_obj(*chan);
-	if (!chan) {
-		err = -ENOMEM;
-		goto out_return;
-	}
+	chan = devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
 
 	/* ioremap registers for use */
 	chan->regs = of_iomap(node, 0);
@@ -1200,9 +1198,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 out_iounmap_regs:
 	iounmap(chan->regs);
-out_free_chan:
-	kfree(chan);
-out_return:
 	return err;
 }
 
@@ -1215,7 +1210,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 	tasklet_kill(&chan->tasklet);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-	kfree(chan);
 }
 
 static void fsldma_device_release(struct dma_device *dma_dev);
-- 
2.54.0

