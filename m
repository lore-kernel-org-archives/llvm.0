Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837B845012;
	Thu,  6 Jun 2024 18:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717699452; cv=none; b=Ihgh6QPYa632e1FaaGemn2j5nUMK3vxfx/W4ZzsisvQT97fiGPSLR0VwbyhkkDUfKqVQ7H8jOfuRig1dwxXBvAt61q9YfC5b0p67jANm5Ja/6631B6WjKPJquYIMSRwwHNWpKmIPMfYWvFh4UszsfUAUANrY23wYBt/MhrDnp5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717699452; c=relaxed/simple;
	bh=uZavulhQm1JqbaLoCfP3y7INOBuOoa+zP1zSlS1kJyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cO6Q/ESiL+txGcOehcwaXUe7QDPlNTSARDQrxg8uIrcomXGXFHn6/1xbzUJVj8vbxqCAnD79lhXxR82NqrIiM59apeyVsDeWuWhtVwHJrYsj96n5LfmkBxMB7UC3RHCGRTPLkWzPzJXaLdh4OCCfAY1R/t43uubdjjluXUQYVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed5ujyY2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed5ujyY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717699451; x=1749235451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZavulhQm1JqbaLoCfP3y7INOBuOoa+zP1zSlS1kJyE=;
  b=ed5ujyY29JGoo2kSf3+RJ32TluXNJRhwcFw+zX0BwbXvbLcIda7zJ3XA
   1JCCtwNO3BX390mgXkWuWD7o/WVpilB0FateuFSJRqt27u/uZYknSdGz6
   hHl15oav5rWn0sM3VC9ZzFLkvslD9g1X4BwDnLH+qnqlfGeIJ2hMvZlPM
   FLzebDBAhDX3qY0lDmig89bJ/hVIzouwoKc0fD47VrnEfkhIVQjYyAMv3
   /hlmReLlFsF9/KzoP6xBqeD6HieDkheTzXbwKIYylmzmfjigsTjKlMPHT
   PWumObTISyuCZCLgdg6O9oxNyOV5MKvZivXW5YM62CmGXjb97w9B/wYRL
   Q==;
X-CSE-ConnectionGUID: 492GhakeQOiayDy3hOyseQ==
X-CSE-MsgGUID: CqnkVmDmRMaQI9fwjI+LZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18242513"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="18242513"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 11:44:10 -0700
X-CSE-ConnectionGUID: qysBAiJwTd6HVS2H+YGLPQ==
X-CSE-MsgGUID: MmO1NVllRqa4V5S5A+mqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38011541"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2024 11:44:09 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFI5g-0003aC-2D;
	Thu, 06 Jun 2024 18:44:03 +0000
Date: Fri, 7 Jun 2024 02:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-pg-offline 4/5] mm/mm_init.c:896:16:
 error: use of undeclared identifier 'ZONE_DEVICE'
Message-ID: <202406070253.hMNIO0dI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-pg-offline
head:   816f41acc6e1b0eebb95b16ec843eef595962c17
commit: 3c5d3350005737fdc58ea48fdceea146132e0fdf [4/5] mm/memory_hotplug: initialize memmap with PageOffline() instead of PageReserved()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240607/202406070253.hMNIO0dI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070253.hMNIO0dI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070253.hMNIO0dI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mm_init.c:13:
   In file included from include/linux/memory.h:19:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2241:
   include/linux/vmstat.h:498:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     498 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/mm_init.c:17:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/mm_init.c:17:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/mm_init.c:17:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/mm_init.c:896:16: error: use of undeclared identifier 'ZONE_DEVICE'
     896 |                         if (zone == ZONE_DEVICE)
         |                                     ^
   mm/mm_init.c:2512:2: error: call to undeclared function '_free_pages_core'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2512 |         _free_pages_core(page, order, MEMINIT_EARLY);
         |         ^
   mm/mm_init.c:2512:2: note: did you mean '__free_pages_core'?
   mm/internal.h:607:13: note: '__free_pages_core' declared here
     607 | extern void __free_pages_core(struct page *page, unsigned int order,
         |             ^
   13 warnings and 2 errors generated.


vim +/ZONE_DEVICE +896 mm/mm_init.c

   878	
   879		for (pfn = start_pfn; pfn < end_pfn; ) {
   880			/*
   881			 * There can be holes in boot-time mem_map[]s handed to this
   882			 * function.  They do not exist on hotplugged memory.
   883			 */
   884			if (context == MEMINIT_EARLY) {
   885				if (overlap_memmap_init(zone, &pfn))
   886					continue;
   887				if (defer_init(nid, pfn, zone_end_pfn)) {
   888					deferred_struct_pages = true;
   889					break;
   890				}
   891			}
   892	
   893			page = pfn_to_page(pfn);
   894			__init_single_page(page, pfn, zone, nid);
   895			if (context == MEMINIT_HOTPLUG) {
 > 896				if (zone == ZONE_DEVICE)
   897					__SetPageReserved(page);
   898				else
   899					__SetPageOffline(page);
   900			}
   901	
   902			/*
   903			 * Usually, we want to mark the pageblock MIGRATE_MOVABLE,
   904			 * such that unmovable allocations won't be scattered all
   905			 * over the place during system boot.
   906			 */
   907			if (pageblock_aligned(pfn)) {
   908				set_pageblock_migratetype(page, migratetype);
   909				cond_resched();
   910			}
   911			pfn++;
   912		}
   913	}
   914	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
