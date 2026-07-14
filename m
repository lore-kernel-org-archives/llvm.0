Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F1B184
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 00:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783988584; cv=none; b=tPaQDtLfRiDy50FUX4bGBq68ZHFZ0VKxpy2sSAsMxGTaghwoFEmx3Zh9EfJIWK+N+/ypoI41lpNPY37pXW2LlXsMDjZxDv0aCEkO+gu+jD6xn5QRSRv1LNDPRMaIslyJQCEDwJIhQk/53jeVTmfHKApcmXAgRswOYXhcq7TDYNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783988584; c=relaxed/simple;
	bh=vVL7D6bBR374jSiyyxvCqD0AEU8LzCU+hQHuZ3TWJSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQAOlMqvxjoInSZrWd9dgLlacrJav5xrKM4q/l7cJVBuIl0ppcpIuKUpPAc5lQpfFSJFIF0yQaflm48YoBq1s6r/n4TyLpXWcDaxY5w87xUXr8qoZ1sCUD1PLWj5fSfwsskTKHqCaVSRkZYadCMP38gtQi7yfFuguGKjVrRPAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI/9Wwtz; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI/9Wwtz"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3189218b3a.3
        for <llvm@lists.linux.dev>; Mon, 13 Jul 2026 17:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783988582; x=1784593382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PC2x/z/M+JODwXQ4QIBsSqX18lp/m00iHD8pFlNxcrg=;
        b=nI/9Wwtzjizs/sdygJFxnJoxBS0nx2CnIyQN3KNa8G5tHIPwMsTf8CJE+dvuuElEwg
         r1tIE1m/1yw94HNbVWTK81X+ZMZ7GyoY0oj28lWy3z6yN2Wq5lkPPDZjG1SGvFLG/Os4
         wsjLvRsZ6r3I+jE8QMvB7inJAGOvXmCb6Me7BjO95m7IHAVTMlhueODGO3LwrJ+Dx1Mb
         Xg6cd6BBtWjFUYUORABEdZCi7pNMppuyTjoghnlsuztQqjVdY35UlMhS+g7stvy96cWE
         qk2ry5aAOZCrsCbufWWyYtU/ubMEcPF2fhPrimDBYlE7nfk8SebeotYgeHfpxl2k1ksg
         G/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988582; x=1784593382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PC2x/z/M+JODwXQ4QIBsSqX18lp/m00iHD8pFlNxcrg=;
        b=ma2B9MuEULUTadAdLQDGn9hwgPGuL40ZIP68cXyDuDV72LKeQaeaEx/U4sllFyv2lO
         0M3pd9mDR+GdtwO78+9VW9tTkW+cMcWKW/QTjbsPxuk+RGd8v/KMp0XZHciEfGqgtgXv
         ch5JevAUrLzXeg1pRqsBSumigy4WaTd6bONmHEgXUVpQztO7n23uFA64uYxvOm6E1808
         Kel0dk8MzlmMcyV99qJ8W0Fb/ZVCK8vBplY7CSd0A/ZCkv9WWzZyI/CWjs1Mk27XU37U
         9g+HwGyAimmT5UgzKl3PimFcas9RtMfc8hu1mxQfG+7E/adE7nPwRlZHXIGmblmYtBAl
         fTkw==
X-Forwarded-Encrypted: i=1; AHgh+Rrc2p3nXgYV4vYCogfoDd63/dBH8I3DW8X3iKk3CvAhQOf/HgXQ86tQK/TweGiaTTLb4Quc@lists.linux.dev
X-Gm-Message-State: AOJu0YxpV/b4DSZ2k6SK2goVA6fRcmgO4JejNpLQbVIMVmimXimiZM8e
	iZEIQZmb7buJcfhz2Wshq/Ei/hUUdFtj05S97n4mp3K4ZYb33ilr2T7u
X-Gm-Gg: AfdE7cnsBTJa6WEHz+GZDKe1HgQXGsLRHXLtTYTHhhoeZo92p0RrVve206RgWew8WRf
	SSQEbJK8qA+4kqOeal+rgbWJFyNeQVqZxVN/AJWIWUaigN141Nfmm/Hwbo92rmupBRWMzxLfWyw
	blLhRSXlnUOnyjcOZBgPc6rrXxI76IWk+OVFxf0JKfxZiwngEm+DEbS4n1HbZCULJMPj8cetixs
	MxfFeyeLGlIztciGquEXZzl0mT15dhQaQIWaiss6/tM2+oqP+JON2YHLp0QjT9fMbx5W5NMZ4S2
	yU3A9MHg76fILsO0AR32OBmey9/GL1xHTQOUHC+7O7ZkN9TJigNWC55e2Jg3mNBS6HWkxDFU/ng
	QxqlyrUIeb5erawmtsaVo4TP0hj1tuONHfcfDnhkyu1XqG/XLusTcO/xLEnLVkLQuCUNp1zFyfo
	Q2ACrFug+LQ1eKgmsOG4SV0NrX1O+36bVFuGO86KTiS6Xkmvse0nO43DcWkBIPejWn9z8WswVtE
	iENNE4XBG17msJtY2AgMBFk8KdDNzp9OKtWrondgj5MXnHKtwOmPc1ZMi5lq+ev3A==
X-Received: by 2002:a05:6a00:3395:b0:842:83d1:ee6d with SMTP id d2e1a72fcca58-848896dd7fbmr10534315b3a.45.1783988582236;
        Mon, 13 Jul 2026 17:23:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4ff2ea4csm473962b3a.23.2026.07.13.17.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:23:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] rtc: st-lpc: get IRQ via platform_get_irq()
Date: Mon, 13 Jul 2026 17:22:59 -0700
Message-ID: <20260714002259.1392655-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace irq_of_parse_and_map() with platform_get_irq(), which resolves
the interrupt from pdev->dev.of_node directly and returns a positive IRQ
or a negative errno (it never returns 0). Propagate the error on failure
instead of the previous open-coded "IRQ missing or invalid" / -EINVAL
message, so -EPROBE_DEFER is handled correctly. The rtc->irq field is a
signed short, so the negative error code is preserved.

np is still used by of_property_read_u32() for "st,lpc-mode", so it is
not removed.

Built for ARM (multi_v7_defconfig + CONFIG_RTC_DRV_ST_LPC) with LLVM=1;
drivers/rtc/rtc-st-lpc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-st-lpc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
index c6d4522411b3..ae79ddf24f37 100644
--- a/drivers/rtc/rtc-st-lpc.c
+++ b/drivers/rtc/rtc-st-lpc.c
@@ -18,7 +18,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/rtc.h>
 
@@ -212,11 +211,9 @@ static int st_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->ioaddr))
 		return PTR_ERR(rtc->ioaddr);
 
-	rtc->irq = irq_of_parse_and_map(np, 0);
-	if (!rtc->irq) {
-		dev_err(&pdev->dev, "IRQ missing or invalid\n");
-		return -EINVAL;
-	}
+	rtc->irq = platform_get_irq(pdev, 0);
+	if (rtc->irq < 0)
+		return rtc->irq;
 
 	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
 			       IRQF_NO_AUTOEN, pdev->name, rtc);
-- 
2.55.0

