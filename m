Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3FF32A3D9;
	Fri, 29 Aug 2025 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756485287; cv=none; b=A5aB7Jm8LfMtnGCeoDtNdxEUvvdy9/9qz/bus7YNxCb3ZPjMCSZM3+cJeOKa6i3dkRcqfczMVYDe2C6CzS4QLpyr8S5dwY2uQrSKgsAWvgxoFqflu4wcaR3jfgvtdT40CzPK/+XcCCs+jRfV3NFQry4nj9YFv3Nb37d3FYpDxV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756485287; c=relaxed/simple;
	bh=PSyZtno1JoUDkX89LLEGe3GPDhjQY52/rF9nhN6uqOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HKkAU/WDwzGedaSo/hhBprll9YXWbuiDQoNVXfcfYqT/xtf3TwD5TLl3hpD17UShYhnKjEY20+AiIv391+m4cvGB6EeTeo0I4KSebTAy/jYgvTE4iUT6qkjb9TqDrdLWnCsLLfKY5DK081TVxmMqfqkQ8WycfX7jzTqCbJVnb5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqvNhyop; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqvNhyop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756485285; x=1788021285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PSyZtno1JoUDkX89LLEGe3GPDhjQY52/rF9nhN6uqOQ=;
  b=aqvNhyopAtt33JV7tiTwhZTHgqnSVCxwWlOWLcKGOs7cEcflSBIUyWs5
   pZgLu9Y1nZlBQyczVM1gHr4F5Iic2xnYzFhL92xaPpPTOBUeOij5UXKZd
   BkgtEV5s966xTVidepiLCwSId8w+E2MFJ1+eGyXmqmbkDLZJg/dW4+1AS
   JewJ/IkryfQvSa5+1hmf6+pb3+IHtSC/1gONQEP/xMNCm2Jv5owQEq/uX
   Ce+AqBD5rpnbChundc6iKAcRg8F/Yjcz3yDg1x0JSQWSz8koRZRCyetza
   2Csk82GJ+Wf6KmV3cPM2oxoUkcPF4oKReUMuZC0TmFKMwIEvCBYV28fOo
   A==;
X-CSE-ConnectionGUID: iBYDvkxnR9Cgkl++6z7B0w==
X-CSE-MsgGUID: 4ihBauxyTB+o2J8/c2NpDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58482966"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58482966"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 09:34:45 -0700
X-CSE-ConnectionGUID: zcivS3DfSkW03fX7mPRohA==
X-CSE-MsgGUID: bzgU7cZrSfKIwgRKDEZdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169989631"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 29 Aug 2025 09:34:43 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us23k-0002uF-2X;
	Fri, 29 Aug 2025 16:34:40 +0000
Date: Fri, 29 Aug 2025 18:33:44 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kpte 2/6] include/asm-generic/pgalloc.h:144:21:
 warning: variable 'ptdesc' is uninitialized when used here
Message-ID: <202508291824.iykihj3B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kpte
head:   d5eaa925a3150c716e8ec564c51069fbdd303fbc
commit: ccbd04de39826d130b67374e68599e128b53acab [2/6] mm: Actually mark kernel page table pages
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250829/202508291824.iykihj3B-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508291824.iykihj3B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508291824.iykihj3B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:110:
   In file included from arch/x86/include/asm/pgalloc.h:13:
>> include/asm-generic/pgalloc.h:144:21: warning: variable 'ptdesc' is uninitialized when used here [-Wuninitialized]
     144 |                 ptdesc_set_kernel(ptdesc);
         |                                   ^~~~~~
   include/asm-generic/pgalloc.h:139:23: note: initialize the variable 'ptdesc' to silence this warning
     139 |         struct ptdesc *ptdesc;
         |                              ^
         |                               = NULL
   include/asm-generic/pgalloc.h:179:21: warning: variable 'ptdesc' is uninitialized when used here [-Wuninitialized]
     179 |                 ptdesc_set_kernel(ptdesc);
         |                                   ^~~~~~
   include/asm-generic/pgalloc.h:175:23: note: initialize the variable 'ptdesc' to silence this warning
     175 |         struct ptdesc *ptdesc;
         |                              ^
         |                               = NULL
   include/asm-generic/pgalloc.h:235:21: warning: variable 'ptdesc' is uninitialized when used here [-Wuninitialized]
     235 |                 ptdesc_set_kernel(ptdesc);
         |                                   ^~~~~~
   include/asm-generic/pgalloc.h:231:23: note: initialize the variable 'ptdesc' to silence this warning
     231 |         struct ptdesc *ptdesc;
         |                              ^
         |                               = NULL
   include/asm-generic/pgalloc.h:281:21: warning: variable 'ptdesc' is uninitialized when used here [-Wuninitialized]
     281 |                 ptdesc_set_kernel(ptdesc);
         |                                   ^~~~~~
   include/asm-generic/pgalloc.h:277:23: note: initialize the variable 'ptdesc' to silence this warning
     277 |         struct ptdesc *ptdesc;
         |                              ^
         |                               = NULL
   4 warnings generated.


vim +/ptdesc +144 include/asm-generic/pgalloc.h

   124	
   125	#ifndef __HAVE_ARCH_PMD_ALLOC_ONE
   126	/**
   127	 * pmd_alloc_one - allocate memory for a PMD-level page table
   128	 * @mm: the mm_struct of the current context
   129	 *
   130	 * Allocate memory for a page table and ptdesc and runs pagetable_pmd_ctor().
   131	 *
   132	 * Allocations use %GFP_PGTABLE_USER in user context and
   133	 * %GFP_PGTABLE_KERNEL in kernel context.
   134	 *
   135	 * Return: pointer to the allocated memory or %NULL on error
   136	 */
   137	static inline pmd_t *pmd_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
   138	{
   139		struct ptdesc *ptdesc;
   140		gfp_t gfp = GFP_PGTABLE_USER;
   141	
   142		if (mm == &init_mm) {
   143			gfp = GFP_PGTABLE_KERNEL;
 > 144			ptdesc_set_kernel(ptdesc);
   145		}
   146		ptdesc = pagetable_alloc_noprof(gfp, 0);
   147		if (!ptdesc)
   148			return NULL;
   149		if (!pagetable_pmd_ctor(mm, ptdesc)) {
   150			pagetable_free(ptdesc);
   151			return NULL;
   152		}
   153		return ptdesc_address(ptdesc);
   154	}
   155	#define pmd_alloc_one(...)	alloc_hooks(pmd_alloc_one_noprof(__VA_ARGS__))
   156	#endif
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
