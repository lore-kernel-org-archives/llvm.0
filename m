Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC9A7E;
	Sat, 14 Oct 2023 02:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bM6dPVGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697249785; x=1728785785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AmrgccWVIPtlyOtERAFO1TFdneUF16tzY7odPtEWgEY=;
  b=bM6dPVGAMKojH4wIkP4G0ksfKrmGpka3aWz60syx8cj2BX3/m/d3kBkD
   3ZoQfpR6rvbxhnur5SWwGvmVXQcg8L1sybZvmEgKfxlHevuEThYf8F8jv
   2mJs1Ra1+fez4tF2GuVTwlUYnWfqneudmE05m2p5ULNpaXHGgHuMy4Nik
   rYgxU3wZoBBktFQyFHKbzdp/ZeK6GjJRwk7/7JErQPaVA/4UwXZ++anWD
   K1Y0w89JdHEOnl43KweOb/bpLQpUhOjLNetEP2PPWPydstbqJVYLZT7OO
   4dtH3D3UscXMbkEhKLJpR8Q0U5WfbyBqoaPob5AI8WbueTFd8u4gcWAez
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364660975"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="364660975"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 19:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845694609"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="845694609"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2023 19:16:22 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrUCT-0005cR-18;
	Sat, 14 Oct 2023 02:16:21 +0000
Date: Sat, 14 Oct 2023 10:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [christoph:largepageprotect 2/3] mm/page_alloc.c:5296:8: error:
 implicit declaration of function 'early_pfn_valid' is invalid in C99
Message-ID: <202310141035.Cx7aDSyp-lkp@intel.com>
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
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310141035.Cx7aDSyp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141035.Cx7aDSyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141035.Cx7aDSyp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from mm/page_alloc.c:20:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from mm/page_alloc.c:20:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   In file included from mm/page_alloc.c:28:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:11:
   include/linux/node.h:176:49: error: unknown type name 'node_registration_func_t'
   static inline void register_hugetlbfs_with_node(node_registration_func_t reg,
                                                   ^
   include/linux/node.h:177:7: error: unknown type name 'node_registration_func_t'
                                                   node_registration_func_t unreg)
                                                   ^
   include/linux/node.h:192:46: error: unknown type name 'node_registration_func_t'
   static inline void register_vmstat_with_node(node_registration_func_t doregister,
                                                ^
   include/linux/node.h:193:7: error: unknown type name 'node_registration_func_t'
                                                   node_registration_func_t unregister)
                                                   ^
   mm/page_alloc.c:5082:18: error: invalid operands to binary expression ('long' and 'atomic_long_t' (aka 'atomic64_t'))
                           managed_pages += z->managed_pages;
                           ~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   mm/page_alloc.c:5096:15: error: operand of type 'atomic_long_t' (aka 'atomic64_t') where arithmetic or pointer type is required
                           tmp = (u64)z->managed_pages * (min << order);
                                      ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:5266:33: warning: declaration of 'enum memmap_context' will not be visible outside of this function [-Wvisibility]
                   unsigned long start_pfn, enum memmap_context context,
                                                 ^
   mm/page_alloc.c:5266:48: error: variable has incomplete type 'enum memmap_context'
                   unsigned long start_pfn, enum memmap_context context,
                                                                ^
   mm/page_alloc.c:5266:33: note: forward declaration of 'enum memmap_context'
                   unsigned long start_pfn, enum memmap_context context,
                                                 ^
   mm/page_alloc.c:5293:18: error: use of undeclared identifier 'MEMMAP_EARLY'; did you mean 'MEMINIT_EARLY'?
                   if (context != MEMMAP_EARLY)
                                  ^~~~~~~~~~~~
                                  MEMINIT_EARLY
   include/linux/mmzone.h:1437:2: note: 'MEMINIT_EARLY' declared here
           MEMINIT_EARLY,
           ^
>> mm/page_alloc.c:5296:8: error: implicit declaration of function 'early_pfn_valid' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!early_pfn_valid(pfn))
                        ^
   mm/page_alloc.c:5296:8: note: did you mean 'early_pfn_to_nid'?
   include/linux/mm.h:3149:19: note: 'early_pfn_to_nid' declared here
   static inline int early_pfn_to_nid(unsigned long pfn)
                     ^
>> mm/page_alloc.c:5298:8: error: implicit declaration of function 'early_pfn_in_nid' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!early_pfn_in_nid(pfn, nid))
                        ^
   mm/page_alloc.c:5298:8: note: did you mean 'early_pfn_to_nid'?
   include/linux/mm.h:3149:19: note: 'early_pfn_to_nid' declared here
   static inline int early_pfn_to_nid(unsigned long pfn)
                     ^
>> mm/page_alloc.c:5300:8: error: implicit declaration of function 'update_defer_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (!update_defer_init(pgdat, pfn, end_pfn, &nr_initialised))
                        ^
>> mm/page_alloc.c:5327:3: error: implicit declaration of function '__init_single_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   __init_single_page(page, pfn, zone, nid);
                   ^
   mm/page_alloc.c:5328:18: error: use of undeclared identifier 'MEMMAP_HOTPLUG'; did you mean 'MEMINIT_HOTPLUG'?
                   if (context == MEMMAP_HOTPLUG)
                                  ^~~~~~~~~~~~~~
                                  MEMINIT_HOTPLUG
   include/linux/mmzone.h:1438:2: note: 'MEMINIT_HOTPLUG' declared here
           MEMINIT_HOTPLUG,
           ^
   mm/page_alloc.c:5265:16: warning: no previous prototype for function 'memmap_init_zone' [-Wmissing-prototypes]
   void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
                  ^
   mm/page_alloc.c:5265:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
   ^
   static 
   14 warnings and 13 errors generated.


vim +/early_pfn_valid +5296 mm/page_alloc.c

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
> 5296			if (!early_pfn_valid(pfn))
  5297				continue;
> 5298			if (!early_pfn_in_nid(pfn, nid))
  5299				continue;
> 5300			if (!update_defer_init(pgdat, pfn, end_pfn, &nr_initialised))
  5301				break;
  5302	
  5303	#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
  5304			/*
  5305			 * Check given memblock attribute by firmware which can affect
  5306			 * kernel memory layout.  If zone==ZONE_MOVABLE but memory is
  5307			 * mirrored, it's an overlapped memmap init. skip it.
  5308			 */
  5309			if (mirrored_kernelcore && zone == ZONE_MOVABLE) {
  5310				if (!r || pfn >= memblock_region_memory_end_pfn(r)) {
  5311					for_each_memblock(memory, tmp)
  5312						if (pfn < memblock_region_memory_end_pfn(tmp))
  5313							break;
  5314					r = tmp;
  5315				}
  5316				if (pfn >= memblock_region_memory_base_pfn(r) &&
  5317				    memblock_is_mirror(r)) {
  5318					/* already initialized as NORMAL */
  5319					pfn = memblock_region_memory_end_pfn(r);
  5320					continue;
  5321				}
  5322			}
  5323	#endif
  5324	
  5325	not_early:
  5326			page = pfn_to_page(pfn);
> 5327			__init_single_page(page, pfn, zone, nid);
  5328			if (context == MEMMAP_HOTPLUG)
  5329				SetPageReserved(page);
  5330	
  5331			/*
  5332			 * Mark the block movable so that blocks are reserved for
  5333			 * movable at startup. This will force kernel allocations
  5334			 * to reserve their blocks rather than leaking throughout
  5335			 * the address space during boot when many long-lived
  5336			 * kernel allocations are made.
  5337			 *
  5338			 * bitmap is created for zone's valid pfn range. but memmap
  5339			 * can be created for invalid pages (for alignment)
  5340			 * check here not to call set_pageblock_migratetype() against
  5341			 * pfn out of zone.
  5342			 *
  5343			 * Please note that MEMMAP_HOTPLUG path doesn't clear memmap
  5344			 * because this is done early in sparse_add_one_section
  5345			 */
  5346			if (!(pfn & (pageblock_nr_pages - 1))) {
  5347				set_pageblock_migratetype(page, MIGRATE_MOVABLE);
  5348				cond_resched();
  5349			}
  5350		}
  5351	}
  5352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
