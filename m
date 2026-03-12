Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E46D38CFF9;
	Thu, 12 Mar 2026 04:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288639; cv=none; b=HRjDGedVTHodQXgTUfSE3mMONyGYMdYLJsIYmVYUVIlIUbsiOgsAfF1dxztl3d4SOFH2ANqM0a/EWKAryFpyngq2/00aHF0Yu3N2IpPIR2lmRZnHGZz/727LSms8C0LMV56iWy7m82Stm48WNBxAWA2qiPf3F7M+lkid9Kd2nEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288639; c=relaxed/simple;
	bh=zh5Zn1BEr7RxI6CSl8nRdmg4fT4T8fA4qECGfo9E+2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uf3Ikr9MS3Rz1fRtILRhvMJbX8e6Nh9tCJa/UBSw3uFmSxvEbgziCeV65Oudd4iEgpkvQAOHmp9c4zkCuMIwExzQco7SHzFo+IYKVktUXK2Zd3gKRlRWFLF9SVQ/UnaguKFeL35z2a6XGZUCrslSVTcKt1NiX4yGCogz7tOgBV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXjC4qJ7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXjC4qJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773288637; x=1804824637;
  h=date:from:to:cc:subject:message-id;
  bh=zh5Zn1BEr7RxI6CSl8nRdmg4fT4T8fA4qECGfo9E+2E=;
  b=kXjC4qJ7VxfmpOd+1iJe/t86jEGU72ExBCaQ6vOZmTG9fLtHwPP/9rTw
   Ulluq/VZT59qRDfUAK65/Q8eubTWg+423kH9WzGd7VL/PDAZqghRNCTwS
   bzwvVBAN8+W2+NRKm19OqckbkolUVgjh68N6SkYncJUNKuGD/Xjgor6ug
   Arzvx2/A4EaiqmPX1eGTckfF3lGWA0gFF/0Bpiwt+CMpvsALTorVrpOH2
   JDkRlADArIkDE1qBKdke2F0eVTyPbChBx2LHPs80A890QeYNxxU9PwqFA
   96rKMFCTqUIwtVb/5IyABqIfp/w+y0HMLNA4cZitRHQckxqacpyIxeCZ4
   w==;
X-CSE-ConnectionGUID: ag9tb3vaQjKjeuMPxakByQ==
X-CSE-MsgGUID: vZX36nyKSF2fzj5D/UWwkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84689868"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="84689868"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:10:34 -0700
X-CSE-ConnectionGUID: f7QujYEdSd2duMeZ+DNJAA==
X-CSE-MsgGUID: HYIf26B/RGKTxwcJn7XB5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="246144306"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 21:10:32 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XNV-0000000023j-3oRN;
	Thu, 12 Mar 2026 04:10:29 +0000
Date: Thu, 12 Mar 2026 12:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ian Rogers <irogers@google.com>
Subject: [peterz-queue:perf/urgent 3/6] kernel/events/core.c:4839:3:
 warning: variable 'pmu' is uninitialized when used here
Message-ID: <202603121259.28y3L4qz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/urgent
head:   af07eac4595fcf921f6a4c93b666e3bb896aa3d7
commit: 10d25ea5d989da5bda265b59445e3d494cf892e3 [3/6] perf: Make sure to use pmu_ctx->pmu for groups
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260312/202603121259.28y3L4qz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121259.28y3L4qz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121259.28y3L4qz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:4839:3: warning: variable 'pmu' is uninitialized when used here [-Wuninitialized]
    4839 |                 pmu->read(event);
         |                 ^~~
   kernel/events/core.c:4816:17: note: initialize the variable 'pmu' to silence this warning
    4816 |         struct pmu *pmu;
         |                        ^
         |                         = NULL
   1 warning generated.


vim +/pmu +4839 kernel/events/core.c

d6a2f9035bfc27d kernel/events/core.c  David Carrillo-Cisneros 2016-08-17  4806  
0793a61d4df8dae kernel/perf_counter.c Thomas Gleixner         2008-12-04  4807  /*
cdd6c482c9ff9c5 kernel/perf_event.c   Ingo Molnar             2009-09-21  4808   * Cross CPU call to read the hardware event
0793a61d4df8dae kernel/perf_counter.c Thomas Gleixner         2008-12-04  4809   */
cdd6c482c9ff9c5 kernel/perf_event.c   Ingo Molnar             2009-09-21  4810  static void __perf_event_read(void *info)
0793a61d4df8dae kernel/perf_counter.c Thomas Gleixner         2008-12-04  4811  {
0492d4c5b8c4dc3 kernel/events/core.c  Peter Zijlstra          2015-09-03  4812  	struct perf_read_data *data = info;
0492d4c5b8c4dc3 kernel/events/core.c  Peter Zijlstra          2015-09-03  4813  	struct perf_event *sub, *event = data->event;
cdd6c482c9ff9c5 kernel/perf_event.c   Ingo Molnar             2009-09-21  4814  	struct perf_event_context *ctx = event->ctx;
bd27568117664b8 kernel/events/core.c  Peter Zijlstra          2022-10-08  4815  	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
10d25ea5d989da5 kernel/events/core.c  Peter Zijlstra          2026-03-09  4816  	struct pmu *pmu;
621a01eac89b5e2 kernel/perf_counter.c Ingo Molnar             2008-12-11  4817  
e1ac3614ff606ae kernel/perf_counter.c Paul Mackerras          2009-08-14  4818  	/*
e1ac3614ff606ae kernel/perf_counter.c Paul Mackerras          2009-08-14  4819  	 * If this is a task context, we need to check whether it is
e1ac3614ff606ae kernel/perf_counter.c Paul Mackerras          2009-08-14  4820  	 * the current task context of this cpu.  If not it has been
e1ac3614ff606ae kernel/perf_counter.c Paul Mackerras          2009-08-14  4821  	 * scheduled out before the smp call arrived.  In that case
cdd6c482c9ff9c5 kernel/perf_event.c   Ingo Molnar             2009-09-21  4822  	 * event->count would have been updated to a recent sample
cdd6c482c9ff9c5 kernel/perf_event.c   Ingo Molnar             2009-09-21  4823  	 * when the event was scheduled out.
e1ac3614ff606ae kernel/perf_counter.c Paul Mackerras          2009-08-14  4824  	 */
e1ac3614ff606ae kernel/perf_counter.c Paul Mackerras          2009-08-14  4825  	if (ctx->task && cpuctx->task_ctx != ctx)
e1ac3614ff606ae kernel/perf_counter.c Paul Mackerras          2009-08-14  4826  		return;
e1ac3614ff606ae kernel/perf_counter.c Paul Mackerras          2009-08-14  4827  
10d25ea5d989da5 kernel/events/core.c  Peter Zijlstra          2026-03-09  4828  	guard(raw_spinlock)(&ctx->lock);
9a32bd9901fe5b1 kernel/events/core.c  Peter Zijlstra          2024-08-07  4829  	ctx_time_update_event(ctx, event);
0492d4c5b8c4dc3 kernel/events/core.c  Peter Zijlstra          2015-09-03  4830  
0d3d73aac2ff05c kernel/events/core.c  Peter Zijlstra          2017-09-05  4831  	perf_event_update_time(event);
0d3d73aac2ff05c kernel/events/core.c  Peter Zijlstra          2017-09-05  4832  	if (data->group)
0d3d73aac2ff05c kernel/events/core.c  Peter Zijlstra          2017-09-05  4833  		perf_event_update_sibling_time(event);
0c1cbc18df9e381 kernel/events/core.c  Peter Zijlstra          2017-09-05  4834  
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4835  	if (event->state != PERF_EVENT_STATE_ACTIVE)
10d25ea5d989da5 kernel/events/core.c  Peter Zijlstra          2026-03-09  4836  		return;
0492d4c5b8c4dc3 kernel/events/core.c  Peter Zijlstra          2015-09-03  4837  
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4838  	if (!data->group) {
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03 @4839  		pmu->read(event);
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4840  		data->ret = 0;
10d25ea5d989da5 kernel/events/core.c  Peter Zijlstra          2026-03-09  4841  		return;
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4842  	}
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4843  
10d25ea5d989da5 kernel/events/core.c  Peter Zijlstra          2026-03-09  4844  	pmu = event->pmu_ctx->pmu;
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4845  	pmu->start_txn(pmu, PERF_PMU_TXN_READ);
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4846  
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4847  	pmu->read(event);
0492d4c5b8c4dc3 kernel/events/core.c  Peter Zijlstra          2015-09-03  4848  
8ce939a0fa19493 kernel/events/core.c  Peter Zijlstra (Intel   2025-01-21  4849) 	for_each_sibling_event(sub, event)
8ce939a0fa19493 kernel/events/core.c  Peter Zijlstra (Intel   2025-01-21  4850) 		perf_pmu_read(sub);
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4851  
4a00c16e552ea5e kernel/events/core.c  Sukadev Bhattiprolu     2015-09-03  4852  	data->ret = pmu->commit_txn(pmu);
0793a61d4df8dae kernel/perf_counter.c Thomas Gleixner         2008-12-04  4853  }
0793a61d4df8dae kernel/perf_counter.c Thomas Gleixner         2008-12-04  4854  

:::::: The code at line 4839 was first introduced by commit
:::::: 4a00c16e552ea5e71756cd29cd2df7557ec9cac4 perf/core: Define PERF_PMU_TXN_READ interface

:::::: TO: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
