Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D37497381
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 19:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057033; cv=none; b=OVWnPuV5QRMvsmxQlw1iYfGNXz3vBqQTRcwKWT5U+avTdmCPkqIqheNMPAxjw5CreEEHjdrhnsba+wOnaz6nkO9Ynhi9NZNDNRQ+m17EhtFneqhx95nnJ12ZRn19rpIQyC4Ya5I1oy1F8U/D5sI8Xsh5mjD9vywWjEjrd6jpQ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057033; c=relaxed/simple;
	bh=wzKMDeKGTtEp9oc6X/r1ye9YtAdC96LVQHmGGkSU3MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IWOGC+LS6iEnuFOMdFjRrHwcSbJOVquunhlOy0B9f9dOG/9gUSKVrVpTVd5zRegM+m+FA/ow0Chd7Vjzg85aYckxhiN+gGErnsiIJakMyXspkO32ZqmT8KhCCakUBs2IR+woRjjvUs6Z+55jAraGCirvTDTMrFzr+pTjItGIWRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dI3XcbRb; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dI3XcbRb"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a87e23860cso8128591fa.0
        for <llvm@lists.linux.dev>; Sat, 03 Oct 2026 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791057027; x=1791661827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXn6S94b33P25ufvgJkMunPhNjIZY13JTvQoBrLLnq0=;
        b=dI3XcbRbXiWnjvPnvDaXBqRcUzcqJ3KZcBw6nch/YOk+C/WF+uamK9XywExMhwWv5P
         asXv3MMNuJxBhjQRDGy/neX7/ZGeyMVoYivqDeBhI6k+6p8+08r9YsqVlRlXORTzK2v+
         5wniQZXr1Xm6pvvvf4dYjVYjHWL9g8Ws7MtSGvE9R3QW/KelU7WAOiGKOTC1CfaETq1H
         WuB037QJw7n9iB5Ubg2amqGiV6WuRLHD2teAtQt+siEpfVk7yF1+myJceTiF18lLS+0U
         5MDqJ1tK+O1rtPWqgbWoZrgT9jMBNfsetCRcxGej/gLozXkRuDiXY82A77aYksMRCeow
         22ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791057027; x=1791661827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IXn6S94b33P25ufvgJkMunPhNjIZY13JTvQoBrLLnq0=;
        b=Mo6sE3bDb/GyLVyew9pzezDUoMex+CnVbspsUZyE+jff92gqg+4trybbep54jjt1D4
         BiAd0Per8DF1kCD26b3qstxso1BRRkQq/sFodh0AuwqLrveKFMRderJX5IwXo6qwmKHt
         HGsOsDyeuMkMbd1WGxUW0Fb1NWxm19kzp+ffAZ4cvCwsf+SueMnV2yqqjZYmSdM4qiHw
         ThmBAdYVjC5nXCS84H1CCkb3/TWY3lL6jkNfRntD35JqIcwt06dwUtEEuw+tI4Cv/bYl
         poL40ldp23xACKExDz7Rp/mAhysbOADVwcUDIuD3xH5/4468pcm4ElxZH8E7XwduyqXC
         MX1g==
X-Forwarded-Encrypted: i=1; AKwUvBxLR28+pY9noLpfzH5BQ8opdrEkgY8Cst2p8EZKx/2xepDWoNi2Y4MbdIkxmG75xMBs1MUJ@lists.linux.dev
X-Gm-Message-State: AFq9FYKI/Mhp+PyY9F6JM+q81Mi0gzincANEjzwpON2lERqKjasSNFDm
	e0ZfsSgGxSvF70Y/osBKB/1lQ1aWYBacKWm+fexg+yNYWyudxcQLh4gs
X-Gm-Gg: AYBFou2+zi4ezBKFFHzTwijmjbaz9E+q7WdOG52pE4bds8GYdJj0Ryfo9R42HB0n0b2
	zRqQ1mnKxVI4/jCQ3UKZbHj8F9P+WzN5goYydE1KAeIaPOz5Ry0kUy1zX+fQmz3U1cBv5jBAetr
	/Ag/QShQkaZ7NohGierMkqu7GgHQI3WKRdd1bGHI741JjO62QoyO0PmYHFxr2isOsgUoq9Jua4r
	ukFew62e/RlcdTazmZ02qzURvVyT5V+GlyleX/Btak3FAAOvdU5bWOtJkX56Yq3EA/s0rq6KiGE
	nUnOPziWPHglUBcMoHLQo5ddLE2Ui8zaJF1c7iafTWcrLDHkWpltfVsnSK7KpvQA828f35UJSZm
	QuySVD04/iG0DYAqKW1F9ReEBwn3E567b9nmcUu3efYUThhLndEvMmkDfXClWVty3LPeAnh1/WZ
	a9jTHd0zLrEc21LOzkY1tcdcceoRZw5ATKqUhdaGmzpRqPPXb69ezhGk3lSWeDJmXgmbSaKJN9T
	XH59n8npZEqnTeHvdd0Cr08u/J1MoQkU8FfqrhltpsE7GSzCb5K5HqwIAE8rbNRAnQf1lo=
X-Received: by 2002:a05:651c:15cb:10b0:3a7:812b:ce2 with SMTP id 38308e7fff4ca-3a783457b10mr17076801fa.23.1791057026701;
        Sat, 03 Oct 2026 12:50:26 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7abdbfsm1762608e87.65.2026.10.03.12.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:50:26 -0700 (PDT)
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
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v12 5/5] iio: pressure: dps310: assert the lock at runtime too
Date: Sat,  3 Oct 2026 22:50:11 +0300
Message-ID: <20261003195012.92948-6-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003195012.92948-1-zoone.rupert@gmail.com>
References: <20261003195012.92948-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__must_hold() is clang only and does nothing in GCC builds. Add
lockdep_assert_held() next to each, so lockdep catches a missing lock
too.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 43 +++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index d70a0fa69c25..adfab5e3ac40 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -13,6 +13,7 @@
 #include <linux/devm-helpers.h>
 #include <linux/i2c.h>
 #include <linux/limits.h>
+#include <linux/lockdep.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -359,6 +360,8 @@ static int dps310_set_pres_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
+	lockdep_assert_held(&data->lock);
+
 	if (val < 0 || val > 128)
 		return -EINVAL;
 
@@ -378,6 +381,8 @@ static int dps310_set_temp_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
+	lockdep_assert_held(&data->lock);
+
 	if (val < 0 || val > 128)
 		return -EINVAL;
 
@@ -396,6 +401,8 @@ static int dps310_set_pres_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
+	lockdep_assert_held(&data->lock);
+
 	if (freq < 0 || freq > 128)
 		return -EINVAL;
 
@@ -410,6 +417,8 @@ static int dps310_set_temp_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
+	lockdep_assert_held(&data->lock);
+
 	if (freq < 0 || freq > 128)
 		return -EINVAL;
 
@@ -509,6 +518,8 @@ static int dps310_ready(struct dps310_data *data, int ready_bit, int timeout)
 {
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_ready_status(data, ready_bit, timeout);
 	if (rc) {
 		if (rc == -ETIMEDOUT && !data->timeout_recovery_failed) {
@@ -539,6 +550,8 @@ static int dps310_read_pres_raw_locked(struct dps310_data *data)
 	int timeout;
 	u8 val[3];
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_pres_samp_freq(data, &rate);
 	if (rc)
 		return rc;
@@ -565,6 +578,8 @@ static int dps310_read_temp_ready(struct dps310_data *data)
 	int rc;
 	u8 val[3];
 
+	lockdep_assert_held(&data->lock);
+
 	rc = regmap_bulk_read(data->regmap, DPS310_TMP_BASE, val, sizeof(val));
 	if (rc < 0)
 		return rc;
@@ -581,6 +596,8 @@ static int dps310_read_temp_raw_locked(struct dps310_data *data)
 	int rate;
 	int timeout;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_temp_samp_freq(data, &rate);
 	if (rc)
 		return rc;
@@ -602,6 +619,8 @@ static void dps310_refresh_temp_locked(struct dps310_data *data)
 	int rc;
 	int t_ready;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = regmap_read(data->regmap, DPS310_MEAS_CFG, &t_ready);
 	if (rc)
 		return;
@@ -707,6 +726,8 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	s64 kp;
 	s64 kt;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_pres_k(data, &kpi);
 	if (rc)
 		return rc;
@@ -832,6 +853,8 @@ static int dps310_calculate_temp(struct dps310_data *data, int *val)
 	s64 t;
 	int kt, rc;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_temp_k(data, &kt);
 	if (rc)
 		return rc;
@@ -940,6 +963,8 @@ static int dps310_fill_channels(struct dps310_data *data,
 	unsigned int i;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Compensation needs a temperature, so it is sampled either way */
 	rc = dps310_read_temp_raw_locked(data);
 	if (rc)
@@ -970,12 +995,16 @@ static int dps310_fill_channels(struct dps310_data *data,
 static int dps310_fifo_hw_flush(struct dps310_data *data)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	return regmap_write(data->regmap, DPS310_RESET, DPS310_FIFO_FLUSH);
 }
 
 static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	return regmap_assign_bits(data->regmap, DPS310_CFG_REG, DPS310_FIFO_EN,
 				  enable);
 }
@@ -1014,6 +1043,8 @@ static int dps310_fifo_read_entry(struct dps310_data *data, s32 *value)
 	s32 raw;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Entries come out of the pressure registers whichever made them */
 	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
 	if (rc < 0)
@@ -1037,6 +1068,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 	unsigned int i;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Direct-mode claim keeps sysfs reads off these */
 	data->temp_raw = temp_raw;
 	data->pressure_raw = pressure_raw;
@@ -1063,6 +1096,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 static void dps310_fifo_hold(struct dps310_data *data, s32 pressure_raw)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	if (data->fifo_held < data->fifo_hold_max)
 		data->fifo_hold[data->fifo_held++] = pressure_raw;
 }
@@ -1073,6 +1108,8 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 {
 	unsigned int pushed = 0;
 
+	lockdep_assert_held(&data->lock);
+
 	for (unsigned int i = 0; i < data->fifo_held; i++) {
 		if (!dps310_fifo_push_scan(data, data->fifo_temp_raw,
 					   data->fifo_hold[i]))
@@ -1105,6 +1142,8 @@ static int dps310_fifo_drain(struct dps310_data *data, unsigned int max_scans)
 	bool is_pressure;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
 		if (max_scans && scans >= max_scans)
 			break;
@@ -1175,6 +1214,8 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
 				  int tmp_rate)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	data->fifo_temp_valid = false;
 	data->fifo_held = 0;
 	data->fifo_hold = NULL;
@@ -1222,6 +1263,8 @@ static int dps310_fifo_start(struct dps310_data *data)
 {
 	int rc, prs_rate, tmp_rate;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_pres_samp_freq(data, &prs_rate);
 	if (rc)
 		return rc;
-- 
2.43.0

