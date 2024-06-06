Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C8419CCE4
	for <llvm@lists.linux.dev>; Thu,  6 Jun 2024 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684619; cv=none; b=pDqluRkXsLX9ydKt61bjU+K3au2tjEdVEcoXda43tFFxZ2BrX+vuzww2m3UylxhkHFHxSD278Qr5pBjo5TXbOCWffcHWQCbw3W8qcFDZ5dKr1Lu1kpTTvXw+P+1x+w5lBf+nezOCor/k/bgIPOGG+naFxFKGh0ezvZeJWtg5Oi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684619; c=relaxed/simple;
	bh=HoQgcM1v61QTQaw7hxevdOwl+gFbD0LvX+R34v7HQUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+33UgkR63jEPF0oABflwlv37IaDI5IuAVgN/hhMkRnJT1X9IITVS5cdXLZ8flDQp5MsuGbem507P2jm6xv5r9RIpDL7YwQIYXYxsibPfbE6vRe/iTY52M7c4Jv5UlJEgzHO3G66p1u1zI3LHD770zfI3ryNrgR0dIx+JuodUWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glKWrBix; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glKWrBix"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42163fed884so1965615e9.1
        for <llvm@lists.linux.dev>; Thu, 06 Jun 2024 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717684614; x=1718289414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJGZ6Uu/K+CEvU7SenPD0ND/ZswoEpORmUYwGdFQeI8=;
        b=glKWrBixakFVJAKmevusVb3vd2Rs1ZstO9Tkwke5D1zN16IUauWhCbOtfjIbbBz4a6
         sHpP+/9GlaSXe1OpKII5TD0QQYXXlfz/2IVceSYBV30xRC3a4mSUa3kBPDvjoluey4zX
         htPpsqG1yjSv3amNsbxKlPgZXEpvzh+PytILJw0mYWoLvFT0fJTaW/1HNzjTOUAoAMq9
         KCkf7EisQ5jcnqleAgIDI3w3Q1nLnNPA7dQcFrItbgHD2v6yTymWzoiUDSNMqSUFBbpg
         fGQtHzpX26UldCB9QRpQBkPooq0P+S+2flF5nvIwLsLRAm47BT0s9RkcSqyO4DpgJokz
         qpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717684614; x=1718289414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJGZ6Uu/K+CEvU7SenPD0ND/ZswoEpORmUYwGdFQeI8=;
        b=v5RknLJbHZkdq7OYSkK4TwZps1Zint74qR/Fb30VO0ADWSpUHbC4WPPkL1XXEJAq3j
         kfZZ+2x2TrkvvIp5E6gCSrSmMhEGXMmpWVmcZhFxMQkS6s1wxWTKRzyJOkPf+M1T13sN
         VzF+2+xWJMu+XXmkucIGhwDbBM5TJlJuqkJ/5S/Rwi//z3P42mHrXEBenGETA08nVgex
         pyqyxCKJej6ddW30lDTsDnO1Mh9FYc4YGqkgJau/xjClS78ek5k3aoaVpMUzoZO9zUW5
         7T/SQ2L37oSoY8ZQObpeUQDYei8uQZ94fY8Vq6k1hAcsXsXDrF53SVYt/5p1pn6Ne8y1
         2d2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1LKy8c/I1KB38V0+/iJsWqebJsZWd+CTIGDxI5ZHRkVPhOqFX3aJc+sRE36e6ExmK8pD4RGTm9jdQWUBQtyq3GoBgzg==
X-Gm-Message-State: AOJu0YyMjNOV1+rn9UQKWoXz56eLvex/O/pkG+guf4wnRQfm4KXeML8y
	DxB+f+EX21CXVsMkLHRohaW3BXuOX+jnQMcxeQGn7YuE78+QND7Ba/LDkDWoKSY=
X-Google-Smtp-Source: AGHT+IHZn6oC9SB1W5aaL9cA3jdYYQVK4SRCy28QGjtvWm+2YyXB7pITSCWXefonmyHypnDRsqTmMQ==
X-Received: by 2002:a05:600c:3b9e:b0:420:2cbe:7f00 with SMTP id 5b1f17b1804b1-42156357f60mr46822585e9.39.1717684614611;
        Thu, 06 Jun 2024 07:36:54 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158148ffasm59540865e9.38.2024.06.06.07.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:36:54 -0700 (PDT)
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
Subject: [PATCH 3/3] mfd: wm8994: Fix Wvoid-pointer-to-enum-cast warning (again)
Date: Thu,  6 Jun 2024 16:36:48 +0200
Message-ID: <20240606143648.152668-3-krzysztof.kozlowski@linaro.org>
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

  wm8994-core.c:625:17: error: cast to smaller integer type 'enum wm8994_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Year ago this was solved, although LKML discussion suggested warning is
not suitable for kernel.  Nothing changed in this regard for a year, so
assume the warning will stay and we want to have warnings-free builds.

Link: https://lore.kernel.org/all/20230814160457.GA2836@dev-arch.thelio-3990X/
Link: https://lore.kernel.org/all/20230810095849.123321-1-krzysztof.kozlowski@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/wm8994-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index d5ac066f9db4..094c0b3dbd97 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -622,7 +622,7 @@ static int wm8994_i2c_probe(struct i2c_client *i2c)
 	wm8994->dev = &i2c->dev;
 	wm8994->irq = i2c->irq;
 
-	wm8994->type = (enum wm8994_type)i2c_get_match_data(i2c);
+	wm8994->type = (kernel_ulong_t)i2c_get_match_data(i2c);
 
 	wm8994->regmap = devm_regmap_init_i2c(i2c, &wm8994_base_regmap_config);
 	if (IS_ERR(wm8994->regmap)) {
-- 
2.43.0

