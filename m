Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC1E4E9C0E
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734335; cv=none; b=ovXo3DrmPQi75fp1HzUAbInDsGgCS5W2vq5x3iJ8H9jqrXvkQgeSBWu9cdiaIywTnRCm3fF7eEeITwB8m6u9rsX80ANc0SOEwpBaT3UYZPZA6B52gBRkPDjRqIHya3nmlJ6AXQ7u2/dpDoB7Ah4FYtZyWr0x19PK3iRTdryl1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734335; c=relaxed/simple;
	bh=laksdeSdPu2zA6kfA0TK1uIuDUMTPBAhLTpGoGGPG4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGnusmhy1SdE50xDLoed+quVZP8Oa1WIYOklBkr06l59pwXsELQAFxPURMfzfzS9kam5mbDlyQ2tQPsl0EbbIxEcxHqPUA7gmtoVfp7GGkNxXpvaQUhYQbCLeR+huf28pJufSl4f2mJgq3HsKDkEhli9a6qzUTwMlJagVvJXCNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtkfAiVr; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtkfAiVr"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so689945e87.2
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734324; x=1790339124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60p97ewNtG9tKiPuMUOcTc/j/UXlUPAQ6cFtl0QC6Hg=;
        b=jtkfAiVrw9n0b2eTeNUyVs7pQVS7eLXmQDYBZGG6HIu2XLpZY7mq98g3Wj/n5BIvB/
         5MUu2aio6CPDWVMevkNbR362nzLiUJd7b8XA4+Qvu5/LuKr+CuRWH2yaGOQpEN0ArHSV
         V3C0IjfxIozGNmII/1bZXUCUvfdmBFVxVXEynB8N7lPUjoz/Celpi2f3W8P0vgXLoGMC
         s3w/32KPXs9LT2Ba/WAEOcrhSsd8cYd/YFbYPICffS40WQzFUaSN9EUal4v7hlugt8vx
         +BeEYfZZR80F7Y+4tS8PiKVkQYMpg8Velpl3yCzee3IB1F8iTATRtYSO6st9pvDC2zSx
         StoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734324; x=1790339124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=60p97ewNtG9tKiPuMUOcTc/j/UXlUPAQ6cFtl0QC6Hg=;
        b=mujObxaMv3LbTBQzSn7KJvPtpvq/KyoE96gUJ+hBNfn8sUNS4CVkyfIEV8zESG/w1V
         wCbtl9ZjdaMu9yUe+0HZKzmm7lKPQoo/vY/WiFR9fYaoV/bi1LOsoRLoHGv7+pwZvnG2
         BGY5OXR8myS91oCFsZsaCGDPKM3YGpgKbJBNuuBmw7pV1MutySDfNLFpZrjbOEAFpUC1
         86rrjCmuo3K08m5Lw0lQzNfXAzTeyef+2G5WZewYmu2QGtVb0pn2v6Xm27Uip20deNsV
         /dAd1mUVmTte6+q7PlLDho4bRLdV5/2YW28ZYjIqNqGM+6kiEVOL0rqC6qGDTNKyAZwj
         xQtQ==
X-Forwarded-Encrypted: i=1; AKwUvByrne0XhL89EuYtSNl/9c83PJ1ZOk1NnYyubEC1uXU4AZibMVCxDnMfuq6TI+HrY4zzsxcW@lists.linux.dev
X-Gm-Message-State: AFuF++nnJ9ax3l/SeNkr8ahOgjR97CWmOBXMefUILpY5WSCYbbsOeF/j
	/skpzDeWxOPMKnTLVxfNhml+0AvclVhIeO94ukXSX5U5bflPq28P30R3
X-Gm-Gg: AYBFou2eDYzLt+degYjxPKWPiT6K3RcZmk3nPl2z4n+BA6yVpVa81xyK8bfQ2OFrAr+
	j0WlkVR0YkAJ9r0eR1CoB5MSQae8f2b3zUNQHCRcDV5eEhqb1mfGBdLfMJdtROXAO6XR5mOVnV3
	e+EZo/An/vfXSdgXtlmqmjjblsTIh0yrMI7Bmec50RkbUTPSDCxXbjc5z9iS5R+0SWjzzSSl23d
	R8Of2CzZhfD84WxhHEVov7ut9LnFi+fwZo1OQWzlIQtl7sf81w31uL3IW7TTY+KtLj/G6bFsydU
	358LmWMk7nhIOex6Wc0tnIU5+g+Lf/FrJP9MNQlLUIngfwxTlYQTQideeGxrxA3xyz3fss3hu5a
	+iTKZmXfylr2D+43kGuqAiwa709FdIFQp4uBSjd/sp9KJ3UJGpGDj0HKGhRYulpR/gP7pK8zOdA
	6S9cFVo3EC51HTZ/JUgj3sbX+jzIx9LJJZ8oiyngZnwRsMoE/ag3kLwzHKN2e/HFcevG+uhVtvV
	WYqMgyLvP3vWQd6PrLe6LKCyDsepi7kPm2CCevltmMv0Jab3k/E4LJsIra/zBDATb+tYA==
X-Received: by 2002:a05:6512:1389:b0:5b7:6489:37c7 with SMTP id 2adb3069b0e04-5b8c179d8cdmr728262e87.0.1789734324360;
        Fri, 18 Sep 2026 05:25:24 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:23 -0700 (PDT)
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
Subject: [PATCH v7 05/10] iio: pressure: dps310: add triggered buffer support
Date: Fri, 18 Sep 2026 15:25:12 +0300
Message-ID: <20260918122517.377565-6-zoone.rupert@gmail.com>
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

Add a triggered buffer to capture continuously on both channels instead
of one sysfs read at a time.

Raw register value is not useful on its own, pressure has to go through
the compensation polynomial and needs a temperature reading. Report raw
in Pa with 1/1000 scale to keep full resolution in the buffer without
changing what the existing processed attribute reports.

Raw and processed reads return -EBUSY while buffer is on, so does any
reconfiguration.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/Kconfig  |   2 +
 drivers/iio/pressure/dps310.c | 151 ++++++++++++++++++++++++++++++++--
 2 files changed, 148 insertions(+), 5 deletions(-)

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
index 8cefca928077..dd816d47bbec 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -22,8 +22,11 @@
 #include <linux/regmap.h>
 #include <linux/unaligned.h>
 
+#include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
+#include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
 
 #define DPS310_DEV_NAME		"dps310"
 
@@ -94,19 +97,50 @@ struct dps310_data {
 	bool timeout_recovery_failed;
 };
 
+enum dps310_scan_index {
+	DPS310_SCAN_TEMP,
+	DPS310_SCAN_PRESSURE,
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
+		 * _raw here is already compensated (section 4.9.1, which needs
+		 * a temperature too) and in Pa; _scale converts to the kPa the
+		 * ABI wants. _processed predates buffers and has to stay.
+		 *
+		 * Do not copy this into other drivers. A _raw that is not the
+		 * raw register value is only tolerable because the alternative
+		 * is losing resolution or breaking existing _processed users.
+		 */
 		.info_mask_separate = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
 			BIT(IIO_CHAN_INFO_SAMP_FREQ) |
+			BIT(IIO_CHAN_INFO_RAW) |
+			BIT(IIO_CHAN_INFO_SCALE) |
 			BIT(IIO_CHAN_INFO_PROCESSED),
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
@@ -586,6 +620,11 @@ static int dps310_write_raw(struct iio_dev *iio,
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
@@ -723,6 +762,13 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 
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
@@ -731,6 +777,12 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
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
@@ -812,12 +864,10 @@ static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
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
@@ -830,6 +880,87 @@ static int dps310_read_raw(struct iio_dev *iio,
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
+		/* This consumes the measurement the capture path reads */
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
+static int dps310_fill_channels(struct dps310_data *data,
+				const unsigned long *scan_mask,
+				s32 channels[2])
+	__must_hold(&data->lock)
+{
+	unsigned int i;
+	int rc;
+
+	/* Compensation needs a temperature, so it is sampled either way */
+	rc = dps310_read_temp_raw_locked(data);
+	if (rc)
+		return rc;
+
+	i = 0;
+	if (test_bit(DPS310_SCAN_TEMP, scan_mask)) {
+		/* Millidegrees Celsius */
+		rc = dps310_calculate_temp(data, &channels[i++]);
+		if (rc)
+			return rc;
+	}
+
+	if (test_bit(DPS310_SCAN_PRESSURE, scan_mask)) {
+		rc = dps310_read_pres_raw_locked(data);
+		if (rc)
+			return rc;
+
+		/* Pascals, see the channel definition */
+		rc = dps310_calculate_pressure(data, &channels[i++]);
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
+	struct {
+		s32 channels[2];
+		aligned_s64 timestamp;
+	} scan = { };
+	int rc;
+
+	mutex_lock(&data->lock);
+	rc = dps310_fill_channels(data, iio->active_scan_mask, scan.channels);
+	mutex_unlock(&data->lock);
+	if (rc)
+		goto err;
+
+	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), iio_get_time_ns(iio));
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
@@ -885,6 +1016,16 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
+	/*
+	 * The device measures continuously in background mode, so a capture is
+	 * just a read of the latest results. The trigger is not aligned with
+	 * the measurements, so the timestamp is taken in the handler.
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

