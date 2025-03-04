Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB222BF124
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107947; cv=none; b=uu1C/41Q9VF6iYJ7o8qX22OBAvCkfTKTIwBPDMkswru4SKqD5L0H1ladTDIKzXFdYT8NK9WgrNCUU20HHYzAIei/tkPp2Qk5iVWzBYIi5RO6nsMCrPC1WGPwx/9Coxtzdvw8bfqsLAe9hFV1aOP5XzELoAe11uniDKL4cPymNWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107947; c=relaxed/simple;
	bh=9NiX1CWV0hfu5OaTJtAP498kfcNRuxNWGXOfalDiImQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaz2VWiLsC0vhL9vhc/vMQZUIry8HVsFdog8E+Dtw9JwXhIbJNtME6tBjfcXdk25rHHcv/06P6LcZva0whbBOSUMaPgZ8Z673jgZLbT5XsmFY5kOEiNHGKaOGbhvprVqUFrE6PDfJNUFZgy+9GDFa5GEif5k+0QDC2+sIbT6/7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3fr8+ez; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3fr8+ez"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bbb440520so28439945e9.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107942; x=1741712742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=X3fr8+ezyN4HCc2r9ilXY+TtXJYRs+PzgJMJZ63EYP8SgNR9OhhuQtEwJem4CFr20S
         i6gQKRP+v3sTm5e61EYGRIbFTdrcl5XPf2LaaxKymRFi6etWAgpmT+rcyiDHvv9A5xwB
         jJAA6DjLXaVG7tOP5DUEpeRUD722WrmDBcEWUSqvZaIzPWF4jhaKpt0pEm6kBANQ6rnS
         AoECwiYM77BccOtbgGelKsec6xyHTlqQ2cIGiS3kVLY5T/cGX6gCz29CUADV8jW/xPSS
         sWNbiexQo+XWWM8C/IjzNUXpLU7XGm3AJmb1ZMxMa6LBH7zvKraAoRBP3l6ZZvEsxdJt
         B/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107942; x=1741712742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=u+2LYtB3bpLRJ1HhZuWxqMONwwige1P0Z+pZU7GTxeEz8syj2GzWpFgludUy7Sn/su
         oNTZZpbvZW61qITqvL70UZV31OXKcFZIP9+ijHWRGuBWhXte6Trvc5b9q17mLMNoMsif
         SCGKV7FUSHMkGIJaU5L2i2M+kBhNsMb3p7G4nGVVt7Un6D5K2tcSDoR+XZ4zZjaR8DuU
         9kkjgekUAYTTCeVvvaVtWA5VCBgUl47dh5fN9NQY1/Pd1jMmVcqf4BUFwUaEyHkj/QCm
         UFwQRYHSGJMSZD+pCA2ZxTVzufCq15dn2UpvV0bT6f9/ZuanfUG6RuJpguzQXunBi7/N
         uyPA==
X-Forwarded-Encrypted: i=1; AJvYcCXZZu5KIkPJNRK2y5b7MEHuq1WOMoQwRfR2C8a9lsCgr1YGiVm5suFo0//9+RhOT5PSmsbm@lists.linux.dev
X-Gm-Message-State: AOJu0YyzA6ioYL1qbZ6Se9eHMS0zwScEj5KnNmrFDkpOulGS2G9CxMj2
	mK8sqBG6+dU5u+IMmuci2hlcsiZQz+qyMqgwCwR6k7UwaBUb54VHcYY+aeOkgmg=
X-Gm-Gg: ASbGncvMuEi1sv+hHcaeKCggImWAVZFBGqyaHq4M/ezc1ORFKFQQa461O+EOu21XiAu
	HOSGtvFr8OvjP4MQEi7wkPcpTqKd924PrkrWRCAwMQUcEpVWUbToUgksPSUwX047VSky3PpmtBy
	jwI9wmHcSHtaxRvKaGM2N3bEy39+iSZODnYmCO0aKWUHxg+ZXo+nZs+We2UJvooG8WMW4pEZHMg
	TGTR3dt8FLnWctiL6JeCkQ1B9O71M5I9Uzl/EKJB/OCoCdeke1rjsdQFGTvAhwVNjiCgdlwfRjI
	mcwG+5MristbNRTVl0ru6I3qjbXHvFf5cpuQMB8M7Zi3OvRzz3/zFfRTpujPYuy6pqxX7o8I21S
	etBrTajD6UJtRZYERne9AnQnntVt1
X-Google-Smtp-Source: AGHT+IFBi6JjsYJDnSEwMCPY80NtpnY/0pWo317IbLvcMp22I1j/lVgkodnN+FQ/p9Zn6V6GISOI9g==
X-Received: by 2002:a05:6000:178c:b0:390:debd:70c3 with SMTP id ffacd0b85a97d-390eca25fbdmr19248281f8f.54.1741107941433;
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:43 +0000
Subject: [PATCH v2 15/16] rtc: max77686: use dev_err_probe() where
 appropriate
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-15-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

dev_err_probe() exists to simplify code and harmonise error messages,
there's no reason not to use it here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 6b0d02b44c8097453f704cbec9f02580fb869ca3..69ea3ce75b5a5426d4a56b979773be71c4ee7562 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -704,10 +704,9 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 	}
 
 	info->regmap = dev_get_regmap(parent, NULL);
-	if (!info->regmap) {
-		dev_err(info->dev, "Failed to get rtc regmap\n");
-		return -ENODEV;
-	}
+	if (!info->regmap)
+		return dev_err_probe(info->dev, -ENODEV,
+				     "Failed to get rtc regmap\n");
 
 	if (info->drv_data->rtc_i2c_addr == MAX77686_INVALID_I2C_ADDR) {
 		info->rtc_regmap = info->regmap;
@@ -716,28 +715,24 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 
 	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
 					   info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(client)) {
-		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(client);
-	}
+	if (IS_ERR(client))
+		return dev_err_probe(info->dev, PTR_ERR(client),
+				     "Failed to allocate I2C device for RTC\n");
 
 	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
-	if (IS_ERR(info->rtc_regmap)) {
-		ret = PTR_ERR(info->rtc_regmap);
-		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(info->rtc_regmap))
+		return dev_err_probe(info->dev, PTR_ERR(info->rtc_regmap),
+				     "Failed to allocate RTC regmap\n");
 
 add_rtc_irq:
 	ret = regmap_add_irq_chip(info->rtc_regmap, info->rtc_irq,
 				  IRQF_ONESHOT | IRQF_SHARED,
 				  0, info->drv_data->rtc_irq_chip,
 				  &info->rtc_irq_data);
-	if (ret < 0) {
-		dev_err(info->dev, "Failed to add RTC irq chip: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(info->dev, ret,
+				     "Failed to add RTC irq chip\n");
 
 	return 0;
 }

-- 
2.48.1.711.g2feabab25a-goog

