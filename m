Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15C269806;
	Thu,  1 May 2025 23:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142213; cv=none; b=uawtFziZaasAB4ZXCGUit2vYfWKUwoVUhdCMZek8CdYVmc3MFnEHfCu0haYcWM3cPAoWX/a/rwI66RB/q238p8efn5Ibp7B08mhgEin66km6xsYldvk+XL1qTJLYerPFja0rTzCU9Oy1zhMbw/+17zclH3wGJFzHeJnKGf0vX7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142213; c=relaxed/simple;
	bh=aXfmMM0IyA1Pu13nHPIgtToxzTFby9IIeI8NZsGPaNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FbUZQrVkfhNM/AxfLh/h0KC4PxRr5XT9f6Q7errg9P4f2m2xdHPoxQjOioEgmSIdg15ag16epn5c+3Mt0swpisgvGAeVixoRwMA7iVN+22oc+uvJS9JPHbG3URPbz8sxK185YoDIJENGy2LN0pHKpzYva56r3204fV98+VZapeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CU76KPCw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CU76KPCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746142211; x=1777678211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aXfmMM0IyA1Pu13nHPIgtToxzTFby9IIeI8NZsGPaNg=;
  b=CU76KPCwOgFxTvLOug33YIRfKTT19IdBl2jm4wUmZ8Bn1VlALMSS2rEE
   3DVJsnFHgkCxujprPwMvo9J9x2nhVa8BGhbYNTVJfPcQ2W09YDtQqI8ho
   Md20H2BtO5Zfqu9SkBvmnwVL5TkXoT96Ciubs24UQokiNknxd6dU/v2SH
   3/h1YD4npbCoitEJIttU1/VBQBcefSroi8pwMUOESYbSXrIYzh0JXpDMd
   R3uXI2zFixTBavbi40vOeyMSQAcdrMxJHYJO3Y2eq25nZphZ6ZiTzh4c8
   ayXJSGUhPOcm8x1+8RRzfJd/e8kwGvCMxe24JnYZZWr6yHYrNvpraXQgn
   g==;
X-CSE-ConnectionGUID: AWzRPwdcRCiLZxruANeOyA==
X-CSE-MsgGUID: aDJUA0GbS4ysJyK1Li8yKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47915267"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47915267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 16:30:10 -0700
X-CSE-ConnectionGUID: BwCrRmz2Rcuetj5z0SotRA==
X-CSE-MsgGUID: emGAEMbPQGy9juRAWID4vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165564294"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2025 16:30:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAdLy-0004RB-2p;
	Thu, 01 May 2025 23:30:06 +0000
Date: Fri, 2 May 2025 07:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot+extras/v6.15-rc3 128/152]
 fs/resctrl/ctrlmondata.c:585:2: error: call to undeclared function
 'resctrl_arch_mon_ctx_free'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202505020732.1zsVNl1R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.15-rc3
head:   89e83f0ddb42053b6e3e6d4a9ce2fd3dd521c3d6
commit: c4df656cb6afb482b2d7cb0bc404beb995ffe165 [128/152] x86/resctrl: Add stub to allow other architecture to disable monitor overflow
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250502/202505020732.1zsVNl1R-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020732.1zsVNl1R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020732.1zsVNl1R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/resctrl/ctrlmondata.c:585:2: error: call to undeclared function 'resctrl_arch_mon_ctx_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     585 |         resctrl_arch_mon_ctx_free(r, evtid, rr->arch_mon_ctx);
         |         ^
   fs/resctrl/ctrlmondata.c:585:2: note: did you mean 'resctrl_arch_mon_ctx_alloc'?
   arch/x86/include/asm/resctrl.h:197:21: note: 'resctrl_arch_mon_ctx_alloc' declared here
     197 | static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
         |                     ^
   1 error generated.
--
>> fs/resctrl/monitor.c:188:2: error: call to undeclared function 'resctrl_arch_mon_ctx_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     188 |         resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
         |         ^
   fs/resctrl/monitor.c:188:2: note: did you mean 'resctrl_arch_mon_ctx_alloc'?
   arch/x86/include/asm/resctrl.h:197:21: note: 'resctrl_arch_mon_ctx_alloc' declared here
     197 | static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
         |                     ^
   fs/resctrl/monitor.c:632:2: error: call to undeclared function 'resctrl_arch_mon_ctx_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     632 |         resctrl_arch_mon_ctx_free(rr.r, rr.evtid, rr.arch_mon_ctx);
         |         ^
   2 errors generated.


vim +/resctrl_arch_mon_ctx_free +585 fs/resctrl/ctrlmondata.c

37d06f24730eb0 James Morse 2025-04-24  548  
37d06f24730eb0 James Morse 2025-04-24  549  void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
37d06f24730eb0 James Morse 2025-04-24  550  		    struct rdt_mon_domain *d, struct rdtgroup *rdtgrp,
37d06f24730eb0 James Morse 2025-04-24  551  		    cpumask_t *cpumask, int evtid, int first)
37d06f24730eb0 James Morse 2025-04-24  552  {
37d06f24730eb0 James Morse 2025-04-24  553  	int cpu;
37d06f24730eb0 James Morse 2025-04-24  554  
37d06f24730eb0 James Morse 2025-04-24  555  	/* When picking a CPU from cpu_mask, ensure it can't race with cpuhp */
37d06f24730eb0 James Morse 2025-04-24  556  	lockdep_assert_cpus_held();
37d06f24730eb0 James Morse 2025-04-24  557  
37d06f24730eb0 James Morse 2025-04-24  558  	/*
37d06f24730eb0 James Morse 2025-04-24  559  	 * Setup the parameters to pass to mon_event_count() to read the data.
37d06f24730eb0 James Morse 2025-04-24  560  	 */
37d06f24730eb0 James Morse 2025-04-24  561  	rr->rgrp = rdtgrp;
37d06f24730eb0 James Morse 2025-04-24  562  	rr->evtid = evtid;
37d06f24730eb0 James Morse 2025-04-24  563  	rr->r = r;
37d06f24730eb0 James Morse 2025-04-24  564  	rr->d = d;
37d06f24730eb0 James Morse 2025-04-24  565  	rr->first = first;
37d06f24730eb0 James Morse 2025-04-24  566  	rr->arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, evtid);
37d06f24730eb0 James Morse 2025-04-24  567  	if (IS_ERR(rr->arch_mon_ctx)) {
37d06f24730eb0 James Morse 2025-04-24  568  		rr->err = -EINVAL;
37d06f24730eb0 James Morse 2025-04-24  569  		return;
37d06f24730eb0 James Morse 2025-04-24  570  	}
37d06f24730eb0 James Morse 2025-04-24  571  
37d06f24730eb0 James Morse 2025-04-24  572  	cpu = cpumask_any_housekeeping(cpumask, RESCTRL_PICK_ANY_CPU);
37d06f24730eb0 James Morse 2025-04-24  573  
37d06f24730eb0 James Morse 2025-04-24  574  	/*
37d06f24730eb0 James Morse 2025-04-24  575  	 * cpumask_any_housekeeping() prefers housekeeping CPUs, but
37d06f24730eb0 James Morse 2025-04-24  576  	 * are all the CPUs nohz_full? If yes, pick a CPU to IPI.
37d06f24730eb0 James Morse 2025-04-24  577  	 * MPAM's resctrl_arch_rmid_read() is unable to read the
37d06f24730eb0 James Morse 2025-04-24  578  	 * counters on some platforms if its called in IRQ context.
37d06f24730eb0 James Morse 2025-04-24  579  	 */
37d06f24730eb0 James Morse 2025-04-24  580  	if (tick_nohz_full_cpu(cpu))
37d06f24730eb0 James Morse 2025-04-24  581  		smp_call_function_any(cpumask, mon_event_count, rr, 1);
37d06f24730eb0 James Morse 2025-04-24  582  	else
37d06f24730eb0 James Morse 2025-04-24  583  		smp_call_on_cpu(cpu, smp_mon_event_count, rr, false);
37d06f24730eb0 James Morse 2025-04-24  584  
37d06f24730eb0 James Morse 2025-04-24 @585  	resctrl_arch_mon_ctx_free(r, evtid, rr->arch_mon_ctx);
37d06f24730eb0 James Morse 2025-04-24  586  }
37d06f24730eb0 James Morse 2025-04-24  587  

:::::: The code at line 585 was first introduced by commit
:::::: 37d06f24730eb0e770949e2d27f04b9639a994dc AUTO SPLIT

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: James Morse <james.morse@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
