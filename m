Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF25E1EA6E
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 10:47:59 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso901584a12.3
        for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691664478; x=1692269278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=L+pJzrZz5LiodQRp/U/kbzpSYWnuq6UUxyeRItM6/VS+qn+D1PDLrcfAJlUCmks3Kz
         Licj4R5ZhYqFNIyGDXQpyL/zv+UQqLViDrfb5AQ5Lk0yh0s8tkC9JT5Wi4Rz2sWltvfD
         24dwksZBWyf0htE1vPBy9QBmrbo+qPRzH8EaHBcvW31pMM5faimC9YDi9d+PxB0L0IKN
         RvDGD0ECUskqfPBcVKcp9DdgIhUjd4a6DuzkmtbPY6Y/FFnK61k2qicYoEsqIRuuzPtV
         5rb0itHN4h2ptsZeSrFedln9PwV3C4sILAvNxBhujef01IdBWcivSBYg3FU8C6qUz/HA
         Y3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691664478; x=1692269278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpZqgVo2zkbi2B7sOh6o48YWO5812KC5/SRbTNsfhC4=;
        b=OtSus4E+0SZP8HPH0dLGYsM43+KReLehQ066ro270S3zYpLgyHQRZXByOeDCfV4GTJ
         ceDa41z7XFVsl2DPGRypDO9d7GkAMBMbeQQIuSi/y8e6Ylw2vEXt4C227Gh2s+nnQsz3
         0ifxfg7oQEJkTP4ZH/y0YJmXmyJ0Hovmxx/YpxjLMM+M2Kx+jI+8TZLWtIsC67pLsZE4
         du0GsVo/cBJo6u2oM1R/EU+Ukjlrjh8nO+1LB2gvjDSI7cKzTReUM9AzFKdmnobiebIC
         CcJXtI6RmJYKQvrGlkGsF/sfU14MI4dI4nnCRe35oS0LNuH6R9NoUKo8KOySxuZTO2CP
         KyxQ==
X-Gm-Message-State: AOJu0YyjNcPrDSQZUpaneDdT2t6M6fFmlpRwa+hHyFzBz75zn6+ccDNr
	das8gM+PzI6x3f/iJ2mRYoqaaA==
X-Google-Smtp-Source: AGHT+IFi6mpqtjPUZgkNME8tljPZsCKLpCa4i79mEQYjX4KcyxYg/CD19QBrJpMdXKSWYT3AtUshSw==
X-Received: by 2002:a50:fc09:0:b0:522:2d1b:5a38 with SMTP id i9-20020a50fc09000000b005222d1b5a38mr1688860edr.10.1691664478219;
        Thu, 10 Aug 2023 03:47:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id x20-20020aa7cd94000000b0051dfa2e30b2sm653854edv.9.2023.08.10.03.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:47:57 -0700 (PDT)
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
Subject: [PATCH 3/4] ASoC: codecs: wm8904: fix Wvoid-pointer-to-enum-cast warning
Date: Thu, 10 Aug 2023 12:47:46 +0200
Message-Id: <20230810104749.164827-4-krzysztof.kozlowski@linaro.org>
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

