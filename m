Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E779BA3B;
	Wed, 23 Aug 2023 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692802213; x=1724338213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+rC0todhL7nhyTC3I6aSmta0A5PLR+rZFf57fc0unEY=;
  b=jdCufYaxowjDFn5CQRQKmIsPvkR+gpP9dNKPHXrtlWqKQl7HwBlKDMW8
   1TlhsWjD32kFCV56d8r82iftwM0G/yvOInRsAJibFnmMYxMFbb0bPMODi
   sQcjsCSAucAWd/eQFSAAuTTzM2cjPvnOKHtyN6l0g28crqMixAmVqqM1w
   ekXZbQAeqCYW8pZwRQKN5kHJgDLdLS4jhtIfyKZV1kaEFy6S9BnavqyaI
   n3B9YQGSKIaYvaqnP2vCqUiuu0UF+OemT/MEtOo3PPBf5KCnoqipQgXUq
   rdlhdnSsWWah91qSCwxT7M51M7k43+OiJlfQaxI9HpnInjnaVOTghtM+l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460546536"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="460546536"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 07:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910536184"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="910536184"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 23 Aug 2023 07:50:09 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYpBQ-0001IM-1U;
	Wed, 23 Aug 2023 14:50:08 +0000
Date: Wed, 23 Aug 2023 22:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:total_mapcount 4/4] mm/rmap.c:1306:4: warning:
 variable 'first' is uninitialized when used here
Message-ID: <202308232256.hYlT8CIL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux total_mapcount
head:   a51a7d038794500ca596fc544499429062372ac4
commit: a51a7d038794500ca596fc544499429062372ac4 [4/4] tmp
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230823/202308232256.hYlT8CIL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232256.hYlT8CIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232256.hYlT8CIL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/rmap.c:59:
   In file included from include/linux/pagemap.h:11:
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
   In file included from mm/rmap.c:59:
   In file included from include/linux/pagemap.h:11:
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
   In file included from mm/rmap.c:59:
   In file included from include/linux/pagemap.h:11:
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
>> mm/rmap.c:1306:4: warning: variable 'first' is uninitialized when used here [-Wuninitialized]
    1306 |                         first += atomic_inc_and_test(&page->_mapcount);
         |                         ^~~~~
   mm/rmap.c:1298:41: note: initialize the variable 'first' to silence this warning
    1298 |         unsigned int nr_pmdmapped = 0, i, first;
         |                                                ^
         |                                                 = 0
   13 warnings generated.


vim +/first +1306 mm/rmap.c

  1281	
  1282	/**
  1283	 * folio_add_file_rmap_range - add pte mapping to page range of a folio
  1284	 * @folio:	The folio to add the mapping to
  1285	 * @page:	The first page to add
  1286	 * @nr_pages:	The number of pages which will be mapped
  1287	 * @vma:	the vm area in which the mapping is added
  1288	 * @compound:	charge the page as compound or small page
  1289	 *
  1290	 * The page range of folio is defined by [first_page, first_page + nr_pages)
  1291	 *
  1292	 * The caller needs to hold the pte lock.
  1293	 */
  1294	void folio_add_file_rmap_range(struct folio *folio, struct page *page,
  1295				unsigned int nr_pages, struct vm_area_struct *vma,
  1296				bool compound)
  1297	{
  1298		unsigned int nr_pmdmapped = 0, i, first;
  1299		int nr = 0;
  1300	
  1301		VM_WARN_ON_FOLIO(compound && !folio_test_pmd_mappable(folio), folio);
  1302	
  1303		/* Is page being mapped by PTE? Is this its first map to be added? */
  1304		if (likely(!compound)) {
  1305			for (i = 0; i < nr_pages; i++, page++)
> 1306				first += atomic_inc_and_test(&page->_mapcount);
  1307			nr = first;
  1308			if (unlikely(folio_test_large(folio))) {
  1309				folio_mapcount_lock(folio);
  1310				if (first) {
  1311					nr = folio_nr_pages_mapped_add_return(folio,
  1312									      first);
  1313					nr = (nr < COMPOUND_MAPPED);
  1314				}
  1315				folio_total_mapcount_add(folio, nr_pages, vma);
  1316				folio_mapcount_unlock(folio);
  1317			}
  1318		} else if (folio_test_pmd_mappable(folio)) {
  1319			/* That test is redundant: it's for safety or to optimize out */
  1320			folio_mapcount_lock(folio);
  1321			first = folio_entire_mapcount_inc_test_first(folio);
  1322			if (first) {
  1323				nr = folio_nr_pages_mapped_add_return(folio, COMPOUND_MAPPED);
  1324				if (likely(nr < COMPOUND_MAPPED + COMPOUND_MAPPED)) {
  1325					nr_pmdmapped = folio_nr_pages(folio);
  1326					nr = nr_pmdmapped - (nr & FOLIO_PAGES_MAPPED);
  1327					/* Raced ahead of a remove and another add? */
  1328					if (unlikely(nr < 0))
  1329						nr = 0;
  1330				} else {
  1331					/* Raced ahead of a remove of COMPOUND_MAPPED */
  1332					nr = 0;
  1333				}
  1334			}
  1335			folio_total_mapcount_inc(folio, vma);
  1336			folio_mapcount_unlock(folio);
  1337		}
  1338	
  1339		if (nr_pmdmapped)
  1340			__lruvec_stat_mod_folio(folio, folio_test_swapbacked(folio) ?
  1341				NR_SHMEM_PMDMAPPED : NR_FILE_PMDMAPPED, nr_pmdmapped);
  1342		if (nr)
  1343			__lruvec_stat_mod_folio(folio, NR_FILE_MAPPED, nr);
  1344	
  1345		mlock_vma_folio(folio, vma, compound);
  1346	}
  1347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
