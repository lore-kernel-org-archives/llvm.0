Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA87430305
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925933; cv=none; b=AvzxJ+9lRuaHeKKyo7BpAf17tWjcTETu/Pxiwpap8JlQDPfVstJ5mN87vZmESFmyXxjGamLxxQLfGJ14SVBblYiWzwtgS3drsUQD+r6ZlXUpA5ag2vfLxWEABLKeSDQ74jdnmcutivScx7tfmZRbGYy59Dv9NbTk/MlUccbAqPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925933; c=relaxed/simple;
	bh=FGNpQ0k1f6g6f+/w9U0t9YLOi6n+7uAtJCsAhAa80EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hndd0ip88SMzAd3C4RmCmEvlhxQxy0Ahi+DDiANlwxx7lBSK6Dzeu30XAIBTUX8KJbuLGbxfRgU8LgvPfpvH46YCE23rLgPrwmEs4r1qO5hGqYbaJBchh7fdn/fbejNFiqyAD2VhAgcEPNr7ClVU/pT/VLk5Qdq6Iour0st/rGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzLiCFfz; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzLiCFfz"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a77141826cso25617791fa.0
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925928; x=1791530728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7/xBuOunV9HtMjo4A4DjKBufd9dH+BXioKMJcmPy2g=;
        b=BzLiCFfzmZDnwRadNklJXlh1NObyAee529FvHGWmL8hI0R1LTsAAr7vs4/mBCF3bIM
         nBwU52rzFpJVdANUCTgiNxOc3tCTFYhU3vADXH1c7duaFcgmK1vbsNbiEVsEv1fepwjd
         mShVCur6kf2NgFKCRARHJSuTcXrMZNakwEhp+TGeDyexJ0u8lw+wLIwxB06xZLxEEaJU
         HFubzFhnTS5qDq8YtrEzc3JditxyP4Rw52/tcS3AmRKw1Hgjl668xLVNpGB7PV7fZfZw
         nQy6AKVtCZIJU1aTiKR3JacxrEpHf5IKtz89wMBVXc6qeEEiDjDkFuRNByaVXK0QeCYp
         VNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925928; x=1791530728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7/xBuOunV9HtMjo4A4DjKBufd9dH+BXioKMJcmPy2g=;
        b=eGqp//o/RhC9VGeJz3a5zifq3U537OzQ33g37d1uAxwokNmqRHUsdMSv3GkdU3cvmk
         aU0dCh1+AT04ot7oBV21jG4g48che2dHw7epfvAq2ixtmXv9jZQoC+VPEYSX0cnYaO+j
         uFBPSmC+4EFsD4LwBgSyFaURDFom9si5pIKXSVfGpPxsPbZopc13j5Xt1VS/ME/wnggN
         6ppbredeOKWgTxKEC50zGt4xpC5U7W5BHHuD/rAflWTmqGJy4Ra9ZlG2lzaC+maHqkc9
         LT/9P5XosHq9jDtQU4yFqBjSqN9WNPyfatzAIdzBxbG9/9nYtHFiBMGrt0Vi+xVSRH84
         oLAA==
X-Forwarded-Encrypted: i=1; AKwUvByBi2T7Jwo/saqP/FoLSe2IOcl2WRd5n19PqTaKOu4q+PvUiA/r/PNRTjziaVuv+IduTE+E@lists.linux.dev
X-Gm-Message-State: AFq9FYKZYs+q+4EjRKlxA8yUiLHJOrcLZxUumLkxbK79a/YW5TrA7C94
	nM2N5ZnzFesC/GBU9+iGj79aSjTidfAJ0dlLG91pNxT5IsKVcIkwjXD8
X-Gm-Gg: AYBFou1KTbjdhSDUurCRZS/qpbcbQv/GPLNDCjb/FYw1Amo94TEUGZLX36b91VQIsCD
	nFfYYWLqosrcYkuVMxRbto8e2nB5H5qtG6E1FaAVRbKPrdv2jjo8KxrMsHq6xTchHuKmrMy1HsQ
	01njTvOcJ1cwAGXZ46h3BYvI4VDgEqCak6G07lIVAWndDE1ggxtg/hN1P6JevtapjTQpHwOw+Xa
	Dgaaji6+RI/tinSUHuIkcAMYkUTOKLazTWz7h3PBOOPhXvLfjNTw21RNrOubD7JaNr7HHrk4JZa
	3F7TH2um7gpagFACwpStOCjU6LoZCrU1sqv9KmGifvV41BMNAs194AdOTIJM3u9LblMGtCqbg0O
	fsEvkDjgCS/9kekeP1xaeYIQAiv0So1gsCE6h4OgC3oU7Q4innTqHhq5mBOVZrUJeT7NQJC+Anz
	cTwOrv61idyOh01TbATkghtQo1yaiq5SvQJcJx41a0yipaL6c+5MF6KrrCJjx6CG+TOuTfjceXQ
	uOf/4CWvJI2OftpvWHBoJkosS8R/HjYPPpG98bmQT3Xc0mxWyQdIT1OdN6dUKlSmwxLIQ2K2dHh
	S6+u
X-Received: by 2002:a05:651c:3059:b0:3a9:6f4d:b345 with SMTP id 38308e7fff4ca-3a96f4db5f4mr514611fa.14.1790925928336;
        Fri, 02 Oct 2026 00:25:28 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:27 -0700 (PDT)
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
Subject: [PATCH v11 1/5] iio: pressure: dps310: use devm_mutex_init()
Date: Fri,  2 Oct 2026 10:25:22 +0300
Message-ID: <20261002072526.250081-2-zoone.rupert@gmail.com>
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

Destroy the mutex on unbind so CONFIG_DEBUG_MUTEXES can check it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..f7265df2fcb5 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -19,6 +19,7 @@
 #include <linux/limits.h>
 #include <linux/math64.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/unaligned.h>
 
@@ -996,7 +997,9 @@ static int dps310_probe(struct i2c_client *client)
 
 	data = iio_priv(iio);
 	data->client = client;
-	mutex_init(&data->lock);
+	rc = devm_mutex_init(dev, &data->lock);
+	if (rc)
+		return rc;
 
 	iio->name = DPS310_DEV_NAME;
 	iio->channels = dps310_channels;
-- 
2.43.0

