Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26B16DEC3
	for <llvm@lists.linux.dev>; Wed,  3 Jul 2024 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720006448; cv=none; b=kdSl6jnJBVUuMt7ad26dD5gfX5i2+rTpMEpFl3xwg0PBDx1OQ9k1uOBgUKv/67RejyCeVKDI3iM6uwQxwn4zbCXLt/YP+0duTpCtooOONfMlakbfe/pejcI9FM1vSImH/A0Y/3xKeUHIjvrIrg4yLnupvvZtXsCgyUJ3XqUqNFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720006448; c=relaxed/simple;
	bh=FZENwCduhzMR7HNXX0tAbKbkTMhnOf9iriLhVyWT2uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zq5DYXSYbHHXrEsLYjRYaFm6eeM0Q7FM0BxvwnF2WtqG1ALQCv+Snn3pzeHPbvcMfhovj8yEY5oP5bzCvhUa2S7Dj2Enr3tFM0vkeqkkAKG8A1YGWjwV8V6dD1Xt1f/RJ21LL7IO0slaJmqGgeKwXd5dov5SsilfWYhJnwFr6no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LiEClGIh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LiEClGIh"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e9a920e73so416659e87.2
        for <llvm@lists.linux.dev>; Wed, 03 Jul 2024 04:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720006444; x=1720611244; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=LiEClGIhpgOlHUWpXE1i7Dzj4sCX04wIWimq7Jsd1EHcxIN0Arrixc0ymKfUd3vy7U
         P6B0vfsOhrFpGdgO6G6xTzL4ClsF9rN2MFoGrlc2kLGHty4kcSAWF7aMQluPOQ1oH767
         RMwZ5Bis4g5nk9OD9BqC6dKJTS+LLidOKrm5u0JHyTFVr+ZavoWxCbJAPUiTEWU5GLYz
         tGENyxzOs6Uo9BkRhfzQmf3PRhUGcWaWrcnMzv4LKA6Ug5Hnx5MhjGHsmCcOKknEgpTO
         hj/cUtAT/GfB3oaDykOVLYAXJalC9r/29tlK0Emwh1k2BBLuuu/IVpMWrWZJhZyxh03z
         hKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720006444; x=1720611244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=r3Ny8PK9/TfGzB2SxFkXOGiOYur8c5DtlNS/ousPLaJgxKxeoDQLYERj/HfHkZkNwT
         VZWY5ew4qNTcTv8vLIsbCYi9COBuuvaoE6/KY/PjFy5zdjMrnMPWza8akGQWG658WPmX
         71uouoG2ez22CVs+y8BuVocGEqfup193PUPJ+etOTC6m2EfXWoVggd1wjjSIHwOPLHbK
         GShF7F74H61B3GRMCUL/cCeTCxrdQZbmDXaiQgiQOJEl1s1nwjGEOPvdZ1XRue42YJCy
         cwzReczuo1xjbHtQTjAeNjXZc2sqdo4XdpjjyN40BJwgWg2yq440xJQdGAVSsVIHz7wd
         4jfw==
X-Forwarded-Encrypted: i=1; AJvYcCUbkNGix6QBEJ7QLU9gY7ZOiPkSUjFW3W4t+dEBwmCNwZKCy/wF6Dt5lTPv2fFmeR8mQJAbHRKGx/nIfwy1pBhyPu/jUw==
X-Gm-Message-State: AOJu0YxmNUkKmzNPORwSnWmpqhZA/DN4AlpgEO3XGi62Lc/Oesp/mpu3
	JPQfDQr36itrgrzbXWvi8tx7o/0FmfASf9vfnqA+vLyCe9z7vyQMDqMAz0PJWCKv3dcMKTFawYn
	xbU7ZRmA4AyeofYyhLae5JOmVrHA1stxlRN6GxQ==
X-Google-Smtp-Source: AGHT+IHvYQvlnz9xSSjxxA0C9+ARDlWBymS0Nc+4OcDhYKcJABqlW19CRkZVdGMg0Rc503nQzevZwF7mryFVzLHp4+k=
X-Received: by 2002:ac2:4e09:0:b0:52c:d8e9:5d8b with SMTP id
 2adb3069b0e04-52e826678a3mr7597242e87.25.1720006444010; Wed, 03 Jul 2024
 04:34:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com> <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jul 2024 13:33:52 +0200
Message-ID: <CAMRc=MfjdCxbQfthWXcgz2tC+2_owfx73DBq9LqN_4wFvWwgqA@mail.gmail.com>
Subject: Re: [PATCH 09/20] gpio: brcmstb: convert to of_property_for_each_u32_new()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Richard Leitner <richard.leitner@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Damien Le Moal <dlemoal@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 12:38=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpio/gpio-brcmstb.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 8dce78ea7139..77557bc596cd 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -591,8 +591,6 @@ static int brcmstb_gpio_probe(struct platform_device =
*pdev)
>         void __iomem *reg_base;
>         struct brcmstb_gpio_priv *priv;
>         struct resource *res;
> -       struct property *prop;
> -       const __be32 *p;
>         u32 bank_width;
>         int num_banks =3D 0;
>         int num_gpios =3D 0;
> @@ -636,8 +634,7 @@ static int brcmstb_gpio_probe(struct platform_device =
*pdev)
>         flags =3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
>  #endif
>
> -       of_property_for_each_u32(np, "brcm,gpio-bank-widths", prop, p,
> -                       bank_width) {
> +       of_property_for_each_u32_new(np, "brcm,gpio-bank-widths", bank_wi=
dth) {
>                 struct brcmstb_gpio_bank *bank;
>                 struct gpio_chip *gc;
>
>
> --
> 2.34.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
