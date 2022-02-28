Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD97C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 23:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646091275; x=1677627275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLCBLjBJ0diTVlQP75gxJ3UTjHif6nxLgY9/z1qdEiI=;
  b=avehZqzswrA7vtTFaVHAUEAM2h8rnEwlcUSjk/qc8ONVeg/g93gQwkzM
   S/viRwedNBkIbnZal+/EceV2gzYxRZhyAJ4r6nZWySCHJkC8BY1UTF7iW
   BADiSzqBTbRhSOTo08b6uQeWQONUy1H/nRKuBLfO/0ceir8Sz9oRlhD1S
   LNiG/BmXFOK5XHmty1uzd3jK/GB5nNQ1vwm96nirdjJ13cRT3Eq9a2rOg
   iUcTyyNJFj/AYE47CCnPP+JLk/wMCe1iR2Ul5dbHKUihuSd2QWGgGt14U
   BRho1vEokuND1LRRr4GclifkQBNrlXjcIPe92Xz72JsxyivXToSnDpQ7b
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316227868"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="316227868"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 15:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="708842731"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Feb 2022 15:34:32 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOpXD-0007tj-WE; Mon, 28 Feb 2022 23:34:32 +0000
Date: Tue, 1 Mar 2022 07:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [soc:arm/soc 6/8] arch/arm/mach-pxa/include/mach/uncompress.h:62:6:
 error: expected expression
Message-ID: <202203010702.6TRDNN1H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/soc
head:   e6e6479c27aa22d11ff7109125dd5ec9ef276de8
commit: 28f74201e37ccf3063e359bfe346b09400af9bab [6/8] ARM: pxa: remove Intel Imote2 and Stargate 2 boards
config: arm-colibri_pxa300_defconfig (https://download.01.org/0day-ci/archive/20220301/202203010702.6TRDNN1H-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=28f74201e37ccf3063e359bfe346b09400af9bab
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc arm/soc
        git checkout 28f74201e37ccf3063e359bfe346b09400af9bab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm/boot/compressed/misc.c:29:
>> arch/arm/mach-pxa/include/mach/uncompress.h:62:6: error: expected expression
               || machine_is_cm_x300() || machine_is_balloon3())
               ^
   arch/arm/boot/compressed/misc.c:126:17: warning: no previous prototype for function '__div0' [-Wmissing-prototypes]
   asmlinkage void __div0(void)
                   ^
   arch/arm/boot/compressed/misc.c:126:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void __div0(void)
              ^
              static 
   arch/arm/boot/compressed/misc.c:133:6: warning: no previous prototype for function '__stack_chk_fail' [-Wmissing-prototypes]
   void __stack_chk_fail(void)
        ^
   arch/arm/boot/compressed/misc.c:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __stack_chk_fail(void)
   ^
   static 
   arch/arm/boot/compressed/misc.c:142:1: warning: no previous prototype for function 'decompress_kernel' [-Wmissing-prototypes]
   decompress_kernel(unsigned long output_start, unsigned long free_mem_ptr_p,
   ^
   arch/arm/boot/compressed/misc.c:141:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   arch/arm/boot/compressed/misc.c:164:6: warning: no previous prototype for function 'fortify_panic' [-Wmissing-prototypes]
   void fortify_panic(const char *name)
        ^
   arch/arm/boot/compressed/misc.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void fortify_panic(const char *name)
   ^
   static 
   4 warnings and 1 error generated.


vim +62 arch/arm/mach-pxa/include/mach/uncompress.h

^1da177e4c3f41 include/asm-arm/arch-pxa/uncompress.h       Linus Torvalds    2005-04-16  53  
6d3dfe4a314147 include/asm-arm/arch-pxa/uncompress.h       Eric Miao         2008-06-02  54  static inline void arch_decomp_setup(void)
6d3dfe4a314147 include/asm-arm/arch-pxa/uncompress.h       Eric Miao         2008-06-02  55  {
2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  56  	/* initialize to default */
2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  57  	uart_base = FFUART_BASE;
2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  58  	uart_shift = 2;
2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  59  	uart_is_pxa = 1;
2a8ac187e03027 arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2010-03-08  60  
28f74201e37ccf arch/arm/mach-pxa/include/mach/uncompress.h Jonathan Cameron  2022-02-27  61  	if (machine_is_littleton() ||  machine_is_csb726() ||
2a23ec3679d84a arch/arm/mach-pxa/include/mach/uncompress.h Jonathan McDowell 2009-07-04 @62  	    || machine_is_cm_x300() || machine_is_balloon3())

:::::: The code at line 62 was first introduced by commit
:::::: 2a23ec3679d84ac243add761fa3d3872cf6dcb11 [ARM] pxa: balloon3 (http://balloonboard.org/) base machine support

:::::: TO: Jonathan McDowell <noodles@earth.li>
:::::: CC: Eric Miao <eric.y.miao@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
