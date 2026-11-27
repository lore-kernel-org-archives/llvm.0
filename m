Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776026;
	b=Eg25aVD/eUax37C+PVGaqGRSJkL6o9XboZSq0pslbZsJ0BnoNlb2Wb3YosXOrh9tFL4z
	 dE5NTsGZr3f4NoDy+wPJfyiCEXfgYObwAD+w3GdDjcoRO4UZscJcb31uUfPMzYjPluxEr
	 NP6goLlyO6UWd7+gxvFITi065G/w4i4cPSrTLEIQiM2IgtRpL7XWOBtBpQEnfb72IAaNO
	 RBph+ahxrDjP6FTsLviBTRbAXgGYXNRUstkEDSfulWu+a7CJR94sXYqAuPZ86ZaBL4uX0
	 Y5htnlHJC+9AdXVABphoZiy6lFpMqUFvKtLH3yNsTlpNu9T8KKx9ahSEOrIFppJyfQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=2c6Rb/UBk4azewF8bkRw1dkEc/rmGwcJQDMivDwr1lA=;
	b=M9ajPeXmrNJlBiWI4By2uK9PNb1NShp82T28kOtNXtPU3iHFo8Ms4JQaq6R1olT/xgUH
	 rVyY8YxdmIilOuQflHvVdlPTVsoREh5Qrad+x2Z/ipinjeO1KzLviFPT0n6s1JuQRKtQz
	 bxfLkrVzTIJMAp3fNQ4YrRnMCPHo60xcUJDlWmk0wDOnbRd1FtbqlVjhjm90NneQ6oTgI
	 VR7+lOfOCOmvMDB19njYkRMWmfaydh94CneTQkL2AFipH9Oeo50hZoH89A+CyTit8lqFo
	 KvpIOEkHPqft275v0gug1sXljnGAkJZ9yADhaZrYtx/cM+Nm5sVdnMcAp2soYMlsoWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bdh239dC;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8B1606A31E
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 10:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bdh239dC
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so9045692a12.0
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 02:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776024; x=1796380824; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2c6Rb/UBk4azewF8bkRw1dkEc/rmGwcJQDMivDwr1lA=;
        b=Bdh239dC+Vo68K3cG3b5bCJlYz/wFDe+I95FhvfY9yNpRituoE0h6QpEfpsFb39Ijq
         yBN8ebqbhHXxkD4++KvCWEs89uXzXGxdZo2GBl8Il+VQ8K1+DO7OwdvsoBPM2Riw1Lbx
         8la3X3/YJOKlPnwKB8u8CSDJYR42GqEWIvXxt4txI6APfadEnwu7xE5nb/2S8DfmTsD5
         uof353W7T01OZeGnG6ojQUd1UxGQ3D7OZV6GpldLDgEIBt0YEmDNS0iIdyGuPbd7TKHk
         MNc/75gI21ZCS1Qhu+7d1t0FH/i0cLkohxdAtFn8r7nON/XYBBiOJx2aVi3ohphj7YDS
         Vc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776024; x=1796380824;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2c6Rb/UBk4azewF8bkRw1dkEc/rmGwcJQDMivDwr1lA=;
        b=I+2pYi3pCcgjkiFipz75eX9YaaEnaggxrT/IMhojhbOPnfGTPAqRu65KvPY0g7nyh2
         6Nkw9GvGenVK6pDQ0OgrXeaJsZZkL/i/+GJFQNYpRyUuwqu9K3DChBYeONT0u9/t3pan
         xcNQV0DNKCcfStSQ978eeSB17ho5utMk4lIDSPzjTp6fRBHnhff07eM3g88aeGqeuaRQ
         UxGKyO8LYeYT6isZKuyy6mRIeiq+pzklOTWkVIcYhVm43kceQtfyjzE5YuxREJPPzLPT
         e2kfvUUQ8CVuTwwh0GzZ0W/FOYe/n344LnbGK8n1upm5owjD8WMdh4c04sLwEs+SPYO5
         gKmQ==
X-Forwarded-Encrypted: i=1; AL+hErHPs5irbR3dSowQlXCWuEZVHdLHL8iiIyjBG+Tc6UlaL6gAjHtcXhWbH3NDdJeVfqJqmC5W@lists.linux.dev
X-Gm-Message-State: APuU4Z9ngCZc4FIZudr4iIY2P9ErkxbcnkxXpwIuZb2gNfdzrH4CYD7B
	qgp/paXHjOW6W8Sg7ISDzs3tTIorjSQD+6nhYcuBJgG94KyKn746ZfN+954VJtetfo8=
X-Gm-Gg: AZFdTZdJDiKPCIemVfVhK+XHJVF4RNK4l55zVeHdpv7N9pzXZQ49b3nI3wFJBXI6utb
	0fABKRkpq68Odtg3qv/jol/xzgNZU/ijGFs3WI4qNabkQ+1n37TWJIUdmfmbRY4cvIf9ASDlJWu
	kOtiNf/XopAEbDIIkCWT48+uAH/nBhPb4uX0Ao9YBTv7dF0lKxMeY7n6edkOryYHN0FYQVM2Nc4
	inj54lv9xPdqpG+7fPqADV+HX8qBySB9Ozpv1PfmU3x9rRFStOjtRmD40q3vzdyQ7SW6LVrL8C1
	h0PSupzot8K/wcWo/6KrW6+fxffMp06rFJWF4vHoHFI98jYXPT2mTIns5+WRwZ6JYT8Gowlrx8Y
	yV91E4CBujYtE/Uhl/ChBFdf1yAx5HtqIeqB/J2s3Hkkd/a8vylH94RtZOexQrSGADbYhcb8HSD
	zsycbSBrIePaeG+Qb1RGcHn+YZKDg/Qh0tU+Ob0RW9w/eOKZS6V8shKJp84GtpElOVHMv553iyS
	/Q8H9ZlfCfj3S2cjv4dLASo7RujKOA7rrX2HwOHw3Jx7vbxXPwtAPpvpiPWBEUMES5MiHRrACTd
	g/LA3ee8CSWGEsvyQJEbBa/OVTMIGyQLW4S4IeXuB7X4J/oFDJGM6C5wGZ6w1Yl19YAhXiyOfLZ
	bJC3MMA+JvcWeagnFUA==
X-Received: by 2002:a05:6402:1492:b0:6b8:68fd:bf30 with SMTP id 4fb4d7f45d1cf-6ba37d5bf2dmr12996663a12.13.1795776024088;
        Fri, 27 Nov 2026 02:40:24 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3919199a12.2.2026.11.27.02.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] phy: samsung-ufs: fix gs101 OOB read and use counted
 config tables
Date: Fri, 27 Nov 2026 10:40:20 +0000
Message-Id: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIABReCWsC/x3MSQqAMAxA0atI1gaaOiBeRVw4pG02VhoURby7x
 eVb/P+AchJW6IsHEp+iErcMKgtYwrR5RlmzwRrbEtkGvZIhPJziHm6MccbOVKaa2oZcPUPu9sR
 Orv85jO/7AcBI7qxjAAAA
X-Change-ID: 20261125-gs101-ufs-phy-oob-80303a651f4b
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Hi,

Booting a gs101 platform with generic KASAN enabled triggers a
global-out-of-bounds read during UFS PHY calibration because
tensor_gs101_pre_pwr_hs_config[] omits the END_UFS_PHY_CFG sentinel.

This series starts with the minimal fix suitable for backporting to
stable kernels, followed by two hardening patches to prevent missing
sentinels and out-of-bounds config table accesses in the future:

- Fix the global-out-of-bounds read on gs101 by adding the missing
  END_UFS_PHY_CFG terminator (tagged for stable).
- Embed the per-SoC config pointer arrays in struct
  samsung_ufs_phy_drvdata with fixed bounds and move them to .rodata.
- Replace END_UFS_PHY_CFG sentinel iteration with ARRAY_SIZE()-counted
  tables annotated with __counted_by_ptr().

On arm64 (non-debug build), the two refactor patches shrink
phy-exynos-ufs.o by 144 bytes overall (.text -160, .data -176,
.rodata +192).

Note that exynosautov9_ufs_phy.wait_for_cdr is never called (before or
after this series), because exynosautov9 defines neither a
CFG_POST_PWR_HS table nor hibern8 tables - this series preserves the
existing wait_for_cdr behaviour.

Tested on Pixel 6 (gs101) with generic KASAN and UBSAN_BOUNDS enabled,
including UFS hibern8 enter/exit cycles.

Cheers
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      phy: samsung: gs101-ufs: terminate pre_pwr_hs config
      phy: samsung-ufs: embed cfgs arrays in drvdata
      phy: samsung-ufs: use counted config tables

 drivers/phy/samsung/phy-exynos7-ufs.c        | 17 ++++------
 drivers/phy/samsung/phy-exynosautov9-ufs.c   | 14 +++-----
 drivers/phy/samsung/phy-exynosautov920-ufs.c | 25 +++++++--------
 drivers/phy/samsung/phy-fsd-ufs.c            | 23 ++++++-------
 drivers/phy/samsung/phy-gs101-ufs.c          | 26 ++++++---------
 drivers/phy/samsung/phy-samsung-ufs.c        | 48 ++++++++++++++--------------
 drivers/phy/samsung/phy-samsung-ufs.h        | 26 ++++++++++++---
 7 files changed, 87 insertions(+), 92 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-gs101-ufs-phy-oob-80303a651f4b

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

