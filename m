Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5CC3C1985
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762534; cv=none; b=niIU4tbvqk2emXQb7yKU/ronLPkCmcWIhRW6ou00aGd+WGCXLKNxBtQtbFQKzX47bjo4M+9lm2ED81Q5gKPXPw9BX4lAw5f8tJoIWmPtSfaWGFs5uoDhmo2YCtx59t+tvd+dpaO3kRjW/wV++52ORcJdf4QPmie5oocM+ERIYg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762534; c=relaxed/simple;
	bh=1rFZsg+Z5sWsSqhdGi/mlZV+y/+IRKzY2Itze28hDCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IhKTDgAA63MJPhPoZ1IUKXpnk3JDWV0LaXoM8n1aZ9Q0DsjN0UuzUl1/wuy80J5S7JO6zv4aKCpbHc14DtQ+Zzra7mo9pKVpOl8AwW5UsUnkMaWbqkj0/45Ct2lhSvjlHEY4xQSktm05N516ZzGXAPB23eP9o7TD+I782lILAJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpmFczB+; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpmFczB+"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba34653aefso1334484e87.3
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 03:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762528; x=1791367328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQXVYE5SQMyZN1p+2/OR0/p0MeYTZXXNgWFF5Z/oQKc=;
        b=UpmFczB+rJrYPNNER6l2a7baTO8rPz3lAHV1eo8i3t2ih/BWzE93saa8KeswCKZJYr
         QsfBbdeZ03mT2cgZBGo2LYyHmp4u3p5BH4tbvAgAJcZRVhwg0JV/ni/KjDI1d++o6me9
         RY2nwgtDzuc6pwLLUXJ92S8CeS4GoFSfWoAkPlrLcD0PTmL7oWtj459lB7D2XlUsz87i
         BexZDEkCf3ECJQaAZr1SnnQpl6AwaB9q/zB+84Pi7WpH8iOu4Ug9c6DywhiQ4/FBPgUP
         01jrRmIvbHYMFMyE+cjrKY6Q8GRnr8zBCXFlAiCtYTQGk260FehUI6kAcdqr97rcnlH2
         olZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762528; x=1791367328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQXVYE5SQMyZN1p+2/OR0/p0MeYTZXXNgWFF5Z/oQKc=;
        b=t7UPPVQ/OPYLDI4ujpiM+DNWW8Laqzfk4D0+nHruLglECLmI6qnU9SCLY229eaxPPI
         PYjJBlz1T5flDrxwNZYsrvBtx1a5htpgD6dOX1+Cy+FpLN4gx/basd/DgUUarMeTzNmW
         VzIUjjZBS8vb8EXA+1MswXco8s+QP6BorS1vkEgrHOiGatVOGhDm8JUfKzJ+8r7419gD
         ex6sqxr40+cWa71TWUZMTYMIO19c8giqTMdnbxvM+8BbIh8ORIzzqaZRCxLzrtM1oMX/
         gm1y2y0pZJtjyhtck1J/g9ICbvU/1yZbsTByl7w7vIIQuQICO+JijfZfg9Nv+MZiqHku
         /3YA==
X-Forwarded-Encrypted: i=1; AKwUvBxMQm7DsBSPzM3d6MjVsANUYClY7vw6GWtfFIMI+FaL0qW4pVOmzcP4aVA1j0MG7cWXXcdQ@lists.linux.dev
X-Gm-Message-State: AFq9FYK8jFRaHDumJ/tfx/+PYn+pqplzH6LOF4aocbJ3/X10K9ukUdcj
	lwnYcB+c7fJNuFpy2euGBWuxogJ3v7EsBfMSSS/pfpPSV3hP4ZNovyX8
X-Gm-Gg: AYBFou3eHFrVAjDSfrefY0n3d5P+cqCQLG7o8zLcUbCRdtTWFkQnQEj7HB4dlgBwtb2
	1nBbvIkC7xQjQe9aC+oM9U8hC9sJkNrbFKUw9lyZmcueVKkDWJ7pHzHZoYUyyE97kpAfgv8Lf3j
	emLnpUl6cNW+8EpkfeqXnqMRumBSw74R/l9FeAz5lQdPhnjXBZUQLluECINL/HQ5JIOXBUSI8DK
	i10vRI4vQQDAgnWRd1unwjedzMexkMimDAaohuzXycqceK2VYUZk5x6f9zIDWtEsEpT8b83cnd8
	pYJevV3LC+XrWjQlbxbyxvrNqnf1ibcibBIO9gdTnQP8miJBj5cBgZDN0VTbrDMdUQUlPgUByGh
	s5d18xyz+2ePBXc4nj+OxlIlutpqtXeceEvCqf4iUCjGogUjVMwYtcwmO3WD9gznlYf+Ak8rd5O
	n5i6OwZt7Qsh6ax/YPplKFGKU6XdmClGspBVC/J8uFLdJKlHvj031Y1Y5R4TGqT4AzVhwPR60Eb
	AFwRsNMfGIZhvgCy/7k2oDUVGuo2L1RmZlvIJ1FPicqXm1CAMtL8hmecjwpjDOnEnvhjw==
X-Received: by 2002:a05:6512:292:b0:5b6:1a7c:fd83 with SMTP id 2adb3069b0e04-5ba40602483mr257747e87.41.1790762528177;
        Wed, 30 Sep 2026 03:02:08 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbe6c06sm240422e87.22.2026.09.30.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:02:07 -0700 (PDT)
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
Subject: [PATCH v10 4/4] iio: pressure: dps310: assert the lock at runtime too
Date: Wed, 30 Sep 2026 13:01:58 +0300
Message-ID: <20260930100158.957977-5-zoone.rupert@gmail.com>
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

__must_hold() is clang only and does nothing in GCC builds. Add
lockdep_assert_held() next to each, so lockdep catches a missing lock
too.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 01fca139433a..791ff22b0304 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -12,6 +12,7 @@
 #include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/limits.h>
+#include <linux/lockdep.h>
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -358,6 +359,8 @@ static int dps310_set_pres_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
+	lockdep_assert_held(&data->lock);
+
 	if (val < 0 || val > 128)
 		return -EINVAL;
 
@@ -377,6 +380,8 @@ static int dps310_set_temp_precision(struct dps310_data *data, int val)
 	int rc;
 	u8 shift_en;
 
+	lockdep_assert_held(&data->lock);
+
 	if (val < 0 || val > 128)
 		return -EINVAL;
 
@@ -395,6 +400,8 @@ static int dps310_set_pres_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
+	lockdep_assert_held(&data->lock);
+
 	if (freq < 0 || freq > 128)
 		return -EINVAL;
 
@@ -409,6 +416,8 @@ static int dps310_set_temp_samp_freq(struct dps310_data *data, int freq)
 {
 	u8 val;
 
+	lockdep_assert_held(&data->lock);
+
 	if (freq < 0 || freq > 128)
 		return -EINVAL;
 
@@ -508,6 +517,8 @@ static int dps310_ready(struct dps310_data *data, int ready_bit, int timeout)
 {
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_ready_status(data, ready_bit, timeout);
 	if (rc) {
 		if (rc == -ETIMEDOUT && !data->timeout_recovery_failed) {
@@ -538,6 +549,8 @@ static int dps310_read_pres_raw_locked(struct dps310_data *data)
 	int timeout;
 	u8 val[3];
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_pres_samp_freq(data, &rate);
 	if (rc)
 		return rc;
@@ -564,6 +577,8 @@ static int dps310_read_temp_ready(struct dps310_data *data)
 	int rc;
 	u8 val[3];
 
+	lockdep_assert_held(&data->lock);
+
 	rc = regmap_bulk_read(data->regmap, DPS310_TMP_BASE, val, sizeof(val));
 	if (rc < 0)
 		return rc;
@@ -580,6 +595,8 @@ static int dps310_read_temp_raw_locked(struct dps310_data *data)
 	int rate;
 	int timeout;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_temp_samp_freq(data, &rate);
 	if (rc)
 		return rc;
@@ -601,6 +618,8 @@ static void dps310_refresh_temp_locked(struct dps310_data *data)
 	int rc;
 	int t_ready;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = regmap_read(data->regmap, DPS310_MEAS_CFG, &t_ready);
 	if (rc)
 		return;
@@ -706,6 +725,8 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	s64 kp;
 	s64 kt;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_pres_k(data, &kpi);
 	if (rc)
 		return rc;
@@ -831,6 +852,8 @@ static int dps310_calculate_temp(struct dps310_data *data, int *val)
 	s64 t;
 	int kt, rc;
 
+	lockdep_assert_held(&data->lock);
+
 	rc = dps310_get_temp_k(data, &kt);
 	if (rc)
 		return rc;
@@ -939,6 +962,8 @@ static int dps310_fill_channels(struct dps310_data *data,
 	unsigned int i;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Compensation needs a temperature, so it is sampled either way */
 	rc = dps310_read_temp_raw_locked(data);
 	if (rc)
@@ -969,12 +994,16 @@ static int dps310_fill_channels(struct dps310_data *data,
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
@@ -1015,6 +1044,8 @@ static int dps310_fifo_read_entry(struct dps310_data *data, s32 *value)
 	s32 raw;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Entries come out of the pressure registers whichever made them */
 	rc = regmap_bulk_read(data->regmap, DPS310_PRS_BASE, val, sizeof(val));
 	if (rc < 0)
@@ -1039,6 +1070,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 	unsigned int i;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	/* Direct-mode claim keeps sysfs reads off these */
 	data->temp_raw = temp_raw;
 	data->pressure_raw = pressure_raw;
@@ -1065,6 +1098,8 @@ static int dps310_fifo_push_scan(struct dps310_data *data, s32 temp_raw,
 static void dps310_fifo_hold(struct dps310_data *data, s32 pressure_raw)
 	__must_hold(&data->lock)
 {
+	lockdep_assert_held(&data->lock);
+
 	if (data->fifo_held < data->fifo_hold_max)
 		data->fifo_hold[data->fifo_held++] = pressure_raw;
 }
@@ -1076,6 +1111,8 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 	unsigned int pushed = 0;
 	unsigned int i;
 
+	lockdep_assert_held(&data->lock);
+
 	for (i = 0; i < data->fifo_held; i++) {
 		if (!dps310_fifo_push_scan(data, data->fifo_temp_raw,
 					   data->fifo_hold[i]))
@@ -1109,6 +1146,8 @@ static int dps310_fifo_drain(struct dps310_data *data, unsigned int max_scans)
 	bool is_pressure;
 	int rc;
 
+	lockdep_assert_held(&data->lock);
+
 	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
 		if (max_scans && scans >= max_scans)
 			break;
@@ -1180,6 +1219,8 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
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

