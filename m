Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBAE1B5EB5
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016405; cv=none; b=Xr8wAB1Zcsy22rVf9m/4fNz7E+KjRpQgwXzXf4aXZ87x8gu9hhKZKOgrdjZ1t6KGtTpnpjzc2BYayuIjADvwPTe3yFLPh9cXwowGCbrSfa0mz4MovDoCCZTSQhH7cIj/fi2TX9r8pIWD89zr15OlZJyJBVM1xtqME5iaIr+dWqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016405; c=relaxed/simple;
	bh=QE1eXScalgHxmtyBUCAnISzUPz40vvQfz63m7tDwp9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XFr/FcPy6lcoqyxMskiLxfMTXYl0QhbMC/uHxYFwWjLS0sivgjZOVNB5uMjsbt2ntN9rzuKR8TvfrvHR37WdDLfxsPx6J/B1ce+QBsWqgz1Fbbtge7WgUfKNBdKJl0OECBlEFCct/3CTJDTLgCIopNmLx1vy4qq3BQSIOChFaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/cXSr3c; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/cXSr3c"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso8931402b3a.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746016403; x=1746621203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdSQcajlIK6tpma2Sr4n3i15ecfXz4VYvl04vQPW1MA=;
        b=g/cXSr3chPro63hORFu8xoK90RyoQ0iAWOAxOsywJmiGxgswZx+uKPhzzOwyEZQWSb
         KZhqrrJWeYXfzDqLzxsjB4BD2kIfjbNpdbUe98v3c7vntnWRO8bWgjTm+1lDtiu07QLE
         uEV8wYNlUW0xRFpz9PTr5Aw3KKNORxiMUilKAxs1bZNFRCKoJcjcSitDl0JJYJR5Ze9O
         0xZ8uCbYPjC47S4nEJ6zepAYyfmdyu3EF43K1CcHG3KWVvD5MUHwzBYVvMyJqj4BFD/Z
         JzBh34hUzI36emZTADgOUKQCE6T6ANqthJcFzPsiKs08Kwv6tlvaSxiMs+6p4G+QQIGU
         bx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016403; x=1746621203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdSQcajlIK6tpma2Sr4n3i15ecfXz4VYvl04vQPW1MA=;
        b=DLIO9iHmsZwnotENxzQdcxQ4hMLN1akrv0F4j05zhUMbrKdKFVu/7BNrVP87WQg8zl
         jq5I5lS2a3nFoYkUa51ylGFC9bhLSR4e05falqKuPQb0eomhcIodBQtk/JSfz4e8Wh1U
         gb1URMkrXTQphMJxzvmx4zQcUhnuDRGb7RplBasULJ9AjS4gHawTI+J8vXe5gAfZH34U
         iBdF55nZfyR0P7ahJ8trdEvt3HpcGV1DU74gzKilx5ErWo2LqMjsUkArVOGSYHRBHR5s
         70H9gXOnpCv8A5k9XKjsqm11aVLtXfeqk4xfEdD9QRQeZJCymgLM7nSvyKvsi6Jc22h8
         CJ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVxOnnGkokzPkUvfeGrd8QLQJwoxHckVbcQwqf8KzXTUlWMtZDaDclQFdWGx8MrQsYlsfxK@lists.linux.dev
X-Gm-Message-State: AOJu0YzpmYoeXHmp1XVCUyQ7fnJfNQX50fI1y/olH4hBt4LHIxU7/mvi
	8zIpS87btE+LG0WYs7C7ZHYj1n4pHNBfZ9mM2E47Zt2ZdzzF7T+P
X-Gm-Gg: ASbGncvuk34+7nOvHrYy+izqN88SU7GwpZgtA38hdUjbz6oJuDtcZelUOmBKn5Lve76
	omDC+1VVUC6e3s1CoWMouNpcGC10hHiL6rT6gOTFhUHZNGqSZTa9fD4FN2sGC+Om9yzV9g94lxL
	aymxSqAhuX/i6rFYBcEqHgnjNIzLT5iFkxwnMlTF2C4R3xCZ2PU6XNzFSaK2q9pTraFFt1x2dVh
	+QZhsPVDBP5Cw744Xux6fWrpbZtfp9oCgED4noUbpQ6xWUwTSkcP4zax2frqIkd0kW2CI0kf8g2
	/glewlNPOz/xczohCVttrU0+CnuKvFk8U7AGceY5Ub0NXz1RdN6fkg==
X-Google-Smtp-Source: AGHT+IHnOJsQBzhcQ9TpiZPoszqGigEVNYSAiSPMVGDgh4sokgxfVZhCYJ5Y/qEVZ0ImZ9OkSIKYNg==
X-Received: by 2002:aa7:88cb:0:b0:730:97a6:f04 with SMTP id d2e1a72fcca58-7403899a55bmr4461719b3a.7.1746016403161;
        Wed, 30 Apr 2025 05:33:23 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a62e23sm1522627b3a.147.2025.04.30.05.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:33:22 -0700 (PDT)
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
Subject: [PATCH v6 0/4] Exynos Thermal code improvement
Date: Wed, 30 Apr 2025 18:02:56 +0530
Message-ID: <20250430123306.15072-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
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

v6: Add new patch to use devm_clk_get_enabled
    and Fix few typo in subject as suggested by Daniel.
v5: Drop the guard mutex patch
v4: Tried to address Lukasz review comments.

Tested on Odroid U3 amd XU4 SoC boards.
Build with clang with W=1 enable.

[4] https://lore.kernel.org/all/20250410063754.5483-2-linux.amoon@gmail.com/
[3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
[2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
[1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
[0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30

Thanks
-Anand

Anand Moon (4):
  thermal/drivers/exynos: Refactor clk_sec initialization inside
    SOC-specific case
  thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
  thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec
    clock
  thermal/drivers/exynos: Fixed the efuse min max value for exynos5422

 drivers/thermal/samsung/exynos_tmu.c | 100 ++++++++++-----------------
 1 file changed, 35 insertions(+), 65 deletions(-)


base-commit: b6ea1680d0ac0e45157a819c41b46565f4616186
-- 
2.49.0

