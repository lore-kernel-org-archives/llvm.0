Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815094582C5
	for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 23:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784761939; cv=none; b=XxSB5tLSD9MyfpujPdUcwgfLOv0ksBkTrz9gnLETk9B9T0h82bM6y5302epVcPKScLfGgtjxjwEuk8U1j+H+y7Bp1HHhTzWqU8oiWkS6QQBEvIpA/BuDINILKeDuPsUNFXNrMLMWxQv8MCkEYvz6Z4gflRRVAkvHFcqmZjDQ5PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784761939; c=relaxed/simple;
	bh=8mJEiqWpJ3Uy4dQUJYF07RJY9w1WOi0WCyECqoz+Mms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jtx9NWvU3bGwDN9vwCL55kWHmi6BCa/XF3OepmSvYOKTZQziaWm4ywqcGMcX31k1CjVM15akwxVhe4VF/OmzOocZxGtL09Q7iw93Qw3uqw+oot7CwWL9e954cqQ4UKZFTyzMAuZQfxn8mOhXGNqmUuxk3M4QBdrF7ZfVRqkhOwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGabVT2v; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGabVT2v"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e04df8c46so12348b3a.2
        for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 16:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784761938; x=1785366738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zi7GSMqA7QuxsTCwMKttd2kWd+CObdR4i6iXZa5Nm8Q=;
        b=IGabVT2vK+pePoVBNPIdDrY+kv7m2IA7Dc0Rpmy3oYutDDcJdIUx5PcOFKa9Ci6qBR
         2fG+78HvxQTQcQRGpj7gkIFwNbY0L6p6aVdzeNr918qdoIuGO6jX10PeMcpe0Zf1XVzG
         QhMrOxnikOOxTpcY6hKfKzTR2t/lEeHmkNXBJO8u8a5uN/X9LW0SX45ADv2sFdHGmOoq
         cDABItpoLqifwWaCwbAVVHcspp6RUkRd8v4c8M1+8mNxOFQnXBIwpmMwxR8nVC9x319W
         V9XXTaZC8IJvPGlNQh+//nDOnMPw0lT4Y0pyOzppMM8/nefJ/5HN3PtP7EXXnevKIgch
         HyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784761938; x=1785366738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zi7GSMqA7QuxsTCwMKttd2kWd+CObdR4i6iXZa5Nm8Q=;
        b=hXzH7+BzJTyiDmh3TicTteMMLqvgVm85kWr419mXxn1rfP87SKbeIL+5LhGT2A56Nq
         /9iVg1CPfIXri2UemyvcjJCkkhq9Gx80f1OikLgRnKP9DDp/ywC5CjtsJR6dtgqP6iZ/
         zh8mFMfWSAzAXof0/+SpbxjpkId7J8JzFV6tsyeu61uaR4BDL3p/eMgj5PJPClOUNXHb
         ONT2JJNafCam4tgwyXzc09rqsy8io2ggV5v7i0Icz6V3TQj7b+HCOYxHOEXPXjWKhooY
         I0r8VA1cDYoOw0TaBxtuyZTg2TIERM03v6M9f92L+Q9KTjz0mK+6JWv1u+wibI/u5q3d
         McvA==
X-Forwarded-Encrypted: i=1; AHgh+RpFk010dptvRSeB5H/jOP3O8o2ZNRXpy1l9+B4anT+iuaoZx3baCWtN2b6168z1XwEaZ9cP@lists.linux.dev
X-Gm-Message-State: AOJu0YzRCO2kxNHlzcxrXssxIIOOW0xO/6uMUwflMwfMBxhzQsjw786g
	fTRHgRZ7VcrockRoRB8LpyZ7Wa7h3jMPYiKVv2geddR38GDLurBeT5dQ
X-Gm-Gg: AR+sD11OFjQyNQUcOCBW4TFcvg7KsF/RGwj3wKD+EYIXwKjjSPce+2fjKNqsK11a5Dm
	Rg8Ti9XzYl/ZSE7Ur0v4iob7QLWTWnJQs/ShOnKeBUT5Rh8LGiMtgVcEQEwb8UT+HcjAgjDH842
	xPxXrLjRfGkfUIx7Pj/umeLJOAvnToSZLx1GHABSBZxqfTPS2WlxagRuKTXBzcGXsQlGpA2xCvQ
	5j64zzTwrxGdzYB/q4xWivQI6znUAbz+kyuuzAFeO0+wOupXcxd55Dd903g6LddMy/YD1w48YZP
	XVTANzCGadhnrQyv1lHwqB7fBkhcepZxmJLCEXSf89jPiZhHoJQsJFkZZXfPamVTrlc+TqcMOTh
	ToUZEYfBHZZycn+ApqpyBtBpWm9mKF9h+3TX8lgyJ5eS7xt7Y06KWK2l8FxahCECm3UwwSGkG+3
	ZvrDVGnhPjPkQvy7o133xyb/8fi3NxhaxHbfUhIsR2B232tKrtw2ykn1lNOUuO3Cf26K5NgtIQI
	8ea0e0DWEQqky4qgXA5KfTroHMNoAzn8pbpbHyi8mFnXXekadj5uGw=
X-Received: by 2002:a05:6a20:e290:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3c44b18a0bfmr515631637.36.1784761937803;
        Wed, 22 Jul 2026 16:12:17 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb9656c076sm695300a12.19.2026.07.22.16.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:12:16 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] PCI: apple: use fwnode_irq_get() for port IRQ lookup
Date: Wed, 22 Jul 2026 16:12:14 -0700
Message-ID: <20260722231214.857760-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() with fwnode_irq_get() on the PCIe
controller device's fwnode, indexed by port->idx. This is equivalent
for an OF-backed fwnode but uses the generic firmware-node API.

Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ
or a negative errno and never 0 (it rewrites 0 to -EINVAL). So store
the result in an int and check for irq < 0, propagating the error
(including -EPROBE_DEFER) instead of the previous unsigned int with an
`if (!irq)` check that could never catch a negative failure.

Built for arm64 (defconfig + CONFIG_PCIE_APPLE) with LLVM=1;
drivers/pci/controller/pcie-apple.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pci/controller/pcie-apple.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index c2cffc0659f4..535acf274b78 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -400,14 +400,13 @@ static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
 {
 	struct fwnode_handle *fwnode = &port->np->fwnode;
 	struct apple_pcie *pcie = port->pcie;
-	unsigned int irq;
+	int irq;
 	u32 val = 0;
 
 	/* FIXME: consider moving each interrupt under each port */
-	irq = irq_of_parse_and_map(to_of_node(dev_fwnode(port->pcie->dev)),
-				   port->idx);
-	if (!irq)
-		return -ENXIO;
+	irq = fwnode_irq_get(dev_fwnode(pcie->dev), port->idx);
+	if (irq < 0)
+		return irq;
 
 	port->domain = irq_domain_create_linear(fwnode, 32,
 						&apple_port_irq_domain_ops,
-- 
2.55.0

