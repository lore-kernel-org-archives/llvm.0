Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF50801
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 11:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650280525; x=1681816525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iwYeDUipsL3WkSiQx0BhM9s9MmnWhBi5t77mWD8jF44=;
  b=HnTw44fvfYVh6CHJZmtoHisFqcsEk72r+Ez+9QvnUyWRVvefgYyKGd2i
   yJu+2CAvxRGB+X6kF3qk+pi87WLh9oQ2BqiH37mAOpVAzyhFGEJESd4/9
   +iurnA9Kq9WnMu8GQmIberltRKXox3795l/8IsETrPtYqiX5hOe53mh3P
   TO1kk+tEQkSepStvnhD7YLV23cSZlbDmQQqPfiMWfsEjzVXAHnjj2UDav
   K6kKRExfmlzZtAufRk1NiKtqd6cFK4eDTMWJlH31YSat3NtAsBHXuRjB2
   R/xUpHyeQ/cJW3VRbexhCbOz/ZncLkDhaM75g2DIHD6i5eB0+GGe6Ke3Y
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="245389508"
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="245389508"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 04:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,269,1643702400"; 
   d="scan'208";a="509708570"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Apr 2022 04:15:23 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngPLn-0004Zf-2T;
	Mon, 18 Apr 2022 11:15:23 +0000
Date: Mon, 18 Apr 2022 19:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1112/4328]
 arch/arm/mach-versatile/versatile.c:56:14: warning: no previous prototype
 for function 'mmc_status'
Message-ID: <202204181931.klAC6fWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   40354149f4d738dc3492d9998e45b3f02950369a
commit: d7445676e86900f8dc363825033ff62416c216e0 [1112/4328] ARM: versatile: move integrator/realview/vexpress to versatile
config: arm-versatile_defconfig (https://download.01.org/0day-ci/archive/20220418/202204181931.klAC6fWo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b27430f9f46b88bcd54d992debc8d72e131e1bd0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d7445676e86900f8dc363825033ff62416c216e0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d7445676e86900f8dc363825033ff62416c216e0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-versatile/versatile.c:56:14: warning: no previous prototype for function 'mmc_status' [-Wmissing-prototypes]
   unsigned int mmc_status(struct device *dev)
                ^
   arch/arm/mach-versatile/versatile.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int mmc_status(struct device *dev)
   ^
   static 
   1 warning generated.


vim +/mmc_status +56 arch/arm/mach-versatile/versatile.c

a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  55  
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08 @56  unsigned int mmc_status(struct device *dev)
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  57  {
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  58  	struct amba_device *adev = container_of(dev, struct amba_device, dev);
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  59  	u32 mask;
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  60  
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  61  	if (adev->res.start == VERSATILE_MMCI0_BASE)
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  62  		mask = 1;
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  63  	else
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  64  		mask = 2;
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  65  
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  66  	return readl(versatile_sys_base + VERSATILE_SYS_MCI_OFFSET) & mask;
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  67  }
a70967892111934 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  68  

:::::: The code at line 56 was first introduced by commit
:::::: a70967892111934e292485ce84f1bab38cc55380 ARM: versatile: merge mach code into a single file

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
