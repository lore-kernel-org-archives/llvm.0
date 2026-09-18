Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FA14EC64C
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734337; cv=none; b=L9zxu9ibfAaaEwi6RZRgl3nBHFdDmB10dO8ueg/G3Kau174tHZOssGtBGCiGJlcvKYqnVHJcLXG7OG0porJrJ/lNJJ7Vu//M5ud6yalJqAed57PPC+40Ga1+Tm1DSgB+Le9XvkRxHnuHZ7vSpEej7k6M74UZrglC5af7MWgvHT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734337; c=relaxed/simple;
	bh=BqD+7tSzLxTJxUspsiSX8hEETeKDZb8PtvBn/q2GlbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jcabo6ncGa7RUZeWgLLPgQgIG540aydgZv0kg9NNBZXEdzv9leaIrDzVKF1GTwkfrwNjjdQsMYTOlb8eFZV/1McuMz1aUIE37RPany+njTSPNp8FQ3vrXalXlffzrrJfqOfqymF79CfIZfNloKY5xStAI4qAnwI2tEC8F7VwAfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNXP/bTs; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNXP/bTs"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b899413537so880031e87.1
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734326; x=1790339126; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tq3h6JKJmzsaFI+i9MuIchESUOERl8g67kAMYSTdEy0=;
        b=UNXP/bTsS2x3Dxz9lPcVsbpmWXBEAWs8tsac36eCJRFsYsx8E+Ta3HQPBVsxiHBkU1
         IwHiAIJ1M2h0mumuOhiVT2NgR8/oddi+eB9rK/63KAbojVnPV7Xp59iel5EqucfAZ+8S
         CojzwueWMH42dciHsexr8KQ7B3i9VkNJonM1HBqZA5ECLwDZ3cWDPSjDORssVJVqg3Gw
         yuk9/cdLpRkN1a7P0VRE1k9hmiQV0YrWivnCol77Ys8PpRVko20bGFT+Klbues0WKM9/
         /Xz446afDD06WdYPh4DyAH9IGqVaAVbMtKI/2PPp0i0/Vukp7Htf2UI2G3IDuMy80V7c
         E7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734326; x=1790339126;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tq3h6JKJmzsaFI+i9MuIchESUOERl8g67kAMYSTdEy0=;
        b=Dh0EnEoH818PErS/KMA2BxyrySaPeQznA1voc4pux712bVLy8qHpPu8Mq+M8a/3N2I
         L6rLUdx0gO+lguvoCqO9REEZerzyqOfdoshSro/dweUdFgC/V4NzAcF+zZWaT+zcqR4k
         lTvXcA8/xe9R47fPNM/VqK43UcWD3iDoLzULXsOAYkSuq5eFEjzRAqxYnYlT6uBOIIJy
         ntrGMUNQXCASoy3RbqAF5dg7Q6nFej/I++cy8Bm3NC9UWRt3rxML8+Qxu6BPmNmfATGO
         XBRQD0OH3elKzCYvmN9qTkgGmTBb+hBCZR9DUdv5Z8dhAwJUpbAQqCBPBRbHjckFuUDp
         QL7g==
X-Forwarded-Encrypted: i=1; AKwUvBwqXut1QREVmblCMMryxZ9TuQ51OUcsVCXc9Oq18eJqG6XBlE9la48/X9r66+gy6N+0VYxg@lists.linux.dev
X-Gm-Message-State: AFuF++nHK6BKkrGB9c846oyQmpjt0ZXpMsj9WfwydNKEllmnEZFNa3jX
	FrPhW56v8cWUiPXMBlx68q/ZXnFpe3DXs8nsYP6ncLV8ckuOjxVqwgNb
X-Gm-Gg: AYBFou0PYUyUIzz2ce9CJ4n83GU23bS97GWOxsMmQ50SSqLP4XRqxqBK4QPwVqGQo7s
	GvPN4THeZyGoYCBqPIFdvxe6XVxasclJDMAZz1FspI6ppdfzDqUITcKPOCa6HsE1NpcBnAYfVP5
	5PyWNxydEpERM00rznp9D4Wj7sh2wfgXl1yhRhqWX5vl9XzI9UsOw21llra6rksXCws29PRUM2I
	bF3LDNy186AemiD8mCTzE1Z0TOkLT1L/hggU/r0unRVgPaAa/RZePKIiPN8nwjRr0r6x2Zd7Odc
	NwdheS/aPacooyj/DfYcC3GDIIaUiIKWbZRSe92Jp/fDySFsY5ZRdL7I9883VjAXhYkSH7kPGW2
	cjIfOO0MP87ufhuLvP3hm2dpyXApFqj1eWcalEP9nCpjsraaubotZ1d6g7vvFs8VOLJTBJ3X3+s
	Oe6KcTcEkYVK2YsMTEQwh4aAJmQKjvhEFLC48XFGDpW5yW+HHQK15VGIg2gEdlzxzANjGhCMGAw
	BRKhmCZX0oCMZKJeV2YaqWhBbkZkkaAf5pkAA/E1NFqJ21g+Q9CF5EGXgyTmoF464MNGw==
X-Received: by 2002:a05:6512:110a:b0:5b8:99a5:5162 with SMTP id 2adb3069b0e04-5b8c180e6cfmr704214e87.26.1789734326022;
        Fri, 18 Sep 2026 05:25:26 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:25 -0700 (PDT)
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
Subject: [PATCH v7 07/10] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Fri, 18 Sep 2026 15:25:14 +0300
Message-ID: <20260918122517.377565-8-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918122517.377565-1-zoone.rupert@gmail.com>
References: <20260918122517.377565-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DPS310 has a 32-entry FIFO shared by both measurements. Drain it from
a work item and push what it held, so a buffered capture needs no
trigger. Nothing in tree wires the interrupt pin, so the work rearms
itself at half the time the FIFO takes to fill.

Entries carry one measurement each, so a pressure entry is compensated
with the temperature ahead of it. Pressure read before the first
temperature of a session is held until one arrives rather than dropped,
so the first push can wait a temperature period.

FIFO entries are not timestamped, so postenable refuses the timestamp
channel unless a trigger is attached.

Tested on a DPS310 on a BeagleBone Black.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 371 +++++++++++++++++++++++++++++++++-
 1 file changed, 360 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index dd816d47bbec..e63ea7873e5b 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -2,16 +2,11 @@
 // Copyright IBM Corp 2019
 /*
  * The DPS310 is a barometric pressure and temperature sensor.
- * Currently only reading a single temperature is supported by
- * this driver.
  *
  * https://www.infineon.com/dgdl/?fileId=5546d462576f34750157750826c42242
  *
  * Temperature calculation:
  *   c0 * 0.5 + c1 * T_raw / kT °C
- *
- * TODO:
- *  - Optionally support the FIFO
  */
 
 #include <linux/cleanup.h>
@@ -20,7 +15,10 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
+#include <linux/workqueue.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
@@ -59,9 +57,22 @@
 #define  DPS310_FIFO_EN		BIT(1)
 #define  DPS310_SPI_EN		BIT(0)
 #define DPS310_RESET		0x0c
+#define  DPS310_FIFO_FLUSH	BIT(7)
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
 
+/* Section 4.8: 32 shared entries. Stops when full, so late drains lose data */
+#define DPS310_FIFO_DEPTH	32
+
+/* Read back once the FIFO is empty */
+#define DPS310_FIFO_EMPTY_VAL	0x800000
+
+/* LSB tags which measurement produced the entry */
+#define DPS310_FIFO_TAG_PRS	BIT(0)
+
+#define DPS310_DRAIN_MIN_MS	20
+#define DPS310_DRAIN_MAX_MS	(2 * MSEC_PER_SEC)
+
 /* Make sure sleep time is <= 30ms for usleep_range */
 #define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
 /* Silently handle error in rate value here */
@@ -95,11 +106,28 @@ struct dps310_data {
 	s32 pressure_raw;
 	s32 temp_raw;
 	bool timeout_recovery_failed;
+	bool fifo_temp_valid;
+
+	/* Used only while the FIFO is enabled */
+	struct iio_dev *iio;
+	struct delayed_work fifo_work;
+	s32 *fifo_hold;
+	unsigned int fifo_hold_max;
+	unsigned int fifo_held;
+	unsigned int drain_interval_ms;
+	s32 fifo_temp_raw;
+};
+
+enum dps310_fifo_entry {
+	DPS310_FIFO_EMPTY,
+	DPS310_FIFO_TEMP,
+	DPS310_FIFO_PRESSURE,
 };
 
 enum dps310_scan_index {
 	DPS310_SCAN_TEMP,
 	DPS310_SCAN_PRESSURE,
+	DPS310_SCAN_TIMESTAMP,
 };
 
 static const struct iio_chan_spec dps310_channels[] = {
@@ -140,7 +168,7 @@ static const struct iio_chan_spec dps310_channels[] = {
 			.endianness = IIO_CPU,
 		},
 	},
-	IIO_CHAN_SOFT_TIMESTAMP(2),
+	IIO_CHAN_SOFT_TIMESTAMP(DPS310_SCAN_TIMESTAMP),
 };
 
 /* To be called after checking the COEF_RDY bit in MEAS_CFG */
@@ -936,6 +964,306 @@ static int dps310_fill_channels(struct dps310_data *data,
 	return 0;
 }
 
+static int dps310_fifo_hw_flush(struct dps310_data *data)
+	__must_hold(&data->lock)
+{
+	return regmap_write(data->regmap, DPS310_RESET, DPS310_FIFO_FLUSH);
+}
+
+static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
+	__must_hold(&data->lock)
+{
+	return regmap_assign_bits(data->regmap, DPS310_CFG_REG, DPS310_FIFO_EN,
+				  enable);
+}
+
+/*
+ * No interrupt pin is wired in tree, so drain on a timer. Both measurements
+ * share the entries, so they fill it together.
+ */
+static unsigned int dps310_fifo_interval(int prs_rate, int tmp_rate)
+{
+	unsigned int fill_ms;
+
+	fill_ms = MSEC_PER_SEC * DPS310_FIFO_DEPTH / (prs_rate + tmp_rate);
+
+	return clamp(fill_ms / 2, DPS310_DRAIN_MIN_MS, DPS310_DRAIN_MAX_MS);
+}
+
+/* Returns which measurement the entry came from, or a negative error */
+static int dps310_fifo_read_entry(struct dps310_data *data, s32 *value)
+	__must_hold(&data->lock)
+{
+	u8 val[3];
+	s32 raw;
+	int rc;
+
+	/* Entries come out of the pressure registers whichever made them */
+	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
+	if (rc < 0)
+		return rc;
+
+	raw = get_unaligned_be24(val);
+	if (raw == DPS310_FIFO_EMPTY_VAL)
+		return DPS310_FIFO_EMPTY;
+
+	*value = sign_extend32(raw, 23);
+
+	return raw & DPS310_FIFO_TAG_PRS ? DPS310_FIFO_PRESSURE :
+					   DPS310_FIFO_TEMP;
+}
+
+static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
+				 s32 pressure_raw)
+	__must_hold(&data->lock)
+{
+	struct iio_dev *iio = data->iio;
+	s32 channels[2] = { };
+	unsigned int i;
+	int rc;
+
+	/* Direct-mode claim keeps sysfs reads off these */
+	data->temp_raw = temp_raw;
+	data->pressure_raw = pressure_raw;
+
+	i = 0;
+	if (test_bit(DPS310_SCAN_TEMP, iio->active_scan_mask)) {
+		rc = dps310_calculate_temp(data, &channels[i++]);
+		if (rc)
+			return rc;
+	}
+
+	if (test_bit(DPS310_SCAN_PRESSURE, iio->active_scan_mask)) {
+		rc = dps310_calculate_pressure(data, &channels[i++]);
+		if (rc)
+			return rc;
+	}
+
+	iio_push_to_buffers(iio, channels);
+
+	return 0;
+}
+
+/* Pressure seen before any temperature, kept until one turns up */
+static void dps310_fifo_hold(struct dps310_data *data, s32 pressure_raw)
+	__must_hold(&data->lock)
+{
+	if (data->fifo_held < data->fifo_hold_max)
+		data->fifo_hold[data->fifo_held++] = pressure_raw;
+}
+
+/* Returns scans pushed */
+static int dps310_fifo_push_held(struct dps310_data *data)
+	__must_hold(&data->lock)
+{
+	unsigned int i, held = data->fifo_held;
+	int rc = 0;
+
+	for (i = 0; i < held; i++) {
+		rc = dps310_fifo_push_scan(data, data->fifo_temp_raw,
+					   data->fifo_hold[i]);
+		if (rc)
+			break;
+	}
+
+	/* What did not go out stays for the next drain */
+	data->fifo_held = held - i;
+	memmove(data->fifo_hold, &data->fifo_hold[i],
+		data->fifo_held * sizeof(*data->fifo_hold));
+
+	return rc ? rc : i;
+}
+
+/*
+ * Read the batch out before compensating it, so a pressure entry pairs with
+ * the temperature preceding it rather than the last one in the batch.
+ *
+ * Returns scans pushed.
+ */
+static int dps310_fifo_drain(struct dps310_data *data)
+	__must_hold(&data->lock)
+{
+	bool pressure_enabled = test_bit(DPS310_SCAN_PRESSURE,
+					 data->iio->active_scan_mask);
+	u8 kind[DPS310_FIFO_DEPTH];
+	s32 raw[DPS310_FIFO_DEPTH];
+	unsigned int i, n = 0, pushed = 0;
+	int rc;
+
+	for (i = 0; i < DPS310_FIFO_DEPTH; i++) {
+		rc = dps310_fifo_read_entry(data, &raw[n]);
+		if (rc < 0)
+			return rc;
+
+		if (rc == DPS310_FIFO_EMPTY)
+			break;
+
+		kind[n++] = rc;
+	}
+
+	for (i = 0; i < n; i++) {
+		if (kind[i] == DPS310_FIFO_TEMP) {
+			data->fifo_temp_raw = raw[i];
+			data->fifo_temp_valid = true;
+
+			if (!pressure_enabled) {
+				rc = dps310_fifo_push_scan(data, raw[i], 0);
+				if (rc)
+					return rc;
+
+				pushed++;
+				continue;
+			}
+
+			rc = dps310_fifo_push_held(data);
+			if (rc < 0)
+				return rc;
+
+			pushed += rc;
+			continue;
+		}
+
+		if (!pressure_enabled)
+			continue;
+
+		if (!data->fifo_temp_valid) {
+			dps310_fifo_hold(data, raw[i]);
+			continue;
+		}
+
+		rc = dps310_fifo_push_scan(data, data->fifo_temp_raw, raw[i]);
+		if (rc)
+			return rc;
+
+		pushed++;
+	}
+
+	return pushed;
+}
+
+static void dps310_fifo_work(struct work_struct *work)
+{
+	struct dps310_data *data = container_of(to_delayed_work(work),
+						struct dps310_data, fifo_work);
+	int rc;
+
+	mutex_lock(&data->lock);
+	rc = dps310_fifo_drain(data);
+	mutex_unlock(&data->lock);
+
+	if (rc < 0)
+		dev_dbg(&data->client->dev, "FIFO drain failed: %d\n", rc);
+
+	schedule_delayed_work(&data->fifo_work,
+			      msecs_to_jiffies(data->drain_interval_ms));
+}
+
+/*
+ * First temperature is one temperature period away at most, which bounds the
+ * pressure before it. Rates cannot change while the buffer runs.
+ */
+static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
+				  int tmp_rate)
+	__must_hold(&data->lock)
+{
+	data->fifo_temp_valid = false;
+	data->fifo_held = 0;
+
+	if (!test_bit(DPS310_SCAN_PRESSURE, data->iio->active_scan_mask))
+		return 0;
+
+	data->fifo_hold_max = prs_rate / tmp_rate + 2;
+	data->fifo_hold = kcalloc(data->fifo_hold_max, sizeof(*data->fifo_hold),
+				  GFP_KERNEL);
+	if (!data->fifo_hold)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void dps310_fifo_hold_free(struct dps310_data *data)
+	__must_hold(&data->lock)
+{
+	kfree(data->fifo_hold);
+	data->fifo_hold = NULL;
+	data->fifo_hold_max = 0;
+}
+
+static int dps310_buffer_postenable(struct iio_dev *iio)
+{
+	struct dps310_data *data = iio_priv(iio);
+	int rc, prs_rate, tmp_rate;
+
+	/* An attached trigger drives the capture instead, FIFO stays off */
+	if (iio_device_get_current_mode(iio) == INDIO_BUFFER_TRIGGERED)
+		return 0;
+
+	/* Entries are not timestamped and the drain timer is no substitute */
+	if (iio_scan_timestamp_enabled(iio))
+		return -EINVAL;
+
+	guard(mutex)(&data->lock);
+
+	rc = dps310_get_pres_samp_freq(data, &prs_rate);
+	if (rc)
+		return rc;
+
+	rc = dps310_get_temp_samp_freq(data, &tmp_rate);
+	if (rc)
+		return rc;
+
+	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+
+	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
+	if (rc)
+		return rc;
+
+	/* Drop whatever accumulated before enable */
+	rc = dps310_fifo_hw_flush(data);
+	if (rc)
+		goto err_hold;
+
+	rc = dps310_fifo_set_enable(data, true);
+	if (rc)
+		goto err_hold;
+
+	schedule_delayed_work(&data->fifo_work,
+			      msecs_to_jiffies(data->drain_interval_ms));
+
+	return 0;
+
+err_hold:
+	dps310_fifo_hold_free(data);
+
+	return rc;
+}
+
+static int dps310_buffer_predisable(struct iio_dev *iio)
+{
+	struct dps310_data *data = iio_priv(iio);
+	int rc;
+
+	if (iio_device_get_current_mode(iio) == INDIO_BUFFER_TRIGGERED)
+		return 0;
+
+	cancel_delayed_work_sync(&data->fifo_work);
+
+	guard(mutex)(&data->lock);
+
+	dps310_fifo_hold_free(data);
+
+	rc = dps310_fifo_set_enable(data, false);
+	if (rc)
+		return rc;
+
+	return dps310_fifo_hw_flush(data);
+}
+
+static const struct iio_buffer_setup_ops dps310_buffer_setup_ops = {
+	.postenable = dps310_buffer_postenable,
+	.predisable = dps310_buffer_predisable,
+};
+
 static irqreturn_t dps310_trigger_handler(int irq, void *p)
 {
 	struct iio_poll_func *pf = p;
@@ -968,6 +1296,14 @@ static void dps310_reset(void *action_data)
 	dps310_reset_wait(data);
 }
 
+/* The drain rearms itself, so stop it even if the buffer never disabled */
+static void dps310_cancel_fifo_work(void *action_data)
+{
+	struct dps310_data *data = action_data;
+
+	cancel_delayed_work_sync(&data->fifo_work);
+}
+
 static const struct regmap_config dps310_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -995,13 +1331,20 @@ static int dps310_probe(struct i2c_client *client)
 
 	data = iio_priv(iio);
 	data->client = client;
+	data->iio = iio;
 	mutex_init(&data->lock);
+	INIT_DELAYED_WORK(&data->fifo_work, dps310_fifo_work);
 
 	iio->name = DPS310_DEV_NAME;
 	iio->channels = dps310_channels;
 	iio->num_channels = ARRAY_SIZE(dps310_channels);
 	iio->info = &dps310_info;
-	iio->modes = INDIO_DIRECT_MODE;
+	/*
+	 * Both modes advertised: the core picks TRIGGERED with a trigger
+	 * attached and falls back to SOFTWARE, which the FIFO path uses.
+	 */
+	iio->modes = INDIO_DIRECT_MODE | INDIO_BUFFER_TRIGGERED |
+		     INDIO_BUFFER_SOFTWARE;
 
 	data->regmap = devm_regmap_init_i2c(client, &dps310_regmap_config);
 	if (IS_ERR(data->regmap))
@@ -1017,12 +1360,18 @@ static int dps310_probe(struct i2c_client *client)
 		return rc;
 
 	/*
-	 * The device measures continuously in background mode, so a capture is
-	 * just a read of the latest results. The trigger is not aligned with
-	 * the measurements, so the timestamp is taken in the handler.
+	 * The device measures continuously in background mode, so a triggered
+	 * capture is just a read of the latest results. The setup ops run the
+	 * FIFO drain when no trigger is attached. The trigger is not aligned
+	 * with the measurements, so the timestamp is taken in the handler.
 	 */
 	rc = devm_iio_triggered_buffer_setup(dev, iio, NULL,
-					     dps310_trigger_handler, NULL);
+					     dps310_trigger_handler,
+					     &dps310_buffer_setup_ops);
+	if (rc)
+		return rc;
+
+	rc = devm_add_action_or_reset(dev, dps310_cancel_fifo_work, data);
 	if (rc)
 		return rc;
 
-- 
2.43.0

