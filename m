Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C254EB864
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734331; cv=none; b=pHYDOsaDfPwlQQyO8imuZftl5ttllmbKZfS1HDgx04H1FfAqv4XM4qqpqKtGG369TLWyz4L2WAcWTcJj3uVz28+3n6jsyfALzULpdrxY3lfFKBoeMv1OsyUXdWUdNKtAgKGWUX1SkMiA89ZPW8Sl9JL5KbI1pRzlxpyrt4tf55w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734331; c=relaxed/simple;
	bh=2f3W7ewvZD9vQ7bzg12iNZ75xkP2pWmWjFYvl7E8R3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=om6DnjvYfVXq8UglBfRxelUUuewkUi2oPPFiPpHicqIw5R3tF16ZCmF4vIm+EAGAluZ8jxUu5OKRnKZpX0C07ZaAlE3NJLZ+q9vkdN5n0m0JEshRsRx0CVsqH7oXOAPSbCzoDbzRehkbfZQ9w2awMXEyWNEEjiqx97k13vSfwAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaUDcgm3; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaUDcgm3"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5eso6492881fa.0
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734323; x=1790339123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2j1Tv4agtRXuOvbEOgkc069No6p6dhHi73ng2NMw2ME=;
        b=QaUDcgm3al54qGAe5cnE/ncuX3TgU5BdMTkdDu1Cqyt3IyuaVYikZfSrr2W31VYPk9
         DpVSx2cVPcwnDhz0NeMSqXVfB2+Ski1ttzHuBtwQFTK5B3p9qeBQLllJvoXP6LM0yHnG
         QhelIjpcoRYlYPM2TyRDPCHn2k6D311pre3YcETHmhlhzlEP9cgqnU7AXI5IBehht1gw
         CIIb6HWzs6I6cgiILDDTnS0GdXv8D6yIDNhoyJ0i9EdwKg6JxrIr0Mw995PLQmZYQsog
         3WA1EiAH1EfXSvqhvXRfsDI0F6hSwBn2c0HRF6j2MVS9vLgn4PQ4/vZ4UDWkqBxQhpa2
         HQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734323; x=1790339123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2j1Tv4agtRXuOvbEOgkc069No6p6dhHi73ng2NMw2ME=;
        b=2DTmzMsKYlicbHedZ2DVmkyPBU3AGS8I0fDrxKpMuO/GJcv3BknVHXV9hpDpFbTI+f
         V1P5Wm9VF35e1jDxaXNiHjbgvSobbxeE6pM5yCDj+TqdbgTkf2sWwmeNuwxoOwPiiP/a
         hWLmjE2ZqlO17FFWivB8xD0PzclARhbODtkAQ6q5+crW8rub9oiBhSloRwECsyeZuUjm
         LidRsVZmyk7Mat6CXSbAjikdwo8lYUv70HFHXloXixLypupcswwFz+0Dkg6nybwpsb03
         P+QpBoFfth3jcJOxeWma6bPOAsQ5A8EALJ33u3USOVd/7BpL3oxrwaiBsWyiwrI/hh0E
         az1g==
X-Forwarded-Encrypted: i=1; AKwUvBwCUZyOsOH2po+TUiCpZgTNkxJRII+pDaqCf9MUsJgO4Qc6XU8b4gEMPebDYH2RbY+DXiVy@lists.linux.dev
X-Gm-Message-State: AFuF++klFkFglGiIJBcxwaf4GfIq5wX3JjLJmacqDAxncvD8PGpyRmJ+
	2AVsyeMLG8ukaIbSy5t5oz2R2caRm5u4t0nGbHpBI0AcXrnbzbIfsB/C
X-Gm-Gg: AYBFou12+Ftlsd7vngwJOOUVaLi8SkpcGru/m854ZCoXZwbqps79bOt6mqqNU0KqiL2
	QTHqGmMZ8XkPfRc0TcEG2JAu+V4KrQWEme52kyGZ9gGq8pCNt37qXc0K+fB3eY5IA3PBzmV/ZmR
	qd0WzmFuKjsQ6BYwzMXtJAFmpv4Yryubicz5sp7f+tOX420FruRRV1cuxw2XUCmOsT/U+bydInv
	xE+mhHhkXzJY98kynREiT3vNLNNaVa/IX9ihp7uASROeNuYvx9q8j73h1SMzGbc+swznLDuxClY
	ddeh7YqhS0+Si/i81kydN1vKtmnpvGkiqYtwSD9ruJ2epr3tWbo2kg96GtF09Chl8UZxfqApS0a
	4k3XvS1Gaz5DGOwpj3thQbk9xrDoOmeLCWVDK3B02Kr35ZmW3kLeqLkKSmFj277ZWBxnqW6BneU
	X6lXr6OlfyE/p6zmEiOeD9OAR+a5E/dy6GdcOXxDbp3PMMOfCaC4FBHcg0948oDFD0aC0znYiGa
	NMTAJFvCg4njgBgAA4LxWsZ9Ji3I8UPPwOSCniWQn0GLCl/y44bhxJhQQvv8yzT9dKnPg==
X-Received: by 2002:a05:6512:1293:b0:5b8:9ee1:10fd with SMTP id 2adb3069b0e04-5b8c195b2a3mr741943e87.32.1789734322491;
        Fri, 18 Sep 2026 05:25:22 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:22 -0700 (PDT)
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
Subject: [PATCH v7 03/10] iio: pressure: dps310: use get_unaligned_be24() for the 24-bit results
Date: Fri, 18 Sep 2026 15:25:10 +0300
Message-ID: <20260918122517.377565-4-zoone.rupert@gmail.com>
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

Pressure and temperature results are big-endian 24-bit values. Build them
with get_unaligned_be24() instead of open-coded shifts.

The coefficients are packed into the bytes rather than byte-aligned, so
they stay as they are.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index bd7da4f12749..e7f173e08e01 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -19,6 +19,7 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/unaligned.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
@@ -468,7 +469,6 @@ static int dps310_read_pres_raw(struct dps310_data *data)
 	int rc;
 	int rate;
 	int timeout;
-	s32 raw;
 	u8 val[3];
 
 	if (mutex_lock_interruptible(&data->lock))
@@ -489,8 +489,7 @@ static int dps310_read_pres_raw(struct dps310_data *data)
 	if (rc < 0)
 		goto done;
 
-	raw = (val[0] << 16) | (val[1] << 8) | val[2];
-	data->pressure_raw = sign_extend32(raw, 23);
+	data->pressure_raw = sign_extend32(get_unaligned_be24(val), 23);
 
 done:
 	mutex_unlock(&data->lock);
@@ -502,14 +501,12 @@ static int dps310_read_temp_ready(struct dps310_data *data)
 {
 	int rc;
 	u8 val[3];
-	s32 raw;
 
 	rc = regmap_bulk_read(data->regmap, DPS310_TMP_BASE, val, sizeof(val));
 	if (rc < 0)
 		return rc;
 
-	raw = (val[0] << 16) | (val[1] << 8) | val[2];
-	data->temp_raw = sign_extend32(raw, 23);
+	data->temp_raw = sign_extend32(get_unaligned_be24(val), 23);
 
 	return 0;
 }
-- 
2.43.0

