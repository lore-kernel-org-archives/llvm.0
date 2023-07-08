Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF8479FA;
	Sat,  8 Jul 2023 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688830171; x=1720366171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GpHp391qhsuo8aWpYCywI3PQYO8yHfzmwTwVIOtKsec=;
  b=BvHdULe1Errw/si1U5+HrOuFRzxJv5o7EVqfeAByvmydHcqzZ+Kg6RB9
   tpb2sgpvOHgnbqLojYb60e8sXhC+0PzuevP+Oo8v5/KKAV+xdsAt9ZGGV
   XkRNvHJ5hp/PdzS7eE6hsKlavi62qlAOc19xNpT9suenmFBnSGIwRsPcP
   quC2OOMigwvdvWCpcU+OAAYblNsFcqJ5c5uy6hTalPHpPwK0fKM2DOsRj
   VujD1au9wqJWxHd3nWQbbB+3zmP0gbFqTtsNlx+5UklsW6fXb7emtNUww
   lUtH7sRlI9UtxMiL6yzcBryGYwI6DPt+OP9GgsAqtC8G4g1+CjPKrKhQ/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="430138778"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="430138778"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 08:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="723525618"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="723525618"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jul 2023 08:29:29 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qI9sG-0002lY-1e;
	Sat, 08 Jul 2023 15:29:28 +0000
Date: Sat, 8 Jul 2023 23:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards2 33/54] kernel/events/core.c:4807:4:
 error: cannot jump from this asm goto statement to one of its possible
 targets
Message-ID: <202307082307.3MZd3adG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2
head:   d640008c4d9c9ff55543a4fe0d6e7810ae563032
commit: 97387524d8566bbaa8c254b19efab3aace72e85b [33/54] perf: Simplify find_get_pmu_context()
config: powerpc-akebono_defconfig (https://download.01.org/0day-ci/archive/20230708/202307082307.3MZd3adG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307082307.3MZd3adG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307082307.3MZd3adG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/events/core.c:4807:4: error: cannot jump from this asm goto statement to one of its possible targets
    4807 |                         WARN_ON_ONCE(epc->ctx != ctx);
         |                         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/powerpc/include/asm/bug.h:101:2: note: expanded from macro '__WARN_FLAGS'
     101 |         WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
         |         ^
   arch/powerpc/include/asm/bug.h:77:2: note: expanded from macro 'WARN_ENTRY'
      77 |         asm_volatile_goto(                              \
         |         ^
   include/linux/compiler_types.h:328:33: note: expanded from macro 'asm_volatile_goto'
     328 | #define asm_volatile_goto(x...) asm goto(x)
         |                                 ^
   kernel/events/core.c:4776:4: note: possible target of asm goto statement
    4776 |                         WARN_ON_ONCE(epc->ctx != ctx);
         |                         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/powerpc/include/asm/bug.h:104:9: note: expanded from macro '__WARN_FLAGS'
     104 |                                                                 \
         |                                                                 ^
   kernel/events/core.c:4783:8: note: jump exits scope of variable with __attribute__((cleanup))
    4783 |         void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
         |               ^
   kernel/events/core.c:4776:4: error: cannot jump from this asm goto statement to one of its possible targets
    4776 |                         WARN_ON_ONCE(epc->ctx != ctx);
         |                         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/powerpc/include/asm/bug.h:101:2: note: expanded from macro '__WARN_FLAGS'
     101 |         WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
         |         ^
   arch/powerpc/include/asm/bug.h:77:2: note: expanded from macro 'WARN_ENTRY'
      77 |         asm_volatile_goto(                              \
         |         ^
   include/linux/compiler_types.h:328:33: note: expanded from macro 'asm_volatile_goto'
     328 | #define asm_volatile_goto(x...) asm goto(x)
         |                                 ^
   kernel/events/core.c:4807:4: note: possible target of asm goto statement
    4807 |                         WARN_ON_ONCE(epc->ctx != ctx);
         |                         ^
   include/asm-generic/bug.h:113:3: note: expanded from macro 'WARN_ON_ONCE'
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/powerpc/include/asm/bug.h:104:9: note: expanded from macro '__WARN_FLAGS'
     104 |                                                                 \
         |                                                                 ^
   kernel/events/core.c:4783:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
    4783 |         void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
         |               ^
   2 errors generated.


vim +4807 kernel/events/core.c

0793a61d4df8da kernel/perf_counter.c Thomas Gleixner 2008-12-04  4748  
97387524d8566b kernel/events/core.c  Peter Zijlstra  2023-06-09  4749  /*
97387524d8566b kernel/events/core.c  Peter Zijlstra  2023-06-09  4750   * Returns a matching perf_event_pmu_context with elevated refcount or NULL.
97387524d8566b kernel/events/core.c  Peter Zijlstra  2023-06-09  4751   */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4752  static struct perf_event_pmu_context *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4753  find_get_pmu_context(struct pmu *pmu, struct perf_event_context *ctx,
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4754  		     struct perf_event *event)
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4755  {
97387524d8566b kernel/events/core.c  Peter Zijlstra  2023-06-09  4756  	struct perf_event_pmu_context *epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4757  	void *task_ctx_data = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4758  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4759  	if (!ctx->task) {
8cfd8c9ed19111 kernel/events/core.c  Peter Zijlstra  2023-06-09  4760  		/*
8cfd8c9ed19111 kernel/events/core.c  Peter Zijlstra  2023-06-09  4761  		 * perf_pmu_migrate_context() / __perf_pmu_install_event()
8cfd8c9ed19111 kernel/events/core.c  Peter Zijlstra  2023-06-09  4762  		 * relies on the fact that find_get_pmu_context() cannot fail
8cfd8c9ed19111 kernel/events/core.c  Peter Zijlstra  2023-06-09  4763  		 * for CPU contexts.
8cfd8c9ed19111 kernel/events/core.c  Peter Zijlstra  2023-06-09  4764  		 */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4765  		struct perf_cpu_pmu_context *cpc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4766  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4767  		cpc = per_cpu_ptr(pmu->cpu_pmu_context, event->cpu);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4768  		epc = &cpc->epc;
4f64a6c9f6f11e kernel/events/core.c  James Clark     2023-01-27  4769  		raw_spin_lock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4770  		if (!epc->ctx) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4771  			atomic_set(&epc->refcount, 1);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4772  			epc->embedded = 1;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4773  			list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4774  			epc->ctx = ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4775  		} else {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4776  			WARN_ON_ONCE(epc->ctx != ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4777  			atomic_inc(&epc->refcount);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4778  		}
4f64a6c9f6f11e kernel/events/core.c  James Clark     2023-01-27  4779  		raw_spin_unlock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4780  		return epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4781  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4782  
97387524d8566b kernel/events/core.c  Peter Zijlstra  2023-06-09  4783  	void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4784  	if (!new)
97387524d8566b kernel/events/core.c  Peter Zijlstra  2023-06-09  4785  		return NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4786  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4787  	if (event->attach_state & PERF_ATTACH_TASK_DATA) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4788  		task_ctx_data = alloc_task_ctx_data(pmu);
97387524d8566b kernel/events/core.c  Peter Zijlstra  2023-06-09  4789  		if (!task_ctx_data)
97387524d8566b kernel/events/core.c  Peter Zijlstra  2023-06-09  4790  			return NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4791  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4792  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4793  	__perf_init_event_pmu_context(new, pmu);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4794  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4795  	/*
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4796  	 * XXX
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4797  	 *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4798  	 * lockdep_assert_held(&ctx->mutex);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4799  	 *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4800  	 * can't because perf_event_init_task() doesn't actually hold the
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4801  	 * child_ctx->mutex.
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4802  	 */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4803  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4804  	raw_spin_lock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4805  	list_for_each_entry(epc, &ctx->pmu_ctx_list, pmu_ctx_entry) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4806  		if (epc->pmu == pmu) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08 @4807  			WARN_ON_ONCE(epc->ctx != ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4808  			atomic_inc(&epc->refcount);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4809  			goto found_epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4810  		}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4811  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4812  
97387524d8566b kernel/events/core.c  Peter Zijlstra  2023-06-09  4813  	epc = no_free_ptr(new);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4814  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4815  	list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4816  	epc->ctx = ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4817  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4818  found_epc:
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4819  	if (task_ctx_data && !epc->task_ctx_data) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4820  		epc->task_ctx_data = task_ctx_data;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4821  		task_ctx_data = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4822  		ctx->nr_task_data++;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4823  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4824  	raw_spin_unlock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4825  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4826  	free_task_ctx_data(pmu, task_ctx_data);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4827  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4828  	return epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4829  }
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4830  

:::::: The code at line 4807 was first introduced by commit
:::::: bd27568117664b8b3e259721393df420ed51f57b perf: Rewrite core context handling

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
