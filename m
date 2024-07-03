Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248731422B5;
	Wed,  3 Jul 2024 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720012167; cv=none; b=fPY9NFfgTzz+jeaEsn0Ifgg8bMnmRbuvuyV60C0aY1JWtM43QgJCg27F9dotP7kT5gS7AbZ6wJL2mR2Hv+bDc34V2n72Y5LxRS/ukw93GOdovwrHos9Rv7XhYJTxlKFjP55tNme1virOAD+A8yYcwtAYa0O3RwjeMlss82ZmlCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720012167; c=relaxed/simple;
	bh=W8KnSELxoOeLFO4Bkg8ypBzvhOg9ofBU1heW/xaRe4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d2+ouEK0u7tQK8M9RlnjpYZ8zn3iJZ4fqWgQ0jNeSVhaxYlc8lImILmZ8/FTbxaoUFH7y2MBlUs5/TdZe+G3/SGHEgb47e3rUeHY2DlfojVkoLXm5zqXBlDnNIGEbbvNhheUBYMeMKVcPkfTW7NltDxmeJpm/xOum3Rd32uTi8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=fail smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=2PooRO93; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="2PooRO93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720012166; x=1751548166;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W8KnSELxoOeLFO4Bkg8ypBzvhOg9ofBU1heW/xaRe4k=;
  b=2PooRO93sSMFDjDZXhuEBW7mYFXYtI/IPZ4uHk27ZnCFukhqSzxqvLuK
   kbBKUoiHVNNdv1CuSeCfmTVkAmoinO8RBIJegYfgDx8LFjSux4SPeGAD7
   3FWLBey8fIg0ZyZQAcSRJnTLNZD5DIgmH/+lca79RlGEESVE2xuA+j2Rd
   /+WUmXs+Yv6IvfVxt6ixYaQtDFm6b8TXTUtwb09OCt4xsg7jLG4bQ6vDs
   yWtgY59TSO/JH06pNyJx+YnTgoEJKhX8KaMhpVASP3Sy7pdv2B6c275G1
   AH62EAleFQ1SrGSg68JQwSwJgyGU0C8RuZ/Lc1/07Ns6/unIJhG93Ne1S
   A==;
X-CSE-ConnectionGUID: EqW5S7eWRE2aTexdHZiS+A==
X-CSE-MsgGUID: NasQoXC7S5Kaxo5UL3Vsag==
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="28777735"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jul 2024 06:09:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jul 2024 06:09:03 -0700
Received: from [10.180.116.202] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Jul 2024 06:08:46 -0700
Message-ID: <a8cc31a9-d58f-4a4e-98fb-a7ba47bc744e@microchip.com>
Date: Wed, 3 Jul 2024 15:09:07 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] irqchip/atmel-aic: convert to
 of_property_for_each_u32_new()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Miguel Ojeda
	<ojeda@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>,
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Chen-Yu Tsai
	<wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan
 Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Richard
 Leitner <richard.leitner@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Damien Le Moal <dlemoal@kernel.org>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <llvm@lists.linux.dev>,
	<linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-samsung-soc@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
	<linux-sound@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-11-42c1fc0b82aa@bootlin.com>
Content-Language: en-US, fr-FR
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240703-of_property_for_each_u32-v1-11-42c1fc0b82aa@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2024 at 12:36, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   drivers/irqchip/irq-atmel-aic-common.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-atmel-aic-common.c b/drivers/irqchip/irq-atmel-aic-common.c
> index 072bd227b6c6..543ea249df53 100644
> --- a/drivers/irqchip/irq-atmel-aic-common.c
> +++ b/drivers/irqchip/irq-atmel-aic-common.c
> @@ -111,8 +111,6 @@ static void __init aic_common_ext_irq_of_init(struct irq_domain *domain)
>          struct device_node *node = irq_domain_get_of_node(domain);
>          struct irq_chip_generic *gc;
>          struct aic_chip_data *aic;
> -       struct property *prop;
> -       const __be32 *p;
>          u32 hwirq;
> 
>          gc = irq_get_domain_generic_chip(domain, 0);
> @@ -120,7 +118,7 @@ static void __init aic_common_ext_irq_of_init(struct irq_domain *domain)
>          aic = gc->private;
>          aic->ext_irqs |= 1;
> 
> -       of_property_for_each_u32(node, "atmel,external-irqs", prop, p, hwirq) {
> +       of_property_for_each_u32_new(node, "atmel,external-irqs", hwirq) {
>                  gc = irq_get_domain_generic_chip(domain, hwirq);
>                  if (!gc) {
>                          pr_warn("AIC: external irq %d >= %d skip it\n",
> 
> --
> 2.34.1
> 

