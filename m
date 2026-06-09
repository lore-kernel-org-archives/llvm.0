Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066414C957F
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043611; cv=none; b=lYLXiHOO3pLRzIYNbZPuWk/hXh5t+IOsj8Hz3krLxB6SKSDkSO8ywnYBnD23qNvZCqM5eMBES2mMMn5IqzXt23cepPj9AOtVkAWdI8LGrP3sdNIAbVSa6hlAdlwdPcaxIfJDSIkmzsu4Mhl4S/RC4Qk6Ao+3EsSMYW1229lyT7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043611; c=relaxed/simple;
	bh=9qwdRZtx3KBcbhi/AHfGrB5L04xheEFVgi0S7d9rfpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plbQAcg2QD2SlMbt8YtCy6ajZaUlgrgGZfrwoAGh/PEZII+c7//kqttXLJx2HgO9t1esdnWGa66CZMUk90tqpJrZhRCygZtxd/XP3VCMFBQeyJNzd2brFY3k3eMSVC3LdKE48OSRY0O84JRnHfOZ6wRVssLalqvlh3WtKLYhnMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+eeKURM; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+eeKURM"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85b2139015so2083294a12.2
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043609; x=1781648409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6APiQiw2BT/NGR5IuAfPSsypVG22xWgyAJZHy+kmaO0=;
        b=U+eeKURM61mFVvBasrzClDB3fWSrXzedi4xTfk0Bv9psr/a91vkoOpgbfeci4O2OTB
         NmxMVYQxUUm4RByRdHk3E0DyFIBlMNoD0aHe2H+EPiHDsN8sHdfdl+LLd9gHdVLqj35T
         0xr0Z2BV82UvQivA5VJbWnhKgIPw9H3CeKxKuSMBZQLnsjahnVXTjPjNEDIBoTZ/4Z9s
         oqS3ZKtuVCNni1eF1Y0R+YhGvLVfwlw5tPds+j0CqmhlaeibxQdVhFp7dEsZqd/UMqzH
         PVFAD2z2gzt0GI+9+R7P6x1Ulrq9VFvkUYNbpY4+vZFB6oHNG8CPjO7jb7GZBIjytSFx
         21aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043609; x=1781648409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6APiQiw2BT/NGR5IuAfPSsypVG22xWgyAJZHy+kmaO0=;
        b=ctIltzLv2uLgP3RrFwnDjbO745StFgihZL1gjdJwLED9YreGiylbD5j8zPITkLhlwH
         dsovTYeg6c9Gei3DIsbOvkiuE5TMxdKxrTTXWJNi2ZdDNFu2pulWviOstQOQ/WgaM0JK
         kXUk2ydvGitPuohq7Y3cfHIbHjpKn5fP+R7g9gI6hQgUnDxj4zBIl2z8/Vh9EcVsE6hK
         d7Co/jBQlcaxYM3sO/qLiaGWjOVSkZCTKe1DO6kR6DxiHpPZC+1XQTfE9B+nr0PTuwCv
         l/ieF5peGZy2Z6i5FC0gKyQofGs3YDVXEw+wlIKxTtsYbjT0CJ+9/gqqUny7aaCdTk6U
         ACoA==
X-Forwarded-Encrypted: i=1; AFNElJ/atsp3Zpis49j4Xv8dp0/Tk0kmddXEF0G3HqJF72E14xbrsSei1pqaoQML5NBFm51QhJm2@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9OEk2vYvGPG3GfXoniqCdRrudkyW3V+3yGg/yuyDyIec+BFV7
	M41KVpZzR0z5H5pmqVl20Pz4PSQ6eZsOcKOm0OQ2IcKbAEnjZbKaslfA
X-Gm-Gg: Acq92OGYugZrw8B0dVupVc4twmKUuDjHEgwogXHrIvhErmuiNH6nEohRgeH5ZWO7UID
	gxNPdiBdnB6R1Bp9BK22D5KFaE66mwLEk9wR3ebdlNz4vVmpKAtrHCxMSY7N3LR24yUpcQen7c5
	cV31hO+RipDhc23zHssCSt7iuk1sG1QF1DArq9Xi2H/BOc0ZmpSEkbi4issACU0dQik1Z+ha9qT
	KRAJjAAzm+opIbCM903xtTewNPnbGd/K4wm7iovXKxyzuHb8G27fkmWEi2zWrl+onD3pdu3JIv2
	ARgQ9nfGzR89D5lu+aqocY8ahwqkx/Q5jkXrROAHVOZvykmgYcuLiIlB89rpmaUIxcXJD1OId6Q
	gQZ2pYGJnoQOATQqw0S0Hg2X3cnBbTS+mPct3jEl+iGUb0T5xP9PghmN8NgAbOI6SPNAKnRZv8G
	zKTTmnucvZUzs7A/vFIxTb7EcWF1WonD829aJEvXmAB9aUSQz2We2O+tBcFhFUngosoaCIEPOlA
	3Xf3fTzbUDxIXOo7tFiem0ssMcY1gKlUk1WLZ50REvR/A==
X-Received: by 2002:a05:6a20:9f8c:b0:398:6ea8:21d2 with SMTP id adf61e73a8af0-3b53bccd5c1mr6114388637.19.1781043609267;
        Tue, 09 Jun 2026 15:20:09 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:07 -0700 (PDT)
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
Subject: [PATCHv3 12/15] dmaengine: fsldma: use devm for of_iomap()
Date: Tue,  9 Jun 2026 15:19:23 -0700
Message-ID: <20260609221926.35538-13-rosenp@gmail.com>
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

Replace of_iomap() with devm_of_iomap() for per-channel register
mappings. This eliminates the iounmap calls in both the probe
error path and fsl_dma_chan_remove, and simplifies the error
handling by returning directly on failure.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 0df09789187d..a3792864f02a 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1111,7 +1111,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 {
 	struct fsldma_chan *chan;
 	struct resource res;
-	int err;
 
 	/* alloc channel */
 	chan = devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
@@ -1119,17 +1118,14 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
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
 
-	err = of_address_to_resource(node, 0, &res);
+	int err = of_address_to_resource(node, 0, &res);
 	if (err) {
 		dev_err(fdev->dev, "unable to find 'reg' property\n");
-		goto out_iounmap_regs;
+		return err;
 	}
 
 	chan->feature = feature;
@@ -1148,8 +1144,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		   ((res.start - 0x200) & 0xfff) >> 7;
 	if (chan->id >= FSL_DMA_MAX_CHANS_PER_DEVICE) {
 		dev_err(fdev->dev, "too many channels for device\n");
-		err = -EINVAL;
-		goto out_iounmap_regs;
+		return -EINVAL;
 	}
 
 	fdev->chan[chan->id] = chan;
@@ -1195,10 +1190,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		 chan->irq ? chan->irq : fdev->irq);
 
 	return 0;
-
-out_iounmap_regs:
-	iounmap(chan->regs);
-	return err;
 }
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
@@ -1209,7 +1200,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 
 	tasklet_kill(&chan->tasklet);
 	list_del(&chan->common.device_node);
-	iounmap(chan->regs);
 }
 
 static void fsldma_device_release(struct dma_device *dma_dev);
-- 
2.54.0

