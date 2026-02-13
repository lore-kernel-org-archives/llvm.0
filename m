Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036433B6F0;
	Fri, 13 Feb 2026 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771026114; cv=none; b=EhM/2OSzTZaoPfSHPCf6QDwm+uJtRtsIHVbVdPEDlUzZmGmmlZ+fg4pwS72Hgdun0S86MDp6vtcaQ6wFDPEu1/pZVHTDqaRoA1xcNJEZhgnKj799dfnumBG8Oa/SRmTQlQ2M9qmOzXgdPWw9SvCu+cyR8mwnN3oVSHsA74CCH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771026114; c=relaxed/simple;
	bh=52YihPyyAbwsWi0Sa0Awq7eGGlzMJ3q7gBq7Bpcm6oc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WOpZfdWdTFVzCQSGkbHXR2p0oGMcuQt+O7Zj0jPyyeUXcK7FNygHma1zaJx6OyHNuPlLYzot1wGZQ7I11LE6e97Wpa3iZi0b3CVqv8gzSBlusbX27+hahNQNcz5FpEfeu30kVxV6cqAbikNBCrkxnhW57/Khq4VMh8pzwV4ux94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0YyvcEL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0YyvcEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771026113; x=1802562113;
  h=date:from:to:cc:subject:message-id;
  bh=52YihPyyAbwsWi0Sa0Awq7eGGlzMJ3q7gBq7Bpcm6oc=;
  b=F0YyvcEL1RNlxRZ+OHbL1vBpzcHFf6PUfFvZj6YttErjj5LYG1QDFsli
   cGZ+aGv8EgSl8BoM+8HBe8ouv90ohD2DPsQZN/Ut+BdUEEQ06jigRnLjN
   00jxWbktdKciffH+tczGlaasm/4pFOAQjbZ+x/o05Dz/u+6IQOlYj/45i
   kHMTYzqKCpIklvjPqgQ8c88w3lPyQEwFtzGjNvMXUQgyG+EGqrj/JgagY
   /F8bhgJo50aM911gQosCDx8ysWZBQ4aYGTgEoan/Q52m9NND8AfKr/PGL
   JTyjqVsZwGVR800yOU4+WN9nTWv3M2acjo7labymTJRYuR3hIzLPA8lBf
   g==;
X-CSE-ConnectionGUID: S83nuijhSMKzBS8XBHsxcA==
X-CSE-MsgGUID: 05VLzTsTQWCZWXWAdA5O8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89803620"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="89803620"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:41:52 -0800
X-CSE-ConnectionGUID: QDBA+ZVcR0KbVWCYkldaww==
X-CSE-MsgGUID: YGQebb3DR5q7XKtA1vB50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212894224"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 15:41:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr2nE-00000000vuq-33yO;
	Fri, 13 Feb 2026 23:41:48 +0000
Date: Sat, 14 Feb 2026 07:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 79/84] include/linux/mm.h:3370:2:
 error: call to undeclared function 'kunmap_local'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202602140756.s8iO4ANm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   d4418ddb34578f2e04647ee7cc4f35c86975bffc
commit: c9fea611f0d500e82d97b83a927e2d01a0b52efa [79/84] treewide: Add lock context annotations in all include files
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260214/202602140756.s8iO4ANm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140756.s8iO4ANm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140756.s8iO4ANm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:3370:2: error: call to undeclared function 'kunmap_local'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3370 |         pte_unmap(pte);
         |         ^
   include/linux/pgtable.h:126:2: note: expanded from macro 'pte_unmap'
     126 |         kunmap_local((pte));    \
         |         ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/kunmap_local +3370 include/linux/mm.h

  3355	
  3356	pte_t *pte_offset_map_lock(struct mm_struct *mm, pmd_t *pmd,
  3357				   unsigned long addr, spinlock_t **ptlp)
  3358		__cond_acquires(nonnull, *ptlp);
  3359	
  3360	pte_t *pte_offset_map_ro_nolock(struct mm_struct *mm, pmd_t *pmd,
  3361					unsigned long addr, spinlock_t **ptlp);
  3362	pte_t *pte_offset_map_rw_nolock(struct mm_struct *mm, pmd_t *pmd,
  3363					unsigned long addr, pmd_t *pmdvalp,
  3364					spinlock_t **ptlp);
  3365	
  3366	static inline void pte_unmap_unlock(pte_t *pte, spinlock_t *ptl)
  3367		__releases(ptl)
  3368	{
  3369		spin_unlock(ptl);
> 3370		pte_unmap(pte);
  3371	}
  3372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
