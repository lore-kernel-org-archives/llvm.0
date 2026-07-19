Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D952F8EB3
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784490018; cv=none; b=usIpjsCllT3cybhGw8f0gOvFdyYgsQXqCRXCpFWwAhChgp6Y1k4hpqAAreaV2v+OavVcrPeLgY4K11TGhSt3Tb/tSu/iMMCgkQ7j/rbkWXvAttA7NWf7l/pqqTSHU7uvMJ00kyZH47xPZ2dSImUstf4aSuMny2LYxpp71T7sSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784490018; c=relaxed/simple;
	bh=ifU1kMZfngVDHcvrjk0awPR30T+Cgv/d0HA1XGLTU7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lb/HPWixx5cRdt55U2yssThNTPHXw+5F/I4LVtpQcMF/qLbmkFUOvhrCZnALA+d/rSDFCA7souPmdBzMKEcNIA5G/fqb2hrncT3JmV+vflIPu1S/grCiuyImmJiBIC67IG4eId91+N9VCnbAIEp7DF55shIrswNyEZjwo1kIIC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX0KIdNm; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX0KIdNm"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so3952944a91.1
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784490017; x=1785094817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSIQ5/dAG3XXTro4N8Y7fM6rRNG5QM3A2gVdghbdtAs=;
        b=EX0KIdNm47LAy0podrJ73HosTTumRWGI0Ix6/kBteWPGivdzXIOH1FzQd0ig4jve3Y
         BNnnqkTabuX28JDy8mzfdaDuZUB00XNRgxLGv2fxw3mARq+I7MDus2XygQ/rKMhF0Hpg
         dFH6tEHIM5ZsDH/xUHhknO08yVAXbin6fIFWpPD5GT0j48rMiqnQI8DaE5fnYR/wwjVn
         ZQWmU3ZPQGavr8NQAMKNCwIFiIHrV5VBGG0teUS/5ZgcVj8E5FYf5nVubiduW3DOdgGR
         xNmjBidkk5pbcTWgcmKLF2LNBIpKMoI2duJdpSnQXnwJSITPb/R6MrxTd+ocCIv7TK45
         aohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784490017; x=1785094817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSIQ5/dAG3XXTro4N8Y7fM6rRNG5QM3A2gVdghbdtAs=;
        b=UAFpHq0SqLBWQaU8P2AIA6ycfl8dMwNe6pBmuEOtRFO3r6Cgu65hC3FkqzbKgnscLZ
         CcIcbpxOc7dA9YYMXaO/wnWNzMU1oGuo+K9F0aJqBq34Bh39yu+vnTNfURMF1+NgpC7M
         39VbZKzyDswvbI245Q1Q+CJe1WI6Iati5UxVtaMCsv+nsAJ74vbtNW62rW51P6VuxaZ1
         s2+1PR718um85F5y2ucTdGfCLBrM0a7x+Pv6T7SXnNdNJhGw8w/PWBUTRtznsCKjMyKm
         HjGR+7NxijZ5wT2/8AjpBsXzoD4B00cTpPuD3i/LEq+q7T0QO6Kxc3URAaZziJ6nrfxl
         hixg==
X-Forwarded-Encrypted: i=1; AHgh+RpTN3cHAQW/ZjnFREjvx3CzqeTAcDax+xYc3t2m5rTvQW2FCKoe8iv6y2eBcTRw65j+BzSP@lists.linux.dev
X-Gm-Message-State: AOJu0YxmMgzxmH6jpczm/ph3XRtBTw9a1gTurWmxqI2Pa38Y0pujinVX
	X0Ylt2SO9pZbAzcPJr/lH+My/R9HHuljoYh1FgcDIH2kaWwAISaKLFcp
X-Gm-Gg: AfdE7cnrCVEVSshlos2/CNO6WtUSKTVXj4zjdVTeBrI68Jj99Z74E6l29MXSPPWrDTf
	mHPfAr0Haeg4JrtrFJW2rWhoUOAVayBZlHlDzspCo5zhh0jW/2d+DE/qFmYgZuXaG0kpw4pauya
	Y/3zevj126hk22zm8fKfbOKaN6Km5ghyOCrcsrEZ+Hlt5scVeOC+6JYSuo57MSI2q7wpQirZQ1c
	hLxvLz/NEvRrph9crvej1t5g0woL2QhwbJkWk0+L26qf97rq5TfV3+eB3xhF919UNULpkMnqX5v
	2aip1ubogRrrCmmVb0ST2EBsPfcPKISE2zcawF2w4DusZ19OHweOEQnTRi1O6TdUmf/HV/95ae6
	zZ7pLeKaFF7YWpLqWPQ52sVj7DKwE0BAAEeCohOitKQUBPceP+3upC+qv/Ezg3V7X2wda97ZzrR
	i7hvsKBTieYm0rwQ4I3CGO3DlIpm4/oF/LU6dFQ5vfa7NmKoufSH5dguyZE+KPlSQbSdVUQTEp9
	n5L7WcWKb/YH0TCXmsOA6J5z3p+U3ULTbBWMy9UeKzxSAKAk1brov4=
X-Received: by 2002:a17:90b:57ee:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-38e4b40292cmr12031474a91.10.1784490016674;
        Sun, 19 Jul 2026 12:40:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a0fb993sm6308126a91.15.2026.07.19.12.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 12:40:15 -0700 (PDT)
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
Subject: [PATCH 1/2] EDAC: fsl_ddr: restore MC error registers on probe failure
Date: Sun, 19 Jul 2026 12:40:08 -0700
Message-ID: <20260719194009.117532-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719194009.117532-1-rosenp@gmail.com>
References: <20260719194009.117532-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
initialization step fails and jumps to the err/err2 labels, the cleanup
only frees driver memory and does not restore these hardware registers.

This leaves the memory controller configured to generate interrupts while
no handler is successfully registered, which can cause an unhandled
interrupt storm on the shared IRQ line. Restore FSL_MC_ERR_DISABLE,
FSL_MC_ERR_INT_EN and the SBE threshold in both error paths.

Initialize the orig_ddr_err_disable/orig_ddr_err_sbe save fields up front
so the error paths are safe even when they are reached before the INT
block populates them.

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly.

Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85xx")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index b27dff96aeb6..b1e6e177b088 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -518,6 +518,8 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 	pdata = mci->pvt_info;
 	pdata->name = "fsl_mc_err";
+	pdata->orig_ddr_err_disable = 0;
+	pdata->orig_ddr_err_sbe = 0;
 	mci->pdev = &op->dev;
 	pdata->edac_idx = edac_mc_idx++;
 	dev_set_drvdata(mci->pdev, mci);
@@ -645,7 +647,11 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 err2:
 	edac_mc_del_mc(&op->dev);
+	ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
 err:
+	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
+		  pdata->orig_ddr_err_disable);
+	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
 	devres_release_group(&op->dev, fsl_mc_err_probe);
 	edac_mc_free(mci);
 	return res;
-- 
2.55.0

