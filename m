Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55AB2E7BAF
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090651; cv=none; b=IYIRH3zQ42U5e6iECN+8PgAIVTk0fy1o/+fyrk48rU3zIwks796EABTQEPyT+JG/WvKbdvgkvyfEmbpxQGxQrlXgAc1b1rGjQm2ixTaLWa2cPOHMSIrLXe2293q9Yqq3vnxMwprEipXKxTdWbXmwpfbULAqvmqDC/PxpGPG4+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090651; c=relaxed/simple;
	bh=bgDOTihFN7L3uo6z3OGyDLMdghqDtCb8HF1nArl4feQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNwjdRi0g9BMSm9tFAWrPQXXLIK9i5uw5c+99ei3/vVok/xbTTX+d0bHP+gUOtTygS12h8kxxHPATBmeEh+1+Wml7P1UdhQ5ghp7S8Gw2KuWodJ1PaQpg3wXTP+NPa6EtXU1CmneQPxgFr+f1T2Oj2h4VH2V+nxRvyc7EdShlvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXeTRly3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXeTRly3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-242ff06b130so17413795ad.0
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090649; x=1755695449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEgfXQmBvwIZTKnjUPX92QY8u5Mv9cN/Yg04BQtYTgI=;
        b=fXeTRly3Ri4yp9uY+YRHWVORQwp86bUaeomzf4mCJtH4+oTQXL/ID7lSEMXYDFVL8q
         SBU1kwOmeZaTvvQw6xgRv/TqIWwG6q2cVw4vX8PdA80aNTrYPCo+sURmiLNncChEsfwv
         bs6cmIfCdPQIUWEcbBUvMHXhAcE2dhTNeJOyMYUsIHLlqlTI3C5mTxvXgwK4DqSZfloj
         Mvd0qpgb2KnWKxu9GA5p1bnvOFk3p8rmlRmGnyZNXsHn7tu3IkeymsTcvFQPyzf7HN8c
         KDsGSDMIGfit+5MVTUKZvwIT2bA1BYlSFymCwR1Z9vK5giBD1otGNUIprYRXchDfgQfG
         Lm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090649; x=1755695449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEgfXQmBvwIZTKnjUPX92QY8u5Mv9cN/Yg04BQtYTgI=;
        b=ETD+6sX50HhzeTMpYm4Nn3KKS5Q0u1NpG2rpJT9t1g5Xww1mN+1ynmnCd/FybQjKG/
         s84N8Ar0CT++PWAaJ8qT1lKa9M6KWfc1PdP0vYx6DTzqm/qKSknLzN7vWjeLttFoh3Ct
         rsj2j9M2HR+mk7ojlrO+ZbGXnQoZrh8NuJwr5kCvdUk6HyeQ8XNxNe8dgD2YUCDntOMc
         sWzFH8blN2VPM6A2BGKaG4rvSdx6eIeS76NZYXUBASDixIlLlcJc0RHH4YWZ8m5GcG1E
         d/dP5ZN4rlDYf1601ZX28hkIFIe8Ww1Hh0ffqW8dAbtoPlqxRWWC6IsZqXwYW0B0eds5
         bO3g==
X-Forwarded-Encrypted: i=1; AJvYcCXil7S1gKUjGLgW6Chv7hIBFNdAlKJF9LWCCU53/tCk3lARLc0AvSJ38XzovBcadM9Ab+J1@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9APsye6+xO+QP8JVNvV1M6goNg5jv2Ou8QKS2JKaAg+Zk3bzT
	p0Dt6iwZhGC2nN6bNvF9UAgPUUg/YB1VfzfzCf8tyNBbENVjQe2l4uQ7
X-Gm-Gg: ASbGncsvhRC0xB+Lw14jT6A7bd07IZILnqg5D4K6UoVRW5w9XOIeQBpUi2PnmbR/F5x
	+U6cSDwxJrKN2APbX6YrwUG1xwDQv2AiyT/4pRxwRF+5qROWU24e7Uep1hh3v0vZx6hJ0U4wxWP
	9ZYi35isXHrEENh5M1o0kjrtF6Yg3xR4GM3xSDrwsC1V3FdEIJiygtFYUh3Qblwo78m9nTsG0kC
	H9+cuIGUGQDKyymNELTitFHaRGMLdagJnksigNECOvLzUkuT1NQWPAoAtQKbFAhwDL/ie6rUCN/
	bAnIP23Y1vuNIYymlMe5miTdYuOoUnF+5RJkef71XxquQjhi9vcbE1QOjV1AsudFEYCmWVHjCee
	Eq2Fi8NGfKuEoTOWZrZ9hXUlAomeAhsE=
X-Google-Smtp-Source: AGHT+IGQetOgmxbvgH8GlqPCrs2OPO9JHPjy7ZNd3WOoXSBNnPAm/Dj6z2ZNFN01W49Z7HuDNX97gQ==
X-Received: by 2002:a17:903:1965:b0:242:a3fc:5900 with SMTP id d9443c01a7336-2430d0dc1eamr41861055ad.8.1755090649047;
        Wed, 13 Aug 2025 06:10:49 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:48 -0700 (PDT)
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
Subject: [PATCH v7 4/7] thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
Date: Wed, 13 Aug 2025 18:39:48 +0530
Message-ID: <20250813131007.343402-5-linux.amoon@gmail.com>
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

As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
if e-Fuse value is out of this range, then thermal sensor may not
sense thermal data properly. Additionally, refactors the efuse
initialization logic in exynos_map_dt_data() by replacing nested
if-else blocks with a switch statement for better readability
and maintainability. Ensures correct efuse setup based on SoC type.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: drop the Rb Llukasz, as we dropped the nested switch to set efuse.
v6: Add Rb Lukasz and fix typo in subject
v5: None
V4: None
---
 drivers/thermal/samsung/exynos_tmu.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 5f017a78f437..3d12e95703bf 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -884,6 +884,22 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	case SOC_ARCH_EXYNOS4412:
 	case SOC_ARCH_EXYNOS5250:
 	case SOC_ARCH_EXYNOS5260:
+		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
+		data->tmu_set_high_temp = exynos4412_tmu_set_high_temp;
+		data->tmu_disable_low = exynos4412_tmu_disable_low;
+		data->tmu_disable_high = exynos4210_tmu_disable_high;
+		data->tmu_set_crit_temp = exynos4412_tmu_set_crit_temp;
+		data->tmu_initialize = exynos4412_tmu_initialize;
+		data->tmu_control = exynos4210_tmu_control;
+		data->tmu_read = exynos4412_tmu_read;
+		data->tmu_set_emulation = exynos4412_tmu_set_emulation;
+		data->tmu_clear_irqs = exynos4210_tmu_clear_irqs;
+		data->gain = 8;
+		data->reference_voltage = 16;
+		data->efuse_value = 55;
+		data->min_efuse_value = 0;
+		data->max_efuse_value = 100;
+		break;
 	case SOC_ARCH_EXYNOS5420:
 	case SOC_ARCH_EXYNOS5420_TRIMINFO:
 		data->tmu_set_low_temp = exynos4412_tmu_set_low_temp;
@@ -899,12 +915,8 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 		data->gain = 8;
 		data->reference_voltage = 16;
 		data->efuse_value = 55;
-		if (data->soc != SOC_ARCH_EXYNOS5420 &&
-		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
-			data->min_efuse_value = 40;
-		else
-			data->min_efuse_value = 0;
-		data->max_efuse_value = 100;
+		data->min_efuse_value = 16;
+		data->max_efuse_value = 76;
 		break;
 	case SOC_ARCH_EXYNOS5433:
 		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;
-- 
2.50.1

