Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162D432C32E;
	Fri, 29 Aug 2025 15:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756482793; cv=none; b=ZDnOjohj6qltfD2mBORH7oqA+TEDJ9BCAkAftiIfy9SgDOoLGQ8FQ8BkLCCyDMunSORlD/5sQTz0azpiLKfWpdDC6BxVQdtr7Ls4zB9XwOhFck8HVZD0377JDouhEkdZyF0VJVzJCYYKeuEO8hEw2D6gKpgCoTW0qw76KGNS9qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756482793; c=relaxed/simple;
	bh=XKkRs/IcCE9mjve0Gx265u3Mj72r0BXCLoU7/fhGsA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XoFsQz+j1jzBtQdcePZwdNqURqNVYJYzFch6Bw6EuAMqHKM3guvd1aXQ4jIcb7ctsw4jFyzgqvjmzhxKgM1FS/zOza+me+UKiwyKWFkNjdgUD5eKeJkTiaNXezohOTgCv4pw92Efgz6Japd1sb0XWZmndEtZudx91MiGW1HX6ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyDo0JtH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyDo0JtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756482792; x=1788018792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKkRs/IcCE9mjve0Gx265u3Mj72r0BXCLoU7/fhGsA8=;
  b=nyDo0JtHG8ScJUL2z5LshOLJpNuheYdkRAxuwWBFJPt6HWrG4FvUwIX2
   6sHrUqyD3h1vbLzCuA4tl7GWh6M7TB2iMoXrXpPjA15c8CqmSNhWXjZhd
   tqT5i9ZSntHMvJYlCsnArBzAQjqpbFHDrSM2LbayZCri8e0fW8wFz+KeF
   Yz7jAkxsIajXzo0GG3TAaaJH9nUGlkvSj8urIAs+P6s33SDYxuj5SrlMG
   rJ18RqXx8B9aGkety4ZUZNG3GfOAz2krkKFZTG54MRAl3ZBu5FXz1JaJP
   vLHPoC/cwhegrWj37nyMSfax85Nmz+M6ZMamIE7IvQZbcWbl9wmPaZz6o
   A==;
X-CSE-ConnectionGUID: FCBClCUjTai/wLrtXaaong==
X-CSE-MsgGUID: hhTMnqJaRBm0TWgH1CbQbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58696866"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58696866"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 08:53:11 -0700
X-CSE-ConnectionGUID: has8hhHqQSmMSLEh/PUMRg==
X-CSE-MsgGUID: F+oGRAzLQ7KmWjIknfXp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="201324197"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Aug 2025 08:53:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us1PR-000UjD-2K;
	Fri, 29 Aug 2025 15:53:07 +0000
Date: Fri, 29 Aug 2025 23:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kpte 2/6] include/asm-generic/pgalloc.h:144:21:
 warning: variable 'ptdesc' is uninitialized when used here
Message-ID: <202508292320.plYGOdi2-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-004-20250829 (https://download.01.org/0day-ci/archive/20250829/202508292320.plYGOdi2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508292320.plYGOdi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508292320.plYGOdi2-lkp@intel.com/

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
