Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B3147ACD4
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 19:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057019; cv=none; b=Xm7wXKptI6ndOCDKu/iCNK4h/zqjWYHWT5klVWWseEQRlED28mAgVbItkgZFmATKvmhPBeWxLInIOpZAqtpmMcMvZPMKVbZXlS2QGv653Cgaz+MI/RxHAkWaoLi2KwVNeLUSL5AZodQByu+7QJiae9m0qCWWv9ESDfWS3lv/aI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057019; c=relaxed/simple;
	bh=eeV3CiqVqLEdOwuQRHoVaunyWI6kSVjOdbtx1bppoXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mg3dI1E7itQO5CY/VqNcnHvsk9K62alyprSlyK9Dc7Z07NTvYYSh/S6ZwVCwFn/DIqS2nOpkOrEw/Q4qKTRMtz/QaCCSePMdXz5oijXwpKMqPPTqfKvX1ZUPwxha9TwqIxT0reNzLt0LhQtaHvZd8QUQdTKmJaHT/hvESjyGciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZKkamzA; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZKkamzA"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba418c79ccso299040e87.1
        for <llvm@lists.linux.dev>; Sat, 03 Oct 2026 12:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791057016; x=1791661816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xA2NLj6ds9nMunLFHFPpvFZmRFdu7AG9PlEOdmxqkM=;
        b=VZKkamzAalNi816RFE1iSr6TXxcCdVBQfetvoJJU1kEk4rnj/aMumhvCw/8RbaxdRh
         WSP8+b6Fy52RbzOBN4mk9CXJ8FD4o24QeBkmAFJLkZFCr5zvZw4JzZ0Y+mihuBhwttI2
         qqRfZRI7RREtrQlqS7849FG74an1QmQOOfGLiO+DgIVrFviUSrhwmWpKwnKlMiRWE26Z
         08bYA/pWAnXD0/Np2sbiXbcPHkNSz4dnBaxa8mzFu7InMhkw8OY4O/7XyHZq8IJ/EwzG
         lXetAKB3HrRBHXZ5PSaZqLz0W203e3XIaXe7na8h0S3xDsy1p3k4VmvuQ72w69XoS2qM
         hHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791057016; x=1791661816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xA2NLj6ds9nMunLFHFPpvFZmRFdu7AG9PlEOdmxqkM=;
        b=cSF/7EKOU1ktSwCAZsH2ROep36NQvdg8ZMHYkgUeHDeg2IkXCH4i3O8JimpM3vc+PC
         A4DCv5B8ctPZ6mj/78FbTl50K7kv2bcB9Y8R2AnZQcWSd0PMOIoPM3Se1Jyrll4Y/QuH
         /eo5qadtaeCUqzHNcRuUr0YZK68vU5lXO1SlHLxbnL4XxxA9MXF1J0a7q0ZTfIVJoluD
         PbYRlXDaWuauHxdWkg62WTXwMHglkhSRSlSAzS25OIGwny1pDclMjBK1H5k/uihOHnIT
         9t05LvGbFqR0G+PPHDm/O1ykECjUAv1DvVs69j1aVtbc+ugb/5//XROA/GdKVE/OpWbs
         ckGw==
X-Forwarded-Encrypted: i=1; AKwUvBwpZn8GnV/MkEpBihCT3QwaOrPNnGTWY8+44QTeicOoZ4wGwF0FEC7w60MFGAwrYrgszPPO@lists.linux.dev
X-Gm-Message-State: AFq9FYKsC2sSYk8wCxHD+zMT442ny+2MMeM9Fy/3hvDgNCF7oDdSkda9
	KgRiriRTFcKx5hPvTDs9CHA8DsC6+tnpAUHxP5hw94uboVcgiwjwoQ/3
X-Gm-Gg: AYBFou1KTzl3Jk4f1wOA44ea8H9S4ixBElRlyLDg6tmH49/QI/7vtGKW0zKuozoIwj6
	RkJvfFthp0SKEviLpxrk/rd5gFpvWVRNZyzOO7eLQVoTEqwIQD1ysSHybVQ9cmXKrBGgBRfBxBk
	njRnxUcUGNSuIQ4dDUvXruGwgoxz0HdxBhwURaUiPYCon6BOVIlo65vZDAWt1iPi+oeQkt/j/Xp
	Nb2MhvM/tfuZnApcwF2SmDgpxLmVYoAtkrfnw0MD2p39tP6nldYDpNYO86+/6tAQvM9WATCXLX5
	CpTP/Q0k3CMzwQ1qWYfefJehJe3PL4GeZOFrM8rXLQrZdFdaCqCbzE8aGoTeX1qS2eN9vz1UXDr
	CZChhP5/BelS6OuTrJZsk+CW6xee79sRJZC8q+vrl3UFLliqOMPy18GMdag1NrsFYOkyVuiYZ0l
	i+QH0pzsrcnksx892NdLAACAMXvC+ayQGbO6HXXTuxIjF8BZLo6cf0PvSSRKgVCcLYxaWGqdmWZ
	1W8PhzS0c0BaSbT22IPQ9CUo3Mwak4UWcsfjT2XB7rvKT9dVNTb6pQ2zF9jI+fHGDbA/1E=
X-Received: by 2002:a05:6512:340f:b0:5b8:f333:db97 with SMTP id 2adb3069b0e04-5bb86e73f99mr2404170e87.0.1791057015678;
        Sat, 03 Oct 2026 12:50:15 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7abdbfsm1762608e87.65.2026.10.03.12.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:50:15 -0700 (PDT)
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
Subject: [PATCH v12 0/5] iio: pressure: dps310: hardware FIFO support
Date: Sat,  3 Oct 2026 22:50:06 +0300
Message-ID: <20261003195012.92948-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rest of FIFO series, on iio/togreg which has 1-6 and 10 of v8.

Since v11:
 - patch 1: blank line, Reviewed-by Andy
 - patch 2: guard() in postenable, setup moved to a helper that kfree()s
   on error, scoped_guard() in fifo_work, loop counters in the for,
   ternary on one line, two comments trimmed. The first loop in
   fifo_drain keeps cnt outside, it is used after the loop.
 - patch 3: signature wrapped
 - patch 4: drain comment and commit message trimmed
 - patch 5: Suggested-by Andy back, assert in the new helper too, still
   optional

Pressure overflow fix is now at v4:
https://lore.kernel.org/linux-iio/20261003185716.32732-1-zoone.rupert@gmail.com/
Patches 1 and 5 conflict trivially with it. I can rebase on whichever
goes in first.

Retested on DPS310 with BeagleBone Black. Lockdep run under QEMU.

v11: https://lore.kernel.org/linux-iio/20261002072526.250081-1-zoone.rupert@gmail.com/

Rupesh Majhi (5):
  iio: pressure: dps310: use devm_mutex_init()
  iio: pressure: dps310: read buffered samples from the hardware FIFO
  iio: pressure: dps310: derive the drain interval from the watermark
  iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
  iio: pressure: dps310: assert the lock at runtime too

 drivers/iio/pressure/dps310.c | 441 +++++++++++++++++++++++++++++++++-
 1 file changed, 430 insertions(+), 11 deletions(-)


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.43.0

