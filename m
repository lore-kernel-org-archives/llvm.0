Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477421851
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 11:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653651054; x=1685187054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMFJJZ6HLj4gQSVHjvYyKMWAyLkF08ix5YrY58k9LIA=;
  b=lrgG/s/VH2WQbrAHK1co0X1IIHnfdr/aHwxbMRUIhKMmVJiuX1KV/2v/
   JQlXqVBYJUK7FmsDFmTRXhAytMPILtfdoN49bLGD+ul4+eBS6tgH1fI7c
   whMvyVHiQgnWVSSXH1upD66QRc5drBLgADxRf1l35/aT9Kk2y9tmgxOkZ
   fdhgfnOgJ5aCBgbHeZF6Y9BhhehfmYemeQC5dg3vTn84imSfbApJjMbGz
   p9P/JDKEWv1bDB/Ac/yaRO2SHrdfJYSZoKeZKyA1YviGjuiXdRgXjfBaL
   UFl7BsM7W0/RJSK8K18ulU4eg1b1xdJIte4hmRGV0dANLv9k6PiOlb7mB
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="272028451"
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="272028451"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 04:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,255,1647327600"; 
   d="scan'208";a="560722632"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 May 2022 04:30:51 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nuYB8-0004ha-JE;
	Fri, 27 May 2022 11:30:50 +0000
Date: Fri, 27 May 2022 19:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 333/429]
 include/linux/memfile_notifier.h:87:57: error: type specifier missing,
 defaults to 'int'; ISO C99 and later do not support implicit int
Message-ID: <202205271916.7L8Eg9yk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   49c277ae966b45577acad5c6d98acba3d27d63af
commit: a46fd36366f3a53f0ea7385cdddef7d5e373edd0 [333/429] mm/shmem: Support memfile_notifier
config: hexagon-randconfig-r045-20220524 (https://download.01.org/0day-ci/archive/20220527/202205271916.7L8Eg9yk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/a46fd36366f3a53f0ea7385cdddef7d5e373edd0
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout a46fd36366f3a53f0ea7385cdddef7d5e373edd0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/char/mem.c:25:
   In file included from include/linux/shmem_fs.h:12:
>> include/linux/memfile_notifier.h:87:57: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   static int memfile_register_notifier(struct file *file, flags,
                                                           ^
                                                           int
   drivers/char/mem.c:95:13: warning: no previous prototype for function 'unxlate_dev_mem_ptr' [-Wmissing-prototypes]
   void __weak unxlate_dev_mem_ptr(phys_addr_t phys, void *addr)
               ^
   drivers/char/mem.c:94:29: note: expanded from macro 'unxlate_dev_mem_ptr'
   #define unxlate_dev_mem_ptr unxlate_dev_mem_ptr
                               ^
   drivers/char/mem.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak unxlate_dev_mem_ptr(phys_addr_t phys, void *addr)
   ^
   static 
   1 warning and 1 error generated.
--
   In file included from drivers/gpu/drm/drm_gem_shmem_helper.c:10:
   In file included from include/linux/shmem_fs.h:12:
>> include/linux/memfile_notifier.h:87:57: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   static int memfile_register_notifier(struct file *file, flags,
                                                           ^
                                                           int
   1 error generated.
--
   In file included from drivers/gpu/drm/vgem/vgem_drv.c:36:
   In file included from include/linux/shmem_fs.h:12:
>> include/linux/memfile_notifier.h:87:57: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   static int memfile_register_notifier(struct file *file, flags,
                                                           ^
                                                           int
   drivers/gpu/drm/vgem/vgem_drv.c:144:10: warning: shift count >= width of type [-Wshift-count-overflow]
                                        DMA_BIT_MASK(64));
                                        ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.
--
   In file included from init/main.c:80:
   In file included from include/linux/shmem_fs.h:12:
>> include/linux/memfile_notifier.h:87:57: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   static int memfile_register_notifier(struct file *file, flags,
                                                           ^
                                                           int
   init/main.c:769:20: warning: no previous prototype for function 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
   void __init __weak arch_post_acpi_subsys_init(void) { }
                      ^
   init/main.c:769:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak arch_post_acpi_subsys_init(void) { }
   ^
   static 
   init/main.c:781:20: warning: no previous prototype for function 'mem_encrypt_init' [-Wmissing-prototypes]
   void __init __weak mem_encrypt_init(void) { }
                      ^
   init/main.c:781:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak mem_encrypt_init(void) { }
   ^
   static 
   init/main.c:783:20: warning: no previous prototype for function 'poking_init' [-Wmissing-prototypes]
   void __init __weak poking_init(void) { }
                      ^
   init/main.c:783:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak poking_init(void) { }
   ^
   static 
   3 warnings and 1 error generated.
--
   In file included from kernel/fork.c:86:
   In file included from include/linux/khugepaged.h:6:
   In file included from include/linux/shmem_fs.h:12:
>> include/linux/memfile_notifier.h:87:57: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   static int memfile_register_notifier(struct file *file, flags,
                                                           ^
                                                           int
   kernel/fork.c:163:13: warning: no previous prototype for function 'arch_release_task_struct' [-Wmissing-prototypes]
   void __weak arch_release_task_struct(struct task_struct *tsk)
               ^
   kernel/fork.c:163:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_release_task_struct(struct task_struct *tsk)
   ^
   static 
   kernel/fork.c:854:20: warning: no previous prototype for function 'arch_task_cache_init' [-Wmissing-prototypes]
   void __init __weak arch_task_cache_init(void) { }
                      ^
   kernel/fork.c:854:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak arch_task_cache_init(void) { }
   ^
   static 
   kernel/fork.c:949:12: warning: no previous prototype for function 'arch_dup_task_struct' [-Wmissing-prototypes]
   int __weak arch_dup_task_struct(struct task_struct *dst,
              ^
   kernel/fork.c:949:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_dup_task_struct(struct task_struct *dst,
   ^
   static 
   3 warnings and 1 error generated.
--
   In file included from mm/shmem.c:37:
   In file included from include/linux/khugepaged.h:6:
   In file included from include/linux/shmem_fs.h:12:
>> include/linux/memfile_notifier.h:87:57: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   static int memfile_register_notifier(struct file *file, flags,
                                                           ^
                                                           int
   In file included from mm/shmem.c:55:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/int +87 include/linux/memfile_notifier.h

07b4263e3099f7 Chao Peng 2022-01-12  86  
07b4263e3099f7 Chao Peng 2022-01-12 @87  static int memfile_register_notifier(struct file *file, flags,
07b4263e3099f7 Chao Peng 2022-01-12  88  				     struct memfile_notifier *notifier)
07b4263e3099f7 Chao Peng 2022-01-12  89  {
07b4263e3099f7 Chao Peng 2022-01-12  90  	return -EOPNOTSUPP;
07b4263e3099f7 Chao Peng 2022-01-12  91  }
07b4263e3099f7 Chao Peng 2022-01-12  92  

:::::: The code at line 87 was first introduced by commit
:::::: 07b4263e3099f776c35284155851f0e202b12a44 mm: Introduce memfile_notifier

:::::: TO: Chao Peng <chao.p.peng@linux.intel.com>
:::::: CC: Isaku Yamahata <isaku.yamahata@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
