Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBED41D640
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 23:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784072635; cv=none; b=L473dnnjYTO+PK18Jc9ZPM9am/aD/wcmP+Nug5KBpGWGMF7b4nF2lTOsvwl0WQ4tFZkXrlDW4CRRKRSWBMrKGJrdH7M2zpzgW+iS6++nG6qPvwKfXhFtgNDF6fYccNnatDxMtf1VPbyHiySXnnF/gUYpn77OKDf2H/HFHa3q740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784072635; c=relaxed/simple;
	bh=dCf0Q6aJ8SY9P7WKfIBXY0C/UqKkj+m9dxP4ipo7Dn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=seQM7iTyD5DZ4iv85HjAg/5EQb23vrDTZ2q0664FxCRpk16PO4cmC3VMBEepNPnsKbCBL8M6l8fADY193Q76cfexkPqVhAIim64gfnKVf0O8lFIivNwna6gq/ZmhGaG12KKErp2BU0L2058lVVzeh8eyTmFE3ctBWr21nQIMIro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrAbkvCs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrAbkvCs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceed7018c8so9488295ad.1
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 16:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784072633; x=1784677433; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEOOTsn4hC/InOasCmFmuOAff9CBOfHb3eXMINdEwFM=;
        b=nrAbkvCsiGnZsWH/Zxz8XX4hdb5eOte1fqv8cNXaggDb35TvlS2XlUGKKvBBEpbl9o
         RgOs2AS2sQULe+XmM+oHVPEb+cFnemsMDfsLYluh4cM1Glgoq4b2jPFTpS+mLvjyIQxK
         2zKeYLCdwLu3y/iKkFHS8Vr+RonSmO57SbOQfz7HSpVn+AZVoZbb67gz/nExAZarpnoU
         bc1L5wT/ZlumoNS6CtDTbBiPiyIIASlIlSB8VBfu54yeFEOC9C5qX3u1Z3tsuyNthtGs
         FTCphtM8qfck2gg7vPFfFWVo7DAFwRrN40xHAxBh7XUHPh4RhoFQIwRAwhJL4vXc1XJD
         TkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784072633; x=1784677433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEOOTsn4hC/InOasCmFmuOAff9CBOfHb3eXMINdEwFM=;
        b=KbgqLm6J8fjX3f6h31wOC/pPhBZKf/rtgGSKrkrmnr54Wfg5MVbcGLXVMl+DsPROpT
         V0CGHzk4K+pMAC+hDgW7TtE/spXjDKV4mb7HDGqHcGdwYgslaGJ75zXPkIqeeBq6uRDR
         I5CfpKM9yzywq6MCpcFFJWL/W4FFkCATI/S77iFrvvOno1+GBW3s3YkTa4Bbk2TJXMwg
         8IsXAl8b2wkvuO17ATpVpE4TsrNy/rwpvJqDtmk5MKZn2M/dOhl19a7+YuMLiDQTYXaH
         nfAmfsiAvA/SXw1oXDwcbuPXi+EIMto+pKF19RNexV8hVRDsetoE4++gBM6jJC7espJR
         OVYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrV5sC+MGcKaguKVfD5zmwMCGt6RNBM/A8sLz9yQID2Y13Xw/hOSLkUQJrOqbabrHA6ZVI@lists.linux.dev
X-Gm-Message-State: AOJu0YyXck0DMpGAX8oYgKzIvNF/vcDfy2cv4npYRfsUNVisME8/mPxE
	YLRWZHgI9ElRd95hMUcfEWK4olG0vskBfYQn3FZt41o1CW5wrjJFlhyw
X-Gm-Gg: AfdE7cm3Z//uy4uLKXUVffyisQUS3SVyIEWVELcPrCJ0pi5i785eZqhg7zlbOyk0Uva
	izRqxSVcfjxhUMLR5CFUbDqy5y4c6y2TCKAHm8sn7ZPko6fc5wMQ5cAEfJBTvFmLl94H2ZSHrDe
	eVeFMVZa9Zqg6ei5Qx3HokozfUtI/5FbQae6RLZah7523Hx/Cb5gIT60hMrm5hEGmzq2rCE4Q2e
	HkvFDICpg58+89cx+9YNPcAXpudgxRXjh53Vi8S6ZwC4p8BFV3AcRC6Msf8eHXofaTvpXSCFdTB
	73vZ7yqx+XLT31QauucodCtvDYrqGmv0qswlj5TWuLs7WjZRUUNYKvmsS0SHb9hn5g8J2F3qekd
	HPHn5estYIhcvlUPqE5qwLZzRBcwgV5apDcfHmT1IVzH2+RiDpntdj3Yp6uOe+IlCnnxyCXS+yl
	hbrcnxx0MfPWyzC6KzRP8AJitWfDjE8alXxPmWct0FDzzankE3D6Pcgn7udubluKhyUWgA65GsE
	kQltvo8HLucuX7WEJRDI1D1Kx0HefXYWGHdMZeJJao2ZNRuriWKI3BWHxOcLe3R7A==
X-Received: by 2002:a17:903:32cc:b0:2c9:854c:a45c with SMTP id d9443c01a7336-2ce9f02bb90mr154625965ad.34.1784072633341;
        Tue, 14 Jul 2026 16:43:53 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c25fccsm122539085ad.35.2026.07.14.16.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:43:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Patrick Havelange <patrick.havelange@essensium.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] counter: ftm-quaddec: use devm_platform_ioremap_resource
Date: Tue, 14 Jul 2026 16:43:50 -0700
Message-ID: <20260714234350.892367-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with devm_platform_ioremap_resource(), which fetches the
resource, requests the region and maps it in one call. Switch the error
check to IS_ERR()/PTR_ERR() and drop the now-unused struct resource
pointer.

The DT nodes (counter@29d0000 / counter@29e0000 in ls1021a.dtsi) each
have a single 0x10000 reg region, so the region reservation added by
devm_ioremap_resource() is exclusive and does not introduce overlap
failures.

Built for ARM (drivers/counter/ftm-quaddec.o) with LLVM=1.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/counter/ftm-quaddec.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/counter/ftm-quaddec.c b/drivers/counter/ftm-quaddec.c
index 8455f16d62cb..ed93f3621d2a 100644
--- a/drivers/counter/ftm-quaddec.c
+++ b/drivers/counter/ftm-quaddec.c
@@ -262,28 +262,22 @@ static int ftm_quaddec_probe(struct platform_device *pdev)
 	struct ftm_quaddec *ftm;
 
 	struct device_node *node = pdev->dev.of_node;
-	struct resource *io;
+	void __iomem *ftm_base;
 	int ret;
 
+	ftm_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ftm_base))
+		return PTR_ERR(ftm_base);
+
 	counter = devm_counter_alloc(&pdev->dev, sizeof(*ftm));
 	if (!counter)
 		return -ENOMEM;
 	ftm = counter_priv(counter);
 
-	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!io) {
-		dev_err(&pdev->dev, "Failed to get memory region\n");
-		return -ENODEV;
-	}
-
 	ftm->pdev = pdev;
 	ftm->big_endian = of_property_read_bool(node, "big-endian");
-	ftm->ftm_base = devm_ioremap(&pdev->dev, io->start, resource_size(io));
+	ftm->ftm_base = ftm_base;
 
-	if (!ftm->ftm_base) {
-		dev_err(&pdev->dev, "Failed to map memory region\n");
-		return -EINVAL;
-	}
 	counter->name = dev_name(&pdev->dev);
 	counter->parent = &pdev->dev;
 	counter->ops = &ftm_quaddec_cnt_ops;
-- 
2.55.0

