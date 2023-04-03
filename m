Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348716FDF;
	Mon,  3 Apr 2023 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680543354; x=1712079354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7gUqY4F1y9I7JZn8Aobgq7REstjibic8ZHRTa+N9pY4=;
  b=h8w6z7KMeD7650p1q/2Xa8Iy3qPLdnoDC/v/VsGqtW8EyfCLdoFyJKz0
   7hCOOzpGVDb1q3BwbXEHSocX3RK0QB3zrt5oRg4QqV02vzllQxM1o+U+k
   NwhfWXV2v9UwNfUPxOhBOrwOiMLskbggOuNSIuMcxz6Ud2AsFkuiwt++x
   CfDDwYwyaZ1LuEUlBoYePNg+4stZtQLZGuVhwQUTI+9Jnx+WSdXG2iV9Q
   q7/tz3BJ9O4h04bZSjBpQanJkwQBqbDM3UCLydOrYJ8JSywfC6t66ExAt
   1IO+npJZ2L+fvDAcmmNIzWnGUqKtpLWN1azP6uXbr6mayJ6rgRpbf+RAu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322366697"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="322366697"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 10:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663283029"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="663283029"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Apr 2023 10:34:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjO4a-000OaJ-2t;
	Mon, 03 Apr 2023 17:34:28 +0000
Date: Tue, 4 Apr 2023 01:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Add support for PM DEMAND
Message-ID: <202304040133.G6vbHTdV-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Kahola/drm-i915-mtl-Add-support-for-PM-DEMAND/20230403-165720
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230403085043.2219092-1-mika.kahola%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915/mtl: Add support for PM DEMAND
config: x86_64-randconfig-r031-20230403 (https://download.01.org/0day-ci/archive/20230404/202304040133.G6vbHTdV-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304040133.G6vbHTdV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_pm.c:47:6: error: no previous prototype for function 'intel_is_c10phy' [-Werror,-Wmissing-prototypes]
   bool intel_is_c10phy(struct drm_i915_private *dev_priv, enum phy phy)
        ^
   drivers/gpu/drm/i915/intel_pm.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool intel_is_c10phy(struct drm_i915_private *dev_priv, enum phy phy)
   ^
   static 
   1 error generated.


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
