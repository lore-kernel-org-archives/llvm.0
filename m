Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38F6EBB;
	Fri,  7 Apr 2023 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680892380; x=1712428380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EKsUJCCK+H/Ed10MLDkPQH/dhfD6Rm/Ff5ulgTEFnZY=;
  b=HHMKmHF2J0XZU3GWF5qd3E3Rz1jLqO0zdhE9NpeU57p5eS728LxXsqco
   IuWkL5rhirH8LOhzyQU9pKutOCmyCDDc9znY96wX1zftbA5qGInn41nL0
   SnGpPpj4p4PbK42cMtq1tIgrBE8lWXtC+LPNsAaFWWpCpa1fXHcpZ5b7I
   qS40+jEStYoZplqjabcq5s0mtZ3jLV7kHcGKp8tmXCuoDNnPcjJ7ub0mu
   E6TTtjfZ9vxgyzy1A8q6k/J1+LMOB9NsLp3LIqk1Xocsr3fB3p8zyB2qQ
   OHQ7ZZHhe9rcn7lxwMuABeUffl5YtndA/7h+EboXCY1i/T9kZ18I0XypP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405866275"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="405866275"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690139197"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="690139197"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2023 11:32:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqtO-000Sn4-0u;
	Fri, 07 Apr 2023 18:32:58 +0000
Date: Sat, 8 Apr 2023 02:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] power: supply: hwmon: constify pointers to
 hwmon_channel_info
Message-ID: <202304080217.3MDH0o8U-lkp@intel.com>
References: <20230407150326.80183-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150326.80183-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on sre-power-supply/for-next]
[also build test ERROR on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/power-supply-hwmon-constify-pointers-to-hwmon_channel_info/20230407-231258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20230407150326.80183-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] power: supply: hwmon: constify pointers to hwmon_channel_info
config: x86_64-randconfig-a003-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080217.3MDH0o8U-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/54a815cb7128a140e1a6e18ef6bbafa22b98aadf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/power-supply-hwmon-constify-pointers-to-hwmon_channel_info/20230407-231258
        git checkout 54a815cb7128a140e1a6e18ef6bbafa22b98aadf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080217.3MDH0o8U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/power/supply/power_supply_hwmon.c:324:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[4]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = power_supply_hwmon_info,
                   ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +324 drivers/power/supply/power_supply_hwmon.c

e67d4dfc9ff19d Andrey Smirnov 2019-06-12  321  
e67d4dfc9ff19d Andrey Smirnov 2019-06-12  322  static const struct hwmon_chip_info power_supply_hwmon_chip_info = {
e67d4dfc9ff19d Andrey Smirnov 2019-06-12  323  	.ops = &power_supply_hwmon_ops,
e67d4dfc9ff19d Andrey Smirnov 2019-06-12 @324  	.info = power_supply_hwmon_info,
e67d4dfc9ff19d Andrey Smirnov 2019-06-12  325  };
e67d4dfc9ff19d Andrey Smirnov 2019-06-12  326  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
