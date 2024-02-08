Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC6E762D4;
	Thu,  8 Feb 2024 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389501; cv=none; b=oOmOrDz+ZfcINht/4FyO8JWAFla77ao4trsD1gCw6BAtLQ0GxchOJbCqoXpaayAxprWgiQuzoXYpLiDRu8TqKDkRmsXXIBp8e4uHR3Qw8rX2GGI5S895buKCht3P2sydybj3nwMOSqMVwa+56BMSR0z5cnVedskyU4fNZfkRTmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389501; c=relaxed/simple;
	bh=WoDxMN2ClALQMdAxD7KfAxeTx2mZwQLSEBqFcCSrUXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZmzVdfn83QvwOVtHa9om4+sNZ7blO0mz0IxWY7vUuPFk6lthba1/99L9OamcOpEApqzBMDKNlLNskcy1iHJlZ5LJOAG2sXOl529+EbfflT8Hvvjg/uJccEhZPj2Mld0bcLTFnFEf9Yd1DAG1p0t1f2yw1N0luENMb9mZsatwXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAVkmXNK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAVkmXNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707389499; x=1738925499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WoDxMN2ClALQMdAxD7KfAxeTx2mZwQLSEBqFcCSrUXE=;
  b=lAVkmXNKP1EJkB9XXWepv4WQSZ+v3RgGSQWAmY4aQ+i50S5beRTCOB61
   BvHIOiqIeg6M4NDGKw71McwVTNyTOQ2t+SzP5KPQex5tC2VbcvKSuLOvP
   fjabdmJl0HX9l+CfVMZaWomad/jc/0kDKG91kvTjoPaHA+3t2XcSiwPpp
   4VijinULu7tKbHXFMyVxeo3AZ1IeCk/XdEAhECtYOOnO2LJtXpUinAgPs
   LfdSAxeYDYagxq9hunkJxxzOEe1mixeX2QHscrgok82/2D/GLZyMKm5Ce
   0Blgp/Z4e5SLxcky8v3D5ch006BjRwzbZJv3/ZkmBDHwGvnwAuipblWBt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1344840"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1344840"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 02:51:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="824796416"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="824796416"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Feb 2024 02:51:37 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY20E-0003fY-33;
	Thu, 08 Feb 2024 10:51:34 +0000
Date: Thu, 8 Feb 2024 18:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.8.y 39/50]
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:406:25: warning: unused variable
 'phy'
Message-ID: <202402081851.283c9PVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.8.y
head:   f3b6698ac10e7f6528408bda7d8d162065a44af1
commit: b2bc5cdcd76cb7415d2ca5cce5f25056543f8473 [39/50] drm/sun4i: sun8i-hdmi-phy: Add support for D1 PHY
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240208/202402081851.283c9PVO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081851.283c9PVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081851.283c9PVO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:406:25: warning: unused variable 'phy' [-Wunused-variable]
     406 |         struct sun8i_hdmi_phy *phy = data;
         |                                ^~~
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:413:25: warning: unused variable 'phy' [-Wunused-variable]
     413 |         struct sun8i_hdmi_phy *phy = data;
         |                                ^~~
   2 warnings generated.


vim +/phy +406 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c

   401	
   402	static int sun20i_d1_hdmi_phy_config(struct dw_hdmi *hdmi, void *data,
   403					     const struct drm_display_info *display,
   404					     const struct drm_display_mode *mode)
   405	{
 > 406		struct sun8i_hdmi_phy *phy = data;
   407	
   408		return 0;
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
