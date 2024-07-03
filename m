Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3274217DA07;
	Wed,  3 Jul 2024 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003085; cv=none; b=im2rqWD83ru3/kTAHJyYvwN06AwBFakGbbtNDE8gaDP5zrh0xJf6x7Fiu1DdpZHthq4OGOX3ABsZPLqpo0m2RNbArdQgrfU+kQeqlFE5UaW9Vf5tAzBkXfwuJBwucS0wXUKUQvjitxULA2o8T5Y7YQ1AMcKY4DUWoYJ4JJZFf8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003085; c=relaxed/simple;
	bh=FiM2tocmKQVG72xvG87Ocg3vkwWai7QxIW/GdxV84YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GtpW0LG0su+cc20uF1sTNVTaVDEeBFXDk2AlEgqg9lkeKFFvNoNsfXHhkqOBZBJgknTEO0cCOZNK2EwCD2tyYzBgFSWDLvVpvI29Ns4ZKMGPj9z5rQbcRoGFIQfhL7Z4EM0lAr3pAV9TRtFBWUTErnzsP9S+Qyl2Vkl9vKubX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PXSKTR7G; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PXSKTR7G"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B050440008;
	Wed,  3 Jul 2024 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VfUyDEnUBHMYjfO4mnvOnujVbzdny+Xmf64Qw4TtE0=;
	b=PXSKTR7G+vhp1MMTIX4fVICs2eEattO3+fekPacJce4Q3BwGaDyX9bly0M5x71zeAYENq3
	L+POg1T5oDgJ4hjGA1TfmlgtRH6J5muhqFmouMew+3B3PVI/kLqFjUiQKFWpabiv6tYatP
	v13RUSFpPI3eDcNeXOmLySxD2K7vRVyninm9hhPO/ZBUNHKJIgss785QRGfdw8AothmYH9
	pA6ARdXWf+WrxVGQR6omvR1D3LW5TRKisC7GFZfe5Wb2Fj5idDzXZ5dzslvY1pKt2PJuEm
	PgJRmL+vSfc7mtPsMGz+qHi/1PgiwBVfhsgcDcBw5DwdPBozOdPur1QtHlbTCg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:36:53 +0200
Subject: [PATCH 09/20] gpio: brcmstb: convert to
 of_property_for_each_u32_new()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
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
 drivers/gpio/gpio-brcmstb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 8dce78ea7139..77557bc596cd 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -591,8 +591,6 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 	void __iomem *reg_base;
 	struct brcmstb_gpio_priv *priv;
 	struct resource *res;
-	struct property *prop;
-	const __be32 *p;
 	u32 bank_width;
 	int num_banks = 0;
 	int num_gpios = 0;
@@ -636,8 +634,7 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 	flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
 #endif
 
-	of_property_for_each_u32(np, "brcm,gpio-bank-widths", prop, p,
-			bank_width) {
+	of_property_for_each_u32_new(np, "brcm,gpio-bank-widths", bank_width) {
 		struct brcmstb_gpio_bank *bank;
 		struct gpio_chip *gc;
 

-- 
2.34.1

