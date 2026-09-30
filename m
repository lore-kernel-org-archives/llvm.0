Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CD53BE659
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762528; cv=none; b=EoyoZZQFVv4jfO93OIt6hHDyGFElDLjX5Ji3QdC3fjM7sNZMvwH4poh8t/3VfJvBUeDMVWK8flHzUoF/fPxsLyPensw64I264QpPq+jWOZH2G9ikhhJ4VtID4m/+id67orTIj7QslGav2b9JP0QsIZZ04sJ9Z+WIoikFvH73ilE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762528; c=relaxed/simple;
	bh=ArVbgSqduACOmxfcVTHJQFHzScRMnex7G2M+AqLIu0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eA2M78rOKv3H79ZAvABoonI/xigtzAY54w3gd1Sk7zhgtJEbgu+cryrOmP0pkSDmue8F0P6aZbnFK9ZDFBoYhV7ByNJEVwP6mukWwaKzxnB9d/gJ0MJOE7f5yb4i0JnfOsVoRMM7b/PnJkzY1AokwW0Shu6lT37K0YDIFGSdoxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njJ9Dmx0; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njJ9Dmx0"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eb3a9d9bso4641917e87.2
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790762525; x=1791367325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPEyYiVpY7sAQDhgqXyYJbjm/viUGjaJIIaZNqUOais=;
        b=njJ9Dmx0DSbSR+CXMDiwnbunl9UFWlUWmHayMJby2qfOavzIfQEzhpPoSDPfycFjOL
         58vvrIQ1jlV3sqLJXV6sIlFgKC/gVcKZu7G90F6zRA5A0VRuuN0StMTv4OWuLMZqYD7u
         faqtY6j0kjR0MY+FWZu425PcUOMhFfoV3eCQCKHtV8fksLC6lyvfiDrT7YFwb4P7L6pS
         YJ7867RqaheK8P+ZHrTCvD6Fip8baQ6hp/tnvVd9Xaoyyy3r3n0L1l92gFuTgwpeeOcU
         t3/WU7VBR/z41LS7mjq/U5EO9vV+4hS2IaqrlW2xIjZS3nJr3p0K6Vo13GuGNi0qDOv1
         ookQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790762525; x=1791367325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPEyYiVpY7sAQDhgqXyYJbjm/viUGjaJIIaZNqUOais=;
        b=XMiMwLuCjgnkL06GPPzM5VPFSuH6W3F4Ge51SWGW4eAjNVT4QS23TQjXmkMlAdiBOD
         xY185/JFzo5nkhKyHxb2JKtkovZpTW5D2GWZI+0Y7ybM6JcDhtpxn+UzgsjlXnVt8L6F
         qqOlbPIIBQU5iLDyTJW1Mg3ORORsnP6HnbKTpVa6yaUyoniaNMWsji6QZDicdJH70ZjB
         AX2/6ZRKcbZHFtQAUiX3A5+fgiEnRlZhpPHLIQaJQazTzGgL3eulnKtuJIXOO2hlf/IN
         hi6TS3MKshhKbUkjpIAjgqSOxlUUtT3KFqmdNGt+FAZmjDDrcPiyiCdL0ps+qNCTKWSb
         H9Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzJiNww83yfs4c1QSoRz5MU5Y2UxlqCyUF/l+p7Gicc58ZXFeuLB6ohPItmbJnYQBcv22e/@lists.linux.dev
X-Gm-Message-State: AFq9FYJpCOu9Kzrc+XrfJTOPK1A6ZxPSKfTW4/9n6oj2uGW5mXG5XKM8
	i6C/20dADROl+4IxfSVaVhrCQSWPvKYtroMOQnLaWwNfxDNbYwYDLQoR
X-Gm-Gg: AYBFou0bVV3IxwlzBL8/djYH0Qj7r9ukZMK1vIMfEokndQyWWcCqz072zn3QGOE6IoI
	d8RKm0hyeDJBU/OMpYRWXx5eR38i2w9uNz0xmOT7BRWn0xCCnfS2fqnYiOaT2lJoJUSpnE6mZlP
	+YsYqzlqj8JCzhsQ6+qrhiYjz2V5//ZmdeC3pgnSK1B55IpRAUMzNoP+1AyJ4jK5EO2l5ZKf7Pk
	1kWo8cUSUR7ks75d6UfCBmt67bwtmHybMlkNT2yGRElMcbwFIh3r0wPalDBM5lZVG29rZzYE+s5
	csW2FU8iUmwwwfJOeh4hvwY1s44372y2ZT7ZZvp+tKNg42clXLR44AOaqCTUai4LCdnurz/6cqn
	oDFpn/8XZUd7/zaz7fvP4V89qkbrFDkPqekdY7UQAOWpSvYJqZTxQVNDU4ysO1JBt1ICwWNtuL8
	cHop2kPGHipr6omaNawVUAK3NjQfqM0pKnG991FrSCMZYgxpsmJsJnlCK0swxTTHw0y+eNh1Kd3
	MI8aTIt0qyM0zQJZbN6SfoHeAlMmKLkm165qxIbGBVs52vvf31jghBtJv28h28RzF9Z2NVbHP1U
	F1yx
X-Received: by 2002:a05:6512:3da0:b0:5b8:f3d5:f2fa with SMTP id 2adb3069b0e04-5ba4061343emr433495e87.56.1790762524559;
        Wed, 30 Sep 2026 03:02:04 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbe6c06sm240422e87.22.2026.09.30.03.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:02:03 -0700 (PDT)
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
Subject: [PATCH v10 0/4] iio: pressure: dps310: hardware FIFO support
Date: Wed, 30 Sep 2026 13:01:54 +0300
Message-ID: <20260930100158.957977-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rest of FIFO series, on iio/togreg which has 1-6 and 10 of v8.

Since v9, from Andy's review:
 - patch 1: include time.h, one continue in drain temperature branch
 - patch 4, new: lockdep_assert_held() next to every __must_hold(),
   including 12 in applied code

Pressure overflow fix is now at v2:
https://lore.kernel.org/linux-iio/20260930085819.886339-1-zoone.rupert@gmail.com/

Retested on DPS310 with BeagleBone Black: buffer enables, flush race,
bad held entry, temperature-only capture. Lockdep asserts tested under
QEMU with PROVE_LOCKING, including a build with a lock left out.

v9: https://lore.kernel.org/linux-iio/20260928211127.641828-1-zoone.rupert@gmail.com/

Rupesh Majhi (4):
  iio: pressure: dps310: read buffered samples from the hardware FIFO
  iio: pressure: dps310: derive the drain interval from the watermark
  iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
  iio: pressure: dps310: assert the lock at runtime too

 drivers/iio/pressure/dps310.c | 449 +++++++++++++++++++++++++++++++++-
 1 file changed, 439 insertions(+), 10 deletions(-)


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.43.0

