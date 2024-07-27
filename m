Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCC418787C
	for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 18:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104462; cv=none; b=DpBl+ZGsrw0byI/bhF/vYCZW+sN0oEerRyjjUofNI6liPwp7vEki64XCqFTSkwW4IHuq8cgLYQ7ShdTZGvzblAuPQzQ9OD8/dAF0k35L7CECV00IELf8gMgVfSq23nCsEvL8vOuJEBBGIVdFVkRHQ3Qk+bOrOVgrDlUkLMskH+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104462; c=relaxed/simple;
	bh=5zVSTCeiMxOBFFg5PrNZbHTDjaRaeLpoeIwBE9Am3N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3OMOrno75lA0tWq+JzAAx/iVLRI2S2Z73NW8qqSt3FHuhWo5QiSrtE4ytZtvz0IvcyJXbsryMFL/CyR4iB/yJ48CTaQfeyNmK76eXJyHQoQYZBxadKHCpznIbVf4ENg61/FEIumzV6TD16eG/HZHsSa4f24sf6K3nxS8HFKEYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXU5FZw6; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXU5FZw6"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so34922351fa.2
        for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 11:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104458; x=1722709258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqaxMQ0ue5RjoXRCR/HykfXlaIjq8MZY6Aig5hFF/Rw=;
        b=VXU5FZw6dioltcuyNPDgxA5bI9MoXddpZkM+ZbANgU0a0p7SObCIpzXI7pXfnT8LSt
         dwfNHczLUfqADMsbYXMh3z7XW5oNFnHey07cDzMzViAZMtB1VUXgTADfxDamatKUkUVa
         iCbK6n5VsV2ZM4jZr/mBqcmyuc/o5oxK0QOiCFmx+e6Xd1ygYyHxVuOWNwimUykvZXSp
         7/NF/uEYcqLybH9VM+epq1sR7NcnN6X40xB3hVIoUUYJcUmuacuqTFjRJqVwLMnETVOw
         eWBtM6Qckh4q7nbyQXjWKSfiGMuAlvackJF2gLXRe6h5ArhFGUDutkoELMAleZCTyq+K
         eW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104458; x=1722709258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqaxMQ0ue5RjoXRCR/HykfXlaIjq8MZY6Aig5hFF/Rw=;
        b=OjxNXKcEPGs9R5wZ0fu7o9V8EPFLpqkZQCAoPF7t9i/b+olTGineJBl8w/r6PrESyM
         7XnH/37WMJ8Bsj/1H3Cvz5taZknSENbzbFlEpbnNZukAsTQBrnYBcRZ8ZCz3XEM/Jdra
         bKwIAKgnPHl/ihgWkjUxPv4UTyqr2mErXgyDE9rq40kiyfcYF2CLjNSVq7EddXGfgkNZ
         VIZHmPGJ+wg3KkLLnJE2OssMSxsA6eWVLVC7O8NIVHpnFxtLeiFltR8Y3C4+7pbfFnOA
         C8YPOZwAXalqjBoLLIlu9h69Qdj5c8zyPb7ngbVg/+HpG0Q4SRmqNtBCHHe0YbUjGygl
         1NQA==
X-Forwarded-Encrypted: i=1; AJvYcCXwcu45s1PcWxC1t917iUxEG0h3wjfrQcVxRBVBo6ykmjSSuy31H+hYVlfPrVVI6J3EtAyy4wiu2Tw96x1JGupMzHjI1g==
X-Gm-Message-State: AOJu0YyCWJ/5w54BZLXiXVc1gJ4em3+Pmu3AU5uzCV/zGB+wel+A5TPQ
	2OsuEPGk1bJ3P2L1wgQ0MCvfCfnKuW2CnmK8NQVDUTICSusGai7P
X-Google-Smtp-Source: AGHT+IGbBdJtk3eIEo/RH3d6bKcSiI0SsWpJ+V+kkSG9Ok71l+0sMc9Cw5SGvtCbjRPh+gvKYM/Y9Q==
X-Received: by 2002:a2e:990e:0:b0:2ef:24e0:633b with SMTP id 38308e7fff4ca-2f12ecd42d4mr19809041fa.19.1722104458102;
        Sat, 27 Jul 2024 11:20:58 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:57 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976 SoC
Date: Sat, 27 Jul 2024 20:20:27 +0200
Message-ID: <20240727182031.35069-5-a39.skl@gmail.com>
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

Introduce support for audio card on MSM8953/MSM8976 platform.
Main difference between those two is Q6AFE CLK API supported by firmware
which influence way we enable digital codec clock.
Either inside machine driver or outside via q6afe-clocks driver.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Add MSM8976, rename functions, add mclk setting,add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/qcom/apq8016_sbc.c | 68 ++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 303dd88206b1..453ca4795603 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -22,6 +22,11 @@
 
 #define MI2S_COUNT  (MI2S_QUINARY + 1)
 
+enum afe_clk_api {
+	Q6AFE_CLK_V1,
+	Q6AFE_CLK_V2
+};
+
 struct apq8016_sbc_data {
 	struct snd_soc_card card;
 	void __iomem *mic_iomux;
@@ -29,6 +34,8 @@ struct apq8016_sbc_data {
 	void __iomem *quin_iomux;
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	enum afe_clk_api q6afe_clk_ver;
+	bool dig_cdc_mclk_en;
 	int mi2s_clk_count[MI2S_COUNT];
 };
 
@@ -192,6 +199,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
 	}
 }
 
+static int qdsp6_get_clk_id(struct apq8016_sbc_data *data, int mi2s_id)
+{
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V2) {
+		switch (mi2s_id) {
+		case MI2S_PRIMARY:
+			return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
+		case MI2S_SECONDARY:
+			return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
+		case MI2S_TERTIARY:
+			return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+		case MI2S_QUATERNARY:
+			return Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT;
+		case MI2S_QUINARY:
+			return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
+		default:
+			break;
+		}
+	}
+	/* If AFE CLK isn't V2 return V1 */
+	return LPAIF_BIT_CLK;
+}
+
 static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -214,8 +243,17 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
 
 	if (++data->mi2s_clk_count[mi2s] > 1)
 		return 0;
+	/*
+	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
+	 * so we have to request clock from machine driver using V1 API)
+	 */
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
+	}
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
 	return ret;
@@ -236,9 +274,16 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
 	if (--data->mi2s_clk_count[mi2s] > 0)
 		return;
 
-	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
+	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
 	if (ret)
 		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
+
+	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {
+		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
+		if (ret)
+			dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
+	}
+
 }
 
 static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
@@ -279,6 +324,23 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
 	}
 }
 
+static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
+	msm8916_qdsp6_add_ops(card);
+}
+
+static void msm8976_qdsp6_add_ops(struct snd_soc_card *card)
+{
+	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
+
+	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
+	pdata->dig_cdc_mclk_en = true;
+	msm8916_qdsp6_add_ops(card);
+}
+
 static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
@@ -343,6 +405,8 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
 static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
 	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
+	{ .compatible = "qcom,msm8976-qdsp6-sndcard", .data = msm8976_qdsp6_add_ops },
 	{},
 };
 MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
-- 
2.45.2

