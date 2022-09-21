Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2A7C
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 20:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663791771; x=1695327771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77D+qEvHyb6GAcJWDMQL++e6FHJBKQfcF78uWtdFWlM=;
  b=QAqUxAAToZQ9wb23kkb1TKmPyFi+0aj9Dgss74PtQQEYjifXraFt4zIG
   ThePAAP0WiNr3tS3rlwYUVaQoel4EAuxKwEJjJ+GvoMdZ/9W7BXzyq66w
   iAuqjR6C3NWSqPRbhoqoNfx4ySzTbnta6Nc8M9d9yP7KR1P4/8s5uAGvj
   RgpwQw0x99PuWe6lRKoAb0b4HiMJmbY51PC4WjjuBbtHQACp2IX77xy0J
   TvF2F2jhmCl2v09qzjw8ewK1ivMGt1uk1rN7nkT1ooS++2Wie/xVsuYhF
   Wkx8uF6Qo1ktukobD1g/zfaqNUMJJqi+P8enIpmyrE3JFXYCLjFFTZV5R
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="297717032"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="297717032"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 13:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; 
   d="scan'208";a="619505576"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Sep 2022 13:22:40 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ob6Ex-0003vR-2p;
	Wed, 21 Sep 2022 20:22:39 +0000
Date: Thu, 22 Sep 2022 04:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Eliav Farber <farbere@amazon.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [groeck-staging:hwmon-next 36/55] ERROR: modpost: "__divdi3"
 [drivers/hwmon/mr75203.ko] undefined!
Message-ID: <202209220427.ovoZDKKT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eliav,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   103974b1117651a5884e2bc7832d7b02990e0232
commit: 3b12ca798e022192fb451e9e5ef1bb147f21c413 [36/55] hwmon: (mr75203) add support for series 6 temperature equation
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220922/202209220427.ovoZDKKT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=3b12ca798e022192fb451e9e5ef1bb147f21c413
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 3b12ca798e022192fb451e9e5ef1bb147f21c413
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the groeck-staging/hwmon-next HEAD 103974b1117651a5884e2bc7832d7b02990e0232 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [drivers/hwmon/mr75203.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/hwmon/mr75203.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
