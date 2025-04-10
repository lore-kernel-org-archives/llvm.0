Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63E204594
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 06:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267111; cv=none; b=X7D1w7noCU0M9Jlo5RwpnuBZQD1+QVn/LtxBEMrx74JQM61f8sKHVfI0EPfcbXxZeIaJLStiBIKW+kSPu+Sejhrcr+7XSPkiD1JVMI3spGxtP3lbuHoTXApepeH1+Fwo8Szi8H8uCP4vrx2+Shta/rlQ0hUCdDOZ+fdKAS8c6Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267111; c=relaxed/simple;
	bh=dSHRhmk880+LUvoNTvzX98ByhUndNuKtjnVonbl/qlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2Uqdx/VSR7XYhYIRU2d2Py8Anyp3ZukodBW/vTDYvrB7LUJ/IX6o9GpjD0zmWxmua3MbckrpGFzuqKRMiIU8lKPuEIBI2KwZ4oh5vxVvVl/fwCCaqOD/Ba4tHq7mKz1+lgxb7VaXxuJHQfiAA2v3dl5qIPTdYOsoWpcEYd9Tqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUJ2Kih4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUJ2Kih4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso363942a91.3
        for <llvm@lists.linux.dev>; Wed, 09 Apr 2025 23:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267110; x=1744871910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwBWVtKLvZUX90IaL1GXJa6X4Osy8NtQPUZg6YVkZI8=;
        b=WUJ2Kih4JgxVLMQlkC5c6nFMRlQdy/nrmB8SQx7IRmlHbRyp7XZgjdDZhp51qUCcMR
         2tr42pCsS7TC4k6Qur1V/e7uZr847BCj31SlCAM0jJtzq4BW6Ma7vxIV34iXlxfyQ6V2
         RlpKVbFCLQahvNO4SHtawZhp89toXszOXbeuXSmrCTxsIR32lsKGAPi39vFqe0PHsxaR
         +qtAO+0MDzRehuOY/LMGFJHUaDFwgP30Q+3oW4HIKudexnCOyaEoYpNnETRpBgYOHyLE
         hcg1J1hJ6QgpZCqVs3V/ObwB5dm8Dz2PmRkB36Zg/cBbjBvrpPrEugQay5198fxNHju8
         1Vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267110; x=1744871910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwBWVtKLvZUX90IaL1GXJa6X4Osy8NtQPUZg6YVkZI8=;
        b=MjHSh+O3uxoc27XErpu5la3ciHaxuhgVbNSDB2n26cRHPFC9Ot7Q6KepM1tcNLoqRq
         DCw0y+B2+HgzK61bKP+d3qnJALjHFdpqwsCERMLtLsmo4tQCi6twNpFcOmL1H0hlWBdl
         c2l8YgHCovfVkvQjl4U9vqzaAWt0A3exHO1w5ly+CYv5vKAVR/ys/mBBm9WQyyg+EINh
         gNBdaW65QPptj7hiLc56cszTDjyvxiqZDMHVv3jp6hHtgMPIBsFA73ePhXtjoieG6zdK
         DXCrjMJNSVzwQasf7RtT+C/Vf5wEd7izFavIaDsZ2YXPn68ZMolsrySfEz8o4vx0WPAo
         xM2g==
X-Forwarded-Encrypted: i=1; AJvYcCUdu7oYQ/axUgxcB5ZGQcPAdFQJ0y2PZboVEWp5utODr5WHnkWEJyMf+u0vVMJc8IC5YBPY@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm3pfqbG7IupefqXIs7SSdbmWvrJzXzSEJfjMlonkLaTJTkgF4
	JB37be4x57Cl10QRLIPqavMxP5ODt/ECSAgAlUgRSuuEehCMk0Tp
X-Gm-Gg: ASbGnctuvXXyp0GEF46TEKkeBobLIDu9cSTmMvz27ortbFNNqtNi5ztcIwXSEizY5mj
	Y15hSVWy4GteKRF2p78nPzBwhQuPmTZCcIUA4+rQBWNT2xf5XwP9xbSHKsuI/UrIxmW7/O6LQST
	XJd/mzHQMhtH2muxdyU7kwjMqjnoVC0N8dQMh5hhzeaW3w99IMlZCU49owU0+oQHNpXG+u6LDRy
	j80H2tfAZI3mpD05zjf5z5u7ixB6AM8/CVNRKCTMcbzfFLocLOOjB+vAmKCWpA/HtUZY7Uo4w/V
	pixYkpAFFGzzYe/eVK/4ATZdCCx/EmAKNRwOn0+p2YqADmGkqw0uUv4=
X-Google-Smtp-Source: AGHT+IHqaItgHXzm5GD1OOSPTM/mlSU8yR/6mCWuApDW+XD5J+FRkiOjtHdGHPDLxBBGTZ1nuFcFiw==
X-Received: by 2002:a17:90b:56c3:b0:305:5f25:fd30 with SMTP id 98e67ed59e1d1-30718b5408dmr2785207a91.4.1744267109577;
        Wed, 09 Apr 2025 23:38:29 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd57865csm973145a91.2.2025.04.09.23.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:38:28 -0700 (PDT)
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
Subject: [PATCH v5 3/3] drivers/thermal/exymos: Fixed the efuse min max value for exynos5422
Date: Thu, 10 Apr 2025 12:07:50 +0530
Message-ID: <20250410063754.5483-4-linux.amoon@gmail.com>
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

As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
if e-Fuse value is out of this range, then thermal sensor may not
sense thermal data properly. Refactors the efuse value
initialization logic within exynos_map_dt_data function by
replacing the nested if-else statements with a switch statement.
Ensures proper initialization of efuse values based on the SOC type.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: None
v4: None
v3: Improve the logic to convert if/else to switch
---
 drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index ac3b9d2c900c..a71cde0a4b17 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
-		if (data->soc != SOC_ARCH_EXYNOS5420 &&
-		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
+		data->max_efuse_value = 100;
+		switch (data->soc) {
+		case SOC_ARCH_EXYNOS3250:
+		case SOC_ARCH_EXYNOS4412:
+		case SOC_ARCH_EXYNOS5250:
+		case SOC_ARCH_EXYNOS5260:
 			data->min_efuse_value = 40;
-		else
+			break;
+		case SOC_ARCH_EXYNOS5420:
+		case SOC_ARCH_EXYNOS5420_TRIMINFO:
+			data->min_efuse_value = 16;
+			data->max_efuse_value = 76;
+			break;
+		default:
 			data->min_efuse_value = 0;
-		data->max_efuse_value = 100;
+			break;
+		}
 		break;
 	case SOC_ARCH_EXYNOS5433:
 		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
-- 
2.49.0

