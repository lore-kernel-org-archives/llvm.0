Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EABD1F9F61;
	Wed,  8 Jan 2025 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334429; cv=none; b=iOmRD2KGERlmOWtZG1DDf6m5qx7fYtbdChDdtNTgmS+Pjml0r6zfvFvc52wSj0BrcUjpuqrJ+MXFnKjnPmc98L4yAZOYxyHZKWubafXbyKspsBuFyBXnXvavVLyksbySanKR6jeAficZ5JOvN8Kfytu3E2TQB3rMaRm5+flRimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334429; c=relaxed/simple;
	bh=KfteZbyV26PCsgidSMPbtLu3MzZ0qK03E76djIPw6lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJ9U/8pZ7TlH/FYfXteBb7oG1S6hEpc66vnJywVA1YheZkL4oFI+HnhhhrfifChWkhDI2zXRaTntz0fwwSQOSiqSsictuOxPYmow7huEFCUPBil3l3qPBHT/gMcouGm6/bzewhokEm3WEiAwzlO/GM0Z410kxEBXeF5AgJI9wtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1Dfu5nx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1Dfu5nx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736334427; x=1767870427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KfteZbyV26PCsgidSMPbtLu3MzZ0qK03E76djIPw6lc=;
  b=G1Dfu5nx5/pCm+GRTKBZqntKWD4vJcwguEY8C7Jc6Rnhs6TMXkN6Fo7E
   Aub+QVY8gGDqXsMajGKGk7xcrnA7LU0JXAQFLFuCPQ95aEFE2zGUGgRPh
   oVDSeVEvMpkw0dFUWsrPK5ijEOVUZrtRngcqo0TywDh1I5JoJg5PJV8K2
   yiYNdLLezIR371/7bWJrgUm+JGyNcYFGvVSY6d/975ZEtyyfbt3LEl6WC
   VHkqOjEh1SFtIWRWcVhn465PdVmy8TzIXDH6j+OvKBND/uYTKtT5qGdLx
   uDHiNFwWCTs+isaWkRa3RiGElmXm7AM6w1iIAVArk4Og7ZjEuuirYcdoY
   A==;
X-CSE-ConnectionGUID: 2Tc0efteSNC4luBCn9Papg==
X-CSE-MsgGUID: 1wH2Oly4QcurFwIx84PnJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36437708"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36437708"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 03:07:06 -0800
X-CSE-ConnectionGUID: voMTk4fwS0yN6I6PUQIA2A==
X-CSE-MsgGUID: cpSxP4hASJuqIUJpEAA6IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103548158"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2025 03:07:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVTtq-000Fyd-2v;
	Wed, 08 Jan 2025 11:06:58 +0000
Date: Wed, 8 Jan 2025 19:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
Message-ID: <202501081822.A69smnpW-lkp@intel.com>
References: <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107143900.988567-2-alexander.stein@ew.tq-group.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/drm-bridge-imx8qxp-pxl2dpi-Use-dev_err_probe/20250107-224125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250107143900.988567-2-alexander.stein%40ew.tq-group.com
patch subject: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
config: arm-randconfig-004-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081822.A69smnpW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501081822.A69smnpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501081822.A69smnpW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:402:29: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     402 |                 return dev_err_probe(dev, ret, "failed to get regmap\n");
         |                                           ^~~
   drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:394:9: note: initialize the variable 'ret' to silence this warning
     394 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +402 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

   388	
   389	static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
   390	{
   391		struct imx8qxp_pxl2dpi *p2d;
   392		struct device *dev = &pdev->dev;
   393		struct device_node *np = dev->of_node;
   394		int ret;
   395	
   396		p2d = devm_kzalloc(dev, sizeof(*p2d), GFP_KERNEL);
   397		if (!p2d)
   398			return -ENOMEM;
   399	
   400		p2d->regmap = syscon_node_to_regmap(np->parent);
   401		if (IS_ERR(p2d->regmap))
 > 402			return dev_err_probe(dev, ret, "failed to get regmap\n");
   403	
   404		ret = imx_scu_get_handle(&p2d->ipc_handle);
   405		if (ret)
   406			return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
   407	
   408		p2d->dev = dev;
   409	
   410		ret = of_property_read_u32(np, "fsl,sc-resource", &p2d->sc_resource);
   411		if (ret) {
   412			DRM_DEV_ERROR(dev, "failed to get SC resource %d\n", ret);
   413			return ret;
   414		}
   415	
   416		p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
   417		if (IS_ERR(p2d->next_bridge))
   418			return dev_err_probe(dev, PTR_ERR(p2d->next_bridge),
   419					     "failed to find next bridge\n");
   420	
   421		ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
   422		if (ret)
   423			return ret;
   424	
   425		ret = imx8qxp_pxl2dpi_parse_dt_companion(p2d);
   426		if (ret)
   427			return ret;
   428	
   429		platform_set_drvdata(pdev, p2d);
   430		pm_runtime_enable(dev);
   431	
   432		p2d->bridge.driver_private = p2d;
   433		p2d->bridge.funcs = &imx8qxp_pxl2dpi_bridge_funcs;
   434		p2d->bridge.of_node = np;
   435	
   436		drm_bridge_add(&p2d->bridge);
   437	
   438		return ret;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
