Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DADB1383
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652791483; x=1684327483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkVHA2JCH0Qh851pc3u8+00EuRv9GkNsBAg+GwhSWok=;
  b=jiVvxcfdeCjYWl4uNQHtQZu1Y475GGoBdydCgdZKY5mImB5OZWxD0Hgg
   dPjRKLdHuYK4SRkqBokeSAcUHpENucTEeyWR4mSoUZsnWgMtv4w2txozK
   TKMfDIIcWcQCkdqnwrHJTWYrIqp/Z+Ue2sqKfB/mZ/Ge/EQ9VQ38M4U0n
   eSIyI9n7aQ14JRLa0ZxSjIdOlydQDY5YH836ktnERJtZEbccUgDYzKFJ/
   bO4UypZ1k28tbmB+4LrMuYMWoQi2ZgusLsDInZuE5J4NvJXIyZYFiGow3
   IxVjndPOT6Fj3xAOIwOZv3XqYaWj0EEoOCqRo7T71ZPHth+IelGdjc8lO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="258732627"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="258732627"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 05:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="626462812"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 May 2022 05:44:41 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqwZ6-0000xt-Cj;
	Tue, 17 May 2022 12:44:40 +0000
Date: Tue, 17 May 2022 20:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.18-rc1 8/9]
 arch/arm/mm/mmu.c:1562:13: warning: no previous prototype for function
 'vm_reserve_kernel'
Message-ID: <202205172000.5CrHBa46-lkp@intel.com>
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
commit: 52cbc963c5c9daba74109e9782e3487cdf48fe5c [8/9] ARM: Compile the kernel into VMALLOC
config: arm-buildonly-randconfig-r002-20220516 (https://download.01.org/0day-ci/archive/20220517/202205172000.5CrHBa46-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=52cbc963c5c9daba74109e9782e3487cdf48fe5c
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v5.18-rc1
        git checkout 52cbc963c5c9daba74109e9782e3487cdf48fe5c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/arm/mm/mmu.c:118:13: warning: no previous prototype for function 'init_default_cache_policy' [-Wmissing-prototypes]
   void __init init_default_cache_policy(unsigned long pmd)
               ^
   arch/arm/mm/mmu.c:118:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init init_default_cache_policy(unsigned long pmd)
   ^
   static 
   arch/arm/mm/mmu.c:1161:13: warning: no previous prototype for function 'adjust_lowmem_bounds' [-Wmissing-prototypes]
   void __init adjust_lowmem_bounds(void)
               ^
   arch/arm/mm/mmu.c:1161:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init adjust_lowmem_bounds(void)
   ^
   static 
>> arch/arm/mm/mmu.c:1562:13: warning: no previous prototype for function 'vm_reserve_kernel' [-Wmissing-prototypes]
   void __init vm_reserve_kernel(struct map_desc *md)
               ^
   arch/arm/mm/mmu.c:1562:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init vm_reserve_kernel(struct map_desc *md)
   ^
   static 
   arch/arm/mm/mmu.c:1762:13: warning: no previous prototype for function 'paging_init' [-Wmissing-prototypes]
   void __init paging_init(const struct machine_desc *mdesc)
               ^
   arch/arm/mm/mmu.c:1762:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init paging_init(const struct machine_desc *mdesc)
   ^
   static 
   arch/arm/mm/mmu.c:1795:13: warning: no previous prototype for function 'early_mm_init' [-Wmissing-prototypes]
   void __init early_mm_init(const struct machine_desc *mdesc)
               ^
   arch/arm/mm/mmu.c:1795:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init early_mm_init(const struct machine_desc *mdesc)
   ^
   static 
   5 warnings generated.


vim +/vm_reserve_kernel +1562 arch/arm/mm/mmu.c

  1560	
  1561	/* Reserve memory used by the kernel when placing the kernel inside VMALLOC */
> 1562	void __init vm_reserve_kernel(struct map_desc *md)
  1563	{
  1564		struct vm_struct *vm;
  1565		struct static_vm *svm;
  1566	
  1567		svm = early_alloc(sizeof(*svm));
  1568	
  1569		vm = &svm->vm;
  1570		vm->addr = (void *)(md->virtual & PAGE_MASK);
  1571		vm->size = PAGE_ALIGN(md->length + (md->virtual & ~PAGE_MASK));
  1572		vm->phys_addr = __pfn_to_phys(md->pfn);
  1573		vm->flags = VM_MAP | VM_ARM_STATIC_MAPPING;
  1574		vm->flags |= VM_ARM_MTYPE(md->type);
  1575		vm->caller = vm_reserve_kernel;
  1576		add_static_vm_early(svm);
  1577	}
  1578	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
