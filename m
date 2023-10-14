Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0D87E;
	Sat, 14 Oct 2023 01:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUjEQlZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697248522; x=1728784522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J6zf++fblF9zVK/VdNrlsgMNN5owZBHMacaMbFaTC4Y=;
  b=BUjEQlZY/ES3HA6kBNp86Dm2nhehPtHZ0lA4mSojyhxWaD6isWTcVpfS
   uqgv5LWVdZtv7ZmcIqnlhIrxLtacs/T4RdKMrYF+bcGh+cUAP7InX2dJ6
   YENclOEtC6ZSPmYUw4w5ou4eUn1pHt+D85LsNTyVDglx9FZk5GrXIQz6d
   +znYW9N4hnl78FUYGKdaCB5G+C/QLbvWD6gyvomgnxAkPPtXfYKJVeQuz
   sKKq1A003jvv+jYG2mtAVp2yPbafolULZXWyYh0wAH+P/b+vfRaople7w
   hwaVbofGF29UczVbJixGmjrzW1Q0kuhqr2aw2OTJ8Vm6gfn5XzJWasntl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364660082"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="364660082"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845691385"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="845691385"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2023 18:55:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrTs1-0005az-0R;
	Sat, 14 Oct 2023 01:55:14 +0000
Date: Sat, 14 Oct 2023 09:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [christoph:largepageprotect 2/3] mm/page_alloc.c:5266:33: warning:
 declaration of 'enum memmap_context' will not be visible outside of this
 function
Message-ID: <202310140925.mVUx4OtK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/christoph/linux.git largepageprotect
head:   8216937c02e2cc14d3005e5cff6c15bb72672ce7
commit: 047042554ce511a29790b43bfbba9e2e64de7277 [2/3] Add ability to reserve a number of pages per size
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231014/202310140925.mVUx4OtK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140925.mVUx4OtK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140925.mVUx4OtK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_alloc.c:20:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from mm/page_alloc.c:20:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/page_alloc.c:20:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from mm/page_alloc.c:28:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:11:
   include/linux/node.h:176:49: error: unknown type name 'node_registration_func_t'
     176 | static inline void register_hugetlbfs_with_node(node_registration_func_t reg,
         |                                                 ^
   include/linux/node.h:177:7: error: unknown type name 'node_registration_func_t'
     177 |                                                 node_registration_func_t unreg)
         |                                                 ^
   include/linux/node.h:192:46: error: unknown type name 'node_registration_func_t'
     192 | static inline void register_vmstat_with_node(node_registration_func_t doregister,
         |                                              ^
   include/linux/node.h:193:7: error: unknown type name 'node_registration_func_t'
     193 |                                                 node_registration_func_t unregister)
         |                                                 ^
   mm/page_alloc.c:5082:18: error: invalid operands to binary expression ('long' and 'atomic_long_t' (aka 'atomic64_t'))
    5082 |                         managed_pages += z->managed_pages;
         |                         ~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5096:15: error: operand of type 'atomic_long_t' (aka 'atomic64_t') where arithmetic or pointer type is required
    5096 |                         tmp = (u64)z->managed_pages * (min << order);
         |                                    ^~~~~~~~~~~~~~~~
>> mm/page_alloc.c:5266:33: warning: declaration of 'enum memmap_context' will not be visible outside of this function [-Wvisibility]
    5266 |                 unsigned long start_pfn, enum memmap_context context,
         |                                               ^
   mm/page_alloc.c:5266:48: error: variable has incomplete type 'enum memmap_context'
    5266 |                 unsigned long start_pfn, enum memmap_context context,
         |                                                              ^
   mm/page_alloc.c:5266:33: note: forward declaration of 'enum memmap_context'
    5266 |                 unsigned long start_pfn, enum memmap_context context,
         |                                               ^
   mm/page_alloc.c:5293:18: error: use of undeclared identifier 'MEMMAP_EARLY'; did you mean 'MEMINIT_EARLY'?
    5293 |                 if (context != MEMMAP_EARLY)
         |                                ^~~~~~~~~~~~
         |                                MEMINIT_EARLY
   include/linux/mmzone.h:1437:2: note: 'MEMINIT_EARLY' declared here
    1437 |         MEMINIT_EARLY,
         |         ^
   mm/page_alloc.c:5296:8: error: call to undeclared function 'early_pfn_valid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5296 |                 if (!early_pfn_valid(pfn))
         |                      ^
   mm/page_alloc.c:5296:8: note: did you mean 'early_pfn_to_nid'?
   include/linux/mm.h:3149:19: note: 'early_pfn_to_nid' declared here
    3149 | static inline int early_pfn_to_nid(unsigned long pfn)
         |                   ^
   mm/page_alloc.c:5298:8: error: call to undeclared function 'early_pfn_in_nid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5298 |                 if (!early_pfn_in_nid(pfn, nid))
         |                      ^
   mm/page_alloc.c:5298:8: note: did you mean 'early_pfn_to_nid'?
   include/linux/mm.h:3149:19: note: 'early_pfn_to_nid' declared here
    3149 | static inline int early_pfn_to_nid(unsigned long pfn)
         |                   ^
   mm/page_alloc.c:5300:8: error: call to undeclared function 'update_defer_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5300 |                 if (!update_defer_init(pgdat, pfn, end_pfn, &nr_initialised))
         |                      ^
   mm/page_alloc.c:5327:3: error: call to undeclared function '__init_single_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5327 |                 __init_single_page(page, pfn, zone, nid);
         |                 ^
   mm/page_alloc.c:5328:18: error: use of undeclared identifier 'MEMMAP_HOTPLUG'; did you mean 'MEMINIT_HOTPLUG'?
    5328 |                 if (context == MEMMAP_HOTPLUG)
         |                                ^~~~~~~~~~~~~~
         |                                MEMINIT_HOTPLUG
   include/linux/mmzone.h:1438:2: note: 'MEMINIT_HOTPLUG' declared here
    1438 |         MEMINIT_HOTPLUG,
         |         ^
>> mm/page_alloc.c:5265:16: warning: no previous prototype for function 'memmap_init_zone' [-Wmissing-prototypes]
    5265 | void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
         |                ^
   mm/page_alloc.c:5265:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5265 | void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
         | ^
         | static 
   14 warnings and 13 errors generated.


vim +5266 mm/page_alloc.c

  5259	
  5260	/*
  5261	 * Initially all pages are reserved - free ones are freed
  5262	 * up by free_all_bootmem() once the early boot process is
  5263	 * done. Non-atomic initialization, single-pass.
  5264	 */
> 5265	void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
> 5266			unsigned long start_pfn, enum memmap_context context,
  5267			struct vmem_altmap *altmap)
  5268	{
  5269		unsigned long end_pfn = start_pfn + size;
  5270		pg_data_t *pgdat = NODE_DATA(nid);
  5271		unsigned long pfn;
  5272		unsigned long nr_initialised = 0;
  5273		struct page *page;
  5274	#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
  5275		struct memblock_region *r = NULL, *tmp;
  5276	#endif
  5277	
  5278		if (highest_memmap_pfn < end_pfn - 1)
  5279			highest_memmap_pfn = end_pfn - 1;
  5280	
  5281		/*
  5282		 * Honor reservation requested by the driver for this ZONE_DEVICE
  5283		 * memory
  5284		 */
  5285		if (altmap && start_pfn == altmap->base_pfn)
  5286			start_pfn += altmap->reserve;
  5287	
  5288		for (pfn = start_pfn; pfn < end_pfn; pfn++) {
  5289			/*
  5290			 * There can be holes in boot-time mem_map[]s handed to this
  5291			 * function.  They do not exist on hotplugged memory.
  5292			 */
  5293			if (context != MEMMAP_EARLY)
  5294				goto not_early;
  5295	
  5296			if (!early_pfn_valid(pfn))
  5297				continue;
  5298			if (!early_pfn_in_nid(pfn, nid))
  5299				continue;
  5300			if (!update_defer_init(pgdat, pfn, end_pfn, &nr_initialised))
  5301				break;
  5302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
