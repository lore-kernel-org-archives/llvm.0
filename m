Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D391A4E66;
	Mon,  2 Sep 2024 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314368; cv=none; b=o3Hqh5xduJdPRjAzxt2vxgs8zIs/DQ3G0g9Bwx4V3SfkEKA4oO2isS4BiDyjbemUNnzx/RlWM+R+6UBpL+9ZB64ZuazV6z8TEh9wU25TGTLIUOWRlF0C22G4QH0zPvyXXTDWWlRhSX/sQrBZyc4Hx2NefbNY+BsKW7TTF8gn/Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314368; c=relaxed/simple;
	bh=M9SRZkkWrQd3aqlXHwOOqPp/3vpi/F/Ds7EGolBRXMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2C7rDH8oIWdEHypY26E164OEXfL3QQLubpE0QLVqjhEsDhVI4ynxZmD0HiJ0JTavSvKf2Q08rxmLH4DmXbtNfVJkBD9flIxQcbBZkKo8Q2WBsYNZAlHZ0pCnkY3DWqDEc7bLgiWeng7j36IGJiWu0Y+3oRIyggyURJgr1lLAEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJgWol3U; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJgWol3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725314365; x=1756850365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9SRZkkWrQd3aqlXHwOOqPp/3vpi/F/Ds7EGolBRXMs=;
  b=gJgWol3UF8x0qAg/bBDyKiqyhgxBrpapIZqoRqFzx12Y+9ew+LpD3bGa
   ighyP3qMtzt1NggtO3L6bex90cRj89AXtH6bta6+NmGlrMq7NFXT/3H7y
   2iTmG47rkcZSjy7IgL51tSaJifkgsVudOZjEtPJp/P2kK4SxooOWYYr+p
   wagWpeyqhPTHZ22c8lMGkQSuPyt6Ns6YkE2B2/hCyi+1aJYhiX3QBOmCU
   Niy23HVV+5F+uJiDtDiRMRBA1tX54C0SSkRDK7Bw3/0TWiRwKAczHbUIV
   +tNcO7TJ4sRmMv3mZLdxf+eJ+busIaGRV3+QRuI6xD+2DR4GRgJzThiJ+
   Q==;
X-CSE-ConnectionGUID: v83k1h1ZSkeN85fcD1tiiw==
X-CSE-MsgGUID: XdlHKdczRMGGLyUYYxyz+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24077676"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="24077676"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 14:59:24 -0700
X-CSE-ConnectionGUID: teduTeg/QoifXUTv2DC8XQ==
X-CSE-MsgGUID: 0BTdtAoIT1GqBfCM6W2A8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; 
   d="scan'208";a="65429390"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Sep 2024 14:59:23 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slF4y-0005xa-2L;
	Mon, 02 Sep 2024 21:59:20 +0000
Date: Tue, 3 Sep 2024 05:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [linux-next:master 6300/8400]
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:173:8: error: call to
 undeclared function 'devm_regulator_bulk_get_const'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202409030542.gKqDuIWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
commit: aec8485f226c36eb4eea1d489772cd6f2c40144d [6300/8400] drm/panel: add BOE tv101wum-ll2 panel driver
config: x86_64-randconfig-015-20240903 (https://download.01.org/0day-ci/archive/20240903/202409030542.gKqDuIWa-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409030542.gKqDuIWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030542.gKqDuIWa-lkp@intel.com/

Note: the linux-next/master HEAD ecc768a84f0b8e631986f9ade3118fa37852fef0 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c:173:8: error: call to undeclared function 'devm_regulator_bulk_get_const'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |         ret = devm_regulator_bulk_get_const(&dsi->dev,
         |               ^
   1 error generated.


vim +/devm_regulator_bulk_get_const +173 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c

   162	
   163	static int boe_tv101wum_ll2_probe(struct mipi_dsi_device *dsi)
   164	{
   165		struct device *dev = &dsi->dev;
   166		struct boe_tv101wum_ll2 *ctx;
   167		int ret;
   168	
   169		ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
   170		if (!ctx)
   171			return -ENOMEM;
   172	
 > 173		ret = devm_regulator_bulk_get_const(&dsi->dev,
   174						ARRAY_SIZE(boe_tv101wum_ll2_supplies),
   175						boe_tv101wum_ll2_supplies,
   176						&ctx->supplies);
   177		if (ret < 0)
   178			return ret;
   179	
   180		ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
   181		if (IS_ERR(ctx->reset_gpio))
   182			return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
   183					     "Failed to get reset-gpios\n");
   184	
   185		ctx->dsi = dsi;
   186		mipi_dsi_set_drvdata(dsi, ctx);
   187	
   188		dsi->lanes = 4;
   189		dsi->format = MIPI_DSI_FMT_RGB888;
   190		dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
   191				  MIPI_DSI_MODE_VIDEO_HSE;
   192	
   193		drm_panel_init(&ctx->panel, dev, &boe_tv101wum_ll2_panel_funcs,
   194			       DRM_MODE_CONNECTOR_DSI);
   195		ctx->panel.prepare_prev_first = true;
   196	
   197		ret = drm_panel_of_backlight(&ctx->panel);
   198		if (ret)
   199			return dev_err_probe(dev, ret, "Failed to get backlight\n");
   200	
   201		drm_panel_add(&ctx->panel);
   202	
   203		ret = mipi_dsi_attach(dsi);
   204		if (ret < 0) {
   205			drm_panel_remove(&ctx->panel);
   206			return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
   207		}
   208	
   209		return 0;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
