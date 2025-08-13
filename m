Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6087B3E1
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090618; cv=none; b=QUmpD1FXAnH2rvHxonpREVAmEdSZn1Oq0Tpwu1GWl5HujvZoKNo+70wboK654dCfsoKIGTTj7tnWStLWHIWxZjjI2TN0Ytef8JzjSHS/mYcNpEKiBAoGwVUBpAlZN6wyPHuwwLkpQgwfT8x3uNI5FKfhnC0TCmXS8KmufSwd5BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090618; c=relaxed/simple;
	bh=PxRLgfDUZ5M7CMDjuiGWnXQZWXZ4r0JiCDjmksMnW84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C6yYbYoPYJRuYodsjeEo3SyfDQ4LP179+vaB6r6BolSpZzLxDpducLtiwMV7QppKefAk8sAaIbnveac6OzmkJdZyDJw269THmQx5ahGx2MkdYLx9V/qbtaS1pTu049b3K8cBkcbr3CIm+FhZHWHsKgEYBqgzkgTBC++2QmlTuPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnaKpDm0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnaKpDm0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2406fe901fcso68847075ad.3
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090616; x=1755695416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScJXeGO5IweQbEuH9vxc5nxPkJnywpOyzMXLuxo14s4=;
        b=bnaKpDm0lCT0tadsTVCXaDsfHOaCvEq8i67f/YKGICD/wO0r5o0DEsTQGIWrZyz1vj
         +C5eQhGBeRuM3s2/rHcGWOFKuXhd/w+ljHrTtBwFNVrLzlOM7XePeMF38svEUPMOYTTD
         PJFMMDw8hj2KVQjI2PLJgRDD+4pwwTQcz91WmddOQyNa3nO5jtLZyDE8hnAOSZu2eu3n
         RCU4EOKc2josAF0YYJNZgZKnh8p/rg9ifClKrboH1OyIGxMNWg2jpW/HtNQZm0qYOo6F
         NJHeC6LkKb0TMqqkm0kF+5ZoUJZT0TPzXMeb61zhmW4dfSIcvJPnD2KY0p586PE8wa3O
         BoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090616; x=1755695416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScJXeGO5IweQbEuH9vxc5nxPkJnywpOyzMXLuxo14s4=;
        b=VATxU2gD1AIz7m8MR3S24CRm+T6WFtmb/LHNI1+TgH9zYjUQmxrVHhRAMH9+F9GCU+
         FUIOX+b3LqAgSCIf11qKs4XNuYwOrTWtbw1F9Q+ivH9mBylvxDrjHCydYHEeRWe912xV
         SC27YWoFWk4CZ4U7uh2l/0RQgpSsEAd+pQFF8VRANdl5YDYTGlB2VDPrksRlG3R/QySR
         qAjLRttsx4PbQm3e9ppfWIpAUGVWSlpidMqNoUcFU0n8NIxt8Kr1clBXLLmbfab/dbFw
         a6KDeeTW8DVLA/lgi5vke2N9/ZvxvFO2qRW2d6jlltfd7G30YaYoOxgov8W19Guj/5HZ
         61RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA96WysVgSzfa8cdPjZ1Xw44AoEL/FW0J1Cso3aPfSVVi3tkN1wpVhycdUcs8IfjFlK+hI@lists.linux.dev
X-Gm-Message-State: AOJu0YxjCu3Eu+2WepdIVDY86U3+z7CPWwY6UGblBLQJFBkyZXtU9JsZ
	xB3xqCpU0vncWAC0NF1SkRzKc3uZYPSrEzsq/fGR0J/WOpNGmjp/9XSU
X-Gm-Gg: ASbGncusZ7LyPTvjgPbbHaG+D0Ag5V66CuTzinJB9DhKgXMgNHqb5jqFAhPpK73A6mq
	RN96QSMKnj0CLK2veb1ZWn7neU6cei9SzLj4bUvvZ2PBMXKJIxWpd2lSDwhnHKM0pPz4/6KwjA4
	flYHlck9B3HDYUsR3z5U8OBLIv+qCAK8Yh9gGvOGjhozGGKyUpvJbMmyo+lirdXsyrh6s7IdGUq
	1r5J3jDkIGvpGgdfzXNsJCUZpfkSl/KNIFH9DvhW8nyuQC6DmJaWojbG2Qt1OSGq/hWeZG3gCkH
	ZYK7O3hsBrwhd7W41xgOeyy2OO/duVQ9rwprxEU0zunKLffzoWvDHQtmaT5VYZdaw1wWWpB0zgc
	MMxdDtLm9Q0KSAF8kyHYJ4gQUojUU4Ys=
X-Google-Smtp-Source: AGHT+IH33+Bx0AadFrZDKSUeKUgXROT5vWDMhH5ZAyjluyaTV5iWp5JdCqXwDtIfUbpUHGZSWzxXnA==
X-Received: by 2002:a17:903:350c:b0:240:99f7:6c10 with SMTP id d9443c01a7336-2430d0dc5a5mr54548855ad.1.1755090615667;
        Wed, 13 Aug 2025 06:10:15 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:14 -0700 (PDT)
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
Subject: [PATCH v7 0/7] Exynos Thermal code improvement
Date: Wed, 13 Aug 2025 18:39:44 +0530
Message-ID: <20250813131007.343402-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This patch series is a rework of my previous patch series [1],
where the code changes were not adequately justified.

In this new series, I have improved the commit subject
and commit message to better explain the changes.

v7: Integrated my RFC patch which improves the IRQ framework
    for all the SoC link below.
    [6] https://lore.kernel.org/all/20250616163831.8138-1-linux.amoon@gmail.com/

v6: Add new patch to use devm_clk_get_enabled
    and Fix few typo in subject as suggested by Daniel.
v5: Drop the guard mutex patch
v4: Tried to address Lukasz review comments.

I dont have any Arm64 device the test and verify
Tested on 32 bit Arch Odroid U3 amd XU4 SoC boards.
Build with clang with W=1 enable.

Please sare the feedback on this.

[5] https://lore.kernel.org/all/20250430123306.15072-1-linux.amoon@gmail.com/
[4] https://lore.kernel.org/all/20250410063754.5483-2-linux.amoon@gmail.com/
[3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
[2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
[1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
[0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30

Thanks
-Anand

Anand Moon (7):
  thermal/drivers/exynos: Refactor clk_sec initialization inside
    SOC-specific case
  thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
  thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec
    clock
  thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
  thermal/drivers/exynos: Remove unused base_second mapping and
    references
  thermal/drivers/exynos: Handle temperature threshold IRQs with
    SoC-specific mapping
  thermal/drivers/exynos: Refactor IRQ clear logic using SoC-specific
    config

 drivers/thermal/samsung/exynos_tmu.c | 279 ++++++++++++++++-----------
 1 file changed, 163 insertions(+), 116 deletions(-)


base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58
-- 
2.50.1

