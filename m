Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E9426FA6E
	for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090643; cv=none; b=FBfc1Bcjx+H579bDQFQxLiKSQlBpjxaK31Gp8tQy6PloJjeeCMTJza1/8BNlj4DcIJ1qbRQmk8niYbMdDWhhuMH1m2lLwmRfpPTVWpz1S+zwYUmOAnZ18AeyXnykZ6MNopB+K504E0+VXlL0SHzWR825dUvWedydFfehklFG6+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090643; c=relaxed/simple;
	bh=b5OW2nvC0OiS+NDU9XbBImsCJbeszsgz9w9AdKXNSzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmIx4slUNsLXa4c1e53aqw5Ecb1lISzF1aK02uMlP5Vsqr5ZIalDLronOPWhQgRvfXkWYy36rwYS5iNnYZHwt56fprWVKrML31vaK1XQ2ZurghcJkedXnHB9mrkBWHce/UlrKO0AU9bn85APrrPcZTyj/V46/HMllIvUyXopxfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8TNch+G; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8TNch+G"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31eb40b050bso5662025a91.0
        for <llvm@lists.linux.dev>; Wed, 13 Aug 2025 06:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090642; x=1755695442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVrou259Nqx2mf6vUTvrTuOu7ushA+qQgGCR5MKGSus=;
        b=I8TNch+G+iSd3MXck1Eh7iNFiudSyk/xdWvpnxn5kw+mAj4F3db3wXRGh8ZvWgnTOg
         3GylI+FH72s9bmuCnqu0s2zaXdHqgkATt/YUDoiJLngD46nCrKGHk9+iG2F3soFIMLrO
         NLki/VRWKnSssmmkQbpxuzSy0S0Zvb6ax3t3r7T7GGAxCo96q3WgxiJl4BqiOWceUZIC
         ggUixYMY2oR878PLxjSYb2b9GyDRTS6pmBzFewoXeReygTznSfav6kSCOAQukqqKC56C
         lkRsiNDhocJRQ//WJTDFh45rGaYwfux8Kv3eyVh9K2nquqXcYx8fYHHUOBHpX22Hco7u
         2YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090642; x=1755695442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVrou259Nqx2mf6vUTvrTuOu7ushA+qQgGCR5MKGSus=;
        b=JxjLrvz/G/w+ueYaTcNB31l+5OkKG+Em9pj6BYaBJYvhbzHo3xfPCP+69JnxYGUnoA
         Igjrj0pApDIj6qeC0eNUn4VXvJZIgFMVuPu1h3TK0o5QZwuY0uuzoXm1PhwXEQLU79pO
         /oJiBO2O8yX/nt67X5waonn3Jp45VrLc5fi6WrIfd1E8bh0T7yvGVDoVt1FA1j6SlumY
         knHe/A4+9W+6oAuIhikY0cTAU1RtXkY6Wka3OXG1caEG4OspXMWBWNHWKFXWc4wzfR+f
         E+jb80q0ZHGVf1yhSVkQZFMJZ9ODCud1GRiUZBmOYmOqomtV6C+OWESceYGCMC4oQiKy
         1kbg==
X-Forwarded-Encrypted: i=1; AJvYcCUw1tEG/hT9CL+sNxGbAVRjAJI8Ahj2asLEiH1mqpRlNipLDAjLQu7JMZAWIUFWizy1upik@lists.linux.dev
X-Gm-Message-State: AOJu0YxaHBtBSDGypGta2jVCQV99Ow5ultdKjcPzS9vXOKXgCWSOSPhj
	PhsRAgSE5xNzeMzw5J8HSc17UKwNXAzyo4POQgHuOr0NHdRnd9X3Pl4w
X-Gm-Gg: ASbGncsTNLp4mgi9Yq8LuY+D6GraRQp/ofhN/oztHbUtOGTbkenxkhRNNJkDdY+oYSU
	1p4RoDxQoympUrgLp6XqoC3i/mc7SgfAryC9Du11IOEvGnkK4s2naIEtACpyCSeio/MMiRxA3ge
	F6cqvvLjd9YJ75+BDrYrTE7U3dKeIbvq+EQOslIralCwCnSfFeXcOV6oipwhQWx7CkXo9Tq9T2a
	eNex17Oo4gYdMh51binidKouDPb0wwNHHvG7yvjIUtcOTlmstguJnBZHTHrf+gazMprZ312hr99
	9rjDG9kllB4+Q9+VgC0oAnp2suTh4HUEYdJlrTNmvzwpyy4Qp9nHHZ5Xd3DAQ4skXt6n0owQP8G
	D3nh3wuQlCi3FusBnMythbyxNgzP7nwU=
X-Google-Smtp-Source: AGHT+IF9eIDvu72BaiBaVH/s5UjG5F3YVyyMdRM4uurQwBv+OhAFEyxqshUJkkmFATqSx/qzFuLPNw==
X-Received: by 2002:a17:90b:58e7:b0:312:26d9:d5b2 with SMTP id 98e67ed59e1d1-321d0b2940dmr4886750a91.0.1755090641390;
        Wed, 13 Aug 2025 06:10:41 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:40 -0700 (PDT)
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
Subject: [PATCH v7 3/7] thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Wed, 13 Aug 2025 18:39:47 +0530
Message-ID: <20250813131007.343402-4-linux.amoon@gmail.com>
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

Remove unnecessary IS_ERR() checks for the clk_sec clock,
the clk_enable() and clk_disable() functions can handle NULL clock
pointers, so the additional checks are redundant and have been removed
to simplify the code.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: None
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
2.50.1

