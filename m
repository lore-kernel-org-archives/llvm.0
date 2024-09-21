Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C02713C9B8
	for <llvm@lists.linux.dev>; Sat, 21 Sep 2024 21:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726953293; cv=none; b=X9Sj8mP+XCwz1JwlrvMRByxh4cn38OsNghPL/y40Ni7IQ42DvN3cm/TsxX6ABIFZChOrpR/05igoHF8QNqa4SqxoU26BQnPQkgb6v2IJ9Slew7tIFSq6MUHUm7YyRcf8Pru0MtuQmTqsc/A41kK/ABmrUSJs9PpB1IWgW5DZlug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726953293; c=relaxed/simple;
	bh=XCA9l6jIuwYih0fkmBs7/+esJ31azn4rphomjgMvutQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ho4tbO4o6RFjgOrBYPuSlJrXUIrO3kjPhc5xysUBxuxAoTdcswm+6ADoarPWzUu+v0qHannz5n/fLMrhlHtycvCNp6Ck5V/r7KL555F5i8TKRGGebSsb/kQBH40PUj3GS2BgHY/Gmxp69Yj6GkBVmcwstAK8+i5YsWBIKV3htrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pgaJhK3/; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pgaJhK3/"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53653682246so3377069e87.1
        for <llvm@lists.linux.dev>; Sat, 21 Sep 2024 14:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726953289; x=1727558089; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sv1Xt51+REJ6qseUldVGpJwkDcR1DsT84Q0fO/g01zY=;
        b=pgaJhK3/RF71/IzXFUzRZxkctadeuOx8NKfKAvug9zqzzds72fm0KlqOCL1R2vP7HO
         xBWmbQYhgB7amhWqdTFWR8vhr80L9flwVfzs83DD73f5K7taewGg3REMGvfVNfHsS8A5
         e269nKyQeWc03vRkgl1fpMahDbyiYhsAlri23HqumWZc8NR7oiT9VQmr3XpsONwndaVk
         KXxrIdpvb8P6AlM7Uvhho1orM69ExcZHk0PFGKCOCtU/mqhtq+1pqqzUJ+4fE3Z3aomT
         O+0Hrp99sHlCHDjg0pAteKOPg7Aj8F7ltC5wAwSc6PDt4bSPSGzjw0mD3uHgeMK1xfzo
         4QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726953289; x=1727558089;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sv1Xt51+REJ6qseUldVGpJwkDcR1DsT84Q0fO/g01zY=;
        b=IBQHeuZACmdGELoS0wxwE0uqwuByL9fY5OCW7eEi4ix+9Eas+Kq5xftfJ0n+riPddX
         KLacYYg4VYMOWa+Vg8Hj+zSKrZPUNdydqvf40fzrqYq39Db6tTmxgIJRNoGeKlJcXq0/
         MB4ST5jIxK2I1NIBiomD5D4Q26xWkYUeFIVyGL1baO7Pby0SCfl4Jpg9NTBhpvNJAIBc
         0h+MTrEicfDE2cO8aalxotB3SbInIYgP0GDOxsXWDUJaG6uBnDsSknHrGpdhUKzT+Dgk
         gxgDUyyrOJxEhAdcdNuwfMp48whHz3TQP52bymPYBaz9TajqkDcvoYEoycNC1czFB9r1
         RlfA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ8KJEjEngOjgGgPm0KMp71JhZzMjF3aFS/mWqfYyI7z5D5+85sKEyAKjhVqxt0wR8I6Kk@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnnq552QopoXfp23D6hUOFkyrv90L8QC1xeGKf+djh1P6qpSj+
	5xPKdy62AsPxddUMDbARoE25toc8b/iZfZTVsWdDy50ostu/1a9fq7mzmznK9CQ=
X-Google-Smtp-Source: AGHT+IHTsq5saqDVm+y4PSRF+njyLcIJFFfoV4sIth84Hce11asUbga8hoCpD/yJPHbn+yr2huGaew==
X-Received: by 2002:a05:6512:2353:b0:52c:e326:f4cf with SMTP id 2adb3069b0e04-536ac2d64c1mr3971548e87.3.1726953289156;
        Sat, 21 Sep 2024 14:14:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b4192sm2696645e87.253.2024.09.21.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 14:14:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Sep 2024 00:14:48 +0300
Subject: [PATCH] drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-msm-drop-unused-func-v1-1-c5dc083415b8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEc372YC/x3MQQqDMBBG4avIrDuQBmnVq5QuYvKnnYVRMkSE4
 N0NLr/Fe5UUWaA0dZUydlFZU8Pz0ZH/u/QDS2gma2xvRmt50YVDXjcuqSgCx5I8zyPeLxcGGDh
 q6ZYR5bi3n+95XrAJ32tmAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XCA9l6jIuwYih0fkmBs7/+esJ31azn4rphomjgMvutQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm7zdIInNhl3riGlKSk1rgC8g02RdnnV5F20Fey
 jMFqY4jSlOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZu83SAAKCRCLPIo+Aiko
 1UxXCACSlqB+A6P1dzNuIExNPQMPdzpKyXpyMltim4fr71qV920qm+A/pRY94R64jtWm2Wa6r7L
 Hxgo1o6qu+xUMNI5x6OEKefajGLyCUxWkcDxxWsHzL9MV5hXmtK1yvDe1m+kQy0lQoVV42W+3/y
 RNxRSkvxHKSXW3eU39Y1WlPVoMtgIVynk8Tkdlx+ucG2WfTjGu8b3o8MAmRMJEC68KkYOmePU0s
 QZ0k9pV2PpfQrl7+qA/WpBrssyTJgfHzSxdRKlg2lXgTCFF99ayfWgVzewc39xrN5LWou6Z58qf
 xHwspIYPq/YsSXLuHOrl4ytByW1Z50WaBmI9Bfo5Hkum4oIt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The pll_cmp_to_fdata() was never used by the working code. Drop it to
prevent warnings with W=1 and clang.

Reported-by: Jani Nikula <jani.nikula@intel.com>
Closes: https://lore.kernel.org/dri-devel/3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 0e3a2b16a2ce..e6ffaf92d26d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -153,15 +153,6 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
 	return dividend - 1;
 }
 
-static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
-{
-	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
-
-	do_div(fdata, HDMI_PLL_CMP_CNT);
-
-	return fdata;
-}
-
 #define HDMI_REF_CLOCK_HZ ((u64)19200000)
 #define HDMI_MHZ_TO_HZ ((u64)1000000)
 static int pll_get_post_div(struct hdmi_8998_post_divider *pd, u64 bclk)

---
base-commit: 32ffa5373540a8d1c06619f52d019c6cdc948bb4
change-id: 20240922-msm-drop-unused-func-b9e76ad8e0ea

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

