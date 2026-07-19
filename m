Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5564C126C02
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784492166; cv=none; b=JB9YlCd9K/wfmrrUmy/8dfouvsUSqTMWX4WUxwnJyMiCNmhbZL8A9ds+Rd5JZI75+bB1d3CzC01nkWABVitBbeqz3V4C9DJwnSS5kKQHmchn9H1HXl6OO/n0swbCOaVebnu8YdGSQd+Zlldhodp7g3Y9ZbNG/vcU1JiIfCP1s+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784492166; c=relaxed/simple;
	bh=S3ZAZTnVI61BJZH/XagCXm7D5+H8PYPOjoWBz9R77lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOjx3sGInnFdABOp+5QJvV0oJtolGDiOAoAzzbxyyJ4xBj7MnQGwH7Vl2Dl7onDaI9noSqH71BJNUI8Nl63HZ2eKkAMyIjaOncnFUos+pA/zZIimRhf68qNz0Ligf2VIuAhESK+5JuIdbNWPcCtRaXcL4Q9COPPvVuuonwAdGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcS3wEDu; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcS3wEDu"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so4766913a91.0
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784492164; x=1785096964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVSXItgURNFIq6EsxubzFWcf+i6RbOIXI0lH1YoD/ms=;
        b=WcS3wEDumaIMWWwBtT2A9o3l3Hgzy5srXnredcQm+USu8mmPS1ZIQNKFyOZUznVWdD
         AyWaI6ukqRHv8xKV5c4rrPOLE9/xEbJLh7iYmxmLz+RlSNkLGKccOwqyRo1CijDo7PNV
         +GmR0GNCh4g0UpNcl+6NNBgx/p37NgCxieE7lIEwRYy3/nZdsYfNmB22lfvHLf3YVBQF
         7RsnQQ8Nn/7phQ9wGsZPvso2Noj0eQ35LzCevv2up1rE/6/9MvXAcNH2CsuEwJTu5+vX
         aX3Iymi2G9LyB2U0/z55RC3ednWK+8zOAHh8Ca3NWLiIqcEidCr95w7glBRD1o21LFZx
         /jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784492164; x=1785096964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVSXItgURNFIq6EsxubzFWcf+i6RbOIXI0lH1YoD/ms=;
        b=R0je+aifFDCFiLSrjT/Rk2utjISA3TpBUGNo9jImyXxV/B7fiYc3sWQmZwnh/8FFVP
         Wlf8P48KZ3YL1xzVAIbAJLG/PLN83M064rIOChlvzrTGO5Z28eWiSBp88fw5lyvuEAmM
         srAE+YirklaoP+dhLyRyNfJgn0AS9va/3zZ4SO/NV35+UKpP0iFXpJ8Aw50sa2ocYtwR
         xjV8b5p9+OX6iTQZ1CwQCghYJTVXyQ9TnOvkbxbVbE3ROhJLpL5Gt+h8lxwEkjYgvXEg
         HVQYsAHLoNER2u9MbTdG0HyLNeuM1fBYGoPge4j6GSWIy1CumwPDtRBjMjz4zS/SS/QX
         Lb9g==
X-Forwarded-Encrypted: i=1; AHgh+RqHh8r5kSmHidC1EIg2Xo7YxWnKPQzoJk5QjywsPd3yuq7mqBLzQ/2mGE7YuedDhSMo+gxH@lists.linux.dev
X-Gm-Message-State: AOJu0YzcujMA+BmGKRIB+1pBV9/UGylebzDr0+GTlrW+YXrEFEX9hDfx
	j5b+PeJagvqh0cGJ6jLT4obLXBuu4GpnGCNy2HyXZ3/mUBOg4vNL+7Mm
X-Gm-Gg: AfdE7cnFdJlXaL2y4v8wf/MK24Kyu5kVzIOPUiQsDT5WlFoT8Uvn9y99AVy5sioCnIQ
	o1UZRQlVgYCsrNr5mUcqM0tmhuPuR8hERJ9LiaXhDgt+3QaeQmjRJP/WFj5lNyh1z9TlTMiu3HP
	Rn5f9Iu9wW5Vm2CS4EU1sSjjWpHk3ZbBvhn75/tiy19dz0YaE+Ai8GlWd6Ukto/aYAV4kIBQLgx
	aVk5EaSRsoLNo4l00yii7MzxUJXt5gNcvT/K/f0O5DelIqNp47/NgiBpMb8GOLV8kneOiVSOppw
	ihhYvO9jXl1w8GnrS6YFYiAQhxe5LvZqZ5IS7tY7qMYNORiZjCaVFYywr47HrI7i0NKF6SlmjfU
	O6ev2mnDugRpNzUcYGWzbFe6t05q4bGadlUIfmWX3setkCrUaHr2f5+NncG++bqBqd2NZ5Uq5zp
	aItXRRHA/IKWZBxLm2shWILEMwIvUQrrmGUWF195dSofTGIR8AihJq1Zc/40KqOMVyziUutogG2
	t59ODeTy2yS7cKAHOyQeP2xO3SsWMO5MogaXX2P2cceBQkbWhvRJbU=
X-Received: by 2002:a17:90b:3ec7:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-38e4b503aa4mr11320509a91.20.1784492163625;
        Sun, 19 Jul 2026 13:16:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39fe37d1sm6473418a91.12.2026.07.19.13.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 13:16:01 -0700 (PDT)
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
Subject: [PATCH] EDAC/mpc85xx: manage controller info lifetime via devres
Date: Sun, 19 Jul 2026 13:15:58 -0700
Message-ID: <20260719201558.310738-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mpc85xx_pci_err_probe() and mpc85xx_l2_err_probe() request their shared
interrupt with devm_request_irq(), passing the allocated control info
(pci / edac_dev) as the handler context. At removal the driver frees
that control info explicitly via edac_pci_free_ctl_info() /
edac_device_free_ctl_info() before devres tears down the IRQ, leaving a
use-after-free window in which a peer device on the shared line can fire
and the ISR dereferences the freed structure.

Register a free callback via devm_add_action_or_reset() immediately after
allocation so the control info is owned by devres and freed only after
the devm IRQ is released (devres runs actions in LIFO order). Drop the
explicit frees from both the probe error paths and the remove callbacks,
and remove the now-redundant devres group open/release/remove calls.

Built for powerpc (CONFIG_EDAC_MPC85XX) with LLVM=1;
drivers/edac/mpc85xx_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/mpc85xx_edac.c | 42 +++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 7bb13f85ce57..13c88600f7b5 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -141,6 +141,13 @@ static irqreturn_t mpc85xx_pci_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void mpc85xx_pci_edac_free(void *data)
+{
+	struct edac_pci_ctl_info *pci = data;
+
+	edac_pci_free_ctl_info(pci);
+}
+
 static int mpc85xx_pci_err_probe(struct platform_device *op)
 {
 	struct edac_pci_ctl_info *pci;
@@ -150,13 +157,14 @@ static int mpc85xx_pci_err_probe(struct platform_device *op)
 	struct resource r;
 	int res = 0;
 
-	if (!devres_open_group(&op->dev, mpc85xx_pci_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
 	pci = edac_pci_alloc_ctl_info(sizeof(*pdata), "mpc85xx_pci_err");
 	if (!pci)
 		return -ENOMEM;
 
+	res = devm_add_action_or_reset(&op->dev, mpc85xx_pci_edac_free, pci);
+	if (res)
+		return res;
+
 	/* make sure error reporting method is sane */
 	switch (edac_op_state) {
 	case EDAC_OPSTATE_POLL:
@@ -285,7 +293,6 @@ static int mpc85xx_pci_err_probe(struct platform_device *op)
 			 | PEX_ERR_ICCAD_DISR_BIT);
 	}
 
-	devres_remove_group(&op->dev, mpc85xx_pci_err_probe);
 	edac_dbg(3, "success\n");
 	pr_info(EDAC_MOD_STR " PCI err registered\n");
 
@@ -294,8 +301,6 @@ static int mpc85xx_pci_err_probe(struct platform_device *op)
 err2:
 	edac_pci_del_device(&op->dev);
 err:
-	edac_pci_free_ctl_info(pci);
-	devres_release_group(&op->dev, mpc85xx_pci_err_probe);
 	return res;
 }
 
@@ -310,7 +315,6 @@ static void mpc85xx_pci_err_remove(struct platform_device *op)
 	out_be32(pdata->pci_vbase + MPC85XX_PCI_ERR_EN, orig_pci_err_en);
 
 	edac_pci_del_device(&op->dev);
-	edac_pci_free_ctl_info(pci);
 }
 
 static const struct platform_device_id mpc85xx_pci_err_match[] = {
@@ -484,6 +488,13 @@ static irqreturn_t mpc85xx_l2_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void mpc85xx_l2_edac_free(void *data)
+{
+	struct edac_device_ctl_info *edac_dev = data;
+
+	edac_device_free_ctl_info(edac_dev);
+}
+
 static int mpc85xx_l2_err_probe(struct platform_device *op)
 {
 	struct edac_device_ctl_info *edac_dev;
@@ -491,16 +502,16 @@ static int mpc85xx_l2_err_probe(struct platform_device *op)
 	struct resource r;
 	int res;
 
-	if (!devres_open_group(&op->dev, mpc85xx_l2_err_probe, GFP_KERNEL))
-		return -ENOMEM;
-
 	edac_dev = edac_device_alloc_ctl_info(sizeof(*pdata),
 					      "cpu", 1, "L", 1, 2,
 					      edac_dev_idx);
-	if (!edac_dev) {
-		devres_release_group(&op->dev, mpc85xx_l2_err_probe);
+	if (!edac_dev)
 		return -ENOMEM;
-	}
+
+	res = devm_add_action_or_reset(&op->dev, mpc85xx_l2_edac_free,
+				       edac_dev);
+	if (res)
+		return res;
 
 	pdata = edac_dev->pvt_info;
 	pdata->name = "mpc85xx_l2_err";
@@ -573,8 +584,6 @@ static int mpc85xx_l2_err_probe(struct platform_device *op)
 		out_be32(pdata->l2_vbase + MPC85XX_L2_ERRINTEN, L2_EIE_MASK);
 	}
 
-	devres_remove_group(&op->dev, mpc85xx_l2_err_probe);
-
 	edac_dbg(3, "success\n");
 	pr_info(EDAC_MOD_STR " L2 err registered\n");
 
@@ -583,8 +592,6 @@ static int mpc85xx_l2_err_probe(struct platform_device *op)
 err2:
 	edac_device_del_device(&op->dev);
 err:
-	devres_release_group(&op->dev, mpc85xx_l2_err_probe);
-	edac_device_free_ctl_info(edac_dev);
 	return res;
 }
 
@@ -602,7 +609,6 @@ static void mpc85xx_l2_err_remove(struct platform_device *op)
 
 	out_be32(pdata->l2_vbase + MPC85XX_L2_ERRDIS, orig_l2_err_disable);
 	edac_device_del_device(&op->dev);
-	edac_device_free_ctl_info(edac_dev);
 }
 
 static const struct of_device_id mpc85xx_l2_err_of_match[] = {
-- 
2.55.0

