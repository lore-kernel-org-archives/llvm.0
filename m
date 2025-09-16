Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F05732B4BE;
	Tue, 16 Sep 2025 20:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758054596; cv=none; b=jldef0JVfIWFH/JkJmf/dpjCHxHvKrq4ap6xA9oxwltVljGYbXY8yX7sbUDrlYGSijKC5BtObzfgjDUfhs1pv3WHc712+Kw6Wsd7855RkmC4ugpcP5eLw+w9By/GVuRWsrBRt/z1kAnAJX0Lji2ux2XPveHsl+BRg6egOdLgtkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758054596; c=relaxed/simple;
	bh=epoftPhmDK1NPqyrMdLb5nHKUl46cjDtb9Chef5znsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hexs9jCsHGgf5zJBRjGV+2ES4vUcKiivSPpxOT+e8K4vEruQhYZIM8KneHNGymXHHZxQRFtrD/jWgTeQqoOUHQeVpdIiioHdDZhmfRLcgJlF37VaAx5EEOHbMpfTPQNpPkF4FFJBGQRAKOCMYCxAwAwM3VenK/9eyUfNxYKvHTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bG7wRiVi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bG7wRiVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758054594; x=1789590594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=epoftPhmDK1NPqyrMdLb5nHKUl46cjDtb9Chef5znsM=;
  b=bG7wRiViSKFBqnaZfcSrOfj9rttkrhOo/9eW23Ygj94mschn0meHWy7D
   Jq7ZtFTgD6cSbW5pnKHx5BJX/+RGoKalGz5HNUvk6BMFHIkeV4US5AwYq
   m6TAe8I9oCdfQKvZsnsEc3LsaeBSi9Rnlc3r7SUJQa9ciYTPm2wH1nac5
   vEg4eZKxTSXvUY1T1SlRHE82x0k2CiRgWrljNX6Uq9jVxNsv4kXHLoHdR
   OKcM6VluRqFmAF/Y1+l81/fTQNR+nevy/gGC+7YgzOvKJEPFA6PhdB9FH
   oRtGDT9IdndQlRMDt229BuoIF0A0X/aMqCMJdO+ghjllW0Eyk2eb4PYMJ
   g==;
X-CSE-ConnectionGUID: xIP5iteiTNyP44WzaoPXsw==
X-CSE-MsgGUID: vNDU0bx+Q9+2MKfht10HYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60043876"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="60043876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 13:29:53 -0700
X-CSE-ConnectionGUID: PAF4sLYcTH6vxTztaYxhlQ==
X-CSE-MsgGUID: paIl1qckQZyDZutOhIiYoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="198728548"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Sep 2025 13:29:51 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uycJB-0000iZ-0P;
	Tue, 16 Sep 2025 20:29:49 +0000
Date: Wed, 17 Sep 2025 04:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
	"Daniel Thompson (RISCstar)" <danielt@kernel.org>
Subject: [lee-backlight:for-backlight-next 14/14]
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: error: call
 to undeclared function 'device_property_read_bool'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202509170410.RubSxK3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
head:   9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2
commit: 9f218f9bb9d274b9d5d48a4c95e1b199141fc1f2 [14/14] backlight: Do not include <linux/fb.h> in header file
config: x86_64-buildonly-randconfig-004-20250917 (https://download.01.org/0day-ci/archive/20250917/202509170410.RubSxK3n-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170410.RubSxK3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170410.RubSxK3n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: error: call to undeclared function 'device_property_read_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     718 |         ctx->flip_horizontal = device_property_read_bool(dev, "flip-horizontal");
         |                                ^
   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:718:25: note: did you mean 'drm_property_create_bool'?
   include/drm/drm_property.h:271:22: note: 'drm_property_create_bool' declared here
     271 | struct drm_property *drm_property_create_bool(struct drm_device *dev,
         |                      ^
>> drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c:748:61: error: array has incomplete element type 'const struct of_device_id'
     748 | static const struct of_device_id s6e88a0_ams427ap24_of_match[] = {
         |                                                             ^
   include/linux/device/driver.h:106:15: note: forward declaration of 'struct of_device_id'
     106 |         const struct of_device_id       *of_match_table;
         |                      ^
   2 errors generated.


vim +/device_property_read_bool +718 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c

5b67fdf1668fc37 Jakob Hauser    2024-10-28  683  
d5658db2a0768a7 Jakob Hauser    2024-10-28  684  static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
d5658db2a0768a7 Jakob Hauser    2024-10-28  685  {
d5658db2a0768a7 Jakob Hauser    2024-10-28  686  	struct device *dev = &dsi->dev;
d5658db2a0768a7 Jakob Hauser    2024-10-28  687  	struct s6e88a0_ams427ap24 *ctx;
d5658db2a0768a7 Jakob Hauser    2024-10-28  688  	int ret;
d5658db2a0768a7 Jakob Hauser    2024-10-28  689  
3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  690  	ctx = devm_drm_panel_alloc(dev, struct s6e88a0_ams427ap24, panel,
3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  691  				   &s6e88a0_ams427ap24_panel_funcs,
3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  692  				   DRM_MODE_CONNECTOR_DSI);
3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  693  	if (IS_ERR(ctx))
3a21fd4c9065c3c Anusha Srivatsa 2025-05-29  694  		return PTR_ERR(ctx);
d5658db2a0768a7 Jakob Hauser    2024-10-28  695  
d5658db2a0768a7 Jakob Hauser    2024-10-28  696  	ret = devm_regulator_bulk_get_const(dev,
d5658db2a0768a7 Jakob Hauser    2024-10-28  697  				      ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
d5658db2a0768a7 Jakob Hauser    2024-10-28  698  				      s6e88a0_ams427ap24_supplies,
d5658db2a0768a7 Jakob Hauser    2024-10-28  699  				      &ctx->supplies);
d5658db2a0768a7 Jakob Hauser    2024-10-28  700  	if (ret < 0)
d5658db2a0768a7 Jakob Hauser    2024-10-28  701  		return ret;
d5658db2a0768a7 Jakob Hauser    2024-10-28  702  
d5658db2a0768a7 Jakob Hauser    2024-10-28  703  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
d5658db2a0768a7 Jakob Hauser    2024-10-28  704  	if (IS_ERR(ctx->reset_gpio))
d5658db2a0768a7 Jakob Hauser    2024-10-28  705  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
d5658db2a0768a7 Jakob Hauser    2024-10-28  706  				     "Failed to get reset-gpios\n");
d5658db2a0768a7 Jakob Hauser    2024-10-28  707  
d5658db2a0768a7 Jakob Hauser    2024-10-28  708  	ctx->dsi = dsi;
d5658db2a0768a7 Jakob Hauser    2024-10-28  709  	mipi_dsi_set_drvdata(dsi, ctx);
d5658db2a0768a7 Jakob Hauser    2024-10-28  710  
d5658db2a0768a7 Jakob Hauser    2024-10-28  711  	dsi->lanes = 2;
d5658db2a0768a7 Jakob Hauser    2024-10-28  712  	dsi->format = MIPI_DSI_FMT_RGB888;
d5658db2a0768a7 Jakob Hauser    2024-10-28  713  	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
5b67fdf1668fc37 Jakob Hauser    2024-10-28  714  			  MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_NO_HFP;
d5658db2a0768a7 Jakob Hauser    2024-10-28  715  
d5658db2a0768a7 Jakob Hauser    2024-10-28  716  	ctx->panel.prepare_prev_first = true;
d5658db2a0768a7 Jakob Hauser    2024-10-28  717  
e70d4f8e242bbc4 Jakob Hauser    2024-10-28 @718  	ctx->flip_horizontal = device_property_read_bool(dev, "flip-horizontal");
e70d4f8e242bbc4 Jakob Hauser    2024-10-28  719  
5b67fdf1668fc37 Jakob Hauser    2024-10-28  720  	ret = s6e88a0_ams427ap24_register_backlight(ctx);
5b67fdf1668fc37 Jakob Hauser    2024-10-28  721  	if (ret < 0)
5b67fdf1668fc37 Jakob Hauser    2024-10-28  722  		return ret;
5b67fdf1668fc37 Jakob Hauser    2024-10-28  723  
d5658db2a0768a7 Jakob Hauser    2024-10-28  724  	drm_panel_add(&ctx->panel);
d5658db2a0768a7 Jakob Hauser    2024-10-28  725  
d5658db2a0768a7 Jakob Hauser    2024-10-28  726  	ret = mipi_dsi_attach(dsi);
d5658db2a0768a7 Jakob Hauser    2024-10-28  727  	if (ret < 0) {
d5658db2a0768a7 Jakob Hauser    2024-10-28  728  		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
d5658db2a0768a7 Jakob Hauser    2024-10-28  729  		drm_panel_remove(&ctx->panel);
d5658db2a0768a7 Jakob Hauser    2024-10-28  730  		return ret;
d5658db2a0768a7 Jakob Hauser    2024-10-28  731  	}
d5658db2a0768a7 Jakob Hauser    2024-10-28  732  
d5658db2a0768a7 Jakob Hauser    2024-10-28  733  	return 0;
d5658db2a0768a7 Jakob Hauser    2024-10-28  734  }
d5658db2a0768a7 Jakob Hauser    2024-10-28  735  
d5658db2a0768a7 Jakob Hauser    2024-10-28  736  static void s6e88a0_ams427ap24_remove(struct mipi_dsi_device *dsi)
d5658db2a0768a7 Jakob Hauser    2024-10-28  737  {
d5658db2a0768a7 Jakob Hauser    2024-10-28  738  	struct s6e88a0_ams427ap24 *ctx = mipi_dsi_get_drvdata(dsi);
d5658db2a0768a7 Jakob Hauser    2024-10-28  739  	int ret;
d5658db2a0768a7 Jakob Hauser    2024-10-28  740  
d5658db2a0768a7 Jakob Hauser    2024-10-28  741  	ret = mipi_dsi_detach(dsi);
d5658db2a0768a7 Jakob Hauser    2024-10-28  742  	if (ret < 0)
d5658db2a0768a7 Jakob Hauser    2024-10-28  743  		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
d5658db2a0768a7 Jakob Hauser    2024-10-28  744  
d5658db2a0768a7 Jakob Hauser    2024-10-28  745  	drm_panel_remove(&ctx->panel);
d5658db2a0768a7 Jakob Hauser    2024-10-28  746  }
d5658db2a0768a7 Jakob Hauser    2024-10-28  747  
d5658db2a0768a7 Jakob Hauser    2024-10-28 @748  static const struct of_device_id s6e88a0_ams427ap24_of_match[] = {
d5658db2a0768a7 Jakob Hauser    2024-10-28  749  	{ .compatible = "samsung,s6e88a0-ams427ap24" },
d5658db2a0768a7 Jakob Hauser    2024-10-28  750  	{ /* sentinel */ },
d5658db2a0768a7 Jakob Hauser    2024-10-28  751  };
d5658db2a0768a7 Jakob Hauser    2024-10-28  752  MODULE_DEVICE_TABLE(of, s6e88a0_ams427ap24_of_match);
d5658db2a0768a7 Jakob Hauser    2024-10-28  753  

:::::: The code at line 718 was first introduced by commit
:::::: e70d4f8e242bbc4fd39f3a867dc3e33122d7e559 drm/panel: samsung-s6e88a0-ams427ap24: Add flip option

:::::: TO: Jakob Hauser <jahau@rocketmail.com>
:::::: CC: Neil Armstrong <neil.armstrong@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
