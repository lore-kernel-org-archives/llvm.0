Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411716FBD;
	Fri,  7 Apr 2023 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680888013; x=1712424013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b8mE+fjnLHtCuLy/SuwicKt2OVWJWIcGzOLWovdVBK0=;
  b=hv/ZreuM79XaiKuzE/bZWM2NHgYKsn6nv1iQUl0I8S6keGOu5XYfkSO8
   C3fKQtgq6TTAT30RkaEYVxanXfrYtIVdXbb90rwRmjB4ntqs50FwLeTVq
   ydzJ3xE9pMKaN5srBaPGeemYgAkA3IVBIHngqHlQO2BCCfTx3wzTMmz72
   kdeKNee6POV9Qe0zncQgzO7dXpvWJdECfaZsSmVR+zUdMZN4qikXAI+kF
   6TXOfWqFy3xa28aAY4+NalrTM/5q51epz9zmMmKd1UBWnZekYIYuxPKcl
   LwxdqtUk0+GMGMc7wLmnIHmLyaKnJ4xLF8p+kVA+sQ4zViJdUeiVaGkzk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="323403615"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="323403615"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 10:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="717903847"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="717903847"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2023 10:19:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpki-000SjE-0t;
	Fri, 07 Apr 2023 17:19:56 +0000
Date: Sat, 8 Apr 2023 01:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
Message-ID: <202304080108.n5D0MIBE-lkp@intel.com>
References: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/vdpa-solidrun-constify-pointers-to-hwmon_channel_info/20230407-231533
patch link:    https://lore.kernel.org/r/20230407150130.79917-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
config: x86_64-randconfig-a002-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080108.n5D0MIBE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/61aa9da0979a00640c9713e7235eeec3d7928610
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/vdpa-solidrun-constify-pointers-to-hwmon_channel_info/20230407-231533
        git checkout 61aa9da0979a00640c9713e7235eeec3d7928610
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/vdpa/solidrun/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080108.n5D0MIBE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vdpa/solidrun/snet_hwmon.c:173:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[5]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info = snet_hwmon_info,
                   ^~~~~~~~~~~~~~~
   1 error generated.


vim +173 drivers/vdpa/solidrun/snet_hwmon.c

51a8f9d7f58729 Alvaro Karsz 2023-01-10  170  
51a8f9d7f58729 Alvaro Karsz 2023-01-10  171  static const struct hwmon_chip_info snet_hwmono_info = {
51a8f9d7f58729 Alvaro Karsz 2023-01-10  172  	.ops = &snet_hwmon_ops,
51a8f9d7f58729 Alvaro Karsz 2023-01-10 @173  	.info = snet_hwmon_info,
51a8f9d7f58729 Alvaro Karsz 2023-01-10  174  };
51a8f9d7f58729 Alvaro Karsz 2023-01-10  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
