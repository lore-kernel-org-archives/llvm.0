Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2F11E98E3
	for <llvm@lists.linux.dev>; Sun,  5 Jul 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783244359; cv=none; b=aqP/2dWVC/FC9t+fszzgT3xT7Uirsmoi6/MyOUjBl9HOMgp0aBIXdlK9+RlMQdNTOd7QWUIbwr7Tlj8UcSm7NZBKbA9ln9PUuCp+R8a81k2hQMluQYgzogo54TYPv/pEfRXPYc7Cu5GUXL+SnpvUBd+46i6A44R1/nHL/JmOGTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783244359; c=relaxed/simple;
	bh=Rxs9qUtG+mWCN/e4EGrIBu0gcdx0AH2kyJOVw2mSPwM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DyDux9GB6nVXUtHF/y5JPNwwALqXt3sCu+QcNmJgxdRtSheuVwUMyix7qY3I6bEuJ0oU0HsFF+gfKWeMKi00fh0baArBBysH1zyueGJKFJdcq1gixQrwtVmtI61pmE6IfLowtWM0nq0P3LcJRHPPlaaUIugRQNSiq9rVLjh8hh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U60OYOq2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U60OYOq2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so21772715e9.0
        for <llvm@lists.linux.dev>; Sun, 05 Jul 2026 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783244356; x=1783849156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BonVuB2ntx0dbflnM03teY2wS7m40yBpJnlVxtkXrk=;
        b=U60OYOq25zyIo1Pe5q0tFcfDSVAq596rN8sCFNsBelfYKwsOCubYN0hBR9y0PrbthT
         ijkx31KqFuPL1NhMFsbbqPzwBIRavLwIhTjvdUY48lHezhvhIXZ8f02ew6Z4UKhFmxNw
         QqWHh/T4IyksO7iJTgG1jxt47fgeOGAnknY/bIDLHmPMuPJh3nPs/YgELnq/mudok+zP
         iK/b7dekLhgG4C3Lh+gDPcRwnzLn05njQctqI9sOOJFvKTdNkYeUxhotr2TvW5MLiNiu
         P+1DJtS5fGiZ8q7q2LCg37w4sJRG+gD6kcnpssKSfAGdph4uwYDbuphktWGicAN3ETWF
         Jr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783244356; x=1783849156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/BonVuB2ntx0dbflnM03teY2wS7m40yBpJnlVxtkXrk=;
        b=fchPvojvVoDIMYoCzNBpZ6NVf1Y3gWZzItmQrKXRLR9ywL9I+5Yt62UuXpEb+emlQo
         45DaRBpU2dYx9TeaPM3uNUo5xR9J17/LgjD6n5PGwkQXyKyXdBtGNdLdyfGWV01SKnwS
         3mPfjFwtZqTOWALEf+V6jAaLi/hTfov0QNwRFy/Br7I/Mx4R0Y+oAFlKkICvfmwgZ/of
         xJMAdlWRQwOP1oUhrAREBnuW1fFQ6tu5P+mvAzFYgLE0TK8yHnWdSACJVKQQGMSWV7qB
         mM4S8yy16ga3Oe/BOyUi234CI6z1/nWt5jtO1+jQhpygmpduC3kYrIzuTX1e/ygi8Al2
         rUBA==
X-Forwarded-Encrypted: i=1; AFNElJ/aq2G9HF4h8k/598AEeuDNHQhyGOtM7vsR+YReClcUtPtACCeCNVNy9KuCYDr8HzMKGIrX@lists.linux.dev
X-Gm-Message-State: AOJu0YxzJiSVF+hBjdIc4TlvWk2v44X7dWOu787dqgkEHmdHG2gpFOer
	gdGjQiEvjkLjweyQQVUk8+3tF/axN3J3F2ONbR6ikkEO9zdHm6qmBdVU
X-Gm-Gg: AfdE7cmlCaF+6VfUzxFDzPSHupwVAb+YiGINsMdMCsC6Bj0W+e7SIhW0mD89W/muNA2
	/43bJyxTGHHlXh9sHAxa+tCZ2GVBi14p2XRFggmSzu012+f3YGGN7kmS4yNBqa3XZ8KWRSMI7+D
	dHc5z6FIa+O7/AkWK3+YOLJQerEcxlvge5yYwccUUkQwmAI8L8+fvGryuYypuZudrj1hcxq1sD6
	r9x99wqx/hQW9/qW1VejXrG59hm3GMBBYDeoXzD5QrYSaRT3jFPVm9fQCS8xhpdhJ7ggaFTgPtY
	fZA/5DngRoAdfquTbQR2YvmqZxRbJe7kDDAxNNICLe5b4cIoA6tlHyc/ljSlICpoyhewDT0jN/C
	KjWwMhzkCEmfdOPjzOvsOUl6ewUC73kpJa0Fy2l6CSo1CGz98ipdKCGSynJeLFXOS+c1XESWoAi
	oX5Q9Z2blr3kiz79Fl1m12e3sEs3h3cC2sifq3nEgbsvdI6A==
X-Received: by 2002:a05:600c:810b:b0:493:bba7:e9f4 with SMTP id 5b1f17b1804b1-493d11f002emr62390125e9.18.1783244356071;
        Sun, 05 Jul 2026 02:39:16 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm17497298f8f.4.2026.07.05.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 02:39:15 -0700 (PDT)
Date: Sun, 5 Jul 2026 10:39:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <lumag@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: drivers/gpu/drm/bridge/ssd2825.c:484:13: warning: stack frame
 size (20088) exceeds limit (8192) in 'ssd2825_bridge_atomic_pre_enable'
Message-ID: <20260705103912.1062dee8@pumpkin>
In-Reply-To: <202607050500.f5aEOYFR-lkp@intel.com>
References: <202607050500.f5aEOYFR-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 05 Jul 2026 06:00:34 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Svyatoslav,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
> commit: 55023abe6a2921a8916b623c24208e1971b88729 drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
> date:   11 months ago
> config: x86_64-randconfig-011-20260705 (https://download.01.org/0day-ci/archive/20260705/202607050500.f5aEOYFR-lkp@intel.com/config)
> compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607050500.f5aEOYFR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 55023abe6a29 ("drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607050500.f5aEOYFR-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from <built-in>:3:
>    In file included from include/linux/compiler_types.h:171:
>    include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
>       28 | #define __SANITIZE_ADDRESS__
>          |         ^
>    <built-in>:353:9: note: previous definition is here
>      353 | #define __SANITIZE_ADDRESS__ 1
>          |         ^
> >> drivers/gpu/drm/bridge/ssd2825.c:484:13: warning: stack frame size (20088) exceeds limit (8192) in 'ssd2825_bridge_atomic_pre_enable' [-Wframe-larger-than]  
>      484 | static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>          |             ^
>    2 warnings generated.

Every ssd2825_write_reg() calls spi_write() 3 times and that inlines
spi_sync_transfer() which allocates 'struct spi_message' on stack.
I think that is just over 100 bytes.
With some options clang will allocate each one separately - hence the
enormous stack frame when the whole lot is inlined.

As well as stopping ssd2825_write_reg() being inlined (no point for a slow
function), I suspect spi_sync_transfer() shouldn't be inlined either.
Certainly you don't want both it and spi_write() inlined.

	David 

> 
> 
> vim +/ssd2825_bridge_atomic_pre_enable +484 drivers/gpu/drm/bridge/ssd2825.c
> 
>    483	
>  > 484	static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,  
>    485						     struct drm_atomic_state *state)
>    486	{
>    487		struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
>    488		struct mipi_dsi_device *dsi_dev = priv->output.dev;
>    489		const struct drm_crtc_state *crtc_state;
>    490		const struct drm_display_mode *mode;
>    491		struct drm_connector *connector;
>    492		struct drm_crtc *crtc;
>    493		u32 input_bus_flags = bridge->timings->input_bus_flags;
>    494		u16 flags = 0, config;
>    495		u8 pixel_format;
>    496		int ret;
>    497	
>    498		/* Power Sequence */
>    499		ret = clk_prepare_enable(priv->tx_clk);
>    500		if (ret)
>    501			dev_err(priv->dev, "error enabling tx_clk (%d)\n", ret);
>    502	
>    503		ret = regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies), priv->supplies);
>    504		if (ret)
>    505			dev_err(priv->dev, "error enabling regulators (%d)\n", ret);
>    506	
>    507		usleep_range(1000, 2000);
>    508	
>    509		ssd2825_hw_reset(priv);
>    510	
>    511		/* Perform SW reset */
>    512		ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
>    513	
>    514		/* Set pixel format */
>    515		switch (dsi_dev->format) {
>    516		case MIPI_DSI_FMT_RGB565:
>    517			pixel_format = 0x00;
>    518			break;
>    519		case MIPI_DSI_FMT_RGB666_PACKED:
>    520			pixel_format = 0x01;
>    521			break;
>    522		case MIPI_DSI_FMT_RGB666:
>    523			pixel_format = 0x02;
>    524			break;
>    525		case MIPI_DSI_FMT_RGB888:
>    526		default:
>    527			pixel_format = 0x03;
>    528			break;
>    529		}
>    530	
>    531		connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>    532		crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
>    533		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>    534		mode = &crtc_state->adjusted_mode;
>    535	
>    536		/* Set panel timings */
>    537		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
>    538				  ((mode->vtotal - mode->vsync_end) << 8) |
>    539				  (mode->htotal - mode->hsync_end));
>    540		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
>    541				  ((mode->vtotal - mode->vsync_start) << 8) |
>    542				  (mode->htotal - mode->hsync_start));
>    543		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
>    544				  ((mode->vsync_start - mode->vdisplay) << 8) |
>    545				  (mode->hsync_start - mode->hdisplay));
>    546		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, mode->hdisplay);
>    547		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, mode->vdisplay);
>    548	
>    549		if (mode->flags & DRM_MODE_FLAG_PHSYNC)
>    550			flags |= SSD2825_HSYNC_HIGH;
>    551	
>    552		if (mode->flags & DRM_MODE_FLAG_PVSYNC)
>    553			flags |= SSD2825_VSYNC_HIGH;
>    554	
>    555		if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
>    556			flags |= SSD2825_NON_BURST_EV;
>    557	
>    558		if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
>    559			flags |= SSD2825_PCKL_HIGH;
>    560	
>    561		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6, flags | pixel_format);
>    562		ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi_dev->lanes - 1);
>    563		ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
>    564	
>    565		/* Call PLL configuration */
>    566		ssd2825_setup_pll(priv, mode);
>    567	
>    568		usleep_range(10000, 11000);
>    569	
>    570		config = SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | SSD2825_CONF_REG_DCS |
>    571			 SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
>    572	
>    573		if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
>    574			config &= ~SSD2825_CONF_REG_HS;
>    575	
>    576		if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>    577			config &= ~SSD2825_CONF_REG_EOT;
>    578	
>    579		/* Initial DSI configuration register set */
>    580		ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
>    581		ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
>    582	
>    583		if (priv->output.panel)
>    584			drm_panel_enable(priv->output.panel);
>    585	}
>    586	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

