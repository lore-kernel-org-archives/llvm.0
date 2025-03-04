Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C963281530
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107941; cv=none; b=HS2bWli3g3luaXJjWpdkamBUNWGO3Jvv8GFY0kZ1qIM38nEVpBOfv5EA/2e+t2YRsPZFGuQ5DppPadicuenwQioafQZrec3k7tYY/bKS32XaJOHOaZY1ojLWBkYYm5b4riFFDEP5j2eO6o0hTcvugkx24mJyyl/YRlwVz8LkGW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107941; c=relaxed/simple;
	bh=5X/V6j0KylZQYS62rYIRbOgl5vZsHZpGMMFoDJktKBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfuirFs4EZqx9SBC3mgtppwuQKZIXEM5o3tp2T3qo9R7HfHi7tMkhlriIcIsdL7/ru3eNhok1cdGljeBjDCQurT1stOarmeZC/yp4r7+dKH6otm8EgwZZkpqD8MH71HI/EP9GyeqrbvunbsgFp6Sd9EN8SVZtwNGXQQ0qDf1cgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uB6jTMUd; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uB6jTMUd"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab771575040so1214216766b.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107935; x=1741712735; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=uB6jTMUdlYtNlq5nQ0mRcvQ/Vn8OTwvRTzpsbzNUOnY8dLQwFTE6jNte/hvUDvXonL
         KaoHzRRw4WPIGncJY+AY3cHBdr46a1NbpZ+c6p6nL2HsHX5lkC0OqIXdIQrDOai1bbTs
         Dt4m2MXWZ5YodhXNczfKGFjTw55OadaEpY2iGVtKR2W8Lru/SZVOKr+yfFFMvSPibKE/
         zppZPTlFZ+R6kTBmRLebBMtbnNvhLsLc7zaTT+clrg7CuLMoX0zAJ4AMH/WMTDEIWc4v
         uht0wCUjhI/dCuDkLwO/M9ydCpmxXUUNywbvm/k3WB0VEcJ0A2nSQoP9/X8h2p8IEIAr
         JfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107935; x=1741712735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=dmlSVewZNeHQREz6kef90fLwOsggBIqnlOhqiXXMEgJYxTaD0C63IVvR0+tDYqdg85
         c1WHH0j2KfCrqUnMYkFznahrXHcwt600OZOTPtAI45VkYGsunIjiSrx2BCSulExiVOq/
         V0bWQJ9f1RNE/pjpeDTWKxyKIyqV0hQCZ2BhfuhpOpT/oJR/ORBQf6OnC2LhUh9YXuWK
         jcw4QMHtHaswKh+AO+acC2a+FmSDXqHjo//u37E29yM32d+U2nP04nfPj46xA9nj/xb7
         aTyGtMElPSHRKmcnEKYRfGz/L+p9rGOn355hu4xIPCRcuRiZ0cyO797wgH6tTd2PIYZF
         4/8A==
X-Forwarded-Encrypted: i=1; AJvYcCX17UA3Izxnw06o5hzIYWEb6xG+ECs9GPsRbHjctaFTEKhQpkv0Vj1RnFnb0C8P80D6FHrs@lists.linux.dev
X-Gm-Message-State: AOJu0YxjeXZBUtMm3UmhowAuJPLj9hv6KkslNHfoSfFed2Iicm+g2AJB
	OC6QEktT/h7yJ08b5mznxG+dGpE4236CFagi7zl1zR3y0Ave0d5BZuFgPI7Pis0=
X-Gm-Gg: ASbGncuKlDXxJW2DK9+TuGKT0iC7T58loHpZl5oU4maW+Hc7gGOhpRRaOn+acL6G26I
	GvQr0w5DsVyywn+qIFN/vBgYBrpdOoCjKzUVVMDc8sIXstIsWwu/e3FQrGX5OM+h1fR317EyHcc
	Ls6g4uO2ie8C7hehVEGbzHFfUEPdNNl6hsUH7hXfISAM4Wi/nIvqtIPlegGZGxqb+JnBL1fkwgM
	Hx3+LPJGwzWdyJZPZoUzhl+GwQ4pcuiFaigc92AObAP8C10XNjeqTXvtXf0e2Ka8HCp6j1cR9tm
	4hEjX63zE0bWmc8VqYDibIY9jHFBQdBRABEWSUkNSN3aBXjwWZWYCfgQGslaId8JjHRSf+Iyb0p
	QxwVjSCAt5LrEgp8OBx3h5UnruKRM
X-Google-Smtp-Source: AGHT+IEctYzZlVVwQPucj8CUHKEVuZPV8n583Yq6QohmEvkW8JU3S9SRTA4/uuDakASHnMKJ8bAleA==
X-Received: by 2002:a17:906:3814:b0:ac1:17fe:c74f with SMTP id a640c23a62f3a-ac1f11e6c1dmr291303166b.21.1741107935167;
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:34 +0000
Subject: [PATCH v2 06/16] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-6-d4689a71668c@linaro.org>
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

The memory pointed to by the ::rtc_dev member is managed via devres,
and no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ftrtc010.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-ftrtc010.c b/drivers/rtc/rtc-ftrtc010.c
index cb4a5d101f537e20a685bb022e6f6516b0df8271..02608d3784958e69ec0ecbdb9fcc8b333b19e7cc 100644
--- a/drivers/rtc/rtc-ftrtc010.c
+++ b/drivers/rtc/rtc-ftrtc010.c
@@ -28,7 +28,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
 
 struct ftrtc010_rtc {
-	struct rtc_device	*rtc_dev;
 	void __iomem		*rtc_base;
 	int			rtc_irq;
 	struct clk		*pclk;
@@ -113,6 +112,7 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 	struct ftrtc010_rtc *rtc;
 	struct device *dev = &pdev->dev;
 	struct resource *res;
+	struct rtc_device *rtc_dev;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -160,29 +160,28 @@ static int ftrtc010_rtc_probe(struct platform_device *pdev)
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc_dev)) {
-		ret = PTR_ERR(rtc->rtc_dev);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev)) {
+		ret = PTR_ERR(rtc_dev);
 		goto err_disable_extclk;
 	}
 
-	rtc->rtc_dev->ops = &ftrtc010_rtc_ops;
+	rtc_dev->ops = &ftrtc010_rtc_ops;
 
 	sec  = readl(rtc->rtc_base + FTRTC010_RTC_SECOND);
 	min  = readl(rtc->rtc_base + FTRTC010_RTC_MINUTE);
 	hour = readl(rtc->rtc_base + FTRTC010_RTC_HOUR);
 	days = readl(rtc->rtc_base + FTRTC010_RTC_DAYS);
 
-	rtc->rtc_dev->range_min = (u64)days * 86400 + hour * 3600 +
-				  min * 60 + sec;
-	rtc->rtc_dev->range_max = U32_MAX + rtc->rtc_dev->range_min;
+	rtc_dev->range_min = (u64)days * 86400 + hour * 3600 + min * 60 + sec;
+	rtc_dev->range_max = U32_MAX + rtc_dev->range_min;
 
 	ret = devm_request_irq(dev, rtc->rtc_irq, ftrtc010_rtc_interrupt,
 			       IRQF_SHARED, pdev->name, dev);
 	if (unlikely(ret))
 		goto err_disable_extclk;
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	return devm_rtc_register_device(rtc_dev);
 
 err_disable_extclk:
 	clk_disable_unprepare(rtc->extclk);

-- 
2.48.1.711.g2feabab25a-goog

