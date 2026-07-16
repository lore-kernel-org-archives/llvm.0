Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400683AFAEC
	for <llvm@lists.linux.dev>; Thu, 16 Jul 2026 20:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235500; cv=none; b=m7zFFmr+RNPybOL1TRO8a7rDGjIzKmFS58mZV06KDL8I48a0rPHtjguxj0wG7/v6yCF80saqeTP0kxiZoslmNThwFrfJIcBGiE2wbviHCyJF+t+I6/avq3e9av0ZWnBYqrcwNuX3j/lb+HhlIwfE/YC9Fx/oliWYYu4k9rN9QCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235500; c=relaxed/simple;
	bh=VOvAMvfYeW8jwurQgtx2Ch7WysVlLW2oA9Xl1uUCbDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NWp/MglVn8DzTF2ip4H+xXK/tqMl7Xm5ICwHAGp/JBY0iEL1tFmFfgcxfr+suXAFs6OWQPPCKO0s+eqq3TDCoR4Wdp3RL5irih1mN0t3AfjAmujkoQsM5ZnwLxu6bzPEBK2H2Ru5Bpkq5LsmUhbpQfwN6pdpPab/iUpfS6yLkw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoL+f74R; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoL+f74R"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so6207862a91.2
        for <llvm@lists.linux.dev>; Thu, 16 Jul 2026 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784235494; x=1784840294; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkicxomHbCJpRgQf830JSQitBFyDcDau5PyT3QSlyao=;
        b=JoL+f74R6D0uOnux0ncEugVWDkKJ7UMIpkcfyx7y1Y9YGoXHuMuFhf6dKhLbJ5YhLa
         AkndRX9JgW3Zq8gfWQLnJpqatV8oS6x4ZRCHbHmlg6IjdnGYYVAqAPzekyefl6YMI8GX
         J03IyrWAPzw1lIMmf5oY+nZnBFsR1mctW3DYFR3+sydDeVQGR+YIhNwCZftNx8uczV4o
         o4fv4hJP9CorsYtKn1dqnjYjq5To1u5CR8/wTlFQKvv41hNs4KQ6PA4YF9KHFiwAhx3O
         pf4VDx86J2gY3kZ1PLzyuW/sMuwGmskKIN4jcYhZGAy3CK0nNNl/ncr2LNIs6/dEpDzu
         puyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784235494; x=1784840294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkicxomHbCJpRgQf830JSQitBFyDcDau5PyT3QSlyao=;
        b=WFTMATOadTO5TjYPx46GCvBP0s2E8Ws5bDBl6G3wXAXysOKjfuvgyZvf61ifwODUFl
         CmzmP4dL57H2wB6XkBORAtZQjc7TH3qQbAeWErMO8VkRjQUVY1IoBmpyKqy1gQDaJtIg
         JJrXu3bRcooleWd/zbMVmuZolhMzWnfEUsFqFI///3iuAsaixcCwewHa3q8JGm50vF5C
         Qkqmdc+rOfap+NtdbgSTmKxFU03oM6rywH62f7mAsyMwMmzyjCxklxOooNGdNfhWXcJY
         6uDQDeedpZvU5c6dpxi2cZF2dWWRO9UZFEMJ4sDBgNs0deGn1qOjxqkshogiXoot3YBS
         t3wg==
X-Forwarded-Encrypted: i=1; AHgh+RqelQU0kGxTkzZVYoRcFW5HMRiCfQ1eqSKPvWB8l5Kr8jfgCv4wswmMzzXk4p72hatFs5V6@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8xvgZJAl78ntMxyn9BS0xDr+rDILrQ6qN5Ee/CH7dyH8//3yx
	Ztgkz3qE33Q2QPYcXNuYiYYBjXpvV+L3OH9d84UzsISf5rKoC7Sqm0DI
X-Gm-Gg: AfdE7cn3wZZHSmk4vZPeiOTk+hGfGwp5IygPMyUyL7CLI1Mjz5XIYUI+vU33ZHZx/WK
	emXpuRQXFLyhsi/UFua3U9GTz2LaHbk3PmyIFPdyxF/IP26rChrFd71lLM26WGZw2G2srT5Dr6Y
	cX88A2ENuSudDqW7/Fr8tLa0ss5PnvFXlNN/aE06GgNwJ8yjFaDandGPWGaiblmoHIHHDgegtpM
	KyGtjRLTwcqLEvo/Syrsl5x7dPU12gj7iOpWnq5eLtwVyoHqgjrYa10jTdqhXl7H9uIPxUaRctn
	ZG0HruznCS1if5JOgmgSsW38EPyn/d/xCcEsAgSavxTvkgBVUkoIki6sJt0Wo89lVedI+PxAXVp
	vVXGFREHMhPgS0XwYDsy89U1rjSQi1k7AhhHR7QHZcaLWf+BoJi89nDlhgB4kEmmsWf1FsVkJLR
	HocX9AsNl/5s/mGBLQ6tf08rEI1/Taa/y872SzjB3MiOcGi5paMxEffZ9miYo0avQVfm8E5TJ0Z
	aBs9rnOSjI60Rcqfhwc3KvWyf+UzD2nTccSGLlyoXg6ouC6WkbkKiM=
X-Received: by 2002:a17:90b:510a:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38e2a10a4b0mr7707701a91.38.1784235493976;
        Thu, 16 Jul 2026 13:58:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39dee6a9sm1849749a91.2.2026.07.16.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:58:13 -0700 (PDT)
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
Subject: [PATCHv2] PCI: xilinx: use fwnode_irq_get() for INTx IRQ lookup
Date: Thu, 16 Jul 2026 13:58:11 -0700
Message-ID: <20260716205811.800920-1-rosenp@gmail.com>
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
 v2: use dev_err_probe to handle EPROBE_DEFER.
 drivers/pci/controller/pcie-xilinx.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index 4aa139abac16..58532296182f 100644
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
@@ -585,10 +588,8 @@ static int xilinx_pcie_probe(struct platform_device *pdev)
 	pcie->dev = dev;
 
 	err = xilinx_pcie_parse_dt(pcie);
-	if (err) {
-		dev_err(dev, "Parsing DT failed\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "Parsing DT failed\n");
 
 	xilinx_pcie_init_port(pcie);
 
-- 
2.55.0

