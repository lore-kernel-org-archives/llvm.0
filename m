Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6F038B7D8
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602459; cv=none; b=UIWzjqdZLtSYbDiuifavU8eQf740ch+vAES0bj/Js+4/6GsXuaeN74Q5JNj9DM5vqh5KgnZWwWUgPu8rZdSxUGu87bc5FHYNKqpCh3t7r3mwdMLwad0B/reBYc9F7+whOH52gGXopmnjeyq9yAs9+17C1ggQXvfU1JdlQd/6WCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602459; c=relaxed/simple;
	bh=Z8Q6Cje1VKDpJnaujnQksPmxZ0zKmJ2ZAE7GDaSwEZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiuuXyNh9MzmhAEbghMvPDxqnALkyrKu6SuLDtI+0pf1RuuwSwLGVmjnoAU5tptbDmIHazXQYuRebi+N7EEYoSdfBItWMMj1wTsGvR2Kf3Zo0ZhA+WxlrcS41dGraTh8z075Y4J8DHq9RjM3WPPsfNIfH3ym9GmB9hfuoD5nF9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAvkfn7o; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAvkfn7o"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b013084dc2so3108976e87.0
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602455; x=1788207255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQXWTdBiGOmg9WRHvHkejupB58j8w1lmLGZTr2gy6Vs=;
        b=PAvkfn7oEEtCBfzaaEbrjlGTUGMwVYc5XQy/uswTftmMTAybdSsPofswPhLLaIsysy
         tmASsB25IPUgf8G1uKJ40vo1kJBUi9rOQ+3yJFjeiTGCIzAj4PLCquLKs8vw8fQaNe9I
         zfMG5bHWBwEoYzhSdteS4xDW02Lfbnzja+OfpkVMbCdURDMdQjbeyH86Gk2r1lVBI/j4
         OVT/erqz2qV/v8ybITpcAcQ2G+L+sAP0pmsClo7Dcq5hSa3FHptNKuGcVthqUT4PEDap
         YMIZCj5POU10TqP1zxr4wmyFU4lZ1UIdlwCiYGH8ey5Tv7Q7nMrJNwzGO3Cb8FJ5HooN
         hdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602455; x=1788207255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQXWTdBiGOmg9WRHvHkejupB58j8w1lmLGZTr2gy6Vs=;
        b=VdXexr/PHcF23wR3BUubfftdn6yxLXS0U6LptivgFh+5PpJcffkX32qj6KLRU15aSc
         PTMWWljgYUPBvlqSh7EBGyPcsCaCeL8AfbvJcJn3GL5bwoRTHLPpg8AVdHq4Ripp/jGN
         JNkHflanAQCVzVB8WoMJc2nh3aea+dfc0acUqcMDguajxP0uHyAvfbVUphcMrdIe3yjG
         A6XDl53SOmE9SIg0FKnxgHblcv8rFr2VxrJfpjiNARC8DmSlEl8Uz7vJAkU70q1+jCEH
         xc2pDby7hLsTwuuCE1BsLNxcWcREMKT3pMZNGA8pRtMk3Lyct21/1wGNoq9xIaGteRMF
         j/Cw==
X-Forwarded-Encrypted: i=1; AHgh+RrqIpSSSdr2uOnhiGJqhBXWha0GaDau8qrYwKZcqaUYTVHoqkeV8+cUx4Z4Feq/jpO5zT1S@lists.linux.dev
X-Gm-Message-State: AFuF++kl66l5fgaVJQoS8D5DcJGVpaMZNgvPWTCaTUzBQiSfWZx2byZo
	HMSM++DxBswpJVpTs1QiO1YJu4XgAwV23bpWS5asWkO4ygJQ/EeIc8az
X-Gm-Gg: AR+sD12GSwg5jwhGUI/sIoLEdx7ES7gSZF/VyLYBvbq+ZFO5jn9FcyHrX/aUgaFhW58
	V7x+gVekl+4yVuV2RJ19YmzoObRKQH7tZNCh4jmhMmxllMO3aNadS3cjQciLQHJT3kQDLn5z3Ph
	+k3Es0QKEegGUc/BT8sX6DrKgNRRqly17W/kQH4QA07eN5xNg7R6nTvjPfCNTSGLLx6xeqWdNRy
	godsH5VuHSYiCQGrAA/kNbsDxppSo9iykvCO9dA9oFKMKdfxniEbbBBHANyH5XVBSQYLWlvDl13
	N8+i3Kf9X3edtFks6SEKUIF5oX2jQQjucI4EmKQlExnwdNAOCyZkxv34a52DjtPninW5D1xS8s/
	/gi0STZb2dfglH2wqfmPYh+2v76e4CVs4m2A2Hh5o0u1kDZmfBkI9xDk0g9SixuihoY81aLCHz8
	w2YPci1G2ibBGHQ1Htf9fggkzIqgTnM/7b81tkKqX6Mf3Z5Gpi7ot+PcXI9T1nTxpHRG6bdvnrm
	p7qSbhQPoWbMPc2NSqM9UmcvV/qi62yUZ3SIbIpMuC/3NyHVWuiBJLy/MvWxICYR18eQ9gp060=
X-Received: by 2002:a05:6512:3f25:b0:5ae:b969:417d with SMTP id 2adb3069b0e04-5b49cc05204mr327990e87.0.1787602454609;
        Mon, 24 Aug 2026 13:14:14 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce0cd9csm1923620e87.71.2026.08.24.13.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:14:14 -0700 (PDT)
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
Subject: [PATCH v6 3/6] iio: pressure: dps310: rework the raw read paths
Date: Mon, 24 Aug 2026 23:12:00 +0300
Message-ID: <20260824201203.396651-4-zoone.rupert@gmail.com>
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

Raw reads take the lock themselves, so a processed pressure read takes it
twice: once for the raw read, then again when
dps310_calculate_pressure() trylocks to refresh temperature. Refresh is
skipped whenever lock is busy.

Split raw reads into variants that expect lock held, one helper per
channel taking it once for the whole sequence. Temperature refresh is
unconditional now. Buffered capture later in this series needs the same
shape.

Also use get_unaligned_be24() for 24-bit results, and mark functions that
need the lock with __must_hold() rather than a comment.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 159 +++++++++++++++++++---------------
 1 file changed, 87 insertions(+), 72 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 25d1c79876e6..269a71ea3e7a 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -19,6 +19,7 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/unaligned.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -286,8 +287,8 @@ static int dps310_get_temp_precision(struct dps310_data *data, int *val)
 	return 0;
 }
 
-/* Called with lock held */
 static int dps310_set_pres_precision(struct dps310_data *data, int val)
+	__must_hold(&data->lock)
 {
 	int rc;
 	u8 shift_en;
@@ -305,8 +306,8 @@ static int dps310_set_pres_precision(struct dps310_data *data, int val)
 				  DPS310_PRS_PRC_BITS, ilog2(val));
 }
 
-/* Called with lock held */
 static int dps310_set_temp_precision(struct dps310_data *data, int val)
+	__must_hold(&data->lock)
 {
 	int rc;
 	u8 shift_en;
@@ -324,8 +325,8 @@ static int dps310_set_temp_precision(struct dps310_data *data, int val)
 				  DPS310_TMP_PRC_BITS, ilog2(val));
 }
 
-/* Called with lock held */
 static int dps310_set_pres_samp_freq(struct dps310_data *data, int freq)
+	__must_hold(&data->lock)
 {
 	u8 val;
 
@@ -338,8 +339,8 @@ static int dps310_set_pres_samp_freq(struct dps310_data *data, int freq)
 				  DPS310_PRS_RATE_BITS, val);
 }
 
-/* Called with lock held */
 static int dps310_set_temp_samp_freq(struct dps310_data *data, int freq)
+	__must_hold(&data->lock)
 {
 	u8 val;
 
@@ -438,6 +439,7 @@ static int dps310_ready_status(struct dps310_data *data, int ready_bit, int time
 }
 
 static int dps310_ready(struct dps310_data *data, int ready_bit, int timeout)
+	__must_hold(&data->lock)
 {
 	int rc;
 
@@ -463,82 +465,87 @@ static int dps310_ready(struct dps310_data *data, int ready_bit, int timeout)
 	return 0;
 }
 
-static int dps310_read_pres_raw(struct dps310_data *data)
+static int dps310_read_pres_raw_locked(struct dps310_data *data)
+	__must_hold(&data->lock)
 {
 	int rc;
 	int rate;
 	int timeout;
-	s32 raw;
 	u8 val[3];
 
-	if (mutex_lock_interruptible(&data->lock))
-		return -EINTR;
-
 	rc = dps310_get_pres_samp_freq(data, &rate);
 	if (rc)
-		goto done;
+		return rc;
 
 	timeout = DPS310_POLL_TIMEOUT_US(rate);
 
 	/* Poll for sensor readiness; base the timeout upon the sample rate. */
 	rc = dps310_ready(data, DPS310_PRS_RDY, timeout);
 	if (rc)
-		goto done;
+		return rc;
 
 	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
 	if (rc < 0)
-		goto done;
+		return rc;
 
-	raw = (val[0] << 16) | (val[1] << 8) | val[2];
-	data->pressure_raw = sign_extend32(raw, 23);
+	data->pressure_raw = sign_extend32(get_unaligned_be24(val), 23);
 
-done:
-	mutex_unlock(&data->lock);
-	return rc;
+	return 0;
 }
 
-/* Called with lock held */
 static int dps310_read_temp_ready(struct dps310_data *data)
+	__must_hold(&data->lock)
 {
 	int rc;
 	u8 val[3];
-	s32 raw;
 
 	rc = regmap_bulk_read(data->regmap, DPS310_TMP_BASE, val, sizeof(val));
 	if (rc < 0)
 		return rc;
 
-	raw = (val[0] << 16) | (val[1] << 8) | val[2];
-	data->temp_raw = sign_extend32(raw, 23);
+	data->temp_raw = sign_extend32(get_unaligned_be24(val), 23);
 
 	return 0;
 }
 
-static int dps310_read_temp_raw(struct dps310_data *data)
+static int dps310_read_temp_raw_locked(struct dps310_data *data)
+	__must_hold(&data->lock)
 {
 	int rc;
 	int rate;
 	int timeout;
 
-	if (mutex_lock_interruptible(&data->lock))
-		return -EINTR;
-
 	rc = dps310_get_temp_samp_freq(data, &rate);
 	if (rc)
-		goto done;
+		return rc;
 
 	timeout = DPS310_POLL_TIMEOUT_US(rate);
 
 	/* Poll for sensor readiness; base the timeout upon the sample rate. */
 	rc = dps310_ready(data, DPS310_TMP_RDY, timeout);
 	if (rc)
-		goto done;
+		return rc;
+
+	return dps310_read_temp_ready(data);
+}
+
+/*
+ * Refresh the cached temperature if a new measurement is ready, so that the
+ * pressure compensation uses a recent value. An error is not fatal here, the
+ * previous temperature is used instead.
+ */
+static void dps310_refresh_temp_locked(struct dps310_data *data)
+	__must_hold(&data->lock)
+{
+	int rc;
+	int t_ready;
 
-	rc = dps310_read_temp_ready(data);
+	rc = regmap_read(data->regmap, DPS310_MEAS_CFG, &t_ready);
+	if (rc)
+		return;
 
-done:
-	mutex_unlock(&data->lock);
-	return rc;
+	if (t_ready & DPS310_TMP_RDY)
+		dps310_read_temp_ready(data);
 }
 
 static bool dps310_is_writeable_reg(struct device *dev, unsigned int reg)
@@ -580,59 +587,47 @@ static int dps310_write_raw(struct iio_dev *iio,
 			    struct iio_chan_spec const *chan, int val,
 			    int val2, long mask)
 {
-	int rc;
 	struct dps310_data *data = iio_priv(iio);
 
-	if (mutex_lock_interruptible(&data->lock))
+	ACQUIRE(mutex_intr, lock)(&data->lock);
+	if (ACQUIRE_ERR(mutex_intr, &lock))
 		return -EINTR;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_SAMP_FREQ:
 		switch (chan->type) {
 		case IIO_PRESSURE:
-			rc = dps310_set_pres_samp_freq(data, val);
-			break;
+			return dps310_set_pres_samp_freq(data, val);
 
 		case IIO_TEMP:
-			rc = dps310_set_temp_samp_freq(data, val);
-			break;
+			return dps310_set_temp_samp_freq(data, val);
 
 		default:
-			rc = -EINVAL;
-			break;
+			return -EINVAL;
 		}
-		break;
 
 	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
 		switch (chan->type) {
 		case IIO_PRESSURE:
-			rc = dps310_set_pres_precision(data, val);
-			break;
+			return dps310_set_pres_precision(data, val);
 
 		case IIO_TEMP:
-			rc = dps310_set_temp_precision(data, val);
-			break;
+			return dps310_set_temp_precision(data, val);
 
 		default:
-			rc = -EINVAL;
-			break;
+			return -EINVAL;
 		}
-		break;
 
 	default:
-		rc = -EINVAL;
-		break;
+		return -EINVAL;
 	}
-
-	mutex_unlock(&data->lock);
-	return rc;
 }
 
 static int dps310_calculate_pressure(struct dps310_data *data, int *val)
+	__must_hold(&data->lock)
 {
 	int i;
 	int rc;
-	int t_ready;
 	int kpi;
 	int kti;
 	s64 rem = 0ULL;
@@ -656,15 +651,6 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	kp = (s64)kpi;
 	kt = (s64)kti;
 
-	/* Refresh temp if it's ready, otherwise just use the latest value */
-	if (mutex_trylock(&data->lock)) {
-		rc = regmap_read(data->regmap, DPS310_MEAS_CFG, &t_ready);
-		if (rc >= 0 && t_ready & DPS310_TMP_RDY)
-			dps310_read_temp_ready(data);
-
-		mutex_unlock(&data->lock);
-	}
-
 	p = (s64)data->pressure_raw;
 	t = (s64)data->temp_raw;
 
@@ -710,6 +696,27 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	return 0;
 }
 
+/*
+ * Sample the pressure and compensate it, taking the lock once for the whole
+ * sequence rather than once per register read.
+ */
+static int dps310_read_pressure_value(struct dps310_data *data, int *val)
+{
+	int rc;
+
+	ACQUIRE(mutex_intr, lock)(&data->lock);
+	if (ACQUIRE_ERR(mutex_intr, &lock))
+		return -EINTR;
+
+	rc = dps310_read_pres_raw_locked(data);
+	if (rc)
+		return rc;
+
+	dps310_refresh_temp_locked(data);
+
+	return dps310_calculate_pressure(data, val);
+}
+
 static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 				long mask)
 {
@@ -724,11 +731,7 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_PROCESSED:
-		rc = dps310_read_pres_raw(data);
-		if (rc)
-			return rc;
-
-		rc = dps310_calculate_pressure(data, val);
+		rc = dps310_read_pressure_value(data, val);
 		if (rc)
 			return rc;
 
@@ -747,6 +750,7 @@ static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,
 }
 
 static int dps310_calculate_temp(struct dps310_data *data, int *val)
+	__must_hold(&data->lock)
 {
 	s64 c0;
 	s64 t;
@@ -768,6 +772,21 @@ static int dps310_calculate_temp(struct dps310_data *data, int *val)
 	return 0;
 }
 
+static int dps310_read_temp_value(struct dps310_data *data, int *val)
+{
+	int rc;
+
+	ACQUIRE(mutex_intr, lock)(&data->lock);
+	if (ACQUIRE_ERR(mutex_intr, &lock))
+		return -EINTR;
+
+	rc = dps310_read_temp_raw_locked(data);
+	if (rc)
+		return rc;
+
+	return dps310_calculate_temp(data, val);
+}
+
 static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
 			    long mask)
 {
@@ -782,11 +801,7 @@ static int dps310_read_temp(struct dps310_data *data, int *val, int *val2,
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_PROCESSED:
-		rc = dps310_read_temp_raw(data);
-		if (rc)
-			return rc;
-
-		rc = dps310_calculate_temp(data, val);
+		rc = dps310_read_temp_value(data, val);
 		if (rc)
 			return rc;
 
-- 
2.43.0

