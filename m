Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086F13DA7EC
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696927; cv=none; b=gg6V0Xn4grjL2/7+v8WgayzKCh9CbXR3HESYUwBeMMwdLHKszsecWZMkbQJuuq/bO3QVT+zWB4oC/aOelJHrvTzaZWDlS5PPoeC6mD3EAQ2lZKqWcM3475PqCmgRWt+T0UntFWAxuKrLQ8s2tNPNumY+Qshft2rJgWDnu+UB4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696927; c=relaxed/simple;
	bh=D9O4y8MzWm3dICcvhBAR8c5YwW29hJVK/MboyWCLTFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNTorxe2SCMmuTsL2PDdtvlbsr+DSw4nS8oVoQThn17dKox8WgeSEQZJsNCM900QJw3db8+XCNY2gp+RumiANWyDb3OnxBXehi6jCzOysONGi2QLYPaac16AlIbG0N2zKsswwAEVbVWlQe/wK2sJMoUbfDvdaKLb4E8psi4OD8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Md8HegRn; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Md8HegRn"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84230ab8857so1095799b3a.1
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696925; x=1781301725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c+DTbgBfPPUhSPBSk+riIkjYOZTEz8XaKJeP18mVBg=;
        b=Md8HegRnPSNLZr5crTG1y5FBVO85ExvFPWjo6XMqGnV2hscMbcLMX3NjaotKwksisy
         XE6Zmz9izcWB7bYJT9MpJ7NIByqYvHI5PRlClIbO8CO4HfVzBKwrro074okLlWa+FqwM
         pxE+EbBH/CaNhKnLm6/1gEimjumJVYzQHjimq6Ib4upiEkpL0UaVZQB8qR7xR1AHWSpZ
         pZCHhugPjrYnKUQV0fTl4+6pkobqKFL5UCl9Rt8oCZbRRyS1rcqjKWhEIsJeK5bSWWVx
         bbDdllOGRWhXIuWTAHJTZNL2LhIZcxX7yT1kH160fEW2phQxkSv1k9yqp9km7NRjDflJ
         8OJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696925; x=1781301725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0c+DTbgBfPPUhSPBSk+riIkjYOZTEz8XaKJeP18mVBg=;
        b=Qgqhlz6iJVQam+w5NBbb323/XeXIMZ8SzvJIExCdbvO2nt6r3F4t4xWwbxSNy54Snc
         3sBPtraU/xq1BIRquzGzVUTiC7syJlikUSIdDbDimK7Evjek5F0JjEIq1sDIEa1MnXSK
         XNDldbWsk4sYUwFB8P2zaNgKb+iRYxlwY0y7UYLamm5fmbmVm1XlimBRbrIAkvz4TAJM
         2Bz2Q1zn14l/E2u6/16IigRhNr1v6hJrQwZ0NuteoGN7XDcV/sxHZkMlI0k50DBUhgFx
         5MryZqym7RRZ8o+dTObMGuO5nKAU2nSy+iDJZ9mOl3yk+rACU/kPxGJ8dis/hTXzDnX8
         E+Sw==
X-Forwarded-Encrypted: i=1; AFNElJ91QrCbBpKf+uqINBuUnT329QkaF6kKBaSMUZtHP4raGRQcLktwHiHAb4wA9+34L3kZepBE@lists.linux.dev
X-Gm-Message-State: AOJu0YzASXHT40xVaVhH5GX368UOirM/aN2ZtixGIIht9IgFKmiVVJlw
	6R01hYFuIqZ/q7MUU8Je7ooIVZmjGxd53XPn9fcO0In7OpmF/h6ilnQ0
X-Gm-Gg: Acq92OGZuo/aY13gP97ecepFiRXpt2HrjANYh7cO/z4OAKT46uU9IdBbytSa/1aPfJY
	i8J2/uf6PwEXqU5IhGuBA/avyGGC+fQCnoibp9EBx8aacbyHQpFuxBFQxFq8WsBtkS7UZxmCzRz
	t9Y/1qd+VNidPCXYizYz3fTRH80o933cX/P+bn2UoSq/zIYvq5Tbp5mlQwIE8blAZ+RIWk47mRO
	h738jlIR7bRNKp0c/rMgppW3bo3Wve8Kx2TQ9WcndfdOsajoVlz+j/qh0TQ30zBfhxNmpb2Nodw
	OYj+dVu3xWevmT+e2UcVbWrDLQMns8K4LdxnQyGV4GawqoJjgGj6UCF1VO/133OgNJb6OPOPNR/
	VzAnS6wWSDirm0yiJwo+schtSnz4KP26OnIilxEfJ9po7PK/O6CgWNU4/BYuaYGWvjCkFSk0Y+P
	MsgAHazvc6vrYoNhandG7NudBedLMzoRwLrMqBidNsNjY/WZ2QPZWvj2Ukx+tw6BHfGAkyJfv7r
	9XU8620HaKkMHs08UkIjmsn1WDAus7ns8GilfH6+EPM8g==
X-Received: by 2002:a05:6a00:66c1:b0:842:6004:3fb9 with SMTP id d2e1a72fcca58-842b0f52ecemr4959351b3a.25.1780696925057;
        Fri, 05 Jun 2026 15:02:05 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:02:04 -0700 (PDT)
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
Subject: [PATCH 07/10] dmaengine: fsldma: convert channel ioremap to devm_of_iomap
Date: Fri,  5 Jun 2026 15:01:31 -0700
Message-ID: <20260605220134.43295-8-rosenp@gmail.com>
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

Replace of_iomap with devm_of_iomap for per-channel register
mappings. This eliminates the iounmap calls in both the probe
error path and fsl_dma_chan_remove, and simplifies the error
handling by returning directly on failure.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index ee6e595c2972..0d73ce3dbfe6 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1108,7 +1108,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 {
 	struct fsldma_chan *chan;
 	struct resource res;
-	int err;
 
 	/* alloc channel */
 	chan = devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
@@ -1116,17 +1115,16 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		return -ENOMEM;
 
 	/* ioremap registers for use */
-	chan->regs = of_iomap(node, 0);
-	if (!chan->regs) {
+	chan->regs = devm_of_iomap(fdev->dev, node, 0, NULL);
+	if (IS_ERR(chan->regs)) {
 		dev_err(fdev->dev, "unable to ioremap registers\n");
-		err = -ENOMEM;
-		goto out_free_chan;
+		return PTR_ERR(chan->regs);
 	}
 
-	err = of_address_to_resource(node, 0, &res);
+	int err = of_address_to_resource(node, 0, &res);
 	if (err) {
 		dev_err(fdev->dev, "unable to find 'reg' property\n");
-		goto out_iounmap_regs;
+		return err;
 	}
 
 	chan->feature = feature;
@@ -1145,8 +1143,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		   ((res.start - 0x200) & 0xfff) >> 7;
 	if (chan->id >= FSL_DMA_MAX_CHANS_PER_DEVICE) {
 		dev_err(fdev->dev, "too many channels for device\n");
-		err = -EINVAL;
-		goto out_iounmap_regs;
+		return -EINVAL;
 	}
 
 	fdev->chan[chan->id] = chan;
@@ -1192,17 +1189,12 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		 chan->irq ? chan->irq : fdev->irq);
 
 	return 0;
-
-out_iounmap_regs:
-	iounmap(chan->regs);
-	return err;
 }
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
 	tasklet_kill(&chan->tasklet);
 	list_del(&chan->common.device_node);
-	iounmap(chan->regs);
 }
 
 static int fsldma_of_probe(struct platform_device *op)
-- 
2.54.0

