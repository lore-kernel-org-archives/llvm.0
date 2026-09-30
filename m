Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F193BE659
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762533; cv=none; b=WpAISkkJFzvYT9CVL8jj+xaDdcau+WO65UrgsIb2HNXQ76RFKWCTiwDTJxKbEkFm6hDe835NTwtG3+lS2W8aiKu1jhlJugzm3UvTXbPy/awLOAO+qpd/JWIYmIwFDWG1HSMTBXhYddsRxMeamzYoOlCPwtO3wf3ZwqEOWLXbrNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762533; c=relaxed/simple;
	bh=ubuKNtUx9xDXbA+Gr/tfa3090iC2fra3WmGf2vl5c9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=av+ngNRTUGukNbSjGxOagZ95ZeY/pENy6mCJ28Ia8GKix5o2FyDD4hj9L7XukZncJqMBJUY03WZ2DAL+FngOpb0E7Sl6flBx1p6iJbNtXPbWAPU6HhScbvn+nCcFn4DDCh5OC+Not7m8LpxKNlZbyp5LpVgJaP98omTWDZ/I+w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6B3jbLH; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6B3jbLH"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3e27d525so363300e87.1
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762527; x=1791367327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Df2+CieyG0JeULhWDBnbT1AhVc5GKthoxiOXPRTKR10=;
        b=Q6B3jbLHbOd944hg9XhImCObhN9eDj+PFBSBZt9Ln+JAO4eBUayuMI0slMW7jJawVF
         8DCGitRUxTvFL/KvqaoKVkjb8Opylkvq1kjukeYEAXdetkReINGGSGup0byi5UvmkEgg
         YIH+DjMtnZPqS1P4/Bu+d4ra95/Lfd5HDds7z9W/RmHrfpfOhyJUw0dUJf/RvfpSyuKf
         qfUaacaAJw6Cp+OWO0phZRpUM/N3AalCoOx9Z8LWJh1ZM1bCNR2dw3rpgj97A40mN4/W
         cEj4Eu8CAxySa6EG09xlS+U0tZidCHRFTnsUyPRvHBL7bb9xljT/g/3DO5d3K6s3Ee2w
         GY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762527; x=1791367327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Df2+CieyG0JeULhWDBnbT1AhVc5GKthoxiOXPRTKR10=;
        b=lv1x7qPkYXzQNxUgHCABgtrzjM/9Ug9tZKtjJjhNsZzN8yf5ODjsXnGv4Wf/19W03s
         qKSHXsjlHBOssq3y2bBcjdTXc4VQV3kFd6d3Vm9onrmPUe40HZuaofupoE1GDNZ4oJuc
         dqR/VtsqU5tNPX50xS+aAaHzzMRf6h+sp0yDSiU/8PUoVgmkEPVrH6KsmsIV3P7xKoBy
         7Xg4nuPi5XgpgEKxccOLizaH2ym1n23b1KdptRjtXqMfYvNlGWLSHEMdY+/vmXZ/kF6p
         uXawvYCP3WTSND38Dpv05nKrpTLKlPDqMCpa9AwFfK+gJ1BS/GSO/ICMuBxbKjMPZ78p
         jqvQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9SfOGk67Z+pG6VfPoDnJ4KDdXEifrN2bQTgcrmzG3c7EFd2GffOJ6joPPa4kU+FuZ9FLz@lists.linux.dev
X-Gm-Message-State: AFq9FYLuXkX/kzX0GIkNGVa2lIg5wR7fcTvWft9PrVwG7gR70ZBXuLdj
	f5uF3EbDJ9fJs6FTPDpuaRx2uKFsKXqyKrN6VtczpmzKRSO2vQ0/bhyZsU8BG7Jj
X-Gm-Gg: AYBFou1Mb6bmU975kTZm64z7SR2Hgdbu8yzerUt+kpt0DDdN4i/mpOWuWi6e6C9khlh
	wuKRl09K3ylzp3MW6itJImBiBKapWB/dBEEMJzuhkkXqNVhfZvLcgy19gX3cpwgl6u7e7nC6AiY
	BnJb3qLdv8ZnPRKGiYNOjC6+/sBKEkuRUPxBG3Hnpx1+8hW+mQ+Fjzs8dt5CSudOXbWEfaIfdBR
	SN60QYAmbQYgbq2q/L5xFTIhgwtRUNYOmTioi8jXQMYt8Pz7uQZe7rrHfeMJqr4cKbTClD9J5eH
	whLzG36Rwbu3aoI8KiuF4UlZM387CHwj/gbO6RnRezhyv+88ihcuVy8cAQ6nqSl0oL6I5nQ5Rjf
	BmCStggdFjdYwrCesjEHcb3AvCJ+OuMJoq/C9iao1DjB9ojJN7Hw5L8jmJat6HcokudQPOMxs6p
	SxSBLsQQ/qTy1Qa2vSPxDScTNLFml3VElTCZWRqWqU4p0pYmFVU7vG8CDASayeYbpJDPFD4Uz5Q
	qymwP2vxVzf0AfHTcy2SjuT3ep9gUFYr35Us0n96WJDryWnUeHX3lJ3r1ubuQOoMN7xRA==
X-Received: by 2002:a05:6512:15a7:b0:5b8:f010:89ab with SMTP id 2adb3069b0e04-5ba40609082mr379351e87.44.1790762527181;
        Wed, 30 Sep 2026 03:02:07 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbe6c06sm240422e87.22.2026.09.30.03.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:02:06 -0700 (PDT)
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
Subject: [PATCH v10 3/4] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Wed, 30 Sep 2026 13:01:57 +0300
Message-ID: <20260930100158.957977-4-zoone.rupert@gmail.com>
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
index 82bbfd097cd7..01fca139433a 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1089,22 +1089,30 @@ static unsigned int dps310_fifo_push_held(struct dps310_data *data)
 
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
@@ -1112,7 +1120,12 @@ static int dps310_fifo_drain(struct dps310_data *data)
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
@@ -1149,7 +1162,7 @@ static void dps310_fifo_work(struct work_struct *work)
 	int rc;
 
 	mutex_lock(&data->lock);
-	rc = dps310_fifo_drain(data);
+	rc = dps310_fifo_drain(data, 0);
 	mutex_unlock(&data->lock);
 
 	if (rc < 0)
@@ -1184,6 +1197,22 @@ static int dps310_fifo_hold_alloc(struct dps310_data *data, int prs_rate,
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
@@ -1325,6 +1354,7 @@ static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
 	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
+	.hwfifo_flush_to_buffer = dps310_hwfifo_flush,
 };
 
 static int dps310_probe(struct i2c_client *client)
-- 
2.43.0

