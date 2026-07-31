Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E54C2DF6E9
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 01:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460897; cv=none; b=QHBjMdtqWw1TYDmJY0KdDfC+AgIMTnJ4gxbsQ0lHyP9F4q6CIODKyla1U1cOe2n367MyXNjSewc9XWWh1k9/rWgBkuvBUc64Cb/31Kfn18JDDTJsnNIeXE8PEAaYkcHdmcfdl9v0AW93W2OK9STiEdVJ0IiEnX+yKbSlM7vBAt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460897; c=relaxed/simple;
	bh=EXM737zPqfFOz8c2oTEgN+Z9Ea1EJcWSCZdWPrOgRko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BByyq2HvUOfzEroXNscPxTs+2ay4fpYOH+siI3K6Nc2teVa/idiG8EPlQ5ZH9CE01w7cllmmIi4V/nNFpYrvBKvDeuQNIky1FEjPhYtw6WLnFexgGMvVi92Qvh28rhUojnzY0+wx2iIYRPq2TE06tqc5TI1sOvpnqODdc/4ZFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XgU+LOgu; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgU+LOgu"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e347638adso642128a91.0
        for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 18:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460895; x=1786065695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQZ7kr/xVyL8NQz8gujRJuKRFxvmEh5rg2s5p7tnoi8=;
        b=XgU+LOguha8Cu31eFx8DAABWWySEw+xLwZinMi3FsN9vVaP4hqgm2WQi/GK3RZnNWD
         AGeTaM7h3iD7bvD62txwx/1wKlbz4MpbqKFYQrg88Ausv9XEorZYhCmy99X8OOFBxzi/
         L99vO2kLVsqrqL0ZppTIQcDfvYKribUcJQbDJr+ZIXaOZjOJsrdDIVw9+qQICSvRJOuq
         d5/qvohOcvD16OtRA2F1rmC21IIVR13pWoorzXsOA++gC5ywvoEvScMHyjSbc+DHh9FI
         9vZJLQo5DhDSnEYB7P1XMZjsvSfjVSN9h+asGVGRnQOCxVg8tBqSSNhxaK5hqy2P84p/
         rB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460895; x=1786065695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQZ7kr/xVyL8NQz8gujRJuKRFxvmEh5rg2s5p7tnoi8=;
        b=S4rrxN7s9k4xmkIFkFULLdYYeSEYZo8XihGlEtGYmlsiwjS74IFf4keuoxfN65H358
         qducDDe5MZ+7IKzWILGVqdrQqKX9UQ3gkdNv8dd7LgZLMLE/a5awgX8I52ki7UrrE2zk
         qbEGsdSIuFik1zFzCgUXwAJpX+OLwE6Dpq4iYZaSEuLcNCD6LPtLYNZ2zoNpaDb5nJtE
         fdGtX49USfeCSZLI3sT5RQvCzbbbFpfEdtsyZGI8fa436NDY5tm3dBDF+tZN1KTA7RCh
         cUFJEi4UYG1QevhxW2LZUVnFfnn1vUEQPm/h99UK4Z3drVUxNpli6NbtSV+iruaM+093
         PpUA==
X-Forwarded-Encrypted: i=1; AHgh+RrcfLsr7b9gaX/H8gBnESjzri6EUh9MzKj6Musp5HHbWo18sBFXsRQWlLQl3lipehcQAMA5@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2yzM7DiNvk6USdeldvN/g6ZIF7KhHoqaMu4WAaPkgtdAT/qH3
	Ui7+o9oc7p/m1l/RJA88/OrM7WiSdRO2DKyvB6G6XqNjl9dK1L5LgsN5
X-Gm-Gg: AR+sD12r6bPrRLH5FYg9Fsj5h9krGcIoCwH9P7zevT1jSk26e4kcV7BSb83IgSNWp5n
	Pns8rVvE0nO+cqXXzsIgysCV76E9tD3XhroGcbCAHzrOKWHmF93VttuO8BWUo6cM99iarb+jC2x
	2gLwPMii4zJKZwg/hcZt9IkwaVC5997SiwyM55WnDdODfSFFWXEHkh6hLvOrMyRyU8CsTlxgXVt
	OxiFJQOooBR4+rij8SZDfWdloP49tA/lcpsdpVubUsEKgnWovK/zpegXQmwFB6sibmYVvgILial
	8lUbiR846uR4/OHbKg+QP9ZIpwEiRDbo9R9FggzKIebW96T7ClGupVTAJcb6Drrbih/4O+KBbku
	FphT4IrYeztKSEnatQVk1vFhish8CoaltTNdlbvaww+BYd06IO7KmiIYLQQCJ6zXRiYIEQtm0er
	Q4QMwUh/hmr2jAuQOfBlsTZVjXzhkkxN3nNDh+KZUyt6s448myAwC9LDGZRpRj4MmjK4B6wLYER
	jvquavwesbFVR6z9fbMy06ZDrgZBGn9splM1Nr6mhqvPN8L/3oHkHkTnO+SZPioQVO6IeiSbi5o
	1GWztQDGYQQziPnmwkcrA68nQlcNXjILj06YAXVgDwCVidBg
X-Received: by 2002:a17:90b:4ac1:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38fb13c3a7amr108448a91.20.1785460895317;
        Thu, 30 Jul 2026 18:21:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 2/3] EDAC/fsl_ddr: use non devm for request_irq()
Date: Thu, 30 Jul 2026 18:21:29 -0700
Message-ID: <20260731012130.1212640-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731012130.1212640-1-rosenp@gmail.com>
References: <20260731012130.1212640-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to tear down the irq before edac_mc_free() to avoid a use after
free on teardown as request_irq uses mci as dev_id.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index 3745eec67335..c505fb268474 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -599,7 +599,7 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 		/* register interrupts */
 		pdata->irq = platform_get_irq(op, 0);
-		res = devm_request_irq(&op->dev, pdata->irq,
+		res = request_irq(pdata->irq,
 				       fsl_mc_isr,
 				       IRQF_SHARED,
 				       "[EDAC] MC err", mci);
@@ -635,6 +635,7 @@ void fsl_mc_err_remove(struct platform_device *op)
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
+		free_irq(pdata->irq, mci);
 	}
 
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
-- 
2.55.0

