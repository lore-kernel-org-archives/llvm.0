Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E831FECD4
	for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757506; cv=none; b=oFkoe4pJKrVGmgBs/Rp3w8Fb2MkNadUFeyfBPsWsW8n/XzFcPNG1sWzINbSe1kC2+kom2USZi4GA64sH3TEiAlldI+Hna2ucnfDSxNqvfDnYILrrj00d9CHUJ12z3sGQk+xY5PPkgvKObpFMuS18cNiC9yW3awr86IotHfPqVsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757506; c=relaxed/simple;
	bh=z7IjcxE0YEacFXgAh4xDDX9VpxqkPXW2KpAMNhWrpgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOfkD6WzR+gftMIOcZ9WW2t2QcureOrCR0A1/msWB4U4fpTB9Yln5fAWCNCdcwUsrqYoMwFYEUXTqe726UXgMjvagLDdftWLs9JTesNdlivrNxqlAZeGz1V8wEFyo+U/k2OFQvDDwEXRcMv+P0eWaBMC9URpA/DBSVVXXNu+xQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0E5JLvH; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0E5JLvH"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso1339068b3a.2
        for <llvm@lists.linux.dev>; Thu, 12 Jun 2025 12:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749757504; x=1750362304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3L1BRXMYQOPZXwWB+HufjRJxBYhvQ+eeWRIbfY6WI0=;
        b=F0E5JLvHojjwjrONNYGh6Bc1WaRT7N3Wr3E9mVChRRUr0iSATIlq9qsFHFwxuCuKSB
         UZKg2GvWFrnQA2VMGJVYYcuAuswpij0b55vpWtkP5jNu5FbEu5FSMy92x21HG3761WyS
         2JZYDWG8DkjEX786Crb9njAxcsGSmBGkM4po+fvZRWGpyTxWlLx7gzg63MCnFIxOM3OS
         UXu1FS8rW08itp29petLmZeIZ4+lk2mY6MXJMIoVNQbKGTabCstfvzTJu4Dky3OPHF/E
         ztt5ayR4NnaYGbefq/t+5NWgz9DH0kgpGdq6+VDDAmbv9vATSGU7jzFbc1H22qRUQZJE
         NP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749757504; x=1750362304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3L1BRXMYQOPZXwWB+HufjRJxBYhvQ+eeWRIbfY6WI0=;
        b=oREPAIQEDWm7O/PasdVEZ88VilNha9J1EJ8Otzi3rJkCHQgct0wL5ezxxNzl9GfV+c
         /VJZ/1baTdGnu/Vt7Gu9YcN4JaU/WC+ctzzjimfJ0BxNbZ4MEBZbHMzPTdGcGJtOkcpZ
         d1jjvp4c/hQFN6dmgGQ8uiDXg8LccZSRUqytUFmd08ZtevMCpoSJBUJbqN0ZmSXS3aiL
         4JSEJmtzFH/F88VRXNOv3AlmJ1cKjz93RDCJM9q21CX+mjpRoNItl6/ta0AumAGytV9X
         gOErzA8SMiCgXOPdbWbtlGlfRv+ZUuC3E7OQ+fy1Yc5KFvpeX5/B5rNB658voklCDpN+
         GRrg==
X-Forwarded-Encrypted: i=1; AJvYcCVsHWdJoFFOJANziijHq4LNK/bIviqzwB1XTyaUqItCPwnBngfDwtrKgpQv7wDNbx3rgxvj@lists.linux.dev
X-Gm-Message-State: AOJu0YwZEOWSHF/DMh+BN9/qMQ5IiJhglKLFKkE6tpNDzUy3Oa5GL8f6
	M6jZPdOVi3j9ggbDXvStTuomzFA2nEJvECFypg/PNwWGIahCwYwN1CJq
X-Gm-Gg: ASbGncsf4nkioCNZLvucLtygE8ogTv6bfc0arbKZkU9Q2lf/SFMifyqW670bwThNFdg
	HbDdMKGaGPheVO1P1tuMKJXlzfuXaA59zA3l2IQnRBeRIogquBjHqqZ5QDefG2oTOfw5LlewTQL
	N+wh64mFUGsPuQsoBmm7/5qsr+wtE25MjIf/Vys6t1oQjQBSQzvcec3vMdaYf+awyvuU11hw00C
	PoOP+2vbVWsd19VnCkcIflx/NVfiRMoEkgPV+FmsFYQi4hP4NitspBZED0noXtqd9mw5wLHMcvj
	kNZYZtj3Gc9lPo8iZDetIzD9riCg5XYxrSrJ4IRzr0er8Qfvr4JabCPDuKOHdQ==
X-Google-Smtp-Source: AGHT+IH5SI3hUshSKHU0j6QBfj5JqczafiiFC8/0KUaseCcKbsSGpfUoReyErqftJzmx0fPZHAtJ2w==
X-Received: by 2002:aa7:88c2:0:b0:740:6f69:f52a with SMTP id d2e1a72fcca58-7488f485015mr691851b3a.0.1749757503807;
        Thu, 12 Jun 2025 12:45:03 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890082859sm109585b3a.104.2025.06.12.12.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 12:45:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:45:00 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shreeya Patel <shreeya.patel@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
	linux-sound@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 00/20] BYEWORD_UPDATE: unifying (most) HIWORD_UPDATE
 macros
Message-ID: <aEsuPN-kuQ8cjR7H@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>

On Thu, Jun 12, 2025 at 08:56:02PM +0200, Nicolas Frattaroli wrote:
> This series was spawned by [1], where I was asked to move every instance
> of HIWORD_UPDATE et al that I could find to a common macro in the same
> series that I am introducing said common macro.

And it means, at least for patch #1:

Suggested-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
 
> The first patch of the series introduces the two new macros in
> bitfield.h, called HWORD_UPDATE and HWORD_UPDATE_CONST. The latter can
> be used in initializers.
> 
> This macro definition checks that the mask fits, and that the value fits
> in the mask. Like FIELD_PREP, it also shifts the value up to the mask,
> so turning off a bit does not require using the mask as a value. Masks
> are also required to be contiguous, like with FIELD_PREP.
> 
> For each definition of such a macro, the driver(s) that used it were
> evaluated for three different treatments:
>  - full conversion to the new macro, for cases where replacing the
>    implementation of the old macro wouldn't have worked, or where the
>    conversion was trivial. These are the most complex patches in this
>    series, as they sometimes have to pull apart definitions of masks
>    and values due to the new semantics, which require a contiguous
>    mask and shift the value for us.
>  - replacing the implementation of the old macro with an instance of the
>    new macro, done where I felt it made the patch much easier to review
>    because I didn't want to drop a big diff on people.
>  - skipping conversion entirely, usually because the mask is
>    non-constant and it's not trivial to make it constant. Sometimes an
>    added complication is that said non-constant mask is either used in a
>    path where runtime overhead may not be desirable, or in an
>    initializer.
> 
> Left out of conversion:
>  - drivers/mmc/host/sdhci-of-arasan.c: mask is non-constant.
>  - drivers/phy/rockchip/phy-rockchip-inno-csidphy.c: mask is
>    non-constant likely by way of runtime pointer dereferencing, even if
>    struct and members are made const.
>  - drivers/clk/rockchip/clk.h: way too many clock drivers use non-const
>    masks in the context of an initializer.
> 
> I will not be addressing these 3 remaining users in this series, as
> implementing a runtime checked version on top of this and verifying that
> it doesn't cause undue overhead just for 3 stragglers is a bit outside
> the scope of wanting to get my RK3576 PWM series unblocked. Please have
> mercy.
> 
> In total, I count 19 different occurrences of such a macro fixed out of
> 22 I found. The vast majority of these patches have either undergone
> static testing to ensure the values end up the same during development,
> or have been verified to not break the device the driver is for at
> runtime. Only a handful are just compile-tested, and the individual
> patches remark which ones those are.
> 
> This took a lot of manual work as this wasn't really something that
> could be automated: code had to be refactored to ensure masks were
> contiguous, made sense to how the hardware actually works and to human
> readers, were constant, and that the code uses unshifted values.
> 
> https://lore.kernel.org/all/aD8hB-qJ4Qm6IFuS@yury/ [1]
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Nicolas Frattaroli (20):
>       bitfield: introduce HWORD_UPDATE bitfield macros
>       mmc: dw_mmc-rockchip: switch to HWORD_UPDATE macro
>       soc: rockchip: grf: switch to HWORD_UPDATE_CONST macro
>       media: synopsys: hdmirx: replace macros with bitfield variants
>       drm/rockchip: lvds: switch to HWORD_UPDATE macro
>       phy: rockchip-emmc: switch to HWORD_UPDATE macro
>       drm/rockchip: dsi: switch to HWORD_UPDATE* macros
>       drm/rockchip: vop2: switch to HWORD_UPDATE macro
>       phy: rockchip-samsung-dcphy: switch to HWORD_UPDATE macro
>       drm/rockchip: dw_hdmi_qp: switch to HWORD_UPDATE macro
>       drm/rockchip: inno-hdmi: switch to HWORD_UPDATE macro
>       phy: rockchip-usb: switch to HWORD_UPDATE macro
>       drm/rockchip: dw_hdmi: switch to HWORD_UPDATE* macros
>       ASoC: rockchip: i2s-tdm: switch to HWORD_UPDATE_CONST macro
>       net: stmmac: dwmac-rk: switch to HWORD_UPDATE macro
>       PCI: rockchip: switch to HWORD_UPDATE* macros
>       PCI: dw-rockchip: switch to HWORD_UPDATE macro
>       PM / devfreq: rockchip-dfi: switch to HWORD_UPDATE macro
>       clk: sp7021: switch to HWORD_UPDATE macro
>       phy: rockchip-pcie: switch to HWORD_UPDATE macro
> 
>  drivers/clk/clk-sp7021.c                           |  21 +--
>  drivers/devfreq/event/rockchip-dfi.c               |  26 ++--
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    | 142 ++++++++++-----------
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  80 ++++++------
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  68 +++++-----
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |  11 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   1 -
>  drivers/gpu/drm/rockchip/rockchip_lvds.h           |  21 +--
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  14 +-
>  .../media/platform/synopsys/hdmirx/snps_hdmirx.h   |   5 +-
>  drivers/mmc/host/dw_mmc-rockchip.c                 |   7 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |   3 +-
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c      |  39 +++---
>  drivers/pci/controller/pcie-rockchip.h             |  35 ++---
>  drivers/phy/rockchip/phy-rockchip-emmc.c           |   3 +-
>  drivers/phy/rockchip/phy-rockchip-pcie.c           |  72 +++--------
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  |  10 +-
>  drivers/phy/rockchip/phy-rockchip-usb.c            |  51 +++-----
>  drivers/soc/rockchip/grf.c                         |  35 +++--
>  include/linux/bitfield.h                           |  47 +++++++
>  sound/soc/rockchip/rockchip_i2s_tdm.h              |   4 +-
>  21 files changed, 342 insertions(+), 353 deletions(-)
> ---
> base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
> change-id: 20250610-byeword-update-445c0eea771d
> 
> Best regards,
> -- 
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
