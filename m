Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914F125A332
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016422; cv=none; b=dvjPBAXLWL9lIQVFJWzOgoAAol+ukO5PUb01v8iFnEvo6S9xikM2wQV35ZZC/ndVb1HABulVmwnvg/548FIL6PzzHucLm02QpVgMYLgPsCTD6dlnjuyj9pMZLgAg0WoGfHlW5ij6wDQVYAp49VaKLWLmCi7wMGcWoFp8kmfSiBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016422; c=relaxed/simple;
	bh=AMHriJWtg25hnFA/So3L/EOWUqqACE2Z4o1uB6xjZeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8mVpcOiQ30vyTmEjRwA57t5PVVyLf24qgxbizQ6hHehkE8SVBge4eLRgZes9Dy0XYbDsvlIenpVpykHJaPC6JJsOxGzo+68IRdGeH0U8CPRaTEd+7C8K17/AVuZPLEMIahQ8H+4Xm2gmOmRtLRazIGufbP5Q36sRLGnDpGZ91k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzEKa2Wt; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzEKa2Wt"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736c3e7b390so7291928b3a.2
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016420; x=1746621220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvhhvpDOxzlX5SAkLZgkSUnI6uZuO15oKBiHsWrIAXo=;
        b=DzEKa2Wtl3ZJ6GCiTTwqvxVr4wHDKTnEnLJuUPFulx0mGDnY3TwlYSlxT5DxnWAZh/
         xza4wKcJHDehxb6YoXDPD9fR/V/O+rH9fi51ZSuPRiXHele1qWoUR30iqhN6Si3nPIyN
         utXHrYUvPh0ep2qXEhkG7vXIdTtZuzqANflfJ2m4f7nOUfY3udMHi9w+9nYOC/NVE+HD
         g0qD2wMkNqKcrs61I8seVvB1sia8qGvCvtuCgQu0OxELklwQEG5DO85c3d1rJOzpuS1A
         +Y7ceI/NErSz1KLq3kTAFjrZowc9liXHOC10Jzr53bwduqN7LlzrqMZHBKG3RP79eC5E
         n7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016420; x=1746621220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvhhvpDOxzlX5SAkLZgkSUnI6uZuO15oKBiHsWrIAXo=;
        b=WAKlPcO1NR1aTRiYHtBPDEQZSDAJC4CT0ZsoYLQa95Z2OUweQuRlU4LgYMTiBbAUh1
         /rKg6lOjauaEtqUbkpl+CT28QManQb4TJ0S+/u4ITe9Sfl6fkRFBT5sA0UDzh4v7mZxB
         4QXkE8Wth2okTlA3vjc2RUIP/eToHeX6ru7w/YYykmAw4QbVa1C9v9wL0OxnbRxnGBp7
         NKaguzsfqRQAuzK6xmqIJCFgUcEaJhZTLN/ioyCSfbavPjcQyVJTB9C8An+P4UWRJ1BP
         p04sGghji/3tFgKEACMhiT6VfvEsq8D0pCJgGiH5Xtb+ClGO2uRzk9dEmbTk44raZvSw
         uXJw==
X-Forwarded-Encrypted: i=1; AJvYcCWUhMhBkyDQzJDU/JYs6S/6Q7pYebi/fILsnS5pQmezMDQBX2nl2oNqf+vyoQ2w+Ybss9Jk@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6/E0FYcbkEmd/4fjJCRoAPwwt9qd7jcgTmhcptWv6IsHrRezB
	Jz5AypiVxm/BuzgJqHyJfz9GDiVhfgTkT1NSnHMNrKs9yZw6kWdZ
X-Gm-Gg: ASbGncvv0T0igxgvUuSD7GklcQjudo5f7I7BcWFGvh33XcJKtIduBaR6ArI6gx1njgw
	jKzEGqwkOKzhMBAd7paYqEXCdUD8Ryvn629xAp00/Q3O4CeoCA773FgJ+9lCsSO833y4Z1zjbb+
	5sAZ1427yPlLq194pKr22WPI6PkgNxz5Z7PnLCVBp3UwNg0Kl/T4QBmCrhPRpQZnklzSbw1SvU4
	qAF385eH3oM/AotD5UNd+gzx/KWngZAYsIepQBuegPcGRl3w8MbKvhkCVg0foqZ2WgVXpXkcYAc
	dJf+YSDuI/rvAEqyIUBzrcRMLgRDkG41rVNPmG4F/fwrRHRXijYBuQ==
X-Google-Smtp-Source: AGHT+IE32P919fQ5R/hcnyijMUiuE0NQgTE1aYia66YLx8XCG3ZA9kGC6cfX4skbXBq1rJ+lGp2Cug==
X-Received: by 2002:a05:6a00:1496:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-740389cb685mr3926486b3a.12.1746016419699;
        Wed, 30 Apr 2025 05:33:39 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:38 -0700 (PDT)
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
Subject: [PATCH v6 2/4] thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
Date: Wed, 30 Apr 2025 18:02:58 +0530
Message-ID: <20250430123306.15072-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_clk_get_enabled() helper instead of calling devm_clk_get() and
then clk_prepare_enable(). It simplifies the error handling and makes
the code more compact.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v6: New patch as per Daniel request.
---
 drivers/thermal/samsung/exynos_tmu.c | 77 ++++++++--------------------
 1 file changed, 20 insertions(+), 57 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 04517d52afbd..aa0726b33c84 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1036,65 +1036,41 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->clk = devm_clk_get(dev, "tmu_apbif");
+	data->clk = devm_clk_get_enabled(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
-		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
-
-	ret = clk_prepare(data->clk);
-	if (ret) {
-		dev_err(dev, "Failed to get clock\n");
-		return ret;
-	}
-
-	switch (data->soc) {
-	case SOC_ARCH_EXYNOS5420_TRIMINFO:
-		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-		if (IS_ERR(data->clk_sec)) {
-			ret = dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					    "Failed to get clk_sec clock\n");
-			goto err_clk;
-		}
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to prepare clk_sec clock\n");
-			goto err_clk_sec;
-		}
-		break;
-	case SOC_ARCH_EXYNOS5433:
-	case SOC_ARCH_EXYNOS7:
-		data->sclk = devm_clk_get(dev, "tmu_sclk");
-		if (IS_ERR(data->sclk)) {
-			ret = dev_err_probe(dev, PTR_ERR(data->sclk), "Failed to get sclk\n");
-			goto err_clk;
-		} else {
-			ret = clk_prepare_enable(data->sclk);
-			if (ret) {
-				dev_err(dev, "Failed to enable sclk\n");
-				goto err_clk;
-			}
-		}
-		break;
-	default:
-		break;
+		return dev_err_probe(dev, PTR_ERR(data->clk),
+				     "Failed to get clock\n");
+
+	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
+		data->clk_sec = devm_clk_get_enabled(dev, "tmu_triminfo_apbif");
+		if (IS_ERR(data->clk_sec))
+			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
+					     "Failed to get clk_sec clock\n");
+	} else if (data->soc == SOC_ARCH_EXYNOS5433 ||
+		   data->soc == SOC_ARCH_EXYNOS7) {
+		data->sclk = devm_clk_get_enabled(dev, "tmu_sclk");
+		if (IS_ERR(data->sclk))
+			return dev_err_probe(dev, PTR_ERR(data->sclk),
+					     "Failed to get sclk\n");
 	}
 
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to initialize TMU\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
 	if (IS_ERR(data->tzd)) {
-		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
-		goto err_sclk;
+		return dev_err_probe(dev, PTR_ERR(data->tzd),
+				     "Failed to register sensor\n");
 	}
 
 	ret = exynos_thermal_zone_configure(pdev);
 	if (ret) {
 		dev_err(dev, "Failed to configure the thermal zone\n");
-		goto err_sclk;
+		return ret;
 	}
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
@@ -1104,30 +1080,17 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 					dev_name(dev), data);
 	if (ret) {
 		dev_err(dev, "Failed to request irq: %d\n", data->irq);
-		goto err_sclk;
+		return ret;
 	}
 
 	exynos_tmu_control(pdev, true);
-	return 0;
 
-err_sclk:
-	clk_disable_unprepare(data->sclk);
-err_clk_sec:
-	clk_unprepare(data->clk_sec);
-err_clk:
-	clk_unprepare(data->clk);
 	return ret;
 }
 
 static void exynos_tmu_remove(struct platform_device *pdev)
 {
-	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-
 	exynos_tmu_control(pdev, false);
-
-	clk_disable_unprepare(data->sclk);
-	clk_unprepare(data->clk);
-	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.49.0

