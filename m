Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810B6FB9;
	Sun,  1 Sep 2024 00:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725150327; cv=none; b=FHI504KJZJRyxR7IDHLCwRffqi8kQmGx3zJnCjBHsdhYNi2ClRlzymU6Ui9MWg4J8N7TLfQnIVfWSq4BXqzG2Ref9ppmdqDttHPWP0ASmHKA4mk94ijufxNSfNUm83hy/bX5zHaEJZuBDHFIckN15CRPJOyD5apEn4La9rQZVy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725150327; c=relaxed/simple;
	bh=REZVDW7blx5s9I9NmG+wqbogNkO3fDZOyZ4db6m+fCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OFa9UXped6LVUOEv0M1GWdn0Sb7RB2vAVEkMriWUKpVLyvhBwyzGakqEj9kfRsKKVQk4f9vQxwTzqoRoi7C7PyATRPilnkO3ECaYc9mTh3/qW8FRiqVnEryXP8WL5rSKLFF7IGniIDZEJSabPnDEjM0sS7DTSw61/LJPGsiMI2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MG9F6iBS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MG9F6iBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725150325; x=1756686325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REZVDW7blx5s9I9NmG+wqbogNkO3fDZOyZ4db6m+fCw=;
  b=MG9F6iBSbwAkhBkSV6l2kpses6kKtOvNxoWjjjwOYwaIMyJPrtRlFE24
   +Wc9EoPsRDHN/K/lYYKO+BM4QXmIn4nL87L/IGE4RQKfYoX98C31LjhKR
   YTNLU0ZE3tKoPxYV2qGR0Szlj92XG+nSQAH43H7E3mcUA38HK2j9Lr2gq
   05x5JXTwsiiCe0hM7tlkEAp4CcRA5StXHop6UWFWQtPWEg2bF7wHd4qOJ
   N+M45UnrMJntoh6OnYIC8402W/h5uve2SoB90uoRj35ONhIlF5PL+040B
   Ebe/zrgsunh+trXaKxA9NL+NMcWSsIFudoDi2/b+GX8tIunOWB+2FW/RF
   A==;
X-CSE-ConnectionGUID: XglAzfLQTyqCnFmdxwF+VA==
X-CSE-MsgGUID: YjiZNDmPThGL7fDf136t1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23628438"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23628438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 17:25:25 -0700
X-CSE-ConnectionGUID: Hj7vnab5SX+gZ9ageee75Q==
X-CSE-MsgGUID: 96t5dPbiQueuvdkawZFIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="68642090"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2024 17:25:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skYPB-0003Di-2F;
	Sun, 01 Sep 2024 00:25:21 +0000
Date: Sun, 1 Sep 2024 08:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [linux-next:master 7644/8126]
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:255:8: error: call to
 undeclared function 'devm_regulator_bulk_get_const'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202409010839.kJVvn5zx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: e0cb0c785250d0565c19ba17fc95bd7ab97670ba [7644/8126] drm/panel: visionox-vtdr6130: switch to devm_regulator_bulk_get_const
config: i386-randconfig-012-20240901 (https://download.01.org/0day-ci/archive/20240901/202409010839.kJVvn5zx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010839.kJVvn5zx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010839.kJVvn5zx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-visionox-vtdr6130.c:255:8: error: call to undeclared function 'devm_regulator_bulk_get_const'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |         ret = devm_regulator_bulk_get_const(&dsi->dev,
         |               ^
   1 error generated.


vim +/devm_regulator_bulk_get_const +255 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c

   244	
   245	static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
   246	{
   247		struct device *dev = &dsi->dev;
   248		struct visionox_vtdr6130 *ctx;
   249		int ret;
   250	
   251		ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
   252		if (!ctx)
   253			return -ENOMEM;
   254	
 > 255		ret = devm_regulator_bulk_get_const(&dsi->dev,
   256						    ARRAY_SIZE(visionox_vtdr6130_supplies),
   257						    visionox_vtdr6130_supplies,
   258						    &ctx->supplies);
   259		if (ret < 0)
   260			return ret;
   261	
   262		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
   263		if (IS_ERR(ctx->reset_gpio))
   264			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   265					     "Failed to get reset-gpios\n");
   266	
   267		ctx->dsi = dsi;
   268		mipi_dsi_set_drvdata(dsi, ctx);
   269	
   270		dsi->lanes = 4;
   271		dsi->format = MIPI_DSI_FMT_RGB888;
   272		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
   273				  MIPI_DSI_CLOCK_NON_CONTINUOUS;
   274		ctx->panel.prepare_prev_first = true;
   275	
   276		drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
   277			       DRM_MODE_CONNECTOR_DSI);
   278	
   279		ctx->panel.backlight = visionox_vtdr6130_create_backlight(dsi);
   280		if (IS_ERR(ctx->panel.backlight))
   281			return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
   282					     "Failed to create backlight\n");
   283	
   284		drm_panel_add(&ctx->panel);
   285	
   286		ret = mipi_dsi_attach(dsi);
   287		if (ret < 0) {
   288			dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
   289			drm_panel_remove(&ctx->panel);
   290			return ret;
   291		}
   292	
   293		return 0;
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
