Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776029;
	b=0m6PLeqNQrYtUEDP0w8xmqLfYwKEvlhZPmLDvz0oAShSwnEJuihxOBWPr45OaGk5qYQo
	 pfGHZ3jpjQ06lJr5J5oljUsCJtLPf7oC0nd6u31Ln7H1mbd1meH8fUi6IrSbQvVDbnrJo
	 W/LuIALmMiFkX37D24pMFmA+i5A4kP56wO1mnU/qW+JbVTRFWZ0NLqdM/srVNWJHK/iia
	 P8YizN9QJ3HDD99Rnw2YJq+hrbEJJMoHOW+SuKrP7XfVlOXXB+Ma17wt4VaxLqg/1j5UI
	 ebKnAKlc/dysHzkiABvJZZtxN6nWtbN/wqsVyuFKAWQlbvwpCtXUhDAdPva5gPBYJrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=niHX9hU7Znm7+FTctKl1NjM17jcZWzUBM+CDMu05W6U=;
	b=CN017PuChg4dvI117LvFKRIN4uDGcNXNdye0txqyKBlggaGwpn75eFv9RGKBj6hJUIXu
	 XBMUAPrb3n/aIogXCcfj43T+Skcs2BYziYTje9f90z2/QC4IltgjeCdeCIh0egk7Srv0w
	 VxkKQjsfoantX3qMFYGbZFt0RbQF5vGPAX00AanZT6CFMkokaxZe2Nmg8IOnpWNxAIJW4
	 yH3cdeO7WF4kt8AH4y/UQNmULLM70pWGfHpqTQYO2cCWk6/RpiQD2r5svCKvDRyQMWE7o
	 qn/do5myc/INRVLT6wLu/bI/pEa8uaA8hF6hjH4iZoXfdSPIaVzFemZMOkN+DhFHMig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cDzRCrwa;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38079606A32E
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 10:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38079606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cDzRCrwa
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so10223565a12.2
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776027; x=1796380827; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niHX9hU7Znm7+FTctKl1NjM17jcZWzUBM+CDMu05W6U=;
        b=cDzRCrwaRbeYiBpGEwnFELDp/65W2bPIPZ7XmrcWirJ0Y89dZbN/mn+t3C1ICw8PuZ
         eC2xJbe2zudC444m3LFuessD24ecEVSwIDhEUxg6SpXCw1CuxP9XW21crOMU5Rp005ka
         MpqmpPbhAmCs3bMWGNd840qHGUlouS6XuN1QH6qbTYMnaHI1A6GLlDpvhFnwCaE42qaR
         6u1CscZvdi8Br4CbDnJWwMhhEqoUZNvsW7+fpeSyw/AzZw1rRymkhb84jcr/fciWsHAs
         jnwR71virTIs4JCz5GN2ASmh7EI94061mXe/M3vQ/Ao2I54OKzcknDwI50Ze6augbQna
         mLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776027; x=1796380827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niHX9hU7Znm7+FTctKl1NjM17jcZWzUBM+CDMu05W6U=;
        b=BDsywy9qlbTzaQScmMvMbmwRWCitg/3B+wA856kNXQ5r2nOrY6R/NuPYczskx8Le/x
         q2nczmaOsTvZLR6CIfAjnvE/B7vuBkWmN97ZVvoEhOdFbxnOxoDwDN3pwKwQpX2QgWRU
         30YqU8r4fPVbBspw/szqos3sS0dnJU2NGnXu4zP+S+UfOBtBjwv8Cz5FJ8beAHg+bTas
         Vb+MbL1stlwQdKhc7WQanIslHASNEpW38fSN1GL/0S9WuXksD7sC76cEeJIe7A3Dx8F0
         SP/Vk1vq2xXz7vwaOG5jNMBD+zUNdH8jooM7xx0twOTUm0ARmVhgEe7afshbBF9hpjJZ
         3/Ow==
X-Forwarded-Encrypted: i=1; AL+hErGnj2utx0FhDoAjAbAFp6PCeR0lM7YUHT7ENPKNZPwzrnq2otM7VXdPdUcMgjwBm3Cu914M@lists.linux.dev
X-Gm-Message-State: APuU4Z/KAkgRlB/knYmGqU6ZWJ3cwWQB8cmu82mc3os/0OHVB+vAo0Pf
	wO0k8sGB0YFOjmF3mUwysoEAHI7Etu60CCYo9ZBYUKw0L8N8PY09Z8h3p+OhGT9R+ys=
X-Gm-Gg: AZFdTZddhMVTgpg0vvozeEMOsqqjozgvvcaKIrpCuFt2BeSZIIO7RjvKgPaxjIdLGRO
	46DC+0yVsMTD+PBig7XkgCxJC8qjW8p0aouVUrzxR/vLon9VhYTk8E6CN8BlvXJpKKXirL7Tuf5
	hPcuguPf9WkpvX7aIMGv4zsmlH+UtN/sZwgJ/T42jNod1lNSAACmPo4SB9Xw13uUKnzoexe1qd5
	ddzrnz6+sPrNfQIEeSNQ2Y9SuFE3BD8T+ENkKA94zIa3yQ5Ku3l0BXoImgny0uLaVFopt1K7qYM
	TNdnxmV61MEFiRnuw672/lGHqcbJGALm0L/7K2/HTWu7MYFocTcCMNlZHijliW/bqW7gkMecIx6
	5glKz+lzrPit0HpvussEtF0jrokennhRZXzwqzZw7P+XhjvwxnjkiBlCUw0hG/PCqx8tqJXQpgG
	HcN4HmoVz6WT4dkhYqWQJGJHLlwhsIS6H/UfDqgsNtrDmqPrOlK3Fbx6TLefN6LWUR6IC4OFmfN
	LRHEXS1+/jsM4yO+z1306s+C/zQTapa4YlQmPFx9js/+g5olch5nlPx47xOGHV7jtzglsd7Sb0t
	lY6tqP7G6HL0/AbnA1uV9XceCqMt21AeYCiE45aO6OLT+A9chWugQwyWJBtOFY8HZScssRbB3x5
	mKx8/x2LzIWveDrEGzA==
X-Received: by 2002:aa7:c717:0:b0:6b5:8200:5008 with SMTP id 4fb4d7f45d1cf-6ba37ec67b3mr13091621a12.45.1795776026538;
        Fri, 27 Nov 2026 02:40:26 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3919199a12.2.2026.11.27.02.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 10:40:22 +0000
Subject: [PATCH 2/3] phy: samsung-ufs: embed cfgs arrays in drvdata
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-gs101-ufs-phy-oob-v1-2-144b0e04c3a8@linaro.org>
References: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
In-Reply-To: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-hardening@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

Each SoC keeps the pointers to its calibration tables in a separate
array, and gs101 keeps the pointers to its hibern8 tables in a second
one. struct samsung_ufs_phy_drvdata refers to these arrays using a
plain pointer, which samsung_ufs_phy_probe() copies into struct
samsung_ufs_phy.

A plain pointer doesn't carry the number of elements, so neither the
compiler nor CONFIG_UBSAN_BOUNDS can check the index used with it. In
particular, nothing ensures that the gs101 hibern8 array has an element
for both CFG_POST_HIBERN8_ENTER and CFG_PRE_HIBERN8_EXIT, as only its
initialisers determine its size. In addition, the arrays are never
modified, but are placed in .data, because the pointers they contain
aren't const.

Embed both arrays in struct samsung_ufs_phy_drvdata instead, with
CFG_TAG_MAX and the new CFG_HIBERN8_MAX elements respectively. This
makes the number of elements part of the type, moves the pointers into
.rodata together with the rest of the const driver data, and removes
one level of indirection. Drop the copies from struct samsung_ufs_phy,
as the driver data is reachable from there.

The hibern8 array now exists for all SoCs, so test the selected table
instead of the array in samsung_ufs_phy_notify_state(). SoCs without
hibern8 tables still return 0 without waiting for CDR lock. They now
return -EINVAL for a state other than PHY_UFS_HIBERN8_ENTER and
PHY_UFS_HIBERN8_EXIT, as gs101 does already, but enum phy_ufs_state
has no other value.

On arm64 (non-debug build), embedding the arrays shrinks
phy-exynos-ufs.o by 48 bytes overall (.text -32, .data -176,
.rodata +160).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-exynos7-ufs.c        | 12 +++++-------
 drivers/phy/samsung/phy-exynosautov9-ufs.c   | 10 ++++------
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 12 +++++-------
 drivers/phy/samsung/phy-fsd-ufs.c            | 12 +++++-------
 drivers/phy/samsung/phy-gs101-ufs.c          | 22 +++++++++-------------
 drivers/phy/samsung/phy-samsung-ufs.c        | 15 ++++++---------
 drivers/phy/samsung/phy-samsung-ufs.h        |  7 +++----
 7 files changed, 37 insertions(+), 53 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos7-ufs.c b/drivers/phy/samsung/phy-exynos7-ufs.c
index 15eec1d9e0e0..ea3951ca1331 100644
--- a/drivers/phy/samsung/phy-exynos7-ufs.c
+++ b/drivers/phy/samsung/phy-exynos7-ufs.c
@@ -62,18 +62,16 @@ static const struct samsung_ufs_phy_cfg exynos7_post_pwr_hs_cfg[] = {
 	END_UFS_PHY_CFG
 };
 
-static const struct samsung_ufs_phy_cfg *exynos7_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]		= exynos7_pre_init_cfg,
-	[CFG_PRE_PWR_HS]	= exynos7_pre_pwr_hs_cfg,
-	[CFG_POST_PWR_HS]	= exynos7_post_pwr_hs_cfg,
-};
-
 static const char * const exynos7_ufs_phy_clks[] = {
 	"tx0_symbol_clk", "rx0_symbol_clk", "rx1_symbol_clk", "ref_clk",
 };
 
 const struct samsung_ufs_phy_drvdata exynos7_ufs_phy = {
-	.cfgs = exynos7_ufs_phy_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= exynos7_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= exynos7_pre_pwr_hs_cfg,
+		[CFG_POST_PWR_HS]	= exynos7_post_pwr_hs_cfg,
+	},
 	.isol = {
 		.offset = EXYNOS7_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = EXYNOS7_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-exynosautov9-ufs.c b/drivers/phy/samsung/phy-exynosautov9-ufs.c
index 9c3e030f07ba..00b8eabd3cf2 100644
--- a/drivers/phy/samsung/phy-exynosautov9-ufs.c
+++ b/drivers/phy/samsung/phy-exynosautov9-ufs.c
@@ -52,17 +52,15 @@ static const struct samsung_ufs_phy_cfg exynosautov9_pre_pwr_hs_cfg[] = {
 	END_UFS_PHY_CFG,
 };
 
-static const struct samsung_ufs_phy_cfg *exynosautov9_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]		= exynosautov9_pre_init_cfg,
-	[CFG_PRE_PWR_HS]	= exynosautov9_pre_pwr_hs_cfg,
-};
-
 static const char * const exynosautov9_ufs_phy_clks[] = {
 	"ref_clk",
 };
 
 const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy = {
-	.cfgs = exynosautov9_ufs_phy_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= exynosautov9_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= exynosautov9_pre_pwr_hs_cfg,
+	},
 	.isol = {
 		.offset = EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c b/drivers/phy/samsung/phy-exynosautov920-ufs.c
index 21ef79c42f95..7cf229b2b261 100644
--- a/drivers/phy/samsung/phy-exynosautov920-ufs.c
+++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
@@ -144,18 +144,16 @@ int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane)
 	return -ETIMEDOUT;
 }
 
-static const struct samsung_ufs_phy_cfg *exynosautov920_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]          = exynosautov920_pre_init_cfg,
-	[CFG_PRE_PWR_HS]        = exynosautov920_pre_pwr_hs_cfg,
-	[CFG_POST_PWR_HS]       = exynosautov920_post_pwr_hs_cfg,
-};
-
 static const char * const exynosautov920_ufs_phy_clks[] = {
 	"ref_clk",
 };
 
 const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy = {
-	.cfgs = exynosautov920_ufs_phy_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= exynosautov920_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= exynosautov920_pre_pwr_hs_cfg,
+		[CFG_POST_PWR_HS]	= exynosautov920_post_pwr_hs_cfg,
+	},
 	.isol = {
 		.offset = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-fsd-ufs.c b/drivers/phy/samsung/phy-fsd-ufs.c
index f2361746db0e..d02742289654 100644
--- a/drivers/phy/samsung/phy-fsd-ufs.c
+++ b/drivers/phy/samsung/phy-fsd-ufs.c
@@ -40,18 +40,16 @@ static const struct samsung_ufs_phy_cfg fsd_post_pwr_hs_cfg[] = {
 	END_UFS_PHY_CFG
 };
 
-static const struct samsung_ufs_phy_cfg *fsd_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]		= fsd_pre_init_cfg,
-	[CFG_PRE_PWR_HS]	= fsd_pre_pwr_hs_cfg,
-	[CFG_POST_PWR_HS]	= fsd_post_pwr_hs_cfg,
-};
-
 static const char * const fsd_ufs_phy_clks[] = {
 	"ref_clk",
 };
 
 const struct samsung_ufs_phy_drvdata fsd_ufs_phy = {
-	.cfgs = fsd_ufs_phy_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= fsd_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= fsd_pre_pwr_hs_cfg,
+		[CFG_POST_PWR_HS]	= fsd_post_pwr_hs_cfg,
+	},
 	.isol = {
 		.offset = FSD_EMBEDDED_COMBO_PHY_CTRL,
 		.mask = FSD_EMBEDDED_COMBO_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
index d4af94f3fed4..5b6dca37b5a3 100644
--- a/drivers/phy/samsung/phy-gs101-ufs.c
+++ b/drivers/phy/samsung/phy-gs101-ufs.c
@@ -131,17 +131,6 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_pre_h8_exit[] = {
 	END_UFS_PHY_CFG,
 };
 
-static const struct samsung_ufs_phy_cfg *tensor_gs101_ufs_phy_cfgs[CFG_TAG_MAX] = {
-	[CFG_PRE_INIT]		= tensor_gs101_pre_init_cfg,
-	[CFG_PRE_PWR_HS]	= tensor_gs101_pre_pwr_hs_config,
-	[CFG_POST_PWR_HS]	= tensor_gs101_post_pwr_hs_config,
-};
-
-static const struct samsung_ufs_phy_cfg *tensor_gs101_hibern8_cfgs[] = {
-	[CFG_POST_HIBERN8_ENTER]	= tensor_gs101_post_h8_enter,
-	[CFG_PRE_HIBERN8_EXIT]		= tensor_gs101_pre_h8_exit,
-};
-
 static const char * const tensor_gs101_ufs_phy_clks[] = {
 	"ref_clk",
 };
@@ -197,8 +186,15 @@ static int gs101_phy_wait_for_cdr_lock(struct phy *phy, u8 lane)
 }
 
 const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy = {
-	.cfgs = tensor_gs101_ufs_phy_cfgs,
-	.cfgs_hibern8 = tensor_gs101_hibern8_cfgs,
+	.cfgs = {
+		[CFG_PRE_INIT]		= tensor_gs101_pre_init_cfg,
+		[CFG_PRE_PWR_HS]	= tensor_gs101_pre_pwr_hs_config,
+		[CFG_POST_PWR_HS]	= tensor_gs101_post_pwr_hs_config,
+	},
+	.cfgs_hibern8 = {
+		[CFG_POST_HIBERN8_ENTER]	= tensor_gs101_post_h8_enter,
+		[CFG_PRE_HIBERN8_EXIT]		= tensor_gs101_pre_h8_exit,
+	},
 	.isol = {
 		.offset = TENSOR_GS101_PHY_CTRL,
 		.mask = TENSOR_GS101_PHY_CTRL_MASK,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 56c2fa53bf77..4f2db2ca83c0 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -76,7 +76,6 @@ int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane)
 static int samsung_ufs_phy_calibrate(struct phy *phy)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
-	const struct samsung_ufs_phy_cfg * const *cfgs = ufs_phy->cfgs;
 	const struct samsung_ufs_phy_cfg *cfg;
 	int err = 0;
 	int i;
@@ -87,7 +86,7 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
 		return -EINVAL;
 	}
 
-	cfg = cfgs[ufs_phy->ufs_phy_state];
+	cfg = ufs_phy->drvdata->cfgs[ufs_phy->ufs_phy_state];
 	if (!cfg)
 		goto out;
 
@@ -223,16 +222,16 @@ static int samsung_ufs_phy_notify_state(struct phy *phy,
 	const struct samsung_ufs_phy_cfg *cfg;
 	int i, err = -EINVAL;
 
-	if (!ufs_phy->cfgs_hibern8)
-		return 0;
-
 	if (state.ufs_state == PHY_UFS_HIBERN8_ENTER)
-		cfg = ufs_phy->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
+		cfg = ufs_phy->drvdata->cfgs_hibern8[CFG_POST_HIBERN8_ENTER];
 	else if (state.ufs_state == PHY_UFS_HIBERN8_EXIT)
-		cfg = ufs_phy->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
+		cfg = ufs_phy->drvdata->cfgs_hibern8[CFG_PRE_HIBERN8_EXIT];
 	else
 		goto err_out;
 
+	if (!cfg)
+		return 0;
+
 	for_each_phy_cfg(cfg) {
 		for_each_phy_lane(ufs_phy, i) {
 			samsung_ufs_phy_config(ufs_phy, cfg, i);
@@ -324,8 +323,6 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	drvdata = match->data;
 	phy->dev = dev;
 	phy->drvdata = drvdata;
-	phy->cfgs = drvdata->cfgs;
-	phy->cfgs_hibern8 = drvdata->cfgs_hibern8;
 	memcpy(&phy->isol, &drvdata->isol, sizeof(phy->isol));
 
 	if (!of_property_read_u32_index(dev->of_node, "samsung,pmu-syscon", 1,
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index f2c2e744e5ba..f9680915545a 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -95,6 +95,7 @@ enum {
 enum {
 	CFG_POST_HIBERN8_ENTER,
 	CFG_PRE_HIBERN8_EXIT,
+	CFG_HIBERN8_MAX,
 };
 
 struct samsung_ufs_phy_cfg {
@@ -112,8 +113,8 @@ struct samsung_ufs_phy_pmu_isol {
 };
 
 struct samsung_ufs_phy_drvdata {
-	const struct samsung_ufs_phy_cfg **cfgs;
-	const struct samsung_ufs_phy_cfg **cfgs_hibern8;
+	const struct samsung_ufs_phy_cfg *cfgs[CFG_TAG_MAX];
+	const struct samsung_ufs_phy_cfg *cfgs_hibern8[CFG_HIBERN8_MAX];
 	struct samsung_ufs_phy_pmu_isol isol;
 	const char * const *clk_list;
 	int num_clks;
@@ -129,8 +130,6 @@ struct samsung_ufs_phy {
 	struct regmap *reg_pmu;
 	struct clk_bulk_data *clks;
 	const struct samsung_ufs_phy_drvdata *drvdata;
-	const struct samsung_ufs_phy_cfg * const *cfgs;
-	const struct samsung_ufs_phy_cfg * const *cfgs_hibern8;
 	struct samsung_ufs_phy_pmu_isol isol;
 	u8 lane_cnt;
 	int ufs_phy_state;

-- 
2.56.1.839.g22a8290db9-goog

