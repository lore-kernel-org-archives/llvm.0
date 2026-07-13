Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D219738C42F
	for <llvm@lists.linux.dev>; Mon, 13 Jul 2026 23:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783984646; cv=none; b=KMM0YBsRsuv7LsI/m4cPqDSk9sr3Ac3WmlXPUsrNA7wgLOPGivDykbsXZOgEUD+lP+QEZemY+HYAbK/8mbH+2QDsoOrOf8Y9g88T09lh6xDAsOHsKQ8AigQixa921AQpEdXWg5NbAKCJZEwfTuscoPadQpHYqW8x1X8jHiKuil8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783984646; c=relaxed/simple;
	bh=7KJbLB4w0OJZHRVNOcvglTEvTdy3FR50ECp4VayMpm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kDo1maejye+78Yyw9XvtGz6tvYlMLpksa+YQrkDor7tUD81gteenGs5ugP46WXwyLcVYjL9acrkAw/dSY3nbP7eINoAsP128QjIgHydw/YQP5u+/9Bs6CQkvaVaicZo5NYBKaLhsF6HK/6kCuO+pRT4EBNCcctWzf9AqdsgBAFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvSvRVNd; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvSvRVNd"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1151299a91.0
        for <llvm@lists.linux.dev>; Mon, 13 Jul 2026 16:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783984644; x=1784589444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+FL5XSAFXC/lBCBY2+tuXGzEqpVa/8UNV4Ia4+5Gn4U=;
        b=bvSvRVNdf28u4xSvmP3DBlXGsU82QcZVWUXYlHufRd9IwmozAXX2OYWtqGlUzvlu3W
         jCYIY1HrU5oo1yW+Kp/wpnRxNcwEu7EvD83DW4UAcrMo4YqGpPZvND0OEi1kSNg7lJm8
         XZAKuwEQCAtZ5yGeG+6X+jPnCil2h94Invqb9ZPAZuox1zbA+v3EHuBvXAnHhg15P4zZ
         HlNN1xDLQkVeG77xVXwcFpfKKR1zs1YFsjinr39VjwJtb0EqlRbs2+nXe7TKX+rKNq4W
         ftdPP9WGLAomUE3+dRz/V7rpaLb0fC5eevxDA+jVzlhazYTQURXa4BZwvCkdSiWi8fvp
         +E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783984644; x=1784589444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FL5XSAFXC/lBCBY2+tuXGzEqpVa/8UNV4Ia4+5Gn4U=;
        b=LnFZpIMQSfi10NtwwbG07yeTDOmamDpbQsIbRn42pfCsw4YldDxtgFeyPWiqeDJ5wu
         lTmLCmvrndgvcXa0eAElHP9FnppKmu7BEDbFJ2raSmRZrNwS/Ao2b92D2p+LKEwVegE3
         y+SXzFK8Rm2qMnpm4d4mQL5j7iZDaPbkB6Hsv+g+a8oEjZWwqREk/gvYRNYP+7SM0BI7
         YLf99CE+/F33cqizMlICkbBnFeChxpEJVGqouGTepUMXObD9kDzPS8t59TMr+svukTz5
         USitByktzIc0WRWEVthea7kuh+27NoiSI+gWkUImcbe/jeXvkwKvwyQzcVgovezouFVi
         WAuA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4vNfklXI1E9cxm4fF45/n94eHR/Mhms+hm84w9s95gTXaXmQ9uznx633nWWGKoGFSHQ+r@lists.linux.dev
X-Gm-Message-State: AOJu0YypgGBBDclXYCqqPNk8xcYBSE8Ca3hWyp/l74N4ApG73d2Mv/Ob
	2iRjdkDAT0tzs90DGREa9QDPG77Bu3yJfh+aw0gTmiSvkBDPSeSahFRh
X-Gm-Gg: AfdE7cmgemdDyNM4MDshb4M4LMJdrM9hpD6gJUZpxGySSbjKSIkuLWBSkQklpS0irJx
	bLjHTeKjhym6RhZHtGyMlLRuwkGuiQUSxzTgjpyQN066tD6qjoP+VoEBiFbLITKZKPWYPF+UMLF
	htTUdR1KzVhvIcXdc/JUOITnSjyByefHtAciJeuA40VABqA0Jgav5XdXqOaJu7XpMnul9kaTcOq
	p+qqfJ+UKCFwQGzDW58GGvOhFppN1JeMr2mKBI0XLUM+cfdCVf8Jc+hQIqLNNGy/CbqcZKyKl46
	KvvxDFfEa22VPHACjDRWHh/p2mvyOl/tnq6KLZ6F7DBBkIxTgme/f1Blyovl5UbVtNPzHY4Szms
	ipnf62Hd7ql0MT1SyMeuCJNkuXwYNgx9fuVEjYLMB/sWSCsMuP7amg1Wdq2CoTgI3GJlUsUlfZS
	KiWjyB9Uvo0ewLmBddGL5xwZal2vERb54n06npcaBtoJMFQfC7Ld3dkgYAe/9UJA/RUeE207vvo
	gxZ4uNhq98VLyGTG0cfbQmgE4hw/9GjP3IZr/eKn2ZR1PfOPzenze8KI6Pj4Xbirw==
X-Received: by 2002:a17:90b:3cc4:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38e1add8aeemr101308a91.7.1783984644079;
        Mon, 13 Jul 2026 16:17:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b8020sm518328a91.3.2026.07.13.16.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:17:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] mtd: mpc5121_nfc: use platform for irq and ioremap
Date: Mon, 13 Jul 2026 16:17:22 -0700
Message-ID: <20260713231722.1095470-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
and devm_ioremap() sequence with a single devm_platform_ioremap_resource()
call, which folds the resource lookup, region reservation and mapping into
one step and returns an ERR_PTR on failure, checked with IS_ERR() and
propagated via PTR_ERR().

Switch IRQ acquisition from irq_of_parse_and_map() to platform_get_irq(),
which only retrieves the interrupt the OF/platform core has already set up
rather than transferring mapping ownership to the driver. Drop the now
unneeded of_irq.h include.

This is behaviorally equivalent: the driver already reserved the region
with devm_request_mem_region(), so the non-overlapping reg requirement of
devm_platform_ioremap_resource() was already satisfied.

Drop the now-unused regs_paddr / regs_size locals, which previously only
fed the open-coded request/ioremap calls. Keep the linux/of_address.h
include, as of_iomap() is still used elsewhere in the driver.

Built for PowerPC (mpc512x_defconfig + CONFIG_MTD_NAND_MPC5121_NFC) with
LLVM=1; drivers/mtd/nand/raw/mpc5121_nfc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 39 +++++++++---------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 97b4e7f3e1bb..e6594548b7e0 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -23,7 +23,6 @@
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
 #include <asm/mpc5121.h>
@@ -618,14 +617,14 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	struct clk *clk;
 	struct device *dev = &op->dev;
 	struct mpc5121_nfc_prv *prv;
-	struct resource res;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
-	unsigned long regs_paddr, regs_size;
 	const __be32 *chips_no;
+	void __iomem *regs;
 	int resettime = 0;
 	int retval = 0;
 	int rev, len;
+	int irq;
 
 	/*
 	 * Check SoC revision. This driver supports only NFC
@@ -637,6 +636,14 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	regs = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	irq = platform_get_irq(op, 0);
+	if (irq < 0)
+		return irq;
+
 	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
 	if (!prv)
 		return -ENOMEM;
@@ -660,17 +667,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return retval;
 	}
 
-	prv->irq = irq_of_parse_and_map(dn, 0);
-	if (!prv->irq) {
-		dev_err(dev, "Error mapping IRQ!\n");
-		return -EINVAL;
-	}
-
-	retval = of_address_to_resource(dn, 0, &res);
-	if (retval) {
-		dev_err(dev, "Error parsing memory region!\n");
-		return retval;
-	}
+	prv->irq = irq;
 
 	chips_no = of_get_property(dn, "chips", &len);
 	if (!chips_no || len != sizeof(*chips_no)) {
@@ -678,19 +675,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -EINVAL;
 	}
 
-	regs_paddr = res.start;
-	regs_size = resource_size(&res);
-
-	if (!devm_request_mem_region(dev, regs_paddr, regs_size, DRV_NAME)) {
-		dev_err(dev, "Error requesting memory region!\n");
-		return -EBUSY;
-	}
-
-	prv->regs = devm_ioremap(dev, regs_paddr, regs_size);
-	if (!prv->regs) {
-		dev_err(dev, "Error mapping memory region!\n");
-		return -ENOMEM;
-	}
+	prv->regs = regs;
 
 	mtd->name = "MPC5121 NAND";
 	chip->legacy.dev_ready = mpc5121_nfc_dev_ready;
-- 
2.55.0

