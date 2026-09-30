Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4BC3CF69E
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762532; cv=none; b=eYmMBgSJGMjUo9yquK7e7kFNyM1CK52dvGmfSWdYOu1+pa7AmSJU5VxhUAFcbJIfka70fkTh17EzCaOF6BXpfTQVc/r5pvlkJi8EXb+YTH33WifXFxHMPbOKqZbfOMOM9GuTp7h62vIwRfZLHDZRZTHx34CjFvVZ//5LVtN+DcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762532; c=relaxed/simple;
	bh=9x+FivYcLGmLo+ZWydMgvTcO78QEH7sZ0yGAy6aGr7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luntZu54yvEG5Pyj/6Z+SMNHXUFZ3yvXhlB2/ddGGAN7t5TufMRQFlI2AmIGZNSYSDbCdhlsLachWVaVuMmiCl7NYijJzZLyzxa+stZZSrhkOHN4Y5MRbNKbcwhb4G7Eus3IbV6lnXf6xX3/WJcIfeZXgG9WnsdItzkHFIIluVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8Ekxl4z; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8Ekxl4z"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so5031017e87.3
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762526; x=1791367326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV7UM26wyB0gj8Non61RvcObU+tOeH8Jk6oVOtfwM7s=;
        b=p8Ekxl4zT90l2M1G3QGgRIFSO5OXfGxD2TvF7iOYPuRgeK0h8E+dCD3pKBXWXp4wpe
         p6aF+sU3JRrDseTBTZr/bxgWoV4ShFcnO4swBVbgh+l919a0M59S2ItjhY0NpvUMY5uT
         0pUzvjGDs9qX5VqtLTZLR/nbu/BPJPzeRAJ/qYUWuKS55kczUjxYb+PRzHOn9ibPfzRW
         7CBowRYzhTinA985+hsTa3a9b5qGttkkPcH6satvp+0KqmfppSWPb6BRhtEtYYuAHPbC
         9oFCW+msZHzrmoqlS5ll8bbeYCCO4TiPKzahJlE1FL8BuLqI+wg1Td6xgZD4bygk6tNn
         dIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762526; x=1791367326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CV7UM26wyB0gj8Non61RvcObU+tOeH8Jk6oVOtfwM7s=;
        b=T2S0JaiTJHM7JBqyE9fQlBfCydsnI/FrDBurxx35UoVTO6YPnEdvjI2b52dzILiSJy
         V9XQiUHBMYqZamfWHTgB023TbnN6d23gyaDcOZD/0Rp45Ro1c+6A0gfXxgIXgCr10cre
         zTDzjg1patMiRHjIW92EsentQBOtkhD/E/RsTD7rvjJz9FBo5dqFPW4w5NnGlKWQfaGA
         4OHAOJ43fxaebz+G6iyzOIjCRKmh3XQ0YVKYm2cjpIPRoxZ3GPjdMU+uzKZi5jasJYN5
         +P9bk89cf8eeBRXNpWNHeIqXtVSFfJiqJycXDBdkXIU9WS8UVjpwTWKK3RXazt+mw+Yc
         zimw==
X-Forwarded-Encrypted: i=1; AKwUvBxZtMf/I8hXex0raMgJaFXzICOykVBgyBfgGTsdnpmlTlp7vd5kPbgo27+gBJtEN3JiWjje@lists.linux.dev
X-Gm-Message-State: AFq9FYIzCOrgkUMw6WlIRmh0tFmvFKEUypect89usTrodZprPxjJiPR8
	BimW0fBf7Ks86MCogRaXdWabgMi0NV93h/xt4SoU5i/+nd7GTKYiw/ty
X-Gm-Gg: AYBFou3QW9osFd/yKek0R6yP62lRhvQsF2V4MJQwu14As/RmYeAynmie9uZPPE8Uw9s
	ouABN8Oj6Vb2JD8nhyuybqoVmMh1pd92vvP4UID3YKh0vfCYLRa54PyWXxr0vXQ//MScJqoQQuF
	RsFLGmS/EWuoOQ7dtQsUvkQs53ULiT/5T7mieAHHDFTRWsMWMgjWapOykUD+QEtkEQuQUwkXMj5
	YJ/nCMs6XerOivz5+4weGC8UL8zMiJQZJFKl8TRbU8kQqQH6T1Cc0m3WVg6Ey3o/yUQN4fbCISA
	15Y1SVmaG2oJZGmTfBgHkA+dujyjrDzIDR3wuBW0ofPmvVDSGscerIf1rf3q5h4j/wOnqK5Dvpr
	CqY092izj2Mha0ugyqnGHm1wVPuKb3yHDzjh1Jxmq17iI8UIp+nMDjqEQpdBAXa9/2WzHhxF12e
	dci9XMet8FznVo/UPoVe7mV9qrG5PHOUyXQt1JLjPW62S0ZS/xsUDeHDMsqjxvWxzHZiptCeTJu
	oCdUsqaAYsfakPPEoVncEUsM0fGTbxVbGXil5ZwC122iG40eBU0vniSQYcL4arhAaPI+A==
X-Received: by 2002:a05:6512:15a7:b0:5ba:36c5:4c14 with SMTP id 2adb3069b0e04-5ba403e5ab7mr333662e87.12.1790762526244;
        Wed, 30 Sep 2026 03:02:06 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbe6c06sm240422e87.22.2026.09.30.03.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:02:05 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v10 2/4] iio: pressure: dps310: derive the drain interval from the watermark
Date: Wed, 30 Sep 2026 13:01:56 +0300
Message-ID: <20260930100158.957977-3-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930100158.957977-1-zoone.rupert@gmail.com>
References: <20260930100158.957977-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drain interval only tracked how fast the FIFO fills, so a small
watermark still waited half a FIFO for its samples. Take the watermark
as the number of scans to wait for, but never drain slower than half a
fill.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 53ebf6962eba..82bbfd097cd7 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -115,6 +115,7 @@ struct dps310_data {
 	s32 *fifo_hold;
 	unsigned int fifo_hold_max;
 	unsigned int fifo_held;
+	unsigned int watermark;
 	unsigned int drain_interval_ms;
 	s32 fifo_temp_raw;
 };
@@ -982,13 +983,28 @@ static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
  * No interrupt pin is wired in tree, so drain on a timer. Both measurements
  * share the entries, so they fill it together.
  */
-static unsigned int dps310_fifo_interval(int prs_rate, int tmp_rate)
+static unsigned int dps310_fifo_interval(struct dps310_data *data, int prs_rate,
+					 int tmp_rate)
 {
-	unsigned int fill_ms;
+	unsigned int fill_ms, want_ms;
+	int scan_rate;
 
 	fill_ms = MSEC_PER_SEC * DPS310_FIFO_DEPTH / (prs_rate + tmp_rate);
 
-	return clamp(fill_ms / 2, DPS310_DRAIN_MIN_MS, DPS310_DRAIN_MAX_MS);
+	/*
+	 * There is no hardware watermark, so take it as the number of scans
+	 * the user will wait for and drain at that rate. Scans come from
+	 * whichever measurement drives them.
+	 */
+	if (test_bit(DPS310_SCAN_PRESSURE, data->iio->active_scan_mask))
+		scan_rate = prs_rate;
+	else
+		scan_rate = tmp_rate;
+
+	want_ms = data->watermark * MSEC_PER_SEC / scan_rate;
+
+	return clamp(min(want_ms, fill_ms / 2), DPS310_DRAIN_MIN_MS,
+		     DPS310_DRAIN_MAX_MS);
 }
 
 /* Returns which measurement the entry came from, or a negative error */
@@ -1168,6 +1184,15 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
 	return 0;
 }
 
+static int dps310_hwfifo_set_watermark(struct iio_dev *iio, unsigned int val)
+{
+	struct dps310_data *data = iio_priv(iio);
+
+	data->watermark = clamp(val, 1, DPS310_FIFO_DEPTH);
+
+	return 0;
+}
+
 static int dps310_buffer_postenable(struct iio_dev *iio)
 {
 	struct dps310_data *data = iio_priv(iio);
@@ -1191,7 +1216,7 @@ static int dps310_buffer_postenable(struct iio_dev *iio)
 	if (rc)
 		goto err_unlock;
 
-	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+	data->drain_interval_ms = dps310_fifo_interval(data, prs_rate, tmp_rate);
 
 	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
 	if (rc)
@@ -1299,6 +1324,7 @@ static const struct regmap_config dps310_regmap_config = {
 static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
+	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
 };
 
 static int dps310_probe(struct i2c_client *client)
@@ -1315,6 +1341,7 @@ static int dps310_probe(struct i2c_client *client)
 	data = iio_priv(iio);
 	data->client = client;
 	data->iio = iio;
+	data->watermark = 1;
 	mutex_init(&data->lock);
 	INIT_DELAYED_WORK(&data->fifo_work, dps310_fifo_work);
 
-- 
2.43.0

