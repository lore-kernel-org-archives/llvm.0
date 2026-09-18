Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A174EB853
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734336; cv=none; b=OJ28eRUeuMmuVXXpkYICxqmAaeuX9n8LnyesS6WGNLMxvyODIf/gmTqzb7Hxx0H7UxwCL8E1pF/ge1LafE7kD/vTuyAkdaLhcmbiai+l1k74Kkh4f9Ol/FJ8R6+5CD9Kfof7Fky4jOqNXgqArLdiFQ2KbiBCVCYnU4JDE10A05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734336; c=relaxed/simple;
	bh=NquUPFXNGtd4Ni0z6JEwZnVsUBIfxDLoSJ0188QE9MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCparIxMdiwMV2bLNq7grE7lEVK+ZbP26ZrSBliYuoBOikdD/7Zq9mpe/70ROPlVUr+scgZlqcFcw9GWm6ojw9Qog5F2eh/UBvoaicOWEa4y+RMl7sOlJA7xYvvsGPzfpb9EZWkiofl+A0vL6keIg2Vrseyd20z7SklYxDUC6MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oFL0oz2a; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oFL0oz2a"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b88dc3bc02so613778e87.1
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734328; x=1790339128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buSpNdyZjmDa81oD9lpAG13/8iu4Pu88B1wBEU4L/m0=;
        b=oFL0oz2aH3Z+eXQTWMo7hvM34KvlgdmsKc2tBB8iB40ruJNe8oyjj+ySDvVx3mMzqp
         NnA75aAXbJPWaUIqNFErzBwIdXRfgPLDEtRk6SSgy9jyOWiR6/waKaQAUW3I5YuMpJzr
         EaOIq3vlOA5dSpdnlbyZPA6qVVmD7G8YxEkVSFlfBl37iTjhEvg+kcB//6R9ZNqANPPX
         ne91iHRnB2fI7Dsni5dRuIo/NXClTZYs+u994bFMbNQn68JxZqREsKdi9qFoOTaZCK+6
         ItbdNolQ3/SQ+0Z3PEI4sMAh8wfvDfy9VyanwESJPDHBy2e2mP6qucLGHMy9/goSUcVW
         nQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734328; x=1790339128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=buSpNdyZjmDa81oD9lpAG13/8iu4Pu88B1wBEU4L/m0=;
        b=A15+N02g0dAFqnso4Htj0Ht6Xhtp3bfeToenZdkHANhxIOoElmqPozmTr5OpaG6JSk
         PW+kODXuYnpmBXnhhiJDlSwQBfijQALacRLbOJAyGpxyr5PGSiLb43I6Hq+0YQyhwT/B
         GrWKVbOHqGAcljbqylhzPK6tgUhp+nf2Hsc00UDaIvvPUBb316YNAW5w8W7VGd3e4tWF
         gORClGa8HD0kmLbWtkxOG8VBr6PydJadIXg+5IAZnOSs/RmcXYg/N5ITlejn7G1QxN+a
         tx0Ztcs8t0/NNN1Sim18BAqWU0Pmho7+VxzObrERyxt3uyYPqsrf0RKCb/nIyE0J3UOz
         e92g==
X-Forwarded-Encrypted: i=1; AKwUvBya05nq8bWaOUrQka1j5nhGqV6ow7KxLf5n47GmQKTn0yX+RobXehx3WA7TTcO5pqbk0sig@lists.linux.dev
X-Gm-Message-State: AFuF++mtAIFaCLukN5ZzqZ7tZUJ61sjzMa2ZQu+ItLxvIuXgnosUCaJO
	zit0m29hP6BmCPMY39wJ/JdY7qY95P47EtCSRgyJfGBQ4Dff5csnri/Z
X-Gm-Gg: AYBFou2wqeZ4Z0G4hH8Ic0G/GB7XWUt39HwR/wrlL+bCw7HFlgTjugjGGgkIMJO2vGD
	jrmUYtPa6Gye7nkBD5dbg4xXSM0fZT6OW3zbb8GuXIeAOXBcWL/vPt88W8/BZDpPCxgiNM5fmAt
	cGLwNFqxGZz7kkDZ+FuV7+uuer1hkJDMTJ3RVp5LsOJWxvf3iR53mUof+kmOuZu4YdwQsGuov1r
	9YGPSRbXTkm/x1vV+fi2875Uml2o9Tpeju1JOxvCGtGouoyKAd+0pmkl55+OgfZsTqYClUw2g4I
	Fc1WFYui7y8JcqzWoSM+bFsawOxK8sADmfC9Bz5H3CvmsysZ21A9rke1dC/jirmZy3xfcQ/0ke9
	MiIKG1d3iuLFceOZODyYr79OfJgfs5JxbAUGfJNgz52z9YOKjyvskp3yH4/X/ZqbfjVZ0H1jaoL
	nZifVvhJiMunNb7gpS5itIx9a2gjD1CA6Yt3QDUAHS8SVMAOX55CcKl6/MGZJjdqVaA4GXrUqVC
	7aFB8RUz8r1J6tlUYUXZ/dIITcC+9L5GCRdnLC7FmFvlXeMEO3unjZc6PqUaXIbQn84nmx50XSV
	ENKh
X-Received: by 2002:a05:6512:4023:b0:5b6:1a7c:fd96 with SMTP id 2adb3069b0e04-5b8c197532bmr717255e87.60.1789734327937;
        Fri, 18 Sep 2026 05:25:27 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:27 -0700 (PDT)
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
Subject: [PATCH v7 09/10] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Fri, 18 Sep 2026 15:25:16 +0300
Message-ID: <20260918122517.377565-10-zoone.rupert@gmail.com>
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

Let userspace drain the FIFO on demand rather than only from the
periodic drain.

With a trigger attached the FIFO is not running, so there is nothing to
flush and the hook returns 0.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 024fcdc7f4e7..f888bff2c996 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -1092,18 +1092,22 @@ static int dps310_fifo_push_held(struct dps310_data *data)
 
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
-	unsigned int i, n = 0, pushed = 0;
+	unsigned int i, n = 0, scans = 0, pushed = 0;
+	bool is_pressure;
 	int rc;
 
 	for (i = 0; i < DPS310_FIFO_DEPTH; i++) {
@@ -1114,7 +1118,15 @@ static int dps310_fifo_drain(struct dps310_data *data)
 		if (rc == DPS310_FIFO_EMPTY)
 			break;
 
+		is_pressure = rc == DPS310_FIFO_PRESSURE;
 		kind[n++] = rc;
+
+		/* Only the measurement that drives the scans counts */
+		if (is_pressure == pressure_enabled)
+			scans++;
+
+		if (max_scans && scans >= max_scans)
+			break;
 	}
 
 	for (i = 0; i < n; i++) {
@@ -1164,7 +1176,7 @@ static void dps310_fifo_work(struct work_struct *work)
 	int rc;
 
 	mutex_lock(&data->lock);
-	rc = dps310_fifo_drain(data);
+	rc = dps310_fifo_drain(data, 0);
 	mutex_unlock(&data->lock);
 
 	if (rc < 0)
@@ -1205,6 +1217,19 @@ static void dps310_fifo_hold_free(struct dps310_data *data)
 	data->fifo_hold_max = 0;
 }
 
+static int dps310_hwfifo_flush(struct iio_dev *iio, unsigned int count)
+{
+	struct dps310_data *data = iio_priv(iio);
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
@@ -1342,6 +1367,7 @@ static const struct iio_info dps310_info = {
 	.read_raw = dps310_read_raw,
 	.write_raw = dps310_write_raw,
 	.hwfifo_set_watermark = dps310_hwfifo_set_watermark,
+	.hwfifo_flush_to_buffer = dps310_hwfifo_flush,
 };
 
 static int dps310_probe(struct i2c_client *client)
-- 
2.43.0

