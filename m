Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4F8F69;
	Tue, 14 Mar 2023 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678805022; x=1710341022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sTgzbTBoXJUFSXFkuCjXIvikyGyFb3KDo6oDmXpmlt4=;
  b=m7YU5/USNqY50x2I/yfTgCHSn93T7qPEsVgm+t7FlAJelSNkMdlq77xS
   LvUWhj/To5O/FULU7i0oT11KZrukOOwbJC9TAbp+LLJIdx9jy8oL0IayF
   iFXNLqPkKfuHUWYJ6PJXWjnTUV5fLmwhdYDRLTb5tyX+acfwyO07WQ7r1
   qNbD/bv5PDCvH20qcU9r3t1Co5/ImS1l7kEWpPa/m+C6D5payJ2IPYPnC
   IW8Fx8UPCvrw7XAfSYC0twcZJkO6sihSHK9cELSn6dRK9ayWzdwQrPnwI
   3dTTz0N4U3q0Jgj8AG75YyV/CHLsQWXXmH+5k1WSr7yoPn4ocd5OeOOax
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="338982806"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="338982806"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 07:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672363299"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="672363299"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2023 07:43:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc5sJ-0006z6-2o;
	Tue, 14 Mar 2023 14:43:39 +0000
Date: Tue, 14 Mar 2023 22:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 30/30]
 arch/arm/include/asm/uaccess.h:54:14: error: call to undeclared function
 'current_user_ttbr'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202303142222.QT4VREFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   8c7a9ba4d5ab142c56f970395de2c419dbcd0a72
commit: 8c7a9ba4d5ab142c56f970395de2c419dbcd0a72 [30/30] switch PGD/TTBR0 in <asm/uaccess-asm.h>
config: arm-randconfig-r046-20230312 (https://download.01.org/0day-ci/archive/20230314/202303142222.QT4VREFq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=8c7a9ba4d5ab142c56f970395de2c419dbcd0a72
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 8c7a9ba4d5ab142c56f970395de2c419dbcd0a72
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142222.QT4VREFq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
   arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:740:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
>> arch/arm/include/asm/uaccess.h:54:14: error: call to undeclared function 'current_user_ttbr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           user_ttbr = current_user_ttbr();
                       ^
>> arch/arm/include/asm/uaccess.h:55:16: error: call to undeclared function 'read_sysreg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           kernel_ttbr = read_sysreg(TTBR1);
                         ^
>> arch/arm/include/asm/uaccess.h:55:28: error: use of undeclared identifier 'TTBR1'
           kernel_ttbr = read_sysreg(TTBR1);
                                     ^
>> arch/arm/include/asm/uaccess.h:56:2: error: call to undeclared function 'write_sysreg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           write_sysreg(user_ttbr, TTBR0);
           ^
>> arch/arm/include/asm/uaccess.h:56:26: error: use of undeclared identifier 'TTBR0'
           write_sysreg(user_ttbr, TTBR0);
                                   ^
   arch/arm/include/asm/uaccess.h:69:2: error: call to undeclared function 'write_sysreg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           write_sysreg(flags, TTBR0);
           ^
   arch/arm/include/asm/uaccess.h:69:22: error: use of undeclared identifier 'TTBR0'
           write_sysreg(flags, TTBR0);
                               ^
   1 warning and 7 errors generated.
   make[2]: *** [scripts/Makefile.build:114: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/current_user_ttbr +54 arch/arm/include/asm/uaccess.h

    28	
    29	/*
    30	 * These two functions allow hooking accesses to userspace to increase
    31	 * system integrity by ensuring that the kernel can not inadvertantly
    32	 * perform such accesses (eg, via list poison values) which could then
    33	 * be exploited for priviledge escalation.
    34	 */
    35	static __always_inline unsigned int uaccess_save_and_enable(void)
    36	{
    37	#ifdef CONFIG_CPU_SW_DOMAIN_PAN
    38		unsigned int old_domain = get_domain();
    39	
    40		/* Set the current domain access to permit user accesses */
    41		set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
    42			   domain_val(DOMAIN_USER, DOMAIN_CLIENT));
    43	
    44		return old_domain;
    45	#else
    46		/*
    47		 * Intended semantics: switch to the userspace MM context (enable
    48		 * userspace), then return (save) the previous kernelspace TTBR0
    49		 * value.
    50		 */
    51		/* FIXME: ifdef CONFIG_VMSPLIT_4G_4G */
    52		u64 user_ttbr, kernel_ttbr;
    53	
  > 54		user_ttbr = current_user_ttbr();
  > 55		kernel_ttbr = read_sysreg(TTBR1);
  > 56		write_sysreg(user_ttbr, TTBR0);
    57	
    58		return kernel_ttbr;
    59	#endif
    60	}
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
