Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB048AE06
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043608; cv=none; b=V/15z2kO1WrLx8evU47bY4BhI6NBu7JqpMZ14NcBOOn878TwH8nlxvl3FTyC/UUJwpGtg4kn4Dx5oAqz/AJKCKynACMnEgC5mZWEVPdLwHzskVRo00pS3coikbptDcmo47QOLtXUvzCkGD2Ck+ITogr5RF8YbBtu204EauOvQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043608; c=relaxed/simple;
	bh=kgVocsnpOJdD5yoR8dUG7phDR5AJisyXcC1TO7JH0ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzBTd1RyPysNC8JoQQ1MZs22WKzwj8z/Oavlqb0y8nAZt/bhL/NcVmCgMsEUlMnZypyVPJe82dC0/Min3y5Sk+4VkA8aJRaau6ypuzMfBV1LYw00eaAS0NxAh43u9knWGb9N4i9ZIXdXfWvh9Q8VMkQIH2KbtYilwLIPPA5gMMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSCaVcUB; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSCaVcUB"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8583b8fd89so3707193a12.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043605; x=1781648405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ULHTpyGJ6cpn7WfROoaIerINb7NFwICa9HOQzecsP0=;
        b=YSCaVcUBQVvvYhXmJs/4VKB3TksA228c/0WLIV/9TrLDcz+ysixK6bngC2wUMBSNGW
         Ts5hGVCBA4aZFZHkGgESKJcKEgjRa68e2SES0oMqWhNIimyf5DPoZ7OjX25+H/xioxh0
         WOX6/dvJEwwPO8Ix0XZATzvFWcvytSanOgru7jSDYczfWNJZU0mlxXZD3MZW65AZ1epQ
         6n5AMgcM3M04Kx4vdGiMQWJI+8rKDPgECBF9uTs+bQr41rMkmIjnhM0qeoDZIql3n5OZ
         hlWh1Y/ZbSZTtowRLKzcK4tTFPsqxJtykVG01Jb5djJltrwQesMASMMZpmevhBSvnx9E
         meUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043605; x=1781648405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ULHTpyGJ6cpn7WfROoaIerINb7NFwICa9HOQzecsP0=;
        b=oUdeFniXzsEX40CVYG3/As8EHVLuvBQhsYsCbgjPh86/ogX6VyP/MVoJqjKp+8nUP1
         XouVctmcaVVtxLz8rgGRdYNFr89H9OiEA4D6vzFPWNO709YMbJpjV4XpHJPrKbzc5YPB
         UXwkmoqMEszY52VDSOpuMa+AuYQXixWc6G3ZCnH8xInOxxGWXmkQ5XOzFKgEc9yImFAj
         HoszYrIxKcbOH7xC6RAtsk2X5YQOqwBLqErsKbAods5ra3aczxVe8K3Dq7cxh/dBVXh0
         CWDurIc3Bzm993G75ldzQTvMvupji7iJQfC34SPu+KIusVm+sK6WBd2DGxDj35HsYB27
         Vyxw==
X-Forwarded-Encrypted: i=1; AFNElJ85jlaxdaQLSXcmGM6fdj9Z7EfnzQJdKuAViQ3PzgEWnikFX99jP4Hxt1Xe/N8/QFUySDZN@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/EyFIrfEOTgZxNpUp+kx4FkFQkqjBULSwPJUdskY9bvb6dneP
	39Qn3ga348qFHSSmOT2/HGxjQ9ySOkO3U6VMrtKqH8BoZLldDcHs4Gbj
X-Gm-Gg: Acq92OGXfvY/7wGpFyRUNav5CrH6ACdsYnANsKpFlYvX0zcH0DRZqFVNN/Oq69kvUq6
	IYdmyFQAUVgK07x3iR1aAP+R0ZBdKqhsYArsTSQ7yaN+glYjlDhYTA7ZTYnnbelSi7pS5VYwcUw
	AEnojRXqhCAFwQ/xUrletyDy6C0Kwhh4w2P2W75dmm0X1fhsacD9h2xySBvp3YElAPNYfQPuspl
	zMgBTJeRdumCf3kp6hNtU+spd/S/iLzZY5Qu9ytKI3qiAXJF9vmJ7YF1sd7E7li2ZihCTXibN5q
	6W+TQdvXD5hYPe5tDhelHxW9h45dWwOmdIlVCrUJOCew6Dwg2Pr4NO6IMQmRwUDFZPEG/72z995
	KQWftLhE8lhBP6CP6eIQiOplw6zx7v+NWGT5Oo42Hk10nGJDlKkNRNQPWiHHafP6rpkqR+kKAwd
	8iNDhxVrNk1omzUGlEI2Il33isKaMSm+dx6/u/m4txZb+8/DqefoKBFysYlkMeJ40BIzIfAM1CS
	F1vW/bWbOGt+DAbu0f/cteV/EHlS65btxYkOYzXiLpt0w==
X-Received: by 2002:a05:6a21:730e:b0:3b4:cd6:891 with SMTP id adf61e73a8af0-3b4cce1eb3dmr26797561637.20.1781043604699;
        Tue, 09 Jun 2026 15:20:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:04 -0700 (PDT)
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
Subject: [PATCHv3 10/15] dmaengine: fsldma: use devm_platform_ioremap_resource()
Date: Tue,  9 Jun 2026 15:19:21 -0700
Message-ID: <20260609221926.35538-11-rosenp@gmail.com>
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
 drivers/dma/fsldma.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index dac12de06ef5..e4a3315a7d9d 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1238,19 +1238,15 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->addr_bits = (long)device_get_match_data(fdev->dev);
 
 	/* ioremap the registers for use */
-	fdev->regs = of_iomap(op->dev.of_node, 0);
-	if (!fdev->regs) {
-		dev_err(&op->dev, "unable to ioremap registers\n");
-		return -ENOMEM;
-	}
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
 
@@ -1321,8 +1317,6 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-out_iounmap:
-	iounmap(fdev->regs);
 	return err;
 }
 
@@ -1354,8 +1348,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (chans[i])
 			fsl_dma_chan_remove(chans[i]);
 	}
-
-	iounmap(fdev->regs);
 }
 
 #ifdef CONFIG_PM
-- 
2.54.0

