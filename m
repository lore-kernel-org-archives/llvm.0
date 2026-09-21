Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FC4F96CA
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015501; cv=none; b=gHoRV5JCJux72adaXQQL2T+YslISLth1NAb+YbvyTn32TiSPqYYApvc1uoSgX+r9cae7ey4AyTKr++AZgs906VCeN8vjY2HYrkc23MZZbTdIFqAyIftdEXQMNlC7TkPHwu1hbYiJjeNhFYwAWpHomLxSUIJwnypRoWeXf8UYpsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015501; c=relaxed/simple;
	bh=XEU3X6TrPs6UzvTqsbHKRzxHg0PLadxing8itj7f4nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUkwPbKFOEZRI6O8GV9Hd8O/vf1y/HClPcA0/3TM7dw26nKxXdLjNTY8MyNPU4Od6bU/BDOesEHcQFvNdMWWc6tujxeRn9g4JBAdxTxyh65PRv3Va3mnZQpqwOz9w5UGxHhtT/7sIYM2elS1j0wxRCT6yWdXxRb+EwXNtB36Bi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjE7v6y5; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjE7v6y5"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5b6840edcso29267401fa.1
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015497; x=1790620297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfR3YrnGEF1eVDtqqFJbMom6dYue/Q5AxIRNa4I1fXg=;
        b=jjE7v6y5ydzKJ0D1u/hEa3b2NO6dpmMnDAQ/fQNgBKYxo8mUdixlsfC4KIGaz5EXCv
         GR6ZNZaw6yclpa9QLSezK4LjqdMb5iZj1IT+KeN+TimKRgomm68SZxUwW90+QvBV0pVx
         vwa0Kwg0mhtPEZV1PxA1GNuyDkqcUU9I2k3bgqYjQKSpYp+Ty+ICmNnrX74wi/IbF6wP
         HO3lbMof6maPm/W7jl/jUx+LYlfuDrRAOrqX9pW/xA87AGOrbpEnltZ5Tn7YcMfRbZPb
         1GYEas7Z211VGQibKWFXzRT50fTBhOStvROIwxRapwRVcTwRVGfcPc0FTap6hidQ2RZR
         hQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015497; x=1790620297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfR3YrnGEF1eVDtqqFJbMom6dYue/Q5AxIRNa4I1fXg=;
        b=rGJK48fhmw3LpjUgxo214/GDyzAHHjvFHS3K9TXz6vdTkArgwcBzqCvLyEH2YLbgyg
         49ZL/E/jOGoDFVMiEjgmRNmV0/EMaSXiGUF98pN7Qw1islMypwds9p6p4TeZ4b8ijJPy
         5Z6OloavHsqDXfS3DCe9OVg6sXMD+FTqjzJqPfo0RifW5kqgBJRcZ/FqFrxRtroHLOyu
         /5QfRa6qHTeW2Jl9/PcXeOnEzp3mHQzM9bgywo6RFCluLu2ScUDRIumhBgiHr1y81ClT
         wChT0gcqKBoePK2SmgZgdtDoGmzKZdD9dog7Kp/WHMM04YxX8WgL2rCaUWyg999ozqZM
         5pPw==
X-Forwarded-Encrypted: i=1; AKwUvBz+vr6vp8VXAxCY32LKlWkhKirFKFDGsEqR8J96xugvhIgu898ZQXoGuaagLoKucRprdCT1@lists.linux.dev
X-Gm-Message-State: AFuF++lhUxEikRNNMqxIjFBtRwbwemRr7MOUD8P9DciN8QMqV3UD1UYU
	NTvR1FeE5lORWJoBs2QsVYvAdyJewjYJxIu0rzFbTgxvxVdQfy5JzUet
X-Gm-Gg: AYBFou2A/Kxi+VGeFPQbd0LVv1Ur8HvaG2M4DFQTxpR+aHGE0EjmsxxRrSq3b8/zPLU
	K01tc/YbQFtCun77OClu2QHJjwrj2liY9ZZkbK/joEEzboy7bDECoxjMLm4NKdKNfC57C4W2NdY
	1CPAYnjSeUTkmaRaMDLnzNZbAyGrx0zXMvUMkdGKTgGPuBleUkKu54ub8GYyIM3CSa3OiWkLJQ0
	6KoH8oGFs1fwgOgAMajTzJQnzsGTGj4l+PWJm79iBGjaw2CY8FIGdT6GhZnVChbgTa8TTJkRVbl
	pNBdHTZ8IvFgf+F7i8SCDnIxajaeG/NvSZEJYPlxdKGd6HwZXh9G9Y9t1MoydV+m/Coj4W8+nL2
	iLn7ksJOVtMOp7vERX6wXUKVVl+XzO+fgTprE1o4jl0kvY7gLi9F4aO+O3DXYVo5+HhyNjgXUtW
	s/viYReVg8wW5fMtWVmFl3KwuMxyFkdH4BWNUjLoSH5d+SPelR3wxB5p5dmqQynUigyFYBGkkAD
	7IlR7Yw+CjBVnCwvUvB6sXvyqR1mrxA8f/1TN3/Uh0JtTZZ4MdXR0ljRndW4qiz/x64hw==
X-Received: by 2002:a05:651c:1b0f:b0:39b:3e32:4a58 with SMTP id 38308e7fff4ca-3a5fbf10e6bmr21808141fa.10.1790015497115;
        Mon, 21 Sep 2026 11:31:37 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:36 -0700 (PDT)
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
	Rupesh Majhi <zoone.rupert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v8 01/10] iio: pressure: dps310: fix CFG_REG bit definitions
Date: Mon, 21 Sep 2026 21:31:23 +0300
Message-ID: <20260921183132.233136-2-zoone.rupert@gmail.com>
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
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 45bdb8c7670f..35260b399390 100644
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

