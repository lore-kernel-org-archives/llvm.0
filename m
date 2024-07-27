Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7C18755D
	for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104455; cv=none; b=is4AQL+0d9IAfmFB/IAcnnthU/ARDD80pjjYSaX+M5/cXP8E8PpRTxJ0vE8NgHZXdE/rTPD1lFZMp3c+vfeJvjmfGLCuIGfMWphbMMWlS1MuhyrvEnyOYa7mlEjPT47l7/9WR1JTaRCdJW7+Givig/emtSE2TyYlEg2/3MAuKAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104455; c=relaxed/simple;
	bh=EFy7tExuqG9na7Q+Y80CJaISj3tjIZbe4+zf3f1TTaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VV6gwzAdFx1oUeAQWRErPrQKMar0Op/DPHXHEyZ1KZZfDbnsm64LM6VisKnnCTlxPpyiL7wnragQIY2TI0TzemzUIsxIUu1h9OR/VGmUK6jnvYKfPq4//xjyYlAYJJPmD/d4yyPpBrxAePy8tRKvLtQoiu1W0YJzpCdHPYt5cTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYJQ7gN9; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYJQ7gN9"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f035ae0fd1so26359581fa.2
        for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 11:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104452; x=1722709252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=hYJQ7gN90Nc4DdNVO8tTsR6MVXdgH7H8KVgW4RqFxR7OWKEGEjC7COowgnhcvr8fQZ
         wTDlf7httN17Ao0ah1hrERPy33fZRDWwE6lSP9R4yuEpEeYIuqpXu8/HrzMSWyNbmfq6
         +SmOcudYFSCN+cO22mCc5qsJnNVeQm5qVELJcWOl6SDb/gW0lZpgFSU1Uo7G29t03Pi2
         st9v24AQamOm2dhpDRaWORyhFvgOAdTjechuIuGVvThv/rsoo60O047N9s3e5imSqFkq
         TscNdQYIxyM/zD+G8XPMZE6lOZxGXv+HwqdpcL2p6WZguOZAXxPuIVnQQi4w0iNyOUjy
         kvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104452; x=1722709252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GF6xFxPj/ytlezNbhhUqMrRGdstZMHpzQeT2XWw6wjY=;
        b=GJ4OtB8aJA1TF6X6HWogAFgIyqLUDomXUj4ff2LQI+LAljyOjEnH2Avm0e5CSAg0Ab
         vhx1+PmzKChSDcJWj/kyUBwWlYulm3Xs5v4S9ZN24a06M3EFbwydR0nDXwQ/Xfr8iSGW
         JgtWAnXI+S7kGtn+UnHvjsfasjTTACY6KT4wznLrgOmb3HDkQpIDXM3q6JkXdtXQjeWz
         dPu/YocMZPJkbTSaAsfR+Uy1DnskhN5BeH2PKKsnK5VmRhRNEJ/L5u0goqSDTcCJrw42
         /UT9YPwHiTWiGj9resbBxv4gBHQ4LvW3YQ+Z7SELbBSQQRpqST542f/D6MF8gsmAFNfI
         HBmA==
X-Forwarded-Encrypted: i=1; AJvYcCXfF+W04S8mbV4s8kckzAUOo1LYihXOFCsL57FHVgQrcLMG0w66uJIl4h4fJwDgJIPL0cdX7dQlLYfqs49cFJtkmX0xMg==
X-Gm-Message-State: AOJu0YwZbn9SGn1Vjg004+yK756FgbWKBVRNH8W95K0flJzaRrBSvwwm
	C2XJPVlOQR6Qy5CAi81WRbtxpIrICj8KtKXM4SZfvL7KEJ0z+Bt7
X-Google-Smtp-Source: AGHT+IEm/COoGFbHv82FK7uvxWXcLwKhJWA1hhbjMFP9GYJUO820ubZBT+LuGLrHoMr/gFZyfg3itg==
X-Received: by 2002:a2e:3a19:0:b0:2ee:4c2e:3d3b with SMTP id 38308e7fff4ca-2f12ee02fa2mr19973671fa.4.1722104451431;
        Sat, 27 Jul 2024 11:20:51 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:50 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ASoC: msm8916-wcd-analog: add cajon and cajon v2 support
Date: Sat, 27 Jul 2024 20:20:25 +0200
Message-ID: <20240727182031.35069-3-a39.skl@gmail.com>
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

Add regs overrides for Cajon(PM8952) and Cajon v2(PM8953) codecs.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: Add Cajon support,add msg]
Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 63 +++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 9ca381812975..daf65f5d4e99 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -250,6 +250,7 @@
 		SPKR_DRV_CAL_EN | SPKR_DRV_SETTLE_EN | \
 		SPKR_DRV_FW_EN | SPKR_DRV_BOOST_SET | \
 		SPKR_DRV_CMFB_SET | SPKR_DRV_GAIN_SET)
+#define CDC_A_SPKR_ANA_BIAS_SET		(0xf1B3)
 #define CDC_A_SPKR_OCP_CTL		(0xf1B4)
 #define CDC_A_SPKR_PWRSTG_CTL		(0xf1B5)
 #define SPKR_PWRSTG_CTL_DAC_EN_MASK	BIT(0)
@@ -264,12 +265,15 @@
 
 #define CDC_A_SPKR_DRV_DBG		(0xf1B7)
 #define CDC_A_CURRENT_LIMIT		(0xf1C0)
+#define CDC_A_BYPASS_MODE		(0xf1C2)
 #define CDC_A_BOOST_EN_CTL		(0xf1C3)
 #define CDC_A_SLOPE_COMP_IP_ZERO	(0xf1C4)
 #define CDC_A_SEC_ACCESS		(0xf1D0)
 #define CDC_A_PERPH_RESET_CTL3		(0xf1DA)
 #define CDC_A_PERPH_RESET_CTL4		(0xf1DB)
 
+#define CDC_A_RX_EAR_STATUS		(0xf1A1)
+
 #define MSM8916_WCD_ANALOG_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000)
 #define MSM8916_WCD_ANALOG_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
@@ -715,6 +719,50 @@ static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_MASTER_BIAS_CTL, 0x30},
 };
 
+static const struct reg_default wcd_reg_defaults_cajon[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xD1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
+	{CDC_D_SEC_ACCESS, 0xA5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4C},
+	{CDC_A_NCP_FBCTRL, 0xA8},
+	{CDC_A_NCP_VCTRL, 0xA4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xA5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_CURRENT_LIMIT, 0x82},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xE1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xFA},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct reg_default wcd_reg_defaults_cajon_2_0[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xD1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
+	{CDC_D_SEC_ACCESS, 0xA5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4C},
+	{CDC_A_NCP_FBCTRL, 0xA8},
+	{CDC_A_NCP_VCTRL, 0xA4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xA5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0F},
+	{CDC_A_CURRENT_LIMIT, 0xA2},
+	{CDC_A_BYPASS_MODE, 0x18},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xE1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xFA},
+	{CDC_A_RX_EAR_STATUS, 0x10},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
@@ -738,9 +786,18 @@ static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, CDC_D_PERPH_RESET_CTL4, 0x01);
 	snd_soc_component_write(component, CDC_A_PERPH_RESET_CTL4, 0x01);
 
-	for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
-		snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
-			      wcd_reg_defaults_2_0[reg].def);
+	if (priv->codec_version == 4)
+		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_cajon_2_0); reg++)
+			snd_soc_component_write(component, wcd_reg_defaults_cajon_2_0[reg].reg,
+					wcd_reg_defaults_cajon_2_0[reg].def);
+	else if (priv->codec_version == 3)
+		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_cajon); reg++)
+			snd_soc_component_write(component, wcd_reg_defaults_cajon[reg].reg,
+					wcd_reg_defaults_cajon[reg].def);
+	else
+		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
+			snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
+					wcd_reg_defaults_2_0[reg].def);
 
 	priv->component = component;
 
-- 
2.45.2

