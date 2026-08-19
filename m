Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AE32DA74C;
	Wed, 19 Aug 2026 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143380; cv=none; b=CZvE/7UFppRfNBlzJA4e0xYu//agQ2qrhz7YGZhdw+lg3S6aV1OiqmtuD+PARDW6NkA5ObwMHGcFG9qMhNMAJ1npWb1dmEqE8y0imkvasIHdvB+5/dPKwRJ5tKfYib/ZQP/Y8SDwhSpJNSHsPGGM4YGGug+Ig2ao5Br9hV/5VqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143380; c=relaxed/simple;
	bh=nLBTyh2p36IsSjNHVdGphBYCrOQnoXIGjVyEgE9f/5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M/UCOhADvZMCqkvYiGlQ2FMwmC6taTb0pDRSxENluh0YLT9zyKd8oYTpAukYIv5lJPAeeXd82+nDaniAGC8W6keyEtaoaWkI5H4GmZykddpl6rpf+nSU1ZlIGduKpI7e7bd7n2+DecuSu+DG35PAVK3UnR0xYZzxdK77SuTsBnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rt29yuZY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rt29yuZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787143378; x=1818679378;
  h=date:from:to:cc:subject:message-id;
  bh=nLBTyh2p36IsSjNHVdGphBYCrOQnoXIGjVyEgE9f/5s=;
  b=Rt29yuZY7L2kxBwJrJfszmdLrW4upgDEYPFF/eiX4Efi2i0DGZmCCXSW
   60kR5lEw5xVDRmceALu3/Oq7sd++YT+fGGkd06gWHF62ccj/DO+VXcUbM
   0u3my8aSNsLa6UxYLulWFHNmgPiMipg2+4YO7MyNXZ7cy9kKH6FELyOmA
   xZBUWdUbj14BknZ97dYPt5U1SEkO+IVEyV7tYj+Ftmi6b2vsymMiyH5Js
   wJuq0LoRelqxjGsP7VsHirM6AVhZH5jLqI5R92/MMoMyB4N+RXTuoTb1e
   KeXpc4Z2P9iaNn2fcA6SKqoDQi0uQNy8mUOZRJGfP1/+rnBObCtTTjRHG
   w==;
X-CSE-ConnectionGUID: yojX4EWsRXCYXtfxeBNd0Q==
X-CSE-MsgGUID: wbZ8/SW8TLKJhHh7xzD8SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98322785"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="98322785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 05:42:57 -0700
X-CSE-ConnectionGUID: xCcK85WtQn2wu/1nZ7QXFQ==
X-CSE-MsgGUID: K+BAQ9jARl60DRxmFzmLWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="262913887"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2026 05:42:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwfd5-00000000fFS-3QOK;
	Wed, 19 Aug 2026 12:42:51 +0000
Date: Wed, 19 Aug 2026 20:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: drivers/gpu/drm/bridge/ssd2825.c:484:13: warning: stack
 frame size (20088) exceeds limit (8192) in 'ssd2825_bridge_atomic_pre_enable'
Message-ID: <202608192010.zK7MQiyb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Svyatoslav,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a0dd7ba4f44cdc116d83712f61e7c1a95be3588
commit: 55023abe6a2921a8916b623c24208e1971b88729 drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
date:   1 year, 1 month ago
config: x86_64-randconfig-003-20260819 (https://download.01.org/0day-ci/archive/20260819/202608192010.zK7MQiyb-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608192010.zK7MQiyb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 55023abe6a29 ("drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608192010.zK7MQiyb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/gpu/drm/bridge/ssd2825.c:484:13: warning: stack frame size (20088) exceeds limit (8192) in 'ssd2825_bridge_atomic_pre_enable' [-Wframe-larger-than]
     484 | static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
         |             ^
   2 warnings generated.


vim +/ssd2825_bridge_atomic_pre_enable +484 drivers/gpu/drm/bridge/ssd2825.c

   483	
 > 484	static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
   485						     struct drm_atomic_state *state)
   486	{
   487		struct ssd2825_priv *priv = bridge_to_ssd2825(bridge);
   488		struct mipi_dsi_device *dsi_dev = priv->output.dev;
   489		const struct drm_crtc_state *crtc_state;
   490		const struct drm_display_mode *mode;
   491		struct drm_connector *connector;
   492		struct drm_crtc *crtc;
   493		u32 input_bus_flags = bridge->timings->input_bus_flags;
   494		u16 flags = 0, config;
   495		u8 pixel_format;
   496		int ret;
   497	
   498		/* Power Sequence */
   499		ret = clk_prepare_enable(priv->tx_clk);
   500		if (ret)
   501			dev_err(priv->dev, "error enabling tx_clk (%d)\n", ret);
   502	
   503		ret = regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies), priv->supplies);
   504		if (ret)
   505			dev_err(priv->dev, "error enabling regulators (%d)\n", ret);
   506	
   507		usleep_range(1000, 2000);
   508	
   509		ssd2825_hw_reset(priv);
   510	
   511		/* Perform SW reset */
   512		ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
   513	
   514		/* Set pixel format */
   515		switch (dsi_dev->format) {
   516		case MIPI_DSI_FMT_RGB565:
   517			pixel_format = 0x00;
   518			break;
   519		case MIPI_DSI_FMT_RGB666_PACKED:
   520			pixel_format = 0x01;
   521			break;
   522		case MIPI_DSI_FMT_RGB666:
   523			pixel_format = 0x02;
   524			break;
   525		case MIPI_DSI_FMT_RGB888:
   526		default:
   527			pixel_format = 0x03;
   528			break;
   529		}
   530	
   531		connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
   532		crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
   533		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
   534		mode = &crtc_state->adjusted_mode;
   535	
   536		/* Set panel timings */
   537		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
   538				  ((mode->vtotal - mode->vsync_end) << 8) |
   539				  (mode->htotal - mode->hsync_end));
   540		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
   541				  ((mode->vtotal - mode->vsync_start) << 8) |
   542				  (mode->htotal - mode->hsync_start));
   543		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
   544				  ((mode->vsync_start - mode->vdisplay) << 8) |
   545				  (mode->hsync_start - mode->hdisplay));
   546		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, mode->hdisplay);
   547		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, mode->vdisplay);
   548	
   549		if (mode->flags & DRM_MODE_FLAG_PHSYNC)
   550			flags |= SSD2825_HSYNC_HIGH;
   551	
   552		if (mode->flags & DRM_MODE_FLAG_PVSYNC)
   553			flags |= SSD2825_VSYNC_HIGH;
   554	
   555		if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
   556			flags |= SSD2825_NON_BURST_EV;
   557	
   558		if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
   559			flags |= SSD2825_PCKL_HIGH;
   560	
   561		ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6, flags | pixel_format);
   562		ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi_dev->lanes - 1);
   563		ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
   564	
   565		/* Call PLL configuration */
   566		ssd2825_setup_pll(priv, mode);
   567	
   568		usleep_range(10000, 11000);
   569	
   570		config = SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | SSD2825_CONF_REG_DCS |
   571			 SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
   572	
   573		if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
   574			config &= ~SSD2825_CONF_REG_HS;
   575	
   576		if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
   577			config &= ~SSD2825_CONF_REG_EOT;
   578	
   579		/* Initial DSI configuration register set */
   580		ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
   581		ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
   582	
   583		if (priv->output.panel)
   584			drm_panel_enable(priv->output.panel);
   585	}
   586	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
