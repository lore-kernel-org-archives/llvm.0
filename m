Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2323A33DEE9
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150008; cv=none; b=QNStfQqTFjAYpB9esUsAwY7WN9xmp7S2Lne97vTU9lj0ONYMn73EtVb2Or0xVo7J8Z95lZDFWwelIX9lkRYdS0WqQfSBtPZcLDIDNswEeE42cZItlXTpCwn+m5rbW0eQwvERWpDIMzAY0NRUDQx/IGktXz3zYhKjM+Hy61sGpEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150008; c=relaxed/simple;
	bh=jfLTQBXqXxvw70iEv1i6xCExnx46J4bUPF8pUSY2PwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jY3FNtRJ29SYECkMvj4rXm5innivl4qwkwJrAmAdRQuSrTNIb7e2W9yXQ6aP8yHZqha0/qhxBKQWyS8VN0WiHMRy3dpXjGrxeGBNuXxfNdhskVA4Z5qhl0UM1F/bXYkM5m+0l4yaR52V54n5AW0UjdOAhT0PIZ3cTPzxx2f1UZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZETp4Co+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZETp4Co+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso6582978a91.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781150001; x=1781754801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUIaRwpiq+bPDJ7oRrThyVs0svDhFW8QwchzUggrjyo=;
        b=ZETp4Co+6m/KQXV+oE/YicTCB6RappOC07cQ0E0iVyUSIfGjW1xDocz6raDi+zX46J
         kfuP8aGJT83xwax/GXAp2oMJF5Dvc2lFWCffkYxJ6m47lE98qI1OPpUrTXIpnJoOOXTn
         HWjw9u1SiWYS4x7zj/lKra/yhdJ6XivdglmjyjI3wXDNaSZ172Pa5XvvHUZn6X1Wo3VK
         UJPi4zqbycHyOSgmcAUEIV5Qn9iKDQimHN6zb+2/17f34TCuHMpn8sLMrsWBbuNOBDa3
         87fRhuMPL7GUSVQhNubMt69hMEfb4Lu0c7wYIUk+oD0RQ4Df+6yr35WOPS1Aa6oMxTqx
         S5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781150001; x=1781754801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fUIaRwpiq+bPDJ7oRrThyVs0svDhFW8QwchzUggrjyo=;
        b=gAtrHk/TsnD0HaN812dvW3XJYAKoRi1CQx6olrDzDhFmBRvbGKtu92PUTZbwkJWfjR
         xJkflCDBtiRIzczcckSB5ft/0LgdNxJm3UQ9cYj/6CkLsJR8kHbvtR0jp02/f6fxDzum
         SnGrZFKlqCVsEGYp4LlTToTyp+SNqM+oPA5QGLGR6q50TYMkIN1gZQkmZBs6aIoq3OjR
         1qbevUx7uc137zIhwVL9+ErWT0W2499oDpENz3daksllWSk6VnrJUT27DqTk3tlQhlxa
         +nINuf6ELReh1tMFWys4NM6B2xqY1JhNg5UVC/SxU5ZCQmNv1XLadRC9VGeVU3DBuuWP
         QeXA==
X-Forwarded-Encrypted: i=1; AFNElJ/59kAH60zf5Rk2iUtTc4wxsgR+RuU0ZdZKUT6A9Tm9t/3u7UfF5njcxu3ufHCbXDdzpLex@lists.linux.dev
X-Gm-Message-State: AOJu0YzdhQt8kyhr8U4biTKS13YDQomTBx61OdOoo8tZ0QdJwZ4p/G02
	hhYJQ3pScP90kpVb+tgmh6Y/x/sPgSoZyrCF9J0DAOQPeXURHy6Y0QtbP+9sjA==
X-Gm-Gg: Acq92OH4f55yjbYmyN1fYq18q/6uo4NvmaWIMZKqksmBV1z/BDZlLcEEhrsfPVLJZjb
	ivceAq51pSwgT24TD93n+W4Wa36Pqx4olYp54aR/y48SDIGR7N+qkQ/aZ2QjR/4iXS7ixwVLQRJ
	qjUdFfOvh0hH3FzTns3GTIYizrTCQ6osjNzr0NCiv7by8UHwAMap+2aEW4mkIvM+qJ2RX1tWT0T
	gdRgviUyHW09v32oUWKknFRJ4kvUR9E98TU8N+WlXe0G4WLGJKd8iaMAw2fIkdzNewYZFmFLSwp
	Jjm7tqofMsQUJuuBu3mDErGwyFWYmvErwzQd8XeoTD9N872xZtW+BI8jR9/zQMXL2zFW4FbRoux
	q4ZNvwH/65G197eSUdJgqBEMUBR89eBANLq5gkAW5FDb5iBiwm1SKaSuUXzJnh0+ToS8WLKYzLi
	9YfCWXE83cItZ0tOx/2KGfEnOfuPBQ65N8yeNlghgeX9fc+8tSr9vvgnE16RvBXzE1+TYm1HL5P
	FyEGedOhnizJ3hCjbIeeCen6NyO164bS/s9AN15hRf7iA==
X-Received: by 2002:a17:90b:48cd:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-377a73e273dmr1261621a91.15.1781150001523;
        Wed, 10 Jun 2026 20:53:21 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:20 -0700 (PDT)
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
Subject: [PATCHv4 12/15] dmaengine: fsldma: use devm_of_iomap() to simplify code
Date: Wed, 10 Jun 2026 20:52:42 -0700
Message-ID: <20260611035245.13439-13-rosenp@gmail.com>
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

Replace of_iomap() with devm_of_iomap() for per-channel register
mappings. This eliminates the iounmap calls in both the probe
error path and fsl_dma_chan_remove, and simplifies the error
handling by returning directly on failure.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 0df09789187d..dc70a6bf5723 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1119,18 +1119,13 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		return -ENOMEM;
 
 	/* ioremap registers for use */
-	chan->regs = of_iomap(node, 0);
-	if (!chan->regs) {
-		dev_err(fdev->dev, "unable to ioremap registers\n");
-		err = -ENOMEM;
-		goto out_free_chan;
-	}
+	chan->regs = devm_of_iomap(fdev->dev, node, 0, NULL);
+	if (IS_ERR(chan->regs))
+		return dev_err_probe(fdev->dev, PTR_ERR(chan->regs), "unable to ioremap registers\n");
 
 	err = of_address_to_resource(node, 0, &res);
-	if (err) {
-		dev_err(fdev->dev, "unable to find 'reg' property\n");
-		goto out_iounmap_regs;
-	}
+	if (err)
+		return dev_err_probe(fdev->dev, err, "unable to find 'reg' property\n");
 
 	chan->feature = feature;
 	if (!fdev->feature)
@@ -1146,11 +1141,8 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	chan->id = (res.start & 0xfff) < 0x300 ?
 		   ((res.start - 0x100) & 0xfff) >> 7 :
 		   ((res.start - 0x200) & 0xfff) >> 7;
-	if (chan->id >= FSL_DMA_MAX_CHANS_PER_DEVICE) {
-		dev_err(fdev->dev, "too many channels for device\n");
-		err = -EINVAL;
-		goto out_iounmap_regs;
-	}
+	if (chan->id >= FSL_DMA_MAX_CHANS_PER_DEVICE)
+		return dev_err_probe(fdev->dev, -EINVAL, "too many channels for device\n");
 
 	fdev->chan[chan->id] = chan;
 	tasklet_setup(&chan->tasklet, dma_do_tasklet);
@@ -1195,10 +1187,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		 chan->irq ? chan->irq : fdev->irq);
 
 	return 0;
-
-out_iounmap_regs:
-	iounmap(chan->regs);
-	return err;
 }
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
@@ -1209,7 +1197,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 
 	tasklet_kill(&chan->tasklet);
 	list_del(&chan->common.device_node);
-	iounmap(chan->regs);
 }
 
 static void fsldma_device_release(struct dma_device *dma_dev);
-- 
2.54.0

