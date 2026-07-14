Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEC942BC50
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 23:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784072774; cv=none; b=GCS1bhDxNs+LxJISV7zKQhamHLQCftavgOSY8Db+Xv5Oc7EbdPGI3eDPxtG9YiJcwza1SZMElh8H8aU4sb8/GmMY8Qe99F8nwGUKf2SPbjzJT0Rv7hbEszWjdLKu8o82hxbT156iOFbfF0vbZoys2pg/w/laaZhZhkwpXnO7s+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784072774; c=relaxed/simple;
	bh=xz5rGf8Wc+mjpEoKjw/Hm6IDCdOr4kMxjrR6BxaTuSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qs0OXfJuThau7G8caZ0PAs54JM1xsJGMp024WR8uoU9ZAq02mDN6sGLpNP5ynKXLUjrV3JeXeUYBE5Kcw0WTPQnX84SZpvu57IPWjPQx5DmrvfUij3Zl7Y8hhueJ9ycNVfuwQFHRWIyGSGcnYb0xyCGghoNsdkq8L0VQbTiKyP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd/wrKym; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gd/wrKym"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1329910a12.3
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 16:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784072772; x=1784677572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzUE7I1k14QX134cx6l+OWLqB5vco662yBKK277qQ00=;
        b=Gd/wrKymvElJKI56wQhmD2n+Dtck8hRrmJaPoOG6DSWUVoDGkk6HZjAkAvb1246wdR
         b3hPicL4wBhwg8iL+feR6t2kmIguhEPk2M65+B8+4TPamnY+81+6eM2aFx3NllbnPHf8
         MjctkJ/Sh7kvzLmwPfxpPSbVJfgKdd9sN7pYV+VGnSkRgXGQz3Sy4RaYvbtgv7swuNsH
         knUzEBz0kiwKnj2+mkQZmKDfOdVERGcSimimoYxdlJNCRIHMt06ktXwJWAoAwKbHgY/Z
         OK3C3CkJ0RRsS/3Wh3wrxHIxxOWZPx6UMIvaw3+7UlJ9PWlmAG0yJCurE0GksaYp7R4S
         K5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784072772; x=1784677572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzUE7I1k14QX134cx6l+OWLqB5vco662yBKK277qQ00=;
        b=YTVo+yXSA+Jp2Pmu+TPkU+KXnclyTgG7C7zBoAdCiyMGtTDzauNjd8R8e6FkLrG1GX
         9KdTySPgcmmsymFiGOLfv7Ng0qTyWuIdshOP7fq0Dj8uDJvy4/PXgXnzHMJttR/wIiFu
         /+iFvKCj7arND8zuOzUq+Z1mk4mTZA0jcrfPceK4PJASbVuLtCrmXe6iFg5+jhKfPutn
         Q9J6TYXc9d+IamBhJT6t5jCXTMbMSbgLebc1FRsl3JMT39y+LoM15yqWmO4X3302HlQM
         4rVDJ87B0E2Mh5PGAcrp6iMRovfJsw0wJUtjxXgOk2EpDvEX1hgHmjVcjdSqlreDFW9g
         SZIg==
X-Forwarded-Encrypted: i=1; AHgh+Rpum8BhgUYVkD+w7q+T5ymb21T9yiij6pr7BzVdVoeuqFmA/1/d0bVDTn+jVD92L16syTgI@lists.linux.dev
X-Gm-Message-State: AOJu0YyOLnWFrURcNRK2gb2Z1jmeIRvgtTZS7cQlxS/NL41VhcSmJ+aw
	0A2nO2Dh5h+OtjKbzjVuI1655o/IboHQYO0FicbCxzDuvQS3zkLTa0j2
X-Gm-Gg: AfdE7cnUb9uFLWxTi22NXyKKO4vwNyH3/wCXsmwPToYMmH2IXeAlQVVcd/rZS3x/pw2
	WqWh3i/xmZRgwp8/IQ2jCbJmN5Lm/dFAjj9vgcd1OZbV+7fmFu8sej7/I1lEdW9NDMy4Gzk7sIO
	kteDKOd76i2CJEoR9AvPhPfwD3gFGtx1j92thLERp2J4dgD53K53e9hAm+rkZxwjqwxdlfh79YE
	yE5DfRZJAR/MKL4iVG0uJpcqbN3RLCcvH91MJtl3n/berD3Jx2gjXZM4VFp5gPGTXq/zOuGiQ2Y
	9Lm1KrWCDx5YQcjcCELCF4g+dgjlNReyNiwTAq4E5rLjGvPg2MBv3CvUEE2NxQaL3PcVQNYgAHY
	WLJbQdqcRP6MbVtaLiueAwz3HDHGxYshypvTB3ANcTi7354t8hayvtUb0s+A3sHhVWFwba+TLY2
	XW3T8PF4cQnGKprHMYnFGNTZToufp+o/PN4ksasFqv6h9XnVS1Qrf6Pf+e2DWvJEuIHaaRHY8/2
	eUWK3lBOKvFzcQaFfAAXG/UiU6ChCxJym1Juo7Jzd1IYH6kMHn6huhJsTMnaHdj1Ur08KSiTp3s
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0be with SMTP id adf61e73a8af0-3c110a24bb4mr17834018637.73.1784072772474;
        Tue, 14 Jul 2026 16:46:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm10988858a12.22.2026.07.14.16.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:46:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
Date: Tue, 14 Jul 2026 16:46:09 -0700
Message-ID: <20260714234609.902367-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index b27dff96aeb6..ae1d54434e38 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -22,7 +22,6 @@
 #include <linux/gfp.h>
 
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include "edac_module.h"
 #include "fsl_ddr_edac.h"
 
@@ -495,11 +494,15 @@ int fsl_mc_err_probe(struct platform_device *op)
 	struct mem_ctl_info *mci;
 	struct edac_mc_layer layers[2];
 	struct fsl_mc_pdata *pdata;
-	struct resource r;
+	void __iomem *mc_vbase;
 	u32 ecc_en_mask;
 	u32 sdram_ctl;
 	int res;
 
+	mc_vbase = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(mc_vbase))
+		return PTR_ERR(mc_vbase);
+
 	if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
 		return -ENOMEM;
 
@@ -531,28 +534,7 @@ int fsl_mc_err_probe(struct platform_device *op)
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
-- 
2.55.0

