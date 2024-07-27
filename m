Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0033187356
	for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104450; cv=none; b=aaz3XfZdvoe8Zc2+8JfL0YOCoRTWj42a8bQ99kKRL9TMJMBiIBgNvFPEhuTjamvSPnlnaLDD3439Y8HpYp5vua2B1dL6lJgaMBazIp9mcmJqsPiUUV5HKZXqO7iXSPE4woVYUkUC3cMOjRNOrkXzhzOIWH9Zr2euik8jyTVNz2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104450; c=relaxed/simple;
	bh=PMtw6Te5sj/TrlbW9514sz7eS62gjeUYCJGHpfh1FaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oam5SAqXfK/KXgJihqgbzDLOQ0kqI8XUh23+xQ9T39R/7JnysZKomkJPGEHJ1CixezN8e9387TvM3s/3Go6edDE9fjmr/qCVkwDgE00YOTOpxDpMrHs5sEcrmIPwhNMOmt1xh1HkpNPxvj7A9SlSy0Gubkk3RVM7jVYLuRYW10w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcU1M0ZQ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcU1M0ZQ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f035ae0fe0so25760641fa.3
        for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 11:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104447; x=1722709247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zam71Ol4yolcRCdgG2yrrm07LDlzniNh9XTYbPohag=;
        b=PcU1M0ZQpneuY3BWD/Hw4Ox+XpeFgbIrHPfI4RHMHJ0Bpp9UCd3rSiK8UH0SY+EGH9
         QsGubdrwRWiA61iqp6aVqAjr57pWEWXmsMVlgwhXKbBlID3v0yhfj1gshV2oomlclgSg
         BcIoyLFEakptk1/g7HkJJmOHD64ofFY6x8bfq6A9BJuMEsba+WIbBgY53RQ+pY5k1PPq
         SusBYs61Joc/40oimUTxb+yHDvokc9WxVWmqOGXY0XVEAw7e4CsE6+i9MR2rww1DN9Bm
         4kBSH5Azt6Mbi49Z//YZ2qEq4D1BkoqNF/iL3kU0TgnlgkM9E+7/FPyoPtT3cBmQyJo+
         Oukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104447; x=1722709247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zam71Ol4yolcRCdgG2yrrm07LDlzniNh9XTYbPohag=;
        b=hLifLlAumSPP/xxaGy+a06TlQId064TwPKsVUcw1KiMouAZClHk5obRGiLozADzf5e
         mLsyniJm57BCBc/9qgb6lJ92Qrh6AV/ffQL/+OFQD2sAQaCS5NL8QE9/VMLomBphgKAT
         dKmb4w15ORJkoARBIA9ITwLyreXNBSXtC9hk4wPH/PVEHXs6lt5xiSM8D13B7MMpzfmT
         tQm8CHI77vRHgM0+Tn8mk4qdkyNPnXvUYoWchrYBSr+E2adbaziDh+c3UZWfiLEmkxR8
         YN7muIjoAMuj5lpBlY9mcKQvcWBGB6ncpfmXb651kII0MzAOXplMZfdp/fy0fGHMSo6D
         ZJ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUAJN3UGiFtExTCIK6RA3G6JOXZlAuw/QWd+t7i8mkRU8Jj2qXlSIypMmPm2dFCq0COIaKgMjWazleYzZcqKiUIwMd1Lw==
X-Gm-Message-State: AOJu0Yw9S8+hXbw0jq3+Wv7ue/UYvzlgwXBRtWaOpaG+J3F2US5niNXb
	sfd+uGwPF43DbAgUsBfWj44+hTRvjNQLNv31UKXC+I238CV0gFiu
X-Google-Smtp-Source: AGHT+IGvyLQim7JK45a/ba9q00AzQhJejT77FSBr2xSMgFq12bEECWsvmkm1dvXC4saab8Kw2Ycm7g==
X-Received: by 2002:a2e:be8f:0:b0:2ef:228a:1b86 with SMTP id 38308e7fff4ca-2f12edd5328mr20892951fa.21.1722104446584;
        Sat, 27 Jul 2024 11:20:46 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:46 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH v2 1/4] ASoC: qcom: apq8016_sbc.c: Add Quinary support
Date: Sat, 27 Jul 2024 20:20:24 +0200
Message-ID: <20240727182031.35069-2-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240727182031.35069-1-a39.skl@gmail.com>
References: <20240727182031.35069-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add support for configuring Quinary Mi2S interface
it will be used on MSM8953 and MSM8976 platform.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Split from MSM8953 support patch,add msg]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 3023cf180a75..303dd88206b1 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -20,12 +20,13 @@
 #include "common.h"
 #include "qdsp6/q6afe.h"
 
-#define MI2S_COUNT  (MI2S_QUATERNARY + 1)
+#define MI2S_COUNT  (MI2S_QUINARY + 1)
 
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
 	void __iomem *spkr_iomux;
+	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
 	int mi2s_clk_count[MI2S_COUNT];
@@ -86,6 +87,12 @@ static int apq8016_dai_init(struct snd_soc_pcm_runtime *rtd, int mi2s)
 			SPKR_CTL_TLMM_DATA1_EN | SPKR_CTL_TLMM_WS_OUT_SEL_SEC |
 			SPKR_CTL_TLMM_WS_EN_SEL_SEC, pdata->spkr_iomux);
 		break;
+	case MI2S_QUINARY:
+		/* Configure Quinary MI2S */
+		if (!pdata->quin_iomux)
+			return -ENOENT;
+		writel(readl(pdata->quin_iomux) | 0x01, pdata->quin_iomux);
+		break;
 	case MI2S_TERTIARY:
 		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
 			MIC_CTRL_TLMM_SCLK_EN,
@@ -177,6 +184,9 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	case QUATERNARY_MI2S_RX:
 	case QUATERNARY_MI2S_TX:
 		return MI2S_QUATERNARY;
+	case QUINARY_MI2S_RX:
+	case QUINARY_MI2S_TX:
+		return MI2S_QUINARY;
 	default:
 		return -EINVAL;
 	}
@@ -290,6 +300,7 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 	struct apq8016_sbc_data *data;
+	struct resource *res;
 	int ret;
 
 	add_ops = device_get_match_data(&pdev->dev);
@@ -320,6 +331,9 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(data->spkr_iomux))
 		return PTR_ERR(data->spkr_iomux);
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "quin-iomux");
+	data->quin_iomux = devm_ioremap_resource(&pdev->dev, res);
+
 	snd_soc_card_set_drvdata(card, data);
 
 	add_ops(card);
-- 
2.45.2

