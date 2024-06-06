Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6511974EB
	for <llvm@lists.linux.dev>; Thu,  6 Jun 2024 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684617; cv=none; b=tPNWvgfmNL1PR5hJlqua1ZpohFyBsu0VQy2+aWfjyruIjncYV7vSYXGVqJZ2zBQej2X7jEtH0owH+P/USmw7b/fhpz0xwQl9h5z6OxRSp9C8nHPlJlH99TK7WX34AJfCUm3TXexZv6TAkrn0M5tlp2R9nLaqbar2xz49EJFJCr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684617; c=relaxed/simple;
	bh=9gyIokVicuhxbeWTupBDVovN5lebwLBLjKOrrkbqEoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EK91S81/dt4P9AnPqnOedR5Wp0gG+ncwedcFN0WAkNztByjzTHDn1UTkMwQXocvRWpKir/g1hEuhQsFIPOkpPpwKB5yGSgJd0n9vFc8JbzNym+l7ns33pgoGQW91O1xcQkrq/3XUJm9O3sucnBpluh5y66ey3t/vD3hhgm7j6uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OLkb3e8X; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OLkb3e8X"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42155143cb0so13503635e9.2
        for <llvm@lists.linux.dev>; Thu, 06 Jun 2024 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717684613; x=1718289413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFnV2pRf1FmcK1ZExXtDIcGcJDZUgCsecv4UoOT/g6I=;
        b=OLkb3e8Xobph7PjZDIkDq29E14dp7IiFJZJPpD13MazK4wqDoe5Gkf7XgavqtU8N8m
         4ula2c4zbKDuh8coRhqALZVzimB1wG5HUomDID3bbeZGNkkvU+iDee0hLkeh/zeDDS+V
         /HPvCIsmDr7X0la2mox6L2cv/QN0d7+03kSTWiugQK7dCrdCZ1smP+0ADPp3UCiEs6Zi
         vTMBKScQ1jNeHNeNK9+jEgc1aHd1+UFmzM9pQFZJO7aqnToBUXTJfAv6TqxMSfpBxtpV
         HDiimrD0auDAKH13adIL6PustdZIvHy38D4MHTKj+otV55Rx5YNK19xu6pgTxuzVMMcG
         FK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717684613; x=1718289413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFnV2pRf1FmcK1ZExXtDIcGcJDZUgCsecv4UoOT/g6I=;
        b=qX0IiZg1ZSlwOiN+TVGayul9qlT3EgWBLXCiqIklKgLgEjeXkqVLRO15qEm4kTy05L
         HmviLNZiVQEgwDISDTTOmZ9RGUCZBJBKjbXWQrurnqM827lfDSKEmtO7ipXJKK0iDscl
         O5+6bydjnz7YKj/Zla8aaoL/oUKCMPXgZOzQ8WkVXyeA0UqaASvCu+E56uW5LuSeSXm9
         o7yTSUtgWlaw/uMnOKuTNoCgsWIRrFw37OZXbboPb3yvd3G0+WhuGLHO0ZdNeUd5LosL
         s9sPxF2Dm+MieJP4PAR2li1AagbeLSjEOWilyG+XRbUYhoVI2uGcRfBnM/xGbM64iWbr
         RPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBlMcJFGneWE6cvapqzf46nxMOsbojYl7a92HkCjzI3qB9RolLBmD+a5rC9GPWXjiek1bghnv7ufDnXBd0nAQfkhSEMg==
X-Gm-Message-State: AOJu0YzWfGgIyUST9hWcjFUHxj2ij1eZMxtjPsH7P1iT/hKbUHrBWh/E
	yWJqs6Jh2Qe39WEFUXMBIK9OHR8JHbPq72y6h6RdReq0E2zlhjnrq5s2xqecYUQ=
X-Google-Smtp-Source: AGHT+IEl9ZyRAcSIX5UQpPead73VIlTKgZG4JDvlzUJFXbj34q/+RJSy54ckSAI9W87xI9+q/46GXg==
X-Received: by 2002:a05:600c:138f:b0:421:5604:d1c1 with SMTP id 5b1f17b1804b1-421563503fdmr64858635e9.35.1717684613218;
        Thu, 06 Jun 2024 07:36:53 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158148ffasm59540865e9.38.2024.06.06.07.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:36:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] mfd: mxs-lradc: Fix Wvoid-pointer-to-enum-cast warning (again)
Date: Thu,  6 Jun 2024 16:36:47 +0200
Message-ID: <20240606143648.152668-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240606143648.152668-1-krzysztof.kozlowski@linaro.org>
References: <20240606143648.152668-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'type' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  mxs-lradc.c:140:15: error: cast to smaller integer type 'enum mxs_lradc_id' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Year ago this was solved, although LKML discussion suggested warning is
not suitable for kernel.  Nothing changed in this regard for a year, so
assume the warning will stay and we want to have warnings-free builds.

Link: https://lore.kernel.org/all/20230814160457.GA2836@dev-arch.thelio-3990X/
Link: https://lore.kernel.org/all/20230810095849.123321-1-krzysztof.kozlowski@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/mxs-lradc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index 73893890b50a..b2ebb5433121 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -137,7 +137,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	if (!lradc)
 		return -ENOMEM;
 
-	lradc->soc = (enum mxs_lradc_id)device_get_match_data(&pdev->dev);
+	lradc->soc = (kernel_ulong_t)device_get_match_data(&pdev->dev);
 
 	lradc->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(lradc->clk)) {
-- 
2.43.0

