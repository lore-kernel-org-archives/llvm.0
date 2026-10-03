Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50868495049
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057030; cv=none; b=IfSmfJQZQgHAl8O8calR4RGz75caU2p5A3QQN769WCd298hL5GbxyWMOE3W3TJqb4zpWplPxUFWO1vby71pa1LYjPr9wg78qzFc35AVU4qyOppcQDSTEMyHkBffdCwS628NTwQOoMeSYndfE3daHFN7y68gpYNWyxiJ71KiFueM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057030; c=relaxed/simple;
	bh=yKZ3RAuB9c8QvP51Mnfq7TMJVSdVuwbAyl129LQ9ebY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+6cMS1szjOZ/G4UIm67SbJ5d21DgcyMynCk9oAyyu237MDCdwrN6O9Z2fKJcn53gHjsOFfBLAdmngNNgo5ciaJW//+KeO1lmRuOGhFgO8OpgzCw5/IUWy+imKSMTQa81E889axQ+9VhVV0VETSxvnOZQRucOiGguArHsL7nQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcxsHm17; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcxsHm17"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso347618e87.3
        for <llvm@lists.linux.dev>; Sat, 03 Oct 2026 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791057025; x=1791661825; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5x87dEIj4ZkmRs3wXiwE88rd8/NOqK6OzoSInLWsrs=;
        b=VcxsHm174ebgHABr5SjXyJ+Cbw5Q59x6bfLE+3cUeZJc2fM10kyUHfVPODBK1HKD4C
         yJY3d4g0EpaNUXPZcH2wa54Gl4YZnoccF0Wk1bAZvppssSauhkjz7CqJpPR3dWO+RAaf
         SsZyNKfavmjFIXD0c2Ao/q04+FzT+FWAT/NnPdDH31t6kiWkKMIFPgaHXfKB8P3IiT/6
         hjYt9GQAPpqxfFaIQLnFEIr4kMcWiAWlk7vOa2lcS+xARu18SCNZTnvwyi7ZoYDmrvhx
         zFKyZcQJtPWhpuSkL0IVEcW0DWBK+5xNkS5VgE42Sp3qUAPCf1WIA/fgTum07p0qDOzO
         kVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791057025; x=1791661825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5x87dEIj4ZkmRs3wXiwE88rd8/NOqK6OzoSInLWsrs=;
        b=ytuHadlGzlIZNBx2A+eKCcDo7zdRMLL0jNg7gi+wQdHyZ8UdTzAkSS243FjmExGDCW
         mmepY3up1wYxnY7albgaitDBY4KylasOWMuelvsRsEctN+7crTVCMYHie9nTDlbAyDs2
         riYMjqsDh3DChH7YbMirVjGc3OdbCbaK10qTysLcU3287FmK2ZTzyaqvIgec/uuNl/pP
         BjeWgVP7POY9OhyPKJUNBBS7P32ejTHISf3C735NpYwoS0qGP6a0QMaYe4cDuMYliTWZ
         LBZs5S5yk9Gxov00PBF0x47mBZV4uLFp2gKrhw4EQXoc4VoC6wKNPvjbmWM9LrVfeBVK
         8ZeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9VXOtccehsKuY9x8M8go+4EOPlMqBQKJrZExN/xTA0FUcWMfL+DYtGC5WvnbPs6yeQZcM@lists.linux.dev
X-Gm-Message-State: AFq9FYJt839vJq2vpTHKNOdEiOu0nM8J+hlEwCkGTrNlINfvZCAY2QoK
	nBD8uy2+JRkJE8b4upW5L5vKovf+WK+6W+vb2o9yGDeqdzUr1Fb0xCiQ
X-Gm-Gg: AYBFou2AhrZYMBtUVh069Egx3GTwHQVT0q5TcBXxen82nNrpFYOiLvhYGfoWIatHugp
	x47ULV8i6ToMav2ZLTxFsm124YEl+b4t3G1UyvoV08Sw1bieGyFjSfrdh6Vp7jodJydFEFtB+no
	xzpj6ICalT3bsrn5/50P3M2ysJF8aHvVyjaKX1TEUW7NqC4B6lVKs5+zc/J63GFqSTQL8IW6ukp
	NBSjoHSoqcUR/SPk6udbyCtR6bs/+HSR0CXOOL1pFrAmYyA9wEqekWfX7JPf+DnjlFAXm9plW7G
	qB4S741ND62bAZgbJV/iJ0v+CFFR1SGBdhY9k7cMXCgrlHGHlfA6dRgDO6HOUeWvsvUUIE2ZGUX
	foJo0w577vmiep2cgq7sePJbD3nERNlCpvJsEO4IdEi8qaRp4pnm1UNPQnu+50rJ/+EYfluSaNN
	t6aX/e8WbKjWp9fvNe/P+/uaVo+vDGwdEmadMENUOsR2gy9Fr53LhmkiS1Oz9+cB7/h+eY7IwkE
	81dJekjrI7WwcK+nVQSAnTmtyn47RhqTEKNpCQR5U2K4YK4O5zAnjnmsCL79i1Ym0TNCw==
X-Received: by 2002:a05:6512:110c:b0:5b8:f7fc:959e with SMTP id 2adb3069b0e04-5bcb546ac23mr1367126e87.34.1791057025052;
        Sat, 03 Oct 2026 12:50:25 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7abdbfsm1762608e87.65.2026.10.03.12.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:50:23 -0700 (PDT)
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
Subject: [PATCH v12 4/5] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Sat,  3 Oct 2026 22:50:10 +0300
Message-ID: <20261003195012.92948-5-zoone.rupert@gmail.com>
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

Let userspace drain the FIFO on demand rather than only from the
periodic drain.

Hold the mode across the drain, so a concurrent buffer disable cannot
free active_scan_mask while it runs.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 528dc9283738..d70a0fa69c25 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1086,22 +1086,29 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 
 /*
  * Read the batch out before compensating it, so a pressure entry pairs with
- * the temperature preceding it rather than the last one in the batch.
+ * the temperature preceding it rather than the last one in the batch. Stop
+ * at max_scans, as reading an entry removes it from the FIFO. Zero means no
+ * limit.
  *
  * Returns scans pushed.
  */
-static int dps310_fifo_drain(struct dps310_data *data)
+static int dps310_fifo_drain(struct dps310_data *data, unsigned int max_scans)
 	__must_hold(&data->lock)
 {
 	bool pressure_enabled = test_bit(DPS310_SCAN_PRESSURE,
 					 data->iio->active_scan_mask);
 	u8 kind[DPS310_FIFO_DEPTH];
 	s32 raw[DPS310_FIFO_DEPTH];
+	unsigned int scans = 0;
 	unsigned int pushed = 0;
 	unsigned int cnt;
+	bool is_pressure;
 	int rc;
 
 	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
+		if (max_scans && scans >= max_scans)
+			break;
+
 		rc = dps310_fifo_read_entry(data, &raw[cnt]);
 		if (rc < 0)
 			return rc;
@@ -1109,7 +1116,12 @@ static int dps310_fifo_drain(struct dps310_data *data)
 		if (rc == DPS310_FIFO_EMPTY)
 			break;
 
+		is_pressure = rc == DPS310_FIFO_PRESSURE;
 		kind[cnt] = rc;
+
+		/* Only the measurement that drives the scans counts */
+		if (is_pressure == pressure_enabled)
+			scans++;
 	}
 
 	for (unsigned int i = 0; i < cnt; i++) {
@@ -1146,7 +1158,7 @@ static void dps310_fifo_work(struct work_struct *work)
 	int rc;
 
 	scoped_guard(mutex, &data->lock)
-		rc = dps310_fifo_drain(data);
+		rc = dps310_fifo_drain(data, 0);
 
 	if (rc < 0)
 		dev_dbg(&data->client->dev, "FIFO drain failed: %d\n", rc);
@@ -1180,6 +1192,22 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
 	return 0;
 }
 
+static int dps310_hwfifo_flush(struct iio_dev *iio, unsigned int count)
+{
+	struct dps310_data *data = iio_priv(iio);
+
+	/* Holding the mode keeps active_scan_mask alive across the drain */
+	IIO_DEV_GUARD_CURRENT_MODE(iio);
+
+	/* A trigger drives the capture instead and leaves the FIFO empty */
+	if (iio_device_get_current_mode(iio) != INDIO_BUFFER_SOFTWARE)
+		return 0;
+
+	guard(mutex)(&data->lock);
+
+	return dps310_fifo_drain(data, count);
+}
+
 static int dps310_hwfifo_set_watermark(struct iio_dev *iio, unsigned int val)
 {
 	struct dps310_data *data = iio_priv(iio);
@@ -1315,6 +1343,7 @@ static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
 	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
+	.hwfifo_flush_to_buffer = dps310_hwfifo_flush,
 };
 
 static int dps310_probe(struct i2c_client *client)
-- 
2.43.0

