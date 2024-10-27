Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D1D22098;
	Sun, 27 Oct 2024 04:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730003892; cv=none; b=SG7j6PNDZNRoQQaL5mx5R4ALwpNlh3pqRp+dEEJQlMO/byDCXzMm4HX4TB6yMnZnWS+Um39/6Ys0ujpyHFlPkVxE9L64qmv5qtEPCKYTg2UYUYaysQu7/23cQG/VjDCXPA6sLs7tyY6NRoq/u1Dvh91bNge6gFDskqCGe3MjPyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730003892; c=relaxed/simple;
	bh=kmKHBK7ysKLQvgO52F1q8nxtS8z5+LcJL5/+NZYTeMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2cagGQEdht6IquBjlKr76/mrBIRetUp46D/NV3zYWnMzMZMSGl4d5GBN/e2urmwSMviEae5mglBiAAupFxo+0Cc4weihLrigrN96342v9uiT4/rbgwuANlAwf77IYM4+ImY/PJ5jAYOLy+H1HK9KLi4CRQ7ee8nA/D2RK9dS18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ju/pGC/S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ju/pGC/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730003890; x=1761539890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kmKHBK7ysKLQvgO52F1q8nxtS8z5+LcJL5/+NZYTeMw=;
  b=Ju/pGC/SreuYhdNvIlHmYcCm+G86myFuz8kGCaVH3eiLk1rXmt8IHt30
   Bh0WO5gq2Wc++3sf+IEjG6jrtR3ctmDRdIIYA2V6bE+iCNqHogsCtjl+2
   ++FbDGH9MWD7hTdl2TozbXePYqr00hUMh+FEYlmq0tmejGwbzbuCXDET+
   tXES+BD+UQIgt6TaZ+T6/LZuqFrQ0tZe80nG3koZtuoRDvfyvF308Q4Ul
   tkDbEuksa/MjnJxyTu8Rc+IJW6RAa44/kLHo7yL1b1rji5yGQCAOXPbcC
   o2vibJ+zfiXsITn1FnKzaK9D1CssuRS6hS4Ip5y6CooiYQPVFMhnUGZWi
   A==;
X-CSE-ConnectionGUID: rdfFcTcpSAOG6wAf7n3syA==
X-CSE-MsgGUID: EO/Da3pqRRqLRqr1ChPaew==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29767612"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29767612"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 21:38:09 -0700
X-CSE-ConnectionGUID: 0QYvuV+ZQZGc4phNEs3oCA==
X-CSE-MsgGUID: YAMXPMTCT/6uREJy2wOOuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85897421"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2024 21:38:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4v2U-000aMh-0h;
	Sun, 27 Oct 2024 04:38:06 +0000
Date: Sun, 27 Oct 2024 12:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] mm: count zeromap read and set for swapout and swapin
Message-ID: <202410271221.03oErzAu-lkp@intel.com>
References: <20241027011959.9226-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027011959.9226-1-21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-count-zeromap-read-and-set-for-swapout-and-swapin/20241027-092054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241027011959.9226-1-21cnbao%40gmail.com
patch subject: [PATCH RFC] mm: count zeromap read and set for swapout and swapin
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241027/202410271221.03oErzAu-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271221.03oErzAu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271221.03oErzAu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_io.c:14:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> mm/page_io.c:622:39: error: use of undeclared identifier 'MTHP_STAT_SWPIN'
     622 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_SWPIN);
         |                                                     ^
   4 warnings and 1 error generated.


vim +/MTHP_STAT_SWPIN +622 mm/page_io.c

   597	
   598	void swap_read_folio(struct folio *folio, struct swap_iocb **plug)
   599	{
   600		struct swap_info_struct *sis = swp_swap_info(folio->swap);
   601		bool synchronous = sis->flags & SWP_SYNCHRONOUS_IO;
   602		bool workingset = folio_test_workingset(folio);
   603		unsigned long pflags;
   604		bool in_thrashing;
   605	
   606		VM_BUG_ON_FOLIO(!folio_test_swapcache(folio) && !synchronous, folio);
   607		VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
   608		VM_BUG_ON_FOLIO(folio_test_uptodate(folio), folio);
   609	
   610		/*
   611		 * Count submission time as memory stall and delay. When the device
   612		 * is congested, or the submitting cgroup IO-throttled, submission
   613		 * can be a significant part of overall IO time.
   614		 */
   615		if (workingset) {
   616			delayacct_thrashing_start(&in_thrashing);
   617			psi_memstall_enter(&pflags);
   618		}
   619		delayacct_swapin_start();
   620	
   621		if (swap_read_folio_zeromap(folio)) {
 > 622			count_mthp_stat(folio_order(folio), MTHP_STAT_SWPIN);
   623			count_memcg_folio_events(folio, PSWPIN, folio_nr_pages(folio));
   624			count_vm_events(PSWPIN, folio_nr_pages(folio));
   625			folio_unlock(folio);
   626			goto finish;
   627		} else if (zswap_load(folio)) {
   628			folio_unlock(folio);
   629			goto finish;
   630		}
   631	
   632		/* We have to read from slower devices. Increase zswap protection. */
   633		zswap_folio_swapin(folio);
   634	
   635		if (data_race(sis->flags & SWP_FS_OPS)) {
   636			swap_read_folio_fs(folio, plug);
   637		} else if (synchronous) {
   638			swap_read_folio_bdev_sync(folio, sis);
   639		} else {
   640			swap_read_folio_bdev_async(folio, sis);
   641		}
   642	
   643	finish:
   644		if (workingset) {
   645			delayacct_thrashing_end(&in_thrashing);
   646			psi_memstall_leave(&pflags);
   647		}
   648		delayacct_swapin_end();
   649	}
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
