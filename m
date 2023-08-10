Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA0E1D2FE
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 10:47:58 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so1154777e87.0
        for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664476; x=1692269276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdCk7OUtlyVla0geNv76Vk4CNU64Mjej9PSyuuwP9Mg=;
        b=zfeXdylhcEBVDrqAny1SLIvN9Crr5v54nzF3ZLf3W/Eif1dNWT9wNlCKgPCQL/o0/E
         iYzjBPH3863DIk4aENP9BsmFOE0Y+EpLU2SlozYtRxJb4GQaDpNAA33nYUQsy3M2dVsT
         OpxZyOWl5CCCLP6aJa0vYV6RmTQxA+wi4TcMmhitHOdEobpn5o5vLFCXEirr7/Qm+DMr
         G5Rpk7tIg24B9EHXKP/uHgwg1ZuSYKfYQmoOFP6aLTRJty/VCoAZStEIc29/gNuUHg5E
         VwUyx6TO9alL/BcefRo7HnARKktyocMZXCzb007Et2yQXMf/XrlEBt21mzzwDFc17QPK
         ar7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664476; x=1692269276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdCk7OUtlyVla0geNv76Vk4CNU64Mjej9PSyuuwP9Mg=;
        b=ciZ1EVM7ne05UptOptPyJHO2vqPsXQsrIqNCw2IUUCvriY3js3noRUhOoWjIhseXgE
         OLP2zDoeH0vyz/Gz6SLRB48IPZtXZ2K7M0xR8VuiE+hreBz3rEOZq8bawKp6H6QjitbY
         Z1smNvA4dvLSsia01Y7ZgrYVBxxhwX6Q0abRB6Mb60WgKjKl4RkDSHf6TprJwNfvaeXk
         spPLo+C+5h6CIYb9ZUNxl+Irhy7V1b+W2UqJ1Z17Jeri8qBxRXvivp69gPfPHdRxmo9M
         0duXOTOtlG9GaRO+AMEqZsmio2WdH2fsQwb9vE6UnbdfsLhCOgUHsKqRKOSJE+7iYmOX
         +MVA==
X-Gm-Message-State: AOJu0YzP1BzFOUe/dGGFnNqw/qmegFqvI2duM6dOCA3vTdkeH/kOYym2
	AprJ6MnISNZrtjBqTgvRQntGbA==
X-Google-Smtp-Source: AGHT+IER0Z61HNUztY8QpmTryefpq33DBRiWMkpaT+UcHCgK4QowLfvk76l0MXCWns6xcZPsgfbbnw==
X-Received: by 2002:a05:6512:4013:b0:4fe:c6c:ac95 with SMTP id br19-20020a056512401300b004fe0c6cac95mr1693259lfb.35.1691664476514;
        Thu, 10 Aug 2023 03:47:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:47:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ASoC: codecs: tlv320aic32x4: Fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 12:47:45 +0200
Message-Id: <20230810104749.164827-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'type' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  tlv320aic32x4.c:1352:18: error: cast to smaller integer type 'enum aic32x4_type' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/tlv320aic32x4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index ffe1828a4b7e..6829834a412f 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1349,7 +1349,7 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		return -ENOMEM;
 
 	aic32x4->dev = dev;
-	aic32x4->type = (enum aic32x4_type)dev_get_drvdata(dev);
+	aic32x4->type = (uintptr_t)dev_get_drvdata(dev);
 
 	dev_set_drvdata(dev, aic32x4);
 
-- 
2.34.1

