Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2BC2C82
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 06:03:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="235436805"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="235436805"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 22:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="741453764"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2021 22:03:14 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqUKI-0007b1-7L; Fri, 26 Nov 2021 06:03:14 +0000
Date: Fri, 26 Nov 2021 14:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [linux-next:master 802/3632]
 drivers/gpu/drm/tidss/tidss_drv.c:91:32: warning: unused variable
 'tidss_pm_ops'
Message-ID: <202111261307.7r9SQ6bB-lkp@intel.com>
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
head:   f81e94e91878bded599cc60f2881cfd50991aeb9
commit: 6e120594631fdcfd83e5e0a1351730dae46d9d24 [802/3632] drm/tidss: Make use of the helper macro SET_RUNTIME_PM_OPS()
config: riscv-randconfig-r011-20211115 (https://download.01.org/0day-ci/archive/20211126/202111261307.7r9SQ6bB-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project fbe72e41b99dc7994daac300d208a955be3e4a0a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6e120594631fdcfd83e5e0a1351730dae46d9d24
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6e120594631fdcfd83e5e0a1351730dae46d9d24
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tidss/tidss_drv.c:91:32: warning: unused variable 'tidss_pm_ops' [-Wunused-const-variable]
   static const struct dev_pm_ops tidss_pm_ops = {
                                  ^
   1 warning generated.


vim +/tidss_pm_ops +91 drivers/gpu/drm/tidss/tidss_drv.c

32a1795f57eecc3 Jyri Sarha  2019-11-08  90  
32a1795f57eecc3 Jyri Sarha  2019-11-08 @91  static const struct dev_pm_ops tidss_pm_ops = {
32a1795f57eecc3 Jyri Sarha  2019-11-08  92  	SET_SYSTEM_SLEEP_PM_OPS(tidss_suspend, tidss_resume)
6e120594631fdcf Cai Huoqing 2021-09-07  93  	SET_RUNTIME_PM_OPS(tidss_pm_runtime_suspend, tidss_pm_runtime_resume, NULL)
32a1795f57eecc3 Jyri Sarha  2019-11-08  94  };
32a1795f57eecc3 Jyri Sarha  2019-11-08  95  

:::::: The code at line 91 was first introduced by commit
:::::: 32a1795f57eecc3974901760400618571c9d357f drm/tidss: New driver for TI Keystone platform Display SubSystem

:::::: TO: Jyri Sarha <jsarha@ti.com>
:::::: CC: Jyri Sarha <jsarha@ti.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
