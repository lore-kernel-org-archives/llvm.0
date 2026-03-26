Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F372C08DC;
	Thu, 26 Mar 2026 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774530690; cv=none; b=HfrztYj/CUaKlcYqD0m8gA2R96Wkomz0nZUqEc/7N+VOTtMoe9dBNZaQInCe/nrhbB58CTI7nX5Mt9HvErlYIImSuQfu8sevGOkFXRnuzkV7tOeZwOzr68XbAdLBjLUxHEoBI8Fkq46r9mLJyEau0OCGOcsBrSyk0o7VhgauQj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774530690; c=relaxed/simple;
	bh=/EN/HX7Dbw6lHi4ibz2kjk8LY4OaAcFQ0ec5CKoZGl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WzAamtOMHxBJEx3XmeUgvCGeBBHqN28qmY2P0eMvDc5xjmc2bnrSP9lUHsXfro86RFAD742G+k1xrNlCvTGIzpi5Dx8jXfySU8pdfFtiy5i2pJPkCk9c9IH/MoywU1GrZxebc3hvgcgphGnJ41RzscStOEtac0d4q6t+RIVWcPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmwDunML; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmwDunML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774530688; x=1806066688;
  h=date:from:to:cc:subject:message-id;
  bh=/EN/HX7Dbw6lHi4ibz2kjk8LY4OaAcFQ0ec5CKoZGl8=;
  b=JmwDunMLPBCw3cIcMlo73Be6qF5ZYrqzrtEYIne3SzTBEnwNcuHmsS2M
   t11o+Ydr1TjztO+ZlPGJ16N1qwVbdcc0bpf3/6n2dFLemvW0Tb++vImD2
   RYn2D/M9P+QNevgb1otzs6hmqZIce+dhL2YPFRm43R315fv2MM02xrh2O
   CyKTkB02aTePSKK5E9F4V8nRAj9U7N0YJQaSPe3m3t+jyKm2FIpKFTQJq
   fdY/iZrOUgJow3fJ9dZ1ZS60HvtmzrTly2RPynrVaLZ6BhFId2EgIQExp
   BbsVEQDWWrAdLmWfsUc0/NGHV3kbbE2n7G9qM3NC62bckN8Fs4vaAzF19
   Q==;
X-CSE-ConnectionGUID: ZIaV7rC4QmyYDYow96GRvQ==
X-CSE-MsgGUID: DhNT8k55Rpa3RxOxjE3O/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="87060949"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="87060949"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 06:11:28 -0700
X-CSE-ConnectionGUID: gU3U1T8yTY+bK67cmAqOlw==
X-CSE-MsgGUID: h9Q6oEUuQYmNG5SEg/3GAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="224928084"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Mar 2026 06:11:27 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5kUe-000000008sf-0tLC;
	Thu, 26 Mar 2026 13:11:24 +0000
Date: Thu, 26 Mar 2026 21:11:00 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 74/95] include/linux/mm.h:3586:9:
 error: call to undeclared function 'pmd_none'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202603262145.DVPa0Idh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   3725aac930bc010283e98a5bc020c40abc6eaa4b
commit: faf5ae90e764936fc9d0e32ecb46576a685ca106 [74/95] treewide: Add lock context annotations in all include files
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260326/202603262145.DVPa0Idh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603262145.DVPa0Idh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603262145.DVPa0Idh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:3586:9: error: call to undeclared function 'pmd_none'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3586 |         return pte_alloc(mm, pmd) ? NULL :
         |                ^
   include/linux/mm.h:3577:38: note: expanded from macro 'pte_alloc'
    3577 | #define pte_alloc(mm, pmd) (unlikely(pmd_none(*(pmd))) && __pte_alloc(mm, pmd))
         |                                      ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1337: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pmd_none +3586 include/linux/mm.h

  3578	
  3579	#define pte_alloc_map(mm, pmd, address)			\
  3580		(pte_alloc(mm, pmd) ? NULL : pte_offset_map(pmd, address))
  3581	
  3582	static inline pte_t *pte_alloc_map_lock(struct mm_struct *mm, pmd_t *pmd,
  3583						unsigned long addr, spinlock_t **ptlp)
  3584		__cond_acquires(nonnull, *ptlp)
  3585	{
> 3586		return pte_alloc(mm, pmd) ? NULL :
  3587					    pte_offset_map_lock(mm, pmd, addr, ptlp);
  3588	}
  3589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
