Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDFF38D407
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602456; cv=none; b=XCvVbMyR+41SDcQSQKJVjRUFroQSuXKXFRDQBOhOkIxRm6TlRS42oq6YFsLbbf21qGVfhQGTrt33pmSl/x6NY+l5U2M5xfCbSQJgMrxNjn1TlHHrD+GvX0VNFXNXod/jAPwTRKdHer/MjCOj2kpkh/wyeMGjHwxjoqIi97ivfvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602456; c=relaxed/simple;
	bh=x2S1FPcFw6xB0ZEc3bzyK1hPMMiTGwFHOTi1d6ZsdXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNgG1+np5vDswvCp0KU2lFpixGrbIqS0eZuRdE6F/G9nHDsTkKSF2vyIjFrh8DMxmMQEo/3q2quRg+z2DeK/DE7GBfME/hhSOr6vKWcF1WhSZzMjGcT0oz3Tm84ZRXJPaudyOgoS3WBktaVYHVOmofJz/k1cbFg1n/R5mFy/hmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9/YJoTl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9/YJoTl"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso4434450e87.2
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 13:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602453; x=1788207253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsCzfWJOg7SVbU+X222eaAOaisGnyr8WXZV/pRTp8oY=;
        b=S9/YJoTlZL5ogXDXoRu/GD5yb0ttjLTGNqBlES+Bf7G3rledU2jgNJmgSYhK6Anj7N
         W7c/CVKozpHbfXbPvkqsPMfeWetncYlPRrLVE66If8e9HP6FhMrAZk/LEiE1sR37NbE7
         2LSM6fYVyhWNC5NgKpe/xD8RrQvJYbkMsBqt8uFYvWEUG1Tfby2o2r1VlEHwf0TsT0M/
         mFvpB75qHerqWDtbkUdNp5r++5WMCHjg27U0VE81KPljBQjT0SejiKiJhfdPcppOUFrz
         KCwMoUCjYQvpejRV7NYlt1s+PN2nNgkLYQr1Z0+DBRhCfnjdzkWjq4pm+F13vk4VzEBz
         86Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602453; x=1788207253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsCzfWJOg7SVbU+X222eaAOaisGnyr8WXZV/pRTp8oY=;
        b=J4SnFTFdz2vPWhykySBTda/SN39E3Pt/qj6TLoiQ3GytYL7BsBdHDrq8sYhV1k5G4M
         iL4PW0H0OydD4v2mENouHAeq7xWBah7XdEfcnDtCz2wgB5EjK5M4T8kzt+zfchwI4tOS
         wpQToxnorOvk+ydlG65b8MjHmN5foxYX9/We/yzkI1A8epJsUN8PYxraMA04VxB9aP5U
         8rzExuv4HbpK3THpbwrjB6UohISfPCRZKWKnKwVLnDWuFPk3LPc/RMJ+HP/VewyAPmvY
         Fb6DBVpV/ntLnqIp9ehIkTfmVYTN0IREuE68jJif8Un5w2btgJgF90Ho+JLF5K46qC7J
         NiBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlTw//nt6sgCx88SDxYQgqM9z7Z0GZnCx1Kf+DBubPoRCgmlN9SeRNCZ+pvw/XHRjnrIsK@lists.linux.dev
X-Gm-Message-State: AFuF++lPgf/DrrzneNWCBNzQnvUzTUe1rAdEWCDa9tCcKxRBV1szO4ar
	zoPqILUSrTZ8CcZmXY8oaDPQHQb09G5UODFg7zIW47rxeRIgb1lgt7VI
X-Gm-Gg: AR+sD114pP0JCWmYnCg2vd7DGrkUJqNq0DWz94hN/iXp0hRr9yuajvWuTTLq4z3sMMi
	1WbQ8JnGf/GKI1t1EAeawel4OUVKNtyYY0NGsJiX4rfLpjQVxyUTVTcuvfTtOwEXUtjwuyT3Wk3
	cne9eZZrFDz6Du3tN1sgqvjoLrTjgsmzG4LFlUQjG+0LGQLgLV5xZsXuPggHMcTVjwiVDGKWx2v
	Ie+8KY6tksoKEM6dchK1SYCWNlexl3THkcmsbun9lmd7lgb+QpmmWFr2dXTe2kyIL7gsszrBZAl
	cpW4rPyHwL7BsUVfIe0lChkUIAQfWPK6Cg9XI5RqTW1/8G55/DuiXKoKivJD5W0JcVJZ/xToQfM
	vT+Gx5150it23Sz1hL99dlUTsDvg02oRcdXOfL6+22uXnO7KRfx++bXPvxah6bEaDElEDMYfFFI
	KAfrPV91YoGd/ePUCokGmTWyQew7/YKBpASWtv6WFo01y6S6Y/GTxA8iRSGJUXgrTQK0s4iFMfR
	aeOITNlOjqSgDTrMQQxNO7RXMD7aTFoCDqc9qbWptfHvRgdXMpq7lmiCCc=
X-Received: by 2002:a05:6512:2304:b0:5b2:e947:b3e6 with SMTP id 2adb3069b0e04-5b484209176mr9381158e87.2.1787602452978;
        Mon, 24 Aug 2026 13:14:12 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b48ce0cd9csm1923620e87.71.2026.08.24.13.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:14:12 -0700 (PDT)
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
	Rupesh Majhi <zoone.rupert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v6 1/6] iio: pressure: dps310: fix CFG_REG bit definitions
Date: Mon, 24 Aug 2026 23:11:58 +0300
Message-ID: <20260824201203.396651-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824201203.396651-1-zoone.rupert@gmail.com>
References: <20260824201203.396651-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver defines them as BIT(4), BIT(5) and BIT(6). Per datasheet P_SHIFT
is bit 2, FIFO_EN is bit 1 and SPI_MODE is bit 0.

Only P_SHIFT has a user. dps310_set_pres_precision() sets it at
oversampling 16 or above, so with wrong bit the result register is never
shifted and stops matching the scale factor compensation divides by.
in_pressure_input returns -ERANGE at oversampling 16, 32 and 64.

FIFO_EN needed by FIFO support later in this series.

Fixes: ba6ec48e76bc ("iio: Add driver for Infineon DPS310")
Fixes: d711a3c7dc82 ("iio: dps310: Add pressure sensing capability")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index f45af72a0554..68382960382f 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -50,9 +50,9 @@
 #define DPS310_CFG_REG		0x09
 #define  DPS310_INT_HL		BIT(7)
 #define  DPS310_TMP_SHIFT_EN	BIT(3)
-#define  DPS310_PRS_SHIFT_EN	BIT(4)
-#define  DPS310_FIFO_EN		BIT(5)
-#define  DPS310_SPI_EN		BIT(6)
+#define  DPS310_PRS_SHIFT_EN	BIT(2)
+#define  DPS310_FIFO_EN		BIT(1)
+#define  DPS310_SPI_EN		BIT(0)
 #define DPS310_RESET		0x0c
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
-- 
2.43.0

