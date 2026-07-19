Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3D930E0D6
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495590; cv=none; b=JB5vkt0QxcCDh3bsufEUF6enieX7ONep756uAnuQQ6TSmQQnGBa4sOv4pQi7wMlnOvOz773jR93KE3izCFOBUlnpYnObTKDP2a9m4+0+bvsEnJwF7ssxT1BKxswDKMRWiUEFScGtsslaf9aSK6zWmZ2HxPh3EVWOnLDh8+mIXHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495590; c=relaxed/simple;
	bh=qJO3ZujptMy/7FgWvsc/pn1ZbCWe9KW8wgoakalHQAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P4ftUwAvPjmSnlRYV5+s1DNLI36eaqG8GIOYLd4ptcucNna+fcYKiMP/FhgsJuRJANpOqRBwpFizS/HsApAqjPiP0UQJdnCsJJFGlF5kc77WNJ+pFrJi2wy3u1f4yz+drxO9csyskHKQ8RfzKJyljikoj/p09GbO+UP+TW3rNSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gV5S/Am8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gV5S/Am8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so9466137b3a.3
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495588; x=1785100388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dDp/PKTYk1gWCNiEg+cmFFINBSYDOUDZu2iGc88f5tQ=;
        b=gV5S/Am8XTQq0msn/ZB+UP3Xvt7LxRxptnwxQ7In1G6W2JF/RT0xl56iUwNjAYESTd
         WU+tTDxIv0mBYqQqoF/X9T8sG4Urkf82UKgy4okwxIBD4N5Teyb0iKOkoxrY00jy9dE2
         KWh4JC+P/ZLTseYYltSEM8gau74lywlkmIrsT4U6I6Jv4CwU1DsACsCI8SeKZOmLJ+PF
         fHku+OU9jFoWrmyly6d/jdt4mYNUOZvkFatTD1+tZ/Ozlw3f3kpswoiDtB90elLIj8eR
         bWE7E26QcYtXhxVebpHScyGpBPLOiwFSqDAG14fNks+09YzfNiHCKFZmF/2c7FYQ/DQk
         tTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495588; x=1785100388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDp/PKTYk1gWCNiEg+cmFFINBSYDOUDZu2iGc88f5tQ=;
        b=mBqW83a9G6h16Wp9LDPYolcDGfYguxQdvAk3iN3m0+RgjcsSS30YDqaETnR1mw3FE/
         7BkH4jYXTyrd4Lf+8UpQ/NdkC5kXpcSGlh9IhzIyGjggd9k+GrqV7qI7jwzzt2XLoXhq
         E0nlGdjSf1KX6Sk7fHdPAMwW2828FVBNV3wpgKBtCMlckVOwIrEhQMOczLypsTXzJuZK
         59YubIFaqIYFJZuO4hsFLFRLciUOu2UPtaxVLjgUxVdvGL9vySf3Sb0M32dT0LrATTUD
         vWUAgQ1Bz7M+NUyLDRB15jHbgk6nyqWCkcYuCuu7oHldOVhX6HiapCjeUDPV8GsTIchK
         UUlw==
X-Forwarded-Encrypted: i=1; AHgh+RpOqWeSLxB9CSh0Wq9wUdfDtQTxb/h+WFohLDkg/kcDAT5CtGWqUN37jjBgSnMigHOqshiE@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5ob0/rPU4ChOElX86HPuVXU9z28CP/pQDoF9RM4VUY1lCaNnb
	6RBkkH/PK4EBSsbeIK43lFIJhC6saFy31mswowoTDFrw/QZ0k2EamtSm
X-Gm-Gg: AfdE7cki6SX/WNeXqwbHIj/wMt78l2kmuLZp5tS14THNs0LfEoCJTbeOWVxrjS6VA7y
	9V3YhOAHgAI6/tSOxiVaS5tjVORl7UtpYoWrfOXzep+wiec3XoaL0rjFPCrkb1H39SEyYiNHNXr
	SWB54GRdwlJYMTkWwHzD/iI5sIO4Ux+v0vAXlxPo7hb1gYyfHu2KW4Th8h1gf8NxnLeKSaVGIyR
	aeIVYpHn5y8E5Q9gguHdzBxez8FJomVKxD71rQzohfHi7TaBJSMYtkDsPrH+1CEZml8vHQmr/Wh
	B2ZKH0KO53tUCmwahUICyd29z/Pr4+nfNWY6g8iaviVmakx6gTro+MfPQLu19EB/Ly9hBwz0tJQ
	vvBKg5u/1hgNgylYTRymKD5Mxd1uwaIgZxdggEKkd0uN/tSjUH9zO/WtGHCi6+Az+9cd+9gew2X
	1LRTLjz/wmtDOxO7JO/l1r3fbA/4X19jZQe2DABkXHsZUNxEtAMCVnXOM+W+OJD7UD3ODn92I2J
	ypnviH0Kz5OdyKE48Qqyt5xogH2ky/7FaQKebkg3/z/NO6lFFu+bYw=
X-Received: by 2002:a05:6a00:32cd:b0:845:c7f1:29fa with SMTP id d2e1a72fcca58-84c29333c89mr11542970b3a.30.1784495587968;
        Sun, 19 Jul 2026 14:13:07 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af30d0dsm4541562b3a.32.2026.07.19.14.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:07 -0700 (PDT)
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
Subject: [PATCH] EDAC/highbank_l2: manage dci lifetime via devres and simplify ioremap
Date: Sun, 19 Jul 2026 14:13:05 -0700
Message-ID: <20260719211305.591496-1-rosenp@gmail.com>
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
paths. (The previous open-coded resource check wrongly used IS_ERR() on
platform_get_resource()'s NULL return, which would never trigger.)

highbank_l2_err_probe() requests its interrupts with devm_request_irq(),
passing dci as the handler context, but highbank_l2_err_remove() frees
dci via edac_device_free_ctl_info() before devres releases the IRQs,
leaving a use-after-free window in the shared interrupt handler.
Register an edac_device_free_ctl_info() callback via
devm_add_action_or_reset() right after edac_device_alloc_ctl_info() so
dci is owned by devres and freed only after the IRQs are released. Drop
the explicit edac_device_free_ctl_info() from both the probe error path
and highbank_l2_err_remove(), and remove the now-redundant devres group
open/close/release calls.

Built for arm (CONFIG_EDAC_HIGHBANK) with LLVM=1;
drivers/edac/highbank_l2_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/highbank_l2_edac.c | 67 +++++++++++++++------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/edac/highbank_l2_edac.c b/drivers/edac/highbank_l2_edac.c
index 24f163ff323f..2436be7a32fe 100644
--- a/drivers/edac/highbank_l2_edac.c
+++ b/drivers/edac/highbank_l2_edac.c
@@ -45,85 +45,80 @@ static const struct of_device_id hb_l2_err_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, hb_l2_err_of_match);
 
+static void highbank_l2_edac_free(void *data)
+{
+	struct edac_device_ctl_info *dci = data;
+
+	edac_device_free_ctl_info(dci);
+}
+
 static int highbank_l2_err_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
 	struct edac_device_ctl_info *dci;
 	struct hb_l2_drvdata *drvdata;
-	struct resource *r;
-	int res = 0;
+	void __iomem *base;
+	int db_irq;
+	int sb_irq;
+	int res;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	db_irq = platform_get_irq(pdev, 0);
+	if (db_irq < 0)
+		return db_irq;
+
+	sb_irq = platform_get_irq(pdev, 1);
+	if (sb_irq < 0)
+		return sb_irq;
 
 	dci = edac_device_alloc_ctl_info(sizeof(*drvdata), "cpu",
 					 1, "L", 1, 2, 0);
 	if (!dci)
 		return -ENOMEM;
 
+	if (devm_add_action_or_reset(&pdev->dev, highbank_l2_edac_free, dci))
+		return -ENOMEM;
+
 	drvdata = dci->pvt_info;
 	dci->dev = &pdev->dev;
 	platform_set_drvdata(pdev, dci);
 
-	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL))
-		return -ENOMEM;
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
-	drvdata->base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!drvdata->base) {
-		dev_err(&pdev->dev, "Unable to map regs\n");
-		res = -ENOMEM;
-		goto err;
-	}
-
 	id = of_match_device(hb_l2_err_of_match, &pdev->dev);
 	dci->mod_name = pdev->dev.driver->name;
 	dci->ctl_name = id ? id->compatible : "unknown";
 	dci->dev_name = dev_name(&pdev->dev);
 
 	if (edac_device_add_device(dci))
-		goto err;
+		return 0;
+
+	drvdata->base = base;
+	drvdata->db_irq = db_irq;
+	drvdata->sb_irq = sb_irq;
 
-	drvdata->db_irq = platform_get_irq(pdev, 0);
 	res = devm_request_irq(&pdev->dev, drvdata->db_irq,
 			       highbank_l2_err_handler,
 			       0, dev_name(&pdev->dev), dci);
 	if (res < 0)
 		goto err2;
 
-	drvdata->sb_irq = platform_get_irq(pdev, 1);
 	res = devm_request_irq(&pdev->dev, drvdata->sb_irq,
 			       highbank_l2_err_handler,
 			       0, dev_name(&pdev->dev), dci);
 	if (res < 0)
 		goto err2;
 
-	devres_close_group(&pdev->dev, NULL);
 	return 0;
 err2:
 	edac_device_del_device(&pdev->dev);
-err:
-	devres_release_group(&pdev->dev, NULL);
-	edac_device_free_ctl_info(dci);
 	return res;
 }
 
 static void highbank_l2_err_remove(struct platform_device *pdev)
 {
-	struct edac_device_ctl_info *dci = platform_get_drvdata(pdev);
-
 	edac_device_del_device(&pdev->dev);
-	edac_device_free_ctl_info(dci);
 }
 
 static struct platform_driver highbank_l2_edac_driver = {
-- 
2.55.0

