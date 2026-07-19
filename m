Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ECE30D41D
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495562; cv=none; b=qfcL7Oow7JgthMZ4VTh5khgn10NNJuL4oAeqv08Axo9hP/a/d9otreA3sPBOnCVm6+X+fQE2vAVt5aJzYDIqw/ar2t34xx8UP2M09LgfOVWL0dH2+W8mzil8Tf8e0PoQR0u8k826izhyuG+g6H8CucwJLnJHg0qrJNBdiz2QN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495562; c=relaxed/simple;
	bh=kski0H7sdbKvfS+ROd9mCLlYX8Xx1mFCSVlEBupSDN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYy4hukMvfHupQPNHqowsqALBde1V75yVdPZcKYL9CDm1BSIAJC6DvYJlOQy0msdV95fD7UyuvqwoL0nFHEE6gIoPuRfg2w0bGS6TQdsxcp5MzviAr68XWbtnybsY4ArLtU3+ZOftDqwhcnRBWqvt38pqPTbXgu7EcMEqxMczqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHViVQ3f; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHViVQ3f"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caf228a910so73747705ad.2
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495561; x=1785100361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNHYVkmjlUEXhs1RgPaHE20c67yry/MBZs5gDBfneWw=;
        b=SHViVQ3fLqi/8+/UG6n/Ws2SyqBukvR4MPXp7BhiX1AB/ovkxuPtIoMZUySnTEevG3
         ph/hu2qHOsj+hQaxP7vtfi1GQXHQA+r1gIHU4JMapssuxewsPLgrnpy0X2N66RF5OlR9
         h2y/0n+7PvcKm47/xp0o15XHJ55ZRFo+dUuUzBZeTQkO8k8LmAPOy26qoR7lPUzCgTmu
         P0bJsfNyRk72OUWCIxbeabfCf2/RNwwr617P+BW8CIsdI0whKHcJbgByMDWpSFgfTm4J
         IeSv7PadTGBs5JPnkd1xPqGILl6ORzllBcz4Q/zTAEOUkXimRYBbv7UwpcKX7nIvQMAT
         BfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495561; x=1785100361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNHYVkmjlUEXhs1RgPaHE20c67yry/MBZs5gDBfneWw=;
        b=ouumDOmS8o4nbnKstTYQ1vehyxAGaM2A5ht9y6Oqz5X6pSXbDFh0/T3xIIngy9du7l
         +pIrv7z73DM5YxyzHOCFCIqSr0eHqvzM5kkHBIKisKRTvz4WFzUCZZijOz8uHTmhZp18
         lCzmdWCnbICYiSNhN/MUpH932sY5JCLrpzM06+MAH+ZxnXHjixiFzYE8RLGSR+h283gE
         axesP06yrlTVsNhkb0bW36wVrIwJhYesywSPq85u/Ig072hdWAbttRKpTnfD8efpwXo9
         EhVRKNQB1ti0zlmbGFL0jTWuGNDtPrYBEizpyYVu+C+usafrqMxm5lVspc3P9T7l+ZsL
         dMkw==
X-Forwarded-Encrypted: i=1; AHgh+RoBtD27eDPlXHF5Hsv8RgDxkAuMwSkUpKXgGcx56rUB0wmOSAwtrkLtcizKERPdxdYFClCm@lists.linux.dev
X-Gm-Message-State: AOJu0Yz66MCbg9Wyb76FveHdafLkTBFICYuq2ORhXPtAxlqMmhSzGlXH
	XWUJ9cLt9bRTx+EwAMKl8P499dnXzNNZRRTIbbvLuNA4YoXMjOe5VlpoIoRc4Q==
X-Gm-Gg: AfdE7cmWl6AoSDz+8H0QOh4JloxnCcH0NIpNsOwHK3ANyzkfnHE67MYaZtDW3kE14qH
	O3xgCCje9vJ4Fod3aUaw3rJAe/98O3Y6ou5gTtAKiaeQPT9ZPFu6Il9C4Yq+FGRS1kOH1dNUy9L
	CV+RoG5mV6PBoW4ku7T+/STi0sbgNv1dGc22bnLh3voNImThFuTXeNP8x2xBuTpEBDUQNFDuwlY
	C9gAU/jIHmN3CwgVfuH9OX3QvrIiWIW17SpfvPLNLYmfOepEiYZplszD1fBOPq4Npx+2wkxSTzF
	bKcaffKq9+tPWu4FsPlj0FhlwPJLxk/HpIc2t3fEV0BhexWcOhaKkIpK3cb95vFpQCt6mK0nO7K
	0eLFoTEGYADo+z82UPxMTwbYL++dsYKTS9x3787LU6pqaH47SJ00Uwd/+z/kmlc6YhygKoyA2HL
	E42xVEZvAr9BijyytcvBvVUH6za0WRRdS0BG4uPfxZs0SPo88T6Bjoetnq2+5xi2DqMXdaI00ZV
	5LDpjUJ3eBzoj4qCzzqG6VT82b9c4CUmCz92NTAaR6tQCzIUhqgcqg=
X-Received: by 2002:a17:903:2ec5:b0:2cc:77f3:a927 with SMTP id d9443c01a7336-2cf34961e63mr147312725ad.26.1784495560785;
        Sun, 19 Jul 2026 14:12:40 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm45106575ad.4.2026.07.19.14.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:12:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Dinh Nguyen <dinguyen@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC/altera: manage dci lifetime via devres and simplify ioremap
Date: Sun, 19 Jul 2026 14:12:38 -0700
Message-ID: <20260719211238.589402-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() +
devm_request_mem_region() + devm_ioremap() sequence with the single
helper devm_platform_ioremap_resource(), and move the platform_get_irq()
calls earlier, dropping the redundant -ENODEV/-EBUSY/-ENOMEM error
paths. Also drop the now-orphaned devres_close_group() call left in the
success path after the devres group open/release calls were removed.

altr_edac_device_probe() requests its interrupts with devm_request_irq(),
passing dci as the handler context, but altr_edac_device_remove() frees
dci via edac_device_free_ctl_info() before devres releases the IRQs,
leaving a use-after-free window in the shared interrupt handler.
Register an edac_device_free_ctl_info() callback via
devm_add_action_or_reset() right after edac_device_alloc_ctl_info() so
dci is owned by devres and freed only after the IRQs are released. Drop
the explicit edac_device_free_ctl_info() from both the probe error path
and altr_edac_device_remove().

Built for arm (CONFIG_EDAC_ALTERA) with LLVM=1;
drivers/edac/altera_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/altera_edac.c | 76 ++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 45 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 68846f583eee..1d0d3c99c91b 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -703,37 +703,37 @@ MODULE_DEVICE_TABLE(of, altr_edac_device_of_match);
  *	Module specific initialization is done by passing the
  *	function index in the device tree.
  */
+
+static void altr_edac_device_free(void *data)
+{
+	struct edac_device_ctl_info *dci = data;
+
+	edac_device_free_ctl_info(dci);
+}
+
 static int altr_edac_device_probe(struct platform_device *pdev)
 {
 	struct edac_device_ctl_info *dci;
 	struct altr_edac_device_dev *drvdata;
-	struct resource *r;
+	void __iomem *base;
+	int db_irq;
+	int sb_irq;
 	int res = 0;
 	struct device_node *np = pdev->dev.of_node;
 	char *ecc_name = (char *)np->name;
 	static int dev_instance;
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
-		edac_printk(KERN_ERR, EDAC_DEVICE,
-			    "Unable to open devm\n");
-		return -ENOMEM;
-	}
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		edac_printk(KERN_ERR, EDAC_DEVICE,
-			    "Unable to get mem resource\n");
-		res = -ENODEV;
-		goto fail;
-	}
+	sb_irq = platform_get_irq(pdev, 0);
+	if (sb_irq < 0)
+		return sb_irq;
 
-	if (!devm_request_mem_region(&pdev->dev, r->start, resource_size(r),
-				     dev_name(&pdev->dev))) {
-		edac_printk(KERN_ERR, EDAC_DEVICE,
-			    "%s:Error requesting mem region\n", ecc_name);
-		res = -EBUSY;
-		goto fail;
-	}
+	db_irq = platform_get_irq(pdev, 1);
+	if (db_irq < 0)
+		return db_irq;
 
 	dci = edac_device_alloc_ctl_info(sizeof(*drvdata), ecc_name,
 					 1, ecc_name, 1, 0, dev_instance++);
@@ -741,20 +741,18 @@ static int altr_edac_device_probe(struct platform_device *pdev)
 	if (!dci) {
 		edac_printk(KERN_ERR, EDAC_DEVICE,
 			    "%s: Unable to allocate EDAC device\n", ecc_name);
-		res = -ENOMEM;
-		goto fail;
+		return -ENOMEM;
 	}
 
+	if (devm_add_action_or_reset(&pdev->dev, altr_edac_device_free, dci))
+		return -ENOMEM;
+
 	drvdata = dci->pvt_info;
 	dci->dev = &pdev->dev;
 	platform_set_drvdata(pdev, dci);
 	drvdata->edac_dev_name = ecc_name;
 
-	drvdata->base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!drvdata->base) {
-		res = -ENOMEM;
-		goto fail1;
-	}
+	drvdata->base = base;
 
 	/* Get driver specific data for this EDAC device */
 	drvdata->data = of_match_node(altr_edac_device_of_match, np)->data;
@@ -763,44 +761,33 @@ static int altr_edac_device_probe(struct platform_device *pdev)
 	if (drvdata->data->setup) {
 		res = drvdata->data->setup(drvdata);
 		if (res)
-			goto fail1;
+			return res;
 	}
 
-	drvdata->sb_irq = platform_get_irq(pdev, 0);
+	drvdata->sb_irq = sb_irq;
 	res = devm_request_irq(&pdev->dev, drvdata->sb_irq,
 			       altr_edac_device_handler,
 			       0, dev_name(&pdev->dev), dci);
 	if (res)
-		goto fail1;
+		return res;
 
-	drvdata->db_irq = platform_get_irq(pdev, 1);
+	drvdata->db_irq = db_irq;
 	res = devm_request_irq(&pdev->dev, drvdata->db_irq,
 			       altr_edac_device_handler,
 			       0, dev_name(&pdev->dev), dci);
 	if (res)
-		goto fail1;
+		return res;
 
 	dci->mod_name = "Altera ECC Manager";
 	dci->dev_name = drvdata->edac_dev_name;
 
 	res = edac_device_add_device(dci);
 	if (res)
-		goto fail1;
+		return res;
 
 	altr_create_edacdev_dbgfs(dci, drvdata->data);
 
-	devres_close_group(&pdev->dev, NULL);
-
 	return 0;
-
-fail1:
-	edac_device_free_ctl_info(dci);
-fail:
-	devres_release_group(&pdev->dev, NULL);
-	edac_printk(KERN_ERR, EDAC_DEVICE,
-		    "%s:Error setting up EDAC device: %d\n", ecc_name, res);
-
-	return res;
 }
 
 static void altr_edac_device_remove(struct platform_device *pdev)
@@ -810,7 +797,6 @@ static void altr_edac_device_remove(struct platform_device *pdev)
 
 	debugfs_remove_recursive(drvdata->debugfs_dir);
 	edac_device_del_device(&pdev->dev);
-	edac_device_free_ctl_info(dci);
 }
 
 static struct platform_driver altr_edac_device_driver = {
-- 
2.55.0

