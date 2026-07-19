Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424C33016E0
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495515; cv=none; b=Mt41HVNhwTbEd78lLzCmffwbSFtsuhdKoG3Zvx1XGVhFf8dKGzslHjGhkaiO6Kav0AR++M6y1rVX4ubcvC/NuAqnoMmFrS5lFmpk8h4Jr4R+efDDsSntW8BGLxhDnd8xgaTfZrHrQ5T7q1mD3avaZMmd7j6L05ysW50BbNbnpp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495515; c=relaxed/simple;
	bh=DOKnoD2ZG6zgxm9ONXHYuwTCKZ2S9eKZLkwhANYRJf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDvMuQ565EVgZ2WcnriwzOl4KpXew5JhvKj1svDcFhNz3jY6WCtqKFKZmZuxA7fDgQwuyi0US3xqYKfSSLeiNAxeRpV53F5ltJr6Z7RlzV5459K6gtRRygMjL/L3jlw6kWnYT9rGQWum5jmYTHqcGImsjfAQXSE5YVWknZws56k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEmZ8/AQ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEmZ8/AQ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso9477268a91.2
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495513; x=1785100313; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gl8awQyGmjiKwuQWENOHzgNB58UOmcAca1xDTxmcvg8=;
        b=UEmZ8/AQZK5Fbw42iXQpicsbCi7xc/4ONl3ngBQLL4YmUSwbP/uTArQ5l/W8pHMmJ4
         fzTpVU2Ynyn6ScxP5wwNurSPI/VxxlTBPTco4pFjHKtb081tbr32QSDUW8PRebBa12ht
         FgxN4nHI2eFxE1KpdRX80rNxtODos3cyHLRg/bExlrqtidJly+D01YNH7kAXW1/i5U5s
         ljddAFRc1vxNIKCFtDS8wVABYzRWnMvuZXHG0pCImbGfiqx0l9kVk2Ra0p9kAsGkADrf
         1rSLQGNKboBoqMkLg4j8zdh6Yq1T8XA9a8gKEKFob0/sBSNmzOaaI6Qtt7JnkDpkGPO9
         ducA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495513; x=1785100313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gl8awQyGmjiKwuQWENOHzgNB58UOmcAca1xDTxmcvg8=;
        b=PYkZsbH0/gdiGAv6p8lgDBilci+x2l8pEd6qjUGe7hv0o6xyT7Xf67mhvTfk3Ie68H
         IyXJRET0gNkYY0/jnEZbC7BgL6iyG7R6y4uDb6V2F/vc1ri2sZBLzsB1PgcTQFOqXp4T
         WMx4UKgGZmkCqJLyCasNvDZPsb+fbsLMghz6SBIgWrkDlaFyVsVFddFU4INvYz4w5mG6
         Lvjhi0IcifYePpM0ozHabzI7pfdFFBA0U560XRF2a0Ki0RhzXzGwoyL4JCLrJNXSIZp0
         sIAwyalUM9/v5TBC6JDuCncEc7qeEfz+zjC5bN5vVn8vTOQe/6SR3AmyxPdEe+WQEUxH
         zDLA==
X-Forwarded-Encrypted: i=1; AHgh+RplVVdMTo30sl5kHVUBN5jg1793cidf1eIFfbr63e/vfmwcU/Al1/agO+86L7O2b6BSQgbJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxkvP9pEbRhEKGktTUSwH1NvSvvM05tLy+lmVC3TjV7JnO53MUG
	kQtgO4ppCmhz0VgFADN275cjwUUfTLuMpkq2DkdmAwlmfHU2YmmmTgJ6
X-Gm-Gg: AfdE7ckYAYma4CylCL55KlxBeh2VhQzl7TZlkqZ6T3Nt2dsaG1KGLLuij4SNJSKDHGC
	1iDYhjIwQ9d0HpgQMx55ULOxV6aEUcE8zkgv/Yr7WgjMm5HncGb2aPpbGAGD7pk10TJy4jTrsXa
	lpxs1CxORl+F7TP5Ah3rRds8fzEyqF++h18jegOkH+2UC1h4CQcRITLOm7rJ31XAFVZfWKGVK2u
	aXQ+AnBLrQmkDRJqsg8nXzttCZbpZobUKAGAoROVBe1GBnL/yi3gcR7SQka2WJXAwypdkseO6cW
	aCXHI45YCuPRot50SVxJRermG/1FhH2FohQekVVjxzt0kWlkQNhldnsiWXA2lCdw8Bg/WdX9A8u
	9RXFbXj6WFosjwZkdm0cZ4iZXaYsQn8tK3RnLoL+/87wNy8tbVoTLJ5Z3kSXL5v38LOO1605qu4
	GS/cNJTl9C8sBE4BpaKB7eYYSStPGCOO7QiD4f/s4SRxK/dCeHONpNH0hR+0AApOWFL7cA4uN+l
	5VRRPe3PvQjxcVfsRvaR+IybpY0VwxJCZBct148PXqK7SkNNCapbdc=
X-Received: by 2002:a17:90b:58ee:b0:38d:56aa:6f32 with SMTP id 98e67ed59e1d1-38e4b588b44mr10793158a91.38.1784495513390;
        Sun, 19 Jul 2026 14:11:53 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b22bf63sm4614307a91.15.2026.07.19.14.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:11:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Khuong Dinh <khuong@os.amperecomputing.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC/xgene: use devm_platform_ioremap_resource in probe
Date: Sun, 19 Jul 2026 14:11:50 -0700
Message-ID: <20260719211150.585626-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() +
devm_ioremap_resource() pair in xgene_edac_probe() with the single
helper devm_platform_ioremap_resource(), fetching the PCP CSR mapping up
front and assigning it to edac->pcp_csr after the edac context is
allocated. The redundant struct resource and the late re-ioremap are
dropped.

Built for arm64 (CONFIG_EDAC_XGENE) with LLVM=1;
drivers/edac/xgene_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/xgene_edac.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
index 9955396c9a52..92d1f15bdf30 100644
--- a/drivers/edac/xgene_edac.c
+++ b/drivers/edac/xgene_edac.c
@@ -1844,9 +1844,13 @@ static int xgene_edac_probe(struct platform_device *pdev)
 {
 	struct xgene_edac *edac;
 	struct device_node *child;
-	struct resource *res;
+	void __iomem *pcp_csr;
 	int rc;
 
+	pcp_csr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pcp_csr))
+		return PTR_ERR(pcp_csr);
+
 	edac = devm_kzalloc(&pdev->dev, sizeof(*edac), GFP_KERNEL);
 	if (!edac)
 		return -ENOMEM;
@@ -1902,13 +1906,7 @@ static int xgene_edac_probe(struct platform_device *pdev)
 		edac->rb_map = NULL;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	edac->pcp_csr = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(edac->pcp_csr)) {
-		dev_err(&pdev->dev, "no PCP resource address\n");
-		rc = PTR_ERR(edac->pcp_csr);
-		goto out_err;
-	}
+	edac->pcp_csr = pcp_csr;
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		int irq;
-- 
2.55.0

