Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031239C631;
	Thu,  7 May 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150592; cv=none; b=oNAUqsRtNC7FOODVCP6qsZBcCTfil/mJDwyUXhyyEekQlIjnCvS+jKbplgNyeE6hNXI2IHcXm7TBYZFoNXoBuOi/PqXVtLnCEGlgLmF1Ku4tWvbEh9k2BxkrlanxWtztxVA00EEppBnBtAef4PwLBNdJHUE5gGuLOnxMyNMzQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150592; c=relaxed/simple;
	bh=mKTCEYj8j65FjZvQC8rApCqQNvkpRKdJ/QeLDCo821c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qljjU7odpjp7WqX/gfv75rV7XHE/AGbnWoUw7d+DLODbZOT6nZZKW+VRTCTzSurUn6ew08KCW/owSP9Iely8wgHBdCws1EsNwwBp9b4JQ3OXJE5tX9o27ZXCtISevg6vl5aNpTOXk1L0Sp6H0Mu3qvwD+pZr/xh0MiFSIc23dac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqsQl07f; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqsQl07f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778150590; x=1809686590;
  h=date:from:to:cc:subject:message-id;
  bh=mKTCEYj8j65FjZvQC8rApCqQNvkpRKdJ/QeLDCo821c=;
  b=IqsQl07fogJrH+QkZDs8hbwOBEaa90y57wkL4WR/8rJlgWRNngevMfCa
   Qe8rte0jQmIafO8X5acSx9bgFf8PqejYk8HjEDGHTTjeHKHg4Cc2945Se
   +ycci3irmDWmeqJI4sMwiZiDUOdHn2zd4fAeQ9G/2m8kkVP4Hyh6w0sXr
   fyagRK7qtvb0DVr4jL83XobXqzvMfNj9Si4WJnDdUADTo7Dflt72TVpR4
   d7zmnuPoJ7YJ8LiYoYVNAIZEIprwjrPTWEAW1JHHoRX4k45wAr2kPxEFd
   3ILyaVPLGulPTa3C5L2DCcx2yJ9Sr1h7zCuj+O4ODN7d+CCSEyq7EnLIx
   g==;
X-CSE-ConnectionGUID: 1x+xhK/5SYKWcbZOWPCGWw==
X-CSE-MsgGUID: 1A6Mk1skREuloXSFMzFtMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78948277"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="78948277"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 03:43:09 -0700
X-CSE-ConnectionGUID: QZ2ksAdgRaG/BnUYUOvrjA==
X-CSE-MsgGUID: M/7SF9gJSgeucn37n36/wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241413805"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 May 2026 03:43:08 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKwC9-000000000BR-10Mm;
	Thu, 07 May 2026 10:43:05 +0000
Date: Thu, 07 May 2026 18:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 1/18] kernel/fork.c:738:2: error:
 call to undeclared function 'drop_cow_context'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202605071818.oG5849si-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 1be9d553f4be97b754471cc04735f215e75c4bf2 [1/18] mm/rmap: add cow_context data structure and assign to mm
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260507/202605071818.oG5849si-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071818.oG5849si-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071818.oG5849si-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/fork.c:738:2: error: call to undeclared function 'drop_cow_context'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     738 |         drop_cow_context(mm);
         |         ^
>> kernel/fork.c:1097:2: error: call to undeclared function 'mm_init_cow_context'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1097 |         mm_init_cow_context(mm);
         |         ^
   kernel/fork.c:1097:2: note: did you mean 'init_new_context'?
   include/asm-generic/mmu_context.h:34:19: note: 'init_new_context' declared here
      34 | static inline int init_new_context(struct task_struct *tsk,
         |                   ^
   2 errors generated.


vim +/drop_cow_context +738 kernel/fork.c

   714	
   715	/*
   716	 * Called when the last reference to the mm
   717	 * is dropped: either by a lazy thread or by
   718	 * mmput. Free the page directory and the mm.
   719	 */
   720	void __mmdrop(struct mm_struct *mm)
   721	{
   722		BUG_ON(mm == &init_mm);
   723		WARN_ON_ONCE(mm == current->mm);
   724	
   725		/* Ensure no CPUs are using this as their lazy tlb mm */
   726		cleanup_lazy_tlbs(mm);
   727	
   728		WARN_ON_ONCE(mm == current->active_mm);
   729		mm_free_pgd(mm);
   730		mm_free_id(mm);
   731		destroy_context(mm);
   732		mmu_notifier_subscriptions_destroy(mm);
   733		check_mm(mm);
   734		put_user_ns(mm->user_ns);
   735		mm_pasid_drop(mm);
   736		mm_destroy_cid(mm);
   737		percpu_counter_destroy_many(mm->rss_stat, NR_MM_COUNTERS);
 > 738		drop_cow_context(mm);
   739	
   740		free_mm(mm);
   741	}
   742	EXPORT_SYMBOL_GPL(__mmdrop);
   743	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
