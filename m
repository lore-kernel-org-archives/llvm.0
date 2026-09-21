Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745614CDDFA
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015498; cv=none; b=Kndkp45GfEGC78lB3jV430KyRgwcmaBPDEMOzW1V7Wr4mXsMX4njNNRMLryV+YqBiLd9TL3BXbHWxuruql7rhjDUEBiZV9KpQ+navEpBBTLeOhJRzLK+fVSO83+k4W4ss/i3xxWh6pElE+doXifjd4PoU3EXn1T3Hj+r55xewTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015498; c=relaxed/simple;
	bh=yLp8lkrNj8/Ef7uLVEplyOWYdw/qqWhTRV1VUGljIY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ABsqY7zoz3XoHdOn5+EoNAhtonqFtnRp3EhGP4Dj8xex+2/w8RUKEtVQFRtUgIDcwuqNfZITPXaVXBoHkZiwgUYTQv60YTuutOecCahMTRwUW4UQiWavICsA5n9dfNeymvLUb8TEtweuuN29NcMrX5AKhhGZR+5OwDN7f9xgoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKDChJJS; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKDChJJS"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a47f740839so27866871fa.2
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015495; x=1790620295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0llHZI6UR/HQTlJ6R42f57JuOnDRnuq2B34vI1wLEFM=;
        b=PKDChJJSp1RrTT/V8OS0W2tRMMlkY87GA5TcvMPMe33iQbwDAf36pEBBWs9QBAMVZn
         nHmaFUBwWJrUYWj9FoPeZG1RTed/rVvYPRYiqoJ7HA5HYnRDQ1Q83aJx5pc3fYUcipPx
         1OuDb3P3X3+IThQZkPJ5lMXgvkztpDRkAFacw0PhW1MSKImttCVOQa+63eQ8XQtiAVYX
         6/6mXm1xtLO/yq98901CrulsM8ES5BpaXq6Qfqx6HATALkrmUfRf8jTM9LSR2nMoMD3B
         uIVQbhj9TzJAcQUhvUYnU8dBSiGKW0z0q8+mhfkZKLx2jzWxzm7RJ48Ncx6zek1EsUE+
         68pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015495; x=1790620295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0llHZI6UR/HQTlJ6R42f57JuOnDRnuq2B34vI1wLEFM=;
        b=qWmzO+d8ReFLqzoXkgzqzqdHbVakYZqcRYaoApfi9+bLMvHD4QZzAVpmZ7g76zVAvs
         Hg2Uco2rNBZJOa75HaMORZ5bLYxXC8x0WbJdjIqpOIg1V69zT7ukqLLx2hUTdTFU4L9o
         ZmSKhNqu9dexoIpcaAmJrs37uuj7fBvzhvT6Qn2RnFkednEMzDMWG+VVb94Z4q9MReYF
         s/7ZcQSdw2GUdoZesNZO5TMqDzTrDBi108cO0e/O7KZygAYjy3NgNby4g72vocIiSaFn
         Gd6pZIi8aAHRdt+oX/QeKgZqxDOk7pp4TTkW5448HCeKHh9+df9oAS211aSyNj8Zlneu
         is+A==
X-Forwarded-Encrypted: i=1; AKwUvBxJrOFVgBHlVLeb5jC1/4oSxSfgAY4y+cZJejINGr93lSzFT7b6WJ9pQXJDI26Bp0wrytER@lists.linux.dev
X-Gm-Message-State: AFuF++lyGV3qk9rDDGTL3G8lZYOFBr++mVnZxcx/fVZ662SQoCTXsMvR
	1tAlj/h+ZgIWUUZDARkVHc3Gy5MmhodrF0qLIprqRDij//njT5+v7l4d
X-Gm-Gg: AYBFou1eYA+QuNE6w8Y/+h1oF/4kbqesWCBoo+aneAaWcQ4pC9IFjilfSu/py3e1/6L
	fkWsU3Y6OgUp/Ugp4BQZJQXbKA2bL6NqRFxS98STD8yfR/9awBSAu5vlWjZ72VICw2RCLSU02Aq
	BZXAo1WDo1EnIsDksQllmEOxzR6KUvx5ygmzAnug72Ldt+Dgt6vipQhzzoupj2zSstfnTprli3a
	cH/jBE2rQQZiZQ0npO06P3EeGijNCeyoA4QlzI8SUtyl49PxQglY9wa2/aSVShMPE2NdUgX0mZY
	RUTh00cECJ+zj2en1uDn5E+v7iTEygIXpZboaoozjOjKYYeALQLcAN0shzppdtgx+llXuknRjN4
	eT3uJMKwZtuBC+hu/a/uDiHrb9sAGf03t+70dqujh8a/MZkd6ioIYjIdKiyVDjdqERZfO11ejUs
	OyzvTOWDy+MLOvpzSvv/wyI3DVd0jgdIuC2yHp+pbORFEpIzS2p8uLdsiBvv9QWvrtjl5VuLsTB
	bvni+u2KikZMCI/YBbpAd80cByUW15yBTrrVdiKfhKxBRT23g8WntsB8HaDX3gK6x2ffw==
X-Received: by 2002:a2e:b889:0:b0:3a5:fe42:8c9 with SMTP id 38308e7fff4ca-3a5fe420e6emr24210701fa.24.1790015494952;
        Mon, 21 Sep 2026 11:31:34 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:32 -0700 (PDT)
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
Subject: [PATCH v8 00/10] iio: pressure: dps310: FIFO and triggered buffer support
Date: Mon, 21 Sep 2026 21:31:22 +0300
Message-ID: <20260921183132.233136-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Jonathan's review fixes on v7. Same functionality, except the flush hook,
which now holds the device mode while it drains.

Since v7:
 - the timestamp scan index lands in patch 5, where the enum is
 - the FIFO drain reads with one loop counter, declarations split
 - dps310_fifo_hold_free() is gone. It was a bare kfree() once the
   clearing went, and the alloc side sets the fields instead
 - the flush hook holds the mode across the drain, so a concurrent
   buffer disable cannot free active_scan_mask under it. Found by
   Sashiko on v7. Done with IIO_DEV_GUARD_CURRENT_MODE() and not the
   buffer mode claim, which patch 10 warns on, see the reply on 9/10

Retested on a DPS310 on a BeagleBone Black: six of six buffer enables
produce data, and 64 scan reads come back whole at watermark 1, 8 and 24.
Built with clang 23 and CONFIG_WARN_CONTEXT_ANALYSIS, no warnings.

Patch 10 opts into clang context analysis and comes last, so it can be
dropped alone.

Deferred to a cleanup series: min_t() to min(), 1000 to KILO,
30 * USEC_PER_MSEC, David's define sort, c00/c10 via get_unaligned_be24().

Rupesh Majhi (10):
  iio: pressure: dps310: fix CFG_REG bit definitions
  iio: pressure: dps310: use a local device pointer in probe
  iio: pressure: dps310: use get_unaligned_be24() for the 24-bit results
  iio: pressure: dps310: take the lock once per raw read
  iio: pressure: dps310: add triggered buffer support
  iio: core: add an accessor for scan_timestamp
  iio: pressure: dps310: read buffered samples from the hardware FIFO
  iio: pressure: dps310: derive the drain interval from the watermark
  iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
  iio: pressure: dps310: check the lock markings with context analysis

 drivers/iio/pressure/Kconfig  |   2 +
 drivers/iio/pressure/Makefile |   2 +
 drivers/iio/pressure/dps310.c | 726 ++++++++++++++++++++++++++++++----
 include/linux/iio/iio.h       |   9 +
 4 files changed, 652 insertions(+), 87 deletions(-)

-- 
2.43.0

