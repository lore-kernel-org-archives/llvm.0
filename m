Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16C828E17
	for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706682789; cv=none; b=rkplUroo8AYgsL54DxvaTyfU7/CoaZRHw30wm2hlXUcT/HIBqprAzzFXfKb4H3yJV+NBXSqvHQaP09xlVor1WYYzKse3RxIEbHSiQ2DtDWr8BtRccnSBxOG/f8SSUUPBv0CRGYLU/en7IuT9cZO3ikXb8kVJtDr/DnfmcHlYAy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706682789; c=relaxed/simple;
	bh=jbKkH1WtEeXYWeMRfLbDO0YH0JxpQQDvSBpAn5Ed0P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAZEuGUFrU4R931rLshNvms5Dd4wAwTQtkiBOpwMB4lNvskCVqRSU58aszrfFINUx0hxyjQG5PwHc8oKu5BUK2Mv3Kzv/FpQD6OU29fdoxXylTkIx2fzR6LWFRlUy8xBOcxm9FQRPcYrMvMjr2De/iQyHZBU94tXyunGFbKYi60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKUOMXW2; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKUOMXW2"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6bae46ec2so341912276.3
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 22:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706682787; x=1707287587; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W+0UrfFLZxByUhAQTRyALxC5TYXU+3QlMDreZkniP6Y=;
        b=SKUOMXW2uR3jzDoBVeRaPzW7CaXW5BoDGR3P0us6zltoCSWwus8PQAMkjJqNMxMcL1
         JyOVR6aqQXMZKELDaWrGh/hHemZmaE5UQV87q6ErbdmdvZdL/3je6hNg5yCca/aX3RZg
         GAfarbACPExt7V3LUyLe70yQLgRqjuyNRn3pSHnZYJvrugo/eAyTHX9Crzg0bp+F0cOQ
         R+rHU6ne6k2Vc9EN+qUek33TC/plMNkup88Dlt3eqA90hldgFIdCYjltqTfdkHtckfMo
         QdQ9N/GjClBsbBF0Wl4a7AvEEFrMe1xBg9eKE/quT/2x7p76NhfVD96jEF59WStWhGHN
         vqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706682787; x=1707287587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+0UrfFLZxByUhAQTRyALxC5TYXU+3QlMDreZkniP6Y=;
        b=DY6J5CHANFVjpIbBQXK+v0TGf3HlB4U6JomXhLekNn8xE+6QhZlGCFdaY/Awt9onl0
         DmbXN+zcmcu2jfrPERVvwqM5D3XWApkPhQiDDM/LDHq+xSM7agqPE3XuS8CdiJFODmi5
         p+ZXEkHVHTKnbE6HHA6iMBL/vq0ow3TUBjhhpMMfLCAkoh7zj2ND83yD4FT/7ll4zcKH
         tZaLOxWnQiBOzz5xUuV1LrfGvouDOm6Fx4vpH8QBZFHjVja23IIIpZRgeufzyjGUdFVP
         nd3VNuF9+Wda4E0BFADAXiWaa+x56C+4/XncHyYt0fl+ddoutoWxqc8gsI5a+fT/kn9d
         2mzQ==
X-Gm-Message-State: AOJu0YwVr7NLcjtWFLB5E7Dquha8Y/cbrurS36oTufrpTa9SiAVmgjU4
	M7j7wDKZbgB8sxLVSqzWmsarRh58Zkrs+WROnJo833eXeZ+fZk61h0W+xFiVgXXffPFQtC3usaZ
	8l6reOA1SeEuNmPfpofk6/AFbeI+ILFMpFLRpwg==
X-Google-Smtp-Source: AGHT+IFxRXwNP5PRj+1YvzHjYbCYITU/P5nsMmG4/Z+5FnhpEGiUV21GZeIbWwZE5W49t+z2Do1jj0wx+tXggTPULI4=
X-Received: by 2002:a5b:582:0:b0:dc2:1c77:ca7 with SMTP id l2-20020a5b0582000000b00dc21c770ca7mr757962ybp.36.1706682786826;
 Tue, 30 Jan 2024 22:33:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com> <87eddy6qjf.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eddy6qjf.wl-kuninori.morimoto.gx@renesas.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 08:32:56 +0200
Message-ID: <CAA8EJpq79tOCH3vK+Hh_XD4mtj1GVgVvwehQF4BfxTjwPi_fHQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/24] gpu: drm: switch to use of_graph_get_next_device_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=83=C2=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	=?UTF-8?B?VXdlIEtsZWluZS1Lw4PCtm5pZw==?= <u.kleine-koenig@pengutronix.de>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Andy Gross <agross@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Bjorn Andersson <andersson@kernel.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Emma Anholt <emma@anholt.net>, 
	Eugen Hristev <eugen.hristev@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Frank Rowand <frowand.list@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	James Clark <james.clark@arm.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marek Vasut <marex@denx.de>, 
	Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Tretter <m.tretter@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Clark <robdclark@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Saravana Kannan <saravanak@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tim Harvey <tharvey@gateworks.com>, Todor Tomov <todor.too@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Fabio Estevam <festevam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Leo Yan <leo.yan@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mike Leach <mike.leach@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>, Tom Rix <trix@redhat.com>, 
	coresight@lists.linaro.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 at 07:05, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> of_graph_get_next_endpoint() is now renamed to
> of_graph_get_next_device_endpoint(). Switch to it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/gpu/drm/armada/armada_drv.c                   | 2 +-
>  drivers/gpu/drm/bridge/tc358767.c                     | 2 +-
>  drivers/gpu/drm/drm_of.c                              | 6 +++---
>  drivers/gpu/drm/meson/meson_drv.c                     | 4 ++--
>  drivers/gpu/drm/msm/msm_drv.c                         | 2 +-
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                     | 2 +-
>  drivers/gpu/drm/omapdrm/dss/base.c                    | 2 +-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                     | 2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c         | 2 +-
>  drivers/gpu/drm/stm/ltdc.c                            | 4 ++--
>  drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
>  12 files changed, 16 insertions(+), 16 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
