Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3630D4EBAED
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734347; cv=none; b=a7QJ8Q4Gun7mXw3HtwFwE1dnjzU8j3kudTo1PdDHkZb3ZvKf4J8X2z2tgpRruxmd7GtDKhZ9qnciepGAO1924Qbgrs915UUdgrPlAjT48fybwC6+PjZYOfeBq44djeeLU9VzvqEJKpGfpARoMcgD9d+t1oAXG88LJVzuTk1LKFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734347; c=relaxed/simple;
	bh=LSoXDOkihoTe+1aeuwkzPsOIbGrXJATfUTeqR5S99lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7iwslfbgIRacL6KzAwsGcA5hQb09PQ4Vpa7MoanKZKTxiyMi6QSVYljH5ZCbKK7EBVuHhXPZRMJEp6H8bm/WehVTy/Vecw1OLW31ymKvSrldJtFPaaoQ2a6uaY1Lh9L1PvC4j9O3EZ8TDdn7qYv6nGt+ODMElDONfTcu5Uk5Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7STu2l5; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7STu2l5"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b7aso625073e87.3
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734329; x=1790339129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pj32bFFZvi2cnsgj5gH1ddQyBwu2DGpSO+g4f8bX3TE=;
        b=A7STu2l5b6PAqooBLUHRZLj/kPN/Pm1U9wVEtfaPomvmDCzw/i72pub2uyPXa5GZmf
         xQG3euDW078aoULgcgrc8K9vy7RFJESa0zfSAQWTFbVfdZu2Al6dW7zzZRRpPp7ATBCm
         yiUaVghtlnJeYdBaeitnPiSMWBTJAH+szJ9QWMe/uDcpMm7qnEW6BuVgH29BwfiLADvO
         ctQpS7W/fmYRz3RT73Z5pZE+IjZnwF6WPbhj9oxrsH46973wqhpu3QSROCU6REeyYbjM
         POSAELMZj96imkQuvgNhkVXtXwpXtbOU1COl7jxwRrb1vpsInEFhcSYIzp5PLecz1RI1
         PB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734329; x=1790339129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pj32bFFZvi2cnsgj5gH1ddQyBwu2DGpSO+g4f8bX3TE=;
        b=J/hHoDywMdi6/oU2G1WV7lrWjhu/YowG/aGuszNkh6O4YhL8GVhxr495oxlZhybPNi
         AbzI617hAC1grIbhv8Gvwn3UhiX91mFFXjkdcMx5xchQ3jo3e9K0kVIwpg6rp2aKY9jq
         jvFUSmYe9c3We824PZACtmho/0RCcF1uI67NBY5Z8AKFQ/pXNed1/htya2K+D447v9FB
         Yt8lXlwXjdHRW1Ijf1Xzsq2MY+EKxSzTjL15DMsyUg+kCpMVvUdR/baAz/fK2qn7qFP3
         v92Mm27ephqwmXeJyWqoRQmPAkFaAL5MQuWdlTJzPtv+KG81+Q03nV6EcvPb2wwa8NWE
         6JJA==
X-Forwarded-Encrypted: i=1; AKwUvBzh4FSTyqkCDcMW1zG1r0LABx2cDv0rDTWI3ShtlKgkGNClW5vDdFV1dOCxsPo32LnUKyRZ@lists.linux.dev
X-Gm-Message-State: AFuF++mmdhMhsJ2LPo8XypnMNG/eyDtBeTJ5sPNqPLlRW8bQqo6o0OG4
	ZW5YyLCwmYAsuX88z3YARr9HJm9BkP7jZYKK43AdqgvLEzk6pCJCUwym
X-Gm-Gg: AYBFou3PPqz5PUKQNONItpfbNUraYLcBy8c0y6M/TftgBZDjXbkLpWgqed77JU96nZg
	PSPUj3idVxtcvgcKtLoRqCtSk/TveozdEeOuCt8I1SL1l7+OKA3tEY0bJSQ2syVcCE/azHnp3e9
	U47RN0nV9PZ9saqifcpvfhyDZNKW6iptvmkEDQdLuy18qSdEC/j8urmMMoSaUNSa/wiWZzg3qTl
	L3FyftTxnGFTx1Oh9bUv2Xmn6Ovdui5hIk1PBIUizHsgo9sBzOYWOXFAnHx7EY1AcovxYHOr6Af
	HBg/OjIBrL4nlXBPQBOjc9zySVZqkOG+DNHXOgzHPy+v3Sp49dB3RMK75jDlrPAYP6Rg5d25Qy9
	8TPAat1elPDaVLIVcK9ddzd3fgR1ZC5lgSXWRGqPTM12xlPz1PdvcvKSfHuc8/+TRF79CXRQNxg
	s5h3tMLY2exy6IN4N0Bm1x5UFAxDaA5ISNkTeCF8DIELoA8IfLex4qYPFEf2qgp1RulcZ5/5bbt
	Xw72ChhgV1k1/maokX9XyP+U1NNmKi28YknvG9isdxPx9QV8/3aajWe+83o+DIEbu0MFQ==
X-Received: by 2002:a05:6512:3c89:b0:5b8:bc5e:b584 with SMTP id 2adb3069b0e04-5b8c195dba5mr702953e87.60.1789734329260;
        Fri, 18 Sep 2026 05:25:29 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:28 -0700 (PDT)
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
Subject: [PATCH v7 10/10] iio: pressure: dps310: check the lock markings with context analysis
Date: Fri, 18 Sep 2026 15:25:17 +0300
Message-ID: <20260918122517.377565-11-zoone.rupert@gmail.com>
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

__must_hold() markings added earlier in this series are only
documentation unless the file opts in, so switch the analysis on for
dps310.o.

Clean with clang 23.1.0 and CONFIG_WARN_CONTEXT_ANALYSIS=y. It does run:
dropping the lock around dps310_fifo_drain() warns rather than going
quietly.

Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/pressure/Makefile b/drivers/iio/pressure/Makefile
index bc0d11a20acc..4b1a05f7a0bd 100644
--- a/drivers/iio/pressure/Makefile
+++ b/drivers/iio/pressure/Makefile
@@ -3,6 +3,8 @@
 # Makefile for industrial I/O pressure drivers
 #
 
+CONTEXT_ANALYSIS_dps310.o := y
+
 # When adding new entries keep the list in alphabetical order
 obj-$(CONFIG_ABP060MG) += abp060mg.o
 obj-$(CONFIG_ABP2030PA) += abp2030pa.o
-- 
2.43.0

