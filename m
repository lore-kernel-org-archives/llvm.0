Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC4828F95A
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107943; cv=none; b=IkC6Ql6HDCjnybp6vKZjY1JXtjfyvo2H8PhEi5YOnQ9J5spYyv18hM8sQ8NxGck44frUIZmIUNSuTGm75hu03BRAK+jRX+Drqsu9hYZh6gwAqN8lemTNMe0wCeQUIGszrbMkfef8KQ0zMk/oWx4Zrhe0WdxeAbv9LaJwutyURxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107943; c=relaxed/simple;
	bh=UGMJ3GCPyVV/uGz6DNqBy2mH3s73qryTRoU1mvi31cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p727IJ2R/LOgc9j660AEYnI2OdVkBhBJQZHopNe0E6e83O9PDaDGh/PLK2T2rtosP1yJ08/hb7KoLSvU+7KO5DGzf7+mWkB7FMAE8IeCq960+WJqVDFE4Wo6o/yUsvBh9A6nw0omIvfnUoB4UrGDs+K2TO9dDqZ/d+Sk1ORydr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=plEJEQ+L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="plEJEQ+L"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bbb440520so28438925e9.2
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107937; x=1741712737; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=plEJEQ+LxnIKzcDcAtPNrT+R/PEgcKdU+uP7YvYVvCHss2rEBzAQgvySFU8xmPA+qR
         rY5pM7MqqbgNveyIzdXwNWeDIGcfuumTeDLXSHybNU5WzHI7zxehuWr6CLcB5xKAgB9n
         hkSs2M0HK2XkaV6saBtI87jfaZjD3GoCGLigBKXo6YpeqHOvX32nyrrFAre4jo2ObCvE
         qDQdZCKGMfho4jJER5lCcWMK6iX+DJjSfJxly7GVt+8clwOdRSAKjKUgrfUVsECMHPvf
         rM4LUmj6oH9BeawpvwOill4fw50lAmT/p3R40UgAle9hBXROBv+q9+E8ZvBytFzAsvz5
         hwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107937; x=1741712737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=tx7F6OT7m6oKM+YRYB5toSbgo0UVt3+OXgQJz9CitXtXscOQkwJjWfCay+FO45Tphc
         7IsOu575YG+nJiHuGZ/I4Ux6sOpenSZ9qL+RtUFr3/gd2ciPXwZu/ZUlthKrjlqtctKW
         C9DAkdLoz1rUJCGiAatrcgXP5ka/PAtJE8YGS+wVewRDT/1PpsfEniY9Icx2OJriRsvb
         SGj6tm8+VAc8rldhwpL7cIhkG9mwQgXJ00Zjd+Qg6TokK/JRLAI9lOz2cB0JmjRDwpEz
         SGXvTkLfhJYA2mnFmu0jVh9SQYozgdcYNep2Mhc2zMwCt4ZwWYFPwjE9V/NBelBp7PDC
         P/4g==
X-Forwarded-Encrypted: i=1; AJvYcCXrnFzmmmQGY/E0Ixy9JSepTT1uBXrIcexcl9lio9psFVQ90d/Qb0lPNiNUTbbDZP2FGMp9@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfd02JbhWr3CMRHUq47Uju3jPQ4eglaAPezXxcQmV1RVUKCtWf
	HqAdwZ9MNjmh3tzAAJD2Glr8Cs2Ro9fVZzLzrDx+4PlZHnt6yqWbGCwp0gMebr4=
X-Gm-Gg: ASbGncuJbhQEniR8HqM3QkTGQOnOo9vOfd8eH97eLLxLSUyytKW35J/ybAatw5C3lI5
	rRrBkoP8oormvWRpd5sfaqwHs8ysOVNW3pLjd2L3CA4WFgLVVcSN3AtcRh/af1RpOqr5Uy1CLIQ
	cnoO/pHClmYbAVolhB/JvELKIeq+cQqrxoOxhKxTejsEH7gbj5ZH/BkJKaTv3V9ne+z5FjtB0xW
	ovDVzMjlobt7TZYSiRXQ3Qpn2pc1CNDTowvLxUK9DINyVBD8Ot7I3ToYpQTAOi5TC0jVdu+Iv1E
	09XfPmcOozcevMG3MJqnCg9obd6RSqn9w+yh2XF7s7UgGEDyjNEg/uFpVqdf5skby0RLTXCgAED
	dCSALNgzqMJfydmudmDY2X7fLj1+r
X-Google-Smtp-Source: AGHT+IHZdsv7jYfFsjyY3TIB4euke/dHgzMkeAeSorD4HntlJXvk76kkhxE/lHiggYkJdsJqp3nEfg==
X-Received: by 2002:a05:6000:10c1:b0:38d:df29:e14f with SMTP id ffacd0b85a97d-390eca069a5mr17165829f8f.43.1741107937298;
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:37 +0000
Subject: [PATCH v2 09/16] rtc: meson-vrtc: drop needless struct
 meson_vrtc_data::rtc member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-9-d4689a71668c@linaro.org>
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
 drivers/rtc/rtc-meson-vrtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
index 5849729f7d01d7ec7868ff3bbdc5ed599aaa8238..7d38258cbe376e5a1b2af6250cb6d04c313175fb 100644
--- a/drivers/rtc/rtc-meson-vrtc.c
+++ b/drivers/rtc/rtc-meson-vrtc.c
@@ -13,7 +13,6 @@
 
 struct meson_vrtc_data {
 	void __iomem *io_alarm;
-	struct rtc_device *rtc;
 	unsigned long alarm_time;
 	bool enabled;
 };
@@ -65,6 +64,7 @@ static const struct rtc_class_ops meson_vrtc_ops = {
 static int meson_vrtc_probe(struct platform_device *pdev)
 {
 	struct meson_vrtc_data *vrtc;
+	struct rtc_device *rtc;
 
 	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
 	if (!vrtc)
@@ -78,12 +78,12 @@ static int meson_vrtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vrtc);
 
-	vrtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(vrtc->rtc))
-		return PTR_ERR(vrtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	vrtc->rtc->ops = &meson_vrtc_ops;
-	return devm_rtc_register_device(vrtc->rtc);
+	rtc->ops = &meson_vrtc_ops;
+	return devm_rtc_register_device(rtc);
 }
 
 static int __maybe_unused meson_vrtc_suspend(struct device *dev)

-- 
2.48.1.711.g2feabab25a-goog

