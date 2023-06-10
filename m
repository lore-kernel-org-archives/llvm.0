Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BAD256A;
	Sat, 10 Jun 2023 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686405222; x=1717941222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9T39UYmSVHOpu722wc4lfrPfdbxUv6O+gGL1v7rSzbs=;
  b=azJAU1dNeTqDCjwJE+Yss24SsmkqR+zj4/asCTfVMWjRJw0AenLZ9g1O
   b9ulDzujrXpZYQ0eyl7VNnZ0rCGTjAgD2pPyRdY7NSJB1sKc/kmip6zCk
   gt8ADnc2+tHVav6q78jkbwNfmhJCmt0986qMgzR1Vy9jnzd6GWs9qBRpt
   GwZCG/cTKaVePwgV9+LlSPYKkTXe5sjNV1k4DuACUU6FS7rEviE+wW/Cn
   rOhjPMtnBAMwZazCtiE9G9tnXJQOLzOzZWwnRY/Oh57NfaPFrgCgfo/kj
   /XQCTagA3LaKBxEaTRsmMQ+re7EYQSfHG8RCGNBuOL4F5KYZElgxSJjEI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="338125795"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="338125795"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 06:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="957461182"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="957461182"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Jun 2023 06:53:39 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7z2A-000A7r-2p;
	Sat, 10 Jun 2023 13:53:38 +0000
Date: Sat, 10 Jun 2023 21:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards2 37/58] kernel/events/core.c:4815:4:
 error: cannot jump from this asm goto statement to one of its possible
 targets
Message-ID: <202306102105.wOSmMFqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2
head:   2f378348009384ec621ed31458cad708cdfe1840
commit: 154eddf2f12e68504d7966ffc55f78ccdc5cf692 [37/58] perf: Simplify find_get_pmu_context()
config: powerpc-g5_defconfig (https://download.01.org/0day-ci/archive/20230610/202306102105.wOSmMFqp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=154eddf2f12e68504d7966ffc55f78ccdc5cf692
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards2
        git checkout 154eddf2f12e68504d7966ffc55f78ccdc5cf692
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306102105.wOSmMFqp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/events/core.c:4815:4: error: cannot jump from this asm goto statement to one of its possible targets
                           WARN_ON_ONCE(epc->ctx != ctx);
                           ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/powerpc/include/asm/bug.h:101:2: note: expanded from macro '__WARN_FLAGS'
           WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
           ^
   arch/powerpc/include/asm/bug.h:77:2: note: expanded from macro 'WARN_ENTRY'
           asm_volatile_goto(                              \
           ^
   include/linux/compiler_types.h:328:33: note: expanded from macro 'asm_volatile_goto'
   #define asm_volatile_goto(x...) asm goto(x)
                                   ^
   kernel/events/core.c:4784:4: note: possible target of asm goto statement
                           WARN_ON_ONCE(epc->ctx != ctx);
                           ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/powerpc/include/asm/bug.h:104:9: note: expanded from macro '__WARN_FLAGS'
                                                                   \
                                                                   ^
   kernel/events/core.c:4791:8: note: jump exits scope of variable with __attribute__((cleanup))
           void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
                 ^
   kernel/events/core.c:4784:4: error: cannot jump from this asm goto statement to one of its possible targets
                           WARN_ON_ONCE(epc->ctx != ctx);
                           ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/powerpc/include/asm/bug.h:101:2: note: expanded from macro '__WARN_FLAGS'
           WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
           ^
   arch/powerpc/include/asm/bug.h:77:2: note: expanded from macro 'WARN_ENTRY'
           asm_volatile_goto(                              \
           ^
   include/linux/compiler_types.h:328:33: note: expanded from macro 'asm_volatile_goto'
   #define asm_volatile_goto(x...) asm goto(x)
                                   ^
   kernel/events/core.c:4815:4: note: possible target of asm goto statement
                           WARN_ON_ONCE(epc->ctx != ctx);
                           ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
                   __WARN_FLAGS(BUGFLAG_ONCE |                     \
                   ^
   arch/powerpc/include/asm/bug.h:104:9: note: expanded from macro '__WARN_FLAGS'
                                                                   \
                                                                   ^
   kernel/events/core.c:4791:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
           void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
                 ^
   kernel/events/core.c:11401:6: warning: no previous prototype for function '__perf_pmu_unregister' [-Wmissing-prototypes]
   void __perf_pmu_unregister(struct pmu *pmu)
        ^
   kernel/events/core.c:11401:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __perf_pmu_unregister(struct pmu *pmu)
   ^
   static 
   1 warning and 2 errors generated.


vim +4815 kernel/events/core.c

0793a61d4df8da kernel/perf_counter.c Thomas Gleixner 2008-12-04  4756  
154eddf2f12e68 kernel/events/core.c  Peter Zijlstra  2023-06-09  4757  /*
154eddf2f12e68 kernel/events/core.c  Peter Zijlstra  2023-06-09  4758   * Returns a matching perf_event_pmu_context with elevated refcount or NULL.
154eddf2f12e68 kernel/events/core.c  Peter Zijlstra  2023-06-09  4759   */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4760  static struct perf_event_pmu_context *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4761  find_get_pmu_context(struct pmu *pmu, struct perf_event_context *ctx,
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4762  		     struct perf_event *event)
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4763  {
154eddf2f12e68 kernel/events/core.c  Peter Zijlstra  2023-06-09  4764  	struct perf_event_pmu_context *epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4765  	void *task_ctx_data = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4766  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4767  	if (!ctx->task) {
41f77f58db2084 kernel/events/core.c  Peter Zijlstra  2023-06-09  4768  		/*
41f77f58db2084 kernel/events/core.c  Peter Zijlstra  2023-06-09  4769  		 * perf_pmu_migrate_context() / __perf_pmu_install_event()
41f77f58db2084 kernel/events/core.c  Peter Zijlstra  2023-06-09  4770  		 * relies on the fact that find_get_pmu_context() cannot fail
41f77f58db2084 kernel/events/core.c  Peter Zijlstra  2023-06-09  4771  		 * for CPU contexts.
41f77f58db2084 kernel/events/core.c  Peter Zijlstra  2023-06-09  4772  		 */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4773  		struct perf_cpu_pmu_context *cpc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4774  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4775  		cpc = per_cpu_ptr(pmu->cpu_pmu_context, event->cpu);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4776  		epc = &cpc->epc;
4f64a6c9f6f11e kernel/events/core.c  James Clark     2023-01-27  4777  		raw_spin_lock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4778  		if (!epc->ctx) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4779  			atomic_set(&epc->refcount, 1);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4780  			epc->embedded = 1;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4781  			list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4782  			epc->ctx = ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4783  		} else {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4784  			WARN_ON_ONCE(epc->ctx != ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4785  			atomic_inc(&epc->refcount);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4786  		}
4f64a6c9f6f11e kernel/events/core.c  James Clark     2023-01-27  4787  		raw_spin_unlock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4788  		return epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4789  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4790  
154eddf2f12e68 kernel/events/core.c  Peter Zijlstra  2023-06-09  4791  	void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4792  	if (!new)
154eddf2f12e68 kernel/events/core.c  Peter Zijlstra  2023-06-09  4793  		return NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4794  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4795  	if (event->attach_state & PERF_ATTACH_TASK_DATA) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4796  		task_ctx_data = alloc_task_ctx_data(pmu);
154eddf2f12e68 kernel/events/core.c  Peter Zijlstra  2023-06-09  4797  		if (!task_ctx_data)
154eddf2f12e68 kernel/events/core.c  Peter Zijlstra  2023-06-09  4798  			return NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4799  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4800  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4801  	__perf_init_event_pmu_context(new, pmu);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4802  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4803  	/*
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4804  	 * XXX
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4805  	 *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4806  	 * lockdep_assert_held(&ctx->mutex);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4807  	 *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4808  	 * can't because perf_event_init_task() doesn't actually hold the
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4809  	 * child_ctx->mutex.
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4810  	 */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4811  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4812  	raw_spin_lock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4813  	list_for_each_entry(epc, &ctx->pmu_ctx_list, pmu_ctx_entry) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4814  		if (epc->pmu == pmu) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08 @4815  			WARN_ON_ONCE(epc->ctx != ctx);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4816  			atomic_inc(&epc->refcount);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4817  			goto found_epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4818  		}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4819  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4820  
154eddf2f12e68 kernel/events/core.c  Peter Zijlstra  2023-06-09  4821  	epc = no_free_ptr(new);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4822  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4823  	list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4824  	epc->ctx = ctx;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4825  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4826  found_epc:
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4827  	if (task_ctx_data && !epc->task_ctx_data) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4828  		epc->task_ctx_data = task_ctx_data;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4829  		task_ctx_data = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4830  		ctx->nr_task_data++;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4831  	}
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4832  	raw_spin_unlock_irq(&ctx->lock);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4833  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4834  	free_task_ctx_data(pmu, task_ctx_data);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4835  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4836  	return epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4837  }
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4838  

:::::: The code at line 4815 was first introduced by commit
:::::: bd27568117664b8b3e259721393df420ed51f57b perf: Rewrite core context handling

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
