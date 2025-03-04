Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C305C28F945
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107942; cv=none; b=HP7RPHyCPtsgbTjhuNYjG3keBONynXyNB7ukiG5Bf3RpUfgVFyv+Ipcv0z5bs5i1zq3EBNwOmz+xTck/7qvKb0Ctu+mPDa9DFy0vLPLUakhJrfudAURZdyIK6Coivt9VGzkf7QYl9e3lWUYOIKcB9bH2kYVrw7WDLLZPdPPnEZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107942; c=relaxed/simple;
	bh=O7YHK/iXPLW7JvXPCw3QSGcpCg8mcQhvQ7AlODxEgPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAE+a5eeEk1e2rtWy7S9y89pVmo+qOvP+UFd6L6xLjKByL/55Oai3jdP2TTs+RvBrOkhG2AHHLCXHTfcfipnLNojC9TG//18inwO58sgclJ2p7NagbvSpa8CtKvVZvZyLepSz+S2eKqm4vVWzjlRWLtqUKNK/Cx/cgklsOn2Z+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MyGp5t/K; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MyGp5t/K"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abf57138cfaso615833466b.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107937; x=1741712737; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=MyGp5t/KhxgulVny+l0P108NGAYXBNQo5Ei933InOPIoNmJ4W7Xc13LV1PcB8SQ+iX
         PDM/tBG9z/PcZxAjDWkTZF9dih0MSrd0bXgthdlFaO06T7UrO4dtR8aZNRg+VqXj7nVI
         WbNeBLEP98dxU3ageN97ezGauySsFIOWC7AFIWbEGDK2BPZVgf0bornRI7klIUlIiGfr
         IDp49fs1BvGU0DlzpVFPiC22uzM8DgFmO+cidZdW7MHjh+POhx5i097dB5LBFUzEXcQp
         HqJ8i8ka/HdJm86G4iZA0g9tvZFymGUnm/KafjnHh6vbiFUN8uHzrzs44PdLfFEWC8Vq
         EaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107937; x=1741712737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=blbEsJP0f7ZuJH6cE9ajzww2+jV8hQsFF8HSFErcxRR6/un5tt95KSg9Pf0+kqP408
         VJ7YnkJg8GFEAoVUzFwtIU24UEVy/PYIRBHs675hd3xyA5n4aLfOSt5CAwNuQQfWZf5E
         KljahQRjH0Gdx8cTjgogThnTrQ8Yh+To+/5mG4qfwsTzBDIoCIzj8SoCkciHT4jR5dNb
         CkV8Ik2EkptOOj3/spYQJRWl6VE5N3mN18YaRN++BmcFpFayrH5BKwUX3PQn7IdSWvGT
         eY0LO/ljjYaYEhAqPxka2QMKfXLHExq9DKbOKUmCtbqOwLSRBvhQL1r4Fn9sQ8lwFf69
         mgGA==
X-Forwarded-Encrypted: i=1; AJvYcCXuWG/sBBQ6lwNfI+7hVbUOC26hzTm2FiosKOB243yU7d+OGcIr7aJCttl2KGOUwxgScUb4@lists.linux.dev
X-Gm-Message-State: AOJu0YxMVaKoeshQoFUpuyXz+i+PvWtA1B+FsK07V3WsFzO8VYxmhSzU
	oJddPeRxg9ddgSiPXf3PZYwCNpTwFbfyNKlsQp3wCFdRC7QwK982Ub2HSYTBtrE=
X-Gm-Gg: ASbGncvnCgUQ++/xocOhQV1XWPwgk2UGoqJqp4Ml58M0WbZiuGBQMA8Y3518cWX495C
	nQuFzABSBy/Be2txcxiolh0TEdSSGCvWO9xfQhmpWhn80jQZLIq9ZXQyoFItwaCVmIqVPrJ1Gpu
	NovyuNsjA4czhOwlzGIGB/aSNlW80PrjEw9d+O2ey51/y6Og49KGa6Ei84udQ+AqWENOOqXXPit
	DGnxecVllT+bN2tl4It/QQU1MX6t8s4ERUjSr2PwJIZTxBvNDimPaIxbi/pJnp5d73z2fnXGENA
	mepcgRCueLzNQ4LbLa2clAqCHclH1JjAWNziB83KH9ElGeSlwnLNrOMWGqom+wkm6RCn5jRbYng
	t2BGzoj83EmW3vWWsYVUiX2GcJtDM
X-Google-Smtp-Source: AGHT+IH4UfROsxQRuhFhpuKVUGIkJvl9GfdlUj4CrGm+kiSC0tb2f0MQezXBSz1TfcCGXXToQh+ymA==
X-Received: by 2002:a17:907:7210:b0:abf:778c:58c6 with SMTP id a640c23a62f3a-ac20dab329fmr1852966b.16.1741107936481;
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:36 +0000
Subject: [PATCH v2 08/16] rtc: meson: drop needless struct meson_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-8-d4689a71668c@linaro.org>
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
 drivers/rtc/rtc-meson.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index db1d626edca5fbb590f26c1cdd0774d350244a99..47e9ebf58ffc2f2b6c65932f8ec3773a213a62ef 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -59,7 +59,6 @@
 #define MESON_STATIC_DEFAULT    (MESON_STATIC_BIAS_CUR | MESON_STATIC_VOLTAGE)
 
 struct meson_rtc {
-	struct rtc_device	*rtc;		/* rtc device we created */
 	struct device		*dev;		/* device we bound from */
 	struct reset_control	*reset;		/* reset source */
 	struct regulator	*vdd;		/* voltage input */
@@ -292,6 +291,7 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	};
 	struct device *dev = &pdev->dev;
 	struct meson_rtc *rtc;
+	struct rtc_device *rtc_dev;
 	void __iomem *base;
 	int ret;
 	u32 tm;
@@ -300,16 +300,16 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	if (!rtc)
 		return -ENOMEM;
 
-	rtc->rtc = devm_rtc_allocate_device(dev);
-	if (IS_ERR(rtc->rtc))
-		return PTR_ERR(rtc->rtc);
+	rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(rtc_dev))
+		return PTR_ERR(rtc_dev);
 
 	platform_set_drvdata(pdev, rtc);
 
 	rtc->dev = dev;
 
-	rtc->rtc->ops = &meson_rtc_ops;
-	rtc->rtc->range_max = U32_MAX;
+	rtc_dev->ops = &meson_rtc_ops;
+	rtc_dev->range_max = U32_MAX;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -365,11 +365,11 @@ static int meson_rtc_probe(struct platform_device *pdev)
 	}
 
 	meson_rtc_nvmem_config.priv = rtc;
-	ret = devm_rtc_nvmem_register(rtc->rtc, &meson_rtc_nvmem_config);
+	ret = devm_rtc_nvmem_register(rtc_dev, &meson_rtc_nvmem_config);
 	if (ret)
 		goto out_disable_vdd;
 
-	ret = devm_rtc_register_device(rtc->rtc);
+	ret = devm_rtc_register_device(rtc_dev);
 	if (ret)
 		goto out_disable_vdd;
 

-- 
2.48.1.711.g2feabab25a-goog

