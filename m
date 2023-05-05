Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBFEBE73;
	Fri,  5 May 2023 21:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683322290; x=1714858290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LK6c0dLV2ws2e+MXubi7Zjl8QXC2MGI/oyTIKa/4NgQ=;
  b=F0en7BMbXMKcm3D4GP4iAZDkWRAYV5qH+K+Ejg7Dt4yVeJGt5BM4DRmv
   YMPWkbx95dxMlFoJ4E19feOi73xy5hffxEgSqz/EFkaEnPaisgERvII1I
   aQRbUD+7UdktD+hSi4zt+prSBI4hsIQfRyxensPvWX52JmRHdyYb6fVi4
   /BaBp0LkOjo3InCREwroHWgfzMT+lUiV2cFY5y2IQ68O5ylbT6dvCH26f
   9TZej789ePLl8r6q6IH6vy868ui9WfeMikAq5wnruVOftqNP7my3/AfDt
   s0xC2fEcr7x8AA+oypKAc9dM0lKo2QQkbmEE6MLtFghw5+QmQ806yJPaE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="351449757"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="351449757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="728261658"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="728261658"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 May 2023 14:31:28 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv31T-0000s7-26;
	Fri, 05 May 2023 21:31:27 +0000
Date: Sat, 6 May 2023 05:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: arch/arm/boot/compressed/atags_to_fdt.c:129:5: warning: stack frame
 size (1336) exceeds limit (1280) in 'atags_to_fdt'
Message-ID: <202305060558.U9RE5y1G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78b421b6a7c6dbb6a213877c742af52330f5026d
commit: 3220022038b9a3845eea762af85f1c5694b9f861 ARM: 9256/1: NWFPE: avoid compiler-generated __aeabi_uldivmod
date:   6 months ago
config: arm-randconfig-r046-20230504 (https://download.01.org/0day-ci/archive/20230506/202305060558.U9RE5y1G-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3220022038b9a3845eea762af85f1c5694b9f861
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3220022038b9a3845eea762af85f1c5694b9f861
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060558.U9RE5y1G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/boot/compressed/atags_to_fdt.c:129:5: warning: no previous prototype for function 'atags_to_fdt' [-Wmissing-prototypes]
   int atags_to_fdt(void *atag_list, void *fdt, int total_space)
       ^
   arch/arm/boot/compressed/atags_to_fdt.c:129:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int atags_to_fdt(void *atag_list, void *fdt, int total_space)
   ^
   static 
>> arch/arm/boot/compressed/atags_to_fdt.c:129:5: warning: stack frame size (1336) exceeds limit (1280) in 'atags_to_fdt' [-Wframe-larger-than]
   int atags_to_fdt(void *atag_list, void *fdt, int total_space)
       ^
   44/1336 (3.29%) spills, 1292/1336 (96.71%) variables
   2 warnings generated.


vim +/atags_to_fdt +129 arch/arm/boot/compressed/atags_to_fdt.c

31d0b9f9982f8e3 Ben Dooks          2018-10-12  120  
b90b9a38251e9c8 Nicolas Pitre      2011-09-13  121  /*
b90b9a38251e9c8 Nicolas Pitre      2011-09-13  122   * Convert and fold provided ATAGs into the provided FDT.
b90b9a38251e9c8 Nicolas Pitre      2011-09-13  123   *
4716e2e34a22a8c Geert Uytterhoeven 2021-05-19  124   * Return values:
b90b9a38251e9c8 Nicolas Pitre      2011-09-13  125   *    = 0 -> pretend success
b90b9a38251e9c8 Nicolas Pitre      2011-09-13  126   *    = 1 -> bad ATAG (may retry with another possible ATAG pointer)
b90b9a38251e9c8 Nicolas Pitre      2011-09-13  127   *    < 0 -> error from libfdt
b90b9a38251e9c8 Nicolas Pitre      2011-09-13  128   */
b90b9a38251e9c8 Nicolas Pitre      2011-09-13 @129  int atags_to_fdt(void *atag_list, void *fdt, int total_space)

:::::: The code at line 129 was first introduced by commit
:::::: b90b9a38251e9c89c34179eccde57411ceb5f1aa ARM: zImage: allow supplementing appended DTB with traditional ATAG data

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Nicolas Pitre <nico@fluxnic.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
