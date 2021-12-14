Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B1A173
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639508608; x=1671044608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VKCAjMhyI8Dgt9CMayZySS+sPj4qOQp3+irsS2QldPk=;
  b=B7tMolQybW90thI23V1Vxn60NROJjfdKJ5hfIM6f/7zCX2OynIWBirq7
   3nfGH8uKMfw/vmInsw7u7yl8d6Ez/W6xLD0mKee0U1X2AFthZqdNsKy7u
   8b7IENkEnOFAoaSyRTNDXjA7z6mP6ifKQTcuP0g8w06I44SGDTzJ+i3dG
   D/wXyom8SOZ1k48zKcK1Io+lbtx8jyEa1i0HIaQXBts/0ZwIAi55gNnoB
   ln9AFc7WXklZyFUPhBEDxfOsLR+5rd3jBs8xWPXlMkr8zTcsq2uozeE5m
   HNxJ8a4Tpr9l9IokHKEbU7COnPgkvkBpJS01uEzI0cMXLP5xQJhNynUXD
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="263201545"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="263201545"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 10:36:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="505468051"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2021 10:36:16 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxCet-0000d6-Ka; Tue, 14 Dec 2021 18:36:15 +0000
Date: Wed, 15 Dec 2021 02:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-href-charging-v5.16-rc1-prim 35/35]
 drivers/power/supply/samsung-sdi-battery.c:55:5: warning: no previous
 prototype for function 'samsung_sdi_battery_get_info'
Message-ID: <202112150222.sFmcltTF-lkp@intel.com>
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
config: riscv-randconfig-r026-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150222.sFmcltTF-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/misc/ drivers/perf/ drivers/power/supply/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/power/supply/samsung-sdi-battery.c:55:5: warning: no previous prototype for function 'samsung_sdi_battery_get_info' [-Wmissing-prototypes]
   int samsung_sdi_battery_get_info(struct power_supply_battery_info **info,
       ^
   drivers/power/supply/samsung-sdi-battery.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int samsung_sdi_battery_get_info(struct power_supply_battery_info **info,
   ^
   static 
   drivers/power/supply/samsung-sdi-battery.c:71:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   1 warning and 1 error generated.


vim +/samsung_sdi_battery_get_info +55 drivers/power/supply/samsung-sdi-battery.c

    54	
  > 55	int samsung_sdi_battery_get_info(struct power_supply_battery_info **info,

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
