Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710182D9EC2;
	Thu, 12 Mar 2026 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773295928; cv=none; b=Vj16jUvDlLsijbzeHv8FrlE5vkUY4zk5sBtvS/CD5f1nLd11R8mZ8VU//U16fx0d0Zcmi2HPjRkItMO9vbDCYGm0tAYl8+j0GQRiR5PqMqQO2QuJc30ShNwl2Z3IaYGPLIp/O4AZQdluY4K8WRsjYsWfR8cUKqDbP8rQ5917OH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773295928; c=relaxed/simple;
	bh=I+/pNBa0HJA/K0LhDBGf833yZVgyYf1fX3wAXWVfyWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dU6RrzfgUfaJup3tiLH3/88L0z0pRJ3onwRE0Ibyu/80/3A+FvutzceZXNd+nmXKt39Gz/HgV1eNA8nubwtAWVn58hlR8u69yTK+jvB9ytHah2sMF5sdq/MAtG1TCXObjrvvBiJ6g1S6GH4poecuD1fmaxT6S3n5dSL9LoNV8y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdsqSbVC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdsqSbVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773295924; x=1804831924;
  h=date:from:to:cc:subject:message-id;
  bh=I+/pNBa0HJA/K0LhDBGf833yZVgyYf1fX3wAXWVfyWA=;
  b=MdsqSbVCS8bOJY2m7DwZFrZkjGwNHAuKA/rfpmf/zGLEFaWlfsJJ+3ln
   ts6XD4u4JWRtUH+Fq1SfvowyI+BEwXmEwExE8p9qa23XyujTQLEp34atV
   QcAVI5K1YPNYHFSo3GRiKusp1bnh9OPAQ0v81xVD/T9qpiWisM6zWJ76D
   vO/8gYX8MWYKDeSMxxYKAOJRk6LAWbULrsbNs0ds5aDZHzi15haMf8nT0
   PI1NvfjKJOkg0kxfcd7F9bh6KGCejVFiwt4rhpA6VBsxPIPnMI4dxhsH2
   DHvT2pyRd46A78vzBk6W8iVp7yViNTCb/i5V9Omv9GKf8C4haWoHyrae3
   g==;
X-CSE-ConnectionGUID: uQPV7AtDQCma/EvzdGL/Sw==
X-CSE-MsgGUID: dlbRoYRCS86KaNALSfJG8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="61955841"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="61955841"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 23:12:03 -0700
X-CSE-ConnectionGUID: 3HO+lu63QY+8JW6xTERl5A==
X-CSE-MsgGUID: 1X/MVPciR22yzKCDqHe9Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="251208362"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 11 Mar 2026 23:12:02 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0ZH5-000000003Sx-213s;
	Thu, 12 Mar 2026 06:11:59 +0000
Date: Thu, 12 Mar 2026 07:11:46 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ian Rogers <irogers@google.com>
Subject: [peterz-queue:perf/urgent 3/6] kernel/events/core.c:4839:3:
 warning: variable 'pmu' is uninitialized when used here
Message-ID: <202603120700.bXtzJZ09-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/urgent
head:   af07eac4595fcf921f6a4c93b666e3bb896aa3d7
commit: 10d25ea5d989da5bda265b59445e3d494cf892e3 [3/6] perf: Make sure to use pmu_ctx->pmu for groups
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260312/202603120700.bXtzJZ09-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120700.bXtzJZ09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120700.bXtzJZ09-lkp@intel.com/

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
