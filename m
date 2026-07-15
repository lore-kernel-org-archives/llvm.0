Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD66305660
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 01:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784077908; cv=none; b=F1sC2H2kwCXJBQdQPqJIJLaDqs4YQSRPRYU9+q6hQJPrAvuUrgsOlPCtK6hz49W2GRAaJsVC2Nv5e9jnnSuUSLC3B8sw7ClgF6kJEi4sadE5Mh3N+KfHyrWVYJSb/TvYu6MILjjZtkaNPXRXiNT+ebURqjn2wpkZqca3mZxMk7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784077908; c=relaxed/simple;
	bh=9PAzvIUeGeWlH6fTPvnNN6J8nWpRGsBqz4064BPR1Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hj5pad+DeRRdBGnVYiYQymSqhZJdaMqf3mWkULcD6UKxmLjAyh/+N0vcHcfSqjCLv3rJsB/+6f5sbpLeaVzvDiruqY3h4CZPQhmZiEo3pe9Kym0jxZCz/GL1QfOECcW36EODC6dr1z7/CCFzdh6ryn6MY44mGAXcIcHV0u8BvrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yr8s9ArX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yr8s9ArX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc6dd436c6so18817265ad.2
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784077904; x=1784682704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7t3rulmgzdudnQm0VJU/fmU5yA2DaWNz98HbbPrWp/M=;
        b=Yr8s9ArXe+Xrq2yIRdhtLrhhTQEJnj4etBH6xapcXn8wuMPcLjS8i4a6TD8GWEraH2
         wHrMQHvtT8ftitKwOv2zTwkGEJpbaVJSxpXPX4bOxtQRQ3TXmRskDwQUzDosqrFLjcCn
         GDXaVp60Vl+bgWPxxBB+O/JTYhVUg0jbPZqWcrwOFgcuNsKfc8rNswO7cnMpKsty8PAt
         xSwg/QP6GZt3ap1IPV2mO/XOZj6PIuNeAMhrsyfS8Z9/yKyQ9Tn4xdeRnr4p6Os4xqVr
         6+s+M1E2f6w2A66t4fi4B3mbzuA7JNUUhmB/FabGkpypGyTZp+UZpM41tC3eCLvZsBou
         d+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784077904; x=1784682704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7t3rulmgzdudnQm0VJU/fmU5yA2DaWNz98HbbPrWp/M=;
        b=p8boViGk/fMhm27+fkYqJ4Ps1OLTiyabS6xsC6XDUR8FMlUo1UiBzsP5Q32bDnWcIT
         mizskKCT3PYUIMxdCj+hNFhPrzq2DDoPab0sA2XTD/2k1FwYIKsW4l9voufX2XIe8bDF
         tNQKGLRhjh7j50oqxFHYL0tvHOCbiSFAHF+jYriWmKSJbRcsQP5WqQgrBGJuuQv16cvV
         MW+7m/WOTX7LgB+JgrpplziBsUH4dGb6ZQ3aT7yB8dC2VdSJ3kiMtoaPwa1C13T3D500
         Qks8Vwa7xa1TReMnyAOD5Gzo2LHV85GQObzEco8F7UGd5Y8H6NWQRvxoTP0EU0RFyAoI
         Jehg==
X-Forwarded-Encrypted: i=1; AHgh+RrPOfCQXCFyDuz2WdGMmWeYUCNqmKqw7I4j8VeJ9a1VugEMehVsqNZ0et3AA+uIwel9XL3u@lists.linux.dev
X-Gm-Message-State: AOJu0YxV4KaKpSp6sy/xFEO5E0x9My72lS6xDkpDVYe0msf1hNYt+oaN
	CDH4eWpExLX5wDYnXWXsnMtrlC0CiJ+PZUBDPAbi9uvmiX/HtTB8nJsT
X-Gm-Gg: AfdE7cl41S6o9HzAbASHrp9jzQ8j1y/6vq4UTARweYJ1CTPNyia8JTyXzR4q0nQhRzP
	bdD8ngrvdL+NI2B/3ifuzRX8dLS+xCOuzktXUnDEK2rAikuvqBHOsiHKaHqSkf/qW5w16Lh5m3x
	lPhKDk2SpZviHEOsg9NEs8lDoNuSzLRkyK/Y8t+OX+LJef6fakv/lY2Vh66ZZxAcGb6EcuYcJIP
	KaXf91d9aTAJoEX1ez4OvlOjLk3Rf8oPuS0jvXQMgEvDQaF6DQHKXBCHxNF8hnl22MHafDfrSzA
	0zYZbXoO9sP7UYaeZRJC9MS8YMYKiIdl8na647fYxOW4aZZ+NPFfdCGAR3vYLKOmjtNJgv/Xdk2
	nLZlc7v1y7FHjTEO4gtLhV060oARqkqbnZSwBDadiDvns5IYvIMqrv4dRIFbhg7PqnjMoVuViM5
	hBYGpyoIJGmQkBlEKSPMtLknW7nisUx2DXoiav6B24M9gd2EA80E3lI3FbWsebzR5lg5UVhTGxQ
	ms/nwTBmczhiLzvumNTQpij36Q1zJE6xfb97dYmYGGOupLL/ja92CxzYkAI7j+b2A==
X-Received: by 2002:a17:902:f706:b0:2c9:97a8:afef with SMTP id d9443c01a7336-2ce9f3c2c44mr142226605ad.40.1784077904158;
        Tue, 14 Jul 2026 18:11:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cee5ccb579sm26357165ad.52.2026.07.14.18.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:11:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Michal Simek <michal.simek@amd.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] PCI: xilinx: use fwnode_irq_get() for INTx IRQ lookup
Date: Tue, 14 Jul 2026 18:11:41 -0700
Message-ID: <20260715011142.1261469-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev), 0)
in xilinx_pcie_parse_dt(). For an OF-backed device this is equivalent to
the previous call, but uses the generic firmware-node API.

Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ or
a negative errno and never 0 (it rewrites 0 to -EINVAL). Store the result
in an int and check for irq < 0, returning the error (including
-EPROBE_DEFER). This also adds the error handling the previous code
lacked, where irq_of_parse_and_map() failures were passed straight into
devm_request_irq().

Built for ARM (multi_v7_defconfig + CONFIG_PCIE_XILINX) with LLVM=1;
drivers/pci/controller/pcie-xilinx.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pci/controller/pcie-xilinx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 4aa139abac16..a7b069f7673a 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -20,10 +20,10 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
-#include <linux/of_irq.h>
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include "../pci.h"
 
@@ -535,7 +535,7 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct device_node *node = dev->of_node;
 	struct resource regs;
-	unsigned int irq;
+	int irq;
 	int err;
 
 	err = of_address_to_resource(node, 0, &regs);
@@ -548,7 +548,10 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie *pcie)
 	if (IS_ERR(pcie->reg_base))
 		return PTR_ERR(pcie->reg_base);
 
-	irq = irq_of_parse_and_map(node, 0);
+	irq = fwnode_irq_get(dev_fwnode(dev), 0);
+	if (irq < 0)
+		return irq;
+
 	err = devm_request_irq(dev, irq, xilinx_pcie_intr_handler,
 			       IRQF_SHARED | IRQF_NO_THREAD,
 			       "xilinx-pcie", pcie);
-- 
2.55.0

