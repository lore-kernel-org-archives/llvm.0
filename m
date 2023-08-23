Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327DC139;
	Wed, 23 Aug 2023 17:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692810751; x=1724346751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9kdBZ/8uQCQIFdgNrzRNZCTobxRphxbwnvHFO0zyTXE=;
  b=kfLURtIirqyWhdGNax95rcJp7VhGYVq6Q9MiUBnIhM6VTwHKdWajAJAg
   yI7GbMeo6xb+EfBLUkCCCspLe+jwvtcSH9/4DJfTzc4sX25uj9u2T0cAb
   q8yb2YnGuQSvD12eD6H43nFlpW24b/3YWqi1LrgERTzbn19qYOEPxkLTp
   0fCcJkZ9VudRYA3xul9Rsq36ZQyeUWSZORhzhLw2C9hIpeQY+4N7HFcTM
   st0MWt2V/5Fmjop9f9LTvPpPqLJQHeMaUjr16+dpikY9w58lp1CljyH/r
   w3POygt6zk/6RTDkNsV3Ql1lIfYOLdn2F+agpVs5+IkBD84h9UpF/MKj3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374194384"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="374194384"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 10:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="713639951"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="713639951"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Aug 2023 10:12:07 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYrOk-0001Mi-0Q;
	Wed, 23 Aug 2023 17:12:03 +0000
Date: Thu, 24 Aug 2023 01:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@devkernel.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 11986/12208] fs/proc/task_mmu.c:457:33: error:
 call to undeclared function 'is_ksm_zero_pte'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202308240136.d9NDuEXY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
commit: 5233d9beb1a81c08d8155b62df5e9635ee99ee27 [11986/12208] proc/ksm: add ksm stats to /proc/pid/smaps
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230824/202308240136.d9NDuEXY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240136.d9NDuEXY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240136.d9NDuEXY-lkp@intel.com/

Note: the linux-next/master HEAD e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from fs/proc/task_mmu.c:3:
   In file included from include/linux/mm_inline.h:7:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from fs/proc/task_mmu.c:3:
   In file included from include/linux/mm_inline.h:7:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from fs/proc/task_mmu.c:3:
   In file included from include/linux/mm_inline.h:7:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
>> fs/proc/task_mmu.c:457:33: error: call to undeclared function 'is_ksm_zero_pte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     457 |         if (PageKsm(page) && (!pte || !is_ksm_zero_pte(*pte)))
         |                                        ^
   12 warnings and 1 error generated.


vim +/is_ksm_zero_pte +457 fs/proc/task_mmu.c

   439	
   440	static void smaps_account(struct mem_size_stats *mss, pte_t *pte,
   441			struct page *page, bool compound, bool young, bool dirty,
   442			bool locked, bool migration)
   443	{
   444		int i, nr = compound ? compound_nr(page) : 1;
   445		unsigned long size = nr * PAGE_SIZE;
   446	
   447		/*
   448		 * First accumulate quantities that depend only on |size| and the type
   449		 * of the compound page.
   450		 */
   451		if (PageAnon(page)) {
   452			mss->anonymous += size;
   453			if (!PageSwapBacked(page) && !dirty && !PageDirty(page))
   454				mss->lazyfree += size;
   455		}
   456	
 > 457		if (PageKsm(page) && (!pte || !is_ksm_zero_pte(*pte)))
   458			mss->ksm += size;
   459	
   460		mss->resident += size;
   461		/* Accumulate the size in pages that have been accessed. */
   462		if (young || page_is_young(page) || PageReferenced(page))
   463			mss->referenced += size;
   464	
   465		/*
   466		 * Then accumulate quantities that may depend on sharing, or that may
   467		 * differ page-by-page.
   468		 *
   469		 * page_count(page) == 1 guarantees the page is mapped exactly once.
   470		 * If any subpage of the compound page mapped with PTE it would elevate
   471		 * page_count().
   472		 *
   473		 * The page_mapcount() is called to get a snapshot of the mapcount.
   474		 * Without holding the page lock this snapshot can be slightly wrong as
   475		 * we cannot always read the mapcount atomically.  It is not safe to
   476		 * call page_mapcount() even with PTL held if the page is not mapped,
   477		 * especially for migration entries.  Treat regular migration entries
   478		 * as mapcount == 1.
   479		 */
   480		if ((page_count(page) == 1) || migration) {
   481			smaps_page_accumulate(mss, page, size, size << PSS_SHIFT, dirty,
   482				locked, true);
   483			return;
   484		}
   485		for (i = 0; i < nr; i++, page++) {
   486			int mapcount = page_mapcount(page);
   487			unsigned long pss = PAGE_SIZE << PSS_SHIFT;
   488			if (mapcount >= 2)
   489				pss /= mapcount;
   490			smaps_page_accumulate(mss, page, PAGE_SIZE, pss, dirty, locked,
   491					      mapcount < 2);
   492		}
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
