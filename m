Received: from mail-lr2-f13.google.com (mail-lr2-f13.google.com [74.125.230.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E46F4FC8D9
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015503; cv=none; b=CEgX9zwFnB/ZPyr+TuzUwSAxMPahdkAsFtDX0E0ZwD451nyf9nqO/Rnbf2fdkw7g4Mji5KEfpKIX5vQpPyDZMRZ+E5eld/FJCNbI/2L1T6HmbAMo1TsjbFHRSo7MK9EudnB8rRg/s8+P7chvVx2UvJi4MmsmAdXpI5c0ts/Svug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015503; c=relaxed/simple;
	bh=Yj4RwbCvi7B7lQgZjaL6AuMOkRGQNU1rLzNzZVSRhLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqPZ4Iq47o4VPC93aaQEn4DmI8KJOmky0AoQeQrMfa7THFxvPdH+8eJ8HI/jyIv5mC5i7v+f9KeSWVEaN8q03U5ynLWBomRW3IWvEVOaO0XN8pK7UKnHbQ4fQR7YYnqBUyi8KRpiqMH1AVGgYh5EQHloq7tikbXsfleRIBSjdGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/u3fnOG; arc=none smtp.client-ip=74.125.230.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/u3fnOG"
Received: by mail-lr2-f13.google.com with SMTP id 38308e7fff4ca-3a318299b93so29713581fa.0
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015500; x=1790620300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIjQv3Ni12nKKfUqhl2wfffLShu1iZGR3QKWNIW24Vw=;
        b=f/u3fnOGFzKk8Y0ap8i+Gt6Ki+UV/cxQS0rR2fmgG0rcIuJSxwlb4vLgMiu/eh47DH
         la/LRRsT4mbTtQ+tzTh5YWKuBtph1ofi9NckW+CIuBTEm6GezUAS8Kk8oiS56plxgeMC
         M6reJkPmAjOylLyZwjgmBObumJ+N74Qz2GU0/iwytMU+3JQ3w1voqkJpeBKbR8kXfHNf
         uasljlW6zkeLAA1KaWiEnEpCw1FN3CF7WXQRGEpDpch3LIHH7KS0Am9lfVPnz8NNtcOr
         tk0LOuM41sWkrbIOMfV4Zu3CzNF5oDLKaMJDUI/hHUqISanCoaC6MSMcggW3iLWks2Y8
         Eogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015500; x=1790620300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIjQv3Ni12nKKfUqhl2wfffLShu1iZGR3QKWNIW24Vw=;
        b=sszdhMsCn2miXTLdHDyRouMfvKuGBxHksaiX6YG4PSsE7aXQETbUzKYVBEiAxC43IK
         k97zR2z9qFe0JXwODGjh+XvuE9Lf+h0Xh/MutRPZb091FRmKHxq4Se8QCrpHgAbg5Z45
         IAPlY2QM24KMiICbujo+I6m0KT8njR/jABM24Jd2/mWAa49JSpSqecrLOaDpRNTbr6ex
         uMcGTe7e8J+xsuhB4UuRVLR7N4Mji7B1tJYxBX9OzmtqCuyzsrj93u1jZWX4P0ZwATyi
         e2VybGeJYyDYGL/oxmQGLEhUdca9IPrBk/Ti+ZNDV5bX9y65juiD52EoGqMxhvnvw4Fn
         5RWw==
X-Forwarded-Encrypted: i=1; AKwUvBwybkPHLZ2rSc1vRj//QY8Xa3ehgEE2IQFwrfGr8ZmPiNuOiHaD01qxOj0mzFEbZwAu0S3B@lists.linux.dev
X-Gm-Message-State: AFuF++nqdPqko+cxBkjYvujnpqVTDj+eLpKxy7BAs5mxPV9YxJksS8Zh
	C0l55SMHSfyLoAiIIZgzJ744bZqZYQBkSBCfFQ2zRfOWNR/osPZPSXSp
X-Gm-Gg: AYBFou3+tu1QqK7kcUoGqzvbvVRVuap8CN+lx62uCQTI3gY1wBeqAWAgztwSaT5GHcB
	BAGdex6sjo71nLjsyV5k+2g5ZwYr1PUUQN71MIYbygD4Dl8fWoYpr5HVHMf1sof2+PDKy4Lp5ir
	4uGhwfEw153kViXGBE/t/IfJqYHC4tDf7Jmg6jaSk3YuAlaL4LyL3/BrlD/jaRoU7n+HZtAeYX1
	fUCigPciFafX5vYqP5eopfGrW52V2vm3X2QhWgzUC2rSSEgdpbqLwM+ldHhMyphw++CsKYiseA2
	j1b2JPHkaWO2vRdSN4ieRUU9gSbXK5WxI+FqcUHCTOcKLQ2lEb6GVR8vULbcqiWWYfQ1QRWx+yB
	IDDZ83MXLtkc173W9mJkXaYbSa+BJ58qBkvH9hujPuVpvOxCeNO0rs6yS7Oq769EjOaEjC27XCG
	2WyrU2j5kLvL0oIouuZUiKOjcDBDJa2FyA9SPcEj+P8QxirGs54VK0QA0OMrWXOEZuzkDmHmqVs
	H1jTdlX+36h9ezhIxblaMYUwdRL42btaS7MhyJjkE24+50lbsFMkvsPBCrtg4hdPdERlH8hOiYs
	Kkd2
X-Received: by 2002:a2e:a812:0:b0:3a3:74b9:8a7f with SMTP id 38308e7fff4ca-3a5fc089db5mr26899541fa.24.1790015499454;
        Mon, 21 Sep 2026 11:31:39 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:38 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v8 02/10] iio: pressure: dps310: use a local device pointer in probe
Date: Mon, 21 Sep 2026 21:31:24 +0300
Message-ID: <20260921183132.233136-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921183132.233136-1-zoone.rupert@gmail.com>
References: <20260921183132.233136-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

probe() spells out &client->dev for every devm call. Take it into a local
instead. Keeps lines short as more calls are added later in this series.

No functional change.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 35260b399390..bd7da4f12749 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -845,11 +845,12 @@ static const struct iio_info dps310_info = {
 
 static int dps310_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct dps310_data *data;
 	struct iio_dev *iio;
 	int rc;
 
-	iio = devm_iio_device_alloc(&client->dev,  sizeof(*data));
+	iio = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!iio)
 		return -ENOMEM;
 
@@ -868,7 +869,7 @@ static int dps310_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 
 	/* Register to run the device reset when the device is removed */
-	rc = devm_add_action_or_reset(&client->dev, dps310_reset, data);
+	rc = devm_add_action_or_reset(dev, dps310_reset, data);
 	if (rc)
 		return rc;
 
@@ -876,7 +877,7 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
-	rc = devm_iio_device_register(&client->dev, iio);
+	rc = devm_iio_device_register(dev, iio);
 	if (rc)
 		return rc;
 
-- 
2.43.0

