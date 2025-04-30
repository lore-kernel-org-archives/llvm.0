Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D1125B68D
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016435; cv=none; b=SlcCD0FHl/VK9ZPHA+xTUr8UTeLRFdvZ8o1JdqDmpi8zcnH4MpaVk8tvt4rO+FxLhydMzl6CoC7CFBauitHIDp++BubvxHOl598Gofr07o2/Qyj+qVhASRpSfjdR8hpGDfoM16+2AD/pDMfbxr+CHyFLhXDgcfV8VF1V3COl+zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016435; c=relaxed/simple;
	bh=w3jz2F7DYQyYj2UyhyQ+qsvOLyYvH1eF//AIxNpzRxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rJLQo4ig4Rehpq5wLGXHp9W7TTs5gRLvtEFuEVsHLgH2rsytmxGThRu/3GADTbX4m9S34GuDtZrTAiVxLWsSF9qaW1TkwzP+yTzeE30RRG6yi7JTCcBBUcj7pqAv8srj6lZ85Vd5maWm0XWloP/qcAvrd3w10Tva3yYLXwg1k0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEZQOk/g; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEZQOk/g"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c062b1f5so6142505b3a.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016433; x=1746621233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjF1aak/Vxutzt5SCKZiyBKrPP8O+zRq73MMdmerku4=;
        b=jEZQOk/gg9vERMzycMZHCq0eXCEhezUf3i7T9GJAHPcY6dP/AP5Yi31sKrRr7Tkqx3
         0kZ5oE4G6TwqlQc9qQsGQ8JIZEgJO6hS3uCS8PA3ZZhtWt6lV1Cbp8CUMK1S2td7CFef
         fgtFrqBcVgeSH50O5qAq1MgYLz4eQvcbulZYdzsgFyoaia4U/exR2bpz+0f4qyIKZHpQ
         6icM/IX3upJosrXAAeUugxps3MJ9pk9ke2XlZEEK0WUbkPm6V8kCd8sdhDpYEhHIFjMt
         80nDw6hxbkLB1iABivHLRialR6VR+6heU/P0rKDiyjF4YKwKgRxXVSnKj/mzlnY3Fnrv
         5LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016433; x=1746621233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjF1aak/Vxutzt5SCKZiyBKrPP8O+zRq73MMdmerku4=;
        b=uvr28NAP5Hb3tMbZEPj8gUMEXEWEJK0+b14udRZSEobqfVJri+6ejYRu+vucFhNF0/
         OJD8LKcbPAUdk9ug8Ardv39ghBSBPl7y8SxYNvcKAwh8L+BYfe0G/RIvXXmUUFT6Dfsr
         VEDvSzC/ESIelXRLljbg6MBh/oN9+0w7NAjKoxQD0RyFLJmgmPX89VZXe4f64rPpTRHR
         UQ1NZUe5RYo1R7LDYHqA0IaHeSHSXTDb4VoijUKFxyK75+2LYC/FTXv/WPS91z0pP/B/
         xrNQSdzvl8fpXGDjuJOgQPSzwLI8jrxvQkx5qzH+drCJKL6Rnw0NukyDItpoRJd5/PKd
         bEdw==
X-Forwarded-Encrypted: i=1; AJvYcCWAdtsqBlawx8N7/wdwcdy04w2H++JP2wBElFyi9sUmkwE28TtCwrwKAoxNT1xm9nvXlQo7@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe/wksgyjeHv+QewH882lsKPRlruVPlJEx8AUxRGZt+BwBK2qX
	w6JMcSC3GUWUM7hM61HHsj7yk2gq0xluCcVFVbBLyEsx+ektGd4u
X-Gm-Gg: ASbGnct2pN9e0Ms3vW4XC0lnIlB1E35vcEYwi7g0yrbzYKQTZWJM7+G/l/Aj+aaGl73
	c0MUW8G55QUbyTVlMF3utc8KedAXLPOsUR3poCNl6wTelIRNCtn+G/arQxVL+ChhGZC7ODYAK1z
	ZkxK3zZRDGPjL8L7y5OXu+u094qxvlw//1b2JsehO5XT3zFsU3+ks/jHCcggFqood9CvYbzQtVT
	QjqwkQEKyVGW/uscAYg/Y9dWw7/ay70QtEwnUcIiwu5V2uEtR7L1WlaGArVUpQvYxFP2qY3JxPb
	cJA+7B7PfOW3PL6NIGIG/rrANu5FjSXS+emuWjzLFmzjVtysd0f7lg==
X-Google-Smtp-Source: AGHT+IHJKBDe80VIu8qKthsvPbjAJ96qR6Xh6rsf0+iAijz4bJVrcEqmDWrR6oeCmx91YoLYuQSEJQ==
X-Received: by 2002:a05:6a00:3a29:b0:736:69aa:112c with SMTP id d2e1a72fcca58-74038989dc9mr3923336b3a.9.1746016432889;
        Wed, 30 Apr 2025 05:33:52 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:52 -0700 (PDT)
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
Subject: [PATCH v6 4/4] thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
Date: Wed, 30 Apr 2025 18:03:00 +0530
Message-ID: <20250430123306.15072-5-linux.amoon@gmail.com>
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

As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
if e-Fuse value is out of this range, then thermal sensor may not
sense thermal data properly. Refactors the efuse value
initialization logic within exynos_map_dt_data function by
replacing the nested if-else statements with a switch statement.
Ensures proper initialization of efuse values based on the SOC type.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v6: Add Rb Lukasz and fix typo in subject
v5: None
V4: None
---
 drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 5f017a78f437..ef216aac13ee 100644
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

