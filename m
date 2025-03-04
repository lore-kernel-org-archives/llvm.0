Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC62A286295
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107935; cv=none; b=U6ylsFNLqJuMejs2Ks/hMkeUmlNpDSXwLgX/7TBymcNn5BIudvv/accwKcG4OHpjdzxw7MOu5VfSt5aRuz6ZSrZhWRZmVKLFsDGV27289PC3h7LfpMb3hAC/AN9jfCjTSitnOkUUVW+PPmKkiZHd7iTYnqKMik34JwbCwI5ICXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107935; c=relaxed/simple;
	bh=uYPyL/IWo3+zxsKwPHXxHCdTPQr36Ok0GjwhGtYCZ8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXReRNV20JcHKq5uH425drqQQvdvKbYpBqb1Z8od9+M7hEnQWG/ipPmGlM6diEWpLHuHqQ9nw7Q8r+JmsSU4ehY5F8N8YE6WPrnjIxIsBwaD5ox6njieB9V1a5HWtUhYESO9xPb79bfhZSD7ajo8ieO8ryNAmAtN8bnPujm/3XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tt/yFth0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tt/yFth0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390cf7458f5so5517995f8f.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107932; x=1741712732; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1Zs+DHu4keoQ7nH0HfotkX9qiVtwoVoQvIhvtnI4DA=;
        b=tt/yFth0Go1FbvaisTWq0CmkeTG8SfJVUtjF6lBQ4d7eQLaRsOXs31uORvCgqOoXDf
         JIhROTuuAuAjef8Rkh1GHfWdmuhw3vjF5+B6FhwedXr+C7rgq75bu1+F/7F+zEoIUn+P
         tx8C6W+BMBYO4LjfazNEwxL3caT3LHBJYDTU+8p40SGi0wBsPPX4wBTc68BOK40YGyXv
         xkMbFJLhV0wwtun20hPBKuByi0e8VPU01zN07BYtwDs4olxOfjnb5xqH0YYNr2XSIqmv
         Rz2WztK7QGfh4H0fh01/kwLFgEHsMrhDoMigQEvFB8gc38kAvXLqL5swSjBFkLX033Rr
         Wn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107932; x=1741712732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1Zs+DHu4keoQ7nH0HfotkX9qiVtwoVoQvIhvtnI4DA=;
        b=m0D99zYBslLfTLOK/KbvVxG4NmtagxpsEZdRxeS0E5rvy0uxHLDv/V398Kv6Cb9943
         itMNnnC/ZUyVw3eL44xFXNQanR7iogve5hiDaf0QYrasI7zM9cbiUEsd+WKerDEtkhdu
         4MxCHiNU8bPfcylj38MyaCigEGAuHxa0gz3ntFDBcxZ2in9uaiM5AI8SeJAOTgFb0gDO
         buXECCAdCeN6wxKmOCjcM10UNae3K75xThoXFbp+4n0APRP256+/+IBw7sdSjtluORcR
         4qoiqaaH7mqPZJubXi7llxuJ9nUQAiabWc7rE4yYZFEliFYg6lYIoO7Nns4K3EceZvc+
         /Rhw==
X-Forwarded-Encrypted: i=1; AJvYcCUXx4IQZ9YRKej2duzlt+N5ZR2/BPjvsB20Vqhnar+R3ixuWSlUnpCEvK4QB5/4aI6cZBTM@lists.linux.dev
X-Gm-Message-State: AOJu0YzE0mNHAmYk9Y2JWnP/iMS5gg108/4QPpe0LUVDsEDAVYnfRgtf
	3xH/nXwJMXGZIL/3Ggnq+8zXgjkNqT92rq865RB3SSV+qZCCYMe89y/MjFPClZI=
X-Gm-Gg: ASbGnct4JYZ8/rtGjHXYdUjNX/XkHcg4nXSjrI4Px6EJxkFHjX4Q9dUZ4XycSRh5F2P
	rcKqi8xhzh3IC0NmnSEI4zWFVdCA5wQYeUCWE1yjOtQuwsQ3f1F6hjU5Kg/V65F9lVOgFyDUm+n
	dq44OqpMq6tOJ4LVrUg9Efxc3eJXvO+4v7DjVacmqrM2zzYzhhaqXHIm5vGT7QDQ/zjDVf7y4fF
	azPp8iZWr9S/ipQLo9nprcfq3u6W0pbJb39es+dzyNrFufIE1YefH3hYq+hQzrnJ/99fNS4y5vN
	YsE7/w4ys46Y0bKUi/R44PMeMdgqzqYTgOT7rdgts3Cw4nIus/6EhGTjvqBUcIFNV8L+gREEYpv
	o8JAI4rYKujTu7VIf+6NKVAwWMvhx
X-Google-Smtp-Source: AGHT+IHSc8pjwattEBJyeHF3OjOkT41+G9Y/Rh1pozPSubIjG3eC8i5kYIqu87xMZCHZm4ULB7j+yA==
X-Received: by 2002:a05:6000:1faf:b0:391:888:f534 with SMTP id ffacd0b85a97d-3910888f656mr7939190f8f.20.1741107931986;
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:29 +0000
Subject: [PATCH v2 01/16] rtc: max77686: drop needless struct
 max77686_rtc_info::rtc member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-1-d4689a71668c@linaro.org>
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
in commit 59a7f24fceb3 ("rtc: max77686: convert to
devm_i2c_new_dummy_device()"), struct max77686_rtc_info::rtc became
essentially unused.

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-max77686.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 7bb044d2ac25aeaaf2404b47b7e7bd485ae3d39e..6b0d02b44c8097453f704cbec9f02580fb869ca3 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -85,7 +85,6 @@ struct max77686_rtc_driver_data {
 
 struct max77686_rtc_info {
 	struct device		*dev;
-	struct i2c_client	*rtc;
 	struct rtc_device	*rtc_dev;
 	struct mutex		lock;
 
@@ -691,6 +690,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
 	struct i2c_client *parent_i2c = to_i2c_client(parent);
+	struct i2c_client *client;
 	int ret;
 
 	if (info->drv_data->rtc_irq_from_platform) {
@@ -714,14 +714,14 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		goto add_rtc_irq;
 	}
 
-	info->rtc = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
-					      info->drv_data->rtc_i2c_addr);
-	if (IS_ERR(info->rtc)) {
+	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
+					   info->drv_data->rtc_i2c_addr);
+	if (IS_ERR(client)) {
 		dev_err(info->dev, "Failed to allocate I2C device for RTC\n");
-		return PTR_ERR(info->rtc);
+		return PTR_ERR(client);
 	}
 
-	info->rtc_regmap = devm_regmap_init_i2c(info->rtc,
+	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap)) {
 		ret = PTR_ERR(info->rtc_regmap);

-- 
2.48.1.711.g2feabab25a-goog

