Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89603100CB;
	Mon, 24 Jul 2023 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690223207; x=1721759207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jl246uCCT7kNAGli10wtizJI9vqzqkjSk/l+IswqUSc=;
  b=IZiiqNGIlbilkxfSJJrkw1rVHh+fKNn5cQjxU3aWdoF7QamLe06rMAGy
   /BmkMEPZ8WTUmD770zJn4Y8iX5o5BDWRUKyKpU0IlHrUDPrh/vmeJHASQ
   cc9oMT6W65SzyYXES3BBEwiQ1Es27Luk98MkbCITx8cEQkq9T9IdlSmQv
   IMG0u3zkCzLZi/kAoLTYk2SXNw8AZuFJ+PLP7SOOLKPw+vsp9jsrHU36U
   WdoVszuGSS6Ty7cTD6SyVCluGteincSwqEdIN5cblFAKnVPUFY3D5C9rI
   pfalb01dFGWBGAWfuGV2nZ3bVntKzzatFbCI3mbC8x20WaAVWloIS/vfS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398428890"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398428890"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 11:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="839555146"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="839555146"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2023 11:26:27 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO0GI-0009wq-1K;
	Mon, 24 Jul 2023 18:26:26 +0000
Date: Tue, 25 Jul 2023 02:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 4/4] mm/memblock: Skip initialization of struct pages freed
 later by HVO
Message-ID: <202307250246.x2VHKOEo-lkp@intel.com>
References: <20230724134644.1299963-5-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724134644.1299963-5-usama.arif@bytedance.com>

Hi Usama,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-hugetlb-Skip-prep-of-tail-pages-when-HVO-is-enabled/20230724-214832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230724134644.1299963-5-usama.arif%40bytedance.com
patch subject: [RFC 4/4] mm/memblock: Skip initialization of struct pages freed later by HVO
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230725/202307250246.x2VHKOEo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250246.x2VHKOEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250246.x2VHKOEo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memblock.c:18:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
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
   In file included from mm/memblock.c:18:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/memblock.c:18:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
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
   mm/memblock.c:871:21: warning: no previous prototype for function 'memblock_reserve_huge' [-Wmissing-prototypes]
     871 | int __init_memblock memblock_reserve_huge(phys_addr_t base, phys_addr_t size,
         |                     ^
   mm/memblock.c:871:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     871 | int __init_memblock memblock_reserve_huge(phys_addr_t base, phys_addr_t size,
         | ^
         | static 
>> mm/memblock.c:2141:19: error: use of undeclared identifier 'HUGETLB_VMEMMAP_RESERVE_SIZE'
    2141 |                                 end = start + HUGETLB_VMEMMAP_RESERVE_SIZE * sizeof(struct page);
         |                                               ^
   13 warnings and 1 error generated.


vim +/HUGETLB_VMEMMAP_RESERVE_SIZE +2141 mm/memblock.c

  2105	
  2106	static void __init memmap_init_reserved_pages(void)
  2107	{
  2108		struct memblock_region *region;
  2109		phys_addr_t start, end;
  2110		int nid;
  2111	
  2112		/*
  2113		 * set nid on all reserved pages and also treat struct
  2114		 * pages for the NOMAP regions as PageReserved
  2115		 */
  2116		for_each_mem_region(region) {
  2117			nid = memblock_get_region_node(region);
  2118			start = region->base;
  2119			end = start + region->size;
  2120	
  2121			if (memblock_is_nomap(region))
  2122				reserve_bootmem_region(start, end, nid);
  2123	
  2124			memblock_set_node(start, end, &memblock.reserved, nid);
  2125		}
  2126	
  2127		/* initialize struct pages for the reserved regions */
  2128		for_each_reserved_mem_region(region) {
  2129			nid = memblock_get_region_node(region);
  2130			/*
  2131			 * If the region is for hugepages and if HVO is enabled, then those
  2132			 * struct pages which will be freed later don't need to be initialized.
  2133			 * This can save significant time when a large number of hugepages are
  2134			 * allocated at boot time. As this is at boot time, we don't need to
  2135			 * worry about memory hotplug.
  2136			 */
  2137			if (region->hugepage_size && vmemmap_optimize_enabled) {
  2138				for (start = region->base;
  2139				    start < region->base + region->size;
  2140				    start += region->hugepage_size) {
> 2141					end = start + HUGETLB_VMEMMAP_RESERVE_SIZE * sizeof(struct page);
  2142					reserve_bootmem_region(start, end, nid);
  2143				}
  2144			} else {
  2145				start = region->base;
  2146				end = start + region->size;
  2147				reserve_bootmem_region(start, end, nid);
  2148			}
  2149		}
  2150	}
  2151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
