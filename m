Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89D3C34;
	Tue, 14 Mar 2023 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678800100; x=1710336100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsl28reGcZzBseer8oqglhh+b2+IymNmlJUMZC8NwbA=;
  b=BqYvTeJhEJn902fHHrWFSj3PVSBR9NT9iB5rlmhDZ+6EMqJPVsOCECct
   IVjmfaWIcFN1EhOQM+TAEoFgX1kt30YgsPZG3X8W5HClAE1YPHeDNPjGM
   KEFOkg4nwVN0rRkgYCfzBz8WAEz3a8d3DnZ4t9sdMhf9a/65WNKV5A1/9
   CaJvTZOS09zeu7dcxh2orZG5OFJ019f7u+tEItbKODBHVYUVOeLFefV82
   fV6wQVlQ5Hh42VwoYXRToXIogVN8YZEUo85qxva/61ykenv5YhdxcPc/Z
   cW8/HZkFXhOXIilugtdXgxbAgwnO18i3+fdtPa1qRtqkC/sr6w2mPEfee
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317809872"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="317809872"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 06:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="743311551"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="743311551"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Mar 2023 06:21:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc4au-0006vi-07;
	Tue, 14 Mar 2023 13:21:36 +0000
Date: Tue, 14 Mar 2023 21:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 30/31] arch/arm/include/asm/uaccess.h:54:14: error: call to undeclared
 function 'current_user_ttbr'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202303142108.QyQYd0cH-lkp@intel.com>
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
commit: 10557ad0121060f8e047e962a08858c0e5652cb8 [30/31] switch PGD/TTBR0 in <asm/uaccess-asm.h>
config: arm-randconfig-r006-20230313 (https://download.01.org/0day-ci/archive/20230314/202303142108.QyQYd0cH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=10557ad0121060f8e047e962a08858c0e5652cb8
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
        git checkout 10557ad0121060f8e047e962a08858c0e5652cb8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142108.QyQYd0cH-lkp@intel.com/

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
