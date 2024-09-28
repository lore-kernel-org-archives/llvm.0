Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288AA1442F6;
	Sat, 28 Sep 2024 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727550752; cv=none; b=pBMWxxADYkIyZFUhjWxutxJ1XzjuL1Dyy0Db/LnO/f0zx0O7WRBjjlLx09KplrDxmelxr1kAKMypRjZWlSb6q8ytMLefuXGhvY8ayqoxketNi4h2dKSnxJgmgUKtU4pHHSZhKVXMqiV+WtHbnTepXbnEZ0s9lGP2a+Y5bPuiGtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727550752; c=relaxed/simple;
	bh=sVcuN0m05lzqakAEKOFwJS0G38YXu6zObud6Y5PKnuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fD/TbrsFlqVSgNbndiV9sq/f2yAop/IpUuII3HUdrErfBMEDFjG+D0khtvjb+C0zvKS5EaqozOIwp7iNsoTYBFymkhcyl6yGzMUXke2TBtUBPNuIF+ZiuF3bF63Jtk+7z6UxKFEWFVM19yHaEe9daMD5gzLAvWFd0yO2RGsj3x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btMYEEVX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btMYEEVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727550752; x=1759086752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVcuN0m05lzqakAEKOFwJS0G38YXu6zObud6Y5PKnuY=;
  b=btMYEEVXxuz8X8FRbygIaGhL9GkPFJjWEEl0xCXOMyy+77t+LhswvKMc
   tuv2+YvKIgAs66p19/oqKfW2730rkTG/5e1+o4FlIrwNT7UBXmhJ4ZiSJ
   4dNzn15Eq0BubwR2qgZYlBxH/kyXLj4kuwR2tvVVAPqeVqQu2bwGklfrk
   stz8VX+IuAYCUklBaktPUAYKHcJeSDTs01YGDSS9NGSRjPlEoRjJyM/VN
   x1TegXRENfiyh6Vmk3cYmje9WGKYx9vhvuzm6qMtOwdLn3w+4kQiFujI+
   wgjLC5Azf48lBW2a2bL8qRVlkjg1UoZtpZqu5ZzVUpkr1428CQ5eSxQXZ
   g==;
X-CSE-ConnectionGUID: O2bSyhTKSaOAmC7jvSqPYg==
X-CSE-MsgGUID: /iKb+Aq6R9SMGmgsk1n4iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26803343"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26803343"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 12:12:31 -0700
X-CSE-ConnectionGUID: Ss4vIX4iTPG3jQeG7bdfFw==
X-CSE-MsgGUID: wTgPMEgeR0Gfb+BxGKHU4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72927481"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Sep 2024 12:12:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sucri-000NXx-2X;
	Sat, 28 Sep 2024 19:12:26 +0000
Date: Sun, 29 Sep 2024 03:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 37/47]
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:406:25: error: unused variable 'phy'
Message-ID: <202409290334.YkDpOsGS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.11.y
head:   d99b769766ff1b1ced32d8d279d28e581e02fa9d
commit: 8705ad3ca11f0f918d05cc9949aea3b6de588beb [37/47] drm/sun4i: sun8i-hdmi-phy: Add support for D1 PHY
config: i386-buildonly-randconfig-004-20240929 (https://download.01.org/0day-ci/archive/20240929/202409290334.YkDpOsGS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290334.YkDpOsGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290334.YkDpOsGS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:406:25: error: unused variable 'phy' [-Werror,-Wunused-variable]
     406 |         struct sun8i_hdmi_phy *phy = data;
         |                                ^~~
   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c:413:25: error: unused variable 'phy' [-Werror,-Wunused-variable]
     413 |         struct sun8i_hdmi_phy *phy = data;
         |                                ^~~
   2 errors generated.


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
