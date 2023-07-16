Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C209187B;
	Sun, 16 Jul 2023 05:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689485454; x=1721021454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1Ca9LxS7ouLYThHJe/SoIaAMC2lN8dy/Cg4XS11I9s=;
  b=LHIdTa/cbYN4fxXbTsDv+EnK0v7rH//xEiX1KjjacAIe7WRxDlRTIs92
   9i1GA7qLqZaGzji9883Uogp3yqUysARVVwpUnL/bMp5XsyfTvOL6vTRpj
   0V84WL2sPQ5Mi0Sc1lSwGmHIBxZkSDv8/y+Hgv7AICEBPncyLG+eg8xPc
   sqzWkV3FcHdcaRw83VkV3Z1hjuOg4BHWXhCwbPw+/zNOtc2yJzvwc/lZq
   wuaEu5usyYGPuKt3oBZf9tPg/s1VBDzwlUp4q3p5YZLs74lUjyOFUyDDp
   TxA6S7poFsHAOV8Q+8L6UDFdjgLFUrlPXOBzS1WCgL4c+IZ/lYUMzX5NL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="369279213"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="369279213"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 22:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="726141628"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="726141628"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Jul 2023 22:30:16 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKuKl-0008ct-1w;
	Sun, 16 Jul 2023 05:30:15 +0000
Date: Sun, 16 Jul 2023 13:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:overutilized-affinity 1/1] kernel/sched/fair.c:4650:8:
 error: call to undeclared function 'task_fits_capacity'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202307161355.mw6hHjW5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux overutilized-affinity
head:   ebfdc14c29d437e3fcd8df02e8d3a9c00b7f226f
commit: ebfdc14c29d437e3fcd8df02e8d3a9c00b7f226f [1/1] sched/eas: Check a task has a fitting cpu when updating misfit
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230716/202307161355.mw6hHjW5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161355.mw6hHjW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161355.mw6hHjW5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:4650:8: error: call to undeclared function 'task_fits_capacity'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                           if (task_fits_capacity(p, capacity_of(cpu))) {
                               ^
   kernel/sched/fair.c:4650:8: note: did you mean 'dl_task_fits_capacity'?
   kernel/sched/sched.h:2972:20: note: 'dl_task_fits_capacity' declared here
   static inline bool dl_task_fits_capacity(struct task_struct *p, int cpu)
                      ^
   1 error generated.


vim +/task_fits_capacity +4650 kernel/sched/fair.c

  4630	
  4631	static inline void update_misfit_status(struct task_struct *p, struct rq *rq)
  4632	{
  4633		bool has_fitting_cpu = false;
  4634		int cpu;
  4635	
  4636		if (!sched_asym_cpucap_active())
  4637			return;
  4638	
  4639		if (!p || p->nr_cpus_allowed == 1)
  4640			goto out;
  4641	
  4642		if (task_fits_cpu(p, cpu_of(rq)))
  4643			goto out;
  4644	
  4645		/*
  4646		 * This could be an expensive check in __schedule()..
  4647		 */
  4648		if (!cpumask_equal(p->cpus_ptr, cpu_possible_mask)) {
  4649			for_each_cpu(cpu, p->cpus_ptr) {
> 4650				if (task_fits_capacity(p, capacity_of(cpu))) {
  4651					has_fitting_cpu = true;
  4652					break;
  4653				}
  4654			}
  4655	
  4656			if (!has_fitting_cpu)
  4657				goto out;
  4658		}
  4659	
  4660		/*
  4661		 * Make sure that misfit_task_load will not be null even if
  4662		 * task_h_load() returns 0.
  4663		 */
  4664		rq->misfit_task_load = max_t(unsigned long, task_h_load(p), 1);
  4665		return;
  4666	out:
  4667		rq->misfit_task_load = 0;
  4668	}
  4669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
