Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E626FDF;
	Mon,  3 Apr 2023 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680543352; x=1712079352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5AqB9Ds285pco3asUCz7roRPYVQkcVnH8bQIXqDupOk=;
  b=cA9KDsDf91u8W3SCS6R03bIlyhXupgSLp3wnwxu3PIWEwUeRvHonTQEc
   2/k1tvKj2XakKYQI++72IdpXHyO442O60/n/PZLZciVKKLntXTM/UI2Gp
   vyrQC7+bkUfKMn1Jmz9KvSox8K3dSPTmJ3hqEWlzvA9i7XeGVt3mi6Ykf
   mFGvI8UklV495qIBSJG6O2a+Gcs5oUbU4xmSRGvM1RpKl3Lu7uzRbQJoK
   kgKGqKK2NY0VFONk3KAKN2cUO0/OnSDE8eL4Ta+PxrqdSw94cYtZKpu49
   Zd8pBlR3njSe5ZjVJLsBo8X0BShvO22DPBNESLhy7snODeuUYLG1EPflg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322366706"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="322366706"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 10:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663283033"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="663283033"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Apr 2023 10:34:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjO4a-000OaH-2o;
	Mon, 03 Apr 2023 17:34:28 +0000
Date: Tue, 4 Apr 2023 01:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Add support for PM DEMAND
Message-ID: <202304040120.VkYG8WG8-lkp@intel.com>
References: <20230403085043.2219092-1-mika.kahola@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403085043.2219092-1-mika.kahola@intel.com>

Hi Mika,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Kahola/drm-i915-mtl-Add-support-for-PM-DEMAND/20230403-165720
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230403085043.2219092-1-mika.kahola%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915/mtl: Add support for PM DEMAND
config: i386-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040120.VkYG8WG8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4be7899ed410c745e6af3dbc42d17ee129ba5fd5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mika-Kahola/drm-i915-mtl-Add-support-for-PM-DEMAND/20230403-165720
        git checkout 4be7899ed410c745e6af3dbc42d17ee129ba5fd5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040120.VkYG8WG8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_pm.c:47:6: warning: no previous prototype for function 'intel_is_c10phy' [-Wmissing-prototypes]
   bool intel_is_c10phy(struct drm_i915_private *dev_priv, enum phy phy)
        ^
   drivers/gpu/drm/i915/intel_pm.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool intel_is_c10phy(struct drm_i915_private *dev_priv, enum phy phy)
   ^
   static 
   1 warning generated.


vim +/intel_is_c10phy +47 drivers/gpu/drm/i915/intel_pm.c

    46	
  > 47	bool intel_is_c10phy(struct drm_i915_private *dev_priv, enum phy phy)
    48	{
    49	        if (IS_METEORLAKE(dev_priv) && (phy < PHY_C))
    50	                return true;
    51	
    52	        return false;
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
