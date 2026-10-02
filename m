Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A766430305
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925941; cv=none; b=GOt6YNVNdla0b7jS0ZDSxraKF+RrnYVpsufoqIjVfHmGOV+zQUcEjjhQ2R/ehTU8Pkfy9LUR9MXh+/jDLlAgkFPM+Gk4APpL5sZsa7MoH1LaYK2KCGR4c4hwMVMZT2nIIWKWBp//GPdTpbhU/O/rVCu9UKk1ercuj/N0Vcwjt/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925941; c=relaxed/simple;
	bh=nWsKuAdUddp0Tleqx+ekPg6QLRLSsPPMTflS6Pctl/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQlqPQA5vyEe/tTC53V34kDtBbEqM57GcgV7U0uWDrKvMFxdgz/vDfzs1Dk5DQyvn/Q4aV4Sopf/5QpdDX3unFGelAqYOLKIWHwysTnN1GJ3jRZpvT9y1N7r/IVLSdz0u156OHThiZhlGyp732xxSOoffGleCv6yrf9CRBZhfss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUk38ndr; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUk38ndr"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso65822601fa.3
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 00:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925933; x=1791530733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XI/mSKvddqfnhotYCwOocDf6jqT8wgERZ/92dl/Mty0=;
        b=bUk38ndrdPhKFt9+bErI7GZ2VN3JjBr6oQedzNn73TDDO/y9T4LDi+AiiyqDy5Hfrx
         JyWbSGaHsHM6dE9I+Cok+r3mVNgP3HJlFFtbo2g1V/QS48PW3Nqfo0eAi80dJDsR77Yp
         WOaAXnTqQu/aAmRjc2ArVO/D4Sirzk5g94SnKbvTmBXeRuQ8GXQrgbuzKrBmWzJGHOmQ
         ULF/lkO1usDkw5kWNP7O4LZcToiWGFn736ul3JrXdBB0slNX5R1KIPEZgCLhReg8ru2u
         M/MW7Emv4mLOyDWE8x3CXVjcPlxvDVSYKFh2JreOAZXQjuvkXIbYcwE7scAUZr9vxnTB
         /Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925933; x=1791530733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XI/mSKvddqfnhotYCwOocDf6jqT8wgERZ/92dl/Mty0=;
        b=wJodYPgj+udqkpMjVoT0bhHyT7Ht36rMOle7JXZnUk2BlVNPZGJmY+vuWJCUyM74ko
         0cdH+R9AorKPClzQb4lEV76mUYjSfwzPwDPVqFJUGvNKB95dc8JCykC1Ca9I4Dqz0DvI
         OjgOiXT8C+Cpm2qddWBWrSvqUf5Xzlcwz6fgEPJvKX7o197XdgfMLv9NBNbjjdL/yIno
         jlrDz8Tn+A4mZzLSIyvDtCvTGtn+JiyBcPFSEtFnYQSBlpBY4h4XeRkNKLk/UuQzLeuL
         Ojk9odgWWJzjZQiLhFnBgaR3T/FjM+NFNeYUu6BreB+Ao3BRO5OkYhm9JeU+/Z2hW84k
         /jkw==
X-Forwarded-Encrypted: i=1; AKwUvBylQQ9h1rL3onAgf4w8NYD0OAS3h98uhCQwuPkoLK+PF1a+ZbCNIXAKNKQC2TkQAnJPGe1g@lists.linux.dev
X-Gm-Message-State: AFq9FYJIa93MtTg9KUib6hOAWXXZ/WbLQr/tBCGgYYUgmc3UKKxLC8Zg
	90KYO+fnlyt2mXT2AsvToJR0Bt8uveRY0m0ZKYpXzNF8Sfyd2R2lTJJN
X-Gm-Gg: AYBFou0YHSt7aUlmU+HsX3QLbYTMvq3GM6ZOiih7eXWrF7cuIkn/eVcj77Awpe8GhTe
	6OZFQy2vHE1JuiH2zG2e3SfZmOKtbK3dZdj7CxAVBhz/WL0OncIhorhnD9DaVj4SYvtwavNXuzA
	B9MRnwk7ZyihxwadZzxL2dzC9Lx9/4yoG46uM4bEgKZc/t/HTqRIIloLpwojc9dUFtbZknmLL9n
	Z/zXwiMg0o7L4iTUVrLkU+MVybSA6gR/HMQsn2e8T4df/QDlwR3qZf1hu7m0nzS3+S7f2RhG911
	MsfAYLSza76mPua8INl9G+LRw9/NbNWcu8ZFLl70CAnUyO9pky6VEJ9sL4/rEn4KseJGP4KP71i
	JyFKnyvT3CKhoSt+KkhtUuD45XZG3fUErd9PxSvkHwxxDJuB+Nxhw9VUqGJOe5FKSBO2fmhVeiu
	8RHB4+3psHzTKJC26rzrkbM1shkwgdaburgJlb+D3nPfcLssjMXQNC/CXKKZs5ka8eRzgpv8rEY
	v2AthQY8WHSrOPtqK1ksDnCG3e2wJeiqifVCrcUSzvtRvZhvvJACUXM+YP1OoP56ZmA3Q==
X-Received: by 2002:a05:651c:b11:b0:3a7:7a0e:5703 with SMTP id 38308e7fff4ca-3a87ed423a1mr4553631fa.2.1790925933023;
        Fri, 02 Oct 2026 00:25:33 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:32 -0700 (PDT)
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
Subject: [PATCH v11 4/5] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Fri,  2 Oct 2026 10:25:25 +0300
Message-ID: <20261002072526.250081-5-zoone.rupert@gmail.com>
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

Let userspace drain the FIFO on demand rather than only from the
periodic drain.

With a trigger attached the FIFO is not running, so there is nothing to
flush and the hook returns 0.

Hold the mode across the drain, so a concurrent buffer disable cannot
free active_scan_mask while it runs.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 36 ++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 294ddccd264b..959f4bdd3995 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1091,22 +1091,30 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 
 /*
  * Read the batch out before compensating it, so a pressure entry pairs with
- * the temperature preceding it rather than the last one in the batch.
+ * the temperature preceding it rather than the last one in the batch. Stop
+ * reading at max_scans rather than after it, since entries leave the hardware
+ * as they are read and any extra would have to be thrown away. max_scans of
+ * zero drains everything.
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
 	unsigned int cnt, i;
+	bool is_pressure;
 	int rc;
 
 	for (cnt = 0; cnt < DPS310_FIFO_DEPTH; cnt++) {
+		if (max_scans && scans >= max_scans)
+			break;
+
 		rc = dps310_fifo_read_entry(data, &raw[cnt]);
 		if (rc < 0)
 			return rc;
@@ -1114,7 +1122,12 @@ static int dps310_fifo_drain(struct dps310_data *data)
 		if (rc == DPS310_FIFO_EMPTY)
 			break;
 
+		is_pressure = rc == DPS310_FIFO_PRESSURE;
 		kind[cnt] = rc;
+
+		/* Only the measurement that drives the scans counts */
+		if (is_pressure == pressure_enabled)
+			scans++;
 	}
 
 	for (i = 0; i < cnt; i++) {
@@ -1151,7 +1164,7 @@ static void dps310_fifo_work(struct work_struct *work)
 	int rc;
 
 	mutex_lock(&data->lock);
-	rc = dps310_fifo_drain(data);
+	rc = dps310_fifo_drain(data, 0);
 	mutex_unlock(&data->lock);
 
 	if (rc < 0)
@@ -1186,6 +1199,22 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
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
@@ -1319,6 +1348,7 @@ static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
 	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
+	.hwfifo_flush_to_buffer = dps310_hwfifo_flush,
 };
 
 static int dps310_probe(struct i2c_client *client)
-- 
2.43.0

