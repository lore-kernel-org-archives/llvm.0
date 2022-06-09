Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC097A
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 06:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654756171; x=1686292171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JwkvfgNXSGk3SC0ZcIqM8dwS2BBg+lmAboqd7nNC/dg=;
  b=ZcXreYCsStcXmdo7iuJTimhXUg/Y6/jVJW3/JXAuHjQPSPIPQ071qaFp
   vLzIsslb3lbLxC0U6vqQ+025jUpv+bnIr7ZfxmJgIjnQefuRN0znJ4R95
   KIpZ3+D98EFTBSDAlJEX1OI7zUNHGE5oZVS1U7YNU+rdOS82TjSCGgiSN
   n+M/3Bd1fECE2zPuWbeIhwu8k8j7huRNwyqrwMQfACgUZ5FzM29WoPWbQ
   E7xeojxxmQ8tgI3w/66A30a2vvk8MyASvwT4ojJ/qK4Q/lYGAitdpLTOA
   4d5jhcTYmGBrqXUMt9gbj6vJTulsbBQNzkBJcWX6kesjQGOuN/4IBrGhQ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="265953986"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="265953986"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 23:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="827404203"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jun 2022 23:29:20 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzBfU-000Fbh-0n;
	Thu, 09 Jun 2022 06:29:20 +0000
Date: Thu, 9 Jun 2022 14:29:00 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.19-rc1 25/33]
 arch/mips/include/asm/page.h:262:33: error: call to undeclared function
 'virt_to_phys'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202206091413.scfY8Gty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v5.19-rc1
head:   512fc95a58c7b2e91e267db91a4ec5a54afedd01
commit: 5149ad804a00e6613abb8f069495e54b79bdfad0 [25/33] MIPS: Make virt_to_pfn() a static inline
config: mips-randconfig-c004-20220608 (https://download.01.org/0day-ci/archive/20220609/202206091413.scfY8Gty-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=5149ad804a00e6613abb8f069495e54b79bdfad0
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v5.19-rc1
        git checkout 5149ad804a00e6613abb8f069495e54b79bdfad0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:5:
   In file included from include/linux/spinlock.h:64:
   In file included from arch/mips/include/asm/mmiowb.h:5:
   In file included from arch/mips/include/asm/io.h:29:
>> arch/mips/include/asm/page.h:262:33: error: call to undeclared function 'virt_to_phys'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return (unsigned long)PFN_DOWN(virt_to_phys(kaddr));
                                          ^
   arch/mips/include/asm/page.h:262:33: note: did you mean 'virt_to_pfn'?
   arch/mips/include/asm/page.h:255:29: note: 'virt_to_pfn' declared here
   static inline unsigned long virt_to_pfn(const volatile void *kaddr)
                               ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:5:
   In file included from include/linux/spinlock.h:64:
   In file included from arch/mips/include/asm/mmiowb.h:5:
>> arch/mips/include/asm/io.h:114:27: error: static declaration of 'virt_to_phys' follows non-static declaration
   static inline phys_addr_t virt_to_phys(const volatile void *x)
                             ^
   arch/mips/include/asm/page.h:262:33: note: previous implicit declaration is here
           return (unsigned long)PFN_DOWN(virt_to_phys(kaddr));
                                          ^
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for function 'output_ptreg_defines' [-Wmissing-prototypes]
   void output_ptreg_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_ptreg_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for function 'output_task_defines' [-Wmissing-prototypes]
   void output_task_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:78:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_task_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:92:6: warning: no previous prototype for function 'output_thread_info_defines' [-Wmissing-prototypes]
   void output_thread_info_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_thread_info_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:108:6: warning: no previous prototype for function 'output_thread_defines' [-Wmissing-prototypes]
   void output_thread_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_thread_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for function 'output_mm_defines' [-Wmissing-prototypes]
   void output_mm_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_mm_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:218:6: warning: no previous prototype for function 'output_sc_defines' [-Wmissing-prototypes]
   void output_sc_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:218:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_sc_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:253:6: warning: no previous prototype for function 'output_signal_defined' [-Wmissing-prototypes]
   void output_signal_defined(void)
        ^
   arch/mips/kernel/asm-offsets.c:253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_signal_defined(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:332:6: warning: no previous prototype for function 'output_pm_defines' [-Wmissing-prototypes]
   void output_pm_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:332:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_pm_defines(void)
   ^
   static 
   8 warnings and 2 errors generated.
   make[2]: *** [scripts/Makefile.build:117: arch/mips/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1196: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/virt_to_phys +262 arch/mips/include/asm/page.h

   254	
   255	static inline unsigned long virt_to_pfn(const volatile void *kaddr)
   256	{
   257		/*
   258		 * MIPS virt_to_phys() returns a phys_addr_t which is
   259		 * an unsigned int on MIPS, but the interface expects
   260		 * unsigned long.
   261		 */
 > 262		return (unsigned long)PFN_DOWN(virt_to_phys(kaddr));
   263	}
   264	#define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
   265	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
