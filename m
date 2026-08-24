Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A512838DC61
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602464; cv=none; b=TSrwOJtzQEjtX4TVgAUmarHAM8XLw9S2r9nFUAVwKm/gD1ybMbf5alflX26JGj+8KEYpytKLS0mHqo1sIeSWVewvh2kr/42PPzpTlZIdl/lJZ5M9O7F20vYyM1T56cZxkfijakvB897JiXeva2nfebR5CsXv6TSDl78EyG5WvS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602464; c=relaxed/simple;
	bh=5Y4Ui7ASXnX2/fxd3WaMxXXqW1055XMY7zXqCakiBzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hKXGNpA75zZ3Hmvhag6577cM/SECcRU2LFeAxHX/pgP2ieBMZMIZJsIjQhaKGLQ3JOrGvc4cD2lHjMkAqDGwSHTfWR8nIuikzsr+WcHXp7AXSzWnW1aRkI/rjbXzgX+D+EfQUFe25XUL2GTqWJKt39aSiDSNDLXAZnKOb3+fAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qw0u6/eM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qw0u6/eM"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so5647176e87.0
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602458; x=1788207258; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+1teNulq1mG2liXyLQtq+EAs4stE38hsRBs7UIDWNmo=;
        b=qw0u6/eMQN2Gk7o9sumvxrqwYJfK6EKHyCFX7aBbGbnPZVbBWEGihxjCfRX2IcLL0O
         pbTeSTG6kf61e9gLJKQoBa64+LaLjVteE9Gow151tx6rW0jbfbFV2GkwLgVt0TXo4ZXM
         gGcLfbo3+E3flSwcHpLRQF9QJ4ftL4PDYDqb/14b1KWStjvB8FPLBUJF0a6BnpRD8kHO
         0hecCHuSRQBOEzS3K5c6bmQyIlSyg8Iozmnt5xh/xgYYZdf6cFiUdz3bY5GJHBAmLjRN
         zIsZnbfZJmZB/y4KqmB2TfrmtY9cmO6idE69p1O4Ei0mxe8shbrUHzCuOkHFSbD7/Lqf
         gpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602458; x=1788207258;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1teNulq1mG2liXyLQtq+EAs4stE38hsRBs7UIDWNmo=;
        b=hGTVDGpdRpabhGAKFu/G4P9qx2x6Pons5GmjMTqxVpaucsJCRmC/k16cRE5NzU25G6
         6rUu8zo5AopMcR2n9aMmuIBIlL+GV66WG2XbnQd0faY4iuBaIb73jOFNraznyO4EEPxT
         rPuWv+DHvcIX8B+bP+rUjXOLISkvXxtLt3P7hCkrDn7A/hAM7LmnL/heM2Gvm9oIZXOK
         m5MG9eN/7mTbuFpXMVLX5An4iQQEf2hGLEKzyJmRxYhtIDL+V+mimTtnRe/0YiWmvgw0
         y0EEa/NtHwxlvxNv5bksNCJdwwgPXxdC6txMfNsjZt5vLKZPyn1sPz1pOj7G8iGv3qey
         Hd+A==
X-Forwarded-Encrypted: i=1; AHgh+RpMH+SixslvfruYsuCgc9Lqad5/spNW+FRixk4OIloVawj6kf7KFSSMCKW98e/CLszx1smX@lists.linux.dev
X-Gm-Message-State: AFuF++nqR49ok8UVurcipj7IebV9uvJIISqIGU9XT/0oDSI1HPCWKRmF
	N6PsLWpCPmz+B34TY4CeMmckrD77ZeEwFoYgDtOzHRc9m/gagicFoMXL
X-Gm-Gg: AR+sD13xHjjYAvesYo/Y4WM+1wfFjmfVXobz2EGv15hpaWr577kVcH/kiEJ0uGGXJ1b
	CFzFXokCERl8rSWWfxl+ZRC3PXFkukn7Fzr0ak2qda+RTYziYmLPS/4OE4ZRmzLSVU3l+LxZv3w
	xeN3RGbHkfu4UnqnsCKY+MHn0xvgWGDvSk6jC0H4dyhKiyNwOcFo0U3h8DDdG1DQ+e84XozL6s9
	tpaYhjDmS7mIvHZDW6jWzFKERXPwnHY9pmqSWXvnoHjORp01gkt32/tDxYwK0K0P2rhfb5plqsb
	E2JzqQm0KMkamzThGC2Utd0Nz3YWMeRZ1nNZ5aw8+iGYjfD4plwiCTirOFXozz74167okEfwf9C
	JEQggm4Bp7DiEn3aEB62bLtelLYgapm8uznSh+npOBmQ1j5WXe5qqAYXxvSTaehHAw2V8GDKrFU
	EhRwv7+2sNpe8i3DmytRdjuNIZgsB9t+2jUumQaR7lk7PTyKvi2HRLgywl73WuVpzwuq8kakgJf
	Jvjk+1//gabwIaIplLxcMV3Ku15O7yWGPK4VbGXQMzSd5qsuCpJ4iBE1Cw=
X-Received: by 2002:a05:6512:3da0:b0:5ae:bcc4:c071 with SMTP id 2adb3069b0e04-5b484090f50mr10147641e87.0.1787602457292;
        Mon, 24 Aug 2026 13:14:17 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce0cd9csm1923620e87.71.2026.08.24.13.14.16
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
Subject: [PATCH v6 5/6] iio: pressure: dps310: add hardware FIFO support
Date: Mon, 24 Aug 2026 23:12:02 +0300
Message-ID: <20260824201203.396651-6-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824201203.396651-1-zoone.rupert@gmail.com>
References: <20260824201203.396651-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the 32 entry FIFO for buffered capture, so a reader wakes once per
batch of samples instead of once per sample.

FIFO runs when no trigger is attached and stays off when one is.
iio_verify_update() already picks the mode, so buffer setup ops just
branch on iio_device_get_current_mode(), as rohm-bm1390.c does.

Drain is on a timer because there is no interrupt to use and nothing in
tree wires the INT pin. hwfifo_flush_to_buffer is not enough on its own:
iio_buffer_read() sleeps until something is pushed, so a blocking reader
would hang with samples still sitting in the FIFO. Hook is kept for
poll() and non-blocking reads.

Pressure entries drive the scans and reuse last temperature, so the two
configured rates stay independent. FIFO does not timestamp entries, they
are estimated from the sample rate.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 411 +++++++++++++++++++++++++++++++++-
 1 file changed, 400 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index f122acd72b0c..d05aa05d6222 100644
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
 
 #include <linux/i2c.h>
@@ -20,6 +15,8 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
+#include <linux/workqueue.h>
 
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
@@ -58,9 +55,31 @@
 #define  DPS310_FIFO_EN		BIT(1)
 #define  DPS310_SPI_EN		BIT(0)
 #define DPS310_RESET		0x0c
+#define  DPS310_FIFO_FLUSH	BIT(7)
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
 
+/*
+ * Section 4.8: the FIFO holds 32 entries shared between the pressure and
+ * temperature streams, and stops recording once full rather than overwriting.
+ * A late drain therefore loses the newest samples, not the oldest.
+ */
+#define DPS310_FIFO_DEPTH	32
+
+/* Read back in place of a sample once the FIFO has been drained */
+#define DPS310_FIFO_EMPTY_VAL	0x800000
+
+/* The LSB of a FIFO entry tags which measurement produced it */
+#define DPS310_FIFO_TAG_PRS	BIT(0)
+
+/*
+ * Bounds on the drain interval. The lower bound keeps a fast rate from
+ * flooding the workqueue; the upper bound keeps the FIFO from filling while
+ * nothing is looking at it.
+ */
+#define DPS310_DRAIN_MIN_MS	20
+#define DPS310_DRAIN_MAX_MS	2000
+
 /* Make sure sleep time is <= 30ms for usleep_range */
 #define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
 /* Silently handle error in rate value here */
@@ -94,6 +113,15 @@ struct dps310_data {
 	s32 pressure_raw;
 	s32 temp_raw;
 	bool timeout_recovery_failed;
+
+	/* FIFO capture state, used only while the hardware FIFO is enabled */
+	struct iio_dev *iio;
+	struct delayed_work fifo_work;
+	unsigned int watermark;
+	unsigned int drain_interval_ms;
+	s64 fifo_timestamp;
+	s32 fifo_temp_raw;
+	bool fifo_temp_valid;
 };
 
 enum dps310_scan_index {
@@ -960,6 +988,339 @@ static int dps310_fill_scan(struct dps310_data *data,
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
+	return regmap_write_bits(data->regmap, DPS310_CFG_REG, DPS310_FIFO_EN,
+				 enable ? DPS310_FIFO_EN : 0);
+}
+
+/*
+ * There is no interrupt wired on any in-tree platform and the binding has no
+ * interrupts property, so the FIFO is drained on a timer, at an interval below
+ * the time it takes to fill. See DPS310_FIFO_DEPTH for why late is bad.
+ */
+static int dps310_fifo_interval(struct dps310_data *data, unsigned int *ms)
+	__must_hold(&data->lock)
+{
+	bool pressure_enabled = test_bit(DPS310_SCAN_PRESSURE,
+					 data->iio->active_scan_mask);
+	unsigned int fill_ms, want_ms;
+	int rc, prs_rate, tmp_rate;
+
+	rc = dps310_get_pres_samp_freq(data, &prs_rate);
+	if (rc)
+		return rc;
+
+	rc = dps310_get_temp_samp_freq(data, &tmp_rate);
+	if (rc)
+		return rc;
+
+	/* Both streams share the same entries, so they fill it together. */
+	fill_ms = MSEC_PER_SEC * DPS310_FIFO_DEPTH / (prs_rate + tmp_rate);
+
+	/*
+	 * The DPS310 has no configurable hardware watermark, only a FIFO-full
+	 * condition, so the watermark is taken as the number of scans the user
+	 * is prepared to wait for and drives the drain interval instead. Scans
+	 * come at the rate of whichever measurement drives them, which is not
+	 * the pressure rate when only the temperature channel is enabled.
+	 */
+	want_ms = data->watermark * MSEC_PER_SEC /
+		  (pressure_enabled ? prs_rate : tmp_rate);
+
+	*ms = clamp(min(want_ms, fill_ms / 2), DPS310_DRAIN_MIN_MS,
+		    DPS310_DRAIN_MAX_MS);
+
+	return 0;
+}
+
+/*
+ * Read a single FIFO entry. Returns 1 if a sample was read, 0 once the FIFO is
+ * empty, or a negative error.
+ */
+static int dps310_fifo_read_entry(struct dps310_data *data, s32 *value,
+				  bool *is_pressure)
+	__must_hold(&data->lock)
+{
+	u8 val[3];
+	s32 raw;
+	int rc;
+
+	/*
+	 * Every entry is read through the pressure registers regardless of
+	 * which measurement produced it, with the type tagged in the LSB.
+	 */
+	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
+	if (rc < 0)
+		return rc;
+
+	raw = get_unaligned_be24(val);
+	if (raw == DPS310_FIFO_EMPTY_VAL)
+		return 0;
+
+	*is_pressure = raw & DPS310_FIFO_TAG_PRS;
+	*value = sign_extend32(raw, 23);
+
+	return 1;
+}
+
+static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
+				 s32 pressure_raw, s64 timestamp)
+	__must_hold(&data->lock)
+{
+	struct iio_dev *iio = data->iio;
+	struct dps310_scan scan = { };
+	int i = 0;
+	int rc;
+
+	/*
+	 * The compensation helpers read the cached raw values. Sysfs reads take
+	 * the direct-mode claim, so they cannot be looking at these while a
+	 * buffered capture is running.
+	 */
+	data->temp_raw = temp_raw;
+	data->pressure_raw = pressure_raw;
+
+	if (test_bit(DPS310_SCAN_TEMP, iio->active_scan_mask)) {
+		rc = dps310_calculate_temp(data, &scan.channels[i]);
+		if (rc)
+			return rc;
+
+		i++;
+	}
+
+	if (test_bit(DPS310_SCAN_PRESSURE, iio->active_scan_mask)) {
+		rc = dps310_calculate_pressure(data, &scan.channels[i]);
+		if (rc)
+			return rc;
+	}
+
+	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan), timestamp);
+
+	return 0;
+}
+
+/*
+ * Drain the FIFO and push the samples it held, stopping once max_scans scans
+ * are in hand or draining everything when max_scans is zero. Stopping at the
+ * read rather than after it matters: entries leave the hardware as they are
+ * read, so any collected beyond the caller's limit would have to be discarded.
+ *
+ * Returns the number of scans pushed.
+ */
+static int dps310_fifo_drain(struct dps310_data *data, s64 now,
+			     unsigned int max_scans)
+	__must_hold(&data->lock)
+{
+	bool pressure_enabled = test_bit(DPS310_SCAN_PRESSURE,
+					 data->iio->active_scan_mask);
+	bool temp_valid = data->fifo_temp_valid;
+	bool is_pressure[DPS310_FIFO_DEPTH];
+	s32 raw[DPS310_FIFO_DEPTH];
+	unsigned int i, n = 0, scans = 0, pushed = 0;
+	s64 interval, first;
+	int rc, rate;
+
+	/*
+	 * Empty the hardware first and compensate afterwards, so the time spent
+	 * in the polynomial is not time the FIFO spends filling.
+	 *
+	 * Pressure entries drive the scans and reuse the most recent
+	 * temperature, so the two rates stay independent; entries arriving
+	 * before any temperature cannot be compensated and are dropped. With
+	 * only the temperature channel enabled there is nothing to pair with
+	 * and temperature drives the scans itself.
+	 */
+	for (i = 0; i < DPS310_FIFO_DEPTH; i++) {
+		rc = dps310_fifo_read_entry(data, &raw[n], &is_pressure[n]);
+		if (rc < 0)
+			return rc;
+		if (!rc)
+			break;
+
+		if (!is_pressure[n]) {
+			temp_valid = true;
+			if (!pressure_enabled)
+				scans++;
+		} else if (pressure_enabled && temp_valid) {
+			scans++;
+		}
+		n++;
+
+		if (max_scans && scans >= max_scans)
+			break;
+	}
+
+	if (!scans)
+		return 0;
+
+	/*
+	 * FIFO entries carry no timestamps. They are synthesised by working
+	 * back from the drain with the configured period of whichever
+	 * measurement drives the scans, so the spacing matches the sampling
+	 * frequency the user asked for instead of varying with how much each
+	 * drain happened to collect. These are estimates, not hardware
+	 * timestamps.
+	 */
+	rc = pressure_enabled ? dps310_get_pres_samp_freq(data, &rate) :
+				dps310_get_temp_samp_freq(data, &rate);
+	if (rc)
+		return rc;
+
+	interval = div_s64(NSEC_PER_SEC, rate);
+	first = now - (s64)(scans - 1) * interval;
+
+	/*
+	 * A batch must not start before the previous one ended, or the buffer
+	 * would carry timestamps that go backwards. If this drain collected
+	 * more than the configured rate accounts for, spread it across the
+	 * window since the last sample instead.
+	 */
+	if (data->fifo_timestamp && first <= data->fifo_timestamp) {
+		interval = max_t(s64, div_s64(now - data->fifo_timestamp, scans), 1);
+		first = data->fifo_timestamp + interval;
+	}
+
+	for (i = 0; i < n; i++) {
+		s64 timestamp;
+
+		if (!is_pressure[i]) {
+			data->fifo_temp_raw = raw[i];
+			data->fifo_temp_valid = true;
+
+			if (pressure_enabled)
+				continue;
+		} else if (!pressure_enabled || !data->fifo_temp_valid) {
+			continue;
+		}
+
+		timestamp = first + (s64)pushed * interval;
+
+		rc = dps310_fifo_push_scan(data,
+					   is_pressure[i] ? data->fifo_temp_raw
+							  : raw[i],
+					   is_pressure[i] ? raw[i] : 0,
+					   timestamp);
+		if (rc)
+			return rc;
+
+		data->fifo_timestamp = timestamp;
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
+	rc = dps310_fifo_drain(data, iio_get_time_ns(data->iio), 0);
+	mutex_unlock(&data->lock);
+
+	if (rc < 0)
+		dev_dbg(&data->client->dev, "FIFO drain failed: %d\n", rc);
+
+	schedule_delayed_work(&data->fifo_work,
+			      msecs_to_jiffies(data->drain_interval_ms));
+}
+
+static int dps310_hwfifo_set_watermark(struct iio_dev *iio, unsigned int val)
+{
+	struct dps310_data *data = iio_priv(iio);
+
+	data->watermark = clamp(val, 1, DPS310_FIFO_DEPTH);
+
+	return 0;
+}
+
+static int dps310_hwfifo_flush(struct iio_dev *iio, unsigned int count)
+{
+	struct dps310_data *data = iio_priv(iio);
+
+	/*
+	 * With a trigger attached the FIFO is left disabled, and the pressure
+	 * registers then hold the latest measurement rather than queued entries
+	 * with an empty marker to stop on. There is nothing to drain.
+	 */
+	if (iio_device_get_current_mode(iio) != INDIO_BUFFER_SOFTWARE)
+		return 0;
+
+	guard(mutex)(&data->lock);
+
+	return dps310_fifo_drain(data, iio_get_time_ns(iio), count);
+}
+
+static int dps310_buffer_postenable(struct iio_dev *iio)
+{
+	struct dps310_data *data = iio_priv(iio);
+	int rc;
+
+	/*
+	 * An attached trigger drives the capture instead, so the FIFO stays
+	 * disabled and the two never both feed the buffer.
+	 */
+	if (iio_device_get_current_mode(iio) == INDIO_BUFFER_TRIGGERED)
+		return 0;
+
+	guard(mutex)(&data->lock);
+
+	data->fifo_temp_valid = false;
+	data->fifo_timestamp = 0;
+
+	rc = dps310_fifo_interval(data, &data->drain_interval_ms);
+	if (rc)
+		return rc;
+
+	/* Drop whatever accumulated before the buffer was enabled */
+	rc = dps310_fifo_hw_flush(data);
+	if (rc)
+		return rc;
+
+	rc = dps310_fifo_set_enable(data, true);
+	if (rc)
+		return rc;
+
+	schedule_delayed_work(&data->fifo_work,
+			      msecs_to_jiffies(data->drain_interval_ms));
+
+	return 0;
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
@@ -990,6 +1351,17 @@ static void dps310_reset(void *action_data)
 	dps310_reset_wait(data);
 }
 
+/*
+ * The drain reschedules itself, so make sure it is stopped before the device
+ * goes away even if the buffer was never disabled cleanly.
+ */
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
@@ -1002,6 +1374,8 @@ static const struct regmap_config dps310_regmap_config = {
 static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
+	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
+	.hwfifo_flush_to_buffer = dps310_hwfifo_flush,
 };
 
 static int dps310_probe(struct i2c_client *client)
@@ -1018,13 +1392,22 @@ static int dps310_probe(struct i2c_client *client)
 
 	data = iio_priv(iio);
 	data->client = client;
+	data->iio = iio;
+	data->watermark = 1;
 	mutex_init(&data->lock);
+	INIT_DELAYED_WORK(&data->fifo_work, dps310_fifo_work);
 
 	iio->name = id->name;
 	iio->channels = dps310_channels;
 	iio->num_channels = ARRAY_SIZE(dps310_channels);
 	iio->info = &dps310_info;
-	iio->modes = INDIO_DIRECT_MODE;
+	/*
+	 * Both buffer modes are advertised so that iio_verify_update() picks
+	 * INDIO_BUFFER_TRIGGERED when a trigger is attached and falls back to
+	 * INDIO_BUFFER_SOFTWARE, which the FIFO path uses, when one is not.
+	 */
+	iio->modes = INDIO_DIRECT_MODE | INDIO_BUFFER_TRIGGERED |
+		     INDIO_BUFFER_SOFTWARE;
 
 	data->regmap = devm_regmap_init_i2c(client, &dps310_regmap_config);
 	if (IS_ERR(data->regmap))
@@ -1040,13 +1423,19 @@ static int dps310_probe(struct i2c_client *client)
 		return rc;
 
 	/*
-	 * The device measures continuously in background mode, so a capture is
-	 * just a read of the latest results and no buffer setup ops are needed.
-	 * The trigger is not aligned with the measurements either way, so the
-	 * timestamp is taken in the handler rather than by a top half.
+	 * The device measures continuously in background mode, so a triggered
+	 * capture is just a read of the latest results. The setup ops start and
+	 * stop the FIFO drain when no trigger is attached. The trigger is not
+	 * aligned with the measurements either way, so the timestamp is taken
+	 * in the handler rather than by a top half.
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

