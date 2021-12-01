Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A92C80
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 22:24:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="322818981"
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; 
   d="scan'208";a="322818981"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 14:24:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; 
   d="scan'208";a="460206108"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 01 Dec 2021 14:24:52 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msY1z-000FT4-W4; Wed, 01 Dec 2021 22:24:51 +0000
Date: Thu, 2 Dec 2021 06:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3692/4626] ERROR: modpost: "packing"
 [drivers/net/ethernet/microchip/lan966x/lan966x-switch.ko] undefined!
Message-ID: <202112020627.5BnQUeU6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   048aeae86c3967f4c40666cd26f2c1eb73a4b805
commit: d28d6d2e37d10d607f931d25c835a0bd94d370e3 [3692/4626] net: lan966x: add port module support
config: i386-randconfig-a015-20211130 (https://download.01.org/0day-ci/archive/20211202/202112020627.5BnQUeU6-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d28d6d2e37d10d607f931d25c835a0bd94d370e3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d28d6d2e37d10d607f931d25c835a0bd94d370e3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "spi_setup" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
ERROR: modpost: "__devm_regmap_init_spi" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
ERROR: modpost: "__spi_register_driver" [sound/soc/codecs/snd-soc-cs35l41-spi.ko] undefined!
>> ERROR: modpost: "packing" [drivers/net/ethernet/microchip/lan966x/lan966x-switch.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_CS35L41_SPI
   Depends on SOUND && !UML && SND && SND_SOC && SPI_MASTER
   Selected by
   - SND_SOC_AMD_VANGOGH_MACH && SOUND && !UML && SND && SND_SOC && SND_SOC_AMD_ACP5x && I2C

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
