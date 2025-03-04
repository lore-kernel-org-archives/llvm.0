Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468628D040
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107936; cv=none; b=a1yzOBzvKrof6EgN/B2W/v7zy+7OSzEDPRuTCHjA/15w1OlKGyoJSwB3rSMhVoHDAH+OuUgazixtMepBUQxvjMtw/PPdP+JnhMGGxcmWq4DvNslfwc92mS4gdcNkyUh4xNAQ1X2MipXETsF88wOpfq0ziUY9swhqs0p/Kmqli7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107936; c=relaxed/simple;
	bh=HyCZnj76UJVLp2TFtsvoqPrnKIyS4fiKrwZnWeOiCGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZErpmp6sXXGr2CVTskhQckkuRWCsoQGuFeCt23DYmKbL1+6/Bc0/xIN3fvYW0hJG5fjjwQbGXzza3GjtMAnnxgzgyIEOD9HIHDTgN+G0eTwwp+N2s9rWPIfE+qadv1UeIFcCr9ePvivYqgISiBWAMyD9EiwZpfw4YWnbft0TJVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dD9TgG7V; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD9TgG7V"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac202264f9cso95906566b.0
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107933; x=1741712733; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=dD9TgG7VsAumWnm4nKOIVt4SBEyZvofGuj5FYUUsFXN6P0Jpf1ahMDf1FX1lKP4XBE
         AsMj+LfKXBhOtKmkh1n1oCRRCOgQMz9W3hcAfk69GIrRGB17sfWP7yA5jsaCeJDlh7Hr
         rAs9RawcixH8je6xnlG/6XVIuAjtjB0Brv74Up09JccW0vlmZ4Z1Iwn/mpV0zJH+wp9L
         8mx2/NfGbDf17mMmUprVgXXvFrfhgSiq5EMPxFYgoL/u/nR1ylnKV2VwwFwMdk6qdvmg
         7zW7IFr5fVsQYjHq0S2mJIBAcQvXeNGH+ekoqchmM3L7SS1Lw4Ri4sydmqvqtih89Q5G
         DQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107933; x=1741712733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=I+r6tAkXHoaEHC3gHnOfMLO2dOj9pVU7tlksPA5TaZS88gCJy8z9OnQczpqHVvPiB1
         K48pv8RH0MXGI5UtFGdmS0YgvClzccKmx7uHIoStmBNyee4VUDIOBzbRUUwgqAriiJD7
         vbC021aBuGlmVXRVvlAVPnqvcBd07NE3CM3M22gGnfCF5vjOgjTjCvpPL6lfNKxrjl6h
         RwUbxp69HtXc8YPGXIFK0rSF6/gS1dHLdrsJ1ZaAN4+xgCfCJOl/vKv1ENXpuuuCf0uD
         yXDwZMTyz5qfmonHZBkGlBIs7zJzRdIvaqyx0NJ6rYLswO8IPVTFPrpoJR9cXc2v84iG
         snMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtFXWozhZcPAG+DclJEpA52Glis/sHXfjUFf89tj7mVYw7FYNWcqmPotGwPQPIuRLAn509@lists.linux.dev
X-Gm-Message-State: AOJu0YxPcFTovkf3xGwWs6/mmysJbgG5/ISGigP1DxMOQTR0TzTqD0hX
	vU0ukJva+k0rLyzDGIfdjh6MmHrPzdPKSzC7Lpj6eNDzuXIVgHBPU5wy3BvSVMY=
X-Gm-Gg: ASbGncvHY4rifXbFU7Cavv5SHTic4pZfdhZg3xvl7Gcf140EhJfH2CoqGa+TeF/PF5A
	VFmu3biPWSIhtN/6fB8gSW9lID4T9r014TSGqUmR8MYDbyEC/w82zsv+cMfubrZyZnEqgpPyLo4
	o0+1xnlGmxI8BSHs/TXWw33V58H5zTs/zlmOnF3fo4kk/P2Cmw8/hcxLm/VmUIdy2cSmiwqxYxb
	GIWUMNsoGwfXcZHo5pcueeN+5Rk1lWMAIFqM/2xpoVjkMeJao3HPYixgAeWSyOj9qBr/N/J2c9D
	yaBe5nMpODg4k8dwG9RGMFkJlO3m/I9bLvOBffK0d/w8VQ+dGMElhK44tyDsBKI6WVwmaw4/qLa
	puocDIgkdP5Q8kRB6YJZF6TpE0Amv
X-Google-Smtp-Source: AGHT+IHVbcY6l9+JTAHHIw3fmIWanoQo+sapqWdolutCogJsq5sGcHSbYPT4D1lGvFYrwfxZJsMGVg==
X-Received: by 2002:a17:906:f5aa:b0:abf:59a3:df19 with SMTP id a640c23a62f3a-abf59a3fa56mr1580793966b.57.1741107932647;
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:30 +0000
Subject: [PATCH v2 02/16] rtc: s5m: drop needless struct s5m_rtc_info::i2c
 member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-2-d4689a71668c@linaro.org>
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

When this driver was converted to using the devres managed i2c device
in commit 7db7ad0817fe ("rtc: s5m: use devm_i2c_new_dummy_device()"),
struct s5m_rtc_info::i2c became essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* fix arguments to devm_i2c_new_dummy_device() - too eager sed //, and
  gcc didn't notice, only clang :-(
---
 drivers/rtc/rtc-s5m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 36acca5b2639e272dd9baed06ea5582f635702b0..88aed27660348a05886f080a2848fcabbf9666d0 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -146,7 +146,6 @@ static const struct s5m_rtc_reg_config s2mps15_rtc_regs = {
 
 struct s5m_rtc_info {
 	struct device *dev;
-	struct i2c_client *i2c;
 	struct sec_pmic_dev *s5m87xx;
 	struct regmap *regmap;
 	struct rtc_device *rtc_dev;
@@ -640,6 +639,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
 	struct s5m_rtc_info *info;
+	struct i2c_client *i2c;
 	const struct regmap_config *regmap_cfg;
 	int ret, alarm_irq;
 
@@ -675,14 +675,14 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
-					      RTC_I2C_ADDR);
-	if (IS_ERR(info->i2c)) {
+	i2c = devm_i2c_new_dummy_device(&pdev->dev, s5m87xx->i2c->adapter,
+					RTC_I2C_ADDR);
+	if (IS_ERR(i2c)) {
 		dev_err(&pdev->dev, "Failed to allocate I2C for RTC\n");
-		return PTR_ERR(info->i2c);
+		return PTR_ERR(i2c);
 	}
 
-	info->regmap = devm_regmap_init_i2c(info->i2c, regmap_cfg);
+	info->regmap = devm_regmap_init_i2c(i2c, regmap_cfg);
 	if (IS_ERR(info->regmap)) {
 		ret = PTR_ERR(info->regmap);
 		dev_err(&pdev->dev, "Failed to allocate RTC register map: %d\n",

-- 
2.48.1.711.g2feabab25a-goog

