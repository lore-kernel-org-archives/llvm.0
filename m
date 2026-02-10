Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422ED2D879B;
	Tue, 10 Feb 2026 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713494; cv=none; b=Mgd1ovQ6dLu699v+HnJRmPOSzrtdOXBtTM7RV5xlTEgZ3N3Y7SGI2AiYKVIDjEhSHUWHe1SI44tlyMx3zhcbYCo9JtPrkF+xpaW62ga2y+dTrhan8NpFkMOMGLefmSlKZQMKnEVsCEAljRqYYGklF/mKsFxrRbTMQk/GF2XJ2Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713494; c=relaxed/simple;
	bh=ZItjHolhL5oyMG3Ew4G8CmMCjpYD0xCSOht5MqqAZEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+MO2wg80f63c7rW2hNGvHCEU9RW2+WRLSbhbIlcAp7QV42NkDCvfxygRjMAfq6L4riLJfIGhl+Zy2t6s1QopjyX72fs8/S2sm10OjgTkpPsrnMAns/Hg5GF0PG7RKwYLwl00qVwD9cZOrLD6K2fWP+IHDkhicPHHu5iVJYMca4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RepijvX6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RepijvX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770713494; x=1802249494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZItjHolhL5oyMG3Ew4G8CmMCjpYD0xCSOht5MqqAZEs=;
  b=RepijvX6XMMl0qHpXLC/CEEuKfo5D1UKKLFGQWf8VZteId+hn6btBC8a
   lkRnY8J5PZPEWG7gWfLYCCuYGwuiMUd5g9a1beoxCVYy7GNrrpHF0v84X
   g50vnaS/mGtxuxRxSvV27uA7Vj97vrXawqpsgZb1nWMcw7UokF8JERRjf
   kJifJf6jvE6OmiTnnQ5u+gMiphDG0YaOfrV0q2pfVSU5KIdufds2Hn0FS
   tcsr/oWaULqLXGSyx3BjhZsNH3GTe5eIhBZ13U4i5if/eV31H8sEMOSmF
   pYHbFtnSM8A2HUU4T0K6LF99z0qLdN2u/Ylyv2p7PdZcb9BfcX1SCOFKa
   A==;
X-CSE-ConnectionGUID: ET/s95t6QV+atZf0LKa42A==
X-CSE-MsgGUID: /tMHeuiORiasKPiJmublIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75462112"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75462112"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 00:51:33 -0800
X-CSE-ConnectionGUID: hyRn3uVuRRyIcNY568UNiw==
X-CSE-MsgGUID: atkoFGqkRLyLLpyn/UmsgA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Feb 2026 00:51:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpjSz-00000000opk-1AiJ;
	Tue, 10 Feb 2026 08:51:29 +0000
Date: Tue, 10 Feb 2026 16:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Wenchao Hao <haowenchao22@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: only set fault addrsss' access bit in
 do_anonymous_page
Message-ID: <202602101655.FLOBeato-lkp@intel.com>
References: <20260210043456.2137482-1-haowenchao22@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210043456.2137482-1-haowenchao22@gmail.com>

Hi Wenchao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenchao-Hao/mm-only-set-fault-addrsss-access-bit-in-do_anonymous_page/20260210-123706
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260210043456.2137482-1-haowenchao22%40gmail.com
patch subject: [RFC PATCH] mm: only set fault addrsss' access bit in do_anonymous_page
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602101655.FLOBeato-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101655.FLOBeato-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101655.FLOBeato-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:32:
>> include/linux/pgtable.h:432:45: error: too few arguments to function call, expected 5, have 4
     432 |         page_table_check_ptes_set(mm, ptep, pte, nr);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/page_table_check.h:139:20: note: 'page_table_check_ptes_set' declared here
     139 | static inline void page_table_check_ptes_set(struct mm_struct *mm,
         |                    ^                         ~~~~~~~~~~~~~~~~~~~~~
     140 |                                              unsigned long addr, pte_t *ptep,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     141 |                                              pte_t pte, unsigned int nr)
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +432 include/linux/pgtable.h

   425	
   426	#ifndef set_ptes
   427	static inline void set_anon_ptes(struct mm_struct *mm, unsigned long addr,
   428			unsigned long fault_addr, pte_t *ptep, pte_t pte, unsigned int nr)
   429	{
   430		bool young = pte_young(pte);
   431	
 > 432		page_table_check_ptes_set(mm, ptep, pte, nr);
   433	
   434		for (;;) {
   435			if (young && addr == fault_addr)
   436				pte = pte_mkyoung(pte);
   437			else
   438				pte = pte_mkold(pte);
   439	
   440			set_pte(ptep, pte);
   441			if (--nr == 0)
   442				break;
   443	
   444			addr += PAGE_SIZE;
   445			ptep++;
   446			pte = pte_next_pfn(pte);
   447		}
   448	}
   449	#else
   450	#define set_anon_ptes(mm, addr, fault_addr, ptep, pte, nr) \
   451			set_ptes(mm, addr, ptep, pte, nr)
   452	#endif
   453	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
