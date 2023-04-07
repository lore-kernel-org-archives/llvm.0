Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78578827;
	Fri,  7 Apr 2023 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680891786; x=1712427786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ozu99prPogYikRTx0qweufnuXrpSlZTOnvmH/k0JhkM=;
  b=WhxwgmIZ53rnPCiI4hDJJv0zwAid+jFyw6dz5DHCnrdQ9/pUi9lSnXte
   Bp+Dz603QU6wa3569UrRy0UIJS21B+7PZ60kI/tfMysU+TFnMuZJlN7hc
   Qf65gx05w8za43Hr7I9Li3c1lsRMQqhxLa9pf8bbSYlqgjEdSdzXoKuLt
   7B/L/1IJxUVgsz94ct50NkuSfhr+edYq/h3khbycdCxIyKkt9D8OOOznh
   nu3b6RZo3V////Fzl1/f2kLDdOb3heyomDjoK7PSpIOW+XqvVNh/Ep3/g
   vAmiug8sfs+lTSTSE43QA0CUzWVCnkFT30GrmwxTGoYKRb4a4GimLBdGf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="343050178"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="343050178"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 11:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="776915020"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="776915020"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2023 11:23:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkqji-000SmY-0M;
	Fri, 07 Apr 2023 18:22:58 +0000
Date: Sat, 8 Apr 2023 02:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nvme: host: hwmon: constify pointers to
 hwmon_channel_info
Message-ID: <202304080224.0YKfRdwi-lkp@intel.com>
References: <20230407145845.79557-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407145845.79557-1-krzysztof.kozlowski@linaro.org>

Hi Krzysztof,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on axboe-block/for-next linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/nvme-host-hwmon-constify-pointers-to-hwmon_channel_info/20230407-230001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230407145845.79557-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH] nvme: host: hwmon: constify pointers to hwmon_channel_info
config: i386-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080224.0YKfRdwi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a92019809fb469cc9c9f751cee4cfaad054ddb48
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Krzysztof-Kozlowski/nvme-host-hwmon-constify-pointers-to-hwmon_channel_info/20230407-230001
        git checkout a92019809fb469cc9c9f751cee4cfaad054ddb48
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080224.0YKfRdwi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/hwmon.c:221:10: error: initializing 'const struct hwmon_channel_info **' with an expression of type 'const struct hwmon_channel_info *const[3]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .info   = nvme_hwmon_info,
                     ^~~~~~~~~~~~~~~
   1 error generated.


vim +221 drivers/nvme/host/hwmon.c

400b6a7b13a3fd Guenter Roeck 2019-11-06  218  
400b6a7b13a3fd Guenter Roeck 2019-11-06  219  static const struct hwmon_chip_info nvme_hwmon_chip_info = {
400b6a7b13a3fd Guenter Roeck 2019-11-06  220  	.ops	= &nvme_hwmon_ops,
400b6a7b13a3fd Guenter Roeck 2019-11-06 @221  	.info	= nvme_hwmon_info,
400b6a7b13a3fd Guenter Roeck 2019-11-06  222  };
400b6a7b13a3fd Guenter Roeck 2019-11-06  223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
