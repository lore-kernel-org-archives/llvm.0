Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D72030D41D
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495605; cv=none; b=WFMjuPmPYkzvopQS1tVjeIgQCx2BjyZP7FGxtsbKSRCPFvQPJotvrevqAC9Fg84jjoLiHONgximhMweQIlDBExSfrtt8i7ARJ23xLNjviiFQHNqh6FYmjcpNKXfbvNhbyHTY/uXQsAyIDKlm1t3eTOCWDD5zTuNQZO1/zXfW1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495605; c=relaxed/simple;
	bh=xB9i/dO3WyjAhHsqQ6yXzdKWe8poByHZyA7mlpwBkvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJRtlrk5pNQlFQYX7UlBKx3nCBTT47e17/xb1mFomFUoF18nzmgNKWS/BD7FDSRJladsWqqq399zyU4ubaWbumEH5yRK30o2ckCx9aoS+HdTxBmnAMIEeeLurMAUxypypw9l38nJvCBtklFQUyzdbYGZBqAD2R/sbWyGt6wyb2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq9TLpb0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq9TLpb0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceab75934dso98310005ad.2
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495603; x=1785100403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDAfciyZ/pwo0fbmhhGM+NACzss/tT17iLwZvqyayw0=;
        b=Vq9TLpb0L9Z1kaECtgueXBU9pVmF6Oyqe7zksJ+gbR2JEhOHQVBpMWxhJGSUr8VvPm
         bOXrNAtrnXY9iRJLzNsPyijiELb+G679SSQooB5wIYwFiEpcO54ye6fEKZmIzF7InVZx
         g7xtavc3awG35NtngvdfQi/l47Ppwuofcp/7VQncY7wj8fKI4hGEZboPjcMx1p/MtBAw
         3YF9DbscQpvdKhsVJ1bjMOJtOzJ9KWaNGy0VLwQjFeUMegHKsQkEl5u5h5+ADv7O4wd1
         9hDYh5DuUrQe97PKa78BpYYLghmPMpFLYXXXqU75mS1nK3tE0jheqgchex4el7Fixrdk
         M4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495603; x=1785100403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDAfciyZ/pwo0fbmhhGM+NACzss/tT17iLwZvqyayw0=;
        b=BzGUr0R0lbreupUx/KiIKdoYLSLA7NUIJQsmukmbOMXtwBkgkBdirj7zD3nkvFBRvl
         tLet+4fTG1QPIQtiJQ7zVNOPWe1wUh617Mvv8f2eclF5JHpsvaqaQdmqYFOvJMY1YHQc
         AcslOCeO4xM9TqsMYhYcNLlOM3y4ZeOYn0G3Jxs6uAH0JO43MsFnF+qnq3irRszKam1z
         6Ub8QgjcqToyNi9O3lAuDlkAOS+zPPS1aNUXyARGXFRpUASMjim7oJcrG3ZZwUVX0fJg
         GesbcyRXPReJaiRKq9OQeB3U9D/EP7niiR56NWpGD8hkC/qTKMuC/WQVIi7pW+v/n7+p
         YZFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpexPLETcbnWpIBKR40oTFWHYe4z1z8RKL1ZwyW0TskVd/IbYMbQ/1R8nZFTkQRKFh7DmI8@lists.linux.dev
X-Gm-Message-State: AOJu0Yy18uiYx6CnPKt6HiZr6c4Bm+iVQOuFxhShcKotz7MyKW88VGvo
	w2bADfcWB2yeNsPLaOjeBYWqB1hX2KRnJXKLklDUz23Prkfo0MwamtMk
X-Gm-Gg: AfdE7ckfGpl0MYgH+5yTiX/Cuuq4ezgHklW7xEbBBG4PgWF2gI4HHA8nP6liZ6Mct8R
	SS0W0UEhQIGg6SqavkokTZSaeo4PBbg7AofoDmXk6VeOtONlILNZ9AMeH/xJzFOWKeyY3Wcg8L1
	lCc+7/1l8vh68lu66p7T1aGQBj1uPbItn1Rq5lOtea3fWlgNNqRWFjOfEk6FdZD8q5SHzcWtLPZ
	LQurv6iE58l7z0efAlQAebrCDSYl4RT+5OD6PtEX7JmB+0VpMqFR0DNmGmVB3rM7/plYbzTWTcU
	pP0Z7agsj7yYXROXL1yJCDp+9hzLa4FLhBpK1ZxbTJN7LLCBTooSR1UgmCyxjr2ySXCZmRiF2m6
	wi7kgucwiU75+ojlnUMCDB1iq8J03x3QvCSChlxasL07OpLAL9vjbxIK8M2LsgSthNDYrrKD/+z
	sLpUmsHijFUHf6KqGzJf6dQVLUdk0vU7yyBmuhZqBidR1pcqnQtQ+lBwj3wBrepQP9qwZG/Q1wx
	2mVpznjHe9ZgjFGPYRiH4iql/TfEiVGOVdNc1Ivf4mJmQLWyPBz1LPK11XUHEe75g==
X-Received: by 2002:a17:902:e805:b0:2c9:d277:2cdd with SMTP id d9443c01a7336-2cf34887c56mr126301735ad.13.1784495603367;
        Sun, 19 Jul 2026 14:13:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34729df7sm45566775ad.63.2026.07.19.14.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC/highbank: manage mci lifetime via devres and simplify ioremap
Date: Sun, 19 Jul 2026 14:13:21 -0700
Message-ID: <20260719211321.592800-1-rosenp@gmail.com>
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
helper devm_platform_ioremap_resource(), and move platform_get_irq()
earlier, dropping the redundant -ENODEV/-EBUSY/-ENOMEM error paths.

highbank_mc_probe() requests its interrupt with devm_request_irq(),
passing mci as the handler context, but highbank_mc_remove() frees mci
via edac_mc_free() before devres releases the IRQ, leaving a
use-after-free window in the shared interrupt handler. Register an
edac_mc_free() callback via devm_add_action_or_reset() right after
edac_mc_alloc() so mci is owned by devres and freed only after the IRQ
is released. Drop the explicit edac_mc_free() from both the probe error
path and highbank_mc_remove(), and remove the now-redundant devres
group open/close/release calls.

Built for arm (CONFIG_EDAC_HIGHBANK) with LLVM=1;
drivers/edac/highbank_mc_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/highbank_mc_edac.c | 65 ++++++++++++---------------------
 1 file changed, 23 insertions(+), 42 deletions(-)

diff --git a/drivers/edac/highbank_mc_edac.c b/drivers/edac/highbank_mc_edac.c
index 3448ab750e9c..aeb326434cb3 100644
--- a/drivers/edac/highbank_mc_edac.c
+++ b/drivers/edac/highbank_mc_edac.c
@@ -142,6 +142,13 @@ static const struct of_device_id hb_ddr_ctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, hb_ddr_ctrl_of_match);
 
+static void highbank_mc_edac_free(void *data)
+{
+	struct mem_ctl_info *mci = data;
+
+	edac_mc_free(mci);
+}
+
 static int highbank_mc_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
@@ -150,16 +157,23 @@ static int highbank_mc_probe(struct platform_device *pdev)
 	struct mem_ctl_info *mci;
 	struct hb_mc_drvdata *drvdata;
 	struct dimm_info *dimm;
-	struct resource *r;
 	void __iomem *base;
 	u32 control;
 	int irq;
-	int res = 0;
+	int res;
 
 	id = of_match_device(hb_ddr_ctrl_of_match, &pdev->dev);
 	if (!id)
 		return -ENODEV;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = 1;
 	layers[0].is_virt_csrow = true;
@@ -171,36 +185,13 @@ static int highbank_mc_probe(struct platform_device *pdev)
 	if (!mci)
 		return -ENOMEM;
 
+	if (devm_add_action_or_reset(&pdev->dev, highbank_mc_edac_free, mci))
+		return -ENOMEM;
+
 	mci->pdev = &pdev->dev;
 	drvdata = mci->pvt_info;
 	platform_set_drvdata(pdev, mci);
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
-		res = -ENOMEM;
-		goto free;
-	}
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "Unable to get mem resource\n");
-		res = -ENODEV;
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev, r->start,
-				     resource_size(r), dev_name(&pdev->dev))) {
-		dev_err(&pdev->dev, "Error while requesting mem region\n");
-		res = -EBUSY;
-		goto err;
-	}
-
-	base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!base) {
-		dev_err(&pdev->dev, "Unable to map regs\n");
-		res = -ENOMEM;
-		goto err;
-	}
-
 	settings = of_device_get_match_data(&pdev->dev);
 	drvdata->mc_err_base = base + settings->err_offset;
 	drvdata->mc_int_base = base + settings->int_offset;
@@ -208,8 +199,7 @@ static int highbank_mc_probe(struct platform_device *pdev)
 	control = readl(drvdata->mc_err_base + HB_DDR_ECC_OPT) & 0x3;
 	if (!control || (control == 0x2)) {
 		dev_err(&pdev->dev, "No ECC present, or ECC disabled\n");
-		res = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
 	mci->mtype_cap = MEM_FLAG_DDR3;
@@ -230,33 +220,24 @@ static int highbank_mc_probe(struct platform_device *pdev)
 
 	res = edac_mc_add_mc_with_groups(mci, highbank_dev_groups);
 	if (res < 0)
-		goto err;
+		return res;
 
-	irq = platform_get_irq(pdev, 0);
 	res = devm_request_irq(&pdev->dev, irq, highbank_mc_err_handler,
 			       0, dev_name(&pdev->dev), mci);
 	if (res < 0) {
 		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
-		goto err2;
+		goto err;
 	}
 
-	devres_close_group(&pdev->dev, NULL);
 	return 0;
-err2:
-	edac_mc_del_mc(&pdev->dev);
 err:
-	devres_release_group(&pdev->dev, NULL);
-free:
-	edac_mc_free(mci);
+	edac_mc_del_mc(&pdev->dev);
 	return res;
 }
 
 static void highbank_mc_remove(struct platform_device *pdev)
 {
-	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
-
 	edac_mc_del_mc(&pdev->dev);
-	edac_mc_free(mci);
 }
 
 static struct platform_driver highbank_mc_edac_driver = {
-- 
2.55.0

