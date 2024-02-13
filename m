Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FF25789B
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707834533; cv=none; b=rk9bUrAntZs03nxu3ocYxKDBqOwEEtzopnxHdLXVeg6/yO7+0ULoHCLRM3i2Cd0TOBABi9+rLlSmjnorr3xdNJj/y4ihUPgaS+e2Q+UJVbMaHCD80ETDFxcFjeraK0n3rIlqUguh0lCo3IQ8mPjA/r+e7CAXLZ3/nh0yBugP6h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707834533; c=relaxed/simple;
	bh=9Rs+Z1D53lFg4letHGtTelZBrVpQkf1x4avjmD7lVBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djdLzR5PQj/+Pjk4AnvxgeXnpLoiJFcsrKmjnyCtSl6RQ9PZz+KaSXclhsHRc1pBvJ2154hPiaPDUB2X5jKDTJOAFCIXt8lvXBQgn+WTMyZw7tu16jUUB50siaG491g/+pxsyBqOGfnnv4wIIoc89NeuAdsUIhUOFHsfiJPMTNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PuIqAw7d; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PuIqAw7d"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-411d76c9ce3so19245e9.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 06:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707834527; x=1708439327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/P5OEV1VZDQ2Y6WiXRGS4Q89qwUlbC22uYjuCjHTuIU=;
        b=PuIqAw7dYFzncv+CEpAwRBCJ6Li/wfcVS+D760UxccHNi4sZp5WmKba0hMAiT2f9Ze
         uDGz0pLpUE8Ww42SDfNM4OrZG8Rkhn3HUnEitwzXBXsSbnse/WqCjOnIMCZJnfy+uzXq
         waGuw8vKxDGrR1IAjUEEarHF2Y4tIKFuttROAQqSb4QoIyrYuJzkJ/MOn/oF/mbNtluS
         dbWf23QdeZyXa6UBbjwzc4eHhi+DpzvQm983qMpJwyL3386wXuXYhqm+RuDAIpR+51iq
         IcJnVDlBWmHQ0fsrbF9i/PAWbN7ai04BKeQ3TkLi67tyx5W8SwC+kJQd/xtUdqBcrFlm
         4eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834527; x=1708439327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/P5OEV1VZDQ2Y6WiXRGS4Q89qwUlbC22uYjuCjHTuIU=;
        b=uxvMglR3r3TU/RVUeddbGeC1ogBzU7dhfDJYldw+/kFoDGXxvTbrUHqWKZbFOsdWEf
         HMIhBZHZ+dQV8XntMqs304Uqwlr+xlJQkhtiIyiSvWk+2jGWupffnsbDlHNzMNXEbvxT
         wRMklFPbWQQgirtB+dW55XK6jHden1mVVpZQSlODs6zadPqSdaihkcAwQjkRnBhAOHNs
         EM+vgN7tMq+5vq0qGvThf9mDSddX3THvfmuNvfdzTOOPYXVmA4rrl75nKxZdWVwWgs0k
         hGDeXqUxRCX8E4cn1xL4z8cLdVEMRysg+JL3iqSg8ZEWLc6kmJrNxNywFErEmWp3J+ru
         VXZA==
X-Forwarded-Encrypted: i=1; AJvYcCVJYigNd0EiDaUkeej7Mh/AXf3tuzrpeiiYLVmSHqEucSw+tqiXNLcbXZlq0LoK6OPmhZH5pg1jHbC69MRkyve40it9ew==
X-Gm-Message-State: AOJu0YyECwtCGiMVwj4khv0ON+fNXTTTbo9U3rnwHgh5tYHqIfoR7dM3
	9qgtAcRGjCAIR4KHuKQo2/DDEAQ+6kNgbjG7rjKgtpWPwRaZYVYVVatn6l37HaQ=
X-Google-Smtp-Source: AGHT+IGiC793LinMHbSN0tqOwAmEoL553oU7/A6JdVsIKr0NUqRw6b4JfedsvFaXrsTmYf3tExqs3A==
X-Received: by 2002:a5d:6049:0:b0:33b:830c:4747 with SMTP id j9-20020a5d6049000000b0033b830c4747mr4011709wrt.30.1707834527328;
        Tue, 13 Feb 2024 06:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXquBLIVBSe9TCBJGJYv2su4y13BafAYhwiX0ElOknAk6XMiKuZMqZpHY/sqIlHyFuQkPvSj03zBEvur9j88JaXMgQ9THxZYuC5RSujIuZBWhZbKIiLg3h6nk4DEgt2wcNOfWXzIamNTygjXtGFE7gxeuKEx+R1MNhm5+R8wsZpmRWscM+awpuwYtaYKLuMLHMagF0zXI2t7386evdi4s6AgCL+lT/aBCVJiwS/7tprLpJlWK59xPN/L7yhi7BuHSVOA+5bL+593PDYrttx5yVi1vpAh7cwbHAkxLS0iTLGlDspuk0dfeYzwA84OVRbOF0Q7jBGIFaU1mI6vMYq5vdJlwJr1ActrIFIPInnbcCWQQhMmV270rvyP/zQpekscueZ0lTROJwdFu93vyfJp/9w7T9kZXscuLUseKLoR9w4m8BHoJpJiZdwQoXXtJcGE16KBDuhR8N/T4G8QiQY2yA+eQjnilujsne457Mzk7zcEwST2R8UkRTUJtS6l09c9g==
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:509b:4241:48a3:e3e0])
        by smtp.googlemail.com with ESMTPSA id bs25-20020a056000071900b0033b45bdb2a1sm9880114wrb.4.2024.02.13.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:28:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] nvmem: meson-efuse: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 15:28:28 +0100
Message-ID: <20240213142831.3069049-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang-16 warns about casting functions to incompatible types, as is done
here to call clk_disable_unprepare:

drivers/nvmem/meson-efuse.c:78:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
   78 |                                        (void(*)(void *))clk_disable_unprepare,

The pattern of getting, enabling and setting a disable callback for a
clock can be replaced with devm_clk_get_enabled(), which also fixes
this warning.

Fixes: 611fbca1c861 ("nvmem: meson-efuse: add peripheral clock")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/nvmem/meson-efuse.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index b922df99f9bc..33678d0af2c2 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -47,7 +47,6 @@ static int meson_efuse_probe(struct platform_device *pdev)
 	struct nvmem_config *econfig;
 	struct clk *clk;
 	unsigned int size;
-	int ret;
 
 	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
 	if (!sm_np) {
@@ -60,27 +59,9 @@ static int meson_efuse_probe(struct platform_device *pdev)
 	if (!fw)
 		return -EPROBE_DEFER;
 
-	clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get efuse gate");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(clk);
-	if (ret) {
-		dev_err(dev, "failed to enable gate");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))clk_disable_unprepare,
-				       clk);
-	if (ret) {
-		dev_err(dev, "failed to add disable callback");
-		return ret;
-	}
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get efuse gate");
 
 	if (meson_sm_call(fw, SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0) {
 		dev_err(dev, "failed to get max user");
-- 
2.43.0

