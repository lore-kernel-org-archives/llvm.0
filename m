Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E2626;
	Thu, 13 Apr 2023 16:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681404720; x=1712940720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lAs50PK3nogPeEywekbB3ksviy4g1rG9j2SzINUspfc=;
  b=aFWSVSV25zZRMEBnEJ1PwjyKtiMnRDcpssvftZYScQu2JFqz1E0+4g70
   04H5+hJKJbNENRMSTBdJVfSmQtH5icGT5TtPsYW2obHQSOGPLCJULUswb
   ZsqnGycft+Kbvwfx/VVtJSk3agDjVCWUFvuesGTa5fA9V5nNiC5RBYd5B
   GAU8ntW329BSPQdIbtjv6WYplPvDC5ibFkyPvrj6aGReo9H/4d5n673K1
   LoTikHiTrvddD9kQYvzLRqb+YgPC5QMHv+mVTnPTt25ZRzJa9B2dADfHb
   qwRVBG+Dxlxvxpl3Apz/0wPfhOdxchKN0Dt/bsblXyFuHkZKam34aK8II
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="341736213"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="341736213"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 09:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="778846867"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="778846867"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Apr 2023 09:51:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn0At-000YpP-12;
	Thu, 13 Apr 2023 16:51:55 +0000
Date: Fri, 14 Apr 2023 00:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:hotplug 30/43] arch/mips/kernel/smp.c:695:14: error: no
 member named 'cleanup_dead_cpu' in 'struct plat_smp_ops'
Message-ID: <202304140005.QSBRx6Ah-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git hotplug
head:   d48bd313bebb2d7535ee31422539cc698e22dbfa
commit: 78ca613e2ad3f023135ea52e8f1b232c2bcb1906 [30/43] MIPS: SMP_CPS: Switch to hotplug core state synchronization
config: mips-randconfig-r012-20230410 (https://download.01.org/0day-ci/archive/20230414/202304140005.QSBRx6Ah-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=78ca613e2ad3f023135ea52e8f1b232c2bcb1906
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel hotplug
        git checkout 78ca613e2ad3f023135ea52e8f1b232c2bcb1906
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140005.QSBRx6Ah-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/smp.c:334:17: warning: no previous prototype for function 'start_secondary' [-Wmissing-prototypes]
   asmlinkage void start_secondary(void)
                   ^
   arch/mips/kernel/smp.c:334:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void start_secondary(void)
              ^
              static 
   arch/mips/kernel/smp.c:454:5: warning: no previous prototype for function 'setup_profiling_timer' [-Wmissing-prototypes]
   int setup_profiling_timer(unsigned int multiplier)
       ^
   arch/mips/kernel/smp.c:454:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int setup_profiling_timer(unsigned int multiplier)
   ^
   static 
   arch/mips/kernel/smp.c:693:6: error: redefinition of 'arch_cpuhp_cleanup_dead_cpu'
   void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
        ^
   include/linux/cpuhotplug.h:531:20: note: previous definition is here
   static inline void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu) { }
                      ^
>> arch/mips/kernel/smp.c:695:14: error: no member named 'cleanup_dead_cpu' in 'struct plat_smp_ops'
           if (mp_ops->cleanup_dead_cpu)
               ~~~~~~  ^
   arch/mips/kernel/smp.c:696:11: error: no member named 'cleanup_dead_cpu' in 'struct plat_smp_ops'
                   mp_ops->cleanup_dead_cpu(cpu);
                   ~~~~~~  ^
   2 warnings and 3 errors generated.


vim +695 arch/mips/kernel/smp.c

   692	
   693	void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
   694	{
 > 695		if (mp_ops->cleanup_dead_cpu)
   696			mp_ops->cleanup_dead_cpu(cpu);
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
