Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE59228D0B1
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107939; cv=none; b=u8BrOScSNGjXnZydjS6wuIfFnxoEqolz+cpAxR9H/NBjNo0yzLYzcBdzdvgUPBlxDX6KteRpJY4CtvbTshOJNK4KGqiimZaF8JpfqzQ+rEBiNRpI+5UMsIsYj2FhGRm3GKNISYTgFaGHKHjL4hVsGSeKVmt8UFhi3JXFsX5YFN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107939; c=relaxed/simple;
	bh=ivQXoPCDvr4W65W9v8GXK5+RniJhnQQTUBGH5MrKnmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HH9QKFBzM6C3ZxJPQmXRhUpXnbGC+PqzpLhKsM24FSWwOVGiLMwa948HexhIOO18BXB8uJX4cQq+rn7/XQiiCdTihFM5OWi0qYhpPuFzCSFv/hASURLnV3a1BC+iupUnTfDkMS6gHMa8et3yEkXLw897xCVfxNBTWjYTZz5vhTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECVMDWqG; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECVMDWqG"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e4ebc78da5so8575592a12.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107935; x=1741712735; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=ECVMDWqGcvGfs/CNjtkexsiryf6tp1pLrTejhy3QN+3eR0cHPFYiCFHIz9UK8OrRfx
         qYoZmLDBaH6ftFmyUBZADMKHAcuEEcM6zFkEEGIxP2J8pDsHRrElpN1KBAmZBJotWVQO
         xVrXTp5lcJlvbbKzGfEPhA6kvV4N4yV0rh8c7JNHpRGtSxv6d19In5jgdl9OkGIyJjFY
         DwXGAYVlfGIX4ZMnAdoBo6SK4E9QyBnTdctbq5EkMThc8jSfIXdqYGHtY2A1Ot//Qni7
         pGtoXHAmkXZoZeOqC1Di/H/2QbNDkW1lViR9P75E8OjRgKqCcyXF1BvMAmE4D/u+YaqZ
         f/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107935; x=1741712735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=FoJZzRJBlwKinuu7oCcA8s9/kOU6G1O4sMHbFv2m90Wj5gudqR6HqZZ4Q7VHeXz4/4
         N6ZROy3UPKNqywHrTS61alP9XZO60igUGfy92X8awrr741nH2yfjo+v8gvr1ZpYp32YX
         VRSavGhuoO305gPJeO5nYAszhvzMzdFU4keW98tenBW4+rmX2mnnIKq5RYiOC50zcllx
         SOUpgPc65Wc5CR3ITnvjTyzics5z9UCTfx8KXaaiQu//ppG8cFsEgHEgVyvhrBBwdGvp
         CcGCjb0c0NBg5hQHqYQCpKn0r9ghuqAXinLGY9GgEkM6mCRm0F1SWJYOpdtbY4ad9KoU
         MVVA==
X-Forwarded-Encrypted: i=1; AJvYcCXc4rHWoLKCsOp5aYf05r4Cv2S/00HzxgL3VEnRZu4W9mYKMregcnj08bweHyY1M+QdrCrr@lists.linux.dev
X-Gm-Message-State: AOJu0YwmJE/w/y97h9wseuJSu5Zs5uAfqTEWDaLKeZ1ZXoCJShNZLJHW
	+Ff07xu+ac83Kp9Rc/CS3BO0wP6jt7j+Alds9N4Ois9dJVqRncsjX1dwtT2vXH7/UaWOiUR9GyB
	OldQ=
X-Gm-Gg: ASbGncukyo5mmOjWKQGrFCiq6PLkvsM5RyiRLBh/UH1yJtJem+jl5RxZoLhkw6D5yHa
	E+Au88QGn3E0Ja/WgHexa7f++kvtUHaA97HmU6be1OMv2KZVMr80FMWXyo5T/Ma6zIWvCk7xXAk
	usi0krs6Dg1QQ9QxF1qsqaeKc7Qxt58uLa1HLwTZodhWz0dxJODyoyCPOvKcZ8KTJux1gSfGhQe
	iJZMDCVAx0ch81sf+s1waSv63QNuMUbzo5BNzlmjqgDDjV7CaCECLRjalCfnxEaA5VaC2r/+ME6
	H8WtUoME7CxP5ZWRZlXDZ5xqWb0szCAvBo/oT9nQBrXajt4rDMnk9lO+tQtgpEJeoEO5Yi1+ucy
	u64uW4nx8VZ7spmBlGiyL2qulD+KO
X-Google-Smtp-Source: AGHT+IFwDsDh5i25qijWXwIP4x1jml1OHqbOIRoS6nzVQBGxqFZ6SJJ2B5idZS+kqD7e/PzkpEaGBA==
X-Received: by 2002:a17:907:9490:b0:ac1:cceb:d9b0 with SMTP id a640c23a62f3a-ac20d8bcf0bmr3896666b.16.1741107933256;
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:31 +0000
Subject: [PATCH v2 03/16] rtc: aspeed: drop needless struct
 aspeed_rtc::rtc_dev member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-3-d4689a71668c@linaro.org>
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

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-aspeed.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
index 880b015eebaf796f68ed82c29998f345e1fd418b..0d0053b52f9b90a61725bf29435bfc8071977f9e 100644
--- a/drivers/rtc/rtc-aspeed.c
+++ b/drivers/rtc/rtc-aspeed.c
@@ -8,7 +8,6 @@
 #include <linux/io.h>
 
 struct aspeed_rtc {
-	struct rtc_device *rtc_dev;
 	void __iomem *base;
 };
 
@@ -85,6 +84,7 @@ static const struct rtc_class_ops aspeed_rtc_ops = {
 static int aspeed_rtc_probe(struct platform_device *pdev)
 {
 	struct aspeed_rtc *rtc;
+	struct rtc_device *rtc_dev;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -94,17 +94,17 @@ static int aspeed_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->base))
 		return PTR_ERR(rtc->base);
 
-	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(rtc->rtc_dev))
-		return PTR_ERR(rtc->rtc_dev);
+	rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc_dev))
+		return PTR_ERR(rtc_dev);
 
 	platform_set_drvdata(pdev, rtc);
 
-	rtc->rtc_dev->ops = &aspeed_rtc_ops;
-	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
-	rtc->rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
+	rtc_dev->ops = &aspeed_rtc_ops;
+	rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
+	rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	return devm_rtc_register_device(rtc_dev);
 }
 
 static const struct of_device_id aspeed_rtc_match[] = {

-- 
2.48.1.711.g2feabab25a-goog

