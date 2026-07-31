Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992DB2D5C7A
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 01:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460896; cv=none; b=fYBFCDxP6WiaOnE+rR3j7l2B81h6Re9Zyzqo4/XqS87kWhtN4/BGHTlpQ0q5n7ocnl0gKnqbrpV2VizAq8Q9bqxY64nkp14oY8KyCrcByAOA21sZtpcACd0uBVidxDGM6Jb/S810xm1Kkk0dnUifsLU6eNVeNarIa2Dq36ibxzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460896; c=relaxed/simple;
	bh=Z+gXpVeOJerXPn7c/pQ3zs2SIaak8eHO0YCv426HccM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/AmW/+TxbN6ptGS7QNrcF9G/MVSom/ihKzznCsTJSS3ZaBc59g2d4S8cKvspaFCaV/305SqoWtD2NIHsnd3YAZLru/IHpBAp0X78/ZJ/IzaAUMrhru5ba+7QowzSGLpL6N/RjY9ggsnCsP28Ef0crnbbr+X2AvmFOhyCkGjTeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKTtHy9Q; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKTtHy9Q"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so355697a91.2
        for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 18:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460894; x=1786065694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=druBUrLqgbBhWVJNiJbBH4EBtzUPbfrjGd0lGlIkkSY=;
        b=nKTtHy9QhyAyymdJ19I0VVd4mpbvlwogRVNPg9da09PaVEGHHYggn5EkbXubp+HmT9
         hklnZaXl4docpPCbUeZd6Bj6xXMQRQMjtV+RR61s7p6hAnZDqR9pLg+7kSgLAoMDYE0g
         9ATpd9//ECFvUdPhtnFcDSfEU+bzNThEMKJqITLZeb65dYGiqhFp2xziZ6LjhUlbIKVX
         wXGVGVhcbUScL+0giLTPJBIgFnDM5QwQvvm63xQOssb3zD5fgIqDg9YM0QeyaMJ4R5yy
         Y7Y7tEB1ycfCQboRV3Plngg0yVZH1a0r/dTNEN15Ns4UmPN1uNnrBMZHGL36rcTk9c2z
         GyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460894; x=1786065694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=druBUrLqgbBhWVJNiJbBH4EBtzUPbfrjGd0lGlIkkSY=;
        b=DG/uEBt2fu6h+jAVtjSBtPnO6Sx/zM/z6xCAvGJYiaYcMe5G2jkaQpmyYfN0t3KsyF
         HuBLtNMDzeZLacmyR78QK7JSEHbBNVXH2sQpELAr9ftCV9ja4ycuvFUBHaYV/Q5L3nLf
         TPgT933Ptv7PLv0MTosfxXjOpmTOGbdNEKPST7fExJhdtYH5V6envi4/OPmekLLWN0m8
         yGpH1M4nH38uNqsmoRbTgLPCSi9GIpTnAbHS1E/NrGZ+DhUikvQDhBKdHf13UA6+Zihj
         8dGFLJM1jFQC3TNIif9ZGdPPqYi6YJW1bIMMoQRAwMao/rBb+uPQ6mtauxH6IKpSCdcK
         eanA==
X-Forwarded-Encrypted: i=1; AHgh+RpJ738V1h1Ef2tmeTJrKSWG5ph35EBJEI+u1Cwl6yZJIevzNYApyRRBsl30Z8n0IovJBEGI@lists.linux.dev
X-Gm-Message-State: AOJu0YyI2pUV7Cplp0CKdu2f2rWXc+1hM95SkO07QOrVQNDoBvp5npWs
	FSvGdQD6oiORoi+Pd3b57DDXP/fGCbme2rAbbqfmjCDIXac+TQgS78dd
X-Gm-Gg: AR+sD11gBcxU+gHzeUwB8Lub06FJrk1bjXZN82PEHzvr+nOdi9odZiImgAm7WGoONm/
	L5uvn22MODElPAsq78qk7IUZWEsW4fOF4m1vulAepVnNKlXqysOw2prH/Jz8vK0CkhRT1ag4U53
	Taa7asugT3F/0w2i685BeZ7JvsgtfsoQwmxS1XZpnncRzmPnKgHjil04nW7BLG6AACXcFi8iFzx
	F8I1QqGQVF31F+AL9xSBt3InhXf+mLliuoBlah1Mc5swUFkWUbwOk0xct/cv+Ht9i3sCSPBxqnF
	CAv1yP2CbjUbWPN4iu+ux1PW4sCisUD7ZEwWGv+ouHRHGqQoiqgx22GwFT6oi8F3n6Gii+qroEx
	6S18Rgl+T2jThaCsBtyYCXcBuLBFNNuY8J8jn20mDU37ODJlQzVHIOlBThBChDjaOA3Emr7+dMl
	t62gJIlYrbpyi6fHJikTkv1qLomm/02U8F5E4/zcETKdnIV/O7UAXhG+p6Q61P3UksRVBxyWS+N
	JD8T02pKDGoYcGjIf+Y+8Z/lKh7qimL5aV2A3qTC2aOH3cdf5sRbBqfmpaFWL+1H7VGsOoBBV/O
	RABwIZfWqdmz0kTWghS/545pBx6BpBOo73z05A==
X-Received: by 2002:a17:90b:1d8d:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-38fb121ee39mr128591a91.14.1785460893844;
        Thu, 30 Jul 2026 18:21:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 1/3] EDAC/fsl_ddr: use devm_platform_ioremap_resource()
Date: Thu, 30 Jul 2026 18:21:28 -0700
Message-ID: <20260731012130.1212640-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731012130.1212640-1-rosenp@gmail.com>
References: <20260731012130.1212640-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
and devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
the resource lookup, region reservation and mapping into one step and returns
an ERR_PTR checked with IS_ERR()/PTR_ERR().

Behaviorally equivalent with respect to region reservation: the driver
already reserved the region, so the non-overlapping reg requirement was
already satisfied. Drop the now-unused linux/of_address.h include.

Remove devres stuff. Not needed. devm is already used.

Fix a mistaken return code of -ENOMEM when PTR_ERR should be used.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 39 +++++++------------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index 2a545e5812e7..3745eec67335 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -22,7 +22,6 @@
 #include <linux/gfp.h>
 
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include "edac_module.h"
 #include "fsl_ddr_edac.h"
 
@@ -495,13 +494,14 @@ int fsl_mc_err_probe(struct platform_device *op)
 	struct mem_ctl_info *mci;
 	struct edac_mc_layer layers[2];
 	struct fsl_mc_pdata *pdata;
-	struct resource r;
+	void __iomem *mc_vbase;
 	u32 ecc_en_mask;
 	u32 sdram_ctl;
 	int res;
 
-	if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
-		return -ENOMEM;
+	mc_vbase = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(mc_vbase))
+		return PTR_ERR(mc_vbase);
 
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = 4;
@@ -511,10 +511,8 @@ int fsl_mc_err_probe(struct platform_device *op)
 	layers[1].is_virt_csrow = false;
 	mci = edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
 			    sizeof(*pdata));
-	if (!mci) {
-		devres_release_group(&op->dev, fsl_mc_err_probe);
+	if (!mci)
 		return -ENOMEM;
-	}
 
 	pdata = mci->pvt_info;
 	pdata->name = "fsl_mc_err";
@@ -531,33 +529,12 @@ int fsl_mc_err_probe(struct platform_device *op)
 	 * Default is big endian.
 	 */
 	pdata->little_endian = of_property_read_bool(op->dev.of_node, "little-endian");
-
-	res = of_address_to_resource(op->dev.of_node, 0, &r);
-	if (res) {
-		pr_err("%s: Unable to get resource for MC err regs\n",
-		       __func__);
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r),
-				     pdata->name)) {
-		pr_err("%s: Error while requesting mem region\n",
-		       __func__);
-		res = -EBUSY;
-		goto err;
-	}
-
-	pdata->mc_vbase = devm_ioremap(&op->dev, r.start, resource_size(&r));
-	if (!pdata->mc_vbase) {
-		pr_err("%s: Unable to setup MC err regs\n", __func__);
-		res = -ENOMEM;
-		goto err;
-	}
+	pdata->mc_vbase = mc_vbase;
 
 	if (pdata->flag == TYPE_IMX9) {
 		pdata->inject_vbase = devm_platform_ioremap_resource_byname(op, "inject");
 		if (IS_ERR(pdata->inject_vbase)) {
-			res = -ENOMEM;
+			res = PTR_ERR(pdata->inject_vbase);
 			goto err;
 		}
 	}
@@ -637,7 +614,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 		       pdata->irq);
 	}
 
-	devres_remove_group(&op->dev, fsl_mc_err_probe);
 	edac_dbg(3, "success\n");
 	pr_info(EDAC_MOD_STR " MC err registered\n");
 
@@ -646,7 +622,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 err2:
 	edac_mc_del_mc(&op->dev);
 err:
-	devres_release_group(&op->dev, fsl_mc_err_probe);
 	edac_mc_free(mci);
 	return res;
 }
-- 
2.55.0

