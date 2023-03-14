Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52A419D;
	Tue, 14 Mar 2023 12:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678797045; x=1710333045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DVGSBcUgWIHBDY5IU2G/t68txTt4GZ8mM0D9/FGnXlM=;
  b=X8RSxR9EJdxOAYz8Buih/CFeYBtAVSYYV1c+U+u9BcYYroYLcpV92He1
   drK2T6VeW4OmAJ5GeQeymXSlpP4Klisayz+l/SkDyUDk8ZGLFzIe/hvqd
   nJluFXPEmZxhv2BejGhyXpq/Mp0B0zPzxHrzQ3VxwH4ko98El6qYKgwo7
   Wzgv1g4AFLV0PwWxuJjJHEqTQO45b5JUrf5S+uEm2I8A57RQv08vJPdH3
   LLqhRrSZQxeCu/c/GTiCNzary/y0S2+YurbLBwV9MRL9meHoTyHLsosvp
   toqX8iGR+72oCmjb+VTqp7tgKChzuFW6xc/Pf6M11YGu55B9phOjeHp76
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334889677"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="334889677"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 05:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="681406780"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="681406780"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Mar 2023 05:30:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc3nW-0006tg-0w;
	Tue, 14 Mar 2023 12:30:34 +0000
Date: Tue, 14 Mar 2023 20:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 7/31] arch/arm64/kernel/vdso.c:293:38: error: incompatible integer to
 pointer conversion passing 'unsigned long' to parameter of type 'const void
 *'
Message-ID: <202303142024.21QG0FVl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: 6e863d123cc67f8fb660aa54f971a01ddc56b5b2 [7/31] arm64: memory: Make virt_to_pfn() a static inline
config: arm64-randconfig-r004-20230312 (https://download.01.org/0day-ci/archive/20230314/202303142024.21QG0FVl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=6e863d123cc67f8fb660aa54f971a01ddc56b5b2
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout 6e863d123cc67f8fb660aa54f971a01ddc56b5b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142024.21QG0FVl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/vdso.c:293:38: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
           aarch32_vectors_page = virt_to_page(vdso_page);
                                               ^~~~~~~~~
   arch/arm64/include/asm/memory.h:351:50: note: expanded from macro 'virt_to_page'
   #define virt_to_page(x)         pfn_to_page(virt_to_pfn(x))
                                                           ^
   include/asm-generic/memory_model.h:25:40: note: expanded from macro '__pfn_to_page'
   #define __pfn_to_page(pfn)      (vmemmap + (pfn))
                                               ^~~
   arch/arm64/include/asm/memory.h:324:53: note: passing argument to parameter 'kaddr' here
   static inline unsigned long virt_to_pfn(const void *kaddr)
                                                       ^
   arch/arm64/kernel/vdso.c:321:2: warning: array index 1 is past the end of the array (that has type 'struct vdso_abi_info[1]') [-Warray-bounds]
           vdso_info[VDSO_ABI_AA32].dm = &aarch32_vdso_maps[AA32_MAP_VVAR];
           ^         ~~~~~~~~~~~~~
   arch/arm64/kernel/vdso.c:54:1: note: array 'vdso_info' declared here
   static struct vdso_abi_info vdso_info[] __ro_after_init = {
   ^
   arch/arm64/kernel/vdso.c:322:2: warning: array index 1 is past the end of the array (that has type 'struct vdso_abi_info[1]') [-Warray-bounds]
           vdso_info[VDSO_ABI_AA32].cm = &aarch32_vdso_maps[AA32_MAP_VDSO];
           ^         ~~~~~~~~~~~~~
   arch/arm64/kernel/vdso.c:54:1: note: array 'vdso_info' declared here
   static struct vdso_abi_info vdso_info[] __ro_after_init = {
   ^
   2 warnings and 1 error generated.


vim +293 arch/arm64/kernel/vdso.c

9031fefde6f2ac Will Deacon       2012-03-05  277  
1255a7341bee6c Vincenzo Frascino 2019-04-15  278  static int aarch32_alloc_kuser_vdso_page(void)
9031fefde6f2ac Will Deacon       2012-03-05  279  {
9031fefde6f2ac Will Deacon       2012-03-05  280  	extern char __kuser_helper_start[], __kuser_helper_end[];
9031fefde6f2ac Will Deacon       2012-03-05  281  	int kuser_sz = __kuser_helper_end - __kuser_helper_start;
1255a7341bee6c Vincenzo Frascino 2019-04-15  282  	unsigned long vdso_page;
9031fefde6f2ac Will Deacon       2012-03-05  283  
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  284  	if (!IS_ENABLED(CONFIG_KUSER_HELPERS))
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  285  		return 0;
af1b3cf2c2a3f4 Vincenzo Frascino 2019-04-15  286  
7cd6ca1d790226 Will Deacon       2021-03-18  287  	vdso_page = get_zeroed_page(GFP_KERNEL);
1255a7341bee6c Vincenzo Frascino 2019-04-15  288  	if (!vdso_page)
0d747f6585954d Vincenzo Frascino 2019-04-15  289  		return -ENOMEM;
9031fefde6f2ac Will Deacon       2012-03-05  290  
1255a7341bee6c Vincenzo Frascino 2019-04-15  291  	memcpy((void *)(vdso_page + 0x1000 - kuser_sz), __kuser_helper_start,
1255a7341bee6c Vincenzo Frascino 2019-04-15  292  	       kuser_sz);
74fc72e77dc5c8 Mark Rutland      2020-04-28 @293  	aarch32_vectors_page = virt_to_page(vdso_page);
1255a7341bee6c Vincenzo Frascino 2019-04-15  294  	return 0;
0d747f6585954d Vincenzo Frascino 2019-04-15  295  }
9031fefde6f2ac Will Deacon       2012-03-05  296  

:::::: The code at line 293 was first introduced by commit
:::::: 74fc72e77dc5c8033d1b47d2c8a7229b4b83a746 arm64: vdso: remove aarch32_vdso_pages[]

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
