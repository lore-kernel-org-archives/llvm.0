Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814C9286297
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107941; cv=none; b=awbHUCCFJW+o2pabuqIDazRshNOpP90C9cj4ZNUf0MgVp6nqxyJi860WmWC3cbzos6NmOhyC+4MSPtGYSrH65pmORRBuRaM8mOdKh6KJPk7yx3lJEtCs1GOZuMrwy7J32HGZstbO2zcc67aRI4iG1XeQwmCpn3+3Tq0VO83WyEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107941; c=relaxed/simple;
	bh=bdvX1BNhSG2fpjHo2VIxHhZrYGN28llP3/MopMlEtfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6e0q93XkBvrwGmtyi3SEBSJJCbj5Rlu0p9l/O4aXr/5eR0dTY7qboQ499lE6d74sxfEZrRDPJv3NW8j0qDMVZhJhSV2XtlCE+2upgawE5+aPzqgpm9AZIpwO0tDgxTen44P6whLdnETWilTSyonpTwMwzEyA75iK+RnF4J5PrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T0CMueRc; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T0CMueRc"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab744d5e567so998009466b.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107934; x=1741712734; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=T0CMueRcY1wpRBJItcZw2LxHXmILS/eMG1nvPGgap7bFR4icDbSPdsQlM61r1XLRUK
         cyVsQVHaISefpOvAs0d1M6JN1DtMmv0qn/lowHuda74roB2sViNy/YqZ3NKDqH2j2Vc5
         I8FMtDAn5fXggT79+EDxJZSi89icj1hyMwDAxjNFnkw6VQV1mHD5QRT5nmrY0yuCn354
         AEaD3EaNlV/amUDu7z+dx5G6U3ZMeZSur9ty72HOepSomv5boTTZ1jxKkCiFNQOfEeGz
         aQfsjuu8TSU9Xk0kYCGPhRnXJB9J6T+dgdu/1qLfv/o+kfBSbVhvn/TkMhJXBZ3iRRy4
         ZKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107934; x=1741712734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=gXrwAepJD1TP1iJcogXzS/CWa0YRXRfTD1zM6+atBKwLkorYQtSfXZWDXQHTm3OhS9
         tS6XpZ7at3GOLYNDq20sQj25REMveY0tOdidUNmk4Wd809PosP6FOHLDJ9yv7sNeByOS
         s8gOlg5q37RCsl3sqLLvfL7Q02i9kysPVWokyg9KzheM+wmqbMlo5/Dh4iyRMqUbSYQ1
         vYpjjkoJsAqQVhVj6eUvf39sMI8tpyrneevYKsE0uI9eJpO5c1i0+EV5axPJKRbWVyIl
         Axdk2DSQKhMCGPCjgLPEwm3WLzQR+FT7L6izf6o2mdF2j+cs18LPbDzQkchVdouB8VzO
         5mrg==
X-Forwarded-Encrypted: i=1; AJvYcCU1fYddGX+4Qn0GL7BMe5UY9W7aNu063RMk6JTXac7Uqv2bX+zUm7vxw8b3yz2QfEIQAAS2@lists.linux.dev
X-Gm-Message-State: AOJu0YzDEVixsP4JzbY6V20mYxjRNTBdRYePinIEu7IpgkwLczue4LTF
	0sQkunJbR9XfZovhGXb68F1ut25PWV1LoikIOoBe5AqaLgPcgT1zAWw+glQrNFI=
X-Gm-Gg: ASbGncuuIDZZsnbMinOk26j/OWCbTFe5ys9yxwfeVvhLvY8Cam9D4YzDD2co8l9iKGG
	TIxBL3vwGMfDtkktuXR3iJ0VAlc6fxrHjl3KvTCiTT05vyKUQlBxktNlt6HB3F0ONmyiYCWczt0
	eC10ixEsZ8bNNyqxqmz0wkpyJMYbsoDMKtCQ3FO4wbWsnLD40Cppe9x+qeeR4LckPvJs4rv6xQe
	5D4nCoxZ8m+n4STKJyuCq++qHg9L9IaNVohgc200USxZ3bSxjA4iRepgkjgSYECYe3fvQkhsNam
	qph2ic6bNZ9hLIlt4DjRpjzUAms4gm1MkiuHtnu+c0KA9AUvWj5jD3IWoJ2ctRpp5W4e8NWeO71
	leEeONho7vS6DKWB1CKTksfWZ0pTc
X-Google-Smtp-Source: AGHT+IGsdjvAcycMp31oFEdsdwWFqJQmXbxtDBoL5DRz6SC3HgSNRmbkL1ZXNDzmFm2b5aF1OyYNnA==
X-Received: by 2002:a17:906:c150:b0:abf:4a62:6e5b with SMTP id a640c23a62f3a-ac1f0e60023mr427555766b.5.1741107934486;
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:33 +0000
Subject: [PATCH v2 05/16] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-5-d4689a71668c@linaro.org>
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
 drivers/rtc/rtc-ep93xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
index 1fdd20d01560ef4fae2b996cf366b4f812329225..dcdcdd06f30d1ff6d0939f6bcad2c17c03c5a65e 100644
--- a/drivers/rtc/rtc-ep93xx.c
+++ b/drivers/rtc/rtc-ep93xx.c
@@ -28,7 +28,6 @@
 
 struct ep93xx_rtc {
 	void __iomem	*mmio_base;
-	struct rtc_device *rtc;
 };
 
 static int ep93xx_rtc_get_swcomp(struct device *dev, unsigned short *preload,
@@ -123,6 +122,7 @@ static const struct attribute_group ep93xx_rtc_sysfs_files = {
 static int ep93xx_rtc_probe(struct platform_device *pdev)
 {
 	struct ep93xx_rtc *ep93xx_rtc;
+	struct rtc_device *rtc;
 	int err;
 
 	ep93xx_rtc = devm_kzalloc(&pdev->dev, sizeof(*ep93xx_rtc), GFP_KERNEL);
@@ -135,18 +135,18 @@ static int ep93xx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ep93xx_rtc);
 
-	ep93xx_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(ep93xx_rtc->rtc))
-		return PTR_ERR(ep93xx_rtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	ep93xx_rtc->rtc->ops = &ep93xx_rtc_ops;
-	ep93xx_rtc->rtc->range_max = U32_MAX;
+	rtc->ops = &ep93xx_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	err = rtc_add_group(ep93xx_rtc->rtc, &ep93xx_rtc_sysfs_files);
+	err = rtc_add_group(rtc, &ep93xx_rtc_sysfs_files);
 	if (err)
 		return err;
 
-	return devm_rtc_register_device(ep93xx_rtc->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct of_device_id ep93xx_rtc_of_ids[] = {

-- 
2.48.1.711.g2feabab25a-goog

