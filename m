Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3572512D7
	for <llvm@lists.linux.dev>; Sun, 27 Apr 2025 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745751087; cv=none; b=cH+DhfsCPQsIRHIZB+urru0HlB49vocGoSzh+cC9I7nho3ZkWfd9endeOaJ1JaxuhdTyzeuiFkP9HvxFniQcqhPhRn8X2fYWHRWHtWFWMqsq2PERKmq5zOObBrkdDY8uQS/dIVkkYgAZW4+rUrdE6THq10MhNKgmOc5SFMg95sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745751087; c=relaxed/simple;
	bh=Uk35tE2qO25Ol/DPpUFiuym8i93OvRDohaSn1NmlUNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0qw3Wsflbe3a/Bq20ONJ5812Tcl8jbTBPvHToOZhO7dydav997PJF4Z97X9UY+S8jcy4T58H6ebwjmTgWFSm06MXhgbS9T11cchewdp/veR6Tn8YH4lgpDswA6ByAh5xaB49T3k+kfV6OCFvpYb2B9PWJBtWM6iH/F5Kotd1pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x6yy2ln3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x6yy2ln3"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f37f45e819so627449a12.3
        for <llvm@lists.linux.dev>; Sun, 27 Apr 2025 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745751080; x=1746355880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrWWKZ5utl0kO8/6Sgtpal0J9i01h1Iy5zytxjONv8g=;
        b=x6yy2ln3+ToYKtcmJ2tEptETCKkdrzpATtSwMW4HMlAYobP4zEim8QPzRwuczd8MC7
         pJFDtgYJmnygW4nPwWKmTHy4iwv9fDe1Gm7gq0klGqluQfrTdAoxZ63G0CeG2XU96r6w
         lj/GQJT7TR9ttdHoxNqrJccAznJO+9/v0SaD7svD3pDPDGOrYldwldsEuqeAQJn9Uaei
         MD+avKcQe18geImerHmP3O0Ncf02tCAuuCZmutnVjH1yKaBylSw+3P4ZSGY2SplwuVFw
         C+PqRppXpfH1q3oV9YYlBv3fBnP3NQn3tJfFBvzykdbjTakuwP/5QItT7saJO2MClsLo
         yLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745751080; x=1746355880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrWWKZ5utl0kO8/6Sgtpal0J9i01h1Iy5zytxjONv8g=;
        b=oxxC6pa2CGjR79LWvbfrzgB2XhQtNuga4cq3UbT4tF+8qCVvc+iERAlYZJpodXL8N7
         z1eF32Vq9QW+7IBYU98FPyPAsmWASuasAqVConUooVEHC6p6Q3AE0usOGZ8UNdNf9hPN
         XeaMip/9Wfvnsy3EsXHXnklmixrqkw/lE7yFE8tbqt6ClBQ5xqkjm1Exaxnp2Awh6HV7
         LGFUkE1Y4gTM77MspyR6PpJuOStNQLqPWlzBXgMjqxM4jPo6ARP8YUe5EdIMT/HXkFmW
         S67i0GgvPTquiLZDJ0KgeP8wvuCrj4nHwEDYrQCGfx/Bnd0GJjumZo7uEkR3431/ZX+z
         HUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2O629GMkr3exDXLM8jKlD1P3ZWO7YKS42Yxx6al2X8GLnbwfomkLeCAVW8wREsx9h+Mvn@lists.linux.dev
X-Gm-Message-State: AOJu0YwlHiJFeGyAvqPno1JFHgb5+7FEQ4Q3cJ1SG1Sc7N8JZIV8xt24
	TwWtszFSg7F4zPkgT3WmCk/cmBvt9lcjJCaBu8RJaCHvp4NIVogSldYsF09sRzM=
X-Gm-Gg: ASbGncv6LJcWiohq2CwPpiN2/8DJpcTXt0BE/12+WjAKMf7q4JlcZX3uCSAmA4g/axi
	Kvx21Gqs9f6mS+pLoSHJ4hBtkCSoIO7KMkUpKOh+wDWuXLKM8C4OQTmQBbQSuxhh5fEbMIyTWT+
	Gtr7S0JmHXB3vPwQoa4rQBJYYX33oA0QNhokXeHe0e4iK8omrME2tF7mpte4KsDD8GFTAAFmxZW
	dkML0XQn8l2Ivm72Tiqa8HaBToKJMBspDXbk0BiquV/1zpwQKIb5JTjuQRhvbeRIoTqYNS0rU2g
	DphZGJ7JaXEgT2fBu68qkiofHUBRlVFEXYReuGkz5LDtAAwbMg==
X-Google-Smtp-Source: AGHT+IGUXQAnom5Q0EWJSItpVLYLtZk6UF1nj50XD++JXpYgnBPgROhaxvz7NIhI7DF5oF4HYgfXrQ==
X-Received: by 2002:a17:907:948a:b0:acb:6081:1507 with SMTP id a640c23a62f3a-ace713655c2mr240652566b.10.1745751080157;
        Sun, 27 Apr 2025 03:51:20 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm425679266b.73.2025.04.27.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 03:51:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: codecs: tas2764: Fix Wvoid-pointer-to-enum-cast warning
Date: Sun, 27 Apr 2025 12:51:07 +0200
Message-ID: <20250427105105.18164-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250427105105.18164-3-krzysztof.kozlowski@linaro.org>
References: <20250427105105.18164-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1222; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Uk35tE2qO25Ol/DPpUFiuym8i93OvRDohaSn1NmlUNU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoDgwchoqo8qZ7tpRlydSzbLL5LHIcT5imcAQdh
 lmBJlaYMa+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaA4MHAAKCRDBN2bmhouD
 1zBvD/wMLwsj4jm0yAIY7dk4aMpXOmJG+Ltq3m/n8p9kRV5iNva1LvWrKSCPnUds8dCcXnYROgi
 MdUdgEsBa3kdCGUeRv5EUhyEM41jnBvWxl0z/ipgl3va5F0xZVRhRrUuegXkpQAJ37X0Zt56WYA
 9C4SZ91I3zR0K1s0nOGPg2SHv0eBt+ApXW1GVR366AB57TvkfnhPqLIHZ0lDxhXh+cBzCxKfSp4
 aGe1+NBUSQFDKg9MJWdP7yKsTRX0IHu5E4FKkRyiuti/uG/FfWg6kwDUt4J83lfm8RqB5Ne059A
 CLTJbHpxZAXMiyDZXcVph717ix3+L80SFy7RhGmgMZM+2BGGZA9FoHx5f5XbM8aWDENRp6L1rmi
 2acaOSY0QMJMXNmzgFwYKYvqNynMyqvRbdK1L5h0RNNKbsGE9lWFAgw21fCgujLpMvLvMxOg0Yx
 qG9unLzCUNU0Tqx+iMmypnYGVRVVI2wOj3/4mS+5AoElwxqiCDbX9KORuEEDXZwasur1m4/PzXg
 /3EQj1gkjSppcgSoDL3SLJh4yBvHJqyCme+JL7S7uhLCJiTh4bkPY+HUTwGe3T1xFyygKh08oVI
 0hTawH5Kve+sJPrul3RpSqYjNRzrtBhBeZwf40omUAdndG/ohII/3jUgIwsdw681nAZHnZkJzu9 9eJJWWpVw+haFVA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

'devid' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  tas2764.c:879:19: error: cast to smaller integer type 'enum tas2764_devid' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard for more than a year, so
assume the warning will stay and we want to have warnings-free builds.

Link: https://lore.kernel.org/all/20230814160457.GA2836@dev-arch.thelio-3990X/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 97968ee3af42..36e25e48b354 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -876,7 +876,7 @@ static int tas2764_i2c_probe(struct i2c_client *client)
 	if (!tas2764)
 		return -ENOMEM;
 
-	tas2764->devid = (enum tas2764_devid)of_device_get_match_data(&client->dev);
+	tas2764->devid = (kernel_ulong_t)of_device_get_match_data(&client->dev);
 
 	tas2764->dev = &client->dev;
 	tas2764->irq = client->irq;
-- 
2.45.2

