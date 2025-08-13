Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50F82E62B8
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090628; cv=none; b=j1xxgGGyBpzqi5SdB1BFwAXMnlupfNBezrqQz4l4iWvNH23iGp/FwimfgQ78kq839Fp4bjDgEGKXFjEqhE3mf6oJsQ9L9twD8Q5nrtgFm3PvTnRIBjPdTuxl+u7GnJarWP0MsHwK5uqjsTPeWKSJCGQRWIjVCj357gwpznn4Ewk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090628; c=relaxed/simple;
	bh=oD0dmmV1YNsrgoSjywsnehfaZYq1IVn7uaJwmsHT/BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coqDJF6eekhHq7VHc/4146glqqRqVpsi1qgndlBhqGpGshsXppNzqZN+rgqPzAtXfqhBF5g3cMFwZgyWKChLl5THL6WaYQBYz4tR75Ah30LtaC4FYydWZjiA4TGucslEF/gbHMNOl3Cyyomo4AYgV2Y9cf0hSRHZYjz2uDqp3js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIrCc5a0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIrCc5a0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2403ceef461so55317315ad.3
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090626; x=1755695426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG4pARlDAw18OrFTiRSr5DlsNU8/MwRx1OXaTCPN6v8=;
        b=HIrCc5a0mVA27PrIXrsH2YMR/6Hy5NcWk2Qk/SYz3Oh9MUpEOG0hStUN9PiRnI0dTz
         qfJG+Nfb3MAo0uwL/4RPJa8er1Don2N1fhasqm8hOe7QshglyNjqp/jB15J+y5iaPT+f
         n/VnEpMzskWtSwaEqNZEd0qLMRgAHCdR/4uWmMujeRJvITmRt/yoR7IiAA8L8tNFCiPI
         TfvGkriea0xgKRwWsY40GFrHuVIELwSqrSjJwMbIYju4X+dgsNEegaMTJy6MiM2qoiKl
         U8NVdsAhuUU8acsVEijCJdJOeu9iKSFgQ07ft/4Ho4izoLn9/z7v3oetFwdlOem9rj4d
         TXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090626; x=1755695426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UG4pARlDAw18OrFTiRSr5DlsNU8/MwRx1OXaTCPN6v8=;
        b=Y/aS9blnqCPOsyfpvTXHRUzRGH6AGl9vxbC28ZCI753jVb3EkORFp1IeO8DcuLcAp5
         xOrwYqyVDlxBuPuVUvN0cC8JhZM951iWmuMaynwu31NPN99pI4PcZv59ysIwEWKSREQb
         WG4BqBiNUrw65+QGrdKIXAkqxnPC+d+LlxIOAiHUu+GQib/PmfyFTgvJzepAIuAO9as6
         /iaEGQk2ijnmL9J3wQ8ZMuScIru4AKFIqnrehXEkC4OE1qnvQOigWbHuQPXHBIRc2cY0
         P3JuTFAXwP51p8bLiEh5v+F3PdWwifsxH7DFydsmXhcpxNWxs1IQ8opEza7W7Yi9X+Nz
         gjRg==
X-Forwarded-Encrypted: i=1; AJvYcCXXfVXVvKO91a30u1MssbBwKDe9dRBaiOeKqt4WRGKF47QfC91fiCaMFf6OTBEYy+aZvtMn@lists.linux.dev
X-Gm-Message-State: AOJu0YwOqWheYun/1RgoJHcjIiaF9Munzp8eXEdM8jrq0oqEkgitaPES
	MFlEEZOhJJUtjjjfjwP+nheYo2os+LW+TD1W7bCfLOicOL7DuiOmG6dZ7SEsGfAE
X-Gm-Gg: ASbGnctdIgqYmzRTXfNWlqN4Bj+U4ocELYE3GlcjuIw10vuHhFtevWCicDgGG3BZSyL
	8xLrts2AuDnCN9dU3g7dQtgfDC/iuf5wCnW1kXYBS+Ndrq1E4eqvg0swKKirLQBXnjH3pDXn2fh
	haRjvLHl/y0K94/SNf65osrZQhlzlNeWk1J9jzrh7NCrfd7Az1nkYbQBZXKpdJfuCKG6g7AQ5IN
	P7Slt8SfyInmUlHtjSxL0PEG873UEa/huZy/mCSABPfn4VOkxxcsN+rgHIJxNX70ljvIuqqZ8oU
	8UDe62NZ1y0bsdQ2Wt6hBEl+XwQp50ZlU52f+bFD2YRdTgGHJbSBLo7mo4AzfMIgL96qLXzCMag
	2U+pI84W66TMewFDizB99hAHDEkPAqws=
X-Google-Smtp-Source: AGHT+IFd57vkbF7WYJea3UbzrtHWKTatJ8rhcobI1fZJUuNQHNPJZ1FbYMb+zauhjR0/EwOIHErpFA==
X-Received: by 2002:a17:903:2290:b0:243:3c4:ccaa with SMTP id d9443c01a7336-2430d0d4d45mr48870055ad.19.1755090625823;
        Wed, 13 Aug 2025 06:10:25 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:25 -0700 (PDT)
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
Subject: [PATCH v7 1/7] thermal/drivers/exynos: Refactor clk_sec initialization inside SOC-specific case
Date: Wed, 13 Aug 2025 18:39:45 +0530
Message-ID: <20250813131007.343402-2-linux.amoon@gmail.com>
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
v7: None
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
2.50.1

