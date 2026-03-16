Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EBD346AD5;
	Mon, 16 Mar 2026 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773639377; cv=none; b=qtYL8GukE4//fn6urMokpMiJnbET52oRFWYwUpZt0+M2PCHtB0BieXOFH57WnI+XwS2F4VC4hes30XqWEzIDlIpWj4oONldC2n6npFgU6sF8Dv9M6/RqDq3vEodK3ScSKgvP/K6wfGPCi+jHpq1sqtTbXbc3sIN2bECv/hyaEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773639377; c=relaxed/simple;
	bh=TQrpwxjwKJpIMYPWFKr2SiPhE/xxOkxz2fJVGxV+kxI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jcRBtxRyj1aADwDt/e37ZcTZh0ZL9CjD59VtP1Qj+sybuWzqLppvdYgTTl7Bq6UMr7ovmQMdIhGMvOdzXg1IYtvOCg3SgY71ZAzST7Fnw0vEI7uFhO8omd54TKjMAbv0ssGCtziKZPS+gTdPfynVrRvc6DiNaPVYmr0U1qmzo0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGF8iLXL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGF8iLXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773639376; x=1805175376;
  h=date:from:to:cc:subject:message-id;
  bh=TQrpwxjwKJpIMYPWFKr2SiPhE/xxOkxz2fJVGxV+kxI=;
  b=fGF8iLXLTjYevw44Am9D9GZ/z4Xb26fMDF/1d2aYODHm1+RQjcEDCr/S
   7deZgEo3KXAB8o8NQ3q00F+9c44P2PykBjjPnigklD1Q1pyVWIiHJHPBM
   7/O17jiQBeiLLH+nEHK3PKY2YEc4Lw8xCY4Y2LixFlxQ9HfKL9KDg61sI
   /LCCgeRaf4yM4kTPb3Ad4Yc+FgE2tUIegOlRejI77C3gbVb7h4ikBfKxu
   mThM8z6xOL6S2xtL9ry0R/yvbkCsnN+fOjKpOV91XpjoPTEU1QCJJ+ICK
   6sPOyrEpkwxA7Rx5yH+zg16fCrTR6UFrb3wcjMDU9P27rdPnOdQ1Dx3WO
   g==;
X-CSE-ConnectionGUID: 6y7ck6QlT5aJCvsNU9Od9A==
X-CSE-MsgGUID: Fq8Ga2CwT5+/EzXD/mms+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85350304"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="85350304"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 22:36:13 -0700
X-CSE-ConnectionGUID: 3+xV6hKyQVCm8dLHfq7Dng==
X-CSE-MsgGUID: PUW9PWqGSH2TLxugobRD0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="221034557"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Mar 2026 22:36:11 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w20ca-0000000008U-0RUo;
	Mon, 16 Mar 2026 05:36:08 +0000
Date: Mon, 16 Mar 2026 13:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linus Walleij <linusw@kernel.org>
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
 7/13] kernel/fork.c:260:28: error: use of undeclared identifier
 'THREAD_PREALLOC_PAGES'
Message-ID: <202603161308.popksHjh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
head:   3ea8b0381a0759fa0c71abae5274db2414b58e78
commit: d2ee0928bdd182aed09a1eabb9c008eef73bb442 [7/13] fork: Dynamic Kernel Stacks
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260316/202603161308.popksHjh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project f46a5153850c1303d687233d4adf699b01041da8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161308.popksHjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161308.popksHjh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/fork.c:260:28: error: use of undeclared identifier 'THREAD_PREALLOC_PAGES'
     260 |                         if (vm_area->nr_pages > THREAD_PREALLOC_PAGES)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/THREAD_PREALLOC_PAGES +260 kernel/fork.c

   238	
   239	static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
   240	{
   241		unsigned int i;
   242		int nid;
   243	
   244		/*
   245		 * Don't cache stacks if any of the pages don't match the local domain, unless
   246		 * there is no local memory to begin with.
   247		 *
   248		 * Note that lack of local memory does not automatically mean it makes no difference
   249		 * performance-wise which other domain backs the stack. In this case we are merely
   250		 * trying to avoid constantly going to vmalloc.
   251		 */
   252		scoped_guard(preempt) {
   253			if (IS_ENABLED(CONFIG_DYNAMIC_STACK)) {
   254				/*
   255				 * If we have faulted in more than the default number of
   256				 * stack pages to a stack, don't re-use it. This makes sure
   257				 * a process never use more than THREAD_PREALLOC_PAGES
   258				 * at the outset.
   259				 */
 > 260				if (vm_area->nr_pages > THREAD_PREALLOC_PAGES)
   261					return false;
   262			}
   263			nid = numa_node_id();
   264			if (node_state(nid, N_MEMORY)) {
   265				for (i = 0; i < vm_area->nr_pages; i++) {
   266					struct page *page = vm_area->pages[i];
   267					if (page_to_nid(page) != nid)
   268						return false;
   269				}
   270			}
   271	
   272			for (i = 0; i < NR_CACHED_STACKS; i++) {
   273				struct vm_struct *tmp = NULL;
   274	
   275				if (this_cpu_try_cmpxchg(cached_stacks[i], &tmp, vm_area))
   276					return true;
   277			}
   278		}
   279		return false;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
