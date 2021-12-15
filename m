Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0B12C9E
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639573203; x=1671109203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nt2h9p6k4ncr1PGqQ1Ad3ihh8RU6txIOTolOX5sgeWo=;
  b=W8oxhLeM0pkjuMZRb8SGNeiN5mqpaOxeh+ed4P3U1T7ZTRzfYOUa7psR
   O4Kbp8FzhT12scw2yRcjZFioWZgHY8BAHb7RwjKmlPgGHkORoLzrzdzV/
   o71Gc/ahW8YhN6rICzLCEecDFlWw8jToDgZ1jIGSnRWZYU+HkJ2C7MbqN
   05mBT8Kzw6Pl/q0WQfsxl/O1i7G3GJpYlIBoBuROcqXggy1kZrlt4h95C
   SJ/UMuQHWwBtrhCqFvUYp1P/loxSwmv/LmRp3Dlq61cPakzuVKtvCRM6q
   2C399tBCYiumdwjYLlTM0UDX/nggiTQqiRCsS5KTIF+W7q6fQbuy3a+ka
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226077593"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="226077593"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 05:00:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="682480524"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2021 05:00:02 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxTt3-0001ng-Al; Wed, 15 Dec 2021 13:00:01 +0000
Date: Wed, 15 Dec 2021 20:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-href-charging-v5.16-rc1-prim 35/35]
 drivers/power/supply/samsung-sdi-battery.c:71:1: error: non-void function
 does not return a value in all control paths
Message-ID: <202112152004.1gns6xiD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-href-charging-v5.16-rc1-prim
head:   86b93a3192d2eb04134708293a8274948d210db4
commit: 86b93a3192d2eb04134708293a8274948d210db4 [35/35] samsung hack
config: riscv-randconfig-r026-20211214 (https://download.01.org/0day-ci/archive/20211215/202112152004.1gns6xiD-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git/commit/?id=86b93a3192d2eb04134708293a8274948d210db4
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-href-charging-v5.16-rc1-prim
        git checkout 86b93a3192d2eb04134708293a8274948d210db4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/power/supply/samsung-sdi-battery.c:55:5: warning: no previous prototype for function 'samsung_sdi_battery_get_info' [-Wmissing-prototypes]
   int samsung_sdi_battery_get_info(struct power_supply_battery_info **info,
       ^
   drivers/power/supply/samsung-sdi-battery.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int samsung_sdi_battery_get_info(struct power_supply_battery_info **info,
   ^
   static 
>> drivers/power/supply/samsung-sdi-battery.c:71:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   1 warning and 1 error generated.


vim +71 drivers/power/supply/samsung-sdi-battery.c

    54	
    55	int samsung_sdi_battery_get_info(struct power_supply_battery_info **info,
    56					 struct device_node *np)
    57	{
    58		struct samsung_sdi_battery *batt;
    59		int i;
    60	
    61		for (i = 0; i < ARRAY_SIZE(samsung_sdi_batteries); i++) {
    62			batt = &samsung_sdi_batteries[i];
    63			if (of_device_is_compatible(np, batt->compatible))
    64				break;
    65		}
    66	
    67		if (i == ARRAY_SIZE(samsung_sdi_batteries))
    68			return -ENODEV;
    69	
    70		*info = &batt->info;
  > 71	}

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
