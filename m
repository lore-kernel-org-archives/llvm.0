Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627E3215056;
	Wed,  5 Feb 2025 04:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738729368; cv=none; b=g5tgh3Q/nOjs/dcGGHWTWWztkTo2dEy43jZNyJWkr9qfDCmckV8FNWkHZBrix8FGZVYeGdDh9a7zhHomdk1LOotS6Fnt8XDp0NcdOjOrK3UrWnFvw9dEMrKmFEmI8eTUcdBzys/FG6oYPaAw8O9SHDydvw1QNP2LMT4+Iv2rYzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738729368; c=relaxed/simple;
	bh=qRCydSc1bWa9uXemEOUCMN4cJ6bF3gXl+tOLoHdi0TI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F2CFod3XAz/Fqtg0R5Gl4RRon+z1gW8Z4l2EZ9MpSuhLG1L7NuPFz81cnVIFY+dNN2q6+SpmSqLcdGt3YYHE6ksig/neCSF+K+ZVWOpvX7rZ74zkO5NdGIS5WzFQOA9NV8l+fHBSMUh4AOA2tCt/JOeWdu4QnaFlKfxKrkxoRjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKggIGt7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKggIGt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738729365; x=1770265365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRCydSc1bWa9uXemEOUCMN4cJ6bF3gXl+tOLoHdi0TI=;
  b=FKggIGt7GA51iXC3EHLXL+694Lc/eMUxLpGU+6FyVd363NxFE4FOxjiI
   g/FIbjKVdPxq3h6CQNLJADYfhabS0FE8/jEJOtdTgm84D1iBsmfdFilIy
   G3/oF3iw+HOsmUqOzM7uWcKmIFaymlpGEQPszXSvMFx22uyHOWexLh2bL
   elJK6VFER7rkk0roJR8hN4Lc9rzKC1Iau9lrPg87xJ3KVvOuiC8GIEu7H
   OnqQ/NlPifcPAsovgGkviJcpziERFAgLYlXrrHnCSEkLOf6BJBBpkgL9G
   kXCwJNQtOPE8vgr0v0EskU3C4ct14TErdPRZWJcz2DCVaAIx6Dj3Rabo8
   A==;
X-CSE-ConnectionGUID: TYHUFfjBTgOzvXWAYLaLsA==
X-CSE-MsgGUID: 1u5LBhlWSRmIsXmrfM/JBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39310326"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; 
   d="scan'208";a="39310326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 20:22:44 -0800
X-CSE-ConnectionGUID: zhYBfjrlRSKeCfHa9bhCnw==
X-CSE-MsgGUID: 8gd/O9v4QGawVwWsTgitQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114850175"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2025 20:22:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfWvw-000tQn-2h;
	Wed, 05 Feb 2025 04:22:40 +0000
Date: Wed, 5 Feb 2025 12:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4 10/13] kernel/kexec_handover.c:104: warning: Function
 parameter or struct member 'mem' not described in 'kho_return_mem'
Message-ID: <202502051237.fgLGQZuN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   a75b813f58b0bc19b2c4b06bd62afc87f02dcb43
commit: 4a0ee0e000d8043b5fea97eb1716f4eda837f9b6 [10/13] arm64: Add KHO support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250205/202502051237.fgLGQZuN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051237.fgLGQZuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051237.fgLGQZuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kexec_handover.c:104: warning: Function parameter or struct member 'mem' not described in 'kho_return_mem'
>> kernel/kexec_handover.c:142: warning: Function parameter or struct member 'mem' not described in 'kho_claim_mem'


vim +104 kernel/kexec_handover.c

076599f0959a3c Alexander Graf 2024-01-17   94  
076599f0959a3c Alexander Graf 2024-01-17   95  /**
076599f0959a3c Alexander Graf 2024-01-17   96   * kho_return_mem - Notify the kernel that initially reserved memory is no
076599f0959a3c Alexander Graf 2024-01-17   97   * longer needed.
076599f0959a3c Alexander Graf 2024-01-17   98   * @mem - memory range that was preserved during kexec handover
076599f0959a3c Alexander Graf 2024-01-17   99   *
076599f0959a3c Alexander Graf 2024-01-17  100   * When the last consumer of a page returns their memory, kho returns the page
076599f0959a3c Alexander Graf 2024-01-17  101   * to the buddy allocator as free page.
076599f0959a3c Alexander Graf 2024-01-17  102   */
076599f0959a3c Alexander Graf 2024-01-17  103  void kho_return_mem(const struct kho_mem *mem)
076599f0959a3c Alexander Graf 2024-01-17 @104  {
076599f0959a3c Alexander Graf 2024-01-17  105  	uint64_t start_pfn, end_pfn, pfn;
076599f0959a3c Alexander Graf 2024-01-17  106  
076599f0959a3c Alexander Graf 2024-01-17  107  	start_pfn = PFN_DOWN(mem->addr);
076599f0959a3c Alexander Graf 2024-01-17  108  	end_pfn = PFN_UP(mem->addr + mem->size);
076599f0959a3c Alexander Graf 2024-01-17  109  
076599f0959a3c Alexander Graf 2024-01-17  110  	for (pfn = start_pfn; pfn < end_pfn; pfn++)
076599f0959a3c Alexander Graf 2024-01-17  111  		kho_return_pfn(pfn);
076599f0959a3c Alexander Graf 2024-01-17  112  }
076599f0959a3c Alexander Graf 2024-01-17  113  EXPORT_SYMBOL_GPL(kho_return_mem);
076599f0959a3c Alexander Graf 2024-01-17  114  
076599f0959a3c Alexander Graf 2024-01-17  115  static int kho_claim_pfn(ulong pfn)
076599f0959a3c Alexander Graf 2024-01-17  116  {
076599f0959a3c Alexander Graf 2024-01-17  117  	struct page *page = pfn_to_online_page(pfn);
076599f0959a3c Alexander Graf 2024-01-17  118  
076599f0959a3c Alexander Graf 2024-01-17  119  	if (!page)
076599f0959a3c Alexander Graf 2024-01-17  120  		return -ENOMEM;
076599f0959a3c Alexander Graf 2024-01-17  121  
076599f0959a3c Alexander Graf 2024-01-17  122  	/* almost as free_reserved_page(), just don't free the page */
076599f0959a3c Alexander Graf 2024-01-17  123  	ClearPageReserved(page);
076599f0959a3c Alexander Graf 2024-01-17  124  	init_page_count(page);
076599f0959a3c Alexander Graf 2024-01-17  125  	adjust_managed_page_count(page, 1);
076599f0959a3c Alexander Graf 2024-01-17  126  
076599f0959a3c Alexander Graf 2024-01-17  127  	return 0;
076599f0959a3c Alexander Graf 2024-01-17  128  }
076599f0959a3c Alexander Graf 2024-01-17  129  
076599f0959a3c Alexander Graf 2024-01-17  130  /**
076599f0959a3c Alexander Graf 2024-01-17  131   * kho_claim_mem - Notify the kernel that a handed over memory range is now
076599f0959a3c Alexander Graf 2024-01-17  132   * in use
076599f0959a3c Alexander Graf 2024-01-17  133   * @mem - memory range that was preserved during kexec handover
076599f0959a3c Alexander Graf 2024-01-17  134   *
076599f0959a3c Alexander Graf 2024-01-17  135   * A kernel subsystem preserved that range during handover and it is going
076599f0959a3c Alexander Graf 2024-01-17  136   * to reuse this range after kexec. The pages in the range are treated as
076599f0959a3c Alexander Graf 2024-01-17  137   * allocated, but not %PG_reserved.
076599f0959a3c Alexander Graf 2024-01-17  138   *
076599f0959a3c Alexander Graf 2024-01-17  139   * Return: virtual address of the preserved memory range
076599f0959a3c Alexander Graf 2024-01-17  140   */
076599f0959a3c Alexander Graf 2024-01-17  141  void *kho_claim_mem(const struct kho_mem *mem)
076599f0959a3c Alexander Graf 2024-01-17 @142  {
076599f0959a3c Alexander Graf 2024-01-17  143  	u64 start_pfn, end_pfn, pfn;
076599f0959a3c Alexander Graf 2024-01-17  144  	void *va = __va(mem->addr);
076599f0959a3c Alexander Graf 2024-01-17  145  
076599f0959a3c Alexander Graf 2024-01-17  146  	start_pfn = PFN_DOWN(mem->addr);
076599f0959a3c Alexander Graf 2024-01-17  147  	end_pfn = PFN_UP(mem->addr + mem->size);
076599f0959a3c Alexander Graf 2024-01-17  148  
076599f0959a3c Alexander Graf 2024-01-17  149  	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
076599f0959a3c Alexander Graf 2024-01-17  150  		int err = kho_claim_pfn(pfn);
076599f0959a3c Alexander Graf 2024-01-17  151  
076599f0959a3c Alexander Graf 2024-01-17  152  		if (err)
076599f0959a3c Alexander Graf 2024-01-17  153  			return NULL;
076599f0959a3c Alexander Graf 2024-01-17  154  	}
076599f0959a3c Alexander Graf 2024-01-17  155  
076599f0959a3c Alexander Graf 2024-01-17  156  	return va;
076599f0959a3c Alexander Graf 2024-01-17  157  }
076599f0959a3c Alexander Graf 2024-01-17  158  EXPORT_SYMBOL_GPL(kho_claim_mem);
076599f0959a3c Alexander Graf 2024-01-17  159  

:::::: The code at line 104 was first introduced by commit
:::::: 076599f0959a3cd16a8d2a95e552f6f83607ef9a kexec: Add KHO parsing support

:::::: TO: Alexander Graf <graf@amazon.com>
:::::: CC: Mike Rapoport <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
