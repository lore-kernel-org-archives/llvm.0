Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FEE20F8A;
	Thu, 13 Jul 2023 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689284246; x=1720820246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8s54Sz4oUPUOWK6tCLrDFwx2D1Iwc+CyAQxCia6EFt8=;
  b=ayWnYKGbE33cVKCaQgEnhalJwHrWx1yHngeJ90iM+NeALp2FX8uSEFex
   f8hdftPMT2w8HGHJ/ag+g0qgOTDxHyRpvHPjc1r7b4475/izOuy7eFQe4
   rdgpziFi8MLq5ZubPjDpKTPFaGlZNyC4Qe8myLT5rEOMsXIVm8qUvuogE
   DqeOem8rJcDxGz+QvwNIPEJyIdrlwB0cLRUae2Zjxha4uNo+KY1zxIuTm
   5d/3n34PoLhawS3jwoiCo67UkR4+27zf/lDvGY5qkx9tuEQFSVKNyZpv8
   sBnx2Xo7LUiFPEroBD07VbqVy4jL51O1bNtzcxvQF7eLwzI+WlAeHCu94
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396129899"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="396129899"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 14:37:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="835765472"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="835765472"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2023 14:37:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK3zp-0006uv-1B;
	Thu, 13 Jul 2023 21:37:09 +0000
Date: Fri, 14 Jul 2023 05:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 10/179] mm/hugetlb.c:1870:26: warning: variable
 'folio' is uninitialized when used here
Message-ID: <202307140551.1NHG7Haa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   20d834c03647d421114b4bee932993890042cd77
commit: 45f3e764da28d82646f485f8908528897af4fae6 [10/179] hugetlb: optimize update_and_free_pages_bulk to avoid lock cycles
config: s390-randconfig-r034-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140551.1NHG7Haa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140551.1NHG7Haa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140551.1NHG7Haa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/hugetlb.c:19:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/hugetlb.c:19:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/hugetlb.c:19:
   In file included from include/linux/memblock.h:13:
   In file included from arch/s390/include/asm/dma.h:5:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
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
>> mm/hugetlb.c:1870:26: warning: variable 'folio' is uninitialized when used here [-Wuninitialized]
    1870 |                                 add_hugetlb_folio(h, folio, true);
         |                                                      ^~~~~
   mm/hugetlb.c:1857:21: note: initialize the variable 'folio' to silence this warning
    1857 |         struct folio *folio;
         |                            ^
         |                             = NULL
   13 warnings generated.


vim +/folio +1870 mm/hugetlb.c

  1853	
  1854	static void update_and_free_pages_bulk(struct hstate *h, struct list_head *list)
  1855	{
  1856		struct page *page, *t_page;
  1857		struct folio *folio;
  1858		bool clear_dtor = false;
  1859	
  1860		/*
  1861		 * First allocate required vmemmmap for all pages on list.  If vmemmap
  1862		 * can not be allocated, we can not free page to lower level allocator,
  1863		 * so add back as hugetlb surplus page.
  1864		 */
  1865		list_for_each_entry_safe(page, t_page, list, lru) {
  1866			if (HPageVmemmapOptimized(page)) {
  1867				clear_dtor = true;
  1868				if (hugetlb_vmemmap_restore(h, page)) {
  1869					spin_lock_irq(&hugetlb_lock);
> 1870					add_hugetlb_folio(h, folio, true);
  1871					spin_unlock_irq(&hugetlb_lock);
  1872				}
  1873				cond_resched();
  1874			}
  1875		}
  1876	
  1877		/*
  1878		 * If vmemmmap allocation performed above, then take lock * to clear
  1879		 * destructor of all pages on list.
  1880		 */
  1881		if (clear_dtor) {
  1882			spin_lock_irq(&hugetlb_lock);
  1883			list_for_each_entry(page, list, lru)
  1884				__clear_hugetlb_destructor(h, page_folio(page));
  1885			spin_unlock_irq(&hugetlb_lock);
  1886		}
  1887	
  1888		/*
  1889		 * Free pages back to low level allocators.  vmemmap and destructors
  1890		 * were taken care of above, so update_and_free_hugetlb_folio will
  1891		 * not need to take hugetlb lock.
  1892		 */
  1893		list_for_each_entry_safe(page, t_page, list, lru) {
  1894			folio = page_folio(page);
  1895			update_and_free_hugetlb_folio(h, folio, false);
  1896		}
  1897	}
  1898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
