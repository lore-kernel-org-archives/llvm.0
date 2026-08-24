Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37A838B135
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 20:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602358; cv=none; b=nscEaQL2xkpo1Qi1ibO5+hmvRRZPeXei432JPZ3XTl0cr5oApjLB5kZX7g6R/zEgA0o+5kIGU8FTKKe8LzXkfnj3VTrvhlrsc/La+0MaK+bekrML8VIdfnXzeStQjERdgYEeiYzlGQBBXdKdcK4JmOsuNmQOqu+Gnc5rgX7PxoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602358; c=relaxed/simple;
	bh=Vv3QUAx6lbwrzeWj5c/NSZu3wDm6a1Gd35SAKG4rXXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ON7jaAoNWivlfG8Z+lbgIwIYsFwa+d1VBxVrOAGaebYKv5j2Mq1vfmrwgPRKR9RDBs08eqn5YOAv2RtJtYBpdnmcM5VrQy/9YVWsB2Dlc3dj455CUMFQgwtJ/I86+EmLTWXaQYh7PmVu5iJ0F2XJL6hNVHft/y2VdnWieYyQhq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nB+/bA4A; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nB+/bA4A"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b45f1cd80eso731895e87.2
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602355; x=1788207155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gg/nMr7TMApsjClnTTTaAGhH3lootDojyA2UMKFL1nw=;
        b=nB+/bA4AvP+5bBn1MojdA1uFPqkT59Lsk7pvWgn47Vf8IJrNNwDwUQI3rCZ5vOhc6K
         GnleftLNHbpu0WJCSDhJKrv9F6UCO0WmoW1882aEIpZcE/L7yQsDfBKnGLMWnb5i7OdK
         q2psg0M4JOVoSl+yct5S3solxeLU9zwLs4HXwbk273xHNYt+bPJRgKkUSoMJ/MaWXb8H
         6z5ek6ndyUoJNaY0r1gQ0sghxo3fsPfQSESdPAMLhvN/nysYhSpT9ExMQuKZYinWMaL5
         D33FV52ewrAKUN3OrYEXLuuhYa+GEYuE7GYnWGjfbpjkbLqW7XcZpxzEPZ5kYKN5tDWL
         qQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602355; x=1788207155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg/nMr7TMApsjClnTTTaAGhH3lootDojyA2UMKFL1nw=;
        b=hqXrjXbLGGGVOSDG/AYORRzlYAWLKjyanKpF4uscjRUk0iRtF8yR/BxJlKd58Jmtdl
         a8BTMyBZv/c++fBj5DeVP7Hpa6Expg3lHeX4r7LVC3vbFqUG669rls+MobBbnQlusLh0
         XYaTK0752jOtDNGH3raThhE9y0f0L+HDJRboanO5WwOIHBSzr85/QDgd82tp2UZEUw8N
         FQHCXUPwDSnnBfDk1T9TMj1R9DAchsxwsWgnVk0zng6NN9YNucIY38qa2TWyftfVBZDQ
         s4YHqgX7gMluaXOHTD0orTM4rXisGYUAXJPwGiPA+9ZOuau/0LkqCnaEZ6i5rrca5ob1
         S9EQ==
X-Forwarded-Encrypted: i=1; AHgh+RrD1RfcrLTyClkxm6JU+q3N5Wscyf7m6nJzaHuhXh2X3Q9JJweWbz4JpEfGL3Jz+rkSiCID@lists.linux.dev
X-Gm-Message-State: AFuF++m/VVNaEAz3azq9MDz48wCQ7qomhgXZNR+40qR1mwP2Gq+vucba
	hEDr6ph2GivEEYi1e84TNmmcaD4fwZQCjHTRZAeugL6jURjjpZbc1wMZ
X-Gm-Gg: AR+sD12/YsL2qms815QZ27nsGdqF7lt9cqMN4F19pbHiWHwn521S1u0/J11xMWq8vlu
	RMUWDY1U7j24IscOXfmLvRsjOXax+hGwP44en+1avneJPnT+0+hwBtsPA9imXSL9Yh+S0bWRmLU
	xkC8AYAH/TY5tNNinrMWGpMs+PqNgkFpDVAEaGruw7AaLlj/euorl1ppg5PjSur7S5JCCtV4zMu
	lPRQD5aE385ntO2JM+11mYKo9kAmBuFlDflflV8zCyc2eEYFblQFdFjcDK3nZwsk1QwZEqb6J9X
	bPd05hp3HtE62NVg1SniCUVANqO+sbA9yYyQQ1r7bqzrMtlgzZuwjiFkf144oxD4RDybKDiZ2VP
	Bucax471f5aVNoZahGzH09e7Dld2L+0yFKnuYXLS7A97rBQbBcdCVIIMqRnCKtd9Mr+kqhPPtDW
	23EhO1cFdTQkIwZiSycLF+AIQWWhKKN8Uf7PiM7vBz7TnLYsLp7bC7PLyxvTviaYM6gX03zovN7
	LMWh3hz7Foo+h4+49PMqOLlb1MRydXs+XCouJSFK/J+YTGYM6od4QlEHX8h28Xl0kAIDD8GuON5
	zcMI+Q==
X-Received: by 2002:a05:6512:15a5:b0:5b0:1551:d85c with SMTP id 2adb3069b0e04-5b48b89e7edmr5887419e87.20.1787602354578;
        Mon, 24 Aug 2026 13:12:34 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce0cd9csm1923620e87.71.2026.08.24.13.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:12:33 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v6 0/6] iio: pressure: dps310: FIFO and triggered buffer support
Date: Mon, 24 Aug 2026 23:11:57 +0300
Message-ID: <20260824201203.396651-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dps310 has no buffer support today. This series adds it, hardware FIFO
when no external trigger is attached, FIFO left disabled in favor of the
trigger when one is.

Patch 1 fixes CFG_REG bit definitions. It replaces the standalone fix I
sent 27 July, which Jonathan asked to fold in here instead:

  Link: https://lore.kernel.org/linux-iio/20260728223009.0cb86996@jic23-huawei/

FIFO_EN is needed by patch 5.

Patches 2 and 3 are precursors Jonathan asked for on v5, so the buffer
patches carry only buffer work. Patch 4 adds the triggered buffer, patch
5 the FIFO and selection between the two. Patch 6 turns on clang context
analysis for this driver, so the lock markings are checked and not just
documented. It is last, drop it if IIO would rather not opt in yet.

Tested on an Infineon DPS310 wired to a BeagleBone Black. Lock markings
clean under clang 23.1.0.

Changes since v5:
- split probe device pointer and read path rework into their own patches
- __must_hold() markings instead of comments saying a lock is held, plus
  a last patch opting the driver into the analysis that checks them
- get_unaligned_be24() for the 24 bit results
- scan is a structure now, not a byte buffer with memcpys
- timestamp taken in the trigger handler, not iio_pollfunc_store_time,
  which works with nested triggers too
- plain mutex_lock() where the guard hurt readability
- clamp() instead of clamp_t()
- commit messages cut down, Assisted-by tags added

Rupesh Majhi (6):
  iio: pressure: dps310: fix CFG_REG bit definitions
  iio: pressure: dps310: use a local device pointer in probe
  iio: pressure: dps310: rework the raw read paths
  iio: pressure: dps310: add triggered buffer support
  iio: pressure: dps310: add hardware FIFO support
  iio: pressure: dps310: check the lock markings with context analysis

 drivers/iio/pressure/Kconfig  |   2 +
 drivers/iio/pressure/Makefile |   2 +
 drivers/iio/pressure/dps310.c | 738 ++++++++++++++++++++++++++++++----
 3 files changed, 654 insertions(+), 88 deletions(-)

-- 
2.43.0

