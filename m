Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4B179A8;
	Mon, 27 May 2024 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716846589; cv=none; b=OY92G725E2RNvOG189jrinTbiW7YyMuTBmJ+CosLX/RDcjQR8kTa5OArm9FhLdrpXlPSKeJqz5vBVweiJygx0jsaCdEEZBKpwfigfEneW9SzbtW/QX3iRee+zwVUOiC53aVw0inls7QAP34vDTOF4IWUG6nO28E2DU9xqxzW9fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716846589; c=relaxed/simple;
	bh=TaxDK200MLX2XHmYu+OzsBM+c3Zws6ucFlzjhvEu2t0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KsCurZVWBj/rI88vBvCJRHO4WYZAbYq6QEZWibnhKk+JQsJwTpcS8L5aRIBH0mxPBmcGpw8WaefgzKjui2t7t9oCTqfocwRCNh/CTf/N4fL3xWr9cl55kgAzBHDjyqCIsCpLYYkTsWSulJFhD3C4hsz6Y20SNdNvYTHIPihlEsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fu4vhUwr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fu4vhUwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716846587; x=1748382587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TaxDK200MLX2XHmYu+OzsBM+c3Zws6ucFlzjhvEu2t0=;
  b=fu4vhUwrCpQmDtMvKlT9cKrSH8NRnhkPIRS+c+izG+WOvWLKnS0FwIVr
   Fdh+Afv8deWFkynBj12cCtGevVv40jGnRz9nAvCeor9Y+65IjMgcOnEX/
   bzZ9RhKg/WLq2iL7bxqPWvxz3VGgUp2EXRD9+swAOYuuZTddGn2AbZ2Zr
   JM8+hFNGDm4zO+AW3j48wjtBgVM8/grAU3dat/GyJqoqPTP2mSFeEWOda
   3oPyW5EtzQBfZMehwgGdrqD4vq6gN3Toy60OyPwH7n/cHb5/rHlCCe0XI
   UkgZMVzCoUBhntb/J0gKxbpKwAimdvmyndFwr7072vBOVV/T5Nh5IGQNu
   A==;
X-CSE-ConnectionGUID: MF9jS5voQ7qNleh/iBK5xg==
X-CSE-MsgGUID: fSMPPXRhSAiHZBioslhn/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="38555483"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="38555483"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 14:49:46 -0700
X-CSE-ConnectionGUID: oe1W3xljSB+fH3HMu+bWCQ==
X-CSE-MsgGUID: Xkj9r93iQWm4+yqb8h8VjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="72271601"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 May 2024 14:49:45 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBiDu-000B87-0T;
	Mon, 27 May 2024 21:49:42 +0000
Date: Tue, 28 May 2024 05:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/rfc-v2 6/10] mm/execmem.c:244:2: error: call
 to undeclared function 'flush_tlb_kernel_range'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202405280506.0poiRvHZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/rfc-v2
head:   1ed68c458a903b01b26064ff71cc5ac567515aaa
commit: 76352f0fdb291c3691fef5f903ec42d5aced661a [6/10] execmem: add support for cache of large ROX pages
config: arm-randconfig-003-20240528 (https://download.01.org/0day-ci/archive/20240528/202405280506.0poiRvHZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280506.0poiRvHZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280506.0poiRvHZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/execmem.c:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   mm/execmem.c:54:24: error: use of undeclared identifier 'PMD_SIZE'
      54 |                 if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(mas.index, PMD_SIZE)) {
         |                                      ^
   mm/execmem.c:54:59: error: use of undeclared identifier 'PMD_SIZE'
      54 |                 if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(mas.index, PMD_SIZE)) {
         |                                                                         ^
   mm/execmem.c:88:11: error: use of undeclared identifier 'PMD_SIZE'
      88 |                 align = PMD_SIZE;
         |                         ^
   mm/execmem.c:228:30: error: use of undeclared identifier 'PMD_SIZE'
     228 |         alloc_size = round_up(size, PMD_SIZE);
         |                                     ^
>> mm/execmem.c:244:2: error: call to undeclared function 'flush_tlb_kernel_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     244 |         flush_tlb_kernel_range(start, end);
         |         ^
   mm/execmem.c:249:12: error: use of undeclared identifier 'PMD_SHIFT'
     249 |                                        PMD_SHIFT);
         |                                        ^
   1 warning and 6 errors generated.


vim +/flush_tlb_kernel_range +244 mm/execmem.c

   218	
   219	static int execmem_cache_populate(struct execmem_range *range, size_t size)
   220	{
   221		unsigned long vm_flags = VM_FLUSH_RESET_PERMS | VM_ALLOW_HUGE_VMAP;
   222		unsigned long start, end;
   223		struct vm_struct *vm;
   224		size_t alloc_size;
   225		int err = -ENOMEM;
   226		void *p;
   227	
   228		alloc_size = round_up(size, PMD_SIZE);
   229		p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
   230		if (!p)
   231			return err;
   232	
   233		vm = find_vm_area(p);
   234		if (!vm)
   235			goto err_free_mem;
   236	
   237		/* fill memory with instructions that will trap */
   238		execmem_fill_trapping_insns(p, alloc_size, /* writable = */ true);
   239	
   240		start = (unsigned long)p;
   241		end = start + alloc_size;
   242	
   243		vunmap_range_noflush(start, end);
 > 244		flush_tlb_kernel_range(start, end);
   245	
   246		/* FIXME: handle direct map alias */
   247	
   248		err = vmap_pages_range_noflush(start, end, range->pgprot, vm->pages,
   249					       PMD_SHIFT);
   250		if (err)
   251			goto err_free_mem;
   252	
   253		err = execmem_cache_add(p, alloc_size);
   254		if (err)
   255			goto err_free_mem;
   256	
   257		return 0;
   258	
   259	err_free_mem:
   260		vfree(p);
   261		return err;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
