Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7FE6FA9
	for <llvm@lists.linux.dev>; Tue,  6 Feb 2024 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245431; cv=none; b=rlFCfylnyTdQluGkDr6BNlgMd4TqaNgayv7Kzib6489uCgkC1xqMWCv5NAN/lPOE4sIXb+8smj24HeSQGZEksxd344Im8w492qbNV+OInMyddOcvCW9rtcUKp84YhlOiKdPiL0PGUQ9dBYqiyIBLX/fSupi1BMwXSyl+SbxsvLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245431; c=relaxed/simple;
	bh=39JGumuJFV1iKne13aiVpCuPKyWknv6UBw07siBgN2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGSb9DYUi0hmsEK2OjUymEHn3rCmDtSkcKkLzA2+ngJNYMxaTi1MrJWE+B4wM1uNERKfCO0HKyxw58TJdeXhkfLCO65Q9KPrUqaEuVN8ZkGZ/VnufjphtF92L4TKg1tD3uMMf6BXIQ2COXTJdfqYaRQNAQ4kNpAJcV2f823p8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyVXlPe1; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyVXlPe1"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6da9c834646so4767502b3a.3
        for <llvm@lists.linux.dev>; Tue, 06 Feb 2024 10:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707245428; x=1707850228; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04H/P6C7O8nfc1XeC8v5p8UgUl9tQRxBxfBvOdudh+M=;
        b=jyVXlPe1RAwpXt6JI+L5Vqg9YqPjwmILt43K9AweSR5JAjq51Ki+mTkGxIeS70oQVi
         UUxFDPDPEGSmVq4ykNHmFdO1lBSpPyf4SAmHCuW3lbrvBoXlo07D+Dsgb2Tm3YCsZ4ie
         b2R3b+6X7YtDdKhyQhN4qVn5K/1vjCaxpCaVzw2bHuBkPJ9cLOLExvEy5GD+SNMxiFOG
         KHz7kHogBYd7xieKepflKPxV8Vz3i0M2YEK0cnYLFk69IKD20IfbcvKlq9BTNCIUuoIu
         UlHe8UXFDUHL8R+/QNcBEPOofmE5vED0ZpOX2I5INvbBajAXGSCyPWqOxGoWRoyuVHhW
         mUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245428; x=1707850228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04H/P6C7O8nfc1XeC8v5p8UgUl9tQRxBxfBvOdudh+M=;
        b=qNsj5nSStpHBH5E3WPlM1pJEXVfCCCrneARqfpcpa00EvdgkZt0ywEua0jxY7AEaSA
         4gHfnLME03yr6v3EHdd2plgtXmxI/uTfUo4JHDosNHyy1JFEWpZ3kbkiW4Y93JF8ChAa
         IDaXdxIMbRFNpgeRyc3Z72Pd2DoMxYMftQDDlzhoma07w9bfw1TLEQLFjGBOiOKnX5H8
         dy8hi2ncZDKSPYeJQYmOO342blCSA69Gwo+9dilns3dj/j1bENTv1/0pm43niBvOX4YE
         YjN9D9y1Ph5LLEbNBu7lqXhO5kTkBzwm6ghrkBt/9Pw+YCzBupsLkqZrZgIkANC9f3UE
         UNUw==
X-Gm-Message-State: AOJu0YxD25jpXqeYAPWzGcBgjJMcknBbyQFai56qnbh71jfEGpdmjM/A
	1KUQV2e1eZUIIyR/F4VtedD7NibBrjELFJtwV5yChQ3T7f7P8EBXJcWgNtuqdOrpRE/WCUzAeM9
	W7PtZ3YysK5F2/A2FBLRh/k+4Ctw=
X-Google-Smtp-Source: AGHT+IFew76+8/ONbppJJ5WidlzjDP61Dg+kG6gaTcWUbl+84Ejsp+SlpxQLfB/R2PqIEfDeyhbfqm2nzrGeNSGeDLs=
X-Received: by 2002:a05:6a00:994:b0:6e0:3f2d:4c04 with SMTP id
 u20-20020a056a00099400b006e03f2d4c04mr433802pfg.23.1707245427825; Tue, 06 Feb
 2024 10:50:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com> <20240203165307.7806-9-aford173@gmail.com>
 <20240206170632.GA2183819@dev-arch.thelio-3990X>
In-Reply-To: <20240206170632.GA2183819@dev-arch.thelio-3990X>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 6 Feb 2024 12:50:16 -0600
Message-ID: <CAHCN7x+Jt8Qfyjxg=TasUgezA3ZDk=6mFZkMyFEwk2Evt-6c5Q@mail.gmail.com>
Subject: Re: [PATCH V8 08/12] drm/bridge: imx: add driver for HDMI TX Parallel
 Video Interface
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de, 
	alexander.stein@ew.tq-group.com, frieder.schrempf@kontron.de, 
	Lucas Stach <l.stach@pengutronix.de>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Richard Leitner <richard.leitner@skidata.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 11:06=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi all,
>
> On Sat, Feb 03, 2024 at 10:52:48AM -0600, Adam Ford wrote:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > This IP block is found in the HDMI subsystem of the i.MX8MP SoC. It has=
 a
> > full timing generator and can switch between different video sources. O=
n
> > the i.MX8MP however the only supported source is the LCDIF. The block
> > just needs to be powered up and told about the polarity of the video
> > sync signals to act in bypass mode.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v7)
> > Tested-by: Marek Vasut <marex@denx.de> (v1)
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> (v7)
> > Tested-by: Richard Leitner <richard.leitner@skidata.com> (v2)
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> (v2)
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (v3)
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Tested-by: Fabio Estevam <festevam@gmail.com>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu=
/drm/bridge/imx/imx8mp-hdmi-pvi.c
> > new file mode 100644
> > index 000000000000..a76b7669fe8a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
> ...
> > +static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state *bridge=
_state)
> > +{
> > +     struct drm_atomic_state *state =3D bridge_state->base.state;
> > +     struct imx8mp_hdmi_pvi *pvi =3D to_imx8mp_hdmi_pvi(bridge);
> > +     struct drm_connector_state *conn_state;
> > +     const struct drm_display_mode *mode;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_connector *connector;
> > +     u32 bus_flags, val;
> > +
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(state, bri=
dge->encoder);
> > +     conn_state =3D drm_atomic_get_new_connector_state(state, connecto=
r);
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> > +
> > +     if (WARN_ON(pm_runtime_resume_and_get(pvi->dev)))
> > +             return;
> > +
> > +     mode =3D &crtc_state->adjusted_mode;
> > +
> > +     val =3D FIELD_PREP(PVI_CTRL_MODE_MASK, PVI_CTRL_MODE_LCDIF) | PVI=
_CTRL_EN;
> > +
> > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > +             val |=3D PVI_CTRL_OP_VSYNC_POL | PVI_CTRL_INP_VSYNC_POL;
> > +
> > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > +             val |=3D PVI_CTRL_OP_HSYNC_POL | PVI_CTRL_INP_HSYNC_POL;
> > +
> > +     if (pvi->next_bridge->timings)
> > +             bus_flags =3D pvi->next_bridge->timings->input_bus_flags;
> > +     else if (bridge_state)
> > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > +
> > +     if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
> > +             val |=3D PVI_CTRL_OP_DE_POL | PVI_CTRL_INP_DE_POL;
> > +
> > +     writel(val, pvi->regs + HTX_PVI_CTRL);
> > +}
>
> Apologies if this has already been reported or fixed, I searched lore
> and did not find anything. Clang warns (or errors with CONFIG_WERROR=3Dy)
> for this function:
>
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:81:11: error: variable 'bu=
s_flags' is used uninitialized whenever 'if' condition is false [-Werror,-W=
sometimes-uninitialized]
>      81 |         else if (bridge_state)
>         |                  ^~~~~~~~~~~~
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:84:6: note: uninitialized =
use occurs here
>      84 |         if (bus_flags & DRM_BUS_FLAG_DE_HIGH)
>         |             ^~~~~~~~~
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:81:7: note: remove the 'if=
' if its condition is always true
>      81 |         else if (bridge_state)
>         |              ^~~~~~~~~~~~~~~~~
>      82 |                 bus_flags =3D bridge_state->input_bus_cfg.flags=
;
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c:60:15: note: initialize th=
e variable 'bus_flags' to silence this warning
>      60 |         u32 bus_flags, val;
>         |                      ^
>         |                       =3D 0
>   1 error generated.
>
> This seems legitimate. If bridge_state can be NULL, should bus_flags be
> initialized to zero like it suggests or should that 'else if' be turned
> into a plain 'else'? I am happy to send a patch with that guidance.

I don't think we can turn the else-if into a blind else, because in
order to make bus_flags point to bridge_state->input_bus_cfg.flags,
bridge_state must not be NULL, but we could add an additional else to
set bus_flags to 0, but I think the simplest thing to do would be to
set bus_flags =3D 0 at the initialization on line 60 as it suggests.

If you agree, I can submit a patch later tonight.  I need to fix
another issue found by the build-bot [1]  to make line 113 return NULL
instead of 0 anyway.  I figured I could just fix them both at the same
time.

adam

[1] - https://lore.kernel.org/oe-kbuild-all/202402062134.a6CqAt3s-lkp@intel=
.com/

>
> Cheers,
> Nathan
