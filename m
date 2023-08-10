Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FAE1EA6E
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 10:48:01 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-52256241c66so1575988a12.1
        for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664480; x=1692269280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=KMQ/zCzP8/TnQe3Wo6hhI2Ivi3DhHc4D2lLfGnt9ciA00FsL4hsZH4u87Vx04WxQ3x
         RRedSie2gJxhgIafqOtTPolui5SRF7Ic4Vh/1ssUoRFIsFqtay8eJwiP2rP/GE3d5CyF
         1U8Y8epFOGqz1GAfIaPLFw4D8jQ7FzptURDIlo29y/NLoTttT7zN4Y6JjqzQPpmgZ3DI
         qkoSxsWbdO4WWARabNALqhZfBleorwPNeLZ6txLHzT3GrZ2hyPwlbJS1fKPvwSxXIh1h
         MoL9oTYywO4hnzh8dJ90rVwUuNJGIvdY3mBw5BAQWHGNEzJ2+JwSpH+gwOi61e2xzoIM
         byWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664480; x=1692269280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=XOEu0sgT80uRt06Zrw8ZeDqiLw7cL3Bu04i6ZeIofPhkNHLvakuTduem0yqP8gvckk
         pepsFV2JimnEmY2ZY1TaxaOii4LYN231Wx+6nPjGRUyHtXQwrShT+i/yhA/uOK5Y6gW0
         ARUnUIC510MUQ6t/Y2jO4oX1zJ0f4m1wnytVhOulqjCBVLHLmDC5gwvU32NCOKcjO0pm
         jNzrj6XakYx+bCC5gwY+5db2nF35QceRIOuYjFX13/msF0OcSlAfQ1azOsckMtNet/r4
         Z8pZ1/T+CJ1C31vbrH3PwJMXvatwGRPvPBqP791xLqKVjszJcYb7mhLxXMu8y4vR1SPr
         HODg==
X-Gm-Message-State: AOJu0YwTQeeULtqk1bUU+fHf4/5MZarNsKIDbW0MYeVMX05urdSGtY8H
	ZRGfjf1T0PU+AKi4GK9P0ASroA==
X-Google-Smtp-Source: AGHT+IFqyvPfsZCXo/1EPc3mjODI47QAw0qLpl21vWUgc1bNs1yO0pXM9KolaKHhD7miC+E9pkUSwg==
X-Received: by 2002:aa7:d343:0:b0:522:2add:5841 with SMTP id m3-20020aa7d343000000b005222add5841mr2074582edr.7.1691664479840;
        Thu, 10 Aug 2023 03:47:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:47:59 -0700 (PDT)
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
Subject: [PATCH 3/4] ASoC: codecs: wm8904: Fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 12:47:47 +0200
Message-Id: <20230810104749.164827-5-krzysztof.kozlowski@linaro.org>
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

'devtype' is an enum, thus cast of pointer on 64-bit compile test with
W=1 causes:

  wm8904.c:2205:21: error: cast to smaller integer type 'enum wm8904_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wm8904.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 60319b468fb2..829bf055622a 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2202,7 +2202,7 @@ static int wm8904_i2c_probe(struct i2c_client *i2c)
 		match = of_match_node(wm8904_of_match, i2c->dev.of_node);
 		if (match == NULL)
 			return -EINVAL;
-		wm8904->devtype = (enum wm8904_type)match->data;
+		wm8904->devtype = (uintptr_t)match->data;
 	} else {
 		const struct i2c_device_id *id =
 			i2c_match_id(wm8904_i2c_id, i2c);
-- 
2.34.1

