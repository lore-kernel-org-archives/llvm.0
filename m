Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF58281530
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 17:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107936; cv=none; b=u/GNKcEB5uQEoiqtxrXT6C2IW2AHxNGj7hPsR0pUxJPREDxQtko8OjFGmQb6O7Pk5uZFVMMLPsJBGGpgr1mjwSzB3ezZ0RQwQDHaTmvWmHu+4ppwmw9YAVsXJkmTWEGwrUlvWo/2j4w8vWl/eYjZPW3VoeqHIFpWOoMUXdV7YcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107936; c=relaxed/simple;
	bh=vgbHVbyAdNxxqlJ49fGdNGtTt3OgYs9o/Lygu1bq/OA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kku9tEpSDcxLaiCOZS2EIKLuRDeqnQYkRrHIPjkda+I95/FwcKYIHDjT5fGkc6OUWREtAnmb3rtk3t3OvxdnbfPCIXcYvwShUZERlaR5Skxw0HxLBeRGbYC8cEXJJNlsQxGHt+Ukr7t9SQ7wzwe+a7z7XBofkgaRYjFqZ21Etyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUTR3P1T; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUTR3P1T"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so3379458a12.0
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107931; x=1741712731; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwGP1hOkgqyt7cuslt+mBb5Pi8swKaj/YmncchBevCs=;
        b=EUTR3P1T7Ab45CgIL6hnulwlBRWwNZNJv3AgQQUo3H28yVL4eMWdT6lgsdNV7RV/fs
         Mmfp5dp88sBjA4MgtTjCctpa6BOShY96FE7Koc5lRY/LQrTSWJcbJZ9ObLyJinWUL+iq
         YqfennPFkp9yPfexIFWWTfDoMsUQX+QbdOyWt514/yvupCLR9/gVOiCz6/kJwk+Jrdmf
         wk7g3cpbeHwyJjJFq3DEm6pG7PDKRrTMnqO1o6H28eghFR2hIvSqly/sIsW5/yd2SJ6/
         5WzgLQHQ2Q1r1bHwRL4yYZe6VLcHou1Mxd4aBQAjsK/2vgmF5mzTGZ7dXwIbwZaywLt5
         xtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107931; x=1741712731;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwGP1hOkgqyt7cuslt+mBb5Pi8swKaj/YmncchBevCs=;
        b=VJSDimqXfPW7TCW/K2l0Mnf+IQcK4+VjspiG7Vv8tKRj9zdkDyuzAaHpggW3b6STxi
         06Bldw24wAHOCp+MsVnkNoGWi5daHBam8fuQQzSuMooV2MgDMCvLaWh8ApJP67sKKnRF
         0cr8pFYk4XJwt1pYRTp+g+wZ12OieFj3cIvXHEr/5tPU11JvRvK29xkhw0M91wFpAPpc
         2TRlwQn62hDZu1C7SV6ExVlMlMtMuNzpkFtD/6gN82+mFsGNbg1+OjbBCE8sS5E1wyr9
         A06fNFWw5dIL2WGORWWIhLViu8SM+Y8ayoU8YGy/KVnQI5iDSEHTZNAbKUZsy7r2nRLc
         JuMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZBEbBu9OlB1WRrbxcBKeEAFDhk3iVL6y6mo78u4a4PLOgiixVkA6NB6HkblrUNjRdcAf@lists.linux.dev
X-Gm-Message-State: AOJu0YwRRe2Fv5AsRxNbkDamnSV9km1oKpRdgA1QCP4y7Kw3HCD0Witz
	efuOu3EEVX578TYIaHENMUUNOl0QuDTYVvvRi6oitBnTnch0JsyGRrjVyLfRn3o=
X-Gm-Gg: ASbGnctA+aQaJW9KBk8vFQ0HVSnUNw4TinT2o1E9TYkdUrXQIsxzFqe4QASRL15coI6
	715TQGS6zyOK8BrZKY3W9dNWZE0xO2liayClLZtxypQVAuVXqyIPsr9appXq22GNmxErRh4gYXV
	eY1Ymcn8jdR9LR97ZebyRhQLNCdeyciwdxniBCiwSB+Q2ZFL2T5C9lVDa60q3gbCZPKfQYZxZyw
	EwBJYtDhFnW42nskM4N3nuvJRHQhHut0EnoPS7MRpFLS7N+E8mwsuNieJwSVWpdyoI2byjArcc9
	3fryUlLevhEUfGX6Qu3wStftIY98NS5jPVHrScvuHywQ7LLD7z+ADm0ncc2W+1SZwWe4wI21525
	o/LwWKnneTBikLjqkzfIkWy1NN78X
X-Google-Smtp-Source: AGHT+IG1qDKc0hst2zevKKhfPXC0MrEb14O70/5mMsp5hFfaUprLxoI4xNFXRR1d5hlR/z34qhDcpw==
X-Received: by 2002:a17:907:da0:b0:abf:23a7:fc6 with SMTP id a640c23a62f3a-ac1f1185263mr365511466b.16.1741107931351;
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 00/16] a few rtc driver cleanups
Date: Tue, 04 Mar 2025 17:05:28 +0000
Message-Id: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANgyx2cC/3XMQQrCMBCF4auUWRtJxhSDK+9Rukjj2A6UpExqU
 Urubuze5f/gfTtkEqYMt2YHoY0zp1gDTw2EyceRFD9qA2psNaJTsgYVZvLxtWRlMOihNXghb6F
 eFqEnvw+u62tPnNckn0PfzG/9A21GaTVYGyjoq7PO3GeOXtI5yQh9KeULAj75TakAAAA=
X-Change-ID: 20250228-rtc-cleanups-12c0b5123ea4
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Hi,

While looking at RTC, I noticed that various drivers are keeping
pointers to data that they're not using themselves throughout their
lifetime.

So I took the liberty to drop these pointers and this series is the
result.

The last two patches also convert two drivers to using dev_err_probe(),
as I looked slightly closer into those two. They don't exactly fit the
general subject of removal of unneeded pointers, but I wanted to share
them anyway, since they're ready.

Drivers other than s5m were compile-tested only.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- s5m: fix arguments to devm_i2c_new_dummy_device()
- merge two rx8581 & sd3078 patches into one each (Alexandre)
- Link to v1: https://lore.kernel.org/r/20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org

---
André Draszik (16):
      rtc: max77686: drop needless struct max77686_rtc_info::rtc member
      rtc: s5m: drop needless struct s5m_rtc_info::i2c member
      rtc: aspeed: drop needless struct aspeed_rtc::rtc_dev member
      rtc: ds2404: drop needless struct ds2404::rtc member
      rtc: ep93xx: drop needless struct ep93xx_rtc::rtc member
      rtc: ftrtc010: drop needless struct ftrtc010_rtc::rtc_dev member
      rtc: m48t86: drop needless struct m48t86_rtc_info::rtc member
      rtc: meson: drop needless struct meson_rtc::rtc member
      rtc: meson-vrtc: drop needless struct meson_vrtc_data::rtc member
      rtc: pl030: drop needless struct pl030_rtc::rtc member
      rtc: rx8581: drop needless struct rx8581
      rtc: s35390a: drop needless struct s35390a::rtc member
      rtc: sd2405al: drop needless struct sd2405al::rtc member
      rtc: sd3078: drop needless struct sd3078
      rtc: max77686: use dev_err_probe() where appropriate
      rtc: s5m: convert to dev_err_probe() where appropriate

 drivers/rtc/rtc-aspeed.c     | 16 ++++-----
 drivers/rtc/rtc-ds2404.c     | 14 ++++----
 drivers/rtc/rtc-ep93xx.c     | 16 ++++-----
 drivers/rtc/rtc-ftrtc010.c   | 17 +++++----
 drivers/rtc/rtc-m48t86.c     | 14 ++++----
 drivers/rtc/rtc-max77686.c   | 37 +++++++++----------
 drivers/rtc/rtc-meson-vrtc.c | 12 +++----
 drivers/rtc/rtc-meson.c      | 16 ++++-----
 drivers/rtc/rtc-pl030.c      | 14 ++++----
 drivers/rtc/rtc-rx8581.c     | 85 +++++++++++++++++++-------------------------
 drivers/rtc/rtc-s35390a.c    | 22 ++++++------
 drivers/rtc/rtc-s5m.c        | 58 +++++++++++++-----------------
 drivers/rtc/rtc-sd2405al.c   | 16 ++++-----
 drivers/rtc/rtc-sd3078.c     | 71 +++++++++++++++---------------------
 14 files changed, 183 insertions(+), 225 deletions(-)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250228-rtc-cleanups-12c0b5123ea4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

