Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A749DF53;
	Mon, 29 Jan 2024 02:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706494019; cv=none; b=McG2v/ZWTJjJkAnqf12D68s54pGAZIx3vFcnrqIqCzVhegVebdVuAG1SEhEdNIN74ch/cbYAopWJcjZOgwxNHA9w2hWU6RLpsquwSNHz5v6T2U06RQAizgBwvQ6VPtRF5tYbLiyURWd7JHtEn3c9hlwwT486W2TxOugWYHMAxd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706494019; c=relaxed/simple;
	bh=OreHuBXkBG4VFOVG4didQY23mWqAzh19dWlc2+4rZ/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4w1xofb5ot3571GuYkUuphY+VVHEg+RQx8JmHqtTO6efqTiraKLkm3vmfWQ2RRyQSkgG0Iho+8TpXIKX8G9yPy+njRcWCtu8TLT1SKqYKVABb+OYdSqmWFSaKIRVbd16VFLhmQHtocfrtTfKUJwq+XDehy9mvnqsCNj+ZexsG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLuowsHZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLuowsHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706494018; x=1738030018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OreHuBXkBG4VFOVG4didQY23mWqAzh19dWlc2+4rZ/c=;
  b=MLuowsHZ5oWBZumRD6DQJcxMp4qbLzx4D2g15qNMMTSrH6jnUeZ1LeEd
   +WgXINKp2vWTY0GfSasIeWXj0zYhSFqZ33qgz+Pm9PXSd8k/ZKH7a8Jth
   4aqfRUYS1heCGyvUqCQxJ6vdxdT2nFPFyVXDXoJuaE0z7wNePyRB3R0ND
   kouXQq/eEFs4KKzx7Pzq+sEnuZzt0YW8oN+vNinf2RBAEeZxLH+QoePrV
   YbBdR0QA85rvzy4GdX6wS6+pUedWBL4nS8NypeHbDO0BNzd99BhUisz05
   NwMDFYqAiWVYPhQsJo/N/oD0MQwY/zz5W3bWuFz1KtmMMfiTwYjOlWxA8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9503358"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="9503358"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 18:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="29627460"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Jan 2024 18:06:55 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUH2z-0003xE-0z;
	Mon, 29 Jan 2024 02:06:53 +0000
Date: Mon, 29 Jan 2024 10:06:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [drm-tip:drm-tip 1/7] drivers/gpu/drm/bridge/samsung-dsim.c:1504:3:
 error: implicit declaration of function 'samsung_dsim_set_stop_state' is
 invalid in C99
Message-ID: <202401291018.WgYuxgMh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   0f1b42b9d395bd4097b2846230a13869dc638216
commit: cd3a0e22e5de2867cd98b5223094a467a5b0993d [1/7] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240129/202401291018.WgYuxgMh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291018.WgYuxgMh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291018.WgYuxgMh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/samsung-dsim.c:1504:3: error: implicit declaration of function 'samsung_dsim_set_stop_state' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   samsung_dsim_set_stop_state(dsi, true);
                   ^
   drivers/gpu/drm/bridge/samsung-dsim.c:1504:3: note: did you mean 'samsung_dsim_set_phy_ctrl'?
   drivers/gpu/drm/bridge/samsung-dsim.c:749:13: note: 'samsung_dsim_set_phy_ctrl' declared here
   static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
               ^
   drivers/gpu/drm/bridge/samsung-dsim.c:1629:22: error: use of undeclared identifier 'samsung_dsim_atomic_disable'; did you mean 'samsung_dsim_atomic_enable'?
           .atomic_disable                 = samsung_dsim_atomic_disable,
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                                             samsung_dsim_atomic_enable
   drivers/gpu/drm/bridge/samsung-dsim.c:1487:13: note: 'samsung_dsim_atomic_enable' declared here
   static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
               ^
   2 errors generated.


vim +/samsung_dsim_set_stop_state +1504 drivers/gpu/drm/bridge/samsung-dsim.c

e7447128ca4a25 Jagan Teki     2023-03-08  1497  
e7447128ca4a25 Jagan Teki     2023-03-08  1498  static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
e7447128ca4a25 Jagan Teki     2023-03-08  1499  					     struct drm_bridge_state *old_bridge_state)
e7447128ca4a25 Jagan Teki     2023-03-08  1500  {
e7447128ca4a25 Jagan Teki     2023-03-08  1501  	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
e7447128ca4a25 Jagan Teki     2023-03-08  1502  
b2fe2292624ac4 Dario Binacchi 2023-12-18  1503  	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
b2fe2292624ac4 Dario Binacchi 2023-12-18 @1504  		samsung_dsim_set_stop_state(dsi, true);
e7447128ca4a25 Jagan Teki     2023-03-08  1505  
e7447128ca4a25 Jagan Teki     2023-03-08  1506  	dsi->state &= ~DSIM_STATE_ENABLED;
e7447128ca4a25 Jagan Teki     2023-03-08  1507  	pm_runtime_put_sync(dsi->dev);
e7447128ca4a25 Jagan Teki     2023-03-08  1508  }
e7447128ca4a25 Jagan Teki     2023-03-08  1509  

:::::: The code at line 1504 was first introduced by commit
:::::: b2fe2292624ac4fc98dcdaf76c983d3f6e8455e5 drm: bridge: samsung-dsim: enter display mode in the enable() callback

:::::: TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
:::::: CC: Robert Foss <rfoss@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
