Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A99138F
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 22:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651183406; x=1682719406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YYNswVvvbMrH6KjwU+DEX1dnDPFbEExRtmWGNyijP14=;
  b=Sx3ARnTlm6EZa08HaQOaEFuTB+Vsr07YU+v9ZMGDXeO4qahv/Ya28CUh
   EXYfQ2MHS3kffESh1jCthhL0MK0iLehG741jHpilgRj6Dm8b++YdKeao1
   rHwhjXR2TuI59IsEsbmhX5aixHQ7hQRFLbdh3oU4mcSl3WxeG7rfQ+nCX
   ZpMIBuiIIxzmNeP03hHoH1f0zTUw6HPUIjUlJkfGuuQQfk1IIpxa20M0A
   PTn+EcTCl8g/Ra+PEGIThabZVvzHfYzMhWbbty9IV9iD3TeaCINW1XZX+
   oQxvNtxaY+bQY3NA9vKob/XSpcKt7FxMcxTe2Z141HpSV+XxLAyOM6D0K
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="329380918"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="329380918"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 15:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="731732115"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2022 15:03:23 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkCEM-0005j5-D9;
	Thu, 28 Apr 2022 22:03:22 +0000
Date: Fri, 29 Apr 2022 06:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ardb:arm64-head-refactor-v4 23/38]
 arch/arm64/kernel/pi/kaslr_early.c:95:17: error: call to undeclared function
 '__early_cpu_has_rndr'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202204290528.NFbq0iMb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-head-refactor-v4
head:   9e199441095c2a38ba1019e8f782e9fd10876da9
commit: b116ed6cbb1b583ebf32c54fff16e0b3e62fad4f [23/38] arm64: head: relocate kernel only a single time if KASLR is enabled
config: arm64-randconfig-r014-20220428 (https://download.01.org/0day-ci/archive/20220429/202204290528.NFbq0iMb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=b116ed6cbb1b583ebf32c54fff16e0b3e62fad4f
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb arm64-head-refactor-v4
        git checkout b116ed6cbb1b583ebf32c54fff16e0b3e62fad4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/pi/kaslr_early.c:95:17: error: call to undeclared function '__early_cpu_has_rndr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (!seed && (!__early_cpu_has_rndr() ||
                          ^
>> arch/arm64/kernel/pi/kaslr_early.c:96:10: error: call to undeclared function '__arm64_rndr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                         !__arm64_rndr((unsigned long *)&seed)))
                          ^
   arch/arm64/kernel/pi/kaslr_early.c:87:16: warning: no previous prototype for function 'kaslr_early_init' [-Wmissing-prototypes]
   asmlinkage u64 kaslr_early_init(const void *fdt)
                  ^
   arch/arm64/kernel/pi/kaslr_early.c:87:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage u64 kaslr_early_init(const void *fdt)
              ^
              static 
   1 warning and 2 errors generated.


vim +/__early_cpu_has_rndr +95 arch/arm64/kernel/pi/kaslr_early.c

    86	
    87	asmlinkage u64 kaslr_early_init(const void *fdt)
    88	{
    89		u64 seed, mask, offset;
    90	
    91		if (is_kaslr_disabled_cmdline(fdt))
    92			return 0;
    93	
    94		seed = get_kaslr_seed(fdt);
  > 95		if (!seed && (!__early_cpu_has_rndr() ||
  > 96			      !__arm64_rndr((unsigned long *)&seed)))
    97			return 0;
    98	
    99		/*
   100		 * OK, so we are proceeding with KASLR enabled. Calculate a suitable
   101		 * kernel image offset from the seed. Let's place the kernel in the
   102		 * middle half of the VMALLOC area (VA_BITS_MIN - 2), and stay clear of
   103		 * the lower and upper quarters to avoid colliding with other
   104		 * allocations.
   105		 * Even if we could randomize at page granularity for 16k and 64k pages,
   106		 * let's always round to 2 MB so we don't interfere with the ability to
   107		 * map using contiguous PTEs
   108		 */
   109		mask = ((1UL << (VA_BITS_MIN - 2)) - 1) & ~(SZ_2M - 1);
   110		offset = BIT(VA_BITS_MIN - 3) + (seed & mask);
   111	
   112		if (!IS_ENABLED(CONFIG_KASAN_VMALLOC) &&
   113		    (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
   114		     IS_ENABLED(CONFIG_KASAN_SW_TAGS)))
   115			/*
   116			 * KASAN without KASAN_VMALLOC does not expect the module region
   117			 * to intersect the vmalloc region, since shadow memory is
   118			 * allocated for each module at load time, whereas the vmalloc
   119			 * region is shadowed by KASAN zero pages. So keep modules
   120			 * out of the vmalloc region if KASAN is enabled without
   121			 * KASAN_VMALLOC, and put the kernel well within 4 GB of the
   122			 * module region.
   123			 */
   124			return offset % SZ_2G;
   125	
   126		return offset;
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
