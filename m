Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A942C9C
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642504473; x=1674040473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l3Pv/EgkwWzdmGEFFj57mnEtSwZiwM1n2TdYMJE10Yw=;
  b=LakJF4byv7GUz+BNb+CCcVkfA/Exd5CUFWuK3c/4L0ZMF2NpdojWFxzz
   4S7tYvJf5fw6v/OwHLAZ3ieF9rdEH0QgMtS/tvqi6VMxYyQjDCtm4ETYy
   BO6Zuif3dSPlnIGZSXbLFczXBpTCK4+zKWuATrJcVDUjL2ej0Lfjt5T5b
   czmrVkD6iaBySxdom+FKV1iPs4LYNEHwHhUQOS0ZbzWLaldHHsZ1SIzib
   tUCZwOYQbg/cXAiJkCi19vBZj/SqO1giclCXrtMtahnwVUshbC0E6M8Lk
   os8bK3wNvvHDfCbGiJogaEemclUKQkkrEuxx62pqZkffbGgdXUnK44ajU
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="242352799"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="242352799"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 03:14:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="492634216"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2022 03:14:30 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9mRZ-000CV1-Tc; Tue, 18 Jan 2022 11:14:29 +0000
Date: Tue, 18 Jan 2022 19:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Heymans <arthur.heymans@9elements.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: drivers/hwmon/pmbus/ir38064.c:54:34: warning: unused variable
 'ir38064_of_match'
Message-ID: <202201181742.A2Dm08zD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e3a8b6a1e70c37702054ae3c7c07ed828435d8ee
commit: e65de225ef2f7eade2888b00970eec37aeca0044 hwmon/pmbus: (ir38064) Add of_match_table
date:   3 weeks ago
config: hexagon-randconfig-r041-20220116 (https://download.01.org/0day-ci/archive/20220118/202201181742.A2Dm08zD-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c10cbb243cafc0cf42c3e922cb29183279444432)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e65de225ef2f7eade2888b00970eec37aeca0044
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e65de225ef2f7eade2888b00970eec37aeca0044
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hwmon/pmbus/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/ir38064.c:54:34: warning: unused variable 'ir38064_of_match' [-Wunused-const-variable]
   static const struct of_device_id ir38064_of_match[] = {
                                    ^
   1 warning generated.


vim +/ir38064_of_match +54 drivers/hwmon/pmbus/ir38064.c

    53	
  > 54	static const struct of_device_id ir38064_of_match[] = {
    55		{ .compatible = "infineon,ir38060" },
    56		{ .compatible = "infineon,ir38064" },
    57		{ .compatible = "infineon,ir38164" },
    58		{ .compatible = "infineon,ir38263" },
    59		{}
    60	};
    61	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
