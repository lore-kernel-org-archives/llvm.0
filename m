Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7187D
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 10:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644834002; x=1676370002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Cc6H9HteE9HTyiMAe1QuR2ITI24i6AhrcO6bhSu1lI=;
  b=BE2gVnTnJ1lN73eJKyyolQX64hOOAllTm0RE5l32OH7hovExhj7An84Q
   31sLZVBZ7C3zMcKigJMtTVNNl8by266hJYo27ZcgCeP+ft7nI50chVyWk
   gWaee8BUiW9fh6p1sBypi25e+iy0Z9aR/7TRA9qeElHJSnZ5Ty2IjHxx1
   Ta8KdpkeOTDPJTrsL70LrsKF0gW8F67+I9AnIjCABy2sewbRFAP22JL2b
   Xw78Nbes3TC+H0hgysEElwElyKm5soKhKGZKFcQq5Rllh0Sf2g5B5u0t+
   1X3/LBsqI7B03hghdymJFr9faz2rmBCGkuBcpDXeYsNw0nfVOgatkh2fi
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="336487018"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="336487018"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 02:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="587139359"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Feb 2022 02:19:52 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJYSV-0008OM-GF; Mon, 14 Feb 2022 10:19:51 +0000
Date: Mon, 14 Feb 2022 18:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [linux-next:master 129/5679] arch/arm/mach-iop32x/cp6.c:10:6:
 warning: no previous prototype for function 'iop_enable_cp6'
Message-ID: <202202141809.zCYU3Uhb-lkp@intel.com>
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
head:   259cbfc98c55ba3b6ef6e61fb7cfc3751dfded1e
commit: 6f5d248d05db9c4991366154f1a657a630faa583 [129/5679] ARM: iop32x: use GENERIC_IRQ_MULTI_HANDLER
config: arm-buildonly-randconfig-r004-20220214 (https://download.01.org/0day-ci/archive/20220214/202202141809.zCYU3Uhb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6f5d248d05db9c4991366154f1a657a630faa583
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6f5d248d05db9c4991366154f1a657a630faa583
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-iop32x/cp6.c:10:6: warning: no previous prototype for function 'iop_enable_cp6' [-Wmissing-prototypes]
   void iop_enable_cp6(void)
        ^
   arch/arm/mach-iop32x/cp6.c:10:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void iop_enable_cp6(void)
   ^
   static 
   arch/arm/mach-iop32x/cp6.c:43:13: warning: no previous prototype for function 'iop_init_cp6_handler' [-Wmissing-prototypes]
   void __init iop_init_cp6_handler(void)
               ^
   arch/arm/mach-iop32x/cp6.c:43:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init iop_init_cp6_handler(void)
   ^
   static 
   2 warnings generated.


vim +/iop_enable_cp6 +10 arch/arm/mach-iop32x/cp6.c

     9	
  > 10	void iop_enable_cp6(void)
    11	{
    12		u32 temp;
    13	
    14	        /* enable cp6 access */
    15	        asm volatile (
    16			"mrc	p15, 0, %0, c15, c1, 0\n\t"
    17			"orr	%0, %0, #(1 << 6)\n\t"
    18			"mcr	p15, 0, %0, c15, c1, 0\n\t"
    19			"mrc	p15, 0, %0, c15, c1, 0\n\t"
    20			"mov	%0, %0\n\t"
    21			"sub	pc, pc, #4  @ cp_wait\n\t"
    22			: "=r"(temp));
    23	}
    24	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
