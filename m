Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEA97F;
	Thu,  6 Jul 2023 01:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688605573; x=1720141573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0J+THu6pCsBQCm37A5bOmRK72V/zeflPXlZ/3AuPdcE=;
  b=lL8/tWLyRHS1YBFGdAwwwQGrv4wc+blQL/VmdFx1iSVTXTcO1r/0ARxZ
   Yw2eLZPPGURCD/m/49V0NwAQUHflvSwVU/IR0CcUBTqeagf4NAklb5UEr
   ybeIuNcxb2yAuyNd+9cRMpwHD7yvlh+42mBHvP3QCUsHS6gipIaw2K31r
   OgQEhNWmi0Npg7eiQDVeH2gfYowlNthoFXV833MwXpOGOysW58yxtP9+z
   VAQTM6+p6dVBGD9C44bTV6r95Gj6aGpRWlcLpCjAmsbClh78JL7ayiWr/
   epOdinyhk4M+GFBBDn22a2SWLZBNzdcf0d+ZgKBI/wL4/JASbpGemlenY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="348263828"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="348263828"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 18:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="719423729"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="719423729"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Jul 2023 18:06:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHDRi-0000va-0I;
	Thu, 06 Jul 2023 01:06:10 +0000
Date: Thu, 6 Jul 2023 09:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 9/19] kernel/kexec.c:33:16: error: call
 to undeclared function 'phys_to_boot_phys'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202307060910.qHHF6BKp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   dafc95d811f426078ef86cbbbb995055280e415e
commit: e92bee18ff7a05e2f59f4135d10067dcefb3e861 [9/19] arm/kexec: refactor for kernel/Kconfig.kexec
config: arm-randconfig-r046-20230706 (https://download.01.org/0day-ci/archive/20230706/202307060910.qHHF6BKp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060910.qHHF6BKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060910.qHHF6BKp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/kexec.c:33:16: error: call to undeclared function 'phys_to_boot_phys'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |                 if ((entry < phys_to_boot_phys(crashk_res.start)) ||
         |                              ^
>> kernel/kexec.c:43:7: error: incomplete definition of type 'struct kimage'
      43 |         image->start = entry;
         |         ~~~~~^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
   kernel/kexec.c:44:7: error: incomplete definition of type 'struct kimage'
      44 |         image->nr_segments = nr_segments;
         |         ~~~~~^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
>> kernel/kexec.c:45:55: error: invalid application of 'sizeof' to an incomplete type 'struct kexec_segment'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |                                                              ^~~~~~~~~~~
   include/linux/fortify-string.h:693:53: note: expanded from macro 'memcpy'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                                                     ^
   include/linux/fortify-string.h:636:41: note: expanded from macro '__fortify_memcpy_chk'
     636 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   include/linux/syscalls.h:20:8: note: forward declaration of 'struct kexec_segment'
      20 | struct kexec_segment;
         |        ^
   kernel/kexec.c:45:14: error: incomplete definition of type 'struct kimage'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |                ~~~~~^
   include/linux/fortify-string.h:694:17: note: expanded from macro 'memcpy'
     694 |                 __struct_size(p), __struct_size(q),                     \
         |                               ^
   include/linux/fortify-string.h:96:56: note: expanded from macro '__struct_size'
      96 | #define __struct_size(p)        __builtin_dynamic_object_size(p, 0)
         |                                                               ^
   include/linux/fortify-string.h:637:27: note: expanded from macro '__fortify_memcpy_chk'
     637 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
   kernel/kexec.c:45:14: error: incomplete definition of type 'struct kimage'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |                ~~~~~^
   include/linux/fortify-string.h:695:17: note: expanded from macro 'memcpy'
     695 |                 __member_size(p), __member_size(q),                     \
         |                               ^
   include/linux/fortify-string.h:97:56: note: expanded from macro '__member_size'
      97 | #define __member_size(p)        __builtin_dynamic_object_size(p, 1)
         |                                                               ^
   include/linux/fortify-string.h:639:33: note: expanded from macro '__fortify_memcpy_chk'
     639 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
   kernel/kexec.c:45:14: error: incomplete definition of type 'struct kimage'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |                ~~~~~^
   include/linux/fortify-string.h:693:47: note: expanded from macro 'memcpy'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                                               ^
   include/linux/fortify-string.h:648:20: note: expanded from macro '__fortify_memcpy_chk'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |                           ^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
   kernel/kexec.c:49:8: error: incomplete definition of type 'struct kimage'
      49 |                 image->control_page = crashk_res.start;
         |                 ~~~~~^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
   kernel/kexec.c:50:8: error: incomplete definition of type 'struct kimage'
      50 |                 image->type = KEXEC_TYPE_CRASH;
         |                 ~~~~~^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
>> kernel/kexec.c:50:17: error: use of undeclared identifier 'KEXEC_TYPE_CRASH'
      50 |                 image->type = KEXEC_TYPE_CRASH;
         |                               ^
   kernel/kexec.c:63:7: error: incomplete definition of type 'struct kimage'
      63 |         image->control_code_page = kimage_alloc_control_pages(image,
         |         ~~~~~^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
>> kernel/kexec.c:63:29: error: call to undeclared function 'kimage_alloc_control_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         image->control_code_page = kimage_alloc_control_pages(image,
         |                                    ^
>> kernel/kexec.c:64:19: error: use of undeclared identifier 'KEXEC_CONTROL_PAGE_SIZE'
      64 |                                            get_order(KEXEC_CONTROL_PAGE_SIZE));
         |                                                      ^
   kernel/kexec.c:65:12: error: incomplete definition of type 'struct kimage'
      65 |         if (!image->control_code_page) {
         |              ~~~~~^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
   kernel/kexec.c:71:8: error: incomplete definition of type 'struct kimage'
      71 |                 image->swap_page = kimage_alloc_control_pages(image, 0);
         |                 ~~~~~^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
   kernel/kexec.c:72:13: error: incomplete definition of type 'struct kimage'
      72 |                 if (!image->swap_page) {
         |                      ~~~~~^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
   kernel/kexec.c:81:30: error: incomplete definition of type 'struct kimage'
      81 |         kimage_free_page_list(&image->control_pages);
         |                                ~~~~~^
   kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
       7 | struct kimage *do_kimage_alloc_init(void);
         |        ^
>> kernel/kexec.c:103:17: error: use of undeclared identifier 'kexec_crash_image'; did you mean 'kexec_crash_loaded'?
     103 |                 dest_image = &kexec_crash_image;
         |                               ^~~~~~~~~~~~~~~~~
         |                               kexec_crash_loaded
   include/linux/kexec.h:499:19: note: 'kexec_crash_loaded' declared here
     499 | static inline int kexec_crash_loaded(void) { return 0; }
         |                   ^
   kernel/kexec.c:104:7: error: use of undeclared identifier 'kexec_crash_image'; did you mean 'kexec_crash_loaded'?
     104 |                 if (kexec_crash_image)
         |                     ^~~~~~~~~~~~~~~~~
         |                     kexec_crash_loaded
   include/linux/kexec.h:499:19: note: 'kexec_crash_loaded' declared here
     499 | static inline int kexec_crash_loaded(void) { return 0; }
         |                   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> arch/arm/kernel/machine_kexec.c:33:34: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      33 | int machine_kexec_prepare(struct kimage *image)
         |                                  ^
>> arch/arm/kernel/machine_kexec.c:39:7: error: incomplete definition of type 'struct kimage'
      39 |         image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
         |         ~~~~~^
   arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
      33 | int machine_kexec_prepare(struct kimage *image)
         |                                  ^
   arch/arm/kernel/machine_kexec.c:39:31: error: incomplete definition of type 'struct kimage'
      39 |         image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
         |                                 ~~~~~^
   arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
      33 | int machine_kexec_prepare(struct kimage *image)
         |                                  ^
>> arch/arm/kernel/machine_kexec.c:39:41: error: use of undeclared identifier 'KEXEC_ARM_ZIMAGE_OFFSET'
      39 |         image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
         |                                                ^
>> arch/arm/kernel/machine_kexec.c:40:12: error: use of undeclared identifier 'KEXEC_ARM_ATAGS_OFFSET'
      40 |                                      + KEXEC_ARM_ATAGS_OFFSET;
         |                                        ^
   arch/arm/kernel/machine_kexec.c:55:23: error: incomplete definition of type 'struct kimage'
      55 |         for (i = 0; i < image->nr_segments; i++) {
         |                         ~~~~~^
   arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
      33 | int machine_kexec_prepare(struct kimage *image)
         |                                  ^
   arch/arm/kernel/machine_kexec.c:56:27: error: incomplete definition of type 'struct kimage'
      56 |                 current_segment = &image->segment[i];
         |                                    ~~~~~^
   arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
      33 | int machine_kexec_prepare(struct kimage *image)
         |                                  ^
>> arch/arm/kernel/machine_kexec.c:58:63: error: incomplete definition of type 'struct kexec_segment'
      58 |                 if (!memblock_is_region_memory(idmap_to_phys(current_segment->mem),
         |                                                              ~~~~~~~~~~~~~~~^
   arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
      35 |         struct kexec_segment *current_segment;
         |                ^
   arch/arm/kernel/machine_kexec.c:59:28: error: incomplete definition of type 'struct kexec_segment'
      59 |                                                current_segment->memsz))
         |                                                ~~~~~~~~~~~~~~~^
   arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
      35 |         struct kexec_segment *current_segment;
         |                ^
   arch/arm/kernel/machine_kexec.c:62:50: error: incomplete definition of type 'struct kexec_segment'
      62 |                 err = get_user(header, (__be32*)current_segment->buf);
         |                                                 ~~~~~~~~~~~~~~~^
   arch/arm/include/asm/uaccess.h:229:38: note: expanded from macro 'get_user'
     229 | #define get_user(x, p)  __get_user(x, p)
         |                                       ^
   arch/arm/include/asm/uaccess.h:258:23: note: expanded from macro '__get_user'
     258 |         __get_user_err((x), (ptr), __gu_err, TUSER());                  \
         |                              ^~~
   arch/arm/include/asm/uaccess.h:264:44: note: expanded from macro '__get_user_err'
     264 |         unsigned long __gu_addr = (unsigned long)(ptr);                 \
         |                                                   ^~~
   arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
      35 |         struct kexec_segment *current_segment;
         |                ^
   arch/arm/kernel/machine_kexec.c:62:50: error: incomplete definition of type 'struct kexec_segment'
      62 |                 err = get_user(header, (__be32*)current_segment->buf);
         |                                                 ~~~~~~~~~~~~~~~^
   arch/arm/include/asm/uaccess.h:229:38: note: expanded from macro 'get_user'
     229 | #define get_user(x, p)  __get_user(x, p)
         |                                       ^
   arch/arm/include/asm/uaccess.h:258:23: note: expanded from macro '__get_user'
     258 |         __get_user_err((x), (ptr), __gu_err, TUSER());                  \
         |                              ^~~
   arch/arm/include/asm/uaccess.h:270:19: note: expanded from macro '__get_user_err'
     270 |         switch (sizeof(*(ptr))) {                                       \
         |                          ^~~
   arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
      35 |         struct kexec_segment *current_segment;
         |                ^
   arch/arm/kernel/machine_kexec.c:62:50: error: incomplete definition of type 'struct kexec_segment'
      62 |                 err = get_user(header, (__be32*)current_segment->buf);
         |                                                 ~~~~~~~~~~~~~~~^
   arch/arm/include/asm/uaccess.h:229:38: note: expanded from macro 'get_user'
     229 | #define get_user(x, p)  __get_user(x, p)
         |                                       ^
   arch/arm/include/asm/uaccess.h:258:23: note: expanded from macro '__get_user'
     258 |         __get_user_err((x), (ptr), __gu_err, TUSER());                  \
         |                              ^~~
   arch/arm/include/asm/uaccess.h:277:22: note: expanded from macro '__get_user_err'
     277 |         (x) = (__typeof__(*(ptr)))__gu_val;                             \
         |                             ^~~
   arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
      35 |         struct kexec_segment *current_segment;
         |                ^
   arch/arm/kernel/machine_kexec.c:67:9: error: incomplete definition of type 'struct kimage'
      67 |                         image->arch.kernel_r2 = current_segment->mem;
         |                         ~~~~~^
   arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
      33 | int machine_kexec_prepare(struct kimage *image)
         |                                  ^
   arch/arm/kernel/machine_kexec.c:67:43: error: incomplete definition of type 'struct kexec_segment'
      67 |                         image->arch.kernel_r2 = current_segment->mem;
         |                                                 ~~~~~~~~~~~~~~~^
   arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
      35 |         struct kexec_segment *current_segment;
         |                ^
>> arch/arm/kernel/machine_kexec.c:33:5: warning: no previous prototype for function 'machine_kexec_prepare' [-Wmissing-prototypes]
      33 | int machine_kexec_prepare(struct kimage *image)
         |     ^
   arch/arm/kernel/machine_kexec.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | int machine_kexec_prepare(struct kimage *image)
         | ^
         | static 
   arch/arm/kernel/machine_kexec.c:72:35: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
      72 | void machine_kexec_cleanup(struct kimage *image)
         |                                   ^
>> arch/arm/kernel/machine_kexec.c:72:6: warning: no previous prototype for function 'machine_kexec_cleanup' [-Wmissing-prototypes]
      72 | void machine_kexec_cleanup(struct kimage *image)
         |      ^
   arch/arm/kernel/machine_kexec.c:72:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      72 | void machine_kexec_cleanup(struct kimage *image)
         | ^
         | static 
>> arch/arm/kernel/machine_kexec.c:82:2: error: call to undeclared function 'crash_setup_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      82 |         crash_setup_regs(&regs, get_irq_regs());
         |         ^
>> arch/arm/kernel/machine_kexec.c:85:2: error: call to undeclared function 'crash_save_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      85 |         crash_save_cpu(&regs, smp_processor_id());
         |         ^
   arch/arm/kernel/machine_kexec.c:146:2: error: call to undeclared function 'crash_save_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |         crash_save_cpu(regs, smp_processor_id());
         |         ^
   arch/arm/kernel/machine_kexec.c:152:27: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
     152 | void machine_kexec(struct kimage *image)
         |                           ^
   arch/arm/kernel/machine_kexec.c:167:19: error: incomplete definition of type 'struct kimage'
     167 |         page_list = image->head & PAGE_MASK;
         |                     ~~~~~^
   arch/arm/kernel/machine_kexec.c:152:27: note: forward declaration of 'struct kimage'
     152 | void machine_kexec(struct kimage *image)
         |                           ^
   arch/arm/kernel/machine_kexec.c:169:41: error: incomplete definition of type 'struct kimage'
     169 |         reboot_code_buffer = page_address(image->control_code_page);
         |                                           ~~~~~^
   include/linux/mm.h:2144:48: note: expanded from macro 'page_address'
    2144 | #define page_address(page) lowmem_page_address(page)
         |                                                ^~~~
   arch/arm/kernel/machine_kexec.c:152:27: note: forward declaration of 'struct kimage'
     152 | void machine_kexec(struct kimage *image)
         |                           ^
   arch/arm/kernel/machine_kexec.c:177:35: error: incomplete definition of type 'struct kimage'
     177 |         data->kexec_start_address = image->start;
         |                                     ~~~~~^
   arch/arm/kernel/machine_kexec.c:152:27: note: forward declaration of 'struct kimage'
     152 | void machine_kexec(struct kimage *image)
         |                           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   5 warnings and 20 errors generated.
--
>> arch/arm/kernel/setup.c:1034:49: error: use of undeclared identifier 'SECTION_SIZE'
    1034 |                 start = memblock_phys_alloc_range(crash_size, SECTION_SIZE,
         |                                                               ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for KEXEC
   Depends on [n]: ARCH_SUPPORTS_KEXEC [=n]
   Selected by [y]:
   - CRASH_DUMP [=y] && ARCH_SUPPORTS_CRASH_DUMP [=y]


vim +/phys_to_boot_phys +33 kernel/kexec.c

a43cac0d9dc207 Dave Young         2015-09-09   21  
255aedd90e3e80 Vivek Goyal        2014-08-08   22  static int kimage_alloc_init(struct kimage **rimage, unsigned long entry,
72414d3f1d22fc Maneesh Soni       2005-06-25   23  			     unsigned long nr_segments,
5d700a0fd71ded Arnd Bergmann      2021-09-08   24  			     struct kexec_segment *segments,
255aedd90e3e80 Vivek Goyal        2014-08-08   25  			     unsigned long flags)
dc009d92435f99 Eric W. Biederman  2005-06-25   26  {
255aedd90e3e80 Vivek Goyal        2014-08-08   27  	int ret;
dc009d92435f99 Eric W. Biederman  2005-06-25   28  	struct kimage *image;
255aedd90e3e80 Vivek Goyal        2014-08-08   29  	bool kexec_on_panic = flags & KEXEC_ON_CRASH;
255aedd90e3e80 Vivek Goyal        2014-08-08   30  
255aedd90e3e80 Vivek Goyal        2014-08-08   31  	if (kexec_on_panic) {
255aedd90e3e80 Vivek Goyal        2014-08-08   32  		/* Verify we have a valid entry point */
43546d8669d62d Russell King       2016-08-02  @33  		if ((entry < phys_to_boot_phys(crashk_res.start)) ||
43546d8669d62d Russell King       2016-08-02   34  		    (entry > phys_to_boot_phys(crashk_res.end)))
255aedd90e3e80 Vivek Goyal        2014-08-08   35  			return -EADDRNOTAVAIL;
255aedd90e3e80 Vivek Goyal        2014-08-08   36  	}
dc009d92435f99 Eric W. Biederman  2005-06-25   37  
dc009d92435f99 Eric W. Biederman  2005-06-25   38  	/* Allocate and initialize a controlling structure */
dabe78628dd886 Vivek Goyal        2014-08-08   39  	image = do_kimage_alloc_init();
dabe78628dd886 Vivek Goyal        2014-08-08   40  	if (!image)
dabe78628dd886 Vivek Goyal        2014-08-08   41  		return -ENOMEM;
dabe78628dd886 Vivek Goyal        2014-08-08   42  
dabe78628dd886 Vivek Goyal        2014-08-08  @43  	image->start = entry;
5d700a0fd71ded Arnd Bergmann      2021-09-08  @44  	image->nr_segments = nr_segments;
5d700a0fd71ded Arnd Bergmann      2021-09-08  @45  	memcpy(image->segment, segments, nr_segments * sizeof(*segments));
dabe78628dd886 Vivek Goyal        2014-08-08   46  
255aedd90e3e80 Vivek Goyal        2014-08-08   47  	if (kexec_on_panic) {
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   48  		/* Enable special crash kernel control page alloc policy. */
255aedd90e3e80 Vivek Goyal        2014-08-08   49  		image->control_page = crashk_res.start;
255aedd90e3e80 Vivek Goyal        2014-08-08  @50  		image->type = KEXEC_TYPE_CRASH;
255aedd90e3e80 Vivek Goyal        2014-08-08   51  	}
255aedd90e3e80 Vivek Goyal        2014-08-08   52  
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   53  	ret = sanity_check_segment_list(image);
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   54  	if (ret)
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   55  		goto out_free_image;
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   56  
dc009d92435f99 Eric W. Biederman  2005-06-25   57  	/*
dc009d92435f99 Eric W. Biederman  2005-06-25   58  	 * Find a location for the control code buffer, and add it
dc009d92435f99 Eric W. Biederman  2005-06-25   59  	 * the vector of segments so that it's pages will also be
dc009d92435f99 Eric W. Biederman  2005-06-25   60  	 * counted as destination pages.
dc009d92435f99 Eric W. Biederman  2005-06-25   61  	 */
255aedd90e3e80 Vivek Goyal        2014-08-08   62  	ret = -ENOMEM;
dc009d92435f99 Eric W. Biederman  2005-06-25  @63  	image->control_code_page = kimage_alloc_control_pages(image,
163f6876f5c3ff Huang Ying         2008-08-15  @64  					   get_order(KEXEC_CONTROL_PAGE_SIZE));
dc009d92435f99 Eric W. Biederman  2005-06-25   65  	if (!image->control_code_page) {
e1bebcf41ed0aa Fabian Frederick   2014-06-06   66  		pr_err("Could not allocate control_code_buffer\n");
2965faa5e03d1e Dave Young         2015-09-09   67  		goto out_free_image;
dc009d92435f99 Eric W. Biederman  2005-06-25   68  	}
dd5f726076cc76 Vivek Goyal        2014-08-08   69  
2965faa5e03d1e Dave Young         2015-09-09   70  	if (!kexec_on_panic) {
2965faa5e03d1e Dave Young         2015-09-09   71  		image->swap_page = kimage_alloc_control_pages(image, 0);
2965faa5e03d1e Dave Young         2015-09-09   72  		if (!image->swap_page) {
2965faa5e03d1e Dave Young         2015-09-09   73  			pr_err("Could not allocate swap buffer\n");
2965faa5e03d1e Dave Young         2015-09-09   74  			goto out_free_control_pages;
dc009d92435f99 Eric W. Biederman  2005-06-25   75  		}
dc009d92435f99 Eric W. Biederman  2005-06-25   76  	}
72414d3f1d22fc Maneesh Soni       2005-06-25   77  
2965faa5e03d1e Dave Young         2015-09-09   78  	*rimage = image;
2965faa5e03d1e Dave Young         2015-09-09   79  	return 0;
2965faa5e03d1e Dave Young         2015-09-09   80  out_free_control_pages:
2965faa5e03d1e Dave Young         2015-09-09  @81  	kimage_free_page_list(&image->control_pages);
2965faa5e03d1e Dave Young         2015-09-09   82  out_free_image:
2965faa5e03d1e Dave Young         2015-09-09   83  	kfree(image);
2965faa5e03d1e Dave Young         2015-09-09   84  	return ret;
dc009d92435f99 Eric W. Biederman  2005-06-25   85  }
dc009d92435f99 Eric W. Biederman  2005-06-25   86  
0eea08678ebe9f Minfei Huang       2016-05-23   87  static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
5d700a0fd71ded Arnd Bergmann      2021-09-08   88  		struct kexec_segment *segments, unsigned long flags)
0eea08678ebe9f Minfei Huang       2016-05-23   89  {
0eea08678ebe9f Minfei Huang       2016-05-23   90  	struct kimage **dest_image, *image;
0eea08678ebe9f Minfei Huang       2016-05-23   91  	unsigned long i;
0eea08678ebe9f Minfei Huang       2016-05-23   92  	int ret;
0eea08678ebe9f Minfei Huang       2016-05-23   93  
4b692e86161935 Arnd Bergmann      2021-09-08   94  	/*
4b692e86161935 Arnd Bergmann      2021-09-08   95  	 * Because we write directly to the reserved memory region when loading
05c6257433b721 Valentin Schneider 2022-06-30   96  	 * crash kernels we need a serialization here to prevent multiple crash
05c6257433b721 Valentin Schneider 2022-06-30   97  	 * kernels from attempting to load simultaneously.
4b692e86161935 Arnd Bergmann      2021-09-08   98  	 */
05c6257433b721 Valentin Schneider 2022-06-30   99  	if (!kexec_trylock())
4b692e86161935 Arnd Bergmann      2021-09-08  100  		return -EBUSY;
4b692e86161935 Arnd Bergmann      2021-09-08  101  
0eea08678ebe9f Minfei Huang       2016-05-23  102  	if (flags & KEXEC_ON_CRASH) {
0eea08678ebe9f Minfei Huang       2016-05-23 @103  		dest_image = &kexec_crash_image;
0eea08678ebe9f Minfei Huang       2016-05-23  104  		if (kexec_crash_image)
0eea08678ebe9f Minfei Huang       2016-05-23  105  			arch_kexec_unprotect_crashkres();
0eea08678ebe9f Minfei Huang       2016-05-23  106  	} else {
0eea08678ebe9f Minfei Huang       2016-05-23  107  		dest_image = &kexec_image;
0eea08678ebe9f Minfei Huang       2016-05-23  108  	}
0eea08678ebe9f Minfei Huang       2016-05-23  109  
0eea08678ebe9f Minfei Huang       2016-05-23  110  	if (nr_segments == 0) {
0eea08678ebe9f Minfei Huang       2016-05-23  111  		/* Uninstall image */
0eea08678ebe9f Minfei Huang       2016-05-23  112  		kimage_free(xchg(dest_image, NULL));
4b692e86161935 Arnd Bergmann      2021-09-08  113  		ret = 0;
4b692e86161935 Arnd Bergmann      2021-09-08  114  		goto out_unlock;
0eea08678ebe9f Minfei Huang       2016-05-23  115  	}
0eea08678ebe9f Minfei Huang       2016-05-23  116  	if (flags & KEXEC_ON_CRASH) {
0eea08678ebe9f Minfei Huang       2016-05-23  117  		/*
0eea08678ebe9f Minfei Huang       2016-05-23  118  		 * Loading another kernel to switch to if this one
0eea08678ebe9f Minfei Huang       2016-05-23  119  		 * crashes.  Free any current crash dump kernel before
0eea08678ebe9f Minfei Huang       2016-05-23  120  		 * we corrupt it.
0eea08678ebe9f Minfei Huang       2016-05-23  121  		 */
0eea08678ebe9f Minfei Huang       2016-05-23  122  		kimage_free(xchg(&kexec_crash_image, NULL));
0eea08678ebe9f Minfei Huang       2016-05-23  123  	}
0eea08678ebe9f Minfei Huang       2016-05-23  124  
0eea08678ebe9f Minfei Huang       2016-05-23  125  	ret = kimage_alloc_init(&image, entry, nr_segments, segments, flags);
0eea08678ebe9f Minfei Huang       2016-05-23  126  	if (ret)
4b692e86161935 Arnd Bergmann      2021-09-08  127  		goto out_unlock;
0eea08678ebe9f Minfei Huang       2016-05-23  128  
0eea08678ebe9f Minfei Huang       2016-05-23  129  	if (flags & KEXEC_PRESERVE_CONTEXT)
0eea08678ebe9f Minfei Huang       2016-05-23  130  		image->preserve_context = 1;
0eea08678ebe9f Minfei Huang       2016-05-23  131  
0eea08678ebe9f Minfei Huang       2016-05-23  132  	ret = machine_kexec_prepare(image);
0eea08678ebe9f Minfei Huang       2016-05-23  133  	if (ret)
0eea08678ebe9f Minfei Huang       2016-05-23  134  		goto out;
0eea08678ebe9f Minfei Huang       2016-05-23  135  
1229384f5b856d Xunlei Pang        2017-07-12  136  	/*
1229384f5b856d Xunlei Pang        2017-07-12  137  	 * Some architecture(like S390) may touch the crash memory before
1229384f5b856d Xunlei Pang        2017-07-12  138  	 * machine_kexec_prepare(), we must copy vmcoreinfo data after it.
1229384f5b856d Xunlei Pang        2017-07-12  139  	 */
1229384f5b856d Xunlei Pang        2017-07-12  140  	ret = kimage_crash_copy_vmcoreinfo(image);
1229384f5b856d Xunlei Pang        2017-07-12  141  	if (ret)
1229384f5b856d Xunlei Pang        2017-07-12  142  		goto out;
1229384f5b856d Xunlei Pang        2017-07-12  143  
0eea08678ebe9f Minfei Huang       2016-05-23  144  	for (i = 0; i < nr_segments; i++) {
0eea08678ebe9f Minfei Huang       2016-05-23  145  		ret = kimage_load_segment(image, &image->segment[i]);
0eea08678ebe9f Minfei Huang       2016-05-23  146  		if (ret)
0eea08678ebe9f Minfei Huang       2016-05-23  147  			goto out;
0eea08678ebe9f Minfei Huang       2016-05-23  148  	}
0eea08678ebe9f Minfei Huang       2016-05-23  149  
0eea08678ebe9f Minfei Huang       2016-05-23  150  	kimage_terminate(image);
0eea08678ebe9f Minfei Huang       2016-05-23  151  
de68e4daea9084 Pavel Tatashin     2019-12-04  152  	ret = machine_kexec_post_load(image);
de68e4daea9084 Pavel Tatashin     2019-12-04  153  	if (ret)
de68e4daea9084 Pavel Tatashin     2019-12-04  154  		goto out;
de68e4daea9084 Pavel Tatashin     2019-12-04  155  
0eea08678ebe9f Minfei Huang       2016-05-23  156  	/* Install the new kernel and uninstall the old */
0eea08678ebe9f Minfei Huang       2016-05-23  157  	image = xchg(dest_image, image);
0eea08678ebe9f Minfei Huang       2016-05-23  158  
0eea08678ebe9f Minfei Huang       2016-05-23  159  out:
0eea08678ebe9f Minfei Huang       2016-05-23  160  	if ((flags & KEXEC_ON_CRASH) && kexec_crash_image)
0eea08678ebe9f Minfei Huang       2016-05-23  161  		arch_kexec_protect_crashkres();
0eea08678ebe9f Minfei Huang       2016-05-23  162  
0eea08678ebe9f Minfei Huang       2016-05-23  163  	kimage_free(image);
4b692e86161935 Arnd Bergmann      2021-09-08  164  out_unlock:
05c6257433b721 Valentin Schneider 2022-06-30  165  	kexec_unlock();
0eea08678ebe9f Minfei Huang       2016-05-23  166  	return ret;
0eea08678ebe9f Minfei Huang       2016-05-23  167  }
0eea08678ebe9f Minfei Huang       2016-05-23  168  

:::::: The code at line 33 was first introduced by commit
:::::: 43546d8669d62d75fa69ca9a45d2f586665f56bd kexec: allow architectures to override boot mapping

:::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
