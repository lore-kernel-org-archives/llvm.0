Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB378C1E;
	Mon, 29 May 2023 17:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685379959; x=1716915959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0HyEw2QfjzppZlBFkp4uAm9FV0MdLZq4Asox1ZedRk=;
  b=D3AtnZQ3xKKhMyDeGAN+ynfKtzvHHpdqyyq52w8WEg2FS+Km34zkasbf
   Kniwpbmh67jTuBVz3eETjlDzUadinyFgNHDedijXXpdJkKZpbX7ruOazO
   0IcXAbnyAcmJWhFw4qPRq24siH/IhtZREeEQfjpIWCa+dH4oFyB5QhX0t
   sRPNRGWWxFso2flbtU48ROsHLEWIBvu/m4ZXezgEVwNcBVC0+6LLpvWRh
   V8/pCtgaAtjIKi+2QNwSnQ8+O0fIhMND6UFNWdzF7VjoLLSHPSvaXqEPy
   pOfWGN45q7N3eQhnCp5EmZ7mJHKmDkHBslcSODFpi2waZBKhEwGunJ8N6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="352245966"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="352245966"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 10:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="795980421"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="795980421"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 May 2023 10:05:57 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3gJh-000L3q-13;
	Mon, 29 May 2023 17:05:57 +0000
Date: Tue, 30 May 2023 01:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split 23/25]
 arch/arm/include/asm/uaccess.h:45:2: error: use of a '#elifdef' directive is
 a C2x extension
Message-ID: <202305300057.w6bquceI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split
head:   8843160b0ea1fbe699a63bfa131f995cd3f23119
commit: f568e0b0cf6225d4d5a6fc568d94e7f64f24b9d6 [23/25] ARM: kernel/userspace address separation
config: arm-randconfig-r046-20230529 (https://download.01.org/0day-ci/archive/20230530/202305300057.w6bquceI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=f568e0b0cf6225d4d5a6fc568d94e7f64f24b9d6
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.4-rc1-just-ttbr0-split
        git checkout f568e0b0cf6225d4d5a6fc568d94e7f64f24b9d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/tilcdc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305300057.w6bquceI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tilcdc/tilcdc_plane.c:7:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:976:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:11:
   In file included from include/linux/uaccess.h:11:
>> arch/arm/include/asm/uaccess.h:45:2: error: use of a '#elifdef' directive is a C2x extension [-Werror,-Wc2x-extensions]
   #elifdef CONFIG_ARM_KERNEL_SEPARATION
    ^
   arch/arm/include/asm/uaccess.h:68:2: error: use of a '#elifdef' directive is a C2x extension [-Werror,-Wc2x-extensions]
   #elifdef CONFIG_ARM_KERNEL_SEPARATION
    ^
   2 errors generated.


vim +45 arch/arm/include/asm/uaccess.h

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
  > 45	#elifdef CONFIG_ARM_KERNEL_SEPARATION
    46		/*
    47		 * Intended semantics: switch to the userspace MM context (enable
    48		 * userspace), then return (save) the previous kernelspace TTBR0
    49		 * value.
    50		 */
    51		u64 user_ttbr, kernel_ttbr;
    52	
    53		user_ttbr = current_user_ttbr();
    54		kernel_ttbr = read_sysreg(TTBR1);
    55		write_sysreg(user_ttbr, TTBR0);
    56	
    57		return kernel_ttbr;
    58	#else
    59		return 0;
    60	#endif
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
