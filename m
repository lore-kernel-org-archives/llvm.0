Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F819937;
	Tue,  9 May 2023 22:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683672873; x=1715208873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=71piCgGuWzuiYkG20Ao5AVjLrI1+LjiGMmLpicz+61w=;
  b=PmXcHvfFQHMnmQdjc3rBeDvpqvdB6hlR/C01sOZXmiFnTetMzytKiKVo
   W6IQdvkeCEEQD2GQKs0WKks9pWod1S+UxhLKJiiY7Sjj2sWXFHB293H0E
   wmsc8c5eJJutC1GhuIY4/yOkhqWaCi31sjtPnvPN9ItXBGc2i7lakMDlE
   Fb78gpOc969nN1H2MWP2+6IVz8tvdsj2LmsAonN39yUXcsmF/hhgyVrOS
   xPKX5NCwLy/krKv6Rqe+CQh4hebAPMqu6IObtWcd1oK2+gAVJEcug6atY
   pp78hYzSSV1xl53iArtFigr5DJ/AJDOO+c3WkH8P2B8csRImbjjkj5bjq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330439320"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="330439320"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 15:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649523056"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="649523056"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 May 2023 15:45:54 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwW5h-0002ay-32;
	Tue, 09 May 2023 22:45:53 +0000
Date: Wed, 10 May 2023 06:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-pfn-v6-4-rc1 11/12]
 arch/arm64/kernel/vdso.c:291:38: error: incompatible integer to pointer
 conversion passing 'unsigned long' to parameter of type 'const void *'
Message-ID: <202305100635.jHxJhhgc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-pfn-v6-4-rc1
head:   2c9796d7393a139f2b658603859f3cb95f98fec6
commit: e9d83dd0dd653d3355fb5c7309ce964050c162ed [11/12] arm64: memory: Make virt_to_pfn() a static inline
config: arm64-randconfig-r011-20230509 (https://download.01.org/0day-ci/archive/20230510/202305100635.jHxJhhgc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=e9d83dd0dd653d3355fb5c7309ce964050c162ed
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator b4/virt-to-pfn-v6-4-rc1
        git checkout e9d83dd0dd653d3355fb5c7309ce964050c162ed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100635.jHxJhhgc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/vdso.c:291:38: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
           aarch32_vectors_page = virt_to_page(vdso_page);
                                               ^~~~~~~~~
   arch/arm64/include/asm/memory.h:364:50: note: expanded from macro 'virt_to_page'
   #define virt_to_page(x)         pfn_to_page(virt_to_pfn(x))
                                                           ^
   include/asm-generic/memory_model.h:37:40: note: expanded from macro '__pfn_to_page'
   #define __pfn_to_page(pfn)      (vmemmap + (pfn))
                                               ^~~
   arch/arm64/include/asm/memory.h:337:53: note: passing argument to parameter 'kaddr' here
   static inline unsigned long virt_to_pfn(const void *kaddr)
                                                       ^
   1 error generated.


vim +291 arch/arm64/kernel/vdso.c

9031fefde6f2ac Will Deacon       2012-03-05  275  
1255a7341bee6c Vincenzo Frascino 2019-04-15  276  static int aarch32_alloc_kuser_vdso_page(void)
9031fefde6f2ac Will Deacon       2012-03-05  277  {
9031fefde6f2ac Will Deacon       2012-03-05  278  	extern char __kuser_helper_start[], __kuser_helper_end[];
9031fefde6f2ac Will Deacon       2012-03-05  279  	int kuser_sz = __kuser_helper_end - __kuser_helper_start;
1255a7341bee6c Vincenzo Frascino 2019-04-15  280  	unsigned long vdso_page;
9031fefde6f2ac Will Deacon       2012-03-05  281  
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  282  	if (!IS_ENABLED(CONFIG_KUSER_HELPERS))
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  283  		return 0;
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  284  
7cd6ca1d790226 Will Deacon       2021-03-18  285  	vdso_page = get_zeroed_page(GFP_KERNEL);
1255a7341bee6c Vincenzo Frascino 2019-04-15  286  	if (!vdso_page)
0d747f6585954d Vincenzo Frascino 2019-04-15  287  		return -ENOMEM;
9031fefde6f2ac Will Deacon       2012-03-05  288  
1255a7341bee6c Vincenzo Frascino 2019-04-15  289  	memcpy((void *)(vdso_page + 0x1000 - kuser_sz), __kuser_helper_start,
1255a7341bee6c Vincenzo Frascino 2019-04-15  290  	       kuser_sz);
74fc72e77dc5c8 Mark Rutland      2020-04-28 @291  	aarch32_vectors_page = virt_to_page(vdso_page);
1255a7341bee6c Vincenzo Frascino 2019-04-15  292  	return 0;
0d747f6585954d Vincenzo Frascino 2019-04-15  293  }
9031fefde6f2ac Will Deacon       2012-03-05  294  

:::::: The code at line 291 was first introduced by commit
:::::: 74fc72e77dc5c8033d1b47d2c8a7229b4b83a746 arm64: vdso: remove aarch32_vdso_pages[]

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
