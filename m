Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6B5136C
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 12:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652789080; x=1684325080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=smvQa3wqVauPhjelylCg4Ba1X5Rjg/+IufAPhNKe30Y=;
  b=ekxbu7VFkUKStMnYMx8bOjab7ZMWfelPJjyxiXaNftu9K5QZ2IS0VhO9
   8ZXJ/jCzGzOJi/TyO/IxjpIVFRfF6uG6qUwaCBeeyafGuKFLFtKSxa4Y2
   LIQFMiMtsjQ1yC8qdT3gkvf1pEsDv5JPuYYXKbn0wiljGWXF9CCWvVgUU
   CP5p8nYKvGZcFvPlAADm3wDnGbDGvXeP+I+xR6RhoX6qjDfR/hL5gmAHJ
   XEbTsN+YKX1hX08c8HbfyDvpphpg5rKqo1NL5r4+7qWbksttzVmlvuSpU
   Wu5M7Qu3YZuN6M+ruq/v2CZ3kuoc//GzdxqeFOKhII9OwroW+VRWunfw2
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="270847408"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="270847408"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 05:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="605325065"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 May 2022 05:04:38 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqvwL-0000wL-OB;
	Tue, 17 May 2022 12:04:37 +0000
Date: Tue, 17 May 2022 20:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.18-rc1 6/9]
 arch/arm/mm/init.c:266:13: warning: no previous prototype for function
 'mem_init_print_arm_info'
Message-ID: <202205171937.w9TJHq6B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v5.18-rc1
head:   67a8d6eb3d015908f35d6091c02f17d7c3b55bf3
commit: e916acde63f41816676698a5d750588269d0fd64 [6/9] ARM: Print virtual memory info again
config: arm-buildonly-randconfig-r002-20220516 (https://download.01.org/0day-ci/archive/20220517/202205171937.w9TJHq6B-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=e916acde63f41816676698a5d750588269d0fd64
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v5.18-rc1
        git checkout e916acde63f41816676698a5d750588269d0fd64
        # save the config file
        mkdir build_dir && cp config build_dir/.config
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
>> arch/arm/mm/init.c:266:13: warning: no previous prototype for function 'mem_init_print_arm_info' [-Wmissing-prototypes]
   void __init mem_init_print_arm_info(void)
               ^
   arch/arm/mm/init.c:266:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init mem_init_print_arm_info(void)
   ^
   static 
   2 warnings generated.


vim +/mem_init_print_arm_info +266 arch/arm/mm/init.c

   265	
 > 266	void __init mem_init_print_arm_info(void)
   267	{
   268	#define MLM(b, t) b, t, ((t) - (b)) >> 20
   269		pr_notice("Virtual kernel memory layout:\n"
   270			  "    fixmap  : 0x%08lx - 0x%08lx   (%4ld MB)\n"
   271			  "    vmalloc : 0x%08lx - 0x%08lx   (%4ld MB)\n"
   272			  "    lowmem  : 0x%08lx - 0x%08lx   (%4ld MB)\n"
   273	#ifdef CONFIG_MODULES
   274			  "    modules : 0x%08lx - 0x%08lx   (%4ld MB)\n",
   275	#endif
   276			  "     kernel : 0x%08lx - 0x%08lx   (%4ld MB)\n",
   277			  MLM(FIXADDR_START, FIXADDR_END),
   278			  MLM(VMALLOC_START, VMALLOC_END),
   279			  MLM(PAGE_OFFSET, (unsigned long)high_memory),
   280	#ifdef CONFIG_MODULES
   281			  MLM(MODULES_VADDR, MODULES_END),
   282	#endif
   283			  /* From beginning of .text to end of .bss */
   284			  MLM((unsigned long)_text, (unsigned long)__bss_stop));
   285	#undef MLM
   286	}
   287	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
