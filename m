Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA55A1BD9D0;
	Fri, 10 Jul 2026 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716881; cv=none; b=FZff84WzlgOFrFpM3a40YxkL7fkQTeewvJN8lYNI175H5zX7X0emqxldBRUYZpLaAKqo0Ek8600I5Y5v54Y4UUkkVHl4PbcGZN64iyAq5MmHeqmv0+0uKbHT06LcDhJo6OWi0pKmuEVGdb47lvgO/CTbhKwCOFiyapF/T7Qzndg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716881; c=relaxed/simple;
	bh=ufgvTNGe+I32fwGgBejQFwRiEAFRtix7NiO4PxttKUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=shtffHG4UUjJFsBx8VkpBERF8WKoOKABAlNlecyU2ZaQTr67ljqo9OYunz4X6Y+SKJcKwaQ1Yja51Q9AWKgOTAniSBxBAvxrpAKuWNjmeVfeWWhsXRnV+SIG6rO/2xwn7J7c8Wv44W0WcRpFqEjmPV9s/D+mH4cL3X6JJdU94+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcqiXBty; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcqiXBty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783716880; x=1815252880;
  h=date:from:to:cc:subject:message-id;
  bh=ufgvTNGe+I32fwGgBejQFwRiEAFRtix7NiO4PxttKUs=;
  b=IcqiXBtyuotfP2A7knCpc7xVA1sKlVRyZmnM53PcBbd9jntyWI4CyRiD
   owkU4PRTmSV9Jl6LiVzomMO2Yo3z48mVMhLwb8uP1ragQTwdb8fRD2Gk0
   toE3SVWlGZVx6Z03yu/f3BdCBxdxibXStDzyitHH/nB8ycaFaMSWzAvqg
   Pb9ErRf6tKD6tPSRr4g3UPI48b/2yQMo/08Vz1yIYGm+/K9jBswFluwy3
   9M62iNJSf0uVkTHZkcd+5EvR4et4K2Nc2ygbWZHvyEfnLLh/aaLwg7a+9
   tw5kwObsJlMmZTeO2dRAIoqa6v1ofnSBdPzJQf1Uo1OYiTGVlxlBP1ztS
   Q==;
X-CSE-ConnectionGUID: b62+uXxYTbKyRDDTZjdrpQ==
X-CSE-MsgGUID: y+bNQgiIQWiuf9kfZ7dt3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95571469"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95571469"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 13:54:40 -0700
X-CSE-ConnectionGUID: 0Wdr5OXlQRysnOkanXlE2A==
X-CSE-MsgGUID: k5CIbPDvSryOV2l3ORUYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259873774"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jul 2026 13:54:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiIF0-00000000JNZ-1szm;
	Fri, 10 Jul 2026 20:54:34 +0000
Date: Sat, 11 Jul 2026 04:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [powerpc:fixes-test 10/12] kernel/sched/core.c:7449:1:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int
Message-ID: <202607110422.frjmJOf8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
head:   afc2830892a128a13a65f677271a0a48aeb61b5e
commit: 4747e17fe063720a30b1c0075bae3e8f8acd26f4 [10/12] powerpc/32: Use HAVE_PREEMPT_DYNAMIC_CALL instead of HAVE_PREEMPT_DYNAMIC_KEY
config: powerpc-randconfig-002-20260711 (https://download.01.org/0day-ci/archive/20260711/202607110422.frjmJOf8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110422.frjmJOf8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110422.frjmJOf8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:7449:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
         | ^
   include/linux/static_call.h:223:2: note: expanded from macro 'EXPORT_STATIC_CALL_TRAMP'
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^
>> kernel/sched/core.c:7449:26: error: a parameter list without types is only allowed in a function definition
    7449 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
         |                          ^
   kernel/sched/core.c:7522:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    7522 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
         | ^
   include/linux/static_call.h:223:2: note: expanded from macro 'EXPORT_STATIC_CALL_TRAMP'
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^
   kernel/sched/core.c:7522:26: error: a parameter list without types is only allowed in a function definition
    7522 | EXPORT_STATIC_CALL_TRAMP(preempt_schedule_notrace);
         |                          ^
   kernel/sched/core.c:7769:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    7769 | EXPORT_STATIC_CALL_TRAMP(cond_resched);
         | ^
   include/linux/static_call.h:223:2: note: expanded from macro 'EXPORT_STATIC_CALL_TRAMP'
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^
   kernel/sched/core.c:7769:26: error: a parameter list without types is only allowed in a function definition
    7769 | EXPORT_STATIC_CALL_TRAMP(cond_resched);
         |                          ^
   kernel/sched/core.c:7774:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    7774 | EXPORT_STATIC_CALL_TRAMP(might_resched);
         | ^
   include/linux/static_call.h:223:2: note: expanded from macro 'EXPORT_STATIC_CALL_TRAMP'
     223 |         ARCH_ADD_TRAMP_KEY(name)
         |         ^
   kernel/sched/core.c:7774:26: error: a parameter list without types is only allowed in a function definition
    7774 | EXPORT_STATIC_CALL_TRAMP(might_resched);
         |                          ^
   8 errors generated.


vim +/int +7449 kernel/sched/core.c

009f60e2763568 Oleg Nesterov          2014-10-05  7441  
2c9a98d3bc8087 Peter Zijlstra (Intel  2021-01-18  7442) #ifdef CONFIG_PREEMPT_DYNAMIC
b7ebb758568b60 Ingo Molnar            2025-05-28  7443  # ifdef CONFIG_HAVE_PREEMPT_DYNAMIC_CALL
8a69fe0be143b0 Mark Rutland           2022-02-14  7444  #  ifndef preempt_schedule_dynamic_enabled
8a69fe0be143b0 Mark Rutland           2022-02-14  7445  #   define preempt_schedule_dynamic_enabled	preempt_schedule
8a69fe0be143b0 Mark Rutland           2022-02-14  7446  #   define preempt_schedule_dynamic_disabled	NULL
8a69fe0be143b0 Mark Rutland           2022-02-14  7447  #  endif
8a69fe0be143b0 Mark Rutland           2022-02-14  7448  DEFINE_STATIC_CALL(preempt_schedule, preempt_schedule_dynamic_enabled);
ef72661e28c64a Peter Zijlstra         2021-01-25 @7449  EXPORT_STATIC_CALL_TRAMP(preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7450  # elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
99cf983cc8bca4 Mark Rutland           2022-02-14  7451  static DEFINE_STATIC_KEY_TRUE(sk_dynamic_preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7452  void __sched notrace dynamic_preempt_schedule(void)
99cf983cc8bca4 Mark Rutland           2022-02-14  7453  {
99cf983cc8bca4 Mark Rutland           2022-02-14  7454  	if (!static_branch_unlikely(&sk_dynamic_preempt_schedule))
99cf983cc8bca4 Mark Rutland           2022-02-14  7455  		return;
99cf983cc8bca4 Mark Rutland           2022-02-14  7456  	preempt_schedule();
99cf983cc8bca4 Mark Rutland           2022-02-14  7457  }
99cf983cc8bca4 Mark Rutland           2022-02-14  7458  NOKPROBE_SYMBOL(dynamic_preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7459  EXPORT_SYMBOL(dynamic_preempt_schedule);
99cf983cc8bca4 Mark Rutland           2022-02-14  7460  # endif
b7ebb758568b60 Ingo Molnar            2025-05-28  7461  #endif /* CONFIG_PREEMPT_DYNAMIC */
2c9a98d3bc8087 Peter Zijlstra (Intel  2021-01-18  7462) 

:::::: The code at line 7449 was first introduced by commit
:::::: ef72661e28c64ad610f89acc2832ec67b27ba438 sched: Harden PREEMPT_DYNAMIC

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
