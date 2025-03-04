Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24B290BA7
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107944; cv=none; b=eIyPel6zM5b3J9iRBpe3plwdVaFsPkyYzr4sIlN4s0djzmQDXYOwOlR1cD3Fb6WTb7brc7XKpA+ft99TPS/pgX5ARzkO7WvQjZvdBnLG7XCJ2AqaxOrfKc6G/emeHykfgWeRcI75N0C34P2mt3YUcj2KeQ+KdpnOuMZ+sbNcb9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107944; c=relaxed/simple;
	bh=wcWeDWs75X61m+m4siXkgCaNrKLjTdrfe/93knsU6io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6vxc2nhmZUYUZaosN2EYU9OPA49I+U/8B57tXTTwB83DEfS+us/9LX+4+6BaJcMIU3AAx7pLVbvQato0mnF10UJxVLEGC6dNVDHIHA3FJWO9GXLrOh0bimRfoNwm3BCAAnjq8awqNXnv3u+UFEXiZF6LnSVcixFiYaQrmAhtTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvTnK7lz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvTnK7lz"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abec8b750ebso1023447566b.0
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107939; x=1741712739; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=cvTnK7lzzpOhMMJQXnhfRJVCU2yN1I4K42v2XmTIPrjiDzPtAu/PIw+FLSPuZ+0jJI
         ds63+hPXuqASxZCmulgapI1e34NtBxggbVQ0tyINkgX6Z33t3a9PP8PSht3XawOfIihZ
         f/vR2xYlfBeCBTFskQTiWtoNemGZEgtcXWtZTCimutQON1SqmkeBO9CxPdCGx/TSqo4x
         +6h0LGBnRt719mV2nG8qm2QlVHb61KNO3wP2AhCXDQD8xbkW1vD8einK4WyXm5qfcv9o
         ToKo5YyObBHZTD4qHfreJNZJoIqkwngKAT8ONwfFUAI4ojXRwVubV9NN1HFWRILUWEUK
         FNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107939; x=1741712739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=Fzh3Bak2c2HzFYgzfY0P1aFl+cBTbZfYPYayoSYyyl+NlfwXuD+pS4m8s3QLWRIPW0
         sCwm3kgEcFEi12VaUxKsT7AaL0t8pllDC+vDcsaTFsIjCuXHPY9XY0P4GgT8MeTtTOx9
         NUCqifrViTtS2S+RDQW6mfPRtDFk688HJcb9qmlDwckY58WrFNuAVXeSIA2l0AYTaIf2
         1gRHQ7zupYOvaHO8E9TBT1LvUPucL2tmUzft/ulG8HCmeu3dElwOKR598ewHq/ymfGLU
         NLcZNxJvItAJxWyYWM9VGhf2wbzjnietlzGq0iSQfTnf24G6K39z9ameb2bjbDbW7mGc
         0kUw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ir7pTkI5dCs+82amjwhQkctevwHEcFvDIAdi/0sF01Rk7X4LyI1p2N7HNUkXILczNCr5@lists.linux.dev
X-Gm-Message-State: AOJu0YxBtFPtlbd6sPHbHZ6Vw1/YZ/xSFILLhECOq+TJxjxZLIFE4zjc
	ULA0/t2IE6bIu0C9XW0pw+n1O7LQU9moBoksZnw0rbmnzAFAWGT1OFIXW+PyD3I=
X-Gm-Gg: ASbGnctohOG2UFFW+srcHBj6IsJsKB9Cv47uxkulW06sQQvY/XNSSN8SgObAqis9UW9
	MnKhjKL6fqdLItCztisQY02Q9cEJ/Z14V3KZ/k6D60Sq0W4DFMPC+ncxrSLnXusN7i5HZr1Ktmy
	fCxGVeV+yrPZWx+qKGCk7rxogrXiE8QAZ2vTRwmorthkIm8mHwhPDYFaNS/hYg4w6516RC9+hsC
	0kLUw4nO5fC894AYqNIwSHTew3cDVR47yPPxVx0H94xkkpO8f8BkV+WclEv+0YBcW/tJejvLMTI
	9bflFivq/N8UjkVUuH548rMGJxIYthBP7dsAq42WPKuscPrs504lbBxGmCjOfJUcskO3L2V7tae
	PU0hl8RYVC4dxfebYgoba4dVHFHSK
X-Google-Smtp-Source: AGHT+IEZqUVJFopMcdCw0Fa6138jis8STGfKBc9DN3g8sZLmJaNDRTq42x6nu+WBoJl/BXVMQfaxGw==
X-Received: by 2002:a17:907:97d5:b0:aba:246b:3954 with SMTP id a640c23a62f3a-abf268263f9mr1810089466b.47.1741107939344;
        Tue, 04 Mar 2025 09:05:39 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:38 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:40 +0000
Subject: [PATCH v2 12/16] rtc: s35390a: drop needless struct s35390a::rtc
 member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-12-d4689a71668c@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s35390a.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index e3dc18882f41445c41fbea56edbd5c869514880c..3408d2ab274194e39cde38a83567d37bd53f6632 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -63,7 +63,6 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
 
 struct s35390a {
 	struct i2c_client *client[8];
-	struct rtc_device *rtc;
 	int twentyfourhour;
 };
 
@@ -422,6 +421,7 @@ static int s35390a_probe(struct i2c_client *client)
 	int err, err_read;
 	unsigned int i;
 	struct s35390a *s35390a;
+	struct rtc_device *rtc;
 	char buf, status1;
 	struct device *dev = &client->dev;
 
@@ -447,9 +447,9 @@ static int s35390a_probe(struct i2c_client *client)
 		}
 	}
 
-	s35390a->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(s35390a->rtc))
-		return PTR_ERR(s35390a->rtc);
+	rtc = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	err_read = s35390a_read_status(s35390a, &status1);
 	if (err_read < 0) {
@@ -480,17 +480,17 @@ static int s35390a_probe(struct i2c_client *client)
 
 	device_set_wakeup_capable(dev, 1);
 
-	s35390a->rtc->ops = &s35390a_rtc_ops;
-	s35390a->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	s35390a->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &s35390a_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
-	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, s35390a->rtc->features);
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, s35390a->rtc->features );
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features);
+	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
 	if (status1 & S35390A_FLAG_INT2)
-		rtc_update_irq(s35390a->rtc, 1, RTC_AF);
+		rtc_update_irq(rtc, 1, RTC_AF);
 
-	return devm_rtc_register_device(s35390a->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static struct i2c_driver s35390a_driver = {

-- 
2.48.1.711.g2feabab25a-goog

