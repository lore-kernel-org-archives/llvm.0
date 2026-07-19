Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6430C148
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497438; cv=none; b=IbMjy8rnoOUdPDX5N7C9Kv6LhqBsVOGJ83NGacixEQz9tCajOGCBFDXyNl8Pz7KEpdMI5PJN4J5LcOdGfrndTxz5LNeq0vsHcg6bJWUU9To+VlEC7Ar4CsGH6PseQUNvGp4oPZgzLQ6PM1z8q4HhPBQSWkh2MndlGYohMxzNwyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497438; c=relaxed/simple;
	bh=8Cao4YSvyyxi8IkEpgt42VHy5qSQ+ev50GEinysOTY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fuYuslQosqnAdWJPpQRwK2QuTCvGa0URzZSxnp4u2TAGtCqJjrYNkfWVChy+QSuzPDMYekrDsxbYdAnPwFmxaFsnIOlm/lvR+Ll+sgWWEw7swR3Qvj4Mx9B6oS8Hpvp7E24tDgt82WYT7mtW1mOkJ1DP7Pzk7NXJDvI18Ost6KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSPpQcHW; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSPpQcHW"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92b21f65b60so296705785a.1
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497434; x=1785102234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lo+kG++Zl0Kl2zxIYPSuQhtBBH9noHj84CgVxWP736w=;
        b=FSPpQcHWaQ2ZG43tqNs0kELojPrAbivke3yMn8fn97TyErZ/wDE7uCugENzjtpRGn6
         i0KUIlXN1tSGBJpJnEn/hIXyVZ0xyqpRnC74OQfyrKBHqDsgIy0UDJqhsuLBYGGfodlR
         C/hJLE5VD17vS7i/rMSo1o3fzSzNLt81TdWKycAibZCrykUfOaOIyNdu3xgvJkcYAkaS
         CuS4+rSoVUUAPIvAA++dn4CWntPU6Q055kN1uqeLmSldtRht8pcCEUkZ3nnsTbbft0sv
         5Qsa4L1v5PghOxG6gyVBKgxt3o618mb3zEYk2s9OHs3a9MTMdQCiBplbDkLthUxRKTBV
         lyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497434; x=1785102234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lo+kG++Zl0Kl2zxIYPSuQhtBBH9noHj84CgVxWP736w=;
        b=RQym2c10AXdlF102QTnwWAcrBrb9CyLSKZfF07VJnDwKgCXyaaPvTDLmWsRFoRpp1A
         XyL11ZZ8j5UtmTWtWfwS9WRzsa+gW3T4ZlikjRQkGldG+dQNESUeq7ALe7id5Eaum2xY
         0ZUjqT8GCHDliS/aavX9234xLG462wAkAcA73j1/iNOKSWONVplaAyfKcKvJ3IWKBHV0
         AtrRVaDV101W1HZOgrjLiimJiwiAUVPyouzr+JMxDVkOmFZgWWh7FoLEvzpEtBLaEeYY
         uZaBEJIPe2y/LpO1TxL4ynZ/xL//OyoUXM8e4leKyeDE2Nh2Wv68OzC9bkcDKzmJn2VC
         5+EQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcGYLhdcxqh3B/cFHCiRCxUkjQTNC3aud6IErx+mqBeyjfpVyE/NdNj+Jq3L47L0Teo8st@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+mjV69rSkWYtYTFwL2x0Bk3BTkBwKdxJDCFniHzm492PMxxKF
	6stot6nw8t3OiaXcy5MfnXcWSp67z/wWqnwdqdXPyuxhQMEssj3X0If3
X-Gm-Gg: AfdE7ckUHITk7DKoPqnHBkwg18MN6ZosOAVRfOc1ifx3ipGadALBMqRkhFUpBOPx7rp
	DZDpoCrkpnDw+tMLXzzZRfnDwkatZELxC8/QC5lIU/1sml0RmdeJA8+nwyTUTzr+OxHT3loYF16
	IjiodqkpHwmygO81o4uUYZRbQ+Julaf+do5k0J2CmMb1P+Q8G15p3PQwdRw6f8w3POC51N6Matv
	fDRnMQXPZEw1iKLMTmJU5U1vsd/0ZB2PIR+qyJbnJCT7997dyNj+/pdslg/Ue7uSc1ofPmvDgjv
	L6nXI4cgGgpr3F72X8+8/uWlxpRXfbxy/IMx3BMn87nwXWsc50N2hXRjRBhw2y83W+6wbRt9nTQ
	FwQJstyQCn+i7b2C9DuuAoWq7uS3pfQzMKgtuTd0V6w2/ss+YD5UvXjEMS9+kvRtPq5e0EC/+x6
	Zmc7GBnBr39oxXzzp2z6b9tyErmPHD/3k4GJ1xUNUH9wxFBT5f5+uP/osQ+LIO9hI2eF7/6ewkp
	zzZDThyg95gcOs3FPp+q0xgslhw/JiUKCtoqscuK9jbAQ/c+XbAXZQ=
X-Received: by 2002:a05:620a:440b:b0:915:5216:e5bf with SMTP id af79cd13be357-930b492fe84mr1146363085a.22.1784497434363;
        Sun, 19 Jul 2026 14:43:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b542e60asm744171885a.31.2026.07.19.14.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:43:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	=?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell PXA1908 SOC support),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: mmp: allow COMPILE_TEST builds
Date: Sun, 19 Jul 2026 14:43:49 -0700
Message-ID: <20260719214349.734351-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MMP clock directory is only entered for ARCH_MMP, even though the
PXA1908 and MMP2 audio clock symbols can already be selected for
COMPILE_TEST.

Add a hidden MMP clock family gate, select it from the compile-testable MMP
clock symbols, and use that symbol for the parent Makefile descent.  Keep
ARCH_MMP as the default provider for existing platform builds.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/mmp/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Kconfig     | 2 ++
 drivers/clk/Makefile    | 2 +-
 drivers/clk/mmp/Kconfig | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 16191b297150..cb69872401fd 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -457,12 +457,14 @@ config COMMON_CLK_STM32H7
 
 config COMMON_CLK_MMP2
 	def_bool COMMON_CLK && (MACH_MMP2_DT || MACH_MMP3_DT)
+	select COMMON_CLK_MMP
 	help
 	  Support for Marvell MMP2 and MMP3 SoC clocks
 
 config COMMON_CLK_MMP2_AUDIO
         tristate "Clock driver for MMP2 Audio subsystem"
         depends on COMMON_CLK_MMP2 || COMPILE_TEST
+        select COMMON_CLK_MMP
         help
           This driver supports clocks for Audio subsystem on MMP2 SoC.
 
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 4b2c089f46a1..8383f9f1da51 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -130,7 +130,7 @@ obj-y					+= mediatek/
 obj-$(CONFIG_ARCH_MESON)		+= meson/
 obj-y					+= microchip/
 ifeq ($(CONFIG_COMMON_CLK), y)
-obj-$(CONFIG_ARCH_MMP)			+= mmp/
+obj-$(CONFIG_COMMON_CLK_MMP)		+= mmp/
 endif
 obj-y					+= mstar/
 obj-y					+= mvebu/
diff --git a/drivers/clk/mmp/Kconfig b/drivers/clk/mmp/Kconfig
index b0d2fea3cda5..35a069034b28 100644
--- a/drivers/clk/mmp/Kconfig
+++ b/drivers/clk/mmp/Kconfig
@@ -1,10 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+config COMMON_CLK_MMP
+	bool
+	default ARCH_MMP
+
 config COMMON_CLK_PXA1908
 	bool "Clock driver for Marvell PXA1908"
 	depends on ARCH_MMP || COMPILE_TEST
 	depends on OF
 	default y if ARCH_MMP && ARM64
+	select COMMON_CLK_MMP
 	select AUXILIARY_BUS
 	help
 	  This driver supports the Marvell PXA1908 SoC clocks.
-- 
2.55.0

