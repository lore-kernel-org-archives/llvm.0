Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFEFEBB;
	Fri,  7 Apr 2023 18:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680893715; x=1712429715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CS86442KvTYXim/YGiE9/g0O3mOa3efsjpEYh1hcqlc=;
  b=ng2RbRs6WScU/asBHnH6rkW5ikYuyywrUGClLiXOn7YI9OJPt7BhgKb4
   0EmrSYYyUP31YZAXBd1V4ov7/DsZ/3UJyNMw58dNuMTJCOoAzU/mQU5EZ
   CIcN1Olqnzbo6lYbLTiIMt1cY2MMqU9MF5MQ7BLDffw9dKlE9ANnr1AcW
   pjN4NakjpqHvJ7w7TDTabyLg0Mw/QVRiO3dRp9wJgeJdXHUakGjzZEeei
   qguFQYZRl0pmQ0U9YyQLpS4qmKPWHODKCW/XnL4WCfbPiFvMqaglgDj9V
   SyTo3rDH2vf5E8A1LHjwM63OtojE34diP7Qa1c7rcmq6FhCX9QKGr2CdU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341798878"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="341798878"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690143082"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="690143082"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 11:55:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkrEj-000Sni-1k;
	Fri, 07 Apr 2023 18:55:01 +0000
Date: Sat, 8 Apr 2023 02:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] drm/i915: constify pointers to hwmon_channel_info
Message-ID: <202304080226.gWUGJ4GU-lkp@intel.com>
References: <20230407150031.79749-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150031.79749-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/drm-nouveau-constify-pointers-to-hwmon_channel_info/20230407-230201
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20230407150031.79749-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH 1/2] drm/i915: constify pointers to hwmon_channel_info
config: i386-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080226.gWUGJ4GU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fc5ea3eef62b29fa9968510db0401656ebce03cc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/drm-nouveau-constify-pointers-to-hwmon_channel_info/20230407-230201
        git checkout fc5ea3eef62b29fa9968510db0401656ebce03cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080226.gWUGJ4GU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_hwmon.c:617:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[5]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = hwm_info,
                   ^~~~~~~~
   drivers/gpu/drm/i915/i915_hwmon.c:655:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[2]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = hwm_gt_info,
                   ^~~~~~~~~~~
   2 errors generated.


vim +617 drivers/gpu/drm/i915/i915_hwmon.c

b3b088e28183b8 Dale B Stimson 2022-10-13  614  
b3b088e28183b8 Dale B Stimson 2022-10-13  615  static const struct hwmon_chip_info hwm_chip_info = {
b3b088e28183b8 Dale B Stimson 2022-10-13  616  	.ops = &hwm_ops,
b3b088e28183b8 Dale B Stimson 2022-10-13 @617  	.info = hwm_info,
b3b088e28183b8 Dale B Stimson 2022-10-13  618  };
b3b088e28183b8 Dale B Stimson 2022-10-13  619  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
