Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9AB63117
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 21:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861501; cv=none; b=G0awMU4Qb42+lzMwA0miXzYhjz8pY7Tdf3sGn+4eyZphyT9nVvLOlEDBWBQnLMqKiCaFUzP3tg0ou+dlddE6HsN0GLfsCTE/l0s2uO50VBeCMG4JqNyQGRSCV/ggCma5bAON7nO5M4V3KtFVPlktP0eXnBOb9lsihiGaMIiX2vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861501; c=relaxed/simple;
	bh=jfZkHq9HMbZcPnc0fldRolB1xckrU5dTpOn3zFrSjtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wzhpo8s9RZFM0mCZUz2rb1Xv4lOR9xGzizEEbPIYW5WdZsQ1WdovHCYqAZvMPCQOPq4SNr/T4DD8BoYZfameWBVyRlI8mPwZFtBwuoy9KjZ/EqiCn6cpN60TsfJPHZNMgSwaGfzBeS2WBgWqr6lrXGgcN52MoN88It4/WpaXbdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LFRrDeWS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LFRrDeWS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33b8807b55aso1209570f8f.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 13:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707861498; x=1708466298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhlnphO38kFK64rZw6/MYfY4vE6pLo1I8JNTrKfTc6I=;
        b=LFRrDeWScTCppjWxFuw15Jl9qLtCpBECcudmsn4bno57PSDez8mMiVtDoHmu4CtznF
         Z64aw58fBft1KrBQykEYcniWGk1hlausi94BgnXnc6LApscyzTQC1dFQi+oiyZPkOMqn
         r/NNh6ma87q7wypjozNy6NuPZE9pf4dh7dYTpLEZLA6df4NGRGxl0LIQZ4zZehHCRi3v
         YvTsPAvMS/ZgIk75vwRZIOkhVcUgjfgbuyOmHPzxq1KY1+8xW4JZqu2BMPtCU3QD8GyL
         Aw3KBkHAwFS3D6o9bo7UEwuPXpkaPcAtRTf691pzDOjkW/vrgHG4Mdxp72UNYw8j/KKS
         fOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861498; x=1708466298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhlnphO38kFK64rZw6/MYfY4vE6pLo1I8JNTrKfTc6I=;
        b=KMIpp80/BZMTV7cODDX1sLzj1TdpS7UT5oPOE8kKrdIBkqA6/cTAJMK2ZR4T1cd544
         JM5RbtAg6VGSE1nb5yGRWSH9GDoRJytvEitNRIon1+yRWO5XN0cxuW0dvLEPLiqRNR95
         1v1SZzLBOQx79oms/YqB0sCe91FBoF5nXcE1KWBzxVV01WUy6lXO/cmb1bciCgsb0Zw6
         vOjHnFmpEMGY2kh1ScdF4/AIAA/UYSAT4lPAZlyiISEISn7GCgRyHtVuGtXOvlCBdXET
         f7wBTmY9LfhBRqjpUVCa1XhA7Qc7iNvFBJ6ZWrjeBpkSyOUHwLrIwlmTIO8DjiiHCP29
         ukIg==
X-Forwarded-Encrypted: i=1; AJvYcCWmIANGdmUwBpW9lRlAFytzIFjRR5SEavM4szUj5SUyAn9DXNi+uvNQSG2CeIpjgDKOp4AwqfJDQC1X6KMnWIIHdjsadQ==
X-Gm-Message-State: AOJu0YyZtyaRoaHldDp7yG/WG1vBqwWg/wROCafLMDvcmdVg8BHbPnSO
	+oSgsaWV7znDesEOxKo6j34/gWVVq/UImBPFYl6ztuqpUWTYJ2PHCJGuHMtIv9U=
X-Google-Smtp-Source: AGHT+IFZ3n4e4596jcQPvb4/M0w5BxopAfbxvEnr7lIBU6iDbCf0cnXOAXxypGjN46bUXfIJV5p8/Q==
X-Received: by 2002:a05:6000:8c:b0:33b:eef:86bf with SMTP id m12-20020a056000008c00b0033b0eef86bfmr388447wrx.25.1707861498107;
        Tue, 13 Feb 2024 13:58:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJ0VVy771lMRNflwR2yXi3R6/+dub54OOGnNJcvbuYIcEQsS5QlZrroSyMaWyijwq5c2hC2NvAD1pLPuWErPD4resXTwAhLmgxRmddslpV+8WAJTZhqazEat8FROH6ieAWumwv9lwt2Yn+FPrC6KmppIxwT/69asnfrePkZYVyJm3MK8h6ONvWc4IVBliqIFds5PZnsuGbkN5YWb7v+EZ3lPaVlx8GQXS98E5BHdIkhe2fksr9g6fEQtBkmWZfjgIWHMdjABQC/Deor8k9BzNBZ/jZxeieUroSwXKpwXdAHo9GV7XRnDmuBhbRO+C92L59xtUs95jer13d1n3ZBFTan8/bDFyhPVJtW6W85pRJdzcG8SMhFTgzPnvTI9XyGvrfPCYEwTn2530CpHXZlnm58uKPeqEc/f4S8CjWah4EKiga/vB75UKu5a61ol+z+cTSNM2/+4nM0LDdsn3Xe02hOUew7hU8xN0JxTWaapP3O2LfNImUG8yZiMxgbypKxrbgjYv0pwfGsy5NiexdQymHchYp1g1/WlBYRa30jRBImDVuDC3qnO+VtTeO4PfPh4VlA4esexQfeGrSzLs05LRvxWwnxHyNEIOclcbc1msQ1BOqA/4=
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:af6b:4350:776e:dcda])
        by smtp.googlemail.com with ESMTPSA id r3-20020adfca83000000b0033cdbe335bcsm2415244wrh.71.2024.02.13.13.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:58:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 2/2] ASoC: meson: t9015: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 22:58:04 +0100
Message-ID: <20240213215807.3326688-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213215807.3326688-1-jbrunet@baylibre.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

clang-16 warns about casting functions to incompatible types, as is done
here to call clk_disable_unprepare:

sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  274 |                         (void(*)(void *))clk_disable_unprepare,

The pattern of getting, enabling and setting a disable callback for a
clock can be replaced with devm_clk_get_enabled(), which also fixes
this warning.

Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/t9015.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 9c6b4dac6893..571f65788c59 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -48,7 +48,6 @@
 #define POWER_CFG	0x10
 
 struct t9015 {
-	struct clk *pclk;
 	struct regulator *avdd;
 };
 
@@ -249,6 +248,7 @@ static int t9015_probe(struct platform_device *pdev)
 	struct t9015 *priv;
 	void __iomem *regs;
 	struct regmap *regmap;
+	struct clk *pclk;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -256,26 +256,14 @@ static int t9015_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, priv);
 
-	priv->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(priv->pclk))
-		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get core clock\n");
+	pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk), "failed to get core clock\n");
 
 	priv->avdd = devm_regulator_get(dev, "AVDD");
 	if (IS_ERR(priv->avdd))
 		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
 
-	ret = clk_prepare_enable(priv->pclk);
-	if (ret) {
-		dev_err(dev, "core clock enable failed\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev,
-			(void(*)(void *))clk_disable_unprepare,
-			priv->pclk);
-	if (ret)
-		return ret;
-
 	ret = device_reset(dev);
 	if (ret) {
 		dev_err(dev, "reset failed\n");
-- 
2.43.0

