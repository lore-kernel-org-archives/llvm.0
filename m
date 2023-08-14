Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FBCC8D2;
	Mon, 14 Aug 2023 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692033512; x=1723569512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/Aocnjm/5FBSo5FXQn+DAgHAqNFHCDyGdprXqmcZfs=;
  b=J4qi+1I5NWJ4Xb+9WUhWUKHCuzAuVFfNMT+jVYgsR20iJ8031lWqP2N5
   aeUGVhcfFf7NR5WyetSEXUr80+rCbIIZcKSlWvxQ6hkzUHa6EGKFRzMiS
   kTxQKZf20TFe3DXj4uj02QoJOiPWXNl/ZGw8ejade04BIatCagkFsG487
   nte2b5FikWeiRjIXXyYCy6tlRB+lvshX/iqQvlYgH+Bb/vXe5CjDQxl0r
   M2SE26aiZjh/zVxcaZVme4UCXbrcjJr0/PCddsjc2K3uFytrAvBhV/Bog
   tziJas5i/cHlYJQkCbjCDdoDPPuBkBXqF7ymbz6FyUCaqvp7CKSDac6le
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403077473"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="403077473"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 10:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="857149751"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="857149751"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Aug 2023 10:18:29 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVbD2-0000JF-15;
	Mon, 14 Aug 2023 17:18:28 +0000
Date: Tue, 15 Aug 2023 01:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: [akpm-mm:mm-nonmm-unstable 64/70] kernel/kexec_internal.h:11:54:
 warning: declaration of 'struct kexec_segment' will not be visible outside
 of this function
Message-ID: <202308150125.9sKSupfw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   a9c5ffc5c68640a5ade3d65a43954a0971d8cfd2
commit: 377a4459434f773b98bb898dc81b33fb0e68c7be [64/70] crash: add generic infrastructure for crash hotplug support
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230815/202308150125.9sKSupfw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150125.9sKSupfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150125.9sKSupfw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/crash_core.c:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/crash_core.c:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/crash_core.c:13:
   In file included from include/linux/kexec.h:19:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from kernel/crash_core.c:23:
>> kernel/kexec_internal.h:11:54: warning: declaration of 'struct kexec_segment' will not be visible outside of this function [-Wvisibility]
      11 | int kimage_load_segment(struct kimage *image, struct kexec_segment *segment);
         |                                                      ^
   kernel/crash_core.c:321:40: warning: declaration of 'struct crash_mem' will not be visible outside of this function [-Wvisibility]
     321 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
   kernel/crash_core.c:334:16: error: incomplete definition of type 'struct crash_mem'
     334 |         nr_phdr += mem->nr_ranges;
         |                    ~~~^
   kernel/crash_core.c:321:40: note: forward declaration of 'struct crash_mem'
     321 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
   kernel/crash_core.c:346:25: error: use of undeclared identifier 'ELF_CORE_HEADER_ALIGN'
     346 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
         |                                ^
   kernel/crash_core.c:346:25: error: use of undeclared identifier 'ELF_CORE_HEADER_ALIGN'
   kernel/crash_core.c:396:21: error: incomplete definition of type 'struct crash_mem'
     396 |         for (i = 0; i < mem->nr_ranges; i++) {
         |                         ~~~^
   kernel/crash_core.c:321:40: note: forward declaration of 'struct crash_mem'
     321 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
   kernel/crash_core.c:397:15: error: incomplete definition of type 'struct crash_mem'
     397 |                 mstart = mem->ranges[i].start;
         |                          ~~~^
   kernel/crash_core.c:321:40: note: forward declaration of 'struct crash_mem'
     321 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
   kernel/crash_core.c:398:13: error: incomplete definition of type 'struct crash_mem'
     398 |                 mend = mem->ranges[i].end;
         |                        ~~~^
   kernel/crash_core.c:321:40: note: forward declaration of 'struct crash_mem'
     321 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |                                        ^
   kernel/crash_core.c:321:5: warning: no previous prototype for function 'crash_prepare_elf64_headers' [-Wmissing-prototypes]
     321 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         |     ^
   kernel/crash_core.c:321:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     321 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
         | ^
         | static 
   kernel/crash_core.c:420:36: warning: declaration of 'struct crash_mem' will not be visible outside of this function [-Wvisibility]
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:427:21: error: incomplete definition of type 'struct crash_mem'
     427 |         for (i = 0; i < mem->nr_ranges; i++) {
         |                         ~~~^
   kernel/crash_core.c:420:36: note: forward declaration of 'struct crash_mem'
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:428:14: error: incomplete definition of type 'struct crash_mem'
     428 |                 start = mem->ranges[i].start;
         |                         ~~~^
   kernel/crash_core.c:420:36: note: forward declaration of 'struct crash_mem'
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:429:12: error: incomplete definition of type 'struct crash_mem'
     429 |                 end = mem->ranges[i].end;
         |                       ~~~^
   kernel/crash_core.c:420:36: note: forward declaration of 'struct crash_mem'
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:444:7: error: incomplete definition of type 'struct crash_mem'
     444 |                         mem->ranges[i].start = 0;
         |                         ~~~^
   kernel/crash_core.c:420:36: note: forward declaration of 'struct crash_mem'
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:445:7: error: incomplete definition of type 'struct crash_mem'
     445 |                         mem->ranges[i].end = 0;
         |                         ~~~^
   kernel/crash_core.c:420:36: note: forward declaration of 'struct crash_mem'
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:446:15: error: incomplete definition of type 'struct crash_mem'
     446 |                         if (i < mem->nr_ranges - 1) {
         |                                 ~~~^
   kernel/crash_core.c:420:36: note: forward declaration of 'struct crash_mem'
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:448:24: error: incomplete definition of type 'struct crash_mem'
     448 |                                 for (j = i; j < mem->nr_ranges - 1; j++) {
         |                                                 ~~~^
   kernel/crash_core.c:420:36: note: forward declaration of 'struct crash_mem'
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:449:9: error: incomplete definition of type 'struct crash_mem'
     449 |                                         mem->ranges[j].start =
         |                                         ~~~^
   kernel/crash_core.c:420:36: note: forward declaration of 'struct crash_mem'
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:450:10: error: incomplete definition of type 'struct crash_mem'
     450 |                                                 mem->ranges[j+1].start;
         |                                                 ~~~^
   kernel/crash_core.c:420:36: note: forward declaration of 'struct crash_mem'
     420 | int crash_exclude_mem_range(struct crash_mem *mem,
         |                                    ^
   kernel/crash_core.c:451:9: error: incomplete definition of type 'struct crash_mem'
     451 |                                         mem->ranges[j].end =
         |                                         ~~~^


vim +11 kernel/kexec_internal.h

a43cac0d9dc207 Dave Young 2015-09-09   6  
a43cac0d9dc207 Dave Young 2015-09-09   7  struct kimage *do_kimage_alloc_init(void);
a43cac0d9dc207 Dave Young 2015-09-09   8  int sanity_check_segment_list(struct kimage *image);
a43cac0d9dc207 Dave Young 2015-09-09   9  void kimage_free_page_list(struct list_head *list);
a43cac0d9dc207 Dave Young 2015-09-09  10  void kimage_free(struct kimage *image);
a43cac0d9dc207 Dave Young 2015-09-09 @11  int kimage_load_segment(struct kimage *image, struct kexec_segment *segment);
a43cac0d9dc207 Dave Young 2015-09-09  12  void kimage_terminate(struct kimage *image);
a43cac0d9dc207 Dave Young 2015-09-09  13  int kimage_is_destination_range(struct kimage *image,
a43cac0d9dc207 Dave Young 2015-09-09  14  				unsigned long start, unsigned long end);
a43cac0d9dc207 Dave Young 2015-09-09  15  

:::::: The code at line 11 was first introduced by commit
:::::: a43cac0d9dc2073ff2245a171429ddbe1accece7 kexec: split kexec_file syscall code to kexec_file.c

:::::: TO: Dave Young <dyoung@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
