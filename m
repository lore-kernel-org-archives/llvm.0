Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2080825B68E
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016428; cv=none; b=oDq8tGKLJmxhIlMMp0dcXYhoA7QdaSVPolR3wiXwkwZbGX9dW3LKbGJNtQehvQu6Zg8uNposRqlSS16xWx47UNP/rDXyX2/F+Cx6Mh/pdTwXIxGJAcwtzkKN4f9vmgqFsKnMmSY1bzTTHC5KMiPKvvJmyP00mRwNthVHrldZEfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016428; c=relaxed/simple;
	bh=NaQIDks9q3n5AJ3fdvvvN06Dc2CyVDzyDsG6sNYlTnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jD2cOz2VYmjnC2EEHcpVsIWycXTiKDeUCx5uSIYYYAqFwA2rLF7YXZmNvnnK7OaApzmBvdmsJb5UPwFJGnFFEx0DBV4+qvMmoh9Lrjo+bSjBp8tMhzSF1HE6k1MfOAN0cIHPolTs6MWumpxlpmmBX2vLrYB9kEosMpSVMUJAQVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkP1sHRC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkP1sHRC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736a72220edso7298169b3a.3
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016426; x=1746621226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3SNFYqaM9t1VFZcOe3OuDknXKerjgLDw3YgF3gLBg0=;
        b=lkP1sHRCayoRaNMk1lVI2h4Qzk6wOQ7gdrUd+BeRtOeM3PosixTKBKGHSwaNyh1pwa
         KVMqSvxOB7Xt1wY57UsiQHF5zp7l7qsBdU3su1Y5D7LlWGhtBIp13kVCSZ4OgL+PrVmr
         WI4iNpOHKn4a22lc/9R32XaSvwDnbttYSZaffXhMxF+rO/z/X6O8nw5GdhUxFMlgcidK
         QHR+elT44tktJZYVLCZt5cBhL94MTgBgD0x4hGUEGingbTrUb0sj1g3EAwR3HIVjnxD9
         WmID6HPWH1sKTa5ndJ5XEnW4hIELhUaTvlpyeeqVEM8dh6yLULuIPY7sI5InaBssxsmG
         Ds4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016426; x=1746621226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3SNFYqaM9t1VFZcOe3OuDknXKerjgLDw3YgF3gLBg0=;
        b=L/j+QziFDwA5zPTcwNRak9wZGDscEkIX2UtoN3nlD6d5za+nA4WFO5JKYpd1bivzUO
         /6eSH5CSPuKlCNLm+JR0ieA3wCHzGVBWeFPQGsis+jzRcSurFxP7lklxX04sRdRB1ce1
         MHDBKoBY+NvIVjLPVrScFb7fuvyG2+swE9f1Ot1UwWv6HjDOi9/VbL7eROPbC+AG0USA
         y/osusUukJLPR9sMrAKBrCi6hJwUF1G3RWON+NpMEK0nitDISnjo6Gg2XKJoWCdLETHl
         HTdQAGX7Q2r2l7vZjUoNY5V2zbF/e3TFvVU8hBWL1AJX6fIv297aCr4uvyI8cP34jZEp
         kbJA==
X-Forwarded-Encrypted: i=1; AJvYcCW6OfsP927Vc++2UbLWqzU7Z8ni+GNDlBEKIUb/hH1UKycCuoC2iunLmbL2G6y10FhujTit@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9jxrrRvp2fmikNxx226M6v4q7HuKJ7NmBybN6FIzMwzhnIbUb
	9o1fSH9ypxGtYzD3dwdcmmFgbRwrpxsWcKKvbykCiKAARqlB6DgW
X-Gm-Gg: ASbGncvoh/RTMRX+VzGJGgsttgOKRUp7QAjUysnX7UtfLN6Bj//SnYiO1A5mmcraAhZ
	jVwv0TFsx73ETWSnJEtBVcAxut6/BGmJdJgQv0clb3AgCKJ/MQupo8YUbuEsnQBZy0i0pP/i8q4
	RwZDUL0kMbuI1/SGkS2vLohEU5YieD2x+SooM9ci6M4PtmGjogtlF1AcO7ATzFhWFxey5mtTBP0
	oMlE7HHg4lWRNp5KiNXq4ooHIdCd5PQGlphNJ1QapjPtHREeOeph4MD9rxSRYUVYOnG0W/wHm81
	TMOmz17bj0dLRALAJPZGDGpgCUQM111TMOcypo4U5TEllz8MFgm5xQ==
X-Google-Smtp-Source: AGHT+IF2qnBTKenZ1AypOYLHMpucMP9SRa5u9iFuGqy1ut0HTtqxttm3kMbnkZczvm/vAv3TieOZ8g==
X-Received: by 2002:a05:6a20:d50b:b0:1f5:709d:e0cb with SMTP id adf61e73a8af0-20a8980fb29mr4306826637.39.1746016426310;
        Wed, 30 Apr 2025 05:33:46 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:45 -0700 (PDT)
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
Subject: [PATCH v6 3/4] thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Wed, 30 Apr 2025 18:02:59 +0530
Message-ID: <20250430123306.15072-4-linux.amoon@gmail.com>
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

Remove unnecessary IS_ERR() checks for the clk_sec clock,
the clk_enable() and clk_disable() functions can handle NULL clock
pointers, so the additional checks are redundant and have been removed
to simplify the code.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v6: Add Rb - Lukasz and Fix the typo in the subject
v5: None
v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index aa0726b33c84..5f017a78f437 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -258,8 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_enable(data->clk_sec);
+	clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
 	if (!status) {
@@ -269,8 +268,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		data->tmu_clear_irqs(data);
 	}
 
-	if (!IS_ERR(data->clk_sec))
-		clk_disable(data->clk_sec);
+	clk_disable(data->clk_sec);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 
-- 
2.49.0

