Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803511D2FE
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 10:47:56 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5236a9788a7so987382a12.0
        for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 03:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664474; x=1692269274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdCk7OUtlyVla0geNv76Vk4CNU64Mjej9PSyuuwP9Mg=;
        b=cq1kU20nMj6zkP5dpHC0Hptq8NDMOxwqXMIyqFGDLtXHdhylP/8FUA5sLq0QpIHQIn
         R6aRN019gA0L336WxdmXNVzP9H5PB795+pAKYjntNoFZwliERBALI2KEdPDDN4h7yJ7k
         /wNGeKxG5ZUdAKtmwd8Uql/mAj42Wkd4FeXd2mE1g6+aCRY0H/Xydvfx2LngX62guhQf
         Q3Z92vB+nZf827DmAqmBMJJSv+FPrc1lHcIoILW7T4qVr2jlt1WlRwYv9JKmis44Xg5e
         rzrcwyp8+z1Pk2cZktUcFxabe/SEpMY1Ukio/T9ZiJOfp3w6zfgY3FbqF8SAGFn+Ty6n
         R/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664474; x=1692269274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdCk7OUtlyVla0geNv76Vk4CNU64Mjej9PSyuuwP9Mg=;
        b=RxlTVN2DocHNmfqMXV58WvyG2ID88ZJYvZGX18LFFyTnqiVoYC0hLgNIRy7ElMwU7E
         LZkLe3wrjTCxBBNK894h3Z6SdLOs0q4YsjxLwJD5nEmmD8SwNjgCvi9CO/Gel8z7KWzh
         ADcthH/WLpVIlymygmGsY6axjyPKjGaiY8Yu8Et/HYTJTuX0Hishvsik4/P/ZGekerSO
         eSVnHSN3w7a7zoxSMdFUiQ1rM6tvJLhG4+5uQDS5fGyvPWJ5R+99iwL3Tc7Zv7BN6LpW
         LK4Gfqt+jjDbelW9vKL4QYBWJjfvqTmPyd0VPik7jZssMlWXzZhq1PBRYrvX6BMS7wYC
         1EWw==
X-Gm-Message-State: AOJu0Yyd5HNuHYh0kzG3uVDfYc9Js9ynKUBeLZxsXbZXVhGrF2AtYeKD
	sZ6ovdA/SyN57AWLuH3kaXKKKQ==
X-Google-Smtp-Source: AGHT+IEnAtHjVByssGhPTqQELF84XSx5/0DHEL7BVsY09r1D07osAN5bMweLFHfpBNKn1GaFZacbBg==
X-Received: by 2002:a50:fb91:0:b0:523:102f:3ce0 with SMTP id e17-20020a50fb91000000b00523102f3ce0mr1833711edq.21.1691664474683;
        Thu, 10 Aug 2023 03:47:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:47:54 -0700 (PDT)
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
Subject: [PATCH 2/4] ASoC: codecs: tlv320aic32x4: fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 12:47:44 +0200
Message-Id: <20230810104749.164827-2-krzysztof.kozlowski@linaro.org>
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

