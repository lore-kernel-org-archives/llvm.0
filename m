Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE32253E1;
	Fri, 15 Aug 2025 05:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755236132; cv=none; b=IPWMa7i8iBp7UB18xIXL7k7HlfAuYXegOWdKfWdpS4eWovfQVe8497KM50jmxr1hZokuMwN7GC/eyE4h/LbBZhnT4TxSwvTG4I/isUZM+Vlh/6M5hMNjrqGmwOE7qRnkMbmy53zicZBOU78PadZpJ2fhlMHT71xRDBg74fC8DNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755236132; c=relaxed/simple;
	bh=b/hPbzL/KwmxnKdeia+zSNTzACLuSN3/z2c6A+Whs/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsg1Q9cxCO+YdY+2j/RhXvxSai+25r34GzGNeWxA9knj26BJebmFNFnd6Q5jXh/BPUkgjQRcniO3lBaz+d9eSTu7yA5jbC+XN7XejepJ8ALR2nkF93l05DP/laMpb6eAepbOgNsRul23MqM5xDS/Y5+tqCqDBpg6CJ1kopZPgcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTJwmn6h; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTJwmn6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755236130; x=1786772130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b/hPbzL/KwmxnKdeia+zSNTzACLuSN3/z2c6A+Whs/s=;
  b=YTJwmn6h9h/upPUthTceKUIbmIE/rJn2tmbiabEFllxyPvhknFU9AqD/
   w2rXST2UUA5yFFjuzeQGxvwUyizSgVcGKW/iDiwoJ3t6zmge7N4sIQT5R
   p86EpQF9LugL03xHRVb9FDBgDLIabtDkRhhLCGUCt+Di+e+dQKZ/apJWe
   +WnJ4Dkj2QSkrcEll67FMW6L03LGG41pmYXjrVjKvt38kjPRBr3yeTOOD
   +17ii/PPZuTC6Iw4C+OoG5F3ceto4w+SBPWt70qCpb33+kllN8ZvHvn3I
   KpKagzyGPiSjxQXuEgbVvg7c3pRGlP3HW6BSWAOUDtnbxXKNV8E3RoSgD
   w==;
X-CSE-ConnectionGUID: E7E2jmnXTCCrcgJxJAKKBA==
X-CSE-MsgGUID: ssVP5juaTTqrQTzd3YYSMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="82995300"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="82995300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 22:35:30 -0700
X-CSE-ConnectionGUID: tnXbuFHASJa5T+IvKPaWkQ==
X-CSE-MsgGUID: NHhgg+8mQ9+yjzBPmk4reg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166915489"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2025 22:35:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umn66-000Bbo-2X;
	Fri, 15 Aug 2025 05:35:26 +0000
Date: Fri, 15 Aug 2025 13:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/7] mm: memory: add ptep_clear_flush_range function
Message-ID: <202508151338.3rHqeTte-lkp@intel.com>
References: <20250814113813.4533-3-vernon2gm@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814113813.4533-3-vernon2gm@gmail.com>

Hi Vernon,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/mm-memory-replace-single-operation-with-multi-operation-in-wp/20250814-195529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250814113813.4533-3-vernon2gm%40gmail.com
patch subject: [RFC PATCH 2/7] mm: memory: add ptep_clear_flush_range function
config: arm-randconfig-002-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151338.3rHqeTte-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151338.3rHqeTte-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151338.3rHqeTte-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/pgtable-generic.c:120:3: error: call to undeclared function 'flush_tlb_mm_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     120 |                 flush_tlb_mm_range(vma->vm_mm, address, address + nr * PAGE_SIZE,
         |                 ^
   1 error generated.


vim +/flush_tlb_mm_range +120 mm/pgtable-generic.c

   104	
   105	void ptep_clear_flush_range(struct vm_area_struct *vma, unsigned long address,
   106				    pte_t *ptep, unsigned int nr)
   107	{
   108		struct mm_struct *mm = (vma)->vm_mm;
   109		bool accessible = false;
   110		pte_t pte;
   111		int i;
   112	
   113		for (i = 0; i < nr; i++) {
   114			pte = ptep_get_and_clear(mm, address + i * PAGE_SIZE, ptep + i);
   115			if (!accessible && pte_accessible(mm, pte))
   116				accessible = true;
   117		}
   118	
   119		if (accessible) {
 > 120			flush_tlb_mm_range(vma->vm_mm, address, address + nr * PAGE_SIZE,
   121					   PAGE_SHIFT, false);
   122		}
   123	}
   124	#endif
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
