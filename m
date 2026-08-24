Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A2D36197D
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602457; cv=none; b=EVrEZ6QHemMQO89JOuXWs5PCk5AhBE5JiOgCEIP0VkOMqAdf0wuapeEfNv/C2utxDAhf2Z4SYqWLdrEp58vug8lcbBe2YyOwAVIChhkpUz2w0IAsuJIMHKt1wBTITMi/1nTlSKPEqNo6qUlBHsw8fSGgO1z3ku3g9HHQHk7wj+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602457; c=relaxed/simple;
	bh=n9Bht//Yk3scXsF8UPLRoojJO5J/1T0We2RgP49xtRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1/gJlfVLFpkTzwzB/Pp+K6UbQ4+rdIkD4Bl8sly7OYPTvsH6fZWYDdbjzk6xPA60hUxSnRIHUlmNeLrYi1ieAER5llBT9j5/trldpCxM9Mh9j6zPiIhtSQJSnR95RPZx+TVNIYWLoF1uxYyb4kSq6I2Vf6YqvySALA0DSsxmjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYGx4J8L; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYGx4J8L"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so3703853e87.3
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602454; x=1788207254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QSIPUen5mSK3/7kB5RAMGdblegdItDVxkIK2jwNz2kU=;
        b=IYGx4J8L1pEMqhp9dDkosmBqafI/PIwh+mUQqzQOHktN2+Igb82SKGbJ813roMzqLa
         0TfGwtCeNRl/HUqMmeEYi/lH7uv6hAGXCp33HT9clW330+peMFLp8Nplozt6eD/bMoo7
         UyDFUl6RROKp1N5NcnQyWO1FVfaXIZ+IL1Blq6rCwk9fa0NxXgdkKSxo90ztryktGn9Z
         B+s6BPt9ESUZi3z02lhwSvMvV3Qzfwcr+7qR4FkxnNwvcgUTpr5O8GeLi8kCd4korZUv
         8IfamIFkRZJl5kWGW4oYxvEX99Yfbydl3GpBAKjOHOVfrC2wJ3NRhnGT+6Svd83ZP0ea
         8cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602454; x=1788207254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QSIPUen5mSK3/7kB5RAMGdblegdItDVxkIK2jwNz2kU=;
        b=TvAMBklS06dNuCkINfm5uRNbIBspMh+km9XrKQqEfEmAuytHv7sK0fwRTe+ODC6QpT
         LdZI2q2T2hB19iNnhZLpQwgetu4jJLdBv89TpTiLaNio4i/r2gxFJ2KYy6jOel/mDI9E
         7pe3IgKC/PVr+kl82QlnKleUaAmiE8F9IiKR+JdnrXnQ0MZC/Fgt7ZaK6SbLvEGr5Zv6
         ULrmtBAJyf6UH5oRpCYPyGXv2155AEL1PsUDQTENOhCkweDAb8i3GQnDq/g+1UQUqnyA
         3Z+uky6Cgfhg49i6D6JvnsJfG1zLNImgP6q+K2R7NizXo1f48iQCFTXR/qUAGLePijj+
         yfOQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdNny/UB/mAtOwj2NMWh1uGh6kcFtyepXUjI7oD4lBpBD7QcpJgjcTCypxy349xzKKS7mc@lists.linux.dev
X-Gm-Message-State: AFuF++mBLwJQbxMd5AS6ASjG5/OI7X3iOoBguPI5BCwHYGoqC5hvsN31
	YuU9FumfZH+N4rnJiBEKVYRDF1ZirzwNDUD1MexZnuJu/VqPP7s4iitf
X-Gm-Gg: AR+sD10DOUXVM5E0OlqBGi0fDvIuO0c3ZJ6qGf4OjLMu5reFiB2Gw+rQU7OVjMoyMsu
	pYZMc1NuczXlNdWZ9Wuju/vKwXr4kQut0BrYnZtv0UPOrKRxpLUowdoy8i/kemTPyB1nWuVNWBR
	gF9UR3YRhCk/1gyM3coUEBhH5YCXRiiACHa2WvxCEdKCTnIplvYEyEHYaWy1NRFoYBLYGkEIzwo
	xHM0OdSymhILFu9FVRy7Qldw0T21TXyqJU//+xQff0AUtJTOEgYSbB+71u3cxNSRddJxrj+wcHe
	0v/hNe6H1HBVi5Kw5uQHbMzIsk3mUtcnaSVuOxD1ycXFGp4tLz262hR3Sbxuf14cqOGZ+FvzVfT
	QsNPqSdB/G5MrXAgwS5TIokOwhXvibr7GVXH7LThq4lsjf20d9s1e8Br16dLKi94zq8od3wLlzY
	x9C3NZGzDpgmsJQ6zlp9K2Wd98uIEQEk0qTZrXU6UyO3jvcO6zpBvEAzZ7ap8LGsGzCmdKyBfp2
	gH9vErzNaJO76CdKDvMA/7ZNB4w4fCVucgN4zjy7UtKcdGHI+paI/L8wC8=
X-Received: by 2002:ac2:5688:0:b0:5b0:23cb:91ea with SMTP id 2adb3069b0e04-5b48b8a15e8mr5879737e87.22.1787602453887;
        Mon, 24 Aug 2026 13:14:13 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce0cd9csm1923620e87.71.2026.08.24.13.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:14:13 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v6 2/6] iio: pressure: dps310: use a local device pointer in probe
Date: Mon, 24 Aug 2026 23:11:59 +0300
Message-ID: <20260824201203.396651-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824201203.396651-1-zoone.rupert@gmail.com>
References: <20260824201203.396651-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

probe() spells out &client->dev for every devm call. Take it into a local
once instead, keeps lines short as more calls are added later in this
series.

No functional change.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 68382960382f..25d1c79876e6 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -846,11 +846,12 @@ static const struct iio_info dps310_info = {
 static int dps310_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	struct device *dev = &client->dev;
 	struct dps310_data *data;
 	struct iio_dev *iio;
 	int rc;
 
-	iio = devm_iio_device_alloc(&client->dev,  sizeof(*data));
+	iio = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!iio)
 		return -ENOMEM;
 
@@ -869,7 +870,7 @@ static int dps310_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 
 	/* Register to run the device reset when the device is removed */
-	rc = devm_add_action_or_reset(&client->dev, dps310_reset, data);
+	rc = devm_add_action_or_reset(dev, dps310_reset, data);
 	if (rc)
 		return rc;
 
@@ -877,7 +878,7 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
-	rc = devm_iio_device_register(&client->dev, iio);
+	rc = devm_iio_device_register(dev, iio);
 	if (rc)
 		return rc;
 
-- 
2.43.0

