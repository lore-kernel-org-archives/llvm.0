Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E0C13E020;
	Wed, 24 Jul 2024 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721829229; cv=none; b=Of54QKWwm9zLi4vWmrdWwLS0W+5US7IXypSgdw+T3pyfwNwOiDEIHlQgA5IahSycuauC3XNP5HnS6GPy4qOAyb0VQlc0TuUhDpt3w/2CFAA68wiE+zpJdDr9RDB/hNA/4k3bRDDWYoZe74TyKBG4rBVpMM2uYrvwgAXaf97Pm34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721829229; c=relaxed/simple;
	bh=JHsErZ1Ymd3xIUMEC7/hpzB8p/mlL/O9e+IDU+AKN8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJsT0CBfTEOQMIVQlyWkBevdoFguptojPGm9FwEDwtdWFfadBeDQXamOWZm19iHJs9fWKCgfL5zTdVKUUVHRa906iwSe4AWuUicAA0HABzPkCdqoPNeXOh0S9FVOonBwZq0hMfvlR9qkWSVdjztg5xa0oVH7PU/BRoaTYDYTF7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGPKT56V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGPKT56V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93542C32781;
	Wed, 24 Jul 2024 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721829228;
	bh=JHsErZ1Ymd3xIUMEC7/hpzB8p/mlL/O9e+IDU+AKN8I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BGPKT56VEeBc8yP6yo1qCgMrxA/O/B2Q0kFKhq94WBvnF7xY9t/4j0181EMqkzsYV
	 Ftd0EIBsPxO+8vNb1jXJW8qyEcGDXXdaowIHKOPFE0VLUfy5GgPAPtfFO9UioU30TR
	 GZg18Fg1JLPu+L+qcogoRInHtzq4sv1UniyqvSknpz5QtpxZtyCTMKseBE//jUa0Nj
	 UdRSNb/p0xuWNgHRivIlBFWuuVg8GZQrE1/E5sJBaFtTeKC7MnOu3thI4xZKIgsSrG
	 wYOt5RO8+dvhK8L1e6mcbXdYqqWg+GXR1EYqTkis8EnN+UT5SbReBOFbusF50ZMVZp
	 +OlDxYnMTCTEA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso39539101fa.2;
        Wed, 24 Jul 2024 06:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVIpkfdovs1VQ+OAGz9D/igASGpZYv1ja8/gfSGCOumx87v6ab5FvU3AcjzAN1jgOct52q9w9IJJU/uqAzWy/Uj+vqnvCKMEevLUCcQnU0c6Ea+ak8FwxLC0i/kNO3AfCPG
X-Gm-Message-State: AOJu0YzDPiOwViHln1CazTWpuB4HSOGXkXVHnRmtGHTqUbeIuPpZI02L
	7ZZlmJLHwJ+sSj2w1fWdA33FfCPxvCzCfAB55QnRSILY+WjzDxO1aS9ZaCFdoJeRCQ6GhEqCXip
	yMLTz6zphubIg12Uh7bph2J3NXg==
X-Google-Smtp-Source: AGHT+IEk3YhHLLuWHQez8La65BtnRIR9t5/9BONqzEk5mOwWdTbwESXZpTYF2WmMXYwp6gfL+EkMMSd8FeS9sIIdSCk=
X-Received: by 2002:a05:6512:3984:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-52efb7db65bmr9357884e87.44.1721829216849; Wed, 24 Jul 2024
 06:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240717-of_property_for_each_u32-v2-1-4060990f49c9@bootlin.com>
 <1e36b1ba8af3584128550822a70cb072.sboyd@kernel.org> <20240718085651.63ddfb20@booty>
In-Reply-To: <20240718085651.63ddfb20@booty>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jul 2024 08:53:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKtOTgoDgfwq9Guvt_LbtnHHGJ+PDt-wgVRHU=oVzwhHw@mail.gmail.com>
Message-ID: <CAL_JsqKtOTgoDgfwq9Guvt_LbtnHHGJ+PDt-wgVRHU=oVzwhHw@mail.gmail.com>
Subject: Re: [PATCH v2] of: remove internal arguments from of_property_for_each_u32()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Andreas Kemnade <andreas@kemnade.info>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Andersson <andersson@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wens@csie.org>, 
	Chester Lin <chester62515@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Damien Le Moal <dlemoal@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Doug Berger <opendmb@gmail.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacky Bai <ping.bai@nxp.com>, 
	Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <mbrugger@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Michael Turquette <mturquette@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Leitner <richard.leitner@linux.dev>, 
	Roger Quadros <rogerq@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>, 
	Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	llvm@lists.linux.dev, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, Andre Przywara <andre.przywara@arm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 1:57=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Stephen,
>
> On Wed, 17 Jul 2024 16:33:34 -0700
> Stephen Boyd <sboyd@kernel.org> wrote:
>
> > > @@ -1191,20 +1191,24 @@ static int si5351_dt_parse(struct i2c_client =
*client,
> > >          * property silabs,pll-source : <num src>, [<..>]
> > >          * allow to selectively set pll source
> > >          */
> > > -       of_property_for_each_u32(np, "silabs,pll-source", prop, p, nu=
m) {
> > > +       sz =3D of_property_read_variable_u32_array(np, "silabs,pll-so=
urce", array, 2, 4);
> > > +       sz =3D (sz =3D=3D -EINVAL) ? 0 : sz; /* Missing property is O=
K */
> > > +       if (sz < 0)
> > > +               return dev_err_probe(&client->dev, sz, "invalid pll-s=
ource");
> >
> > Needs a newline on the printk message.
>
> Ouch! Fix queued for v3.

I need v3 like today if I'm going to send it for rc1.

Rob
