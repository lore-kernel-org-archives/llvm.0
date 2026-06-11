Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C833D6F7
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150001; cv=none; b=cAFd7gOERjxTBW9Id39wvVumSgiC50GLGTiMrjCOocbA0vysEjUya9QekRtnAQY4NC6lzlQYp9IeT47LMEPv3E06PqYmdThEJToxRIAUzUF8nD/Ee6JrhxMhsd5TQKImoDdjshNsnvk7/kDxaEmCbEnVTxfivCbDkCVVk+z0lBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150001; c=relaxed/simple;
	bh=UT1C4wA3q9lIRCyJivjf61ODs1oCMhkNHxkHksrCzwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nqQBO6bgIBQfMlPUYUvpKpSER23lEKzUvbUcuA6A9v3cmMLSjw3l2367E3SeviaTrb+JEeDGRNei/7194SlKRpcv6XWPdNTtiFJj7qHannz7UbBBxL9PLucgCdcNERDXYWqETQql+R/9wRZotmducrhtpr5zMIj2MIKAj/mXR0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2f982Fy; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2f982Fy"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso7406280a91.2
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149998; x=1781754798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RqUuykkdPZkLeqRZi/NqGaxU3+Ffx6rHHdgS1c9JQc=;
        b=h2f982FyCP8N+cGVXVhM4TozhTmDvfbqln+nnMgD4QmYdl8i+fn6eQGfr/FesXWG2H
         csEDx+4e+SsWFz3bGdTBBJmjZu9YCW+LWoZoKLvpA4/ywK4yimGrZf8JFpNsPgoxA4+J
         eYdG5wPuA7/0FuPi57erN3veP24FVt7GIgsiOzoblC/2M8SeyXmnOeZAT42BIiG3tKxp
         0Q1eKgrMLk5q8cdcVpL7anKr7jo8m8z28dNj9LxSSjWHNlp8JoQhg7zalMKAQ2g1PKuV
         yT+evyNMpOC9lVS6EI9dFls/iWfWe3VGlcNqfOKqOJFbCW7P4amrJFctuV/HYisRai1W
         UQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149998; x=1781754798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RqUuykkdPZkLeqRZi/NqGaxU3+Ffx6rHHdgS1c9JQc=;
        b=J+NgFqmwzwzI00sbrry6jA/uSoV5j1na1a0YEdWeIwzD7z5A4bB1Pu2zbZvFSQ1V7N
         RaTHUwmR4hTboMlfFbwP0oivVEHbw026T/48ceeZDzToc0Pm5CVr6bpUbSZodiISPi6r
         Sg9SmuNrCkGRhlXvOpfaXn2LKQLWtZOiOdeTqrMcSZd5T8nSMR3JHP0QLF/nt7e+MFvt
         1dEL1tiz7JH/OVzrnCFPnK0bNq7Up7eLDoIzUH3vnVUfTyCSMeaiSBCkoZzdF8PkLYwx
         nYXGaNi+ubVT+bKoWfPUsnBoNtdNE2fi5tT8E+b1umS//NzYWW+GP70Wwqt44nLN8IDV
         wpbw==
X-Forwarded-Encrypted: i=1; AFNElJ+axwCNhmDWKDMyNCcBoMpMg22CyLY/RoKJxqe4doHpcytsPtQEQYGtJEELClwmEPYoyuir@lists.linux.dev
X-Gm-Message-State: AOJu0YyJMeOTumiOFbESVJ/tvbLFRYAehOJ/n+F619Ykj9MBxQwyIhEW
	WCIbjCe0vG6ojJG1a5m3R5ArL/rNuuCziKxKQkUdahRspEiX3fuXJQtO
X-Gm-Gg: Acq92OHNH7l1Yof/1BGmEpEItVL+YyFwYPWIri0bJyD1Y6mG/W+gy+QU57A+C5IBNF3
	Sjji1dhHxgCS2TQoPwkvWOo/g+NrTQ9IzDljlN+vjM84AtBzFg52AVMXDKOmqnGM409j3SDBfJG
	SGEH48Z43PkfgirTkmC03wyifiF2GR/8bnTR+Fv/lhw0GjUw+wRs9jOFz9bxCpaKIUzOkVnv3uH
	zqohTA3UZvu9gRuduTrtCD9/VctMZLlpHWgi7mX+OdPn5p7J5cZHSOe7gSe/9GqjGy7r9l0uc76
	sZF5WZJBZYhkLZB25K4nqXmf0oWSU5Ts5qKYWFgwhHj6QbLwjXtX27BkYst286Z3KeeQy/cvyM2
	9TP1bfn7m4PP0mjAWzSyNNVe/ygyDKx/Hp17OsL+KNopDmHsVMA9Gw1nGIECP+P8YHPZVw3dd4U
	/W1bJpTMTJNIyKv9voJVw3DW2gp0LxzpSxFAnNTAXRiHxEtPMbzwW0gA/U99m8P/tmVcYw6KZ7W
	7ROF9O/ILS2Acym2NvJmyz3GIju0pep8x/+VLk9npQi0Q==
X-Received: by 2002:a17:90b:3a05:b0:36d:b12f:613c with SMTP id 98e67ed59e1d1-3779f186dcfmr1274210a91.10.1781149997909;
        Wed, 10 Jun 2026 20:53:17 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:17 -0700 (PDT)
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
Subject: [PATCHv4 10/15] dmaengine: fsldma: use devm_platform_ioremap_resource()
Date: Wed, 10 Jun 2026 20:52:40 -0700
Message-ID: <20260611035245.13439-11-rosenp@gmail.com>
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

Convert of_iomap() to devm_platform_ioremap_resource() to let the devm
framework handle unmapping. This allows removing the out_iounmap
label and the explicit iounmap() in both the probe error path and
the remove function.

The DGSR (fdev->regs) and per-channel registers (chan->regs) map
physically distinct regions in all supported variants
(EloPlus/Elo/Elo3), so there is no overlap risk.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index c3d2b24f8f07..e4a3315a7d9d 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1238,17 +1238,15 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->addr_bits = (long)device_get_match_data(fdev->dev);
 
 	/* ioremap the registers for use */
-	fdev->regs = of_iomap(op->dev.of_node, 0);
-	if (!fdev->regs)
-		return dev_err_probe(&op->dev, -ENOMEM, "unable to ioremap registers\n");
+	fdev->regs = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(fdev->regs))
+		return PTR_ERR(fdev->regs);
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
 	fdev->irq = platform_get_irq_optional(op, 0);
 	if (fdev->irq < 0) {
-		if (fdev->irq != -ENXIO) {
-			err = fdev->irq;
-			goto out_iounmap;
-		}
+		if (fdev->irq != -ENXIO)
+			return fdev->irq;
 		fdev->irq = 0;
 	}
 
@@ -1319,8 +1317,6 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-out_iounmap:
-	iounmap(fdev->regs);
 	return err;
 }
 
@@ -1352,8 +1348,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (chans[i])
 			fsl_dma_chan_remove(chans[i]);
 	}
-
-	iounmap(fdev->regs);
 }
 
 #ifdef CONFIG_PM
-- 
2.54.0

