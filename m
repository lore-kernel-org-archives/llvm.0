Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A2D1D47BB;
	Mon, 16 Dec 2024 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734386420; cv=none; b=ag8UonxjSls8cVHKim9pioSW02hILvu/XlByqBjkSqnC94mnYGffqby4oXMk7N9UXVYQ+JEWJHU1lR8aEwaC+M9GG2UiTofurxjJttAaOrBsk1Q9m/ZtboNLs1QXeCyJWzaBpNlE/SlYTG27bck4v6f4Cwuos8j8Y3uHvaPZUVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734386420; c=relaxed/simple;
	bh=o+bfatRk+GISHxliDsLJXaS7PBr4GD3X9gJ2qHl8uj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6kIjEHiR+q7wU58eZk2MvSiEbPXBh+ML39219/m48pPemI52DIEKPxayllw06o5xO1aNG9H41uWJPnNTBpv9YDGNXWyEjQb+HlEE/a44FHDbyVXBbHCmzlBcKgcah5tVra0F1/yBrK9bqZ6e6f0bDQZIO2xlQa1UOHd6mlkt0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYfyAFd+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYfyAFd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734386418; x=1765922418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o+bfatRk+GISHxliDsLJXaS7PBr4GD3X9gJ2qHl8uj4=;
  b=JYfyAFd+SpET8NeMKY1mvwHirKhoIPAMCaXLTknDE9KIkRQHJnjolXfm
   pMbmoc1VhAZBDKJT4o/XFOYBR0Dx1O1HfjGnmXlzVnkqmrSmYkQJJxjhy
   ivybJgLW7Img3sPJHOOlxvdsJz0f1hickG909WfXf3mWGpR5gzAjupkVi
   7Rq5u/WmYg/NCnkRIUWuAN0Vv9jOftQZXHtx9d6/2I+ck21QX9r9mbjSq
   UXHq2aKAHogXGD1Ndj6/n67MTSgAMqowvJRbTPHn2Tv0GZMj3Vy3MoCA6
   HepkP+PQmcxBOVfIZdDxGUXF7s1cpo/EQyGIFh3zwgncQG/Ad4e88XnQ9
   g==;
X-CSE-ConnectionGUID: Cj+kRIXBSIeYuo2X7ClbMQ==
X-CSE-MsgGUID: kzcfLo3BQO+oApg8XBMuAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57271631"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="57271631"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 14:00:17 -0800
X-CSE-ConnectionGUID: IP22Had+Rz6fMLingAklEQ==
X-CSE-MsgGUID: n4NwuGR/Rl+AkJjUDLsMJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="97227210"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2024 14:00:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNJ8P-000EVA-2R;
	Mon, 16 Dec 2024 22:00:13 +0000
Date: Tue, 17 Dec 2024 05:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: enforce __must_check on VMA merge and split
Message-ID: <202412170555.i4T2rEdD-lkp@intel.com>
References: <20241206225036.273103-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206225036.273103-1-lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-enforce-__must_check-on-VMA-merge-and-split/20241207-065244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241206225036.273103-1-lorenzo.stoakes%40oracle.com
patch subject: [PATCH] mm: enforce __must_check on VMA merge and split
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241217/202412170555.i4T2rEdD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170555.i4T2rEdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170555.i4T2rEdD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vma.c:7:
   In file included from mm/vma_internal.h:12:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
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
   In file included from mm/vma.c:7:
   In file included from mm/vma_internal.h:29:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/vma.c:2468:3: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
    2468 |                 vma_merge_existing_range(&vmg);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~~
   7 warnings generated.


vim +/warn_unused_result +2468 mm/vma.c

52956b0d7fb92e3 Lorenzo Stoakes 2024-10-25  2434  
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2435  unsigned long __mmap_region(struct file *file, unsigned long addr,
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2436  		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2437  		struct list_head *uf)
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2438  {
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2439  	struct mm_struct *mm = current->mm;
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2440  	struct vm_area_struct *vma = NULL;
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2441  	int error;
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2442  	VMA_ITERATOR(vmi, mm, addr);
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2443  	MMAP_STATE(map, mm, &vmi, addr, len, pgoff, vm_flags, file);
52956b0d7fb92e3 Lorenzo Stoakes 2024-10-25  2444  
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2445  	error = __mmap_prepare(&map, uf);
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2446  	if (error)
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2447  		goto abort_munmap;
52956b0d7fb92e3 Lorenzo Stoakes 2024-10-25  2448  
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2449  	/* Attempt to merge with adjacent VMAs... */
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2450  	if (map.prev || map.next) {
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2451  		VMG_MMAP_STATE(vmg, &map, /* vma = */ NULL);
52956b0d7fb92e3 Lorenzo Stoakes 2024-10-25  2452  
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2453  		vma = vma_merge_new_range(&vmg);
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2454  	}
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2455  
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2456  	/* ...but if we can't, allocate a new VMA. */
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2457  	if (!vma) {
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2458  		error = __mmap_new_vma(&map, &vma);
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2459  		if (error)
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2460  			goto unacct_error;
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2461  	}
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2462  
5ac87a885aecb3f Lorenzo Stoakes 2024-10-25  2463  	/* If flags changed, we might be able to merge, so try again. */
5ac87a885aecb3f Lorenzo Stoakes 2024-10-25  2464  	if (map.retry_merge) {
5ac87a885aecb3f Lorenzo Stoakes 2024-10-25  2465  		VMG_MMAP_STATE(vmg, &map, vma);
5ac87a885aecb3f Lorenzo Stoakes 2024-10-25  2466  
5ac87a885aecb3f Lorenzo Stoakes 2024-10-25  2467  		vma_iter_config(map.vmi, map.addr, map.end);
5ac87a885aecb3f Lorenzo Stoakes 2024-10-25 @2468  		vma_merge_existing_range(&vmg);
5ac87a885aecb3f Lorenzo Stoakes 2024-10-25  2469  	}
5ac87a885aecb3f Lorenzo Stoakes 2024-10-25  2470  
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2471  	__mmap_complete(&map, vma);
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2472  
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2473  	return addr;
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2474  
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2475  	/* Accounting was done by __mmap_prepare(). */
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2476  unacct_error:
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2477  	if (map.charged)
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2478  		vm_unacct_memory(map.charged);
52956b0d7fb92e3 Lorenzo Stoakes 2024-10-25  2479  abort_munmap:
0d11630cc50a625 Lorenzo Stoakes 2024-10-25  2480  	vms_abort_munmap_vmas(&map.vms, &map.mas_detach);
52956b0d7fb92e3 Lorenzo Stoakes 2024-10-25  2481  	return error;
52956b0d7fb92e3 Lorenzo Stoakes 2024-10-25  2482  }
98aad6cab8cb2a0 Lorenzo Stoakes 2024-12-03  2483  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
