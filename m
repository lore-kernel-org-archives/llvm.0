Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D0C4334AD
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 07:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925939; cv=none; b=ZhgYeVyzPf0dpW8Jr4gX0D3pHiTpAU5VWssGaSSd9oyLiL488INUHm5Rv3UkTlZLzYB0kzQjn360O6ipbgwKELD55oucqfb2HnnuYXlTDLeAfDGZDvplPfSasbthx1YATm1RhF/x1prm+j0p3p89ajMpV/9YAqscK60ztyHbMAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925939; c=relaxed/simple;
	bh=YmhABwc6STe6QPPow3vkOTA+h+0bIAD6lAbDoHLSJQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLpoOYkBx7Py+3umKGaOIn1mIEnzvTZXUj6Gfc/GkAFncDaIU4SR8PxWmdnQ238S1iiZ4DY6Dag2DfQvXoX9OGPylN5E73zgbTsEofwi5vLhKtp386judgG30I7Y25JFESEWZttoeuTM4S+cOnEJ2qXmIdaqAVVpVfRUBwYr1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPc8HxKy; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPc8HxKy"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a7823deaddso6312321fa.0
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925932; x=1791530732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4Jy4jiSSwxzFuCoHTUqY2xeCWLbq9aU+0aTOn2pXpM=;
        b=BPc8HxKyHwPiPA5L5ZQ6xKId7N2SiGvRTWDd80MBhDgYg84qiaxLkoO3TgKEe6oskR
         nn86/zfeVAXSeboS1qpDEgnwhjv6assEvdoUoNFwEKQ80CQT8dxXdJCnWMFJJRZ5M/Vj
         dld2xUssL2b467qyBp4LAGzhy99KbHUgwQFMChTYUIFaL1nOcfetuM+Y3F353fmEzVO1
         42IWA4inTZIqaI7GHZl0MKhVHUJIMFVKzZ6OipTHB9TQn65Sdn4in37kTLpchymCZTj0
         r61HO47OOzOztntAN8ZBVBY/iBZW/gPeuEpREar0WdaxZ5FH9Vm0A4OFr6kwxwXVmP2g
         Svfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925932; x=1791530732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4Jy4jiSSwxzFuCoHTUqY2xeCWLbq9aU+0aTOn2pXpM=;
        b=RZDvromp21psbDKUndSbXCvBUznwdH/3PDu7IwXZoKIeV649T22jBUJGGFeH2Sa6CX
         uvYNLQ0GIZnzv8aQmp7Ss3H1+Hm+leIEhBbfxqepoEx83SjOR15g/r9Ggpxk3PGNS0Y1
         Q1IE7JNhqGkbEQFf/k/cZOWV7f11G7S7Ad+Q9kBHF6YZYPYHHOh5K3fdNE83QQWdi/Sd
         cCVUBY0t3flQrQBrORS3TwHPBBVzjvTukI4Wf2Tj143wGtlw8wBEOOPPW/zoYgp2XjUE
         dCII+gaUg4W8q9up7MnGhQa2t3xrm/OOayXxhoyTgqwO9oC8m2nFw/apAm1Tvd6Hy5Uc
         kzFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN9Y8FIZTpDIjG5sWPeVteVAwoGv+7y/7tF9VXfdp2TegCdI7f5vkQTGhyFbft1nuZvAu4@lists.linux.dev
X-Gm-Message-State: AFq9FYLMdy7T+4q+3iWxpl2K+wti5hqSd0Fd72HeArmIQzavhofJ7DYz
	azV+L9Bv42Q0imTiLhRylsqxDHUq9DzgiO2kMwzKsqHE3mh6Y44vQVQu
X-Gm-Gg: AYBFou1/CQlaCMb/L9kogq6PoahEVEIt8ZPI38gDGj6lbgP2sw1Dg/lRbpVVW06nk4W
	oDtYZbrR2Isrsw/289+HI0W5u3rx4tekOgfb8bz/nqeN5bngLdmRXx8yme48xZLIwaa8+vyJPpu
	NEOp+7XtFtQXOv/yxR3+y7MygOUPjdPQFvDhnnNUE7wgwcw0FAU7MctXp6zdnmGXqFrCjIebYhJ
	TG4NS9gbAJ8bQ8ULFt7TNZZqqDV4mA5zkQ4Br0C5Md/tcCDGQ6H5inRruwzOgLUMggjA76ylZlU
	mt+J8LvSF8735ZgpE+1ISGKMw5hoxrvhi67MXLmZ6e04uSk+t0uV70SWcXc0hwMG9YcanECmSwn
	p1U7m9T0VKlk8LIdNMre2fNvrwmyS0WgiayGwicRfFXjopWUZqpQCoW9hSAOv9i/Z+yLqdqx5Au
	DbquZ7LeVOW6CK4Ahg6i0MHuBNeFPgiCvXEppW8SPQS7t7aV6grvdHG3BBDQI1t9f33iof2HL/i
	Afv8R1GuYP3fbb/jY1Dule/Dc+AwxXYNNRvncXVTs244i4XO6YvAmMhj0pkNsPxUMRCjA==
X-Received: by 2002:a2e:be9c:0:b0:3a7:64cc:1a25 with SMTP id 38308e7fff4ca-3a87ed1639amr3679651fa.2.1790925931570;
        Fri, 02 Oct 2026 00:25:31 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:30 -0700 (PDT)
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
Subject: [PATCH v11 3/5] iio: pressure: dps310: derive the drain interval from the watermark
Date: Fri,  2 Oct 2026 10:25:24 +0300
Message-ID: <20261002072526.250081-4-zoone.rupert@gmail.com>
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

The drain interval only tracked how fast the FIFO fills, so a small
watermark still waited half a FIFO for its samples. Take the watermark
as the number of scans to wait for, but never drain slower than half a
fill.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 36 +++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index e093cf7034e8..294ddccd264b 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -116,6 +116,7 @@ struct dps310_data {
 	s32 *fifo_hold;
 	unsigned int fifo_hold_max;
 	unsigned int fifo_held;
+	unsigned int watermark;
 	unsigned int drain_interval_ms;
 	s32 fifo_temp_raw;
 };
@@ -983,13 +984,29 @@ static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
  * No interrupt pin is wired in tree, so drain on a timer. Both measurements
  * share the entries, so they fill it together.
  */
-static unsigned int dps310_fifo_interval(int prs_rate, int tmp_rate)
+static unsigned int dps310_fifo_interval(struct dps310_data *data, int prs_rate,
+					 int tmp_rate)
 {
-	unsigned int fill_ms;
+	unsigned int drain_interval_ms, fill_ms, want_ms;
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
+	drain_interval_ms = min(want_ms, fill_ms / 2);
+
+	return clamp(drain_interval_ms, DPS310_DRAIN_MIN_MS, DPS310_DRAIN_MAX_MS);
 }
 
 /* Returns which measurement the entry came from, or a negative error */
@@ -1169,6 +1186,15 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
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
@@ -1192,7 +1218,7 @@ static int dps310_buffer_postenable(struct iio_dev *iio)
 	if (rc)
 		goto err_unlock;
 
-	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+	data->drain_interval_ms = dps310_fifo_interval(data, prs_rate, tmp_rate);
 
 	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
 	if (rc)
@@ -1292,6 +1318,7 @@ static const struct regmap_config dps310_regmap_config = {
 static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
+	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
 };
 
 static int dps310_probe(struct i2c_client *client)
@@ -1308,6 +1335,7 @@ static int dps310_probe(struct i2c_client *client)
 	data = iio_priv(iio);
 	data->client = client;
 	data->iio = iio;
+	data->watermark = 1;
 	rc = devm_mutex_init(dev, &data->lock);
 	if (rc)
 		return rc;
-- 
2.43.0

