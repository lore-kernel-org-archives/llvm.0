Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC0E4411
	for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 18:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104445; cv=none; b=d8HtD5lEG4uSrNUEQw4ZMYHzeyK+jLCJfEH9UGkGHlCHUbmsOOjLjRf+xAdzT+kF+KhvxqipEwOHqNfZlMX2ieCKeyXYN9e4tUA7dd8qJYcLbXubmcjFFSvnH4sGIl/NfHNqL6oMtchqEkKBcv1QDzk9SpkBJADgBV8qYlC4s4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104445; c=relaxed/simple;
	bh=3Lh1BwhVeqRnEATXFageAXiylnoLj5EisM5J8nNNO+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1E0u7KtXRFgD2nY4D0b9R1GxQ0FyIvpPzky9rf0XHyxPb7fslUJvgvfxSmQqAckY3gjTCxQxaK7AkXDcsRWv+3t76xdFIVhcRFUgFduw9nGXz0eyxe2o9hcHGN0d2Bk23qBH73xhSZCXU+kAlzE4DTtb07aO6p0si4RzXQDEBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuj3KUu4; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuj3KUu4"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eeb1051360so23117571fa.0
        for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 11:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104442; x=1722709242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WxFUyWe0lcthVY5bBYHT4KxjaYpQ0TGg/fnnCJonf3U=;
        b=cuj3KUu4Nvrcp5Bt6Ca1cqc3HRTD/oxRYWx4bR2Sxmuez6h9uEoJntNEXFyw7xCIRB
         Dgzo9kx5EHiYwrU7Xy38X2dC/gej3xe9zQk5O+v4sdUzzDqSQBGdGyN+ATD6TYNGU1XP
         fpeyNzgnkfL+y6Mb1YQbk1LsIdRUHNwkGBicr3Yzhwl5EZ3tkdlTTRj0Zq5dBgO/7M/A
         TymFN8RmUmZSXoC3E+wnvEkY7QznwFV5zTX5vNlHJkJE6GizYPwzUwrebnwwKMnpE9MW
         mVf/zPITHHIex3XFodrRoJEeJcLoZrjmajkKjidYJcHOXfc/v7Wf4VDKfsa+Lsqlzc+Z
         GyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104442; x=1722709242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxFUyWe0lcthVY5bBYHT4KxjaYpQ0TGg/fnnCJonf3U=;
        b=v23l98BkPraFqpKNo8jVppNIPMhbqInFxgaWFLUMyQIJz7wmGmlHggUPBFl9ekkWwj
         UhNUiKKA7Oai6aeJ2c24SwnpTpS0g91m6oclxF1iaqnxE6JU0k2JrffkDH7p3PfkTFmT
         Td0CXqUgYYl1UhqP17I8dUYzrwpYDtDdFoTkfyRIOKlIBMZ4yvfeJ67fEvzPthOTm098
         2RmXUF1oNM54ZBm1CZo47H4OlS5kwoEDjLfz9e1M38JF2p0m+zxrSGuvQMVac1RPn4Mv
         Wv5YCeVdSlKn3KXpPinZZ8Wixt8jzsykP2nxcOt5Yulnn7YhW1UeWUmS0oNqyP8MJOEi
         5RiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUREui8Js3fRk2Xh6UoM/hUtNMgf39GFmeHUtSWq7lwh4WDMCvE/suC4hFvovnbBTriEsEdFSi1IaBITekxpWcOQ93PDw==
X-Gm-Message-State: AOJu0YxK8FeqryKtCyLOtdy9meSdbZ0ca6TuvBfoxC8DJ9hcL1kw27o9
	Mma5MHayDaxiI+/WOXtxbo66HuFDbQCGpvx5757IJmiAbmcR+N3j
X-Google-Smtp-Source: AGHT+IEu0dt6qpt6W9qSkNlLYQ68T+/D93Gf2dnEZ2mPYWT0uQCbffw2RtHL1SdmIIuqusSF1cnhUQ==
X-Received: by 2002:a2e:9795:0:b0:2ef:2fcc:c9fb with SMTP id 38308e7fff4ca-2f12ee47152mr21852671fa.36.1722104441734;
        Sat, 27 Jul 2024 11:20:41 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:41 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/4] MSM8953/MSM8976 ASoC support
Date: Sat, 27 Jul 2024 20:20:23 +0200
Message-ID: <20240727182031.35069-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for basic sound card setup on MSM8953/MSM8976
platforms, document new compatibles and introduce support for more dais.
Most of code is sourced from msm8953-mainline fork over github
with some changes implemented by me,some basic changes are 
mentioned in each patch.

[1] - https://lore.kernel.org/lkml/20240723083300.35605-1-krzysztof.kozlowski@linaro.org/T/

Changes since v1
================
1. Rebased dt-bindings documentation based on Krzysztof's split patch[1]
2. Resolved clang errors by guarding ret verification inside if
3. Switched quin-iomux to devm_ioremap_resource to not fail on msm8916

Adam Skladowski (1):
  ASoC: dt-bindings: apq8016-sbc: Add msm8953/msm8976-qdsp6-sndcard

Vladimir Lypak (3):
  ASoC: qcom: apq8016_sbc.c: Add Quinary support
  ASoC: msm8916-wcd-analog: add cajon and cajon v2 support
  ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976 SoC

 .../sound/qcom,apq8016-sbc-sndcard.yaml       | 51 +++++++++--
 sound/soc/codecs/msm8916-wcd-analog.c         | 63 +++++++++++++-
 sound/soc/qcom/apq8016_sbc.c                  | 84 ++++++++++++++++++-
 3 files changed, 186 insertions(+), 12 deletions(-)

-- 
2.45.2

