Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482FB28FFEA
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107943; cv=none; b=QlMLdt/rr+HLoJeJHGFfDBxKXK4Y7fUGMX6iCFZtmIvX4TIhVxo2tDeC31tbod2I8w2HJT1lruiUuG/XjEcOOBXyic3HruM0sp8LQ2apD3cEORU77v+hi/acMLp1XjVALR//vLh42FMhHdLH1W7WMZtxJQkAJB/lpVLsy5rCyKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107943; c=relaxed/simple;
	bh=w6Ez2HJK0lLtjno5cUxK05/kYeMcWHjoaFlGGgugd14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9CS8B/OI5D+DxQeyVofw9JcLx9ddylG9qnmeRqAyN1OcAbcdpCoh1gjNPZj301zZQ6clZJHHAQsfNNg92JDnWC2gWODN7ImPkfFrlUXsrBuOlBHMTkyxARaru6MpEXRqQ8Jau+VAVoZQlY3/oE24Ks0sEH6Fl85WjyawOMQypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l9xpbV6Z; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9xpbV6Z"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e55ec94962so3638542a12.3
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107938; x=1741712738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=;
        b=l9xpbV6ZQrUWBAf+seE3IJR/Dxt/Ql3tQ2bq+CZcA9JXOrb4mHbmf5pOsqN7EeV2oR
         A241SsPvjeYCNOMNjxfiM7Qxz15I+LzspJlkkZXpVxvr9pMj7XbOrxrleAOBehLLMLyR
         XB5JKXY6v3GZt48fpKEpMGFdeMYbJ5UxTKzib2DmywN3CXedUxcDCqEWQHb1E6W1VB3c
         tBsablsLXY0J6/hh6qHT5GrK6bXk9A/eStHdZU1MEv1Elw+cbfk5CiyEzkCZygb3CA0/
         a+dxwPh74dWFnB/ocqo8of+0tQgy8lLQmFEsCzBD9ykN/xvU+cUq8AGvHc1fHgfXzC/f
         3pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107938; x=1741712738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=;
        b=wS+W7kMDLo7tPGj9th5BH5FwLRDhAxd2I+qgZq/UHhPhDPjPWwUUVQ8tlmXHoIQBzI
         fUTTpQ+WtD0tuGsbJfz9QTs5zd4eTHdVQfmlp9+udbf7WtrCiEn+6+Sui+1xzRPNFL+s
         hjhVxVOYenrc882lNp6Du5SQDDiZCdZPkp4jtt+/g3rmBErL9kCIkrBDHgbyQT1n7+yd
         iEj/XZz7x4BitsJlLFMeP989LtmaXXcXRQgyobzP3cHE8bhd0l8t1iacekqYrBRUfD8b
         JMVwP2jh8aQe8NP0hSbRQABWJE0M2vfcrJRaC3JBmRpWLHR2pIvz3HaAzPm8zEkxSwTc
         hz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBxqoGS9orsn+PB79Uecd1KlFIZZyf7X00nlEWJ2jR4xXL3ZB1emsLzpXDrfzU0XuT+I9v@lists.linux.dev
X-Gm-Message-State: AOJu0YxEIgyJRPN56cpZFvG2f7lLB1N67gdgeIlbxmUNYCEjwXGVU8bM
	SnAWQ3Xl7pFSIzIeIBZJmRqcr5ccFqFWN4v2dK0DGCW/JQxzcDIrIGsm5EC323A=
X-Gm-Gg: ASbGncsD0QOQvR8+7iaAxXD0ms/3au9hgmZnezGOi6x2Fv9gYSZVG6/ElGQa+lsrWdj
	ZfJ1XI/I5rJdSfJ/GdMIGwC1ckABGY5SD4LTF59nEzJoNYMCDGwRjLINwcUI/rl0BBUkcOp5u+3
	PjmJTPJCNTZJilRvLZZAtOfNewXaraEZG2sgKUtBcf6T/qevvKdtNy4eLbuSA7fvtcUljdXnB15
	wj93qyyS7FikL41r8CUsol4MdTJ4a89Zu73cng1S8EeboSyqbP8g5bjjj0DR7BGYNsrWnnKgPgd
	V5XK0ETIdjUuJzYL0RMc2X/cwBMzdJSH9BHkOrmsAX74Yfz1PvB0UzvAWUkVdPKapm8I2tOUcJ/
	/FTBkGs0uD7Hp4Y9EgMtNK2HFPGXo
X-Google-Smtp-Source: AGHT+IHF998NpSXE/Qa2EdiSn4vtx17I0lnFV/wyKnxAJsCHaDM1j6HSEMvcUwtHdnvoXlFd/CgYog==
X-Received: by 2002:a05:6402:d0b:b0:5e4:c532:d693 with SMTP id 4fb4d7f45d1cf-5e4d6b8535fmr16782448a12.31.1741107937989;
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:38 +0000
Subject: [PATCH v2 10/16] rtc: pl030: drop needless struct pl030_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-10-d4689a71668c@linaro.org>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-pl030.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-pl030.c b/drivers/rtc/rtc-pl030.c
index 39038c0754ee55a952e5986afe711cffff35840b..e7c81740061bb60c4d8447d6522819685bea9180 100644
--- a/drivers/rtc/rtc-pl030.c
+++ b/drivers/rtc/rtc-pl030.c
@@ -21,7 +21,6 @@
 #define RTC_CR_MIE	(1 << 0)
 
 struct pl030_rtc {
-	struct rtc_device	*rtc;
 	void __iomem		*base;
 };
 
@@ -86,6 +85,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 {
 	struct pl030_rtc *rtc;
 	int ret;
+	struct rtc_device *rtc_dev;
 
 	ret = amba_request_regions(dev, NULL);
 	if (ret)
@@ -97,14 +97,14 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 		goto err_rtc;
 	}
 
-	rtc->rtc = devm_rtc_allocate_device(&dev->dev);
-	if (IS_ERR(rtc->rtc)) {
-		ret = PTR_ERR(rtc->rtc);
+	rtc_dev = devm_rtc_allocate_device(&dev->dev);
+	if (IS_ERR(rtc_dev)) {
+		ret = PTR_ERR(rtc_dev);
 		goto err_rtc;
 	}
 
-	rtc->rtc->ops = &pl030_ops;
-	rtc->rtc->range_max = U32_MAX;
+	rtc_dev->ops = &pl030_ops;
+	rtc_dev->range_max = U32_MAX;
 	rtc->base = ioremap(dev->res.start, resource_size(&dev->res));
 	if (!rtc->base) {
 		ret = -ENOMEM;
@@ -121,7 +121,7 @@ static int pl030_probe(struct amba_device *dev, const struct amba_id *id)
 	if (ret)
 		goto err_irq;
 
-	ret = devm_rtc_register_device(rtc->rtc);
+	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
 		goto err_reg;
 

-- 
2.48.1.711.g2feabab25a-goog

