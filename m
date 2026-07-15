Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25113320A0E
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 01:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784078028; cv=none; b=E+EAscB+V/q/rpxieXHwVxo0ykXPJFNq/ujUo2oDAr6gN9mySxlM6GQtxI1idlWzNOyHKtci+sRGeKUsBxSuQn5+urayCU8ORXDL0TYMXPw72te7QACGPL5GN2TXnCamxp+1ODwcw0aczqW80HQ8OK1xMaoBAEkdIGw8UNvT5Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784078028; c=relaxed/simple;
	bh=P43JCHOf5w5P2ZjP5fROoPb0nb32cDjMMB3GL/AOF+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jXAJWGSUCV8flChapopJeu7rI5upHNQ0ePcOxNKE6eJe9UsCwnCP5leWvzmKC8uW+IvEsUSQuEstq5ckiCTJ3sKHXw6C2WmggoZCtgMZpXIJFtQlDARU89ADJC5kXE498eQCZJqm9N8EdExdSilnl4Hd/Y5a59ushwzRIvwN3p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C58fR8fB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C58fR8fB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2360845a91.3
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 18:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784078026; x=1784682826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIHLfJs4cYwuricbvRyPu6UapQ2vEVELHf2OcqtSJ/8=;
        b=C58fR8fB5IuNE5WhtqxRKpdKvBgASz1Wa3XYlhK/kHbO0Sau1vkXbCmb/TYS5tyoGz
         REnEyPX4EEdyC7szbdMKZSQOrWZvi+t5IrfC8dDBtdTD4CRzFKdupUIW5BtQneXLGOF/
         1EsTDC8RfWAPd4XL1acnCbc2LzyIRuV2ry9tAghRgY3Sn2mZMyiS0N+TbncDn0GIrO7h
         unFgwhCmekvo49qHqCHVZ08CaRC9AwZgcQIff/85yl/buGln2sJWz+sV6yVw9DYmkukF
         WdKmT84qkrs5S+3Z/Ybo6jU7JyJkDe4ksRs9280Gi9w1cwsxJBwlfUNACc/8sYfdlbj1
         ljQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078026; x=1784682826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIHLfJs4cYwuricbvRyPu6UapQ2vEVELHf2OcqtSJ/8=;
        b=RAxbl01T7HaWV/f4dYqI9xQ2wCce1M53lvYvCptMoMGjVv7s96UhofzlxYZ0NjOPWh
         7m+nisVMi+G1ERtF9/vUt7CIIXmHKt2uyniMPNF7L/9gCZLVa/Cq41eB21Inb9ZH8I/k
         ukae8SoLwM9BeR4m1O0kXfWCrlT7BfKc6WUyaocr0C0oOq61ToP/B1gff1DvJqW4I5nm
         aJWAKFZt/1FLDLkZSyE6rD8xM+je+rWv+9NMYkFMpbqZbuHSJyGTbxMjxg40kEV0SiCj
         Oy1cjO8SixIMRgjvB791CeKHf3OVpBrLJYKGnGHV2CC5wEfZ5Zgr51/XPUEFzL5wgs+J
         AEqA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2q6VkpqBmUL7mpB2P8TDRmAGEBwo68KwzHfV9oe9Jm/zVoIorrd0MrefIxLkulBpen17M@lists.linux.dev
X-Gm-Message-State: AOJu0YwybCuadHnJ85JUAB1jhEjBxrbUXEGbcOqKoZ10lhDTf5fhPSik
	kasvBGrTULvFrJqsLTArXk2NZ6X8leqt12kDznf4w+fNknFW6oKjPu9q
X-Gm-Gg: AfdE7cm0wNQI4+8dbTh6JXRoOpBKZajzSr0J7S8/PDAFib2uj3TSC9lVS2j10AEaOjx
	Fhf+QCyVEBq++3CWMt6ROcfgff+T0Pq1EDNYhZhBYeM7Mq1UgcgEFFBn7QC8+Mdj7P2NAVtut/A
	lM/z+RTTKtrISVOT04f0Djqh3UyVw/mKZhlbV1DBwp92G6Y4kj6OSurh6I966V5ufcJK1wUgPwl
	5GqdsXxhUtjZ4oVMAV8chOA4olgT0jiNhL8m8z6Q4wE9eUujebKVAmKB5OkfpL2IDWfgq7rguC4
	QR+JAmMj8cCE/ScUxfoS23gyY8pj10JbLxaIvNPxl97tNr9TP2j2ns36fGXKRbvMCQBB9zZJl4L
	3tdPwodTQdHyMvmOmu4aN7gCU17JeNp2mynw0NIlSqKijo9M2vDFlXYfkzLshZPfMfghJB17KVx
	QHoCvLaEDaxuJc9hoyILZCt/p405cpDHa7q5pDfCYtm4HZAJ18h5ldwBm6ruL/+toXKPZHSBjYe
	QCeerIZOJvdo3KnL6XXGJkRVry1zMiON/reuQyd/PK2XmaTsDsouxpPP4vX28QZsBid5yLdztm4
X-Received: by 2002:a17:90b:534d:b0:387:e0cb:7f6 with SMTP id 98e67ed59e1d1-38e17fabbd6mr5420793a91.42.1784078026383;
        Tue, 14 Jul 2026 18:13:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1730acfesm2185900a91.14.2026.07.14.18.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:13:45 -0700 (PDT)
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
Subject: [PATCH] ata: pata_pxa: use devm_platform_ioremap_resource
Date: Tue, 14 Jul 2026 18:13:43 -0700
Message-ID: <20260715011343.1270261-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequences for the CMD and CTL ports with devm_platform_ioremap_resource(),
which fetches the resource, requests the region and maps it in one call.
Switch the error checks to IS_ERR()/PTR_ERR() accordingly and drop the
now-unused cmd_res and ctl_res variables.

The DMA port keeps using devm_ioremap() as its resource is
IORESOURCE_DMA. The CMD (res 0) and CTL (res 1) MEM resources are
disjoint in the ATA task-file layout, so the added region reservation
in devm_ioremap_resource() does not introduce overlap failures.

Built for ARM (drivers/ata/pata_pxa.o) with LLVM=1.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/ata/pata_pxa.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/ata/pata_pxa.c b/drivers/ata/pata_pxa.c
index 9f63bdfb8576..c816997dc0a9 100644
--- a/drivers/ata/pata_pxa.c
+++ b/drivers/ata/pata_pxa.c
@@ -161,8 +161,6 @@ static int pxa_ata_probe(struct platform_device *pdev)
 	struct ata_host *host;
 	struct ata_port *ap;
 	struct pata_pxa_data *data;
-	struct resource *cmd_res;
-	struct resource *ctl_res;
 	struct resource *dma_res;
 	struct pata_pxa_pdata *pdata = dev_get_platdata(&pdev->dev);
 	struct dma_slave_config	config;
@@ -181,20 +179,6 @@ static int pxa_ata_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/*
-	 * CMD port base address
-	 */
-	cmd_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (unlikely(cmd_res == NULL))
-		return -EINVAL;
-
-	/*
-	 * CTL port base address
-	 */
-	ctl_res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (unlikely(ctl_res == NULL))
-		return -EINVAL;
-
 	/*
 	 * DMA port base address
 	 */
@@ -221,14 +205,12 @@ static int pxa_ata_probe(struct platform_device *pdev)
 	ap->pio_mask	= ATA_PIO4;
 	ap->mwdma_mask	= ATA_MWDMA2;
 
-	ap->ioaddr.cmd_addr	= devm_ioremap(&pdev->dev, cmd_res->start,
-						resource_size(cmd_res));
-	if (!ap->ioaddr.cmd_addr)
-		return -ENOMEM;
-	ap->ioaddr.ctl_addr	= devm_ioremap(&pdev->dev, ctl_res->start,
-						resource_size(ctl_res));
-	if (!ap->ioaddr.ctl_addr)
-		return -ENOMEM;
+	ap->ioaddr.cmd_addr	= devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ap->ioaddr.cmd_addr))
+		return PTR_ERR(ap->ioaddr.cmd_addr);
+	ap->ioaddr.ctl_addr	= devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(ap->ioaddr.ctl_addr))
+		return PTR_ERR(ap->ioaddr.ctl_addr);
 	ap->ioaddr.bmdma_addr	= devm_ioremap(&pdev->dev, dma_res->start,
 						resource_size(dma_res));
 	if (!ap->ioaddr.bmdma_addr)
-- 
2.55.0

