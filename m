Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC03A2E36;
	Thu, 27 Aug 2026 07:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817219; cv=none; b=qn65z6KjXwyaLOckZ2f41x9XV2xpfSjSbJnwvAol+oAilWwQi/I1nZ5oNk7pSjVyBg3/Hd1Dv8pRj2bbc08Ug8cTgzNKFto7XvLsJaMy6DeZ12IKSOb9xMYMkFHB1KX5+y/ZuK/BK/6xxALOli+kda/YbV+ZQPbpPXE7ecTJpl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817219; c=relaxed/simple;
	bh=6XpatlI+dHeGkIrqwIh4hcY27vGRLm+swVbrSIZwGK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iz4skPH2K5lHJr/q0yuSTztlG86HoPkqEVLzecsP9mf2XVsqxgLlkxvWwyBnGgvomlrxRATVNQIb5cDNcJ1g73PsAoCODzvtep45LcccXNS+MMfDqLF7DbUmZe4vd5s6kUzRulyRFt351qsXtZ9jdotXn3Y2CPKrjqFIUrWmIxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efS/vxqK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efS/vxqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787817217; x=1819353217;
  h=date:from:to:cc:subject:message-id;
  bh=6XpatlI+dHeGkIrqwIh4hcY27vGRLm+swVbrSIZwGK4=;
  b=efS/vxqK4UHEjkvnrbfbd9b4y2/cVdc5Fl+PaHQGPxi9xacKcznsFP17
   glsym7U8OPhiM4H2uHO4/iyQC8OORvHSDsvp0zI4F/Oi5m/kyGDIaaeLK
   /Us1Y73vNqgQyu9UxkkigV6x4gOZknFtOu67BojhkEPMORpY2CuryDl67
   zHuO3CX263KegMB9Poo10h3ZsLejY3pM5MlmpKLd7GMQj0OOs9tACgaJs
   tHXVymOIqkGSquuuA/LzlpeKSpU2UN6nuLfRdjS0iY1/l+VTqQF5/vUvS
   Nt+UMNNK6eV+1ICrNCLtqMh030qcCe57pS9w1leB5+Q3oBGS+bOzki4u7
   Q==;
X-CSE-ConnectionGUID: Q9aCpqjkRBCYiAcm4Tp8sw==
X-CSE-MsgGUID: QLG4weI4TrCBeLXQQuRODw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88329629"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88329629"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 00:53:36 -0700
X-CSE-ConnectionGUID: t6aheHulSg2UM3JETcEblw==
X-CSE-MsgGUID: EJh4tLmcRty5c930XVQ5Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="264035018"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Aug 2026 00:53:34 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzUvU-0000000097J-0dFb;
	Thu, 27 Aug 2026 07:53:32 +0000
Date: Thu, 27 Aug 2026 15:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "David Hildenbrand (Arm)" <david@kernel.org>
Subject: [davidhildenbrand:get_dummy 14/21]
 include/linux/pgtable.h:2351:6: error: call to undeclared function
 'mm_pmd_folded'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608271502.qJGgVpP0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Yeoreum,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/davidhildenbrand/linux get_dummy
head:   112a153a97494becabd764fe6257578ba908801f
commit: db92928e80f5332bbfca9a70beaef62d46a0c9de [14/21] x86: mm: carve out the generic compile-time folded pgtable case in effective_prot()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260827/202608271502.qJGgVpP0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271502.qJGgVpP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271502.qJGgVpP0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:31:
>> include/linux/pgtable.h:2351:6: error: call to undeclared function 'mm_pmd_folded'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2351 |         if (mm_pmd_folded(mm))
         |             ^
>> include/linux/pgtable.h:2353:6: error: call to undeclared function 'mm_pud_folded'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2353 |         if (mm_pud_folded(mm))
         |             ^
>> include/linux/pgtable.h:2355:6: error: call to undeclared function 'mm_p4d_folded'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2355 |         if (mm_p4d_folded(mm))
         |             ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];


vim +/mm_pmd_folded +2351 include/linux/pgtable.h

  2331	
  2332	/**
  2333	 * mm_first_pgtable_level - return the first non-folded page-table level
  2334	 * @mm: The mm structure.
  2335	 *
  2336	 * With runtime- or compile-time folded page tables, page-table walkers
  2337	 * effectively skip the folded top-level page tables, treating them as
  2338	 * always-present entries pointing to the next lower-level page table.
  2339	 *
  2340	 * Return the first page-table level in @mm that is not folded.
  2341	 *
  2342	 * Return: the first non-folded page-table level.
  2343	 */
  2344	static inline enum pgtable_level mm_first_pgtable_level(struct mm_struct *mm)
  2345	{
  2346		/*
  2347		 * "PMD folded" actually means "PMD is folded into PUD", and
  2348		 * pud_present() etc. are hard-coded to look like present page table
  2349		 * levels, whereby pmd_present() etc. contain real logic.
  2350		 */
> 2351		if (mm_pmd_folded(mm))
  2352			return PGTABLE_LEVEL_PMD;
> 2353		if (mm_pud_folded(mm))
  2354			return PGTABLE_LEVEL_PUD;
> 2355		if (mm_p4d_folded(mm))
  2356			return PGTABLE_LEVEL_P4D;
  2357		return PGTABLE_LEVEL_PGD;
  2358	}
  2359	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
