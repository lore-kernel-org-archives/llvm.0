Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076EB59B71;
	Sun, 15 Sep 2024 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726433130; cv=none; b=EdjbVhP+Uqba+dN/02m9MEG2MMRxy1fJ/QMekQdf8o4yOwXCQlpMPn/hzzTmVNzcUH8liLB1+aagL0ThWo+oChrfa4TfRdvVd3ZNJwFbOVuVnFYdbnVr2014BCMoVpwbwqPekXu/tR2FoUQMReC/kAQWnyRF9hVhVowMfJNNuO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726433130; c=relaxed/simple;
	bh=6jBzht1S3y7aXeCyAWtcxbiaUcniCy+9S1zqYBvHckg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lzqcw9wtUSkYxCFae6ioh8kFHnR470Ktp8vnWW2IICl/2b60l9oSfYA+LI/7nP5J/ltIYmSGvBiM+AiI521yrmF3lh/3ierHjdcEs/bWfJbm5/SI0R1dAjWA8VYTDhDgj2XQUbKQXWM3h1VyWw9J+o33NbwYrotB/mjeNlbFsjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yu3XN2DO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yu3XN2DO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726433128; x=1757969128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6jBzht1S3y7aXeCyAWtcxbiaUcniCy+9S1zqYBvHckg=;
  b=Yu3XN2DOxh7OdTM6ot+NwN+4oy7gw3aAzN06rhkAW/ADGZSh7APh4Xe7
   g93GPiCJQIJW3U7G69xqEoSWhuij5EXJxxx7LKdbT9IKGiRLTxdEpZQOT
   ue3fBT1icUfFmXKEUdMtqPCLrbYxn3/UPQfgrTfZK8MECwi3Rk2cDJpQk
   kvMpKNOcDkCdhJjOUcr2/OJb2u1dBmuOQYnipqVyAdcO9D3XD2lcor4h1
   qlHsklPyXqOJy9hkLcY6ejTyJzxVEQ8+mFppuc10rAVYMMBdtnRtD4b4C
   5KqL9maHM5WDSAxF+Fd6ZAkGQvVHF1zsWHkDoAAkcEHwAv6e/QTviMuba
   w==;
X-CSE-ConnectionGUID: IMXHDz6iQF6pBMGF1dAt6Q==
X-CSE-MsgGUID: 2BJD1tDASPeTGc1J/7rb5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25417353"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25417353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 13:45:24 -0700
X-CSE-ConnectionGUID: rkt/a3UjTb+rGdiUx9XgLg==
X-CSE-MsgGUID: EAAWriznSb2Qsjc2KijpIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="99543134"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Sep 2024 13:45:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spw7U-00092T-0s;
	Sun, 15 Sep 2024 20:45:20 +0000
Date: Mon, 16 Sep 2024 04:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: Haider Miraj <hmiraj@cisco.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] proc: Add mmap callback for /proc/<pid>/mem
Message-ID: <202409160450.N6EXHAts-lkp@intel.com>
References: <20240913174003.1786581-1-hmiraj@cisco.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913174003.1786581-1-hmiraj@cisco.com>

Hi Haider,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.11]
[cannot apply to next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haider-Miraj/proc-Add-mmap-callback-for-proc-pid-mem/20240914-014144
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240913174003.1786581-1-hmiraj%40cisco.com
patch subject: [PATCH] [RFC] proc: Add mmap callback for /proc/<pid>/mem
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240916/202409160450.N6EXHAts-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160450.N6EXHAts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160450.N6EXHAts-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/base.c:1022:20: error: too many arguments to function call, expected 6, have 7
    1021 |                 pinned = get_user_pages_remote(mm, addr, 1, FOLL_GET | FOLL_NOFAULT,
         |                          ~~~~~~~~~~~~~~~~~~~~~
    1022 |                                                 &page, NULL, NULL);
         |                                                              ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   include/linux/mm.h:2462:6: note: 'get_user_pages_remote' declared here
    2462 | long get_user_pages_remote(struct mm_struct *mm,
         |      ^                     ~~~~~~~~~~~~~~~~~~~~~
    2463 |                            unsigned long start, unsigned long nr_pages,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2464 |                            unsigned int gup_flags, struct page **pages,
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2465 |                            int *locked);
         |                            ~~~~~~~~~~~
   1 error generated.


vim +1022 fs/proc/base.c

   970	
   971	/**
   972	 * mem_mmap - Memory mapping function
   973	 *
   974	 * This function implements mmap call for /proc/<pid>/mem.
   975	 *
   976	 * Assumptions and Limitations:
   977	 * - This function does not handle reverse mapping, which is required for swapping.
   978	 * - The VMA is not expected to be split with an unmap call.
   979	 */
   980	static int mem_mmap(struct file *file, struct vm_area_struct *vma)
   981	{
   982		uintptr_t addr, target_start_addr, target_end_addr;
   983		struct page_list_item *item;
   984		struct page *page, *zero_page;
   985		unsigned long zero_page_pfn;
   986		struct vma_info *info;
   987		long pinned;
   988		int ret;
   989	
   990		/* Retrieve mm of the target process*/
   991		struct mm_struct *mm = (struct mm_struct *)file->private_data;
   992		size_t size = vma->vm_end - vma->vm_start;
   993		uintptr_t start_addr = vma->vm_start;
   994	
   995		target_start_addr = vma->vm_pgoff << PAGE_SHIFT; /* Multiply by PAGE_SIZE */
   996		target_end_addr = target_start_addr + size;
   997	
   998		if (!mm)
   999			return -EINVAL;
  1000	
  1001		info = kmalloc(sizeof(struct vma_info), GFP_KERNEL);
  1002		if (!info)
  1003			return -ENOMEM;
  1004		INIT_LIST_HEAD(&info->page_list_head);
  1005		info->vma_start_addr = vma->vm_start;
  1006		info->vma_end_addr = vma->vm_end;
  1007	
  1008		vma->vm_private_data = info;
  1009		vma->vm_ops = &mem_vm_ops;
  1010	
  1011		zero_page = ZERO_PAGE(0);
  1012		zero_page_pfn = page_to_pfn(zero_page);
  1013	
  1014		/* Acquire the mmap_lock before pinning the page (get_user_pages_remote) */
  1015		down_read(&mm->mmap_lock);
  1016	
  1017		for (addr = target_start_addr; addr < target_end_addr; addr += PAGE_SIZE) {
  1018			unsigned long pfn;
  1019	
  1020			/* Pin the user page */
  1021			pinned = get_user_pages_remote(mm, addr, 1, FOLL_GET | FOLL_NOFAULT,
> 1022							&page, NULL, NULL);
  1023			/* Page is not resident (FOLL_NOFAULT), we will skip to the next address */
  1024			if (pinned <= 0) {
  1025				ret = remap_pfn_range(vma, start_addr, zero_page_pfn, PAGE_SIZE,
  1026						vma->vm_page_prot);
  1027				if (ret)
  1028					goto err_unlock;
  1029				start_addr += PAGE_SIZE;
  1030				continue;
  1031			}
  1032	
  1033			/* We need to keep track of pages which are pinned */
  1034			item = kmalloc(sizeof(struct page_list_item), GFP_KERNEL);
  1035			if (!item) {
  1036				kfree(info);
  1037				return -ENOMEM;
  1038			}
  1039	
  1040			item->page = page;
  1041			list_add(&item->list, &info->page_list_head);
  1042			pfn = page_to_pfn(page);
  1043	
  1044			/* Remap the page frame under current vma */
  1045			ret = remap_pfn_range(vma, start_addr, pfn, PAGE_SIZE,
  1046						vma->vm_page_prot);
  1047			if (ret)
  1048				kfree(item);
  1049	
  1050			start_addr += PAGE_SIZE;
  1051		}
  1052	err_unlock:
  1053		up_read(&mm->mmap_lock);
  1054		return 0;
  1055	}
  1056	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
