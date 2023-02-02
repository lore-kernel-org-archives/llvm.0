Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C1B882A;
	Thu,  2 Feb 2023 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675355129; x=1706891129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBzCmlg6UOWeFxG1uAwC+O8PbO4DEQUILdm+5CEMOGQ=;
  b=nXDCcXrl2/yAtZfnnEoVlClk66+MCT77SxmljNBtGhIVNztPm73MjrrC
   njEqPiPqCRnhN8LpwnKMt9SZJt4KHLCT5sZyOP/926N/AuQpyoRmyLb1y
   KgMsgkN8Q1gquz/rppdpEffl8s3EtKQsjX+Vs+4Ydu22XrOafXSSHTyQG
   qBD1xKZjcLwSK8fYQErAn4g3e8qEQSrMCkzGts0hBhownYLPf8Pdfp+5H
   oRbV5+t8s/GLn2h1qKKBEoeaKN8041kVRVtoEO//4TBcP7crEHLbuLoC3
   jpTdG7JGj165DR2bwcyjuTms+CBfVXcI2IamTyd8mPLDluCn6ZUB+IhwB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="393075495"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="393075495"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 08:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="733986251"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="733986251"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2023 08:23:38 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNcN7-0006fA-2p;
	Thu, 02 Feb 2023 16:23:37 +0000
Date: Fri, 3 Feb 2023 00:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 15/25]
 arch/mips/include/asm/page.h:262:33: error: call to undeclared function
 'virt_to_phys'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202302030004.mmzJEnqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3
head:   ac3cfb78163256f2febd47ebd017d9f5b75820dd
commit: 44341c79c6d4883399b157f99b4e78d207049f4d [15/25] MIPS: Make virt_to_pfn() a static inline
config: mips-randconfig-r011-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030004.mmzJEnqX-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=44341c79c6d4883399b157f99b4e78d207049f4d
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout 44341c79c6d4883399b157f99b4e78d207049f4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:5:
   In file included from include/linux/spinlock.h:65:
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
   In file included from include/linux/spinlock.h:65:
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
   arch/mips/kernel/asm-offsets.c:136:6: warning: no previous prototype for function 'output_thread_fpu_defines' [-Wmissing-prototypes]
   void output_thread_fpu_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:136:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_thread_fpu_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:179:6: warning: no previous prototype for function 'output_mm_defines' [-Wmissing-prototypes]
   void output_mm_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:179:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_mm_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:213:6: warning: no previous prototype for function 'output_sc_defines' [-Wmissing-prototypes]
   void output_sc_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:213:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_sc_defines(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:248:6: warning: no previous prototype for function 'output_signal_defined' [-Wmissing-prototypes]
   void output_signal_defined(void)
        ^
   arch/mips/kernel/asm-offsets.c:248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_signal_defined(void)
   ^
   static 
   arch/mips/kernel/asm-offsets.c:341:6: warning: no previous prototype for function 'output_kvm_defines' [-Wmissing-prototypes]
   void output_kvm_defines(void)
        ^
   arch/mips/kernel/asm-offsets.c:341:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void output_kvm_defines(void)
   ^
   static 
   9 warnings and 2 errors generated.
   make[2]: *** [scripts/Makefile.build:114: arch/mips/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
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
https://github.com/intel/lkp-tests
