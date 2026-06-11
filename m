Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A44331A63
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149991; cv=none; b=MYnFtUyaCQATe/DF81ru0lV2LfEtX0rtMHPPxIqx0X0B97ZV7GV0JY679lhrwt2Rjn/XUK+c6d/piOntY4fO+19h5go601J+cAgwYuGlSkku5Y4xil1riHs9vQDzGjMVy2IQTXRT1MCRISDgDwsQu0R7aOFVgev+R92M0p0Q3UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149991; c=relaxed/simple;
	bh=xvy4bkq3P2rtPuts3OtlogJt4Cz0NMbc+ohhmCAWkn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DU33XKAk3nmKfrbCAXxySKfQZGZDOockt9mz/W0CwM6f5j27l3tjYBllToWvFUXO60wh0dQgsIHL1SiADqpQm7X60+8V0KWoywe+HUORePyvtUmT9r8EmLgShT97Sxcvp4ehpBNZ6c0P940LxHLo36gaWaLaa5zsNBLNLDquKRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnZU5z+l; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnZU5z+l"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so4893167a91.0
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149990; x=1781754790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6ipJNaJivS6R5/q/SqMYFm/sZfUc0Uv8GQU8fX6jMU=;
        b=GnZU5z+lH0Pw8q+2vj3A4rW2eOsBKVktSlKwicPrW0VtozcJYoQIx+WkOiVoaVK8dB
         YDLv9BR0SegL0dxUGXm7XqjLhnUsBT3Dx/8VRDWRKsFr5qpEAhGIFOSY3tmBFjdGImVv
         hfI0BOr2lgYcgHYfIsce6J+FXnYSqxIXUNn/Hugvjwk8eRVr5msoTcTG1ArTRjX+7PHh
         QW19g8fEwg4sPAqpk6QWjPrcYGUVx3vLNX0IKsyeJdGSnlBWxWkoO8nZOj1ENod5t2Ju
         ACKVRs6fNzOLdbmGxB3KKsnuwJkeNaNMCRnIqTCKWRXbaEeRw4Y3dUDcLTQYf7cvBLlj
         z5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149990; x=1781754790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y6ipJNaJivS6R5/q/SqMYFm/sZfUc0Uv8GQU8fX6jMU=;
        b=jZ3QCluCYYAjAEltrXh0Mp9eu1sOpxxF5r9Dr7Hpskq3H9e4+YM/lRyTtZX9o0a+gt
         ZiAMBFbwlgigEEF7+9vK8Z2e8g8ZMdX8FkbWGdto4Rj0RYuhBeBbdApdDhAkxMCUZdiE
         eMPPyvpnyP2/kHKB2DNqksxn4nVcJZeAclf98O+0V5UIFTslZQYjziNbUaS0UT2eDItY
         kk6mUOBGtuQzDiTG/iFDkrausNCdrdP+Xa3K+Thd9t+wSDriKLjOPOPHC9QYN+VjDLeR
         JcT9c46ZsmOxCtguEk6K0o1N2dUZYTp5wd2/i4gTwMo5Ft2Rbjv7Z9+wvF7F6Kl1Fx+z
         uU2g==
X-Forwarded-Encrypted: i=1; AFNElJ/uJK14poPGtXV//gAEEvFtWQ8z+ScN5CTrVjtQyT/kbNg4rEmbdx61cUFRRWnfxr0vZfHP@lists.linux.dev
X-Gm-Message-State: AOJu0YxuClWC2xXeelpnoyyNpwOZhCqIN7wq6C76ng+N2f4DRegCvuuS
	rkmPEuqr5At8eWDqI1+LJTCkdQGCArH35qLd8cu1UFtSbZO/938bmktx
X-Gm-Gg: Acq92OF6AD4jVixsoIRx4kF0zABk45bjLptm4Jr7z0O+TYYF880HuqyeeFLoHkoifah
	Mi606P/wBLeTp6vnpnsqqCqEnr5Va9IDSgUrhJuUUlneQH7+NkNvZZnTr9augWFts/xl4MNBZlQ
	5ofFMdzdFS4+j073bQDu7B1zJ7jSz/wBuEwSyENzAb17+Zgv4xYuG48PJyfA1nkh7+rXXIE4jga
	74tM8h3KMk9hccRgTI76FkfLFBYTD+5cpBqdEh/assJJu2jNLB/0KqcwtqKf55xzldio5IJoVIt
	pvoAj2HqGCR9Lkad+0qVwEIK4zvyj1IoZ+/3rW0Suynie6qyEoeyECnyr37OCUGn+iWrzCVpd+Z
	4tdxSVXsQYxc/BMa2r7tiT9hgUAjRBWQrgsOZ2PVILWTQR2vAiVa2Wmvu81YCamCLejVjyYvoVq
	JK95C5uQPPrAcM5AZiHJ5POY9lI8vFq2q6pjWnrmmDueH2GGeg6IWUl7gjzeTAhr+Y3TXBfxSyY
	aQKf4KA0G+NR7bUOw/8M0Wnuk6IbA4dO+V4cgJlps1ovQ==
X-Received: by 2002:a17:90b:48c7:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-377a15f7523mr1221678a91.10.1781149989944;
        Wed, 10 Jun 2026 20:53:09 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:09 -0700 (PDT)
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
Subject: [PATCHv4 04/15] dmaengine: fsldma: provide device_release callback
Date: Wed, 10 Jun 2026 20:52:34 -0700
Message-ID: <20260611035245.13439-5-rosenp@gmail.com>
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

