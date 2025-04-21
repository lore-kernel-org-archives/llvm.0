Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73737CA5E;
	Mon, 21 Apr 2025 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238987; cv=none; b=i8V+8Xr2HkBJCYNqwGA7uY4yfypV6mBzl8+bCD2ePE6ySed5C9iPB+Id5ODw3ShtDDs7cffWmthiLBpldcDxlkhVpEXCZ1p9a2J1KyAFYNaw365cMIA6eAk+E2RWgmtn1z9e0LgeGMuZ/UUPIRqIfa7Lu9i3Yfrv7sHm94Uj4/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238987; c=relaxed/simple;
	bh=PjGhbFMLH+F4wV6pogXA/RFWQfDWC9un/aPnTib5kAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjqK/3XSZAc6D+MVgdq9U4BT3TZlaz32WjNtMORJiYZRL8Oyp7075p8HiS+7WrSJJ/ww0zHeUvuFs5QdtL1dxXmQTnZov2kA5GbDf/8xONAGdHDxx7Tf+m46jUdNes7m0RCMwWlJ7fTIcZJW/1Bquu1z95S/0JineAT63GM6lG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1FW71Gi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1FW71Gi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745238985; x=1776774985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PjGhbFMLH+F4wV6pogXA/RFWQfDWC9un/aPnTib5kAw=;
  b=Z1FW71Gilf2rs6IYZj8tDbz5OoJer9yZ79Z62wDyqu55BDdthiRmt9j7
   iwc4nwiTTfj8hZy2XIO8IuSae6TtG5UxZhrv4+BjyTMXnOr9R5APmzB49
   jbRA9S+6gsBoRmD5BZI7+ZZAGWF1STAWJVmgfqxz1vUdKAmnY+r529ewg
   JnD7/v7ozifwSlM7Y63avUp6hcbrrsJHX4Ydr55XmpkcEII1doU/DQg7i
   WECeVbGsO5WXhHzvJoUFg33IquxQrQ+6tFZ5jkA0pZ2+T3R8/xMQ3wlk/
   c30T0CjF5V7iYzwiLmZFpC4ok6pasPOep5SWqrSYV1cyF3PEw5aCAGGuD
   w==;
X-CSE-ConnectionGUID: wzmBDdxFSLSq9+3WK55JmQ==
X-CSE-MsgGUID: HIARDqDbS6+O1g43Iebv/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46002948"
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="46002948"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 05:36:25 -0700
X-CSE-ConnectionGUID: FqLFtJ/OSQ6mTEXLvzyGUA==
X-CSE-MsgGUID: o6778mzCTnyKZBJ+bwairg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,228,1739865600"; 
   d="scan'208";a="162753154"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Apr 2025 05:36:23 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6qNp-00007T-1e;
	Mon, 21 Apr 2025 12:36:21 +0000
Date: Mon, 21 Apr 2025 20:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jagath Jog J <jagathjog1996@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] drm/mipi-dbi: Use drm_device for debugfs, drop
 drm_minor and .debugfs_init
Message-ID: <202504212018.dSYIH2wr-lkp@intel.com>
References: <20250421085907.24972-2-jagathjog1996@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421085907.24972-2-jagathjog1996@gmail.com>

Hi Jagath,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc3 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jagath-Jog-J/drm-mipi-dbi-Use-drm_device-for-debugfs-drop-drm_minor-and-debugfs_init/20250421-170105
base:   linus/master
patch link:    https://lore.kernel.org/r/20250421085907.24972-2-jagathjog1996%40gmail.com
patch subject: [RFC 1/1] drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor and .debugfs_init
config: hexagon-randconfig-002-20250421 (https://download.01.org/0day-ci/archive/20250421/202504212018.dSYIH2wr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504212018.dSYIH2wr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504212018.dSYIH2wr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/ili9341.c:155:19: error: incompatible function pointer types initializing 'void (*)(struct drm_minor *)' with an expression of type 'void (struct mipi_dbi_dev *)' [-Wincompatible-function-pointer-types]
     155 |         .debugfs_init           = mipi_dbi_debugfs_init,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/gpu/drm/tiny/hx8357d.c:199:19: error: incompatible function pointer types initializing 'void (*)(struct drm_minor *)' with an expression of type 'void (struct mipi_dbi_dev *)' [-Wincompatible-function-pointer-types]
     199 |         .debugfs_init           = mipi_dbi_debugfs_init,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +155 drivers/gpu/drm/tiny/ili9341.c

3fa0e8f6f9609b drivers/gpu/drm/tinydrm/ili9341.c David Lechner     2018-05-25  149  
70a59dd82959f8 drivers/gpu/drm/tiny/ili9341.c    Simona Vetter     2020-11-04  150  static const struct drm_driver ili9341_driver = {
0424fdaf883a68 drivers/gpu/drm/tinydrm/ili9341.c Simona Vetter     2019-06-17  151  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
3fa0e8f6f9609b drivers/gpu/drm/tinydrm/ili9341.c David Lechner     2018-05-25  152  	.fops			= &ili9341_fops,
4a83c26a1d8702 drivers/gpu/drm/tiny/ili9341.c    Danilo Krummrich  2022-08-02  153  	DRM_GEM_DMA_DRIVER_OPS_VMAP,
df0cc9eaff170e drivers/gpu/drm/tiny/ili9341.c    Thomas Zimmermann 2024-09-24  154  	DRM_FBDEV_DMA_DRIVER_OPS,
3fa0e8f6f9609b drivers/gpu/drm/tinydrm/ili9341.c David Lechner     2018-05-25 @155  	.debugfs_init		= mipi_dbi_debugfs_init,
3fa0e8f6f9609b drivers/gpu/drm/tinydrm/ili9341.c David Lechner     2018-05-25  156  	.name			= "ili9341",
3fa0e8f6f9609b drivers/gpu/drm/tinydrm/ili9341.c David Lechner     2018-05-25  157  	.desc			= "Ilitek ILI9341",
3fa0e8f6f9609b drivers/gpu/drm/tinydrm/ili9341.c David Lechner     2018-05-25  158  	.major			= 1,
3fa0e8f6f9609b drivers/gpu/drm/tinydrm/ili9341.c David Lechner     2018-05-25  159  	.minor			= 0,
3fa0e8f6f9609b drivers/gpu/drm/tinydrm/ili9341.c David Lechner     2018-05-25  160  };
3fa0e8f6f9609b drivers/gpu/drm/tinydrm/ili9341.c David Lechner     2018-05-25  161  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
