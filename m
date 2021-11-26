Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F70968
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 23:53:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="235664752"
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; 
   d="scan'208";a="235664752"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 15:53:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; 
   d="scan'208";a="510837777"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 26 Nov 2021 15:53:21 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mql1s-0008n4-Me; Fri, 26 Nov 2021 23:53:20 +0000
Date: Sat, 27 Nov 2021 07:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org,
	linux-kernel@vger.kernel.org
Subject: [gerg-m68knommu:armnommu 4/4]
 arch/arm/mach-versatile/versatile_dt.c:60:14: warning: no previous prototype
 for function 'mmc_status'
Message-ID: <202111270741.t0BFBqcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   2f172ee2c4ba76853a7f5a95d657111dae7e5207
commit: 2f172ee2c4ba76853a7f5a95d657111dae7e5207 [4/4] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r022-20211126 (https://download.01.org/0day-ci/archive/20211127/202111270741.t0BFBqcL-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b558d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git/commit/?id=2f172ee2c4ba76853a7f5a95d657111dae7e5207
        git remote add gerg-m68knommu https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
        git fetch --no-tags gerg-m68knommu armnommu
        git checkout 2f172ee2c4ba76853a7f5a95d657111dae7e5207
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-versatile/versatile_dt.c:60:14: warning: no previous prototype for function 'mmc_status' [-Wmissing-prototypes]
   unsigned int mmc_status(struct device *dev)
                ^
   arch/arm/mach-versatile/versatile_dt.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int mmc_status(struct device *dev)
   ^
   static 
   1 warning generated.


vim +/mmc_status +60 arch/arm/mach-versatile/versatile_dt.c

a7096789211193 Rob Herring 2015-12-08  59  
a7096789211193 Rob Herring 2015-12-08 @60  unsigned int mmc_status(struct device *dev)
a7096789211193 Rob Herring 2015-12-08  61  {
a7096789211193 Rob Herring 2015-12-08  62  	struct amba_device *adev = container_of(dev, struct amba_device, dev);
a7096789211193 Rob Herring 2015-12-08  63  	u32 mask;
a7096789211193 Rob Herring 2015-12-08  64  
a7096789211193 Rob Herring 2015-12-08  65  	if (adev->res.start == VERSATILE_MMCI0_BASE)
a7096789211193 Rob Herring 2015-12-08  66  		mask = 1;
a7096789211193 Rob Herring 2015-12-08  67  	else
a7096789211193 Rob Herring 2015-12-08  68  		mask = 2;
a7096789211193 Rob Herring 2015-12-08  69  
a7096789211193 Rob Herring 2015-12-08  70  	return readl(versatile_sys_base + VERSATILE_SYS_MCI_OFFSET) & mask;
a7096789211193 Rob Herring 2015-12-08  71  }
a7096789211193 Rob Herring 2015-12-08  72  

:::::: The code at line 60 was first introduced by commit
:::::: a70967892111934e292485ce84f1bab38cc55380 ARM: versatile: merge mach code into a single file

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
