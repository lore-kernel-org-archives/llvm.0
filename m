Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A701C1E98EF;
	Wed, 22 Apr 2026 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776896757; cv=none; b=Ff7KZTJSljoOEo+Zzpk3M8oq6lRFzOM7cv1/qZqb7J9K3s3jEYFk9lc3qqs0Jv3Xkpz4IUYp742ji+OaLc4QOpInuVXD/xiLi1Qq0ypV7xTv3BgXbwnMZK0R4fB9TTQSWJYpNW1p5aH+Rg1vkdFsJcHqV7obHrNiI7lL1bzsyBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776896757; c=relaxed/simple;
	bh=SB50V4rqdZGOIQUt1fpJjjNfqPRyTzYKSniJX53pklQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FF2wP2JA/w2+ta1ARnrMs1zgP96+j/vkOQFwxQ5zxsi5Nmm0k5FqFNLD0bGG1HhOKNXNPeAM69UCAvSDcVOIjPL/J/QWSzD0r5B2zcdSlBZ1Bz9YZjho3qCYnRhmB38GV42jmmvOEhMzfwSXm0yUHT4/CwgtnyS1ksLh4lgTKmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRetuxio; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRetuxio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776896755; x=1808432755;
  h=date:from:to:cc:subject:message-id;
  bh=SB50V4rqdZGOIQUt1fpJjjNfqPRyTzYKSniJX53pklQ=;
  b=QRetuxio2aplgDfvsLEJeCJysO9xPLFzqaW8BIzbPUxibYmimLIMGbV5
   E+g6N3VB18uigSA8xRmn8/dNiZAm9FWUy7DjoVDP5L5RBTaQ1Wiw/yvd7
   i/rT6qqyFgE8N8N0urJn99tAbTTe9VBHuXCrtdQet39Prc2PPc4K+pN98
   owvNunpZSHhZUqOAHv5lAm4Y12tH0bCdqm+dFjw7PchdJ7wegSfG9uGnd
   PhQTAD5qIptpVMpu2AWiqwNCOE8J0uLNsOsd5r3QCfUFfjoSz7xjmvNUq
   RBXmkmSHtv4eL5ypw0dju48za31iWvBaKQ8l3p5xX+w3JPlTpUBpjojDO
   Q==;
X-CSE-ConnectionGUID: LGG3uvfdT9KFni1AW+9oqw==
X-CSE-MsgGUID: gVei/UhvRm6SIxwKv+lAcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81723913"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="81723913"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 15:25:54 -0700
X-CSE-ConnectionGUID: TGT1a8HYTv2QAZ4eKlXk2w==
X-CSE-MsgGUID: c47q1jYRSsaOtQmutmM86g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="236839406"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Apr 2026 15:25:52 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFg0y-0000000017l-3SCV;
	Wed, 22 Apr 2026 22:25:48 +0000
Date: Thu, 23 Apr 2026 06:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: drivers/gpu/drm/bridge/ssd2825.c:484:13: warning: stack
 frame size (20088) exceeds limit (8192) in 'ssd2825_bridge_atomic_pre_enable'
Message-ID: <202604230640.LNSpKc5J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Svyatoslav,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a4c0c11c0193889446cdb6f1540cc2b9aff97dd
commit: 55023abe6a2921a8916b623c24208e1971b88729 drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
date:   9 months ago
config: x86_64-randconfig-075-20260423 (https://download.01.org/0day-ci/archive/20260423/202604230640.LNSpKc5J-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604230640.LNSpKc5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 55023abe6a29 ("drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604230640.LNSpKc5J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ssd2825.c:484:13: warning: stack frame size (20088) exceeds limit (8192) in 'ssd2825_bridge_atomic_pre_enable' [-Wframe-larger-than]
     484 | static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *bridge,
         |             ^
   1 warning generated.


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
