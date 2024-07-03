Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4E41862A8;
	Wed,  3 Jul 2024 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003117; cv=none; b=GUIlQcqLofI5oiJzh1mMnJPVE0cbdd/qEp/c0LHuQiv8e8NXwnGns10Qsw61FIAqLp6WOBsoyGCKJhGElkVvtae6VKgM5fHQJSF6snbDakYhKH/CKLVGfxQfFq++W47DzmUxGjR0c6HgBAvaKUpyNKDsnqNZHzQR9yBMAEFkjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003117; c=relaxed/simple;
	bh=7YYtT92MBrhUvwr5Xf3auiYyhieH/7rEI4oqnle8qPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRDisue3UW0QCViceq25Wf5FrT1mq5kMPAU5iM4fOEMLhR+0RwQR4iSkKNGLkPFUj7sVbM51uv2uWqGCoFTBlipR4MqaJLHkaECDusjURBTHhKjPPpW/U7UrT9TaTs8rkcZShBhsJop/MJYbslou1eAunF38IiOQjB1PULt/IeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cPZSrbgY; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cPZSrbgY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B34140007;
	Wed,  3 Jul 2024 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RU3pzYG6bF53Hk2/xb6Gkld3bSr1k5kQ8wZC1imwq1g=;
	b=cPZSrbgY1uyHHUyxN4ire6Mmb4TO2Vu4T16Cw0ijX9WtOdQxRVHvR8xZ+jgMpz5IE44inL
	vII6SqG0BXZ0XbJVzXjYjxMz8zquGtkc7ojMGbf+/xzpe9vPjARGlOsl4Kt/bELXixFXbH
	5T4k5i2pHjA7qYSjwFIN2biRcDna40ZV3h1eAQappwyEIKEtCUiI5XdvuyfwdrmtIeJjgC
	EmXxc3JWVdEIgSVbA2I6p8eyD4T5kYYxryDYm4ngJCNcK71xw65khBJRmgNBswdV/gvQA8
	WY/WU4scw62nCs+t+3Qq4YDu8vQayuKSd07TBXf+564kOUKkT1WLhWlM6A8vaQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:37:01 +0200
Subject: [PATCH 17/20] ASoC: arizona: convert to
 of_property_for_each_u32_new()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-of_property_for_each_u32-v1-17-42c1fc0b82aa@bootlin.com>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Cameron <jic23@kernel.org>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Richard Leitner <richard.leitner@linux.dev>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Damien Le Moal <dlemoal@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 llvm@lists.linux.dev, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: luca.ceresoli@bootlin.com

Simplify code using of_property_for_each_u32_new() as the two additional
parameters in of_property_for_each_u32() are not used here.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 sound/soc/codecs/arizona.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 7434aeeda292..1a64b9815809 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -2786,15 +2786,13 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
 	struct device_node *np = arizona->dev->of_node;
-	struct property *prop;
-	const __be32 *cur;
 	u32 val;
 	u32 pdm_val[ARIZONA_MAX_PDM_SPK];
 	int ret;
 	int count = 0;
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,inmode", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,inmode", val) {
 		if (count == ARRAY_SIZE(pdata->inmode))
 			break;
 
@@ -2803,7 +2801,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,dmic-ref", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,dmic-ref", val) {
 		if (count == ARRAY_SIZE(pdata->dmic_ref))
 			break;
 
@@ -2812,7 +2810,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,out-mono", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,out-mono", val) {
 		if (count == ARRAY_SIZE(pdata->out_mono))
 			break;
 
@@ -2821,7 +2819,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,max-channels-clocked", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,max-channels-clocked", val) {
 		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
 			break;
 
@@ -2830,7 +2828,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,out-volume-limit", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,out-volume-limit", val) {
 		if (count == ARRAY_SIZE(pdata->out_vol_limit))
 			break;
 

-- 
2.34.1

