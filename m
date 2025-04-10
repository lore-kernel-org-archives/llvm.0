Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F17220468F
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 06:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267105; cv=none; b=eefP+XwefkSA9IjSqbshaPq49PkjlUFgCooXVz+n/M23jZgPxemHfAOqzntNBTx8E4jp5xulGw5wMlLMdOCrqbwM6AiIy+hQRJSCtO0jHQuuPr55RysBHbNANqtQKQe3rF41t87i8IJTLnOklDl3MHqm/jbB9tpyQ1p2b8/zbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267105; c=relaxed/simple;
	bh=AhjyS9iknHRUdZaPGb+mlSXE0It5xEtfFY1mjlKImkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sozJZYm4aA+uwy/QldWjE29j3AbBT+hRAgaU+4LmPH6Pm3dy4AQxEFQ+18w3MSra2MhqOkCnJquyO5O48MoLgWVb6HwtZCFeqXOkcxtNfRS/u4K3mrUBMXYP7Xu0maguHrk3JonROK67D/ZYf/4TubLuv4wpJ7znHPwARh4jtO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHmO+Oho; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHmO+Oho"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22580c9ee0aso4547395ad.2
        for <llvm@lists.linux.dev>; Wed, 09 Apr 2025 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267103; x=1744871903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY9C2ohAdzqyv3wRnYpVxd1Yt/cF4tyWRl/ZSVb6rdo=;
        b=FHmO+OhoXqNDLGzIoXfmwOwrwEuCp38kyiGTp4rYPxShVTXqSTCbHIYrI9/xV6nCGh
         4JdcTje6QJqWLn5wKbI6lma4fKr29mVhkwh1uWQhSRLLe6/OBFK3EWgf+d3q4CnFf7R+
         ODxHyLTwKE6v7eX7pJG6bCPCXXok7vWu3oKeC/zhkgEh5jUmt9REJO/ikzQPmOX46+Av
         AEFSPfl3/xSQasLeImJFSEguSkxygQm23W8iK2+xc8+s3psUhwQD4bvNT+n4sXWr/OkB
         RLWFEvJyDacZYxoqWovzLiw8BSUGjyGLhUj5AuFjVvDW5oZvR5IkHXoOzpDH1YeDLOBk
         uP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267103; x=1744871903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KY9C2ohAdzqyv3wRnYpVxd1Yt/cF4tyWRl/ZSVb6rdo=;
        b=QRCn2xERZve8ZUq9Fe+Raqt1aLYtJdBgD1XZOYjKI3qKZRZrQ4aJMzFAd5AaXtYDRd
         yJa31GkkLxztuuNExpaaQwinwKswRalQ9bwzVjCGhqRC7j5EPJlCKQ6GYt11mSXythf6
         u2z7HCl7mnXy/7KZsWdiEVJTDudljy5Qv0D6WNyVthRGUOgDWhFwSEnv2baZsxESxmgd
         R217VlhyLpEU2upBjE4F6dnn4RuuiDXg/2PiE1I0CjEw4w/UklH+aKiqmeI7icO67atp
         LrjFAfeR1hd72KVMczLfcUDRcGN+p1jyFKSAJlohwGBSznXdAtOztK7bKHOMkSHuJxh0
         KwAw==
X-Forwarded-Encrypted: i=1; AJvYcCVdHsIOK+qtvPXgTMAiqaI2rjzfDnnQXjcUhM+0+3o/MZosGrXBBS93xXCq2qQdddJPXmEE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3g6+wQNtOFi28bldT5VMFdqy6QEm2E6nXumLfRiBjtmzUXiqB
	MCTZAGTmdwDjLBdeL6+QvYMOe6kRgBxBqhZUZzKoBoC3pZuLwxgT
X-Gm-Gg: ASbGncukoTes7bBQQXitLQ/ImEM+Jq3rpjbgQwHkmCpf3vv2yn+DmZUAG7X4GJY53WL
	PaoBYkShX3o6Xf0vhAgv8Z46Xm5SamFue5ExfwFTjrwCWNYhYW7krH5+JS4iwpSVW8Pfty0BIVw
	ZdcolWJXiZ7wLBVlvBTAtJMSsRqkOY6kTdtUyaF/RJ9DhaUfDs15fo8Zz7LDpC3SY/QxCMIes7P
	/zMlpHwg5qX8rIPVoKHbvPP4LUst6xbGjNcXOEIM630o8VH+9J9cTEUbOH7xGahMLmh3rh6FuOC
	YHi6OmlPpZfgNJtKefp1dA/wOJ6WD5APaMCKHW8jn4emhNDpKrkreyY=
X-Google-Smtp-Source: AGHT+IFesC5pq/Flznu9wGw7JQgIcSg+yrfPMnjQNGGmPdVTWxL+TEbq0QvSI6FgGfoZP8oQu6ZWLw==
X-Received: by 2002:a17:902:f709:b0:224:c47:b6c3 with SMTP id d9443c01a7336-22be02d17d1mr13927735ad.6.1744267103249;
        Wed, 09 Apr 2025 23:38:23 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd57865csm973145a91.2.2025.04.09.23.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:38:22 -0700 (PDT)
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
Subject: [PATCH v5 2/3] drivers/thermal/exymos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Thu, 10 Apr 2025 12:07:49 +0530
Message-ID: <20250410063754.5483-3-linux.amoon@gmail.com>
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

Remove unnecessary IS_ERR() checks for the clk_sec clock,
the clk_enable() and clk_disable() functions can handle NULL clock
pointers, so the additional checks are redundant and have been removed
to simplify the code.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: None
v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 3657920de000..ac3b9d2c900c 100644
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

