Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62D4E77E7
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734325; cv=none; b=qOYwYR87iJFFujtLFdySKc9ZBfKCu0SPBTzsV47Upq8e38AhnNxIBSPwLdkzqEwZsYwWpmaSO3agLmlHcdP6QJd5DTT7oFWFlCATDMRKLJ8Ga8fRF8FSmD8jh8ZNnexHihDRktChoKKBgQ1E24ChXcxF8FtMEIX9vPqorXznFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734325; c=relaxed/simple;
	bh=9ZSenL6dtsrp2oZX3sDl2ArZs7VcmFhK1VTxgTrS8gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P84wOos/v5rrMERhUiUIslIxy81IoWj0cg/Y2viHejp4ojEqzieesvLMKIajzrA5/rGkEarfS/FdYS3GfUYURgUuo+AhgDwPbvLMTMpEdkIDmBFVbv3SXidXJ/JXr+iv2P/KgZrqLx8AprpHdAYjRxrs6EGY4EdcI1A12bo2MsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldnJeyXW; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldnJeyXW"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso1062824e87.2
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734320; x=1790339120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMf/fmxNjFr5lz+nt/08I/rGej163DC0gAtINhbDhHI=;
        b=ldnJeyXW0YFxck15Gx/BSorK2MIHWJYMX+IloLMsFd7Esku/ZXUp/H3nphK6JEtqEi
         i7uqYQGJc4WnYkueqGHPgYTrwtg/8QfbLao0po4dqfXPiy/vWOHidHeg6RzpxHiBDSaT
         lOc1hBbGY4fghRh/cnCIJVo4APeBHMt6LUbUVzRphih7OJLnXt4vgphIqZ0pbLeoJFkf
         Q9x2wKbsNh7SKc1FzE+3bDK7aYlVWSI6ql1+IiUbq0M6jVw4Pdkp0RGgZK2S51L1bb/G
         OGkE6j9mn6S+l9Wxvm9dYEtDlFZqjhwmPe73KcLBMmjHnT6dVLuDouC6rZ+5+U2DfAfh
         cpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734320; x=1790339120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMf/fmxNjFr5lz+nt/08I/rGej163DC0gAtINhbDhHI=;
        b=jXON6FAYU7XAXLI3wFrmZW/AFOdH9HwM59wfmwg5IKfCHC031fPPbmU4ruwXPY3WPq
         lnVmbD3fqvG1LhVgb8tzAPYWLzrCiyQmqgeJbH+1zJub3fqqBqtXmqYGwyCXsaXRSVOh
         CuK3ZwJTh9d38LuqFLH14J5BuElfPCd/k4dvVsekTqPOZbN8YjNv2NSXHn8HMMpPcZCg
         e2zQr8tRNyDmFlpQhrq81WgboLFF+Na4Lt02akbSjesUcAu/hsuMhYPBBq23QgeljXAY
         Xfee27b7MUSnBJJVfk7eqROaDxQAS8BYIskTBcxnJuoL3Jy5yaOylft04OFsxncfXg7l
         HrEw==
X-Forwarded-Encrypted: i=1; AKwUvBz/RnT1OaryU7y1iTdfHGJjM8wR0FHrt3zHqdlEtm2TS0dJslUVbOF4JG4wuuyjDKLKNaJS@lists.linux.dev
X-Gm-Message-State: AFuF++kNFMAgcAyBR3vUgRsyFnXvduZGDMti7YO10/Ma3Bf82dKccglr
	WtTkXbTxw2aJoRUz2f1GM0etbuT+kWW6pStnmmLUWGn6r3MaKTd4jTRL
X-Gm-Gg: AYBFou1NJfBHLxpfifbu6/y4w2y6TcAT02xjRAc+YipGjnUIUGlqalDyt314PF2eIUz
	l3XkPALUCd1DjGI7o/h1Rxx9lWEgN93VdnpUkYRODEwGFpLGYEFsd0m+JpZJcM2m7b5NUEXcMC5
	/3p6aY54ufc8k4b+SdVRZsGtjH8f+I+6mSweDnjxa2DpVcHV/qSsJ7bLuSOWPbeV7BacdBXyrY0
	e57cj99bh7h9ZW40gRf7Z0Qd7dUbkP+W10/9EFrLLpHhw7zQgIsZb6MIzlg3HxYOgN7z4Z2ma3j
	7uHb591pPu8HdyqtL25KmZvo01p20gHox6gU0+fe5PefR6ZkszXD7ysNZbb7S5mfNacDT/nDdoD
	2QN7DiRG8g2K8SD70YE60hLI/ow0nIlZZICgU61218tMyKCOwPzZ79RRMHqK3SLHz2FfQrtlXjM
	bp0IhgZOeWDLfXwJHmYv2nT/uWSqOumscLM1BWQ7pa53HFuuYe4CwKw5RMvvaGXQRE0vzamY84S
	+H1xsaX4DfvCqV3Vcol0H6BHAivoTOBtnyNOIHCDh4Fd4NcYkTR/pVJh5pXPZtV6vJQkw==
X-Received: by 2002:a05:6512:3c93:b0:5b8:9fa1:9c3b with SMTP id 2adb3069b0e04-5b8c1846e53mr784754e87.32.1789734319524;
        Fri, 18 Sep 2026 05:25:19 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:18 -0700 (PDT)
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
Subject: [PATCH v7 00/10] iio: pressure: dps310: FIFO and triggered buffer support
Date: Fri, 18 Sep 2026 15:25:07 +0300
Message-ID: <20260918122517.377565-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v6 had FIFO support as one patch. Andy asked for a split, so ten here.

Buffered capture without a trigger, draining hardware FIFO on a timer.
Patch 6 adds an IIO core accessor Jonathan asked for; patch 7 uses it to
refuse timestamp channel, as FIFO entries carry none.

Pressure read before first temperature is held, not dropped.

Tested on a DPS310 on a BeagleBone Black, pressure 32 Hz, temperature 1 Hz,
watermark 1. v6 stalled on two of six buffer enables; this series on none
of twelve, at 90 to 98 scans per 3 s trial against 96 ideal.

Patch 10 opts into clang context analysis and comes last, so it can be
dropped alone. Built with clang 23 and CONFIG_WARN_CONTEXT_ANALYSIS, no
warnings.

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


base-commit: 61718ed183599e5162496b5306c3377a925d21cd
-- 
2.43.0

