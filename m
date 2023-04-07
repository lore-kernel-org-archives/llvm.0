Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1486D847C;
	Fri,  7 Apr 2023 17:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680889199; x=1712425199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sVmvD+c+qiDCUBkB7ICKdefv+FiLhFKVnBX7iQ02glg=;
  b=RGyEPw3pNtq+03A72Cn0tW8X1eizhnnx7hLQFUQ64CjUqwI3gb/QgrL/
   EaaiJyaabSV62injVCMc7HLAyIQxg84nep3DkJOj40PJjKh+DP9KtD95K
   xVU86Iy0fUsuuaQ7Yd147VHKmwhK6gRyuAH6QDV0A8IkFNBEzPcjnyH1t
   k1jZd0whu6CBBA9SxYn2yeq/Eyk/vD0D6d4RYQvZNbq7D63FeEFap7w4d
   qgCU2olld77TwZJquYxyEZQmPZREe/z6rKAqbBzHQjZcSLTn1pt/r6PSe
   yBHOKgTNzLlvHH2tJvHA2XJTz/sKbEDmCPXF7Q1+jICk33XCYvPAVRFr1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405857432"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="405857432"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717909755"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="717909755"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 10:39:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkq44-000Sk6-29;
	Fri, 07 Apr 2023 17:39:56 +0000
Date: Sat, 8 Apr 2023 01:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] fpga: dfl-fme: constify pointers to hwmon_channel_info
Message-ID: <202304080159.eAU0ksuS-lkp@intel.com>
References: <20230407150112.79854-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150112.79854-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/fpga-dfl-fme-constify-pointers-to-hwmon_channel_info/20230407-230805
patch link:    https://lore.kernel.org/r/20230407150112.79854-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] fpga: dfl-fme: constify pointers to hwmon_channel_info
config: i386-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080159.eAU0ksuS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5b9bcef28b40b20ec5539bacbe0a8ae6e063bfa8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/fpga-dfl-fme-constify-pointers-to-hwmon_channel_info/20230407-230805
        git checkout 5b9bcef28b40b20ec5539bacbe0a8ae6e063bfa8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/fpga/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080159.eAU0ksuS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/fpga/dfl-fme-main.c:277:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[2]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = thermal_hwmon_info,
                   ^~~~~~~~~~~~~~~~~~
   drivers/fpga/dfl-fme-main.c:477:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[2]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = power_hwmon_info,
                   ^~~~~~~~~~~~~~~~
   2 errors generated.


vim +277 drivers/fpga/dfl-fme-main.c

4284c65a9fda9d Wu Hao 2019-10-14  274  
4284c65a9fda9d Wu Hao 2019-10-14  275  static const struct hwmon_chip_info thermal_hwmon_chip_info = {
4284c65a9fda9d Wu Hao 2019-10-14  276  	.ops = &thermal_hwmon_ops,
4284c65a9fda9d Wu Hao 2019-10-14 @277  	.info = thermal_hwmon_info,
4284c65a9fda9d Wu Hao 2019-10-14  278  };
4284c65a9fda9d Wu Hao 2019-10-14  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
