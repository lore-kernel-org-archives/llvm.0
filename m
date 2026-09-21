Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64694FD280
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015505; cv=none; b=aHzSNmgFNQNi9fBpTciA8lq7XRtucq4us9UfuhJAffD5bfaPZcEsYCC8kw+1MHG+3vBuzmoI266BvPFxJmG9aLRd5KtnYZ+vOnGMcFnUVqt402JKtBQVoVSLy2pQQK2QTajr0RfPnkZS7iqS3+Wx3sRmu3LjFWv7sJJ0ODvJLAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015505; c=relaxed/simple;
	bh=2f3W7ewvZD9vQ7bzg12iNZ75xkP2pWmWjFYvl7E8R3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmINCxSMlXwK/W/q0mxkYXvzdXShzG6ibsUotvJORrVBEwteUXscLkiXYk3thSxOccL1DaYtqbWutqCAXiQ07sxBDDOOIRSbK6S/CN8S6aob36x6NPTXz9it9DJNA7qftjaH07Tz4juJUZmdFdwm0NPVMh9xbXsf5uD3P38qHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGHQvKwz; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGHQvKwz"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso21857461fa.1
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015501; x=1790620301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2j1Tv4agtRXuOvbEOgkc069No6p6dhHi73ng2NMw2ME=;
        b=WGHQvKwzoaR7RZBtM0ql3B+sdwxE56g4XLAvHAJaNWy/GW5FtAKR9K8MU8K7WmzZoW
         WGmFXu+6EZgMTy3HdOpmliIB6yDUM9OGNjZUSGqjiUThW67cM/cosWiXvqKQBuua75S1
         uyd03e/BojUaN5859rbUZHIDDMNVtAzVtI87wmGDPfq54dA7B2+ezjhSMtGAtL5a+K1K
         ejXm9uvkuRNpb58nfR5RWyI/Pf9dQLnq5ixegyducPIr0KyfCih2fpK8rPyDUNyUWrPB
         BYCbjy8Nf7GNfvmNJLAjEORFCCm5gVvVIkJNi8LrNSd/PT1zgH2KnIofOjX2k8gVRBN7
         8BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015501; x=1790620301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2j1Tv4agtRXuOvbEOgkc069No6p6dhHi73ng2NMw2ME=;
        b=NoJ5UOgxafAYdZAxqWIOMyMr3+0Kceu5/VLIlWpzbCWxdBuY6CEwsiyr7AspxTUl1V
         r5JjKvVROOw1/ouHVD0pJTWzRV4hrZIwAWBs4S539VMo9IdbshfKqdf8I9OeRfUBdaZz
         Hd1yoY0fcY8SCs5AEVFjAxixWGDirPzPqoicEW1uRhbn09bJH4Du9nDgeuPLwROlpmbx
         8p7YCNyjAU1jFP/if4gGJWOuoE+gKopRrhvqIZEJq6ug1BhIJoqf8jT+xsWo5EKhNP/q
         1R0URpYdNIo9bLDTdhxHvZOVpxWURDl+nGGMe451K17PZMEBESB0qxHZDp22wRZfxjNo
         jWiQ==
X-Forwarded-Encrypted: i=1; AKwUvBygTPTDhbyPOGv/KPSrv52YUPB0byV/ZDNB802PtwJSnxg/sJfqwwTNhjYZgH+ZQAikHGK2@lists.linux.dev
X-Gm-Message-State: AFuF++mmshAFFi0HG16NrAaRHk0fKg15a96j1SsBtTUI6o6NH8R11t+h
	GDVsWR0DvDY31xBm/etzZCXdcpkVwdd8vRxSBxmNEOGJ/oj2NE1ZJnbG
X-Gm-Gg: AYBFou3a2PFd6jaEu+GGJ2+kRNR1cXERm+Z9ljOrXRVz8JdlQPoSlVrzghzYI/YmF4G
	VCdN0t50pBtcuWHfR3JnSEYsgLQA+j4rYMT/rIf9SCi3rjZNogqX1KdEdCUMMIBX9quadT3ATSP
	l86UP1nuhwtuPkBSvhItSkc7p2ARhTjp2zIGgf+7+rJLs6V9Bt/d6G0mTbFhHglTIaqnOm1W5sY
	30vKDXuv2hg8TLIce+2exM6gS5BXBKrGvC615uQSaKgBxc2CQreXFqRzbFW5tptMiLzVcKJIHv5
	wQrldCUDrKAL64MIC2l/PfPdefa7eSbtNNti392ukn42XO3/6lZEtpqpZNjLIO2HB8JwIfU1T9V
	x/BbPh6rLBCPfzs6mMwRVcj3PuF9tVAuOnC0wUwnZOLh7xTTkNlVMhiOUGNUu5RAMBHIeB28rtU
	xZGsCEc9ff3KSGXlQ7qqjVOG1SsKuYgl2MbFjWDsJF7E5J8wlDsij36JmAu9ddBtj4VgOCO8wnO
	dpzOebo4/7BviP84oFXJLriIACvH1U1265Wz4mbbMfD3pO20axVz0Q+1HX3r4K8t3AWaQ==
X-Received: by 2002:a05:651c:1508:b0:3a6:74a:53cf with SMTP id 38308e7fff4ca-3a6074a5560mr19625551fa.28.1790015500539;
        Mon, 21 Sep 2026 11:31:40 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:39 -0700 (PDT)
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
Subject: [PATCH v8 03/10] iio: pressure: dps310: use get_unaligned_be24() for the 24-bit results
Date: Mon, 21 Sep 2026 21:31:25 +0300
Message-ID: <20260921183132.233136-4-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921183132.233136-1-zoone.rupert@gmail.com>
References: <20260921183132.233136-1-zoone.rupert@gmail.com>
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

