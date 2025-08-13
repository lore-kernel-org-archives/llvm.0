Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13AC2E7181
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090638; cv=none; b=gGrwHbymR4lGjmlG67NbuWSEb856jG/wLxnhKUy+JzuiRud1rIRcj0K09rwN74t+aG35ODXuPaZfXgANKOVgnO8S8NoZDQcT6F1dLBBBhKroZc8jTfUkD4d24gjfrKbsncZfyrqNwzm2MgvIsElwQvVmNqIh9lIiiez9mCddkFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090638; c=relaxed/simple;
	bh=pErvtY3ihK17Sb6LHbdNsewtgB3895221qeOyAaYxy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZB9Nzd0rgL4GOZsKS5AtjfvCud4OLfe50e0QNDYBzDZpD4wZPjBWT5cFZoBubnvsaMNUr5PeIdmFM39Df+z2DVXm15KDou7JM081lwnapXKPaeXKODcFZBSDUOswd7o1wot6PmgCpRjM57hg0d30+C/8K1Irm/9E279fRz6L0v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTBvO+Eh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTBvO+Eh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31f255eb191so6741067a91.0
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 06:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090634; x=1755695434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=;
        b=UTBvO+Eh4labIU1EREG+Yk9nZtay4zxTQ+hOf5/DI8lrlt89SAn3jgPS6He6ah+z6/
         FoqMCDwg5Rhn3il3fUMUZmonjLnAmpQd1xiH9EQS4OwwYHinlHVFjwsKXWRM8ISQngFW
         j7KzxIcVF/vI9Z1sbPWh87AGiibANw/lIS3x3QRB1qQC/UaeAe6jhtrYZ5ujVZU30WEU
         zAD7VG9q0twjmWicRUtaOCemozu7jL787vUhYBFCrgNzAlle8LhdUs70JjbWeMABAv+T
         /J7Pt6jnlFYltqoUveZi5ggbGANT0v0PzG0BPz+YiHC4Rw83hDqdvsVfJKJsFyOcpzPX
         H1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090634; x=1755695434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=af3N+2yRmzcUJywzp/ZUMgm21c6Xt/FcL9OpDD1I9wg=;
        b=sNjK8DtbElAgpcxfYZTq/La3P5lwB1P9rFUMm6C1u7UMyAsk3g0PHWo1b8uwWK+K97
         ADBkHX9E7o+3lUML+iOARGvJxjFbeZWkHoUjcVKPIikmwF+D7Ga7ufprqcmKY5agrbaW
         aYYk1T4aKhLgn2cy2bLT8dKh9o2y3tn5kJ2pBPlNgv/Ul1OpJDTJBERFeTd4woTNucqK
         DyVc51FTlSxr2oyMKafFWwh9slLwani99Ey1IVoNSc1ipTyTlg2CzUvWkFvGjhn1OqOK
         w4YHenYNFeabvsYM6zuJSLG2BdQ/iG15VSY9jCrtukaOy7D6+L+f/lE2BWSONkmi/bXG
         GdCA==
X-Forwarded-Encrypted: i=1; AJvYcCW+GUe48yIgyt8/hVhTuACrRYYhlKyBgT4EFZthaxmI406BzFc194LZCzR2s+IZLdWDRMcW@lists.linux.dev
X-Gm-Message-State: AOJu0YyzHseDbGzxaxg20DOLlUUEs1hlZPM1Sl605xihPWvbNh1E+dPK
	6tdNgjyboyGKphEiBGTbzVsVegeUq5F+mQPdmwYBOXYeEAQUWpoQlGdp
X-Gm-Gg: ASbGncuROnlpLBLhZfWGveJE2dP1vx1twlKh2RHsOB7f4vSYZySrE6cFkVTve+X7aSU
	ghi/ZAndbCwkzhbpDaFE5h7BxUBJq1q3qczX6PWG52aZJyEoDvWPKV5OIpjggI0z9fAXF0dhsh2
	Q8dgXAZm62JopHC1QPaFN1fGJlvY6kxzYMAhT53Ywoa+yrRe9qwfsBMAPM5abnvQLRhVUDm9CmH
	b9M5XFAUgtkypKQZpRS8ruBqKmWuuRq6Q+F+Lz+kyxYCQREYtYuXenVpHuQW+OHD8ZvWgoZw5BA
	FpmKAo2si9lBp9GCORYtpSNqdjMY+NFztsmbE1kls7YKi+YEY6euo01LtzYNekBOXAUrYyThX2y
	C4xF14jOSytTaUN1la86UhfJsy+Ldun8=
X-Google-Smtp-Source: AGHT+IGEeZfwc8KgJ5Ns1b2FIvyMA302/9ltr/X8zgoJP35tdZsAS0jyCBmXwRQduH4q6OrS/apLgA==
X-Received: by 2002:a17:90a:d006:b0:31e:5cc7:133 with SMTP id 98e67ed59e1d1-321d0d68ae1mr4148290a91.11.1755090633811;
        Wed, 13 Aug 2025 06:10:33 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:33 -0700 (PDT)
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
Subject: [PATCH v7 2/7] thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
Date: Wed, 13 Aug 2025 18:39:46 +0530
Message-ID: <20250813131007.343402-3-linux.amoon@gmail.com>
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

Use devm_clk_get_enabled() helper instead of calling devm_clk_get() and
then clk_prepare_enable(). It simplifies the error handling and makes
the code more compact.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: None
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
2.50.1

