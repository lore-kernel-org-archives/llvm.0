Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89092235067
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016415; cv=none; b=jlQshl8wSYxICWHWzPj8lFfuUcqdtk7wm3yGJnfftKOh6mGUC1zo3uNv04VYl4JFBMM4D/T4X3wAGPEmWuhrKjJiEAkvs/MdhhinCQIbbXAXRtVqAXhP4aCMCDAlljMSm69WngWrfE6TTlQKiAxuMHVcR8l6n9fmF+ksLOcpzaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016415; c=relaxed/simple;
	bh=rsd0oMU+vi8Z/ml6XTpNx91MJVE9xBPx9VtmVuORW8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zov8Z1wZGfIEkJ5G7pUI1ZFBxDKqXNk3HDTJPLrtSCtwzI02b7heMcD+nvsB90P1SVqSZwySxMUoSdqa/Dx2msfUexL0yDNgp1wr/1RJCF5qtbfyaAl4EmQUq0hMr7TE2znPAUm98gTPpVIatyS56JVT8l2Q5wyFU1eE/kL0TkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4W0rPn4; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4W0rPn4"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736a72220edso7297953b3a.3
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 05:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016413; x=1746621213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf55HjdhhKhvLLEeAhmoJNEvXS6+XdwBwTK225CdBtY=;
        b=H4W0rPn4UQ9FoR1d4sJilKsQqPu2VVi2KnLZ8uPDazaw4xK7uXoUnK+XT9TRDfTv5g
         hmaQ7JdFvZDKnY8e3UW2tzWzf65O1KlPatlug59VEqB7o26s3uWx4wRZ2z2E4a+/9Zad
         f0UvyaBuSW8nsORFLXhGIYGkJMpMvaHChb64Yz7BpIPtOBlPkK94tHc2ZgK30hx/pPkb
         ngo3iedj6/XobBvuVxj24Q13lEIwOu7n+OQtkaSuIMm7A57gHfoWwpqu/mfmYlz7/eKi
         4Zeo+i8ov7CHG32uIPg3a6Suc75SzafZl2wIinBrdDwK8PVQyBOBIrFr4rI/Swah9cJh
         kJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016413; x=1746621213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lf55HjdhhKhvLLEeAhmoJNEvXS6+XdwBwTK225CdBtY=;
        b=Gxo8CMK1O3ugjim+fjas4NPrOowvCOzkfkGF77AZ4EHgf/G6A6mG5TGQQBF60KEYIV
         yZ42jhoyV+gUl6QO1iiPCVoTcpkofQ4Ca8IAXV4MxCr7CDXCMzFODk55fNylBY03NStA
         UR1pQOq4wDwrHR5ilSr0CcFD+rnJ73ugad3dwH4xCfrfGC2P18rKfhgCWfoRY+2lbX81
         BHEjLVHHocth4O2cLPlJ9seI55Et8cErRsJBvSooFqcB7gKjTR0+sZ6hW0mtatrBneiI
         Oty5axvg9S2QgYiwU6hkSym/mylrjH5vfjSLUT3wf+6lqXo930CUEMG7uqcsjfaFocuV
         Lg4A==
X-Forwarded-Encrypted: i=1; AJvYcCVls6iEsRikVk+JQDoTu82E9cpK2gVY9Um/iFpx+G43VewOzS/3gabyfgf594kV/YGyaddE@lists.linux.dev
X-Gm-Message-State: AOJu0YxrHEQLDZAGbvsaE50tVvyvQRZwcWR4YsAlaIJRVYjZ8XLh9gvr
	xbXoWrCa953imlky6VC9+9VLTho0Znhs1VerXl7Tdb7kpLFdPWug
X-Gm-Gg: ASbGncuZele8MHpWtlaZaDYQomBACGD/nt8Hj3Y85mWiWdT5ISHrFHNJA1l6s3zAWvh
	P4TzZECuccUkizsL+DxqaGnpRx+YTX3VJ9MJcJhot0riCeg32bOz1E7PcmsaSrBTOte0esnHQA4
	iK8RQIN3ytd7BGKptChILQjNLnd5dqFy13hJu1gM9wvaEN4t3mD/uea2E4t7etTZErN26khlBmB
	dINtcXNWMlB5bu+oLIXoE393n8Leko7CAywZBIveqPBk+DA351YoNKC073phFlnwJVmYxXxvQFI
	C6avCluNL5wxeXeCTnzgXhXaQxJB7SAAXBEJKme+wMZHAYkNcgAICQ==
X-Google-Smtp-Source: AGHT+IEXIBRnItsxJgHarmeNLTYGAGyI0xDlMc36p/yim3EbyhEaIx8/EJ3h3jrPHK0gWcrJ56Volg==
X-Received: by 2002:a05:6a00:2405:b0:73e:b65:bc47 with SMTP id d2e1a72fcca58-74038a8762amr4013535b3a.17.1746016412720;
        Wed, 30 Apr 2025 05:33:32 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:32 -0700 (PDT)
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
Subject: [PATCH v6 1/4] thermal/drivers/exynos: Refactor clk_sec initialization inside SOC-specific case
Date: Wed, 30 Apr 2025 18:02:57 +0530
Message-ID: <20250430123306.15072-2-linux.amoon@gmail.com>
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

Refactor the initialization of the clk_sec clock to be inside the
SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
is only initialized for the specified SOC and not for other SOCs,
thereby simplifying the code. The clk_sec clock is used by the TMU
for GPU on the Exynos 542x platform.

Removed redundant IS_ERR() checks for the clk_sec clock since error
handling is already managed internally by clk_unprepare() functions.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v6: Add Rb Lukasz and try to address Daniel review coments.
v5: None
v4: Fix the aligment of code clk for clk_prepare in proper if/else block.
    update the commit for clk_sec used.
    checked to goto clean up all the clks are proper.
    drop IS_ERR() check for clk_sec.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 36 +++++++++++++---------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 47a99b3c5395..04517d52afbd 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1040,26 +1040,26 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
 
-	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
-	if (IS_ERR(data->clk_sec)) {
-		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
-			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
-					     "Failed to get triminfo clock\n");
-	} else {
-		ret = clk_prepare(data->clk_sec);
-		if (ret) {
-			dev_err(dev, "Failed to get clock\n");
-			return ret;
-		}
-	}
-
 	ret = clk_prepare(data->clk);
 	if (ret) {
 		dev_err(dev, "Failed to get clock\n");
-		goto err_clk_sec;
+		return ret;
 	}
 
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
@@ -1112,11 +1112,10 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 
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
 
@@ -1128,8 +1127,7 @@ static void exynos_tmu_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(data->sclk);
 	clk_unprepare(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_unprepare(data->clk_sec);
+	clk_unprepare(data->clk_sec);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.49.0

