Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B196F4FE2C9
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015512; cv=none; b=ln4CfCkeKGbXJlZQ7lwdufPMBwMJMpPqlTeR38YgHCLC+4CkDNWhmL2v9rmHCa84DjPkwi6JTZ+2/G3diWB5vHJOsWXE5jvrEyXkht02RYm8bq+EoTAG5f6w+9W2UNlzvIImOUZUf5+0xlSSwz8LkhmwZMstMtP6c9PcPMsVluU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015512; c=relaxed/simple;
	bh=mlga+Y2sGZZR969ol+3F9TXnb/HLrJGtK6VJmOJhAzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KB+JUf1sgUDjlsKXmgr5S33Xz/y/Bnnd4AquE2nY7ufkc/kDoldgp4CmjSZquFwoI5iA9CJlgIL9aXsAymL/gjQY9JPJXkldlD+2OTHgYe4W/cVyCXJXQNkdLQ2LTsgIsRhohC4v/ezW3LfFOE0qgvcQt8gnYJ8+qNZsJR4Ej4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVZ1dDUD; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVZ1dDUD"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff15fadfso13025291fa.0
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015508; x=1790620308; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ORlsrphR8NlECXr1/rFGDxw1vn1qQVizI/XCEVsy7O4=;
        b=nVZ1dDUDTlULckWC9UEFBBfgQ0qjr0NBSsAKGWKyZFsHtwJg95b1NRHJPYgYZFgoqj
         JDqFPYpW2v28fh+Q1FzNT0sXCQoslnjTAnPFb2ba5TnBuskORvzCZuAC63JMsgmI3I1/
         hTlc6oNa3Di9dJtFr0ITpWfKxwkhAWwuyrPoS81bt2Fp90gqRdu8rcmj757AHjuwoosJ
         Lkh/FDAsSIFec4lDvJaGDx8r6t6pUsCQqG/MzxlKrANGUur9WXtpuiqGM4sCcBSeVDGD
         iyVEVq7gRM/CQKoa1IJDU2aW+LCypWmj1yw6qTM6eVaK/YByHLW50tB+U6kXDrM6+gAK
         1ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015508; x=1790620308;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORlsrphR8NlECXr1/rFGDxw1vn1qQVizI/XCEVsy7O4=;
        b=SD8wqQs73cItwKiYmUWn56zlrdCUp16vIxWiu8MVhXOhOBDKTfFzgkkTA9kSaskhle
         d73arB0IVbQz9IaH7PFwMiY9xLd8DBfS8OQfStvsioXAIYyeQO4cBRmW3e77iujJo0me
         WRlTrrEwRDPpxfuCIdt8+JQhcSOIFutAnHI53HQH1FDxV+JgJ2S0rV55zKqXOORygpEr
         WQXNcXyUG5WNDky61uJ/p3Oj6Nzr3Kj+9AH9QOxZ040xUE/NKyXIt6tsc17U1i/AefhK
         W3hYKxFx2lzg8jRh0I8NFh8WYrIzSK+cH4edQPApXxL5QVyx1Kb9ao9bU+RGorxKXMWv
         u5ug==
X-Forwarded-Encrypted: i=1; AKwUvBy8kh47cWA4bWpE0jphwXKlWTozOaGRQyfWNhMIgz05nSkFrr6GF4Qk/YCwSsDjF57uPVLB@lists.linux.dev
X-Gm-Message-State: AFuF++mGbSWVX+zp9krWWayjG99pwHTXn9zH2nsN9sZVThhqtcfmcOao
	iB0D7HrYoH4MRjHBb8loDJG15Lor8ws2R2wH+EYnwPEra2cjY6BRQzht
X-Gm-Gg: AYBFou2jR4xz0nKvkoH9Q4PMMD7sJ6ofAVLnq+nXQA4ZhigFu3f+scNud6YaaYSRiuz
	eWP4+a6X7q1xt5OZBnc9TEtTNdq3NO+PfSoke9JbBw+jgJeV/ntA8z50wI/zr+FOSXf10WZvbh6
	T3Xl7bCmF8v+lXWg15xbLQrYaTkjWVL7WgVcRMDnvkEtz4LSXmrNMaTnnc6SJ3OdJ10+GeDKGjW
	NfYuY8XRd9HjlFss9TozmbVtu/cS9c67wY1LjU46JESU7OsMfMg2grT2W0Towt5R3fyY6qeKGX4
	oTtWDfLcLco+PPDZmlMEr28xibFaumYi2oRnevRhp34ltMTCgV2pxPUbARth3Cf/iaGbfrBQkB3
	fOTyBGYk/26pzOnGIyktGEoUWcM/ZaOIbE81tXpkGzlEBwfPmo4p0I7mEgNZQdpY7t36/0A9don
	kUcglAimbLNW7WGxcZJhhHveq8Ni1IPiEFdnZCRm4Wi0X0RFJ7FOvk8GqAgmFG4jTB5MI5uR4M/
	jM6JFBbbuhTl9qLY9oV2HXxFg7tJQ091PY5Yisu56f/bdg8WHjLsLlDflbf5FYaf8xt6g==
X-Received: by 2002:a2e:a593:0:b0:3a4:88c9:c51c with SMTP id 38308e7fff4ca-3a624c861b2mr1270471fa.1.1790015507535;
        Mon, 21 Sep 2026 11:31:47 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:47 -0700 (PDT)
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
Subject: [PATCH v8 07/10] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Mon, 21 Sep 2026 21:31:29 +0300
Message-ID: <20260921183132.233136-8-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921183132.233136-1-zoone.rupert@gmail.com>
References: <20260921183132.233136-1-zoone.rupert@gmail.com>
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
 drivers/iio/pressure/dps310.c | 364 +++++++++++++++++++++++++++++++++-
 1 file changed, 354 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..ba59413d8e11 100644
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
@@ -95,6 +106,22 @@ struct dps310_data {
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
@@ -937,6 +964,302 @@ static int dps310_fill_channels(struct dps310_data *data,
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
+	unsigned int held = data->fifo_held;
+	unsigned int i;
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
+	unsigned int pushed = 0;
+	unsigned int cnt, i;
+	int rc;
+
+	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
+		rc = dps310_fifo_read_entry(data, &raw[cnt]);
+		if (rc < 0)
+			return rc;
+
+		if (rc == DPS310_FIFO_EMPTY)
+			break;
+
+		kind[cnt] = rc;
+	}
+
+	for (i = 0; i < cnt; i++) {
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
+	data->fifo_hold = NULL;
+	data->fifo_hold_max = 0;
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
+	kfree(data->fifo_hold);
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
+	kfree(data->fifo_hold);
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
@@ -969,6 +1292,14 @@ static void dps310_reset(void *action_data)
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
@@ -996,13 +1327,20 @@ static int dps310_probe(struct i2c_client *client)
 
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
@@ -1018,12 +1356,18 @@ static int dps310_probe(struct i2c_client *client)
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

