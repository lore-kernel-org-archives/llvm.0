Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939024AC143
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734336; cv=none; b=aSWqOwCRbSo3ZxEM2AM80f1VxRpgrTlRa8BGMu8BaWMzJV2ZF8Kc4S1aZFzjdsaR3H+KzynB61IOMbtsOvkGO9sOBlbpzj+J3ACVdg+ky+4MqwXzLkruLKFMz8fmYX22dGWqbcQ4szugyANUCxXo4z+XRgEGrVkm7q8BacAKC2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734336; c=relaxed/simple;
	bh=Yj4RwbCvi7B7lQgZjaL6AuMOkRGQNU1rLzNzZVSRhLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dX/m3I64RtBeJ4awYqw3R1HZMk8cPXoBdj1NrWPwLosUDmVHlFzvCBo0R+O3wsTHb7MVVTYWSYFDzV8B6/Qa8Wg3ejE5h9c2pQArLsq/IZlvRyv3ZkJWVCW7Jfjmss07slYxxH4CfX3XrT7UBRcAL8j+Hezvt6fkBjsMVpPRQWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmDFmh6o; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmDFmh6o"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so747793e87.0
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734322; x=1790339122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIjQv3Ni12nKKfUqhl2wfffLShu1iZGR3QKWNIW24Vw=;
        b=jmDFmh6oo4eHbYwjTU2k+BkYfrBqsUmpDn8Wsvtpe/2FAVztK5d/hBwkYml59W/AhN
         7f2/ifrkQ93sNWeJVuHHVhx0DmBD+advGnJlDkdbhdbL+m4MBtFAxbbqbQBgPckMQodq
         dEoXEdh//gQfBDvLDin0vFzGMsbgwV6vgHww2vq0fVdftb7wMHzW+UJktO/7UAPbSIQ5
         3JE7C2oCS/nuWSe1wq/ffBJP3mq8R15nIQIDMawf4KRC7P4Hg/Ra7cwEdN4Tg5L/Z55c
         zWjgt4PVbBtoWzBq1Lkn5Jnblu1e05dS56ylPnKBxsDmv/Elz0AbUIBqHegPH76qZ12Q
         ltgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734322; x=1790339122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIjQv3Ni12nKKfUqhl2wfffLShu1iZGR3QKWNIW24Vw=;
        b=ywGIQZT+Y6gb6p0b/muGv0hjLy35bG6/fCkvFrNopCbs4huhepg2lCWrv3hZbco7zf
         CjqnQt594kBkljakC2ebNACTcMV/n1wLrLBn+PMQ5xsYiznVKZsSNamiwVSOhguKtvEP
         dXCAv/sy+cL/bKyF2OFcVq3YcM8tWd4RXbRyNFf0wuyi1ADCNm+I5FqxrvCMNU151mPO
         1NsZ2s/9NtavG37aGVQopmqUkbVOPbQaIrxTAo9y9K1EsXfW7LhJRQZaDG09OB72a6wt
         r3M2Z8iB5Lwo3eZMKWgqAU2jVWr9USFd+a6EA9CRlKXeySNgPg0wEhgoxfZA8x2GbVF7
         PTCQ==
X-Forwarded-Encrypted: i=1; AKwUvByNBXnJl/0PaZm9PKPsHM+DjZDqdC3W6+mAwseyeVAUx0LidyAofL2Ezlg9stcSwsSPC8YA@lists.linux.dev
X-Gm-Message-State: AFuF++mSLKI/XPpVXJKyahHIsxkSBpf9vdnR7LtDQEsFRb4OzrSHNdc2
	qfaYYKUw2an6SG85mp9QFMz3F9BxDxg10mRRCwV3lsR99uHhQ3ow1ggL
X-Gm-Gg: AYBFou1ER+lm9nfnamhIwE7id2i39UIxyaEnddYIrja4MxgAcEOnS1+dm2F8poSa++Y
	qZL0GfQAWwFjeAWMGyEUEJaDFWYDXQcZBBL/Ag/zmHB/G/YjYQqnGlpi1WpxHjfRHEurIV8CfRx
	8JXTIk98RByve/YVY+Vp6MJkZTzRXtYg9cnqvDH6zM69/ScqWxeDqc9YMxu11+xVptwWA+HWv3b
	SqHirINYLLifv4zOx2nnwzWqWCJ9DpJ7w5Jv8xWSLbsw/7qxhOrI9Oh2EAuJ4mDncp0cBDMCDeL
	bTMjE+WQzTk93g1btXQaaTiJ0EQuoKw+vwZJR2nAfm8wEfs+VzuT7yRBIayNDXR4BXBbuJU8tWu
	hJ7rn4ILpNASpElsF30zl3cgCPGlxaKvKvZdxKhjiFoXsgCKaymoSKeCZzJ6wIRknhxpphnXOHd
	AHdHPL3LBm9h9YDzhy4+9K6irkBhS+SgvahjcOY6FZ3RpqcPuFyAKcp+3zgiWnlF9bWRubDu2ZW
	cZBvGoC+gH0N1/Ip9Lu+ZiFfXOeqFvX2OjYBAC206yi6z0kEUEPlaQFUJR3QOAe0NHL8JzitM9x
	sXJy
X-Received: by 2002:a05:6512:234e:b0:5b4:ac1b:89bc with SMTP id 2adb3069b0e04-5b8c1818e38mr752954e87.24.1789734321552;
        Fri, 18 Sep 2026 05:25:21 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:21 -0700 (PDT)
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
Subject: [PATCH v7 02/10] iio: pressure: dps310: use a local device pointer in probe
Date: Fri, 18 Sep 2026 15:25:09 +0300
Message-ID: <20260918122517.377565-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918122517.377565-1-zoone.rupert@gmail.com>
References: <20260918122517.377565-1-zoone.rupert@gmail.com>
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

