Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440F92F3C37
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784496937; cv=none; b=UFEJuDyxmpSIaLCGA6Ysk/Hrc2QDZiAXeX/OdzoC4Jj1p/HfYoflesoDLgf6xtRUyY6kSTFIs8UUCtJfFclYGrsYgrvEWdplQy6zRjTpQjGPjV3Tee61ByMrp6LTJnU7f6ySZ7Y+lzsiRRJ4MjxYX80zAa0cTgn6o2fiQ282FPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784496937; c=relaxed/simple;
	bh=esUOiMasj4ZHEuYo63Aye+NAP8L6S4TDhw4yuUZNZSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gYYkI2odIgEiFu4QRGLBOou5m0lzFB+uT7WQSdk4nsW5D+vsDMxr+Nbt+9Ltr8T/bEEqLBc4E5XRiZv1T0Y3w+fc43LMix1I86g+Qu1mrm6exkyZ2+Wzi0EtyR6OIPG8b14wadW8iIqDVXeNkJ0sGFC6jA74oNr4WbUPo1H34FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdVab1Ge; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdVab1Ge"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce7d2adef4so88779925ad.3
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784496935; x=1785101735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgYgNn21iMfT90MYm2UMdq21JQLGfcBKlRVJ7r9wOUQ=;
        b=EdVab1Ge7EV86zTZyZSnovjhyqb8JJjNjx9KlZtxhf+VRBnEOkXdHMmw5GA2SaDJ/H
         3f4DsAg3CZEDf1wx2snj1nBkbNvJBFgkE1lmyaeF3sYO7eOGDfcqlIh/KRL4A87vDq7P
         aCeBfkW2DN5+w7BbyNB1KhLK5djrtZYDsIrP0Len+k+mgkgHh7zGWneLXVMtzb6HK+c7
         vJIOZq0q5g5gMuxu7czQeCAq4D1apTrgXUkNutKr1L8pUpx3hirPULo0CDvtyrwsQEig
         bC/CazAY7Ptd9R8jrzw4Eedcxdmy7mZLrP+bt1n5+GQ4jFcvdLio6eeZ6aeplPXLJAIr
         CRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784496935; x=1785101735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgYgNn21iMfT90MYm2UMdq21JQLGfcBKlRVJ7r9wOUQ=;
        b=iwNJuZYOTcGugxm9yoO5z/MP9C8ElbL7wvnj8GcQe34YUFqQ20kXO4q7aBqfjN300O
         9kCVouUBmueQ4HUBTHzYo/S6phqH0pBiZE/xKVbDd0mGv+43r/f6S/74sxsWFDuNxV/K
         76GLxHWZDbHKiVm7auQNB9d3bhiBoc/0rEeJyTuObyleIPVeVsGb8Wr/MNCb7BVKptap
         AUgP3Jn6PLY0KRpSeVt0fk+SrgWXmeym7nWIEl8Y09+v9X+oUcDuQlycygKDKzbCgFx/
         L9m9D7yKxqfFub4qePokQLYWnhvUNNko7TlzybeLC8ILSrvz1FAIYB9QviU2ibG0sd/m
         KFXw==
X-Forwarded-Encrypted: i=1; AHgh+RprZUmhJKTut7SNK5sFitMsHEn5W3WzwybBMuIAiuMN+ntQOE6EQDJC5bgNPE8Jpk+geILw@lists.linux.dev
X-Gm-Message-State: AOJu0YyJXzmNbyhw9/R9loUpsfXfgXietlgwSGkZoNNc4o7pWW6Q272B
	7GXdYpiTen626hE70lcuIgsJwopH3lBIvt5UL8FKmDZan0e9w6G9Jjr0ERZ52w==
X-Gm-Gg: AfdE7cl+eYx2Dy+fqYpM4NvNm9UsmeyIzWNN3Y8u/ohTs/h8QWUymOAMGJ5WrxiPP3G
	JZUX/7FlvnNgq/CECe2vmVvqCOnjSL+rJcX8x29e3zoGUFe9LzAyi6Gb1wCW7sng8TJh4LlN+Hp
	/3W2vN4yEbHduyvBzs2oIdwzDaeTddj3ZKLTnzp4mOAxRDUbx3FlVg6q4OGM8axlZqSTqz+7GNA
	Z2/N9SWtuHuoGj8y94pWSzhs0DUPfeoa7OtBm+mGGvI1KzGFJlxO/LVzacJwBY8f/k8MrwwNKVB
	2YwIEvmO5J7914ChS4GcrtgGMaFq81O/KXXwPBOq2wOWZIJbwdkg9uY8FteffpnOdR8C39ydp3/
	fFmk6IQr4QuyFchWKF0/0pAeIiANI90eZW+oWeDikvIBxNpGjqEmcb6LCGlbHDCeIb/VpHriDpo
	1OHfIAigJieXl3QsdZfX93m+FSqbH9cS71FkhXi99/v004Fqn1dx7PstOjNI1qrKRjJ74LQk7Qr
	9U0AnTW1mRBzcySGEMqTl+VI2jOAF366N0n8snxIxoFFjoHV7s8e6Q=
X-Received: by 2002:a17:903:380f:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2cf348456ecmr124912865ad.12.1784496935365;
        Sun, 19 Jul 2026 14:35:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm45278195ad.3.2026.07.19.14.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:35:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC/cpc925: manage mci lifetime via devres and simplify ioremap
Date: Sun, 19 Jul 2026 14:35:32 -0700
Message-ID: <20260719213532.695530-1-rosenp@gmail.com>
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
helper devm_platform_ioremap_resource(), dropping the redundant -ENOENT
and -EBUSY error paths.

Register an edac_mc_free() callback via devm_add_action_or_reset()
immediately after edac_mc_alloc() so the mem_ctl_info is owned by devres
and freed automatically on both probe failure and device removal. Drop
the explicit edac_mc_free() from the probe error path and
cpc925_remove(); the now-redundant devres group open/release calls are
removed as well.

Built for powerpc (CONFIG_EDAC_CPC925) with LLVM=1;
drivers/edac/cpc925_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/cpc925_edac.c | 56 ++++++++++++--------------------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/drivers/edac/cpc925_edac.c b/drivers/edac/cpc925_edac.c
index 9c9e4369c041..e4384ddece08 100644
--- a/drivers/edac/cpc925_edac.c
+++ b/drivers/edac/cpc925_edac.c
@@ -903,6 +903,13 @@ static int cpc925_mc_get_channels(void __iomem *vbase)
 	return dual;
 }
 
+static void cpc925_edac_free(void *data)
+{
+	struct mem_ctl_info *mci = data;
+
+	edac_mc_free(mci);
+}
+
 static int cpc925_probe(struct platform_device *pdev)
 {
 	static int edac_mc_idx;
@@ -910,37 +917,14 @@ static int cpc925_probe(struct platform_device *pdev)
 	struct edac_mc_layer layers[2];
 	void __iomem *vbase;
 	struct cpc925_mc_pdata *pdata;
-	struct resource *r;
 	int res = 0, nr_channels;
 
 	edac_dbg(0, "%s platform device found!\n", pdev->name);
 
-	if (!devres_open_group(&pdev->dev, cpc925_probe, GFP_KERNEL)) {
-		res = -ENOMEM;
-		goto out;
-	}
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
+	vbase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vbase)) {
 		cpc925_printk(KERN_ERR, "Unable to get resource\n");
-		res = -ENOENT;
-		goto err1;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev,
-				     r->start,
-				     resource_size(r),
-				     pdev->name)) {
-		cpc925_printk(KERN_ERR, "Unable to request mem region\n");
-		res = -EBUSY;
-		goto err1;
-	}
-
-	vbase = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!vbase) {
-		cpc925_printk(KERN_ERR, "Unable to ioremap device\n");
-		res = -ENOMEM;
-		goto err2;
+		return PTR_ERR(vbase);
 	}
 
 	nr_channels = cpc925_mc_get_channels(vbase) + 1;
@@ -955,10 +939,12 @@ static int cpc925_probe(struct platform_device *pdev)
 			    sizeof(struct cpc925_mc_pdata));
 	if (!mci) {
 		cpc925_printk(KERN_ERR, "No memory for mem_ctl_info\n");
-		res = -ENOMEM;
-		goto err2;
+		return -ENOMEM;
 	}
 
+	if (devm_add_action_or_reset(&pdev->dev, cpc925_edac_free, mci))
+		return -ENOMEM;
+
 	pdata = mci->pvt_info;
 	pdata->vbase = vbase;
 	pdata->edac_idx = edac_mc_idx++;
@@ -988,7 +974,7 @@ static int cpc925_probe(struct platform_device *pdev)
 
 	if (edac_mc_add_mc(mci) > 0) {
 		cpc925_mc_printk(mci, KERN_ERR, "Failed edac_mc_add_mc()\n");
-		goto err3;
+		goto err;
 	}
 
 	cpc925_add_edac_devices(vbase);
@@ -996,17 +982,10 @@ static int cpc925_probe(struct platform_device *pdev)
 	/* get this far and it's successful */
 	edac_dbg(0, "success\n");
 
-	res = 0;
-	goto out;
+	return 0;
 
-err3:
+err:
 	cpc925_mc_exit(mci);
-	edac_mc_free(mci);
-err2:
-	devm_release_mem_region(&pdev->dev, r->start, resource_size(r));
-err1:
-	devres_release_group(&pdev->dev, cpc925_probe);
-out:
 	return res;
 }
 
@@ -1022,7 +1001,6 @@ static void cpc925_remove(struct platform_device *pdev)
 	cpc925_mc_exit(mci);
 
 	edac_mc_del_mc(&pdev->dev);
-	edac_mc_free(mci);
 }
 
 static struct platform_driver cpc925_edac_driver = {
-- 
2.55.0

