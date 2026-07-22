Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18CA17A2F6
	for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753208; cv=none; b=lR+QwpSgdK6l9SxrqfeGVQZi6gdAM10kVJytvwMjcOkEZNXr8G2Adw+MQqIla6sZtKh95NIJRQCphj2GVnn0LiEyGbP31Yxy/t0nHaXUSMuBEnnebu3aVpL2+diAA8b00nXcXLHNeZ1CRIQ5VlY2BedY3gpEuR2SXoQmGIb8rp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753208; c=relaxed/simple;
	bh=PeXIOyKaz0DZ+WMcNZyDsJa5j4VZrPReK3DmaeFUCAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d7+dcqMdo8Y9LqUDDqR9jDFCLiNuW7tOAWwjSTgTkzJUZ4iKrEeGey6D7RjEx2uG6E8RJIyLUvEoiazC4c5eGE1jJYFPKWHF+xL5ogbUmqiDj332k/be5ym7qjKNByIMfSv5fm9eCh4NLp2zCjpkTeLUi2jaM4021a3yRH2cVlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijvQYFuT; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijvQYFuT"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso9701907a91.3
        for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784753206; x=1785358006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJuQoK2RLmoQOUtCApw/BgcLgmg0HJ6NIMU5JaCgZHs=;
        b=ijvQYFuT+nhpI4X93bhENuaRArI7woVRSccW0zr1QIc6eWLs9eBoKEB6MP483fuvrc
         GNiQwuERm2kn9mb0ok1Q539uLPR6KwyCyUUn208MP4TXJkwTrtURra6MW9lR8zov6Yfe
         KBRtxb+I1isKvGkM94ZFTRXuMJ3bkYaRCgWuqdDNG0F2p6ws4yFRHRnVVTSSx47aGvdT
         F5QQ9CGlaknyOGEqTDRq+ZWkflfapt07wWGykAZe0bRHgeyvSq88tHvA7NdROh2qsuOA
         HjMSq4b40Yj0zROoyfUsSZyHpG5ZWsXgoit3T2AR6ziNeJoRDHo5eh8QwFodC3SWdr3c
         Hh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784753206; x=1785358006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJuQoK2RLmoQOUtCApw/BgcLgmg0HJ6NIMU5JaCgZHs=;
        b=snNZZ0cYdiLwodisx75oSEMScXBXPk22nZLqiZ/PuYfDUiLKbT8ncZ6DVyY57+Yk3F
         esUp8Cuo8DpeCUGNCtsrt1dIjmOTDsPM5RprTxH8qXWCAGFiyNftE63R2kk+DL1hz8RJ
         sHZRrn9cSXjE716gnBDoPjttSDjeDI2/7+fQOycWAeyizZX64q/EuCLOi3BlysqQpfLQ
         bSer5R2ALgulScFMr3nGqw5xa6j6Cq7LIoDnIdq5YYwEIODWctbXCi2XjRqVbi7TNeqT
         5NuwQvCksMBt3whtOXom96CZS5cqngDRD53X3kobViddn4ZsVzVq/jKWOWrL3sumSw6f
         U4UA==
X-Forwarded-Encrypted: i=1; AHgh+RqfyE3MIEkcyjTrIhhq15szoDlVvFOsRhpiSUsb2YWgll3/g4X5uIwBL4v2JDZLV1FgzXfK@lists.linux.dev
X-Gm-Message-State: AOJu0YyXfkIPzC6hqRJd4jxrTGBpkH9iNKjVTN03CvXiYhY/tLA7evyw
	QuHcR3mu+h/gOxIqacBm4Z8tMceF9/VC4KYDGBpfvHXeqky0Ed2t9czM
X-Gm-Gg: AR+sD10ykfT6tizyOXdEFva9b/I7+pmDOCu05J8gdPHUSZK9rhLfMNdOkYuuLuh/mJB
	QBcASpSvPF+V5Oj7yFX5nuW41lQntMxtkAYWqtVx0vhpbykHdCdJ8DGtDWaeZ3fDNVFX0T/3+Yl
	iuF59T7h/qNIr1Mwd7G4VudbMu028CWfHzoaLM/d0FjjFmuZBLB3vQXQRCEDLcguAMwgb1Fhc6h
	adbAiGUtt5h82+JbQuI4nSgYAMzgDtY9rC3HdNNxGLui5B3CfEC0tMRR4q4J3TYpBXpoTaSAq2X
	cT0+AbMLhcI/jDp8SpqUND536MZgsh5aUqirjBku87iXRMhfchc9JvwJijVLT2v5SVpu9gmU5vK
	nyiawte/gDAYoxhW3VO+Gm8ftpjT0t7mpN6dRqkL8leYgiiRJ80zk2+ctnxOeSOfwGTI6yT/vb8
	4tTVk2btuCm9cNjpaDyptRpgRYzqObMh/1TjKdRMkl6lnRavfj8wOlOyXQOPGuV5OYGmysge69e
	OhfFOxUxi6UIYfpqYMDb5RbyihT40nqYzgxTZM5/UhetaRXwqHM8v0=
X-Received: by 2002:a17:90b:2583:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38ec6529677mr298971a91.19.1784753206027;
        Wed, 22 Jul 2026 13:46:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e921ac370sm3840599a91.17.2026.07.22.13.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:46:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] mmc: moxart: use platform helpers for resource and IRQ
Date: Wed, 22 Jul 2026 13:46:43 -0700
Message-ID: <20260722204643.502879-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace of_address_to_resource() and the following devm_ioremap_resource()
with a single devm_platform_get_and_ioremap_resource() call in
moxart_probe(). This requests the register region and maps it once, which
is equivalent to the previous devm_ioremap_resource() behavior, and drops
the now-redundant separate resource lookup.

Similarly replace irq_of_parse_and_map() with platform_get_irq(), which
returns a negative errno on failure (including -EPROBE_DEFER) instead of
0, and tighten the error check to irq < 0.

Both substitutions are equivalent for a DT-backed platform device. The
remaining OF usage (mmc_of_parse() and the of_device_id table) is covered
by already-included headers, so linux/of_address.h and linux/of_irq.h
are dropped.

No functional change; the MMC register window is requested and mapped
exactly once, so there is no overlapping region claim.

Built for ARM (allmodconfig + CONFIG_MMC_MOXART) with LLVM=1;
drivers/mmc/host/moxart-mmc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mmc/host/moxart-mmc.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.c
index 4a4d8b19b18c..28aed13549a6 100644
--- a/drivers/mmc/host/moxart-mmc.c
+++ b/drivers/mmc/host/moxart-mmc.c
@@ -26,8 +26,6 @@
 #include <linux/mmc/sd.h>
 #include <linux/sched.h>
 #include <linux/io.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/clk.h>
 #include <linux/bitops.h>
 #include <linux/of_dma.h>
@@ -555,8 +553,7 @@ static const struct mmc_host_ops moxart_ops = {
 static int moxart_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node;
-	struct resource res_mmc;
+	struct resource *res_mmc;
 	struct mmc_host *mmc;
 	struct moxart_host *host = NULL;
 	struct dma_slave_config cfg;
@@ -565,30 +562,24 @@ static int moxart_probe(struct platform_device *pdev)
 	int irq, ret;
 	u32 i;
 
+	reg_mmc = devm_platform_get_and_ioremap_resource(pdev, 0, &res_mmc);
+	if (IS_ERR(reg_mmc))
+		return PTR_ERR(reg_mmc);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	mmc = devm_mmc_alloc_host(dev, sizeof(*host));
 	if (!mmc) {
 		dev_err(dev, "devm_mmc_alloc_host failed\n");
 		return -ENOMEM;
 	}
 
-	ret = of_address_to_resource(node, 0, &res_mmc);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "of_address_to_resource failed\n");
-
-	irq = irq_of_parse_and_map(node, 0);
-	if (irq <= 0)
-		return dev_err_probe(dev, -EINVAL,
-				     "irq_of_parse_and_map failed\n");
-
 	clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	reg_mmc = devm_ioremap_resource(dev, &res_mmc);
-	if (IS_ERR(reg_mmc))
-		return PTR_ERR(reg_mmc);
-
 	ret = mmc_of_parse(mmc);
 	if (ret)
 		return ret;
@@ -596,7 +587,7 @@ static int moxart_probe(struct platform_device *pdev)
 	host = mmc_priv(mmc);
 	host->mmc = mmc;
 	host->base = reg_mmc;
-	host->reg_phys = res_mmc.start;
+	host->reg_phys = res_mmc->start;
 	host->timeout = msecs_to_jiffies(1000);
 	host->sysclk = clk_get_rate(clk);
 	host->fifo_width = readl(host->base + REG_FEATURE) << 2;
-- 
2.55.0

