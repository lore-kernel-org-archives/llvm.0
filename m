Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11794ED188
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734336; cv=none; b=e4RAaIKNcAvxp4s2NAJWlTPS/ba0aR93p54NtNyi7vJKKVNXiUOjwZo78CBawOdAtdzT9BJSeqZrizxyP8nKQX/B0brf90b1EeZ5yuymuUk91HGtt2WrnjqOntR8INZ9QNkfKdH5VqGJj3Qz06BMi82gVmQTBXZdRQ69cUjXJJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734336; c=relaxed/simple;
	bh=LqBSm3USoMc1NhaRdGxHYrJshaTcBLFmk+HruTyC934=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NetdDWcSw+DeL8pNTkQW423JzwSN08iHdE21M3y+//RTTGKGEbxRYnIoy4KQvGr0vplTdTMtV2ZKNRfMs2P3DeQjKmaKuOGXRxVM/BzdySpf7MxTv7xwYWIuskM64cDxI2TcMSRsouqFu1hqPxbK2rm7YmR/UFKFRwvO/mGyMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz1UVWqK; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz1UVWqK"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76462aae9so482107e87.2
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734325; x=1790339125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl5FK/P0IILzUPHeJ1tB9KQK9WXKF1I6DTxx+ou/T/Q=;
        b=Xz1UVWqKEmQXRUkxlXG0WyHnlUlfr3V+kmP2n+cp/lZ2+AsT3YYfo4sJDtn9zm89tt
         WU+Q64HDtdbb1XCPFzVduVms1PBxvIGY/FAhKOXvDXrnMjJfJrVjTRZDChqf+GONvgTO
         82ybGLE8SsDSbuKxGLLB6Osf3GkRFJEZD+Z7DSW/+Z+BDZ9MZA58l4Xydd24cxWmyDyf
         +wTmki6z7s03UzrbyY+jfTXyefWoWKyWYlGq5PS7SuNYhAIVR9jRbjkFkwz+6NQLOXP0
         1YhQeRKDKfza3zLyvXzN+dFE2ff/5YTUwY+G0NZX7vdgdOyS5sP49FK3ZpnRaMnLMy5/
         jPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734325; x=1790339125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tl5FK/P0IILzUPHeJ1tB9KQK9WXKF1I6DTxx+ou/T/Q=;
        b=gO6SR8ic/jjRu7DvbTa5J/1kVapYZyzzsPkbw0KYhmVHOejU2TBm/jzPJY9hZ+05V1
         2W9NpnUfndHk2DngYYi+A55qfN3cQ26mhetIy349G5FR2FO2ugV9kM3p23/Jsxbr9Ylv
         huiyklWA/mYjukzrxw66XmIAe5kRdY5m1eT9bwEZ7qXaEB2GjQoxn3T8/d/N7j+/NW9y
         crTN3iJuY4SIAK0krkDK+GIzhcMYai3gcrQuf3suLaO0aOdS/HAef9AQPE4b9Te3+2cp
         Rce8AvtU9yjGQ7JmCWPgC5aZRyZdowVXRwVyusRYpQezGh7aOO0LdMj/0n5yUqWF6Ydg
         9A5w==
X-Forwarded-Encrypted: i=1; AKwUvByJI8XW5EQtmFV7QlykDs1PHewcCwhu/DBTayzpBQl80BUsHDEimkGxA6oFP+QQLkL0sX8L@lists.linux.dev
X-Gm-Message-State: AFuF++mDrwJVpsHgcvruAlyL85BVc3pXBsD2lp37vqXFkKUEXkDxhvLi
	gmgpJjQWO+XXgy/GeCESehB882FcfbMk2SDhfxDtnr/EsRoE5uSZ//az
X-Gm-Gg: AYBFou0o/nnDsN1+npe4aVEGN6Sh7bvm+2ZR45jZXtLFLZjCb/aF2SfeFStRzXPQ5q6
	d/mGgcmYUZu3qxnz0tOIBWjV4gQpgdQHuil7AsEEv76k9nc7DdqnF8smd2mTTGHgm7V4EARWsW9
	I/qWiH6CVs46OyZmem3ahOIQ+kj0kwsviQatKexyJx8bZsvjgbuJTFaoRPfDbAp4NwJvxgRZmDM
	LLr7VXzLJTWiPkPWXmOxdXYicLMq8ZL4uGsXRecTAhUJKEjpOFppIrGLBuaDogYxiWfFjOcTGgZ
	/ibM8GvKfJWeI0tR8jE7pMKafU9io3lqG5h1nfXaYuCf7vz6VXi+6pPXKON5xB25Lvw1v2drns/
	6YAa31HRA4PqTRF1ELR9F2SX2HPoBiAaYij5HxerPPnfhrEVz+gst04LK5sX9kVCNrhkZoEVeav
	dJlnhfV/C/9ynZ0RdkTDFF8G7mMder7BPT7yKssPHYw6xA5t2Pbc9gsUJ6v3xux4vo7542aoMFr
	5nfRUr+Ln4WxUTdQ7CFc4WUEsEA2X4hOOADr3NUD+X0aOgShGVBdVvduxnhPG8yvXjvjQOhQPj9
	k1wK
X-Received: by 2002:a05:6512:6894:20b0:5b8:b331:19b8 with SMTP id 2adb3069b0e04-5b8c184e382mr435418e87.38.1789734325210;
        Fri, 18 Sep 2026 05:25:25 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:24 -0700 (PDT)
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
Subject: [PATCH v7 06/10] iio: core: add an accessor for scan_timestamp
Date: Fri, 18 Sep 2026 15:25:13 +0300
Message-ID: <20260918122517.377565-7-zoone.rupert@gmail.com>
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

indio_dev->scan_timestamp is __private, so a driver has no way to ask
whether the timestamp channel is in the current scan. Hide the
ACCESS_PRIVATE() behind a read-only helper, the way iio_get_masklength()
already does.

The dps310 FIFO patch later in this series is the first user: that
hardware does not timestamp entries, so it refuses a buffer with the
timestamp channel enabled.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 include/linux/iio/iio.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 989c1db8fb36..a893e36be988 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -1083,6 +1083,15 @@ static inline unsigned int iio_get_masklength(const struct iio_dev *indio_dev)
 	return ACCESS_PRIVATE(indio_dev, masklength);
 }
 
+/**
+ * iio_scan_timestamp_enabled - Is the timestamp channel in the current scan
+ * @indio_dev: the IIO device to check
+ */
+static inline bool iio_scan_timestamp_enabled(const struct iio_dev *indio_dev)
+{
+	return ACCESS_PRIVATE(indio_dev, scan_timestamp);
+}
+
 int iio_active_scan_mask_index(struct iio_dev *indio_dev);
 
 /**
-- 
2.43.0

