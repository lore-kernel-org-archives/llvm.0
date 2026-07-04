Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C89B239E60;
	Sat,  4 Jul 2026 22:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783202484; cv=none; b=Q/l5BNIE7w63OCgOjRJMJhDwh6FE+5+5UC2OmB5PkTW8RBHgnTxpNAWBOv8P+jAPfOe3N/2muZbggvxqxx1xDYVgxE6Vu+Ap+DI/oV0c4KM46AjKNLWj1M0Mz9oX367R/n6k5p4UYVJC8RXxU6Z/wZ0GpEtKCc+j5DiihnD/R9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783202484; c=relaxed/simple;
	bh=lyBZDGDBPXSuPRFdgj89oRTAYcBgBBAl5Lo1b2k0MSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TXN1dwkhSMSnVM2+9SknZPCFKqs6v4DqCHXOdWkz1I5F3nkkBv1p4yVU/Enxmpqs+IH1wXvGnjpCJ/uhLcGVl6Z1/nFJF1IQuBMnmNiw2r5QT0YM+VdX2DTkCvgPcH3J1uCprJsPoKr0YrHFnX8CNKhyClugJXPACfV05NuemfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAB4l15U; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAB4l15U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783202481; x=1814738481;
  h=date:from:to:cc:subject:message-id;
  bh=lyBZDGDBPXSuPRFdgj89oRTAYcBgBBAl5Lo1b2k0MSk=;
  b=eAB4l15UvFt/tkvSHj+P59E7trtB8KjM4PY62/JGTMg8OMCcCjEVTHA7
   o/gE47JdwDuEnwRKdHMuuE0KsDfp5YFxvNB5pFhySLrjs87NwV/frbEQU
   stnUQe2TGnOEM2MyPMHoZUXKGtLvscODJ+63bIjGO3p/x9BiL/cKihEKj
   DZpBEz6srrNOAdUd/1NjRu9Wk7NKlLeAdvdiDdIgoRRnNbNviLPQpFO4s
   Cj+Nlm+/19Z/srFNnBERHK4ui5mwOwlOPIDEKKOanj+qospxsVJ+YGMlm
   VC55jUqZ+aoDOaUyZkJ4H+eF2MYREOnFpBmjJT8okQ1earQmCrULitBDB
   g==;
X-CSE-ConnectionGUID: aMjTlpXUT3CcUJmUgMRgAg==
X-CSE-MsgGUID: lWeWgnc1QcmPBjETWmQsQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="87715621"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="87715621"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 15:01:20 -0700
X-CSE-ConnectionGUID: rUn0Q6o1QJiBZrd0/1Q7cA==
X-CSE-MsgGUID: rrlXK4D3SBWQzm1tPoae3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="251633909"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2026 15:01:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg8QF-00000000DHj-2mHN;
	Sat, 04 Jul 2026 22:01:15 +0000
Date: Sun, 05 Jul 2026 06:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: drivers/gpu/drm/bridge/ssd2825.c:484:13: warning: stack
 frame size (20088) exceeds limit (8192) in 'ssd2825_bridge_atomic_pre_enable'
Message-ID: <202607050500.f5aEOYFR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Svyatoslav,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
commit: 55023abe6a2921a8916b623c24208e1971b88729 drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
date:   11 months ago
config: x86_64-randconfig-011-20260705 (https://download.01.org/0day-ci/archive/20260705/202607050500.f5aEOYFR-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607050500.f5aEOYFR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 55023abe6a29 ("drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607050500.f5aEOYFR-lkp@intel.com/

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
