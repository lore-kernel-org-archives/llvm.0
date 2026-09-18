Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A6F4EB851
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734347; cv=none; b=fQhBo7MYgAVWG3mZW/hAByp95sOYPqOTjgDbuiEaVBHuaiTDtQ/Nd6mY67vVIH5tsvozJ5wreT6kS9wC4XmbprBr5/uvIRWBVavWFag3RKamEUvtgtDlB7J4oUPu+cCqUW3JRhNClaLB81a/Y5Ay959FdZy7c7nw9la2hv1fjUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734347; c=relaxed/simple;
	bh=HDxsKpPajvO1pDBGt+Cg3JRzppun/aKifwXpwM5P7LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaBOAhCR5JNGMGLCBP1REUQJCLCaBG/lFs/RGGPRG/4h0oIU7VG+OWREnypjOWIZAZa4vNaQveQ25ptpnh8+oUVCrvi30pryxD8gidmSUtRZoq3l4bLJq35nYX4dA0GNryEN/1PdvjcNo1eSM4yuxHknF4uPwFZTwG2KFUkFXWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYPbiFP5; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYPbiFP5"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so747912e87.0
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734327; x=1790339127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qM09fZNeu0wGJcMJFEcwruCO/xWOafFLtCE4C1cUZM0=;
        b=XYPbiFP5nUrYCTy0RQANb8uAv5pHtsGA5Mb7Vftoi+ZYFuOhECWTdpfpxWt2o+piR0
         iqvaGLSxWWVmZ3s4Q8gruAaWzhIU6i5ixHRTt8bBZ3hsQwlohla/PDWIK2Q9zU5jJOIx
         OhNpEcV/2+KwKQA+6nGAc+1q93u8wKKl12Ek/fE4a0yWj5WVGxlbRsv/f3bmRkY/bnOX
         m4T3YZC01pgnGDZtFD4jZTUwl44qscBamNNH32SbZsjV76Q/iLKLLnqlOq+LmbuEowtH
         57yulPG1MHM1asL6YrE5PHBdRoK8MAAcgY95a5xkaDYde/Bxik1dNSm1pJNySDL5Qxft
         fBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734327; x=1790339127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qM09fZNeu0wGJcMJFEcwruCO/xWOafFLtCE4C1cUZM0=;
        b=yCVjhpHEqJA4ht3f22KwidBMGU7snk5LDG2+gaBtPNcTJZ2EXqsKffasi4Dr94YA+9
         z4NRuKTIj68rXx3WfGZ03WDEbMxadWXGokfnL7Dy1vz007sS8XgnX0YSYvi27J3Jdv+6
         /odF68R6ZUigIxsVF8b/YuwcIr5Orh96N+60NkBEKLkCm7Yfm1DD4iZJD1rksWCDrSOv
         yazsD11plouQ36Id9sn25DuAEUeq5dRcJ8XoqXbZlYk1NN+oGulFeJj5xP7Xc9UR8SAN
         x1C1IIW+kUfs0jCjAtYbk86SIP0GDsENLHiKP0TdNzbitZYEy0TOjUnrMwJCkLaq/vW7
         q/8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzzNEwXHDJ7iNWnifmXkeO8IIS1NA+A7W/5CZGlkM7crCeXlmuGxfoTWjIAyQZdAlLXZNx@lists.linux.dev
X-Gm-Message-State: AFuF++mka57Cr7xL2SBcxIVWyfR9evPOmb24pUHgI3qWPLtmJhK6VUna
	FbgOKF4yLnxtZ2TAcsCPMj7JAXXABjWJCVl8ANp4CtV2/ecqco6I/qkhUYlchlDA
X-Gm-Gg: AYBFou0SIQ64B3kGVfuXJWeVmKKg0ir06TzaVfTxtCEaM+AsvD52A1eJrX9fh8iENHk
	Dzh6kxm2qFT4GzwW7rsWV49pL3clsB5YEGvyKSXxyHN0Ecxxs+fH4cKT3ao30BTKpjBq0qW/8tv
	gHYUt9aeKGVwHyfcKO5y4oT+dZ7m8urwJ685rNs++iLP/WxyuGD71AGAdxr6BzOKW70+Mr9WiQr
	YM9dUqNz78WRrdqe6rQxxg6mVlwW5DhyREItNyRgNwJToqA0owXlCUY0KaXHwhAkXYE5m1gh+dF
	c7ceoFlv58DPukGKO487jUOrLjR/+lhV7mkXR/AJoTLaU2B+Hk5JOvBXzifcVGzHMZlJI4hv/I/
	BqPx6RDlRedp8lwLu88GRJJ5Q6V3GMJXRAyi54yW0ErC+j2UvIb1A1EwIInIrMy1WFRT3aYjLXf
	+uiW7SnZPi5VwART328mmcb58e/g5qzvPlTqZur2mYQs9jDGqh/fio+q5BlP69ohDlKQqKrr0GI
	i0MYGY2u5BqaACzspDhfm2+mekWmroIdi/oWjk5TBlB/lID1wZn9qKQgphGTIdyYfJc9w==
X-Received: by 2002:a05:6512:158b:b0:5b4:fdc3:d3f1 with SMTP id 2adb3069b0e04-5b8c18057c5mr656114e87.18.1789734327121;
        Fri, 18 Sep 2026 05:25:27 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:26 -0700 (PDT)
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
Subject: [PATCH v7 08/10] iio: pressure: dps310: derive the drain interval from the watermark
Date: Fri, 18 Sep 2026 15:25:15 +0300
Message-ID: <20260918122517.377565-9-zoone.rupert@gmail.com>
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
index e63ea7873e5b..024fcdc7f4e7 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -114,6 +114,7 @@ struct dps310_data {
 	s32 *fifo_hold;
 	unsigned int fifo_hold_max;
 	unsigned int fifo_held;
+	unsigned int watermark;
 	unsigned int drain_interval_ms;
 	s32 fifo_temp_raw;
 };
@@ -981,13 +982,28 @@ static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
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
@@ -1189,6 +1205,15 @@ static void dps310_fifo_hold_free(struct dps310_data *data)
 	data->fifo_hold_max = 0;
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
@@ -1212,7 +1237,7 @@ static int dps310_buffer_postenable(struct iio_dev *iio)
 	if (rc)
 		return rc;
 
-	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+	data->drain_interval_ms = dps310_fifo_interval(data, prs_rate, tmp_rate);
 
 	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
 	if (rc)
@@ -1316,6 +1341,7 @@ static const struct regmap_config dps310_regmap_config = {
 static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
+	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
 };
 
 static int dps310_probe(struct i2c_client *client)
@@ -1332,6 +1358,7 @@ static int dps310_probe(struct i2c_client *client)
 	data = iio_priv(iio);
 	data->client = client;
 	data->iio = iio;
+	data->watermark = 1;
 	mutex_init(&data->lock);
 	INIT_DELAYED_WORK(&data->fifo_work, dps310_fifo_work);
 
-- 
2.43.0

