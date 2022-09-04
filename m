Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8403C00
	for <llvm@lists.linux.dev>; Sun,  4 Sep 2022 22:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662331679; x=1693867679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hW8pPJzz27HSn8SpfPF86IrZDe4bmTQhAvlBFjFhHFU=;
  b=GhHTpNR/SFQeYWscRif7M5JviEokVRH7BNenoI8iayyYxkn/uhEaAWqH
   pf1LAFtFmIejbF+dJnQ6S5Ogue20756jn4o8RXLF9A9cjr1KDy6lt3vr9
   rQd4ZthkSGdDttxQZCjkCsP6quLtjFg41Gls4TeJue7IIepeTglGavG+O
   R6DswXw04UQpQADIPGfHip5llsQ1K0xW+PoAkQRl6ocLvbu4Hrohx9HV2
   sLqzBcNCAmZwoXLgXLzZ+K0e1Ebwid3MYZI7YuEczweUMigoce4TYn2ON
   +yEwMdIsltrKP2T1uTHm3+zqTQRikOB7EjmUTMVqLJRrVJ94ckn4IxHEk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="297060143"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="297060143"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2022 15:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="590702615"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Sep 2022 15:47:49 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUyP6-0003Sj-16;
	Sun, 04 Sep 2022 22:47:48 +0000
Date: Mon, 5 Sep 2022 06:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: arch/arm/mach-versatile/versatile.c:56:14: warning: no previous
 prototype for function 'mmc_status'
Message-ID: <202209050650.jVqrePgW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e18e42e4b280c85b76967a9106a13ca61c16179
commit: d7445676e86900f8dc363825033ff62416c216e0 ARM: versatile: move integrator/realview/vexpress to versatile
date:   5 months ago
config: arm-versatile_defconfig (https://download.01.org/0day-ci/archive/20220905/202209050650.jVqrePgW-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d7445676e86900f8dc363825033ff62416c216e0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d7445676e86900f8dc363825033ff62416c216e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
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

a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  55  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08 @56  unsigned int mmc_status(struct device *dev)
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  57  {
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  58  	struct amba_device *adev = container_of(dev, struct amba_device, dev);
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  59  	u32 mask;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  60  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  61  	if (adev->res.start == VERSATILE_MMCI0_BASE)
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  62  		mask = 1;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  63  	else
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  64  		mask = 2;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  65  
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  66  	return readl(versatile_sys_base + VERSATILE_SYS_MCI_OFFSET) & mask;
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  67  }
a7096789211193 arch/arm/mach-versatile/versatile_dt.c Rob Herring 2015-12-08  68  

:::::: The code at line 56 was first introduced by commit
:::::: a70967892111934e292485ce84f1bab38cc55380 ARM: versatile: merge mach code into a single file

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
