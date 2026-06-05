Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041B43B71C9
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696921; cv=none; b=VyCJN0te1H9rTt4K/3xYSgGfHEDwR6GBgPnOgG0B0uu5XUdYNwr9W2ZyNC3PqX5G9Yhz5fU00fkHu7oS1uEN9LekSLH6n5918kjPu2efhK8UBpCB+u8vZeNqs+z7DYF/tNn+rYWv/NF0gP9T4ovzssItZh0YP0CFLYn5v8rG2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696921; c=relaxed/simple;
	bh=reYbgeVAQzFvOU2OYbCzswcoW1erxmIKcVROrzvbUos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vf4ZyeL3vFJWHGfG6V5YgtbjeFjt/qQ2inlRmwUZOs94JwNAHcif355BcST27zOsJJmZtBSIGR/jFpeh77v2BE/8N+2Op12swXbCuIZbd9sfUwhG2oa8X6FNAAFqZDGhXAUWH+Rgv36y9NPkwShqg3qt5HICnfWOHSw1hitJC18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dd+1hEoW; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dd+1hEoW"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c858b5de728so1587115a12.0
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696919; x=1781301719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sz7+xisuSM5PYR/do66zevMAZphs/3eVGB3/an7yPc=;
        b=Dd+1hEoWCa/bDGA3OxlA0ou5KmBMXbjF9FCZkKXSiqWbjAwImjAOTkpiBIrZH7CdTN
         tOad8WqWfyT07ygk/xvyMMlEGywA2vQ/e48vXCvIodTkk7FtoIClbVM3fc0Idv7PxxCC
         eATaU+Jqh/avEg+698+2tA6pYdYEly5G7a607n8uU9obWzDBc9bWsLKuePJEOTIU7owg
         TTIyp5y1kapiVW2qUuVGMEFwCbRouW1xpSGD1upOIA4eeBFdo5LGlQVID3arYTbUqlcE
         tcuT0irjUefh1hC0T81in8uqTXNK+G0Y/JbyMt/IZnCNOm6WNh932WlylvTJ0ZqFaoGs
         yXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696919; x=1781301719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sz7+xisuSM5PYR/do66zevMAZphs/3eVGB3/an7yPc=;
        b=L2QcNuGzxZzT8M30f4nUKFnQH9P0U19kVATbdnfkIgRTn2nztkpRXKRYwh5fT7XGUF
         N0pbjSXiev364OwYeE/Vw7LJSb/cRadyn/N7QbbmWcMgqhyMM4y+nm29digek/8pj8XE
         V+MmWJpDXkCuHVFGrxNbZMspg92slm35IpgCnY/Oa1L9Ow/i09Lb2pEHEIrOJWngL/ZR
         m8qjB7ZcImfEnCHpqddnWYl3cc10uSnzvPvbqcXd9zMGV1ebuTXOY5Cq8FrFucaxrScg
         s/Z145K6SA4OVdpGnTTtCrLKrj9GPSNDj/oUGfqbrHFl3LiKmP7ogfnf9GQA33fhwVR4
         tDlA==
X-Forwarded-Encrypted: i=1; AFNElJ+XLz07nr2syvMKP09OKpQiqdoabbqnr2stJnquLwHIXpYKHWK6rCnhBbW4gsNAle/+6AmY@lists.linux.dev
X-Gm-Message-State: AOJu0YxiL41/wwWQpc4bbesS1ul0ka7XtgpL1CqpBEsgpjymZwr3ylLk
	LkK+sqKepp3ReE3rETSxNLepRVfHoSwHiszo1UdBZDXkXctFSvJChA9o
X-Gm-Gg: Acq92OFT/bWsNB1u7SvzteURaZzRTcGfdjHG34pAzHjOSuIpWZf8uibUa+Dvdcm+4x9
	roRG6ayyLE0CezKoP5JsYQt029dWOhHoD2tw/lm5S4Gk4ClWo37gqLAScdZ3wEOXGz968ipUUMW
	GA3tNmNbokcQ/2c9B4W5cUDKs5FhSvBXRyG/vUQ0H7Muc0zxaiQOUzJu4PxHpWwd3e7vs8pbzxd
	rO+FhRo8P+GDNzzNcG1mxtV+wrjlaHmtUsDEY+QQH4XZw3c+Lgvjhihzuu4wKZP7tWllaQZxClg
	trQlamQh5vgOMC2/2wc0MrdwqCsamFLwQKm7O0qs8sQnBGMHotd/YxaxRk1NdZN95rCOPOamx0/
	8457a3Z7UWxVE8/Ba/snUeia2c9oHflY0RHH6qhTjQ3pq6UOnjP0noRUCmEcbnfUVV9bGS0wCBw
	nuso3vBcrogdsccAoJ58B3cvOx/gZCY+GQ82cbBAE5FodPdONFQoVnv5PxTYhvc2CqOLvQqZ4UJ
	l843gSrPABKXox3Ba2wt7LvwmWhpGOF8KsrAUrk0ZO+ZyEUd8SMB0gn
X-Received: by 2002:a05:6a00:21cf:b0:83a:3135:edbd with SMTP id d2e1a72fcca58-842b0e1e1f7mr5458741b3a.7.1780696919249;
        Fri, 05 Jun 2026 15:01:59 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:01:58 -0700 (PDT)
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
Subject: [PATCH 04/10] dmaengine: fsldma: convert to devm_kzalloc and fix error path
Date: Fri,  5 Jun 2026 15:01:28 -0700
Message-ID: <20260605220134.43295-5-rosenp@gmail.com>
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

Convert fdev allocation from kzalloc_obj to devm_kzalloc to simplify
the probe error and remove paths by dropping the explicit kfree.

While at it, fix a goto target mismatch introduced in the recent
platform_get_irq_optional() conversion: goto err_iounmap should
be goto out_iounmap.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 0d28f8299bf8..2efa16d12679 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1213,18 +1213,17 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 
 static int fsldma_of_probe(struct platform_device *op)
 {
+	struct device *dev = &op->dev;
 	struct fsldma_device *fdev;
 	struct device_node *child;
 	unsigned int i;
 	int err;
 
-	fdev = kzalloc_obj(*fdev);
-	if (!fdev) {
-		err = -ENOMEM;
-		goto out_return;
-	}
+	fdev = devm_kzalloc(dev, sizeof(*fdev), GFP_KERNEL);
+	if (!fdev)
+		return -ENOMEM;
 
-	fdev->dev = &op->dev;
+	fdev->dev = dev;
 	INIT_LIST_HEAD(&fdev->common.channels);
 	/* The DMA address bits supported for this device. */
 	fdev->addr_bits = (long)device_get_match_data(fdev->dev);
@@ -1233,8 +1232,7 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->regs = of_iomap(op->dev.of_node, 0);
 	if (!fdev->regs) {
 		dev_err(&op->dev, "unable to ioremap registers\n");
-		err = -ENOMEM;
-		goto out_free;
+		return -ENOMEM;
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
@@ -1313,9 +1311,6 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 out_iounmap:
 	iounmap(fdev->regs);
-out_free:
-	kfree(fdev);
-out_return:
 	return err;
 }
 
@@ -1335,7 +1330,6 @@ static void fsldma_of_remove(struct platform_device *op)
 	}
 
 	iounmap(fdev->regs);
-	kfree(fdev);
 }
 
 #ifdef CONFIG_PM
-- 
2.54.0

