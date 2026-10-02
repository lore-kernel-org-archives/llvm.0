Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF24334C4
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925942; cv=none; b=Cg5UaBz9LgE9snjji2A97fd9NcC96FrBgPmCeVA+kH5SWwo8NKLYDXML8gedTI1rdlgEFtHDV1J2kyazHzH+Prdv1bdqtuTuj5/rLzSGb/QFWRSCqO3Yt6jvV+SBJYy8ltkzIhr15wnvnFbZHJW0IdYt0x4glvF6sPzsZodoAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925942; c=relaxed/simple;
	bh=/dgj7zfR6CSQyTlPW7LygJx5YglEs89NmIli7YdYFl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLtX8UU+IiplVtHao76DSrRj9LuD7LbFsR4H2xuN4kdZtJ+SUI2UpUAEhVmH7Hf9oAHQL5n/5nwrpTTJ4/Tdc/kSRp7RoNzWOaWMhXmUYo5S8I3Mr3rO2+fuX1Y1AM9j4PreG24yjqKaWnRcRpLKwC8ep0jQgcz480lDq1wHhgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWYFrHFy; arc=none smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWYFrHFy"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a7be75eb9bso13208891fa.1
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 00:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925934; x=1791530734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+AWV0mPlOkcepX7XHWJC3YcNyaCDXOtc3fG330bCm0=;
        b=WWYFrHFyoawcuKhjNLXX1UUyXl9xdvrZ6foXC25xAkdZlzyyrqZEHEBnyAcPzq+ATQ
         V9Qiu4mZzqHSAxywaJnf+h2FaVgibcH9HnGMCcaTNBhoIkDfBY+7RCs2s99ovrT3Xaal
         +0TEbXB0Y5qXrvWj279diwKyIA3Dh/i7V6oJyTFGTtTFoQ9FNsVu3dAMM5hVgFp9Nu5F
         XqfR2PwWZLA1hzCRuKBniIq5DOcwOvNndmwjlKC3fSvx/RlloSfLUaNUTMgGZwyFvsna
         OdSFklaF7DP19pbGoIqpD+dlWWYBqjA/ay7hDasFtAgO9DmYm3FzSsvPrggtmpX6C0XN
         35Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925934; x=1791530734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+AWV0mPlOkcepX7XHWJC3YcNyaCDXOtc3fG330bCm0=;
        b=GNjkW+iwrJzP0OyLXusE0uijLvQnlcNVV8pMQDFe8laqyN6HzS7HEJn5wcr1FRxpyC
         MQn2ziA9NLXqAupAgjuTj/qbwMT0xVhlLgZuCveAQFSO4b7JapCilTax1RB7UsDb5vDf
         L5q8dwzi43na8vcsB9JrjqD/Goa8Kxkc7T9mfVs/jC0cO4ejfuBT+vMjfd+MFGKOmSyW
         x+LGRYApdVnS2gVR9OeJJraCzQfwWTXqyy7AueQWmBHeOZ/4SRszUv1PlHvEL7oHwSkc
         Z/AiMx8LWxTFBhzjLSnsbYcGaVimqfOuYICNRPgSbnEHuYuapOaKoh4Shg4HucrO5luX
         yl1w==
X-Forwarded-Encrypted: i=1; AKwUvBx9US/eXD12NOKckRKpW+XGlycCi4e+kzYcRnnDLGNPmTyHY0DMokKEsQvK2gflkmmzM4fc@lists.linux.dev
X-Gm-Message-State: AFq9FYJ/906TAgtZEnzGkId5Jtz8ZikN0ZpkPt8Y/aMaARZokOlbsXV2
	ph1StSPHxuU0owPmauos4EdFCQMoM7dUMKFJOz3jQy+p4ZP+HH/G27pQ
X-Gm-Gg: AYBFou0U6u5TDJE2+t+9UZzurnY6AzF+t21b4TUAoAwOQsUcoX6iaJFskyxFnxBcLjI
	1mSuqU0HUZ1R4B59GHFZb2A6kS3DMTv22dCHIeZLVuvSCWu79xzbqj9gCIH0UUWpovEERSVwOa3
	Pubv9SLsAds/kzvodiApbYJRnRnV7/rWANLl4849YFqsOGIQhR54E7ru/OCoS8uqa60AuPMHGZn
	7SjEzsrA1KEZdgJpUOxcSP+0ChzAgc/nPKQudTCpadg5X2RjZlepj788dP5VthcEd9B1hNAtLYk
	mK7kOMLuNoTOCDMJDGLda6xsI5T5byIos8tC4JJDFQsJtOhPK06qyGEjp1i35Br1yCuN5H23FY/
	BM5OM+x6/X7jXMud6pQYTYCDEFDV5vAa2xu2D97hQm2VVsNjkgG2XgkES1qh6BGHklG7GZe7lqj
	qVf6jIDt1u/uwr0U5qZhcktLxzfHu5dez1KN0P4lbiC3rF9YOaoE1SKp/ktEdJnpUXks+QvCv53
	2dcNIL4UzU2HdSzYHUzk9DGFjNAQW6Vt6BgR3W0XmTT5pNu/DQxRFY7samnafdU3Ri2YQ4VEEYQ
	gc8a
X-Received: by 2002:a05:651c:a383:20b0:3a6:5ec0:796c with SMTP id 38308e7fff4ca-3a8877b77b7mr2844991fa.19.1790925933739;
        Fri, 02 Oct 2026 00:25:33 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:33 -0700 (PDT)
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
Subject: [PATCH v11 5/5] iio: pressure: dps310: assert the lock at runtime too
Date: Fri,  2 Oct 2026 10:25:26 +0300
Message-ID: <20261002072526.250081-6-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072526.250081-1-zoone.rupert@gmail.com>
References: <20261002072526.250081-1-zoone.rupert@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 959f4bdd3995..1614255312ba 100644
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
@@ -1017,6 +1046,8 @@ static int dps310_fifo_read_entry(struct dps310_data *data, s32 *value)
 	s32 raw;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Entries come out of the pressure registers whichever made them */
 	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
 	if (rc < 0)
@@ -1041,6 +1072,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 	unsigned int i;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Direct-mode claim keeps sysfs reads off these */
 	data->temp_raw = temp_raw;
 	data->pressure_raw = pressure_raw;
@@ -1067,6 +1100,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 static void dps310_fifo_hold(struct dps310_data *data, s32 pressure_raw)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	if (data->fifo_held < data->fifo_hold_max)
 		data->fifo_hold[data->fifo_held++] = pressure_raw;
 }
@@ -1078,6 +1113,8 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 	unsigned int pushed = 0;
 	unsigned int i;
 
+	lockdep_assert_held(&data->lock);
+
 	for (i = 0; i < data->fifo_held; i++) {
 		if (!dps310_fifo_push_scan(data, data->fifo_temp_raw,
 					   data->fifo_hold[i]))
@@ -1111,6 +1148,8 @@ static int dps310_fifo_drain(struct dps310_data *data, unsigned int max_scans)
 	bool is_pressure;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
 		if (max_scans && scans >= max_scans)
 			break;
@@ -1182,6 +1221,8 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
 				  int tmp_rate)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	data->fifo_temp_valid = false;
 	data->fifo_held = 0;
 	data->fifo_hold = NULL;
-- 
2.43.0

