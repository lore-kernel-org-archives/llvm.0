Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F8F19F121
	for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753311; cv=none; b=ohH13/kUgeklgoyv60zYbMGpK906jfZMSY5zSv9HwpNUsFXHFLbds5F8uGU+LYjuZCZY3VK7J0wj1FA0Nkry9gPrFiWBLubhdXku6KVFps9RsVjk8LxOb0B5AKCRoP10qNxu1563sCaKzd5qrQbjB7UcP/lIZMHIlLsdi6SabGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753311; c=relaxed/simple;
	bh=mSitop2Yppo+RSSuqzmHplr6SG0dXZVT1RxCGcJOeS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pcNKjZ/byEdpx/M/sT/66rqsAsoHWHGz9U+kn4f+KFVFAuO9Z7Dsmtv0yJR8HKkMkZ+l0tDmQ6Y8xsmMzy3OgGq5HLODLg0mgb+V5QXbt2ib9GENjvFIpRfuhpdF2H/x0lmkcdvlKc5tfbfqBjzi2+OnIFMLrCMvvdCAcJ1sLfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kzwwu4LE; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kzwwu4LE"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487214ad2bso12620700b3a.1
        for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 13:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784753309; x=1785358109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nA4HLdiCHLbuN5swnn9vYplFHWddQQAQ0EGVLN5lYxE=;
        b=Kzwwu4LEnDRbN/xCDD6pvP+2VHdqeooxRVNHm6Djq1aF9A81X7Q+9u9JekguHq8dWJ
         j9QxAIgdzUAbGJ0D+BLs1VyE8rjdnGYtc0TmFa3Hmd5HhYH/Kke5HILz1Laz5eyeZr6p
         pcM/7ZIdLhFSii8FZaFQYDsHavf04+NT1PpwrbKpLG6Edtc7hUTyGOUkoDNYFeMVCPgA
         rE4efrRavR/vDIUKWhZzPhkXfrIfj0APyRLPijZDI4BArTM6WD62tYAdxXv3eeKy0TD+
         qRV78rzVHdjpP82dsMCxFF+To+wBRuKMOAFVosMUXZPTAmXig2D4cAd+71kCiSw7Na0E
         dPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784753309; x=1785358109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nA4HLdiCHLbuN5swnn9vYplFHWddQQAQ0EGVLN5lYxE=;
        b=olg0+44HdnyY4VMlkFKCmdN8PlCNdG2wBMSmIS4VZp+mfQ5tUS1TUIdqeB6I3s647e
         Xjsfh4RH1TpNTL1ixPwpZVq19TOjHnKoId8FEaLfTIL41TjG3s6+IKgcFSX7qj1cZPiT
         OXmyb2xpfWwzE2pu0NhXtRqi1adPfoN2ze8C7zq484Fr+RSyifFHPhTdTeNmToFr+le4
         6AS2Bv9cqXdLF7clP7L56Pc+jObldnKGWarN2Pe0T4ByC5ejPV5fNJn8pmjMPFGYZKPx
         2dnyJSmmUiwa3gC4CKlKJu1gHEkAHs3yy1W0pP1GK/BuH3vqKdxEltDoribXEKfxzdGl
         9/kQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5hN0nDSD6cujBLPFnArNmebLkkaDuDJRwoiSJ0JAXi+cfS8FzdGEMH3DqCGIdr6rxNyVI@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9yF8DY1FpTKGlgY0IJJSAKqZQ1TNKsjy2wkyaxMZHg6snANwq
	ZMkhELV8I1YcUfUe09yBIBZ8uqbWPiJeLHV7uquLUPC2hKNSFyHXA/A0
X-Gm-Gg: AR+sD10gvM1CyNk/B/4YR2dpQ3pfSPndvv8l1A+rHI3TuaK/DPb3ipT+wbpsjAKHppR
	52myXzim7GZstOtHu7DVRiUPj3IoZ1RWcng3FGu9e0HEfKGQWmr52T6WzHxFbPFlAYTktFHe4sQ
	X8ied7gqwwClpgZmg2wI31RAFwPO6SCz1u2VMdd5orpcypxG1ycZItOlpIGZ6czt1osGBHfHxA0
	GALqapMuJ5heBrx2dtA8jZJVDf/aywnAwvUsQQUhQPne988HBozNelSOyg2jiMbkcMHjNEUNvup
	Q+ux81nlYoFtLfOR39MTdoOkNIJ/Wy7U9Dc7nomrojKG0mdlmDQ14/uaMIi4QxL6nwbFmhov50a
	Yurv7l5E83vOcVdjj7iE/r2cUIk42zfY8tXOj0MB31L+g0vwZ+x7HllSnZrylv9rggHdYBht5NZ
	wv/CqdZIduEb0WiMyF3iKUXnvZ3t5Pre12OL9BoqNDfvqa6N92WNmjjDFc8sOXivZGKvF/BMULQ
	RKfirzx13Lrig3bDQvzgGfbtxkoIFWNC+HPeQlCtSg65q0CPmiy8ug=
X-Received: by 2002:a05:6a00:1706:b0:84a:6e0d:692d with SMTP id d2e1a72fcca58-84e2c181fc7mr434316b3a.46.1784753309310;
        Wed, 22 Jul 2026 13:48:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17602046sm1843277b3a.59.2026.07.22.13.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:48:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] uio: fsl_elbc_gpcm: use platform helpers for resource and IRQ
Date: Wed, 22 Jul 2026 13:48:27 -0700
Message-ID: <20260722204827.510133-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded of_address_to_resource() in get_of_data() and the
later ioremap() of the memory region with a single
devm_platform_get_and_ioremap_resource() call in probe(). This requests
the region and maps it once, instead of mapping it without a region
request, and removes the redundant second ioremap.

Similarly replace irq_of_parse_and_map() with platform_get_irq(), which
returns a negative errno on failure (including -EPROBE_DEFER) instead of
0.

Both substitutions are equivalent for a DT-backed platform device. The
remaining OF accessors are now covered by linux/of.h, so the unused
linux/of_address.h and linux/of_irq.h includes are dropped.

No functional change; the GPCM window is not claimed by any other driver
(fsl_lbc only of_iomap()s its own registers, and sibling eLBC-window
drivers use distinct windows), so the new region request cannot conflict.

Built for powerpc (allmodconfig + CONFIG_UIO_FSL_ELBC_GPCM) with LLVM=1;
drivers/uio/uio_fsl_elbc_gpcm.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/uio/uio_fsl_elbc_gpcm.c | 60 +++++++++++++--------------------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/drivers/uio/uio_fsl_elbc_gpcm.c b/drivers/uio/uio_fsl_elbc_gpcm.c
index 338dd2aaabc8..08cb150fb12f 100644
--- a/drivers/uio/uio_fsl_elbc_gpcm.c
+++ b/drivers/uio/uio_fsl_elbc_gpcm.c
@@ -45,8 +45,7 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/uio_driver.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
+#include <linux/of.h>
 
 #include <asm/fsl_lbc.h>
 
@@ -249,19 +248,12 @@ static int check_of_data(struct fsl_elbc_gpcm *priv,
 
 static int get_of_data(struct fsl_elbc_gpcm *priv, struct device_node *node,
 		       struct resource *res, u32 *reg_br,
-		       u32 *reg_or, unsigned int *irq, char **name)
+		       u32 *reg_or, char **name)
 {
 	const char *dt_name;
 	const char *type;
 	int ret;
 
-	/* get the memory resource */
-	ret = of_address_to_resource(node, 0, res);
-	if (ret) {
-		dev_err(priv->dev, "failed to get resource\n");
-		return ret;
-	}
-
 	/* get the bank number */
 	ret = of_property_read_u32(node, "reg", &priv->bank);
 	if (ret) {
@@ -288,9 +280,6 @@ static int get_of_data(struct fsl_elbc_gpcm *priv, struct device_node *node,
 	if (of_property_read_string(node, "device_type", &type) == 0)
 		setup_periph(priv, type);
 
-	/* get optional irq value */
-	*irq = irq_of_parse_and_map(node, 0);
-
 	/* sanity check device tree data */
 	ret = check_of_data(priv, res, *reg_br, *reg_or);
 	if (ret)
@@ -312,7 +301,8 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 	struct fsl_elbc_gpcm *priv;
 	struct uio_info *info;
 	char *uio_name = NULL;
-	struct resource res;
+	struct resource *res;
+	void __iomem *base;
 	unsigned int irq;
 	u32 reg_br_cur;
 	u32 reg_or_cur;
@@ -323,6 +313,16 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
 		return -ENODEV;
 
+	/* map the memory resource */
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	/* get optional irq value */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	/* allocate private data */
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -331,8 +331,8 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 	priv->lbc = fsl_lbc_ctrl_dev->regs;
 
 	/* get device tree data */
-	ret = get_of_data(priv, node, &res, &reg_br_new, &reg_or_new,
-			  &irq, &uio_name);
+	ret = get_of_data(priv, node, res, &reg_br_new, &reg_or_new,
+			  &uio_name);
 	if (ret)
 		return ret;
 
@@ -349,7 +349,7 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 	if ((reg_br_cur & BR_V)) {
 		if ((reg_br_cur & BR_MSEL) != BR_MS_GPCM ||
 		    (reg_br_cur & reg_or_cur & BR_BA)
-		     != fsl_lbc_addr(res.start)) {
+		     != fsl_lbc_addr(res->start)) {
 			dev_err(priv->dev,
 				"bank in use by another peripheral\n");
 			return -ENODEV;
@@ -371,26 +371,18 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 
 	/* configure the bank (force base address and GPCM) */
 	reg_br_new &= ~(BR_BA | BR_MSEL);
-	reg_br_new |= fsl_lbc_addr(res.start) | BR_MS_GPCM | BR_V;
+	reg_br_new |= fsl_lbc_addr(res->start) | BR_MS_GPCM | BR_V;
 	out_be32(&priv->lbc->bank[priv->bank].or, reg_or_new);
 	out_be32(&priv->lbc->bank[priv->bank].br, reg_br_new);
 
-	/* map the memory resource */
-	info->mem[0].internal_addr = ioremap(res.start, resource_size(&res));
-	if (!info->mem[0].internal_addr) {
-		dev_err(priv->dev, "failed to map chip region\n");
-		return -ENODEV;
-	}
-
 	/* set all UIO data */
 	info->mem[0].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn", node);
-	if (!info->mem[0].name) {
-		ret = -ENODEV;
-		goto out_err3;
-	}
+	if (!info->mem[0].name)
+		return -ENODEV;
 
-	info->mem[0].addr = res.start;
-	info->mem[0].size = resource_size(&res);
+	info->mem[0].internal_addr = base;
+	info->mem[0].addr = res->start;
+	info->mem[0].size = resource_size(res);
 	info->mem[0].memtype = UIO_MEM_PHYS;
 	info->priv = priv;
 	info->name = uio_name;
@@ -421,16 +413,13 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 
 	dev_info(priv->dev,
 		 "eLBC/GPCM device (%s) at 0x%llx, bank %d, irq=%d\n",
-		 priv->name, (unsigned long long)res.start, priv->bank,
+		 priv->name, (unsigned long long)res->start, priv->bank,
 		 irq ? : -1);
 
 	return 0;
 out_err2:
 	if (priv->shutdown)
 		priv->shutdown(info, true);
-
-out_err3:
-	iounmap(info->mem[0].internal_addr);
 	return ret;
 }
 
@@ -443,7 +432,6 @@ static void uio_fsl_elbc_gpcm_remove(struct platform_device *pdev)
 	uio_unregister_device(info);
 	if (priv->shutdown)
 		priv->shutdown(info, false);
-	iounmap(info->mem[0].internal_addr);
 
 }
 
-- 
2.55.0

