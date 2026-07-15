Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A17A322B9F
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 01:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784077941; cv=none; b=e7HiSnE3JRDio+lVKsOLcxW3ZemNYqeNJsaHqiwXCc9C3bljAH5gIR252AGsY3uCoKfHS2z59qGMZbKCTxS2zBwvt4WMs0lgj4rltPAO6pAupoL+M5n4wamUCkosUPj4md2aAdSfAQyzWuVvEFc/pObE8/WcCXCOLfaIhy6mqY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784077941; c=relaxed/simple;
	bh=Y0hr3eibh9wzp7acg7/DbBtlU/G4AyrRZaiGVnITVR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KudPTlmwlD/OPHbAPvSlpvdD4kLAOS9z0abaeSeXswMN4tnfLLc2UdfNPB5ieDgPhXtvC2Fr1NcEmkOp4HOdcRbVTtK78T39UBuSDGnZPTUJ1YiZchUru0/5xb/CcpeqYHkOcVdaV05gg/W5NgYyVs2nL6XxddnQCQsclwp956A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cp5IAN75; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cp5IAN75"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso1998595a91.0
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 18:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784077938; x=1784682738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCUYlxb6BsnAbaXQaOLOynpXjnyMHB9hBKlRYLAY5As=;
        b=Cp5IAN75rheLW+v9QErcisgChyJWFO9KT0aJ/NtHntOGww6PVUDZRNs5BXpEfNzkhM
         09h4ViJxXZH3W0Q/0KV9MFH1XQ3vUOhIhU6D6wEp8VC52ZEJW6mHbEUE45/XznNVmF8g
         NxytDO8fmEGpdIwouAgGOr9TZRPkpDAPLVfSaSXLUTTXvQ4sCptr6V1uZAdfVHfrS2Ez
         u3feqKdgnSPzIe6f6Sfw4fUescRX7OwxB0HEKGTApP5DcwxxcVyysPCatW+RVstlZQO/
         tZdE+gkb9ceQNZc/V7FWsVU4F25IezuEM2COANUVUBO30dZSpGygYlf0tVf1vikEMBxp
         cS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784077938; x=1784682738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCUYlxb6BsnAbaXQaOLOynpXjnyMHB9hBKlRYLAY5As=;
        b=G2I2bEgfLPu5g2E2HX8QUuaOPB6TgKggp0VMwXRpMor6ObqFJqQz74AbnbgT16Cqu4
         i6AJuRe+8gid9jbk4XNVQO2GmKRP3lw6TwuTr5YA9SFl109CGyfT8pNTqx5yArFOZeZb
         EwlM/LzOCTfhgO+8UoSgPY1Vz6GTK/Iw6j8COWgx4nYtcD/rNAtNQLjj50Ul9wMSpWAE
         ga0LEjh9fEqZyLhUVcC/31z3JNzaACyeKfYpb84t1qNsaCSjDB+6gG1x11WbgjbhGjTy
         xoPdMeGHzSRnvSDqvoBLwNr5YOuNZRUGk1zDHcVtTQLPycK+JkhAO1Wj9KurkOo+q5Qw
         ABeg==
X-Forwarded-Encrypted: i=1; AHgh+RqguelQuD8zxr/Upt/oFnqvHLzsujoiAUmwBy4ONO0BvBJJHgGKBZVU4ef3BgE+5UMP2Akl@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8U1riW3xIDywsWoTm89X3yPBefH9vNwzhsrmx7VdN542dnGPd
	qetZcLDW38p0Z/nnI0N+nVA88i4ZmS3HWzEtxgkFtQ7v/61AoH1m+vsx
X-Gm-Gg: AfdE7ckoT0M24CrKVlWIg8CT9H377gIhnw7ZOeI6j7KUHpY4gJpsqxQednq6ntJivRu
	84kBmbDioeIaqs0x3iuA+tvDmVbVw2sUdGKPc1SRl2bKNS/m0Vg6XG6HTiMkZWhxT2F440D4twJ
	U23VSMeqz0zfv/jd6lACkZqI8XKLyONlg8emQaiGU30tTt89G8KKS/R/aUmSEwoK530qVUoIwyI
	NSSZ98jDEeAIOSraSzwXu0vXbxg2cWkW/mEDl8lT9JeSyPoRlC3ydBPFmNnUNR+vqPUi9OeGGYt
	wFn1arnmLtMTuMMgkRgwOWr432zce0o9kBpZVMMJUCPea8Hwag8/E5Qmnl8E2/qHV3Sj6I4nDuH
	2UyRKznphdFH2ZCixFTTMRaNEjoKh8VIc/t1mIl6/Ykh9kaeHw51DaRvffIAIlQ2S0ScArBGJ/J
	xqaR/F0uH0CVlyhVKOr14YVJZIWnr96T0i2TH62xJZ0vmG5ektZCQ9C2Jfb903Daf4rGPJ0xWXi
	xDAD+Au2INNwtl2CPTfkGIB438ikfFeqYJuOsxtpX3QWf4l1J5Ttjxy085/CsMh2Q==
X-Received: by 2002:a17:90b:51cb:b0:38e:7eb:d07b with SMTP id 98e67ed59e1d1-38e2a06179cmr845415a91.34.1784077937648;
        Tue, 14 Jul 2026 18:12:17 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1730accesm2235481a91.15.2026.07.14.18.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:12:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/UNIPHIER ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] PCI: dwc: uniphier: use fwnode API for legacy-interrupt-controller
Date: Tue, 14 Jul 2026 18:12:15 -0700
Message-ID: <20260715011215.1263935-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert uniphier_pcie_config_intx_irq() from the OF-specific to the
generic firmware-node API: of_get_child_by_name() to
device_get_named_child_node(), irq_of_parse_and_map() to
fwnode_irq_get(), of_fwnode_handle() on the child node to passing the
fwnode directly, and of_node_put() to fwnode_handle_put().

Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ
or a negative errno and never 0 (it rewrites 0 to -EINVAL), so check
pp->irq < 0 and propagate the error. pp->irq is an int, so the negative
value is preserved. Drop the now-unused np / dev_fwnode() locals, since
device_get_named_child_node() operates on the device directly.

Built for arm64 (defconfig + CONFIG_PCIE_UNIPHIER) with LLVM=1;
drivers/pci/controller/dwc/pcie-uniphier.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pci/controller/dwc/pcie-uniphier.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 297e7a3d9b36..6516264fdfc1 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -262,27 +262,27 @@ static int uniphier_pcie_config_intx_irq(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
-	struct device_node *np = pci->dev->of_node;
-	struct device_node *np_intc;
+	struct device *dev = pci->dev;
+	struct fwnode_handle *fw_intc;
 	int ret = 0;
 
-	np_intc = of_get_child_by_name(np, "legacy-interrupt-controller");
-	if (!np_intc) {
-		dev_err(pci->dev, "Failed to get legacy-interrupt-controller node\n");
+	fw_intc = device_get_named_child_node(dev, "legacy-interrupt-controller");
+	if (!fw_intc) {
+		dev_err(dev, "Failed to get legacy-interrupt-controller node\n");
 		return -EINVAL;
 	}
 
-	pp->irq = irq_of_parse_and_map(np_intc, 0);
-	if (!pp->irq) {
-		dev_err(pci->dev, "Failed to get an IRQ entry in legacy-interrupt-controller\n");
+	pp->irq = fwnode_irq_get(fw_intc, 0);
+	if (pp->irq < 0) {
+		dev_err(dev, "Failed to get an IRQ entry in legacy-interrupt-controller\n");
 		ret = -EINVAL;
 		goto out_put_node;
 	}
 
-	pcie->intx_irq_domain = irq_domain_create_linear(of_fwnode_handle(np_intc), PCI_NUM_INTX,
+	pcie->intx_irq_domain = irq_domain_create_linear(fw_intc, PCI_NUM_INTX,
 						&uniphier_intx_domain_ops, pp);
 	if (!pcie->intx_irq_domain) {
-		dev_err(pci->dev, "Failed to get INTx domain\n");
+		dev_err(dev, "Failed to get INTx domain\n");
 		ret = -ENODEV;
 		goto out_put_node;
 	}
@@ -291,7 +291,7 @@ static int uniphier_pcie_config_intx_irq(struct dw_pcie_rp *pp)
 					 pp);
 
 out_put_node:
-	of_node_put(np_intc);
+	fwnode_handle_put(fw_intc);
 	return ret;
 }
 
-- 
2.55.0

