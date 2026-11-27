Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776027;
	b=HVQMc4wQmkgmL+6axcrkzPgo6Te3a1Xk7qZphFzADs/EgvhBeNMIW2jE+YybNqd7+ecY
	 bDZtpGB5WVSIi2CjIk2ywMaLkOtLx5SefrUG/vHsQZtEeu13EY4AiRve+fnE0YKrBDpnK
	 1+dVQDurMLuLWWjc/6XyFtFSmXJvn97GTJHw2iI2B7awzOgGvfti66ruOonqRp/CvdOvh
	 3wMgOQ+3XYRpnb5ZYkX+ZJVH/k3EPK8yR3PJ+4zQ5pkI1s0+5HXaretLbDlHuk799BM6A
	 nTi0KPfC8PU+MwGtH9TgHIShgfonlfF6GA9EcbHiV9d2A58ia6XiiVIZDH4kIC60nIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0MjmSAAhpe5cqP7I84bvnQ40cKtlwbqwpo+pqHT1S+8=;
	b=DVgmRiL7dnB2qGGij4khIsuWFw5+zTFKkkVJ/2XyGMBLJjyedC78iuTvXEtr1LsMsPt9
	 WqDZ24SnKRT0PQbRM8g+6ynbg58vhTd1sv/xrrSZnRntEDfSO3HxEiS0KDZxqbGnyc+oj
	 +OTDAisx674tWBTF8c8y6Qd2fVgdNixiWzrJDaX9DKGi5Ytm1fCkAFvox+UpP4CxGPFU4
	 RTDX9KuNzka2Oe0ro51i0KOZKVdeQbKFbdn61WVlR932YzKJR9K+mdiqcHvUt0F7BW8KO
	 ehcsi0stHQvjD2hTK0KgLMANA7Wq8cMq9PjN8zMPJ3XHHwelZQWV8NV8k4BqXE/FzLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lnTu6HT7;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA69606A32A
	for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 10:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA69606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lnTu6HT7
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so2329943a12.0
        for <llvm@lists.linux.dev>; Fri, 27 Nov 2026 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776025; x=1796380825; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MjmSAAhpe5cqP7I84bvnQ40cKtlwbqwpo+pqHT1S+8=;
        b=lnTu6HT7BiIjZHhA+W+II3+T/C2YCx5zR9AbMY+y0ucks/trGMLPfwJ0Vo0dB2BNwj
         Gx6qKR/3//6tyIF/B+4Kfsisiry2S1dZB6aqcCamtf0y1J/oCDgeYS1QHvSxywuWJdWB
         7m9kx9Cmzvm9ehTgjbGa/7Bzg4t9g7MwIXv1L23JNiyhnybOqge6keeotfcZ0/VPGcSX
         1lj3iYJp3qs3MOnxT1TkI15hO84eeIye6Q2Cim1dlN5oMPhhUi3ppxZ0+msHJ2yCXtzW
         2lFY03RNuBoOKTc/gMOPMV3A6xBSwfJH4Nx5lbbvvKpLCICXClOYTIKKBsRmBuigcsTi
         EgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776025; x=1796380825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MjmSAAhpe5cqP7I84bvnQ40cKtlwbqwpo+pqHT1S+8=;
        b=054cFA0t4z01CvdfTwcoo/HDLKHdtUIUf5OhjA37yM0f/ezTnu7myUzSnu0+0l0Puc
         XzvoP1bF1mAFDGpqqhfkIiPFfSw0ID9kC95RWpmHkSQTJj/W/2lQtL6uVJqVhiDBgRN3
         OBpEVzBokNzjSHFON2vRFvC6PtjEpGSkRj8RoRldbCy9bls5GH07ALPlP1iNmQbWK1la
         lbU+1Ai9MDhzWJVIJGUF3o38XwKCe+j1vx64NKcPmjegXw9r12RhtCfp1LOgXu6vvLoF
         roYOIhtDsU+KVdw3rFHkt3OlTLKrJXlY0sQNdKOivXgnOIWL+IMxtwXtbhBwLpaaDYq6
         OFUw==
X-Forwarded-Encrypted: i=1; AL+hErHosUvjlPcGjwtc7aCykZDHbzjzvRkJioD3VF6AEiTWfPIm/PImYddY3QhfUsapInjiY2EG@lists.linux.dev
X-Gm-Message-State: APuU4Z8m5bus6xoNq3e7s8WCCTevjCd+8OGtkwDfzbDKxeAYTF/n3tyI
	ZkManqmkxypiJnl3ASglxEAgjVMXl8oygQDqX6L6X7XF+85UFDKNJ/HBuFsU2yPh6O4=
X-Gm-Gg: AZFdTZcmxvOFA5K/JUODN7Sj7I9KfMj7QMRAYZN3DBehPC81BQEjoEdxZqbDEIpXL6m
	vWGP+r3V9ftOt8tK3v7I5PcCCvzCPsnaxe1XdD5qiz0hze3bA5VhT7Y1Ahhw8FSnEHRAaMn9ADE
	bFxCwxMu8g+4LYzOUDXud2h2Wy1uZYK0t9BoSQV2JMQ0dMOoO2rRNtzVjg3H9ZoUzQIjgvGOs8S
	fD5QMXJTg6EZO10E9+JJ4L/Itpxxqf4FnY/pRgCALC9Sb7Pev603ythf68kagwNTIbn3bTQG8Xp
	j6GpUCMOQ3lHrqkUgGocAEzkv6xVrwbxw+Jp3b5qWPzMfdbjVwluHRqVa845ELYhhdLmB3KwuO3
	23HRCFTEtIpmuF3Gj/DWtCW7pi4zM22wV58EIRd7OLX793OlEr08ADrDGBAoyBEbryGd4d/mBMT
	0GJ0GgvrGFVCDHTFyRrduwIMhlr1rEmxeKuFLKyTAgb1Ma+CpDbPz1RqNoMvsk6HOj9FjgbXLNO
	9Hj7oq/x5ffXFkVkPUJCdYTVN2gf/qbKdmhNTJIUz7efKdnzKsQFt0dxIKVWvczI70sqps6yhsE
	Gc5Rn6Mzn71oFicrNUxr+QVrCpxfQnIMBZYLOUGvicZxddiB6MHtuEVhqLAz2d1HlmpCREhOH/j
	v2jrXk5tOjKVWUEvzr2trA2d7xamoEmKhnetnlzI=
X-Received: by 2002:aa7:d353:0:b0:6ba:22f7:189e with SMTP id 4fb4d7f45d1cf-6ba37d63cdbmr12166261a12.7.1795776025312;
        Fri, 27 Nov 2026 02:40:25 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3919199a12.2.2026.11.27.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 10:40:21 +0000
Subject: [PATCH 1/3] phy: samsung: gs101-ufs: terminate pre_pwr_hs config
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
Message-Id: <20261127-gs101-ufs-phy-oob-v1-1-144b0e04c3a8@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Booting a gs101 platform with KASAN triggers a global-out-of-bounds
read during UFS PHY calibration:

    BUG: KASAN: global-out-of-bounds in
     samsung_ufs_phy_calibrate+0x144/0x530
    Read of size 1 at addr ffff8000825a894d by task (udev-worker)/179
    Call trace:
     kasan_report+0xb0/0x108
     __asan_load1+0x98/0xa0
     samsung_ufs_phy_calibrate+0x144/0x530
     phy_calibrate+0x70/0xc0
     exynos_ufs_pre_pwr_mode+0x280/0x2b0 [ufs_exynos]
     exynos_ufs_pwr_change_notify+0x208/0x2b8 [ufs_exynos]
     ufshcd_change_power_mode+0x58/0xd0
     ufshcd_config_pwr_mode+0xf4/0x1f0
     ufshcd_post_device_init+0x2fc/0x4c8
     ufshcd_init+0x12bc/0x18a0
     ufshcd_pltfrm_init+0x200/0x3d0
     exynos_ufs_probe+0x48/0xa0 [ufs_exynos]
    The buggy address belongs to the variable:
     tensor_gs101_pre_pwr_hs_config+0x2d/0x40

samsung_ufs_phy_calibrate() iterates through each configuration table
with for_each_phy_cfg(), stopping only when cfg->id is 0.
tensor_gs101_pre_pwr_hs_config[] omits the END_UFS_PHY_CFG sentinel,
so the loop reads past the end of the two-element array into adjacent
memory (offset 0x2d is cfg[2].id).

Add the missing END_UFS_PHY_CFG terminator to
tensor_gs101_pre_pwr_hs_config[].

Fixes: c1cf725db106 ("phy: samsung-ufs: ufs: Add support for gs101 UFS phy tuning")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-gs101-ufs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
index a15e1f453f7f..d4af94f3fed4 100644
--- a/drivers/phy/samsung/phy-gs101-ufs.c
+++ b/drivers/phy/samsung/phy-gs101-ufs.c
@@ -98,6 +98,7 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_pre_init_cfg[] = {
 static const struct samsung_ufs_phy_cfg tensor_gs101_pre_pwr_hs_config[] = {
 	PHY_TRSV_REG_CFG_GS101(0x369, 0x11, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x246, 0x03, PWR_MODE_ANY),
+	END_UFS_PHY_CFG,
 };
 
 /* Calibration for HS mode series A/B */

-- 
2.56.1.839.g22a8290db9-goog

