Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872694071FE
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043597; cv=none; b=QCwSHmwWOtZtU84TBo+G5R9PMXA/GRu4NMuVb2IhRdYsOyGv5gVCV/rso7jCMJK7D4nErxrSW3HQj98W0n/9ffPOa7Xq3h5RBezdWeEz1RLF83pJy+/6lcO2Dhuz79aSWC2DWowanJveb9DAFjeepxY0Bh4E0EnXdntR+UI0aSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043597; c=relaxed/simple;
	bh=xvy4bkq3P2rtPuts3OtlogJt4Cz0NMbc+ohhmCAWkn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tG4GAsHfq+8db+47h2ohdzX0q4JCm4hWHVdFN2+pgiLot/Zo+f4xDO0U0gzNyf09cbX2PmNgyVUf00gX0nCVUHwXhfbNbQ8oWh8DIMTM5pvp7DCYBk0/6SBiH/2MXg2xNUKKjjiMBlVkb1w1X0htyEEyLJy/Ck+B4sj9vMaECbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/G+2rFZ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/G+2rFZ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c8585ecdd71so2180473a12.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043595; x=1781648395; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6ipJNaJivS6R5/q/SqMYFm/sZfUc0Uv8GQU8fX6jMU=;
        b=S/G+2rFZ+kgsFW7X+2n/OcBufXveQdHHqWV3JjSzwGB75mPlm3d1DCeubbXQsjTrxj
         +tnSW6XgnLHMBU6yIh5hgxZLy7SnUU2km+idrqgSQ1aiKBNehLfv5a4sRcfJzcPL0KKW
         4Xrbk6Apuo4jdMuyxZKg+9JkxUdthLMeSVEroskm8IRs5TvG23TWV49Tg24w4WqlUwzt
         7du7wa6rr2KAnyqPb68v1fQRmu6d6Bw7A3EEhmb+Wx48PF4l0ChZwz6a/d+8+dZz556O
         zKXAKrtqZf0KGruA7JQ6hVZBEIU1y9qg+dpl/AvmrwYnK+mikkJ/EgjLjRHPazJePshD
         qD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043595; x=1781648395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y6ipJNaJivS6R5/q/SqMYFm/sZfUc0Uv8GQU8fX6jMU=;
        b=DRGNyg7zV+XmeQmIOI+6naEk6wCyjDu5BxqdmvrXSqvbCEJxGm287ehR++LCOU7fFy
         XleFnCd6AFzJPCWTnxo4mpO2PTKrchDwMdkxyvL9gmqD3aD/lMiW4nQ8fmDTWEvHriju
         1b6IdljxvRFtkiSz4b6epQIzZSuL+kTa1eYMM94z7S0iRLrz2pff3OPQaL0L6KF1UcEY
         zz4HQiYBKhFXT0l6Ve2Z6D3L4U1g1tEtc7UX1u9i57LVBr+XiE1VHtMbwlxpCLJ5faqj
         5hjkNMmxBBxbImtL1YzcV9IvawbH7BIvcWkQRJXOZIAPda2QCAcrjwx6bSG2AYyG0El8
         XsgA==
X-Forwarded-Encrypted: i=1; AFNElJ/VvmzX4e55w71SMFd9xCt4bfXJOD2foq9GycProKRapKlT2sGPVSZzAv7W/SHB0UlpMEmE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2Aj0vagATNT3KMhku0Xp5XOqXVrPkH3clEpr5ippJJ5/sSIg3
	U0jFNiqmXn8MIL5rQHs1mKngAThKX+iRXFMKUJ8rBRrbCI1GVhWkpQQzZX4goyZP
X-Gm-Gg: Acq92OFltRCJyoVJ+KWSKEN0KQn+jzogVJZZAGPPwOFl5iHGp6Bw8MEHPj05sZYjXBs
	HgWx52vDKuAy5Hzx6KA2d7x/SIgSoHfV3BmgpF2u5ODu3oD/1XL15SOFI2XbkoHNEVYvZD7Opva
	LS4WxflQqz51GKjjzUzEYZPoLqNbKP8bd5i3iDIA7Vdn9miZxVUDDneI9S3SeKPR+hT2tits4rx
	v5AEUEcJZa691r2NNZnmOIRszAMz4mP9DM337Zwmys+Ko5PJVQvKYU/OeYVi3+F/TPpMvYPqdvf
	H48jilFllKf8YHdyUJgJYQFudZRxhE3AxeQgmX+2EI8ZjW4L9BipSd3bFa6urLd/EitrFZVWvj0
	vS7dQ5SfsgysyfbXfi9xOryOUR6Oh6lM6Y8rnjc/fLsDmvXwQl1jK3kvA+z4Tq3GrggM//4lQhJ
	owQbhFxWhWAqSRY6jV4UgrZJnmEUYIbJELwyKAwCF69DwoXYTW39uW5F6XbI2apf5VvIhbqX2nA
	+gas4Un2SyMxAAUma+S/PSlMa0JQbzk4YQ9PVjY6yD8yw==
X-Received: by 2002:a05:6a20:d043:b0:3b4:84c5:45d0 with SMTP id adf61e73a8af0-3b4ccf35b24mr25054339637.27.1781043594737;
        Tue, 09 Jun 2026 15:19:54 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:19:54 -0700 (PDT)
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
Subject: [PATCHv3 04/15] dmaengine: fsldma: provide device_release callback
Date: Tue,  9 Jun 2026 15:19:15 -0700
Message-ID: <20260609221926.35538-5-rosenp@gmail.com>
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

The DMA core requires drivers to set dma_device.device_release so that
the container structure is only freed after all references to it have
been dropped (see the comment above dma_async_device_register()).

This driver violated that contract: fdev was devm_kzalloc()'d with no
device_release callback.  If a client still held a channel reference
when the driver was unbound, dma_device_release() would eventually
run on freed memory, causing a use-after-free.

Fix by allocating fdev with kzalloc_obj(), adding
fsldma_device_release() to free it, and setting device_release.
fsldma_of_remove() now saves channel pointers and frees IRQs before
calling dma_async_device_unregister(), since fdev may be freed by
the release callback inside that call.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 1ba10d065278..43d817f6ded1 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1219,6 +1219,8 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 	kfree(chan);
 }
 
+static void fsldma_device_release(struct dma_device *dma_dev);
+
 static int fsldma_of_probe(struct platform_device *op)
 {
 	struct fsldma_device *fdev;
@@ -1257,6 +1259,7 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->common.device_issue_pending = fsl_dma_memcpy_issue_pending;
 	fdev->common.device_config = fsl_dma_device_config;
 	fdev->common.device_terminate_all = fsl_dma_device_terminate_all;
+	fdev->common.device_release = fsldma_device_release;
 	fdev->common.dev = &op->dev;
 
 	fdev->common.src_addr_widths = FSL_DMA_BUSWIDTHS;
@@ -1316,19 +1319,33 @@ static int fsldma_of_probe(struct platform_device *op)
 	return err;
 }
 
+static void fsldma_device_release(struct dma_device *dma_dev)
+{
+	struct fsldma_device *fdev = container_of(dma_dev, struct fsldma_device,
+						  common);
+	kfree(fdev);
+}
+
 static void fsldma_of_remove(struct platform_device *op)
 {
-	struct fsldma_device *fdev;
+	struct fsldma_device *fdev = platform_get_drvdata(op);
+	struct fsldma_chan *chans[FSL_DMA_MAX_CHANS_PER_DEVICE];
 	unsigned int i;
 
-	fdev = platform_get_drvdata(op);
-	dma_async_device_unregister(&fdev->common);
+	for (i = 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++)
+		chans[i] = fdev->chan[i];
 
 	fsldma_free_irqs(fdev);
 
+	/*
+	 * fdev may be freed by fsldma_device_release inside this call;
+	 * use saved copies of the channel pointers afterwards.
+	 */
+	dma_async_device_unregister(&fdev->common);
+
 	for (i = 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
-		if (fdev->chan[i])
-			fsl_dma_chan_remove(fdev->chan[i]);
+		if (chans[i])
+			fsl_dma_chan_remove(chans[i]);
 	}
 	irq_dispose_mapping(fdev->irq);
 
-- 
2.54.0

