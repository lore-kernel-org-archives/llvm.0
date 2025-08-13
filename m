Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419732E7171
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090664; cv=none; b=g0s+Y441Nl/52qC/+IePPPhMIJU2/9omtXa6ZLCvqknLu6OXWJwFGqRLGP3YjZbz7nlQYBLNfzNGBS65CNjF1Es7YNbZua2acPDCB43wfEDdg8/NDnC9EpXfOWeOikFQC/VOsAx0bT/JXYtT4axJXiM1ZS7GHV51RIj/66wcDwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090664; c=relaxed/simple;
	bh=b98dUnoToCsBmGX1G41vyacrvIuf64eUskTa822rac0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnOPx/VD7L8BVNMZ82cXl7IQZFh5ptKCPQ4EkkhT6T/sP8ER2Z6aUTwYXBzIq+Dqo5WY21hTjAShmVMMiGHoTObQkaqB5am1NxysZMqnWBvGiZDNfCRVo88hzw356Oq4GLQM99ddrA2yOT+Ba+5T4SJ5t0BVQeqaJevNXgOefpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3+LWbEK; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3+LWbEK"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31eb75f4ce1so5802362a91.3
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090662; x=1755695462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLjx2S6qya2QQP45Rnk1O89a+/wYhcHKpSOmbPHkRVo=;
        b=M3+LWbEKCH/nbzKZJji5kZjOHX2bweaGjA2ZglCBhksSCwsmbIxxzR0MMb075UALD9
         wzkCneqKpQyOml7ff0PSEOGpQvwnbpxw+tyXlTW4A8EqQTQKBr+ddUpHxLJuwVgxzMm3
         h+D6kJJ5hhUye8Ai8MUeieL/Lr+ZasKMyMTqGnBz+UqA4UPdTCoEqUqV7Xe7tAYQ2GHO
         5f9ag0yJs1rS1EWsrLlEqAcKvblmu7IOP+hgLAk2Kdf+B8eNZKpZGyjymYAsMuyYGpny
         EynIOVeqUHbS/TQSPt/D6dgTGJuaPfWwcSVxP0gobfREY5/Ngn4UdmVQZpTO356/V281
         YOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090662; x=1755695462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLjx2S6qya2QQP45Rnk1O89a+/wYhcHKpSOmbPHkRVo=;
        b=H6dHGbq85UKGPjKNaNKIXvW2O+VrgxuufjUPbYzRDcaQoBCIYfCvn0Fq+/7QjweFBM
         ncN3W7PkDZXpqR0EHzZIEHN+HuBqalpOEXxuJyWIhd5kui4knoBy7A+eLXbN2h6LXSE0
         2TahHZixlbkpSfHZSFhjd8htdpazY/URyyMeABAvJIRFB3XT/Lodd3DXya9JoSmslr9g
         hU2OTPR8d/Rvl0TaJpVhY/K+uib2o3URE4e5Je93Zowbd+2RQhUsD8l76zCfTtrkWEqg
         JD89lGK4eu3l5EXukhjT+o2IrRV0MqErUw/tMd2SpRTaRHmxVhzpGshhA4x7L5yQs1K4
         Tqjg==
X-Forwarded-Encrypted: i=1; AJvYcCXBYjZJIAZf0t/kyEg8SeTrrRdJdEuPBwrR4+ZzeotC7xu4rjgqJzNU+1hLDPX8k7PyxKQ0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9e1arN+3T31l6PlYhwre7wxvkLpLvMPFi2BZDm/jux1Bsm1bj
	/+1zppLG4cjjEo9t+o1AS9BtB/CpPWj9+VtTvMLs6LJvZ4IvkpnbSXUO
X-Gm-Gg: ASbGncvQWm9ZyLrJMD95jidg+w94+QwgCiW8rEJ41WJR4Pco38wSfFpe98vdLYXXfUc
	ycRPTsOLr+a7yNbJDlnZBmtTZBl2KeBpaEMcPXUlohY+rtE8wU2GTgdddcKafSU3khYlwY0DWrZ
	ZE7RZPVfE6fNW/nUvbVSvb2Q2m1icpyCOaF+EDDO2wUpsYA7ddxCv7SfP1QwkqIeWXG9p4RquUv
	OAbp5/Yhd5YaFVSphM70Pas50W4hZFKcfgw7WXG9HId1GMJJQ1x/K+ZvW/4ON5hAqWLClVdYjDw
	8hhQWZJ1wPP4JEp22a3w3B/y4rSL8cz68lTLj/IXXcrAIPt5BqBewKQORrGZ255ucX3Kc4CsuqX
	9HCHpFB4oqxRnjaq4Cr99XnY5arI14Cs=
X-Google-Smtp-Source: AGHT+IHV88oyfqtBf2DtpCEKgt1vkDjkfjLKVgWMl/91X6UtdjP7QV90zUlO8YXIk/uwFs7b2yRK5Q==
X-Received: by 2002:a17:90a:e18d:b0:321:380b:9e85 with SMTP id 98e67ed59e1d1-321d0d65539mr3875136a91.8.1755090656709;
        Wed, 13 Aug 2025 06:10:56 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:55 -0700 (PDT)
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
Cc: Anand Moon <linux.amoon@gmail.com>,
	Mateusz Majewski <m.majewski2@samsung.com>
Subject: [PATCH v7 5/7] thermal/drivers/exynos: Remove unused base_second mapping and references
Date: Wed, 13 Aug 2025 18:39:49 +0530
Message-ID: <20250813131007.343402-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
References: <20250813131007.343402-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The base_second field has been removed from struct exynos_tmu_data
because it was unused. This cleanup also eliminates its mapping in
exynos_map_dt_data() and ensures that TRIMINFO access in
exynos4412_tmu_initialize() consistently uses the base field across
all SoCs. This streamlines the code and optimizes memory usage.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: new patch in this series,
   Improve the commit message
   simplify the logic to TRIMINFO for all SoC.
---
 drivers/thermal/samsung/exynos_tmu.c | 30 +++++++---------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 3d12e95703bf..146f29fadea9 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -139,12 +139,11 @@ enum soc_type {
  * struct exynos_tmu_data : A structure to hold the private data of the TMU
  *			    driver
  * @base: base address of the single instance of the TMU controller.
- * @base_second: base address of the common registers of the TMU controller.
  * @irq: irq number of the TMU controller.
  * @soc: id of the SOC type.
  * @lock: lock to implement synchronization.
  * @clk: pointer to the clock structure.
- * @clk_sec: pointer to the clock structure for accessing the base_second.
+ * @clk_sec: pointer to the clock structure for accessing the gpu clk.
  * @sclk: pointer to the clock structure for accessing the tmu special clk.
  * @cal_type: calibration type for temperature
  * @efuse_value: SoC defined fuse value
@@ -172,7 +171,6 @@ enum soc_type {
  */
 struct exynos_tmu_data {
 	void __iomem *base;
-	void __iomem *base_second;
 	int irq;
 	enum soc_type soc;
 	struct mutex lock;
@@ -444,24 +442,17 @@ static void exynos4412_tmu_initialize(struct platform_device *pdev)
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	unsigned int trim_info, ctrl;
 
-	if (data->soc == SOC_ARCH_EXYNOS3250 ||
-	    data->soc == SOC_ARCH_EXYNOS4412 ||
-	    data->soc == SOC_ARCH_EXYNOS5250) {
-		if (data->soc == SOC_ARCH_EXYNOS3250) {
-			ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
-			ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
-			writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
-		}
+	if (data->soc == SOC_ARCH_EXYNOS3250) {
+		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON1);
+		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
+		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON1);
+	} else {
 		ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
 		ctrl |= EXYNOS_TRIMINFO_RELOAD_ENABLE;
 		writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
 	}
 
-	/* On exynos5420 the triminfo register is in the shared space */
-	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-		trim_info = readl(data->base_second + EXYNOS_TMU_REG_TRIMINFO);
-	else
-		trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
+	trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
 
 	sanitize_temp_error(data, trim_info);
 }
@@ -974,13 +965,6 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	data->base_second = devm_ioremap(&pdev->dev, res.start,
-					resource_size(&res));
-	if (!data->base_second) {
-		dev_err(&pdev->dev, "Failed to ioremap memory\n");
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
-- 
2.50.1

