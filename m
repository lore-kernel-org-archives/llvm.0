Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B0290BCC
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107945; cv=none; b=XZjnL9jcF3d4JNZhsPZImJC1XD+ZIMxQH/6TEspYWm0vysQ1u7Ru2d/zd6mCnqjq0vpyrH7frVE6whd1pQQKY5rmmQ4Ba6kTuSSg6UkppTWInFRWb5hFmiQn3asgNszpwAehRcTcXAGr4XlN4ZykZi23vZEZUJ4qMJaYTggR0kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107945; c=relaxed/simple;
	bh=M4Ze9HORH9tUnnjpPlWigivxQdkAcaAxYcFUsuXXVuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQc6ec6hI2IHCDhJAxl7shmifXqDygTF31E1oVZ4xpBu2KkQySmsXIrNeMfk8/tjZLKkky24Z+yZRSlttiR07b72eD33d2dZZ2IZzieAHcY7SPrXcaUeTvrDJAIrMnxjGkZbFLS95PH3BkVaq5CfESt1SxicM5vuDkIPtj0t7UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wA97kHWm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wA97kHWm"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abf4d756135so566780766b.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107940; x=1741712740; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsaGEw76ofDXd3Q1RIPfSv8CJUvwC0w+ueATTj/NegM=;
        b=wA97kHWmSIB4N0UEzgfepQd8hd82R2Hp3LmNJ9/ZibX5FTYQnX1Q6r6ntHqKqE9K2J
         2PiVv+p1VhjJu5UyR8A8Sc+JJyfC5nHKamvLH6ZywlezEdva22TckJJKROpe7v0PjYGo
         yI/1xgq3I5alHevbo884Hb2UwnSd6nDXqoYQoKla+DhtWpiwoOclvQ75gFcyBM/c+EVR
         RC+xt6FattymL1KSSar5T+p2mYEXW85dZv6nCTLKrDqhRRaJVkscGIJ/m0oZ+f5t++vt
         XerAbvQcqdU+ZqPvO68ALaFmUfavj5Rbd0SsaaZgQr5pZ5MROjwwYmYj42PisF3y6F9i
         yMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107940; x=1741712740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsaGEw76ofDXd3Q1RIPfSv8CJUvwC0w+ueATTj/NegM=;
        b=qxGKYCS2xsCD8A5DQHF6FE8r5lp9eY21m+SppKdXOTVawPtis8/DlOrCjUFBJ7rcwu
         1GUpXUsEnY5d5y50Bay4mxpojtVDQm9Mqu7tbPp5FQVaWgr+6VRZ5xf6oKDEBRynXNKe
         DPY/KV/A/G9vwnS8SDzA5GUw2rIJJviqYUhGUc80MXAeeDhkuSbwDfoLxp3t5HAacSWj
         949zy0FpHbwmrVxNyquu2MeFEe5mhvN6rq3QdV1ZmowcEKDpO6XmmgZ/iC+zGrVD+3vk
         L2NPSAM/0n8lSc/PZwsn4UcdMR9DSvypaoD4oxIEjvsZxpoMTrlTJMvf6MoY+m1uXoJt
         9OOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOcX0fbaxAmpm12lKjLBXy10vBAQBlvJkgTL1AEHv1WenMmxHB2i2PULW+3nlW3M+ozycv@lists.linux.dev
X-Gm-Message-State: AOJu0Yza7SWdMYqLZpCC4op7dv5sfxRKMbARR2YVYlyPpEzVHNoOe6Q2
	6dlSxBUyV+mCgxJE1AdsFUYGv31y1mrRl8eq3AwVE8IQC+N0LoYguz0WrgFssi4=
X-Gm-Gg: ASbGncv76yUJd/bcoijUF6MPYWfPjEgkClvflluWGkIGJsIwcy2FNlwUh6BUU+O3okt
	CqP2kg6ACv7jKVRaXM6pAn2HJlrbsauodWGZB4m2tZV1uKJ9oLRmokqQpODMpGyERmZ/cGyd3LY
	hM+3r28cGk5oeotm8Zou2MclZHhCB0r8L0FUE6ogOf9n8M5K4YsqXyzZvimkF7zT0LXvclm6qjW
	uW2rXRRBsjJxlqupZw4HVhdO8oCAW7jRkXliXiSpMrX1lrwsuWuM5O/rxHZM1jk9/PbbChFRFNV
	63xAMC/i8bxOtmXbXphRerZKMkWcZo7eosq+/LV0mTXuYelyXAkiasKMoOqUdmwI3b2ECHwbME2
	9ztNIx/9evF+Z+ZYGWgfz6krt7Df4
X-Google-Smtp-Source: AGHT+IFl6TTi8U8Sph/F6W/xnjfer4H7R9+DXzK4OCCEVcy7pkMVR63rOrht0Su/bmOb+eKFGQTbhQ==
X-Received: by 2002:a17:907:1c8b:b0:abf:38a:6498 with SMTP id a640c23a62f3a-ac20db16fb1mr2300366b.55.1741107940186;
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:41 +0000
Subject: [PATCH v2 13/16] rtc: sd2405al: drop needless struct sd2405al::rtc
 member
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-13-d4689a71668c@linaro.org>
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

Tested-by: Tóth János <gomba007@gmail.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-sd2405al.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c
index d2568c3e387659dfea598cd2ef6bddc5c076cbb9..00c3033e8079b5f10aaabcc7a1d3f19771263a02 100644
--- a/drivers/rtc/rtc-sd2405al.c
+++ b/drivers/rtc/rtc-sd2405al.c
@@ -42,7 +42,6 @@
 
 struct sd2405al {
 	struct device		*dev;
-	struct rtc_device	*rtc;
 	struct regmap		*regmap;
 };
 
@@ -167,6 +166,7 @@ static const struct regmap_config sd2405al_regmap_conf = {
 static int sd2405al_probe(struct i2c_client *client)
 {
 	struct sd2405al *sd2405al;
+	struct rtc_device *rtc;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -182,17 +182,17 @@ static int sd2405al_probe(struct i2c_client *client)
 	if (IS_ERR(sd2405al->regmap))
 		return PTR_ERR(sd2405al->regmap);
 
-	sd2405al->rtc = devm_rtc_allocate_device(&client->dev);
-	if (IS_ERR(sd2405al->rtc))
-		return PTR_ERR(sd2405al->rtc);
+	rtc = devm_rtc_allocate_device(&client->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	sd2405al->rtc->ops = &sd2405al_rtc_ops;
-	sd2405al->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
-	sd2405al->rtc->range_max = RTC_TIMESTAMP_END_2099;
+	rtc->ops = &sd2405al_rtc_ops;
+	rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	dev_set_drvdata(&client->dev, sd2405al);
 
-	ret = devm_rtc_register_device(sd2405al->rtc);
+	ret = devm_rtc_register_device(rtc);
 	if (ret < 0)
 		return ret;
 

-- 
2.48.1.711.g2feabab25a-goog

