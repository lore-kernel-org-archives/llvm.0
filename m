Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56BD38DC7B
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602463; cv=none; b=n/UkxJXWVrvZjkXbIffk4vm7HPdK/FS+jIS9UuwTQZLxr/r1f/YVXlngAu/KKaCTdRsH8laN7BixGUmCgHWhgKKPUh4ibXUf0jrgnup7D98Li/X6WzoAMK9eXmo2yio6y8uj1Oo0gZw9W/94ysb58KkAHAwAiOitLqvwpbNWJ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602463; c=relaxed/simple;
	bh=csUPRYnD1mZEqYaD+zR8/M55EcN2oznVfK16WyklPNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8em+RHIngFBZO4zqMgbjFmp2/kfx9ODQB3rF5OebsPvNtHURLfW5QZK4RRyrV3vgn0ScY95CsZsd+xN9I9GloFV6dr8zpGd5crmK55UqRH1gCcI5rct9PXzWuoyGDebqbpvkgCNWHK0K/L2jRpdIDaTpyZnPmDTenBLCBLwXd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1gaBxZA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1gaBxZA"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b29599b81cso4847781e87.1
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602457; x=1788207257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jr7LJu6Ksb6SAGIGzJSc2rS20dUT4t5olBG8OLxTlPA=;
        b=F1gaBxZAJndz7HkSANIo/cheDiuG5f5URpP6D9wqQefrezbvhu9JQ4mm9YMCF6j7ZE
         hD+oIY8a6VUQoHWq79o3rCXqRQWFMuk64HHY/vEkQGRht5RUqGdc9cRb1QF9ZLNq0t+/
         iqNpQ7B3tPZetuRiMyk91SM1hR7nyBcOf74cS7kZ4SGa3L1u55cCLMzhAnaj43NJ2XET
         t8XBlpXvl74KRpNwuyF/DcqK6vqyyPyco+RVR4AagjxBzcpL0mEGJr2E1cLN167bqMmX
         JmupsvoKJxiLiDpvLJP/uY/oWtyXwACPPU+mN8VqUQyafAk/GwL1cXjqS7AfI2CQv93y
         Xaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602457; x=1788207257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jr7LJu6Ksb6SAGIGzJSc2rS20dUT4t5olBG8OLxTlPA=;
        b=gymvZKz41vVtOK+WTgHXS7uKrlUqHL1X8s2JSaj+woCYtoiIOx/K6JHq91crpZI4cD
         /ErAtO6l2hj9NIVes7Nvj3CoBP3Mnp4slzHup9BSYJ6dspLQe9rthZxBRFDB9MGQ9LO+
         fkS9hFLdxGjjst32CRCBIyDuHmLzlsTQMSCc/3iXUvgiW4LDS/Ux2cBWMoKEId0LNX6P
         VL6MTMzwe36gA1zxJJvm/7GdYlLTqgUJYFeHzrQfLGbNSJdO3kHfn3s7F2LydQPf9y9B
         02/jwlxSlW2bIANTAA1FQlH07vgvTgO0s+yovLkR1zPSUn6dpCwD7GsbKqrRxCfhL8RB
         vtzA==
X-Forwarded-Encrypted: i=1; AHgh+RqOzl40KvhODnvOeeqL8xQA9ONARNqCbVCGCMNu8hmIMoEcg7Gr2mLm2zawRiKAPWbKCj5f@lists.linux.dev
X-Gm-Message-State: AFuF++mstv6Vt7fKZ0IURkyfv/PIbjhjJ0B/cC+8fa2LpOCEiF6T7b9H
	HS2/bQit9To8rESvbWiRR2ehJTfM13aIfaxKJwEAdMeYM96Ig8QAi1dw
X-Gm-Gg: AR+sD13yUkoEID5JeHo5t/A2w/QBQEZT3IKn5E4fSSIPfiNn1hHIPii/DF1D1ePMfQh
	0N+ALiQ+WUKU7qDS0VH4iLrMhbQvCsXRdqgWQZyPNL74eEOrYxX9Stm9XRiyMAiguPLMuR6QfAv
	/7+Yu7xe1unuat3w6f55wQdB3FG26mgOF/hZFBBfQUltD8K1ldRLT5m/qqqOWqzBpSXXUdgfTRI
	p9dw/gu2Coh+NXYvGXxRLiYk0waOKZ3XQUFpl+eDVUH/f+knunmVmPBxzArjVlR/NBGnjFXeho7
	H9r27h2zFZSPkTngRlNWHeegCEQV+zJyBTrTNgK+NXw0MKfUyz2ji4TWBkvT7UGrmA3/AobHVzf
	zybMRr1svK+5wbGNBQQ5lV06uDOQdb8ZuobYYj8Fxonha9jnEHruvSO+kWovMQ8wKsFi2fkwWJ4
	Qs9QXwsqS5SF+T/VdEgqebIag8RDcQWkHPCMxpCsuS6XdRj7fPIRqUG3PaCaiYA+tq9mYrMGUmQ
	xsM9Y8MR0sBFwKs1YqqGuArSwe4CcWRYu9ZNMEC6WEGGMNgjcgL0p2Q1K84ENQl2XOFKg==
X-Received: by 2002:a05:6512:1192:b0:5b3:11a0:968b with SMTP id 2adb3069b0e04-5b48b8979a8mr6248951e87.19.1787602456505;
        Mon, 24 Aug 2026 13:14:16 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce0cd9csm1923620e87.71.2026.08.24.13.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:14:16 -0700 (PDT)
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
Subject: [PATCH v6 4/6] iio: pressure: dps310: add triggered buffer support
Date: Mon, 24 Aug 2026 23:12:01 +0300
Message-ID: <20260824201203.396651-5-zoone.rupert@gmail.com>
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

Add a triggered buffer in order to capture continuously on both channels
instead of one sysfs read at a time.

Raw register value is not useful on its own, pressure has to go through
the compensation polynomial and needs a temperature reading. Report raw
in Pa with 1/1000 scale to keep full resolution in the buffer without
changing what the existing processed attribute reports.

Raw and processed reads return -EBUSY while buffer is on, so does any
reconfiguration.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/Kconfig  |   2 +
 drivers/iio/pressure/dps310.c | 169 ++++++++++++++++++++++++++++++++--
 2 files changed, 165 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/pressure/Kconfig b/drivers/iio/pressure/Kconfig
index 838a8340c4c0..cef8b90b9ae7 100644
--- a/drivers/iio/pressure/Kconfig
+++ b/drivers/iio/pressure/Kconfig
@@ -112,6 +112,8 @@ config DPS310
 	tristate "Infineon DPS310 pressure and temperature sensor"
 	depends on I2C
 	select REGMAP_I2C
+	select IIO_BUFFER
+	select IIO_TRIGGERED_BUFFER
 	help
 	  Support for the Infineon DPS310 digital barometric pressure sensor.
 	  It can be accessed over I2C bus.
diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 269a71ea3e7a..f122acd72b0c 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -21,8 +21,11 @@
 #include <linux/regmap.h>
 #include <linux/unaligned.h>
 
+#include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+#include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
 
 #define DPS310_DEV_NAME		"dps310"
 
@@ -93,19 +96,60 @@ struct dps310_data {
 	bool timeout_recovery_failed;
 };
 
+enum dps310_scan_index {
+	DPS310_SCAN_TEMP,
+	DPS310_SCAN_PRESSURE,
+};
+
+struct dps310_scan {
+	s32 channels[2];
+	aligned_s64 ts;
+};
+
 static const struct iio_chan_spec dps310_channels[] = {
 	{
 		.type = IIO_TEMP,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
 			BIT(IIO_CHAN_INFO_SAMP_FREQ) |
 			BIT(IIO_CHAN_INFO_PROCESSED),
+		.scan_index = DPS310_SCAN_TEMP,
+		.scan_type = {
+			.sign = 's',
+			.realbits = 32,
+			.storagebits = 32,
+			.endianness = IIO_CPU,
+		},
 	},
 	{
 		.type = IIO_PRESSURE,
+		/*
+		 * Pressure is only meaningful once the raw register value has
+		 * been run through the compensation polynomial in section 4.9.1
+		 * of the datasheet, which needs a temperature reading as well.
+		 * So what is reported as _raw here is already compensated, in
+		 * Pa, and _scale converts it to the kPa the ABI asks for. The
+		 * _processed attribute reports the same value and predates
+		 * buffer support, so it has to stay.
+		 *
+		 * Do not copy this pattern into other drivers. A raw attribute
+		 * that is not the raw register value is only tolerable here
+		 * because the alternative is either losing resolution in the
+		 * buffer or breaking existing users of _processed.
+		 */
 		.info_mask_separate = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
 			BIT(IIO_CHAN_INFO_SAMP_FREQ) |
-			BIT(IIO_CHAN_INFO_PROCESSED),
+			BIT(IIO_CHAN_INFO_PROCESSED) |
+			BIT(IIO_CHAN_INFO_RAW) |
+			BIT(IIO_CHAN_INFO_SCALE),
+		.scan_index = DPS310_SCAN_PRESSURE,
+		.scan_type = {
+			.sign = 's',
+			.realbits = 32,
+			.storagebits = 32,
+			.endianness = IIO_CPU,
+		},
 	},
+	IIO_CHAN_SOFT_TIMESTAMP(2),
 };
 
 /* To be called after checking the COEF_RDY bit in MEAS_CFG */
@@ -589,6 +633,11 @@ static int dps310_write_raw(struct iio_dev *iio,
 {
 	struct dps310_data *data = iio_priv(iio);
 
+	/* Reconfiguring mid-capture would change the values being captured */
+	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
+	if (IIO_DEV_ACQUIRE_FAILED(claim))
+		return -EBUSY;
+
 	ACQUIRE(mutex_intr, lock)(&data->lock);
 	if (ACQUIRE_ERR(mutex_intr, &lock))
 		return -EINTR;
@@ -730,6 +779,13 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 
 		return IIO_VAL_INT;
 
+	case IIO_CHAN_INFO_RAW:
+		rc = dps310_read_pressure_value(data, val);
+		if (rc)
+			return rc;
+
+		return IIO_VAL_INT;
+
 	case IIO_CHAN_INFO_PROCESSED:
 		rc = dps310_read_pressure_value(data, val);
 		if (rc)
@@ -738,6 +794,12 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 		*val2 = 1000; /* Convert Pa to KPa per IIO ABI */
 		return IIO_VAL_FRACTIONAL;
 
+	case IIO_CHAN_INFO_SCALE:
+		/* The raw value is in Pa, the ABI wants kPa */
+		*val = 1;
+		*val2 = 1000;
+		return IIO_VAL_FRACTIONAL;
+
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
 		rc = dps310_get_pres_precision(data, val);
 		if (rc)
@@ -819,12 +881,10 @@ static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
 	}
 }
 
-static int dps310_read_raw(struct iio_dev *iio,
-			   struct iio_chan_spec const *chan,
-			   int *val, int *val2, long mask)
+static int dps310_read_channel(struct dps310_data *data,
+			       struct iio_chan_spec const *chan,
+			       int *val, int *val2, long mask)
 {
-	struct dps310_data *data = iio_priv(iio);
-
 	switch (chan->type) {
 	case IIO_PRESSURE:
 		return dps310_read_pressure(data, val, val2, mask);
@@ -837,6 +897,92 @@ static int dps310_read_raw(struct iio_dev *iio,
 	}
 }
 
+static int dps310_read_raw(struct iio_dev *iio,
+			   struct iio_chan_spec const *chan,
+			   int *val, int *val2, long mask)
+{
+	struct dps310_data *data = iio_priv(iio);
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_PROCESSED: {
+		/*
+		 * Sampling here consumes the same measurement the capture path
+		 * reads, so refuse while the buffer is enabled.
+		 */
+		IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
+		if (IIO_DEV_ACQUIRE_FAILED(claim))
+			return -EBUSY;
+
+		return dps310_read_channel(data, chan, val, val2, mask);
+	}
+	default:
+		return dps310_read_channel(data, chan, val, val2, mask);
+	}
+}
+
+static int dps310_fill_scan(struct dps310_data *data,
+			    const unsigned long *scan_mask,
+			    struct dps310_scan *scan)
+	__must_hold(&data->lock)
+{
+	int rc;
+	int i = 0;
+
+	/*
+	 * The pressure compensation needs a temperature reading, so temperature
+	 * is sampled even when only the pressure channel is enabled.
+	 */
+	rc = dps310_read_temp_raw_locked(data);
+	if (rc)
+		return rc;
+
+	if (test_bit(DPS310_SCAN_TEMP, scan_mask)) {
+		/* Millidegrees Celsius */
+		rc = dps310_calculate_temp(data, &scan->channels[i]);
+		if (rc)
+			return rc;
+
+		i++;
+	}
+
+	if (test_bit(DPS310_SCAN_PRESSURE, scan_mask)) {
+		rc = dps310_read_pres_raw_locked(data);
+		if (rc)
+			return rc;
+
+		/* Pascals, see the comment on the channel definition */
+		rc = dps310_calculate_pressure(data, &scan->channels[i]);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
+static irqreturn_t dps310_trigger_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *iio = pf->indio_dev;
+	struct dps310_data *data = iio_priv(iio);
+	struct dps310_scan scan = { };
+	int rc;
+
+	mutex_lock(&data->lock);
+	rc = dps310_fill_scan(data, iio->active_scan_mask, &scan);
+	mutex_unlock(&data->lock);
+	if (rc)
+		goto err;
+
+	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan),
+				    iio_get_time_ns(iio));
+
+err:
+	iio_trigger_notify_done(iio->trig);
+
+	return IRQ_HANDLED;
+}
+
 static void dps310_reset(void *action_data)
 {
 	struct dps310_data *data = action_data;
@@ -893,6 +1039,17 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
+	/*
+	 * The device measures continuously in background mode, so a capture is
+	 * just a read of the latest results and no buffer setup ops are needed.
+	 * The trigger is not aligned with the measurements either way, so the
+	 * timestamp is taken in the handler rather than by a top half.
+	 */
+	rc = devm_iio_triggered_buffer_setup(dev, iio, NULL,
+					     dps310_trigger_handler, NULL);
+	if (rc)
+		return rc;
+
 	rc = devm_iio_device_register(dev, iio);
 	if (rc)
 		return rc;
-- 
2.43.0

