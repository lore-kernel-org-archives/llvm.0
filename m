Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B6EC5;
	Wed, 20 Nov 2024 02:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732068278; cv=none; b=cF2ekIylv+W9m1BRCIiro0OXAQHEgnpetbPhQSCJ6Y6E51luMkKXNOwg8nFAuZGtbvYREiLxeF2uqHUIuwxJGF67ZvbfpwntG6H3MwymnbWUEPtAzZ+WyUG9PpHju85esAvs0to/lROUlFfphLNHcT4MR4FmGCmK5v+3BmrBpnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732068278; c=relaxed/simple;
	bh=ulDBRRDEg5PDbrwES0+g/0BRxklJ36sQNAr83Lsl0Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsM/xM4pkP/EmwMy1GKxYpE9cUfde5AHeWpM0bfkUZI98Exs1GE96I/jr45o6ChVLoF6DoAC/7M5OCLEzb3ZsUy23S4AIAu+TAK3d5zT3NBtXmwOCQAqY14HbhZ0CA5iMU5D96ENQsYAkV0j8Dyn2ZyL63oUyf0vi3kJkJUPhf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9pRL4hm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9pRL4hm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732068275; x=1763604275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ulDBRRDEg5PDbrwES0+g/0BRxklJ36sQNAr83Lsl0Ms=;
  b=O9pRL4hm00ooX4+j2/sdG1T6TgfumEHpwwkvCMiOQ77lsS3cCPlR6TyE
   7wiurTzicHnV7r0Ew5p++dve3FS/u97WS0XgzO/VhIqJvQ4JlBPyBkXEM
   V2vHnnS8fvydbcV1qg/WSMF+gOsnSRIg3AxDJ29UT8rnpSHqh5HpY7Stg
   JLmH0O1dYZ0VBXOnYSs1Cg0qg3yXge06a+1Zv6swj6gDREdubcAVm+X3M
   n4BNdwcIclgcZKoqIQ+jgUrbza/lU3h0yFqM3/cAxsQHT3a9l/nSa2GF1
   zucxez387u/G9jYtpZ1qMRT8i5NuCp9wr57azd1mbP9qHsrEazpjTw8q0
   g==;
X-CSE-ConnectionGUID: DdJW1FbQR7SBIy66Qlksiw==
X-CSE-MsgGUID: 0uF8EVIAQiuk3pMQxiFCeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="57510043"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="57510043"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 18:04:34 -0800
X-CSE-ConnectionGUID: en4MPyl6SlK2QuUAVDOuSA==
X-CSE-MsgGUID: 57ZcyO/DT3mfogSEoVlDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="120710695"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2024 18:04:33 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDa51-0000Rd-0H;
	Wed, 20 Nov 2024 02:04:31 +0000
Date: Wed, 20 Nov 2024 10:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] mm/kmemleak: Fix sleeping function called from invalid
 context at print message
Message-ID: <202411200936.B78Lbwlm-lkp@intel.com>
References: <20241115145410.114376-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115145410.114376-1-acarmina@redhat.com>

Hi Alessandro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Alessandro-Carminati/mm-kmemleak-Fix-sleeping-function-called-from-invalid-context-at-print-message/20241117-004112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241115145410.114376-1-acarmina%40redhat.com
patch subject: [RFC] mm/kmemleak: Fix sleeping function called from invalid context at print message
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20241120/202411200936.B78Lbwlm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411200936.B78Lbwlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411200936.B78Lbwlm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/kmemleak.c:84:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2211:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/kmemleak.c:84:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/kmemleak.c:84:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/kmemleak.c:84:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
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
>> mm/kmemleak.c:1879:31: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    1879 |                                 tmp = ptr_storage_get(&s, i);
         |                                                           ^
   mm/kmemleak.c:1705:22: note: initialize the variable 'i' to silence this warning
    1705 |         int __maybe_unused i;
         |                             ^
         |                              = 0
   14 warnings generated.


vim +/i +1879 mm/kmemleak.c

  1758	
  1759		/*
  1760		 * Struct page scanning for each node.
  1761		 */
  1762		get_online_mems();
  1763		for_each_populated_zone(zone) {
  1764			unsigned long start_pfn = zone->zone_start_pfn;
  1765			unsigned long end_pfn = zone_end_pfn(zone);
  1766			unsigned long pfn;
  1767	
  1768			for (pfn = start_pfn; pfn < end_pfn; pfn++) {
  1769				struct page *page = pfn_to_online_page(pfn);
  1770	
  1771				if (!(pfn & 63))
  1772					cond_resched();
  1773	
  1774				if (!page)
  1775					continue;
  1776	
  1777				/* only scan pages belonging to this zone */
  1778				if (page_zone(page) != zone)
  1779					continue;
  1780				/* only scan if page is in use */
  1781				if (page_count(page) == 0)
  1782					continue;
  1783				scan_block(page, page + 1, NULL);
  1784			}
  1785		}
  1786		put_online_mems();
  1787	
  1788		/*
  1789		 * Scanning the task stacks (may introduce false negatives).
  1790		 */
  1791		if (kmemleak_stack_scan) {
  1792			struct task_struct *p, *g;
  1793	
  1794			rcu_read_lock();
  1795			for_each_process_thread(g, p) {
  1796				void *stack = try_get_task_stack(p);
  1797				if (stack) {
  1798					scan_block(stack, stack + THREAD_SIZE, NULL);
  1799					put_task_stack(p);
  1800				}
  1801			}
  1802			rcu_read_unlock();
  1803		}
  1804	
  1805		/*
  1806		 * Scan the objects already referenced from the sections scanned
  1807		 * above.
  1808		 */
  1809		scan_gray_list();
  1810	
  1811		/*
  1812		 * Check for new or unreferenced objects modified since the previous
  1813		 * scan and color them gray until the next scan.
  1814		 */
  1815		rcu_read_lock();
  1816		list_for_each_entry_rcu(object, &object_list, object_list) {
  1817			if (need_resched())
  1818				kmemleak_cond_resched(object);
  1819	
  1820			/*
  1821			 * This is racy but we can save the overhead of lock/unlock
  1822			 * calls. The missed objects, if any, should be caught in
  1823			 * the next scan.
  1824			 */
  1825			if (!color_white(object))
  1826				continue;
  1827			raw_spin_lock_irq(&object->lock);
  1828			if (color_white(object) && (object->flags & OBJECT_ALLOCATED)
  1829			    && update_checksum(object) && get_object(object)) {
  1830				/* color it gray temporarily */
  1831				object->count = object->min_count;
  1832				list_add_tail(&object->gray_list, &gray_list);
  1833			}
  1834			raw_spin_unlock_irq(&object->lock);
  1835		}
  1836		rcu_read_unlock();
  1837	
  1838		/*
  1839		 * Re-scan the gray list for modified unreferenced objects.
  1840		 */
  1841		scan_gray_list();
  1842	
  1843		/*
  1844		 * If scanning was stopped do not report any new unreferenced objects.
  1845		 */
  1846		if (scan_should_stop())
  1847			return;
  1848	
  1849		/*
  1850		 * Scanning result reporting.
  1851		 */
  1852		rcu_read_lock();
  1853		list_for_each_entry_rcu(object, &object_list, object_list) {
  1854			if (need_resched())
  1855				kmemleak_cond_resched(object);
  1856	
  1857			/*
  1858			 * This is racy but we can save the overhead of lock/unlock
  1859			 * calls. The missed objects, if any, should be caught in
  1860			 * the next scan.
  1861			 */
  1862			if (!color_white(object))
  1863				continue;
  1864			raw_spin_lock_irq(&object->lock);
  1865			if (unreferenced_object(object) &&
  1866			    !(object->flags & OBJECT_REPORTED)) {
  1867				object->flags |= OBJECT_REPORTED;
  1868	
  1869				if (kmemleak_verbose) {
  1870					print_unreferenced(NULL, object, &s);
  1871					do_print = true;
  1872				}
  1873	
  1874				new_leaks++;
  1875			}
  1876			raw_spin_unlock_irq(&object->lock);
  1877			if (kmemleak_verbose && do_print) {
  1878				for (inx = 0; inx < s.nr_entries; inx++) {
> 1879					tmp = ptr_storage_get(&s, i);
  1880					warn_or_seq_printf(NULL, "    [<%pK>] %pS\n", tmp, tmp);
  1881				}
  1882			}
  1883		}
  1884		rcu_read_unlock();
  1885	
  1886		if (new_leaks) {
  1887			kmemleak_found_leaks = true;
  1888	
  1889			pr_info("%d new suspected memory leaks (see /sys/kernel/debug/kmemleak)\n",
  1890				new_leaks);
  1891		}
  1892	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
