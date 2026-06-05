Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602DE3D647C
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696923; cv=none; b=aZRPfweEIzCPME8PoR29C+0DuYtTJnqnypxSGJMMuIOTgORHNtpFoQ2ZcEc4ZJWweybZDcx5Oq1+K1rztuA9QSvqaPKGwqfRIEMmvYGktH69vWqObpgQc/tT+eFEPjyIABq9VRA0JA0LaMwegvgVKULNmpRpyA61har3VweMeTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696923; c=relaxed/simple;
	bh=bKQWmItIKnc/fdJSRRktRi/1cUXUvo7d8EoyajRgfGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdwMlGdQ/fVtw8IJq0CAxsgJ8eK5kJrXXSQ9NUcfpmsvuIBJeOLAC6sSqdWDgksyrQM2bfPGJfqeLNYh2hykHMxnlPcyJYg09Tevhaqt9CUSMNz9k/9OSHsJVP0Pm87JqiDOBQmjnXkNNd6GWsj6mFVOs4Vofcokg4sDB4fmidw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OquPbIOZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OquPbIOZ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8422524cb38so827298b3a.0
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696921; x=1781301721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0IcJHFrxrpFxcVE04G7XPPulmPSc2DO5kl+s9g50fo=;
        b=OquPbIOZkuIvynSch7eFY3yiwr7elYnVe5iYpKOqS1Hg0vHTFpm/ZHp6hmaEO9Nzdu
         9YzuQuRwmz+6f8bXFaVQ/+qw+B9KcuWXDWYZlStfHlFc55tr4Ax7gc6x3h0ZlM78OxlG
         wbLPr5wIjD6O5izWpumGkxtnmL9pigztbza42QSUflF86AJpkG7PBnufJ9fzqu07r55k
         JutBTwYLkDgYMhDX/YLjpYOqg3br3nSbrP0Cghix8tBkl1+OdJevb2AHhpr6TTVrV/jr
         GZO5HE1Ez4swuJ+D+is4Gn5ydGdRKQeC1qbpmxs6KMVyXLi/n0YavRvgZQ0u6sbRQkHL
         f2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696921; x=1781301721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w0IcJHFrxrpFxcVE04G7XPPulmPSc2DO5kl+s9g50fo=;
        b=aUSyvlnBY6xh0nnpWsPxCqtFkxbzIqJ5m6VgMxhy/H4RapwaNfd91+i70fDUUP0OyV
         QIA1RpElmxeJpY5mOXsQIzJFd2nbF3WAJc0aaABvtl0Ky8CmYCNtViL5djhN8F30OWyE
         hzCxyiUQ1JcuGeCdBXaDbjQAfU5Zd7Z6TNyjETW9XBk0Ktr9qXtwyyfBSDEEoDFBAncv
         FxUHtf71fcVZX/bwxpMxJJYfEknhzl+EDkDoxXiYInV7RoeehKGMDA/zGTGIVMJcZNFM
         EZHWv7iKwNxZYH+EaNh6DTvbWY6mpDFIH27clHBWf5k2fmdLhuqHMH3FOHGC0r2Suasc
         Anww==
X-Forwarded-Encrypted: i=1; AFNElJ9MGxkVNNeuIYZb1btOGBlV8upYERjNrxMG3+giHtQLCdSkUllNDxEUa7Ry23ev8G64OByh@lists.linux.dev
X-Gm-Message-State: AOJu0YykQF2WeqKB67mFvEedIxTYer2IgqknN7BXx6fuPDOrz3OODrfy
	aHy5t/INtHC3znNJJAW1cB2hXitRM8uev8czvDCOTomo5S64AIO3Fcnp
X-Gm-Gg: Acq92OGj9Kt84VWHMUegrcsxDiSF/SrFDklCUcy/QPbBpYcgu9dlGXPYVS3S8UM9YYG
	Jy5ea96iPPU2nUxCDvEQDc24XAK9QgnHH2nm1HN1WBfPc7FIN7WKjd4kDjxDGxtxQc4hej8zzCj
	+WIQAC6WlCCm/LKMy8zzVB6QdsVSgyhF/IkdvKzUM4ymEczJFYvvVTJ2X21UUj0/bXpYiRdyDCT
	g/kW83vT0X4NPUKltC0X/7hCRKpOpu+y15VdiHGJwW9+HP1COkVEx4xPsjlLhBoxJpPLibXIem9
	0N+tsC0ZhwBVTmMhgdt/TQ9b+tSlKBWYbqlDlH/FVQFA4lsegoJpXjiOseL2JD64xVGw+RpUMMq
	DHtuXF+fWIWf1yWUQm50QAWMjrEIVpoEYoHVtiTYBx8ksEIcDmKFuwCyVnas2mIvvoDW7cSaeuL
	OFq06BuH8Hzoe+IyGFJtHv9l1mwi+3kyVG/PF/LNAT4MlrypbG2UxwF2comKGwAhWopGRm9dMky
	KjBQdmjTUpECWmUojkksmEaoRc4dKfY7hIiOsDgO6eIZg==
X-Received: by 2002:a05:6a00:1c94:b0:842:6d5d:58dc with SMTP id d2e1a72fcca58-842b0feef0fmr5682549b3a.43.1780696920695;
        Fri, 05 Jun 2026 15:02:00 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:02:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH 05/10] dmaengine: fsldma: convert ioremap to devm_platform_ioremap_resource
Date: Fri,  5 Jun 2026 15:01:29 -0700
Message-ID: <20260605220134.43295-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605220134.43295-1-rosenp@gmail.com>
References: <20260605220134.43295-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert of_iomap to devm_platform_ioremap_resource to let the devm
framework handle unmapping. This allows removing the out_iounmap
label, out_return label, and the explicit iounmap in both the probe
error path and the remove function.

The DGSR (fdev->regs) and per-channel registers (chan->regs) map
physically distinct regions in all supported variants
(EloPlus/Elo/Elo3), so there is no overlap risk.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 2efa16d12679..2a6a247761a4 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1229,19 +1229,17 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->addr_bits = (long)device_get_match_data(fdev->dev);
 
 	/* ioremap the registers for use */
-	fdev->regs = of_iomap(op->dev.of_node, 0);
-	if (!fdev->regs) {
+	fdev->regs = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(fdev->regs)) {
 		dev_err(&op->dev, "unable to ioremap registers\n");
-		return -ENOMEM;
+		return PTR_ERR(fdev->regs);
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
 	fdev->irq = platform_get_irq_optional(op, 0);
 	if (fdev->irq < 0) {
-		if (fdev->irq != -ENXIO) {
-			err = fdev->irq;
-			goto out_iounmap;
-		}
+		if (fdev->irq != -ENXIO)
+			return fdev->irq;
 		fdev->irq = 0;
 	}
 
@@ -1309,8 +1307,6 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-out_iounmap:
-	iounmap(fdev->regs);
 	return err;
 }
 
@@ -1328,8 +1324,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-
-	iounmap(fdev->regs);
 }
 
 #ifdef CONFIG_PM
-- 
2.54.0

