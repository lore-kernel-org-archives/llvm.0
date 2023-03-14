Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A719D;
	Tue, 14 Mar 2023 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678798845; x=1710334845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mmzdq10YVPP9Tk6g+46yn3lqFuTN6lr03IUdWhzJens=;
  b=AT+t0BT7RxJL4SoxyIaOYwmH5AjyIDrHsFvOtD4JdQ25lSMGwaFTH+4M
   UeMbNHPzHxtmlDfxsRRfD5bVIpoffxpHqm/fUY1JmOUs6qRkbPXfDILpv
   M2Kw6z84djAHfrCRVTP/LUkaiKBU1sUnte1eXDWGqmdV9zV9H4IK5ixnE
   jqmZLpujL/txw68oa69cdok5cwXdFBT1ZgOY5+M07UBM1amHYCSHj9/Wc
   sTazRc6I/efEe7MtoefHhVNZdR/t5TsppLfuEIMV0asE0RQD/UO0RIykp
   m7jRwhB5egVrAdGdtPdB3EXbifxPzoqK3BYkz4H/s/aoMX2Djj2J3uVjY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="337441601"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="337441601"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 06:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="709275921"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="709275921"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Mar 2023 06:00:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc4GZ-0006uu-0S;
	Tue, 14 Mar 2023 13:00:35 +0000
Date: Tue, 14 Mar 2023 21:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 15/31] arch/mips/include/asm/page.h:262:33: error: call to undeclared
 function 'virt_to_phys'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202303142032.7aN9ep2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: 44341c79c6d4883399b157f99b4e78d207049f4d [15/31] MIPS: Make virt_to_pfn() a static inline
config: mips-randconfig-r022-20230312 (https://download.01.org/0day-ci/archive/20230314/202303142032.7aN9ep2c-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=44341c79c6d4883399b157f99b4e78d207049f4d
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout 44341c79c6d4883399b157f99b4e78d207049f4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142032.7aN9ep2c-lkp@intel.com/

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
