Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3B71917CD
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 01:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784078222; cv=none; b=W7s2xRxLH+Mabwlceerqr4Dd/VsHVYrCkSn+OMCyCKxuYvvn2P/pWroRw7oHipocMtUMq/TfxxlTXgknIVQNR0fOAhpU5anRHNDKOIwvxy/g9BG5xOJXkzvZKu2ETIOXws00FRJu6G8X6hBYZK9BZ1Sb1MTYTWpJzj9p86aFa6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784078222; c=relaxed/simple;
	bh=BP/51ZrzCuUH18tmFa47SYVzg6KlW1yHQnc30QxX/js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rxTK4o4hN7tEsDKbq+CRbul/Nc1HphvKsIwm/9CB/fR+k6TG0eWFAeSzVhzr5gTzepalI/cxFqFCyE3tm732jMUOCz2y0jMgbA6NKavNavBxIox6ubMTx3owDDrjuNTVFZs90XD9pa58fTrxGkChvle8ge8vsi4hbrA+2l+XHLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZr4Ksc/; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZr4Ksc/"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca957432c7fso3357879a12.1
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 18:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784078220; x=1784683020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwJBrQ0pKijpyzFHsFaJHm7N376wuBcGnxSFAS9F0K4=;
        b=IZr4Ksc/PAd4PB2wMKHFgMqGl8yOxg9th4n3md6UGqOh/n3t6HS9dpyRDIgYyfFuje
         i1kBhqVlQzRGYDnBRrPIkP5E8maWAItFyglqNKUfW3UYceKWB25IPyHIrQsJOzOjJdaB
         GJDvll8HUwWZZgT/aYbIkapvHQxmD5xcQgqyB3AkbE9+5D2GvE+IDiSmXaBmi+oIuGdR
         h4x2sAFbMTsd7uPz7/rzdlIUC/6dE+OGsn0Q//F29oA8xE/FMlkQifYgbe1rSzHYmS6Y
         kYIHb7OAOIZhXrx41xb4n3A941KtS2kFJ2U2G5je5cX2mJo0ipKWwxAIxMZ5nVzX3Tgi
         DUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078220; x=1784683020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwJBrQ0pKijpyzFHsFaJHm7N376wuBcGnxSFAS9F0K4=;
        b=RKgKpDsDPEbWRt8dZROSAW2UM9XP22bAUHqndq9ufXWRenhHgJjUeIG8/bbIL0sFaT
         MvlaD6jl0fMlHVI2VXXE/o1hMe31OgbWGbDBQx9F/HPYAW+PX9ezrbP7rJBOGD8cGW7s
         4OKR9zW24m7wMRN4bIf25031LTQtK2Fqz7pDlNnTgheXFsCkqx39hZFj1lfVr5KWgkgW
         6IHXE44MdA8usu5d+NMUmZaEoSmvmvyYn+jn6YrUlE4DuaRRXY7GoYuXqj15vJdGBjIl
         3PRqMsJ83Ho0a3FC368rHP8ICeyz7nr8vva0cH4vh8gGDPpF1KRdAd8K7Hsg1pPBpJoX
         FF/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+XL7iQZ6v9zYaxjdMzlsbrjwnmd7pNYqRfOGTgLReelUOzT2eFciST3SUkZPq+mkOqH6/@lists.linux.dev
X-Gm-Message-State: AOJu0YzpSm+GLfwj48cG7pnEj19uboGrNhxPo0kutHP8OBwF4lgHIYtl
	ahUjlM7ioJeMu0G8YdOfVMat0gCU9kFBDdAXTER45vTQew1fNRDypt6w
X-Gm-Gg: AfdE7cnerLWh4+FNU2FoH3gCPS+Xha3cJHX5Ix6jDu1v7zgSJNYD+dIy5yLZKvbswM+
	Nip86QtKzP14A9DQ/0rbmGUNEZep12kC2oBzdSyq1rZFxURYmW+TH5mcwg+INNylZirkRgpkwR6
	bYz5t6HBPP+m4KLVw4o1hCfB7KbCmfftGEcvyV/DhwHST78qCTAVFuc74Q3ppK9P26jkg0hMgfW
	A2STxB32qjfPVl3JhXLZCGKnNDHVOu4JZ1B9dVzxeWZ9dF8SxYGIuQlfwA9+GFJV4zyTJRBl+fe
	U8xUFK/0/OkDrnB72UbVDNHY7fc+qzDCxS5SqtINYedK1Z4kj+WH6AvCuicxLhIdJVTu96Vkp5g
	D9Zp68AFHkd6rrmcQ8o9QzpmstkHSPRpoGFu7YNfXL/W7VqBtpwdW6Xa5l5RoWj4ymye4mk5w8d
	WMvEk37RJ0MEmc2Psbfe/rKl5HaNeENQFqXWxmXuP08RWo2LSYFGhz0FaJvgRiQgOW+3/Apc1/e
	aHJZ/RtutXYVbsUy/fll0kD1hazyeqNIG2DdZk223BVpRcZPvwXRfpNFxfO/9QlmA==
X-Received: by 2002:a05:6a21:7a9b:b0:3bf:64cd:c45e with SMTP id adf61e73a8af0-3c35731bd15mr5639748637.4.1784078220446;
        Tue, 14 Jul 2026 18:17:00 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm83586250eec.6.2026.07.14.18.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:16:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-ide@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ata: ahci_da850: use devm_platform_ioremap_resource()
Date: Tue, 14 Jul 2026 18:16:58 -0700
Message-ID: <20260715011658.1284298-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource(IORESOURCE_MEM, 1) plus
devm_ioremap() sequence with devm_platform_ioremap_resource(pdev, 1),
which looks up resource index 1 (the power-down control register),
reserves it and maps it in one call, returning an ERR_PTR checked with
IS_ERR()/PTR_ERR(). Resource index 0 (the AHCI register block) is still
mapped separately as hpriv->mmio via ahci_platform_get_resources().

Built for ARM (davinci_all_defconfig + CONFIG_AHCI_DA850) with LLVM=1;
drivers/ata/ahci_da850.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/ata/ahci_da850.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/ata/ahci_da850.c b/drivers/ata/ahci_da850.c
index f97566c420f8..4e53ff96d712 100644
--- a/drivers/ata/ahci_da850.c
+++ b/drivers/ata/ahci_da850.c
@@ -162,7 +162,6 @@ static int ahci_da850_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct ahci_host_priv *hpriv;
 	void __iomem *pwrdn_reg;
-	struct resource *res;
 	u32 mpy;
 	int rc;
 
@@ -198,22 +197,14 @@ static int ahci_da850_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	pwrdn_reg = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(pwrdn_reg))
+		return PTR_ERR(pwrdn_reg);
+
 	rc = ahci_platform_enable_resources(hpriv);
 	if (rc)
 		return rc;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res) {
-		rc = -ENODEV;
-		goto disable_resources;
-	}
-
-	pwrdn_reg = devm_ioremap(dev, res->start, resource_size(res));
-	if (!pwrdn_reg) {
-		rc = -ENOMEM;
-		goto disable_resources;
-	}
-
 	da850_sata_init(dev, pwrdn_reg, hpriv->mmio, mpy);
 
 	rc = ahci_platform_init_host(pdev, hpriv, &ahci_da850_port_info,
-- 
2.55.0

