Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB762A14
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 21:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861501; cv=none; b=p//NG184mdxBmtk6OpejlULph1wEgIMdI1R/Bi1UhCCClUu3aXeMaI7N/W9yeKh9IYYr7lzQlpsVt1UpxoFUQ7o1Vz2ZsT1s2ij10rnawvjNIxm3n8tYGGXNGkw3pnIAKfWM5KUzU7YGgKYfNB6cZ3LrrXzPrTXTXpjK21ORtGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861501; c=relaxed/simple;
	bh=XCEzGiySNrzVsGywGANcAcUebyxPHAJnm9xzwLcysLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZOuPFGz/taL5iac8enLJ4O4xUJWuP4VU4kl+ZqsyZqfuxCw9vdLq96mz8AtjVjcfs0A9lG+2HCsiC6gcIQ/bfP46SyFqO+jSktsi1kcSHwjOYG9ZPNPUl/OOUC4lN1HdWnMCIUBF6+5ZeG83bPAK4KMQTnP9/GaTTDFWdS9YNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lY9MswSx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lY9MswSx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-411d3c75026so4517215e9.0
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707861497; x=1708466297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqyuBahTPLTAYF+110cUFRV0sBjf6cZZgU9lFVSbKt0=;
        b=lY9MswSxKWIefItDvPSVPKPn/inKTq+xNNEwB3lD9V4/cItBFq+YtLQo/eUN3g4wB2
         g6s3kU12hUJTW0l2TkhmNIU34tQ6Dhe6k01eW2Zx1fBj1Y0c4/wiwVC81fBmELSQojZe
         QdKeHeFmBaVSd+f5CyC/l/VkiqnSYAjpUT3CFwH4ZrWck5On4qDulJr1rKV7iPjM5Mqk
         7QMUohtXpQdh8MC4AX1e7L3We0oeYMhz4k3npDAxA+H6fEyKMTlyNKDJeUtsj/Z3/l2q
         oWAf+fFWIZPITRPn/Eit1ZpIA7++b/yLY5EWJZ0zHctQ45UMBT50JdBE+dlm1pPdswhm
         +FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861497; x=1708466297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqyuBahTPLTAYF+110cUFRV0sBjf6cZZgU9lFVSbKt0=;
        b=bUPz4H9K+g5Mg9+CX5UR/QD6vzqdQ+6WwsRakoaLpYA8wL06Pfe0G53/UQlDMc6Q7c
         yROU+5SFhH+p+23fBB1fhCxnWU+lQXvCTMsrNcPUglCLprNDjlWlrVz+lXVDz1o4xgJE
         fDG4Rft712OJHZlmZWqsCt0fNqVPOr3vCnMMwZccOU7rargLxXMlatlbtZjx1YFwk86k
         xF8ujRzW5dqBzd0vOxuDcqgZ0kK0/LPhVzDrK6raB+F1O37ekrftYg+wXShXM6jGhIpN
         VBOKrki1jOPVUKhK6riJJGPqKyuwDDMh/f5MuEQoMuzfVyyZEys0UFiSOZ3g2ejH2x3C
         oAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUrw518oy8FHFNDRQUkjKBYPpur00OvJmBqGLHq3TL/P3zYG4iUpk0iQBGaiMk5kHTiGFxCe/KPlJ7uZyDIMs5U213wA==
X-Gm-Message-State: AOJu0YxpXC8zHGarQ3nqLNCvqrVv3WzrhT100nIR8QvMeixcHe8tjDjz
	yUBpRYmjdwdsx0bfy5H1OtoWup7xbmDBOpZv7ASFxDKPGQLQCXqO2ekf+pgio0c=
X-Google-Smtp-Source: AGHT+IFQmIg0n0GJLfQcjyAmY5aOtHbpVk0kKAcJWpMWmARHiy2H/vQt8V6epQv+QeBGgNL4tEMGfw==
X-Received: by 2002:a5d:6ac3:0:b0:33c:e2d9:ad36 with SMTP id u3-20020a5d6ac3000000b0033ce2d9ad36mr369591wrw.20.1707861497019;
        Tue, 13 Feb 2024 13:58:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXatIVkhfi4XEgXz5p/gNLbo1vWmEs55v5qyHuI9D0zr8zRt8TJ8ZvxAEkAOJ8a3kznQNaB9CwA0yXFBxNMvj53rHwJ036OVmcocDuLVPfg+PhWLsrC9mlRpniTJxWwH6grCm6vDtmEPJKmWES7/cqSCgpdP/SP1XUCZZN/cAwDr9J27u3hbZyUxvljt3BMCZHmzTpd0QV0bB1cqVdFgl8r1MWmfH7UPkPZq5G2SLjKlWyYV1Bny7ioTDZ9a0tYFo0aVVX3mZT8YahfGGdNcI0a2y2v5rR2Q//H/EU2oWk+rBkR2RDeq8lDwto1myB3M5HTP7it3hesDm99vHUtWHz2n2VKv4Q4O3O2jjAJiuJUqYaCCLIdo0fHDM/dFr/tAaBy30Q6tJz0fcYSUXI8mhoAxW/AWT/oJ1y9vKLuEWj5f8/2i42oUMG6NlN/UzLWMOBw3vS/ecrqYiEobhSloI9qEMgg2SNdaAJXIWgEP2QA8Ev5ZO4piJzUKTZcua59IhWs2zPvSJydJocUe7HdqVKGsdBiuUkwwPb1YyCR9TYWE9OrWora9hpg0mrQsWDgwKLvGk2X3utxRuNVkTTdirRufduCj547YWj/gaQCGXx+o44FtvU=
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:af6b:4350:776e:dcda])
        by smtp.googlemail.com with ESMTPSA id r3-20020adfca83000000b0033cdbe335bcsm2415244wrh.71.2024.02.13.13.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:58:16 -0800 (PST)
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
Subject: [PATCH v2 1/2] ASoC: meson: aiu: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 22:58:03 +0100
Message-ID: <20240213215807.3326688-2-jbrunet@baylibre.com>
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

sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  243 |                                        (void(*)(void *))clk_disable_unprepare,

The pattern of getting, enabling and setting a disable callback for a
clock can be replaced with devm_clk_get_enabled(), which also fixes
this warning.

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c | 19 ++++---------------
 sound/soc/meson/aiu.h |  1 -
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 7109b81cc3d0..5d1419ed7a62 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -212,11 +212,12 @@ static const char * const aiu_spdif_ids[] = {
 static int aiu_clk_get(struct device *dev)
 {
 	struct aiu *aiu = dev_get_drvdata(dev);
+	struct clk *pclk;
 	int ret;
 
-	aiu->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(aiu->pclk))
-		return dev_err_probe(dev, PTR_ERR(aiu->pclk), "Can't get the aiu pclk\n");
+	pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk), "Can't get the aiu pclk\n");
 
 	aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
 	if (IS_ERR(aiu->spdif_mclk))
@@ -233,18 +234,6 @@ static int aiu_clk_get(struct device *dev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
 
-	ret = clk_prepare_enable(aiu->pclk);
-	if (ret) {
-		dev_err(dev, "peripheral clock enable failed\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))clk_disable_unprepare,
-				       aiu->pclk);
-	if (ret)
-		dev_err(dev, "failed to add reset action on pclk");
-
 	return ret;
 }
 
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 393b6c2307e4..0f94c8bf6081 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -33,7 +33,6 @@ struct aiu_platform_data {
 };
 
 struct aiu {
-	struct clk *pclk;
 	struct clk *spdif_mclk;
 	struct aiu_interface i2s;
 	struct aiu_interface spdif;
-- 
2.43.0

