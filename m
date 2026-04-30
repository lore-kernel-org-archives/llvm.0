Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E07B40B6FC;
	Thu, 30 Apr 2026 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554045; cv=none; b=KMgVbhgraxdOLy4/U5q5XrtSuNGQ8TkHsPVOksqlZ1n5MEONwmsD1mZsZWiR2V1My0XN9gR1XVvAjdn+88GtRBiKN0hY6nSbBparudZNuR0BcIkwCFeWZ5tTaRkTATpufX8OApRVTdeZWtQpHFBYjJ/x3VuRzh6EHVcHUpOfFIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554045; c=relaxed/simple;
	bh=TzXDbsYGSHTWAezAaEoJRzj54VG5cpwL66zImuy/ACw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TV0jHpcCXgidWM70U53x81gGZliwpZ+v769BbD7ZC+Hq60JZE7pWsgAh2gJ90crrKxNS80yttFdG6pMjHIDpuscZbp6a2Yl5y3Xrgn2S3QUFNTi4B7dolQc6bfvq9B7jUgM8zTfKtLGcv8gNuPhVJsjVDBzfzMWiU6s78nos36M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSvMai43; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSvMai43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777554043; x=1809090043;
  h=date:from:to:cc:subject:message-id;
  bh=TzXDbsYGSHTWAezAaEoJRzj54VG5cpwL66zImuy/ACw=;
  b=LSvMai43VDfDuZDXh7UTcVqtUo7DVGQ5ntT0OmpJZAfVbpjd60ykoM6j
   bc9+eT+xLMuOazoGkgC4FsWXkMCDbVPZnMbtXIdXRK5if92E56/OsU1Zw
   IFhWNJGqWwf9rH+2tf3id8ftKy2fCOAWzjJwJGZjAcyuJEAVMzSDB4/dL
   P5EW8PrTWbxqQrFOQT10WlQXSq/n/AnN0QK3ANtBcqogDGXAqCNmUCG+/
   imFh2es+Bu30FYgy+psJ9SxuQEh8ZjuXs121yG3gJgUfhnRsP0iO7Ix76
   6js92CtBQzNgAMA4wZFLq+ItDJzwXteJr3nP+wBLAWJDkCV6XKJFMw20R
   Q==;
X-CSE-ConnectionGUID: u/mavsmsT9atybh1hFbKFQ==
X-CSE-MsgGUID: rErjrmp/Rh+WsuSxbpkVvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78691798"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="78691798"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 06:00:38 -0700
X-CSE-ConnectionGUID: RJWDCcmOS/CFlb8R2AVJMw==
X-CSE-MsgGUID: 8MweghofT4qcKqzFK3pFpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="239580246"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Apr 2026 06:00:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIR0M-000000004p5-0BcH;
	Thu, 30 Apr 2026 13:00:34 +0000
Date: Thu, 30 Apr 2026 14:59:42 +0200
From: kernel test robot <lkp@intel.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/percpu-vm.c:190:28: error: use of undeclared identifier
 'percpu_pgd'
Message-ID: <202604301449.4Jz6CEe5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yang-Shi/arm64-mm-enable-percpu-kernel-page-table/20260430-122920
head:   7e0c701a28a9dc36bcaf857ae2a956b4f3131bf2
commit: 373b4cb83c6c0116f0501c81416c27dd7c07f8a5 mm: percpu: allocate and free local percpu vm area
date:   8 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260430/202604301449.4Jz6CEe5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301449.4Jz6CEe5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301449.4Jz6CEe5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/percpu.c:1585:
>> mm/percpu-vm.c:190:28: error: use of undeclared identifier 'percpu_pgd'
     190 |                 __pcpu_unmap_pages_local(percpu_pgd[cpu],
         |                                          ^
   mm/percpu-vm.c:283:32: error: use of undeclared identifier 'percpu_pgd'
     283 |                 err = __pcpu_map_pages_local(percpu_pgd[cpu],
         |                                              ^
   mm/percpu-vm.c:299:28: error: use of undeclared identifier 'percpu_pgd'
     299 |                 __pcpu_unmap_pages_local(percpu_pgd[cpu],
         |                                          ^
   mm/percpu.c:3292:32: error: use of undeclared identifier 'percpu_pgd'
    3292 |                 map_local_percpu_first_chunk(percpu_pgd[unit], (unsigned long)pcpu_vm.addr,
         |                                              ^
   4 errors generated.


vim +/percpu_pgd +190 mm/percpu-vm.c

   159	
   160	/**
   161	 * pcpu_unmap_pages - unmap pages out of a pcpu_chunk
   162	 * @chunk: chunk of interest
   163	 * @pages: pages array which can be used to pass information to free
   164	 * @page_start: page index of the first page to unmap
   165	 * @page_end: page index of the last page to unmap + 1
   166	 *
   167	 * For each cpu, unmap pages [@page_start,@page_end) out of @chunk.
   168	 * Corresponding elements in @pages were cleared by the caller and can
   169	 * be used to carry information to pcpu_free_pages() which will be
   170	 * called after all unmaps are finished.  The caller should call
   171	 * proper pre/post flush functions.
   172	 */
   173	static void pcpu_unmap_pages(struct pcpu_chunk *chunk,
   174				     struct page **pages, int page_start, int page_end)
   175	{
   176		unsigned int cpu;
   177		int i;
   178	
   179		for_each_possible_cpu(cpu) {
   180			for (i = page_start; i < page_end; i++) {
   181				struct page *page;
   182	
   183				page = pcpu_chunk_page(chunk, cpu, i);
   184				WARN_ON(!page);
   185				pages[pcpu_page_idx(cpu, i)] = page;
   186			}
   187			__pcpu_unmap_pages(pcpu_chunk_addr(chunk, cpu, page_start),
   188					   page_end - page_start);
   189	
 > 190			__pcpu_unmap_pages_local(percpu_pgd[cpu],
   191						(unsigned long)chunk->local_base + (page_start << PAGE_SHIFT),
   192						page_end - page_start);
   193		}
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
