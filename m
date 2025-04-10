Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68FB204085
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 06:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267099; cv=none; b=Bg6V5aSObFekLk5qv7RVeDEuMs/JO9ktIMvEtlb9DYhbRpW9wXhUysXWK8Zra/z3Wd1EOLllifLQP+KwVlqtdIDsKxbXilXxSFNLVbt6hrzLS6A6xjiWSUazevsacKOrMXyy44h/d2yeNRzG5Vz5rLRFkUq1Gnn8CJz2YU6MBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267099; c=relaxed/simple;
	bh=AM77C8w9LbzArLDjWF8A9ECWZ8/cFLOdaTOdMygyMpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBlyZdxSK1UbW1IsGkpUomiH+MPOCeaKYGchey57my3BMpJ0QlgKF9emzrrDfq0uCNHsjbAXEwHHn0cNuvKbce7D297r+gM7XA6kdD54q3aVvSM7FFVFS+4wxVj5Fr4uO+tbxw8woLssuIcHPGIO3DfViqseZ6OgPvb63wAM0qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrFwvgkk; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrFwvgkk"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af59512c64fso329269a12.0
        for <llvm@lists.linux.dev>; Wed, 09 Apr 2025 23:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267097; x=1744871897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5763eRzYt1jege0RTd8JYUTEayhCQNbQrkkrycefYs=;
        b=lrFwvgkk78b1+vH4v5yQlTg0wEan7rzSv6nr+udloQvqg7QYHa8KQyG7h22z7+eRiV
         IsVWCCIHiW/RyExCPMHKgDbfkm/MkmIET5P4CwDJPC5xC0j28Pkp2x+OrwVQK2j1iS1W
         LbpIB0zQ8s4dSaVzvXnrtwcZrzKeWn1BJyynd03cbD6E9V3sgG7bC6JBAASuAHMVNGCk
         Gqm71hZYdbiUTgyU/XoO2/3IFMR5mcnZS+xEte04F33W5XTp+9Qrt6/Smd0tgUmGGNhO
         rq3bXnV1UBv5QTbwQEfw+JIfTmk1nWZOP+ldx+b7GDh711Ptx5TYWfWFtQm9YzCDQeDO
         Ptkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267097; x=1744871897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5763eRzYt1jege0RTd8JYUTEayhCQNbQrkkrycefYs=;
        b=qN0gVZX/+2SaZe5R5Vn/EzBzbCIZgnN1ZTk64yN/pC0OBYP4mGNQg2oNl5KbzdDhxR
         dLwSpXNQPEzYLVzbgqhHk7vOFCTHzjUW6vxTB4HJT/1/h/4psymhazhhgLWLt7qXNNHa
         /YtBPydmnGu0QJZlQaVKrHHc/HyQxmpX6S6iohIAMk4Edop6aEsrXAIPrNQVb5RZRc6P
         frrzmRUZ6X04L5oB92+NRhJ2OisaVjEhV2Aoo4+I3/45NuD34genm6Y62tRGUdePvzyp
         fXyUpSP3qr4VlWrUJ7KwcfkhaI9OmNc+wswPUFfnk6EohWc6F/LmXLm14V0zBMVTX/PX
         fw8w==
X-Forwarded-Encrypted: i=1; AJvYcCVoJFeDwCK23JLTgQ0vFaaDO+FjnXRUx0BEUAy2LCMN/F79/7K2ZEdNf++vM97mMyc01hqW@lists.linux.dev
X-Gm-Message-State: AOJu0YwHLsA4sIRXwEWem9akThvQhBatu0AXBSu2fqRg+bzyy5hL6ZN+
	CLzn08kYfXOU6Sr5HzbfxKDxkInmdHWXrkdUVLEOcfz8DZ44XdDVVeN4KQ==
X-Gm-Gg: ASbGncvDohWe3ajpt8I20dlGsYjh+hdqKyW9i6L0o4ZHjolWB37If8j3ZY2+1yFpMeN
	PVqpDdHc7NdA5sJ9Ap94XAC/Rq4O2lT1G2dz/y2Q4vlwfKELcwwboBZUqesPdHGqxRIW5YHGsuP
	vGIpuvAIRDXJWRTp17itRrVEPEQ/5dQWKOTN5HzBShrTvt5jHMOEQzXy8jSlu/x3GufgRtTL9GK
	zfN8os1O+CGkmQp0P2qCIMt+9KQW1xk5NAAMUDpBa0pyVGy3ssgVBLb3ep543MtTC8CDvFmd6UD
	CNwusNa2zhD4XmTOXTRCyuVb9rebFL0Y2pgaN4V0UIrbQW9laFWzHA5ZO2u5nggxKQ==
X-Google-Smtp-Source: AGHT+IFitF6h5bRSdwbPKPWR+Ues28TptvWHWuXicvpvF1hdtwOY+l5uGQZAnwPkm7WTvTojhw5pzQ==
X-Received: by 2002:a17:90a:d64b:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-30718b75cebmr3246029a91.14.1744267097017;
        Wed, 09 Apr 2025 23:38:17 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd57865csm973145a91.2.2025.04.09.23.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:38:16 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v5 1/3] drivers/thermal/exynos: Refactor clk_sec initialization inside SOC-specific case
Date: Thu, 10 Apr 2025 12:07:48 +0530
Message-ID: <20250410063754.5483-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410063754.5483-1-linux.amoon@gmail.com>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the initialization of the clk_sec clock to be inside the
SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
is only initialized for the specified SOC and not for other SOCs,
thereby simplifying the code. The clk_sec clock is used by the TMU
for GPU on the Exynos 542x platform.

Removed redundant IS_ERR() checks for the clk_sec clock since error
handling is already managed internally by clk_unprepare() functions.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: None
v4: Fix the aligment of code clk for clk_prepare in proper if/else block.
    update the commit for clk_sec used.
    checked to goto clean up all the clks are proper.
    drop IS_ERR() check for clk_sec.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 37 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..3657920de000 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1037,29 +1037,30 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 		return ret;
 
 	data->clk = devm_clk_get(dev, "tmu_apbif");
-	if (IS_ERR(data->clk))
+	if (IS_ERR(data->clk)) {
 		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
-
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
-		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					     "Failed to get triminfo clock\n");
 	} else {
-		ret = clk_prepare(data->clk_sec);
+		ret = clk_prepare(data->clk);
 		if (ret) {
 			dev_err(dev, "Failed to get clock\n");
 			return ret;
 		}
 	}
 
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		goto err_clk_sec;
-	}
-
 	switch (data->soc) {
+	case SOC_ARCH_EXYNOS5420_TRIMINFO:
+		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
+		if (IS_ERR(data->clk_sec)) {
+			ret = dev_err_probe(dev, PTR_ERR(data->clk_sec),
+					    "Failed to get clk_sec clock\n");
+			goto err_clk;
+		}
+		ret = clk_prepare(data->clk_sec);
+		if (ret) {
+			dev_err(dev, "Failed to prepare clk_sec clock\n");
+			goto err_clk_sec;
+		}
+		break;
 	case SOC_ARCH_EXYNOS5433:
 	case SOC_ARCH_EXYNOS7:
 		data->sclk = devm_clk_get(dev, "tmu_sclk");
@@ -1112,11 +1113,10 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 
 err_sclk:
 	clk_disable_unprepare(data->sclk);
+err_clk_sec:
+	clk_unprepare(data->clk_sec);
 err_clk:
 	clk_unprepare(data->clk);
-err_clk_sec:
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
 	return ret;
 }
 
@@ -1128,8 +1128,7 @@ static void exynos_tmu_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(data->sclk);
 	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
+	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.49.0

