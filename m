Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2704493D52
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057028; cv=none; b=eU8z+Ik1Q1A1tXUXRAAY7lJ7K1DS9Fdhs0jP7w2JRBynNqKlczJ2I8dNLv5pXvZwBOwN326rUvKQ2tectr+u+L5p8VoyFSrZxIEkOyI7ctKS5jmrb+/uxXQdqEI5PsBdUObqbRsHFP7orfUKnQtpE1FjZfIMdvA0A3JNIUdFTU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057028; c=relaxed/simple;
	bh=e4QC/6+aGN9kOyKq0Nyqm+TJNMC7eFKd/DvPyCHBUEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvvUeIcZg7IGep+GB4KJ0T8IZ5vlOeVclZCCg5pE81S8NVTgK1/31lUDABmU4lbVbIZFEoCVY/70ZVDVjhxGotWgfqhpiQLiXwKdXuY5BZojwCsFXf/1l3YKNQcLX/sIGoRMHN1scMHTdZxM+ltX9cCgvHEaG7J1pB/RmEbzfz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKYXgDNM; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKYXgDNM"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4415869aso399043e87.2
        for <llvm@lists.linux.dev>; Sat, 03 Oct 2026 12:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791057023; x=1791661823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIPGiD1mGnpbdDtOLO/e1mH349pW3rywVssdfvgQfUc=;
        b=VKYXgDNMpS3+lWnzpX1pQwn/NQOudpsY0j648U2nTXklH0Zmpzc7rpVQngDghgQDxe
         jyYYvPehvjghwdqbnh+vWbbheliolc0L7cqC5TkTIKFW1gLBpTJK88SI0AgxwKA4+IPM
         Wl1dXR2Al/mUa41fhj5AWPlu1U5NCMkuoSWMjM/kJhrY1LwToEqyByADKLWIVHosoDlB
         mybe6/ZCOH48PsE+Mc9Ljf8T07pgSiQ3gDlGhYAgbHZtNnGa5T8cUPDLhanVHiXBnHy8
         wdFriGGCVxdVZpW0lJHWPXVDvUUrRECQnXUuFO4VL0dVnTvneKVpdo3YIrY1NG1JwcwC
         9xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791057023; x=1791661823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIPGiD1mGnpbdDtOLO/e1mH349pW3rywVssdfvgQfUc=;
        b=VI7Q63fkTEWPLEYbywA5gMblh8nYkqd5UbU5dwq8xQgG2s4ek/kG9aCsg1nAPUiTDZ
         ZyW3XLxjcawfbkT1m0JylftHG1uijazTZP62yOMrfeJ5HLQtgMP0pB7hskAtzBGlVWOn
         y/HctXHpHgcp2ktBJgsQiu47POSeAamaTlla+98inWbyWN1KXszo7FqM7Gi2dcVM6B3L
         aLslCSqAZKWhejpRsrLf6rFvEUqvr75Z7H8U/EKj5//HK65Xsl8pFJz5FDoUtLqAeqNm
         3esxYJffFfShj0sTkajzTQgZc41aUd/vFZUBDFOG9Jiiwy72pmKmJ50XiHh1NRG+Tlx2
         BmRg==
X-Forwarded-Encrypted: i=1; AKwUvBzO+dR1QJsmP6hq1lxvoeV5A3NnX32K4oB/mzhoH3waCbmvAQK/vdUAmoWmdoahxyj/R4TC@lists.linux.dev
X-Gm-Message-State: AFq9FYKq5M01kQTYjHJ/aZDjp3nCDLlOhaddB27Qi9ySSYwBL2H2iDI7
	R9r7TgUOnipEPcOqOR0lfsVUJNYrZlZ1D2vxFpg4+bvcVCv9lO966p/h
X-Gm-Gg: AYBFou34QaR5G3l4BOtgx1Q3x3X2PcXLpWYzliyS5ee33xbCUQrc7/LglVI9IuJVD+I
	TPhG3aKpLAuTRBVwcL4OtgFKGxo/k2n81DVGWJm6GoL4kTKnrQCkbSb+6yC6m7DzSUbaLtHwg4x
	9+t6N0n2OIlJSo+E9/j4zi+93nEQ+QWFMpgD4nM/ifgWqYAHF2d/RyDIjJ35S+7AzNjFRs9XBFM
	V20nWuHugthB2sSIuxyIrcpZ3Oxil5AgeubiSguiKjSzQNt+/VB5uyw04abieYi7ncKnfEqUzeu
	bwX2QAluBnPLOWtdwCluxdA5P6kttztYNSPjWtYcuNOFAcv62qayUT8PRjW7jDJ1udQ4DV55SWd
	UPXl2bKI9h+isBFEUr9wlHGsoIHGyP/VssfhfVeU/xYwEXMw4f2dvEzRj5lDR8kbxh5jAztkj/W
	4Z8fVBqjSueIncHccS74BmuRt+u59qPqESXJYymYVuEoL2Ztq2tSTv7iYHG3weFruOG3K1iRqqA
	JTBEUxlLJWfBh/xwNqA2NuW9c7BAoG9w6186/idLna3kchEBxYfaKMaoL5YL0UwdVOrfw==
X-Received: by 2002:a05:6512:2528:b0:5bc:b091:e98e with SMTP id 2adb3069b0e04-5bcb091ea2fmr2148344e87.46.1791057023212;
        Sat, 03 Oct 2026 12:50:23 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7abdbfsm1762608e87.65.2026.10.03.12.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:50:22 -0700 (PDT)
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
Subject: [PATCH v12 3/5] iio: pressure: dps310: derive the drain interval from the watermark
Date: Sat,  3 Oct 2026 22:50:09 +0300
Message-ID: <20261003195012.92948-4-zoone.rupert@gmail.com>
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
index b782b187ccce..528dc9283738 100644
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
@@ -980,13 +981,29 @@ static int dps310_fifo_set_enable(struct dps310_data *data, bool enable)
 }
 
 /* No interrupt pin is wired in tree, so drain on a timer */
-static unsigned int dps310_fifo_interval(int prs_rate, int tmp_rate)
+static unsigned int dps310_fifo_interval(struct dps310_data *data,
+					 int prs_rate, int tmp_rate)
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
@@ -1163,6 +1180,15 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
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
 static int dps310_fifo_start(struct dps310_data *data)
 	__must_hold(&data->lock)
 {
@@ -1176,7 +1202,7 @@ static int dps310_fifo_start(struct dps310_data *data)
 	if (rc)
 		return rc;
 
-	data->drain_interval_ms = dps310_fifo_interval(prs_rate, tmp_rate);
+	data->drain_interval_ms = dps310_fifo_interval(data, prs_rate, tmp_rate);
 
 	rc = dps310_fifo_hold_alloc(data, prs_rate, tmp_rate);
 	if (rc)
@@ -1288,6 +1314,7 @@ static const struct regmap_config dps310_regmap_config = {
 static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
+	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
 };
 
 static int dps310_probe(struct i2c_client *client)
@@ -1304,6 +1331,7 @@ static int dps310_probe(struct i2c_client *client)
 	data = iio_priv(iio);
 	data->client = client;
 	data->iio = iio;
+	data->watermark = 1;
 
 	rc = devm_mutex_init(dev, &data->lock);
 	if (rc)
-- 
2.43.0

