Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E61E2C9D
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647003126; x=1678539126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5QSetv+PP1A/fdkcp2EKiLWClyc2pYwIJ2+iPsNa67w=;
  b=iAA3mUrUVQGRwdc239FlnFuHcZjR000EMqtK+OxN4IRHnl+PQazpP308
   2Sx2gmGADazsE/Ztc3sbTbfUtoNFKKExV/8Piyf0ibcYKIZCSQQJ9YvKt
   tiw5luL1XBry7UNriVkEIrfE2hxRMFltKNm9Oai5h5Wp0UmAhRwE18evf
   Vw8SKEYv0yDjNmEKYMwMNx+7Eg1BQ+3MhgXhLguZXm/6MMuhh9ORtCGhn
   flwBITM7PtQx4bKuXBRQoVIdS3N/v+rWjmUeeaZrBVzB/w2K9/KQLnTAn
   6SehtVOqfFveruOiFWalPznjvZXkCCuCauHKh3ejGvnvHVS0iVjzbasJx
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="280310444"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="280310444"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 04:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="496755736"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Mar 2022 04:52:04 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSekV-0006Pe-Ig; Fri, 11 Mar 2022 12:52:03 +0000
Date: Fri, 11 Mar 2022 20:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.17-rc1 4/8]
 arch/arm/mm/init.c:307:13: warning: no previous prototype for function
 'mem_init_print_arm_info'
Message-ID: <202203112052.m5tYcVx1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v5.17-rc1
head:   66e9038ef48dc66c07b12443b73e2d1f3f12cbab
commit: 18e0d99ee35450767fc8222f1727febdd2a4deac [4/8] ARM: Print virtual memory info again
config: arm-vt8500_v6_v7_defconfig (https://download.01.org/0day-ci/archive/20220311/202203112052.m5tYcVx1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=18e0d99ee35450767fc8222f1727febdd2a4deac
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v5.17-rc1
        git checkout 18e0d99ee35450767fc8222f1727febdd2a4deac
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/arm/mm/init.c:97:13: warning: no previous prototype for function 'setup_dma_zone' [-Wmissing-prototypes]
   void __init setup_dma_zone(const struct machine_desc *mdesc)
               ^
   arch/arm/mm/init.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init setup_dma_zone(const struct machine_desc *mdesc)
   ^
   static 
>> arch/arm/mm/init.c:307:13: warning: no previous prototype for function 'mem_init_print_arm_info' [-Wmissing-prototypes]
   void __init mem_init_print_arm_info(void)
               ^
   arch/arm/mm/init.c:307:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init mem_init_print_arm_info(void)
   ^
   static 
   2 warnings generated.


vim +/mem_init_print_arm_info +307 arch/arm/mm/init.c

   306	
 > 307	void __init mem_init_print_arm_info(void)
   308	{
   309	#define MLM(b, t) b, t, ((t) - (b)) >> 20
   310		pr_notice("Virtual kernel memory layout:\n"
   311			  "    fixmap  : 0x%08lx - 0x%08lx   (%4ld MB)\n"
   312			  "    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
   313			  "    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB)\n"
   314	#ifdef CONFIG_MODULES
   315			  "    modules : 0x%08lx - 0x%08lx   (%4ld MB)\n",
   316	#endif
   317			  "     kernel : 0x%08lx - 0x%08lx   (%4ld MB)\n",
   318			  MLM(FIXADDR_START, FIXADDR_END),
   319			  MLM(VMALLOC_START, VMALLOC_END),
   320			  MLM(PAGE_OFFSET, (unsigned long)high_memory),
   321	#ifdef CONFIG_MODULES
   322			  MLM(MODULES_VADDR, MODULES_END),
   323	#endif
   324			  /* From beginning of .text to end of .bss */
   325			  MLM((unsigned long)_text, (unsigned long)__bss_stop));
   326	#undef MLM
   327	}
   328	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
