Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39947F;
	Fri,  3 Feb 2023 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675411429; x=1706947429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WaZgaU2c/CPI/hqPNvAwCvNlyGC1iJ9BWx5/5m8L1kc=;
  b=Lub0l0R7df31i5QMs55+mtwhpowLDAuTYiaL1JZssZNO4w59eclmq80y
   EoSvusGqDyTUmdmDEZNsJ8vo/hE1eTwe0W3HHDWupG8rAxwv9jdKiKUkk
   FQdjH5KocVSTUalij5N0YLreY+bGetpVI3Udn/UpJLWx8N5Uy+6ceUSQN
   PBVCysLHLYrTTSITBGpZ7zLyrNH7ebOzWqdHf8EZCyAXHEId2aiqfL2ko
   2TqqUdWmHxVsEIgvA95F/bNFerogBtjEhi8VIEKbkomQkJhKoinpiujBv
   t0zEFPqAs6YbEZ5zTBaEVUq0qGCjaysMhlVn/34W3LWH4Navsq7H10Jk2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="312345133"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="312345133"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 00:03:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="665619696"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; 
   d="scan'208";a="665619696"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Feb 2023 00:03:47 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNr2x-0000I5-00;
	Fri, 03 Feb 2023 08:03:47 +0000
Date: Fri, 3 Feb 2023 16:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 6/25]
 arch/arm/include/asm/pgtable-nommu.h:49:9: error: 'ZERO_PAGE' macro
 redefined
Message-ID: <202302031651.yFFP0HfX-lkp@intel.com>
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
commit: 2472f5903b11b4362be6823cdb6e0937b719aa99 [6/25] ARM: mm: Make virt_to_pfn() a static inline
config: arm-randconfig-r013-20230202 (https://download.01.org/0day-ci/archive/20230203/202302031651.yFFP0HfX-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=2472f5903b11b4362be6823cdb6e0937b719aa99
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout 2472f5903b11b4362be6823cdb6e0937b719aa99
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/tilcdc/ fs/cifs/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   1 warning generated.
--
   In file included from mm/filemap.c:15:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   mm/filemap.c:2202:6: warning: unused function 'folio_more_pages' [-Wunused-function]
   bool folio_more_pages(struct folio *folio, pgoff_t index, pgoff_t max)
        ^
   2 warnings generated.
--
   In file included from mm/shmem.c:28:
   In file included from include/linux/ramfs.h:5:
   In file included from include/linux/fs_parser.h:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   mm/shmem.c:4159:13: warning: no previous prototype for function 'shmem_init' [-Wmissing-prototypes]
   void __init shmem_init(void)
               ^
   mm/shmem.c:4159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init shmem_init(void)
   ^
   static 
   mm/shmem.c:4167:5: warning: no previous prototype for function 'shmem_unuse' [-Wmissing-prototypes]
   int shmem_unuse(unsigned int type)
       ^
   mm/shmem.c:4167:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int shmem_unuse(unsigned int type)
   ^
   static 
   mm/shmem.c:4172:5: warning: no previous prototype for function 'shmem_lock' [-Wmissing-prototypes]
   int shmem_lock(struct file *file, int lock, struct ucounts *ucounts)
       ^
   mm/shmem.c:4172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int shmem_lock(struct file *file, int lock, struct ucounts *ucounts)
   ^
   static 
   mm/shmem.c:4177:6: warning: no previous prototype for function 'shmem_unlock_mapping' [-Wmissing-prototypes]
   void shmem_unlock_mapping(struct address_space *mapping)
        ^
   mm/shmem.c:4177:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void shmem_unlock_mapping(struct address_space *mapping)
   ^
   static 
   mm/shmem.c:4190:6: warning: no previous prototype for function 'shmem_truncate_range' [-Wmissing-prototypes]
   void shmem_truncate_range(struct inode *inode, loff_t lstart, loff_t lend)
        ^
   mm/shmem.c:4190:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void shmem_truncate_range(struct inode *inode, loff_t lstart, loff_t lend)
   ^
   static 
   mm/shmem.c:4250:14: warning: no previous prototype for function 'shmem_kernel_file_setup' [-Wmissing-prototypes]
   struct file *shmem_kernel_file_setup(const char *name, loff_t size, unsigned long flags)
                ^
   mm/shmem.c:4250:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct file *shmem_kernel_file_setup(const char *name, loff_t size, unsigned long flags)
   ^
   static 
   mm/shmem.c:4261:14: warning: no previous prototype for function 'shmem_file_setup' [-Wmissing-prototypes]
   struct file *shmem_file_setup(const char *name, loff_t size, unsigned long flags)
                ^
   mm/shmem.c:4261:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct file *shmem_file_setup(const char *name, loff_t size, unsigned long flags)
   ^
   static 
   mm/shmem.c:4274:14: warning: no previous prototype for function 'shmem_file_setup_with_mnt' [-Wmissing-prototypes]
   struct file *shmem_file_setup_with_mnt(struct vfsmount *mnt, const char *name,
                ^
   mm/shmem.c:4274:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct file *shmem_file_setup_with_mnt(struct vfsmount *mnt, const char *name,
   ^
   static 
   mm/shmem.c:4285:5: warning: no previous prototype for function 'shmem_zero_setup' [-Wmissing-prototypes]
   int shmem_zero_setup(struct vm_area_struct *vma)
       ^
   mm/shmem.c:4285:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int shmem_zero_setup(struct vm_area_struct *vma)
   ^
   static 
   mm/shmem.c:4323:14: warning: no previous prototype for function 'shmem_read_mapping_page_gfp' [-Wmissing-prototypes]
   struct page *shmem_read_mapping_page_gfp(struct address_space *mapping,
                ^
   mm/shmem.c:4323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct page *shmem_read_mapping_page_gfp(struct address_space *mapping,
   ^
   static 
   11 warnings generated.
--
   In file included from mm/list_lru.c:10:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   mm/list_lru.c:98:20: warning: unused function 'list_lru_memcg_aware' [-Wunused-function]
   static inline bool list_lru_memcg_aware(struct list_lru *lru)
                      ^
   2 warnings generated.
--
   In file included from mm/sparse.c:5:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   mm/sparse.c:321:27: warning: unused function 'pgdat_to_phys' [-Wunused-function]
   static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
                             ^
   2 warnings generated.
--
   In file included from mm/page_poison.c:4:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   mm/page_poison.c:102:6: warning: no previous prototype for function '__kernel_map_pages' [-Wmissing-prototypes]
   void __kernel_map_pages(struct page *page, int numpages, int enable)
        ^
   mm/page_poison.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __kernel_map_pages(struct page *page, int numpages, int enable)
   ^
   static 
   2 warnings generated.
--
   In file included from mm/slub.c:13:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   mm/slub.c:2260:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
           unsigned int partial_slabs = 0;
                        ^
   2 warnings generated.
--
   In file included from fs/cifs/cifsfs.c:28:
   In file included from include/linux/xattr.h:18:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   In file included from fs/cifs/cifsfs.c:34:
>> fs/cifs/cifsglob.h:2217:34: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
                   sg_set_page(sg++, virt_to_page(addr), buflen, off);
                                                  ^~~~
   arch/arm/include/asm/memory.h:386:53: note: expanded from macro 'virt_to_page'
   #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
                                                           ^~~~~
   include/asm-generic/memory_model.h:40:27: note: expanded from macro '__pfn_to_page'
   ({      unsigned long __pfn = (pfn);                    \
                                  ^~~
   arch/arm/include/asm/memory.h:292:53: note: passing argument to parameter 'p' here
   static inline unsigned long virt_to_pfn(const void *p)
                                                       ^
   1 warning and 1 error generated.
--
   In file included from fs/cifs/ioctl.c:14:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   In file included from fs/cifs/ioctl.c:17:
>> fs/cifs/cifsglob.h:2217:34: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'const void *' [-Wint-conversion]
                   sg_set_page(sg++, virt_to_page(addr), buflen, off);
                                                  ^~~~
   arch/arm/include/asm/memory.h:386:53: note: expanded from macro 'virt_to_page'
   #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
                                                           ^~~~~
   include/asm-generic/memory_model.h:40:27: note: expanded from macro '__pfn_to_page'
   ({      unsigned long __pfn = (pfn);                    \
                                  ^~~
   arch/arm/include/asm/memory.h:292:53: note: passing argument to parameter 'p' here
   static inline unsigned long virt_to_pfn(const void *p)
                                                       ^
   fs/cifs/ioctl.c:324:10: warning: variable 'caps' set but not used [-Wunused-but-set-variable]
           __u64   caps;
                   ^
   2 warnings and 1 error generated.
--
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
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: error: 'ZERO_PAGE' macro redefined [-Werror,-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   1 error generated.
--
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:29:
   In file included from include/linux/pgtable.h:6:
   In file included from arch/arm/include/asm/pgtable.h:25:
>> arch/arm/include/asm/pgtable-nommu.h:49:9: warning: 'ZERO_PAGE' macro redefined [-Wmacro-redefined]
   #define ZERO_PAGE(vaddr)        (virt_to_page((const void *)0))
           ^
   arch/arm/include/asm/pgtable.h:19:9: note: previous definition is here
   #define ZERO_PAGE(vaddr)        (empty_zero_page)
           ^
   1 warning generated.


vim +/ZERO_PAGE +49 arch/arm/include/asm/pgtable-nommu.h

    44	
    45	/*
    46	 * ZERO_PAGE is a global shared page that is always zero: used
    47	 * for zero-mapped memory areas etc..
    48	 */
  > 49	#define ZERO_PAGE(vaddr)	(virt_to_page((const void *)0))
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
