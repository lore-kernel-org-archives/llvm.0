Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E417C1;
	Sat, 10 Jun 2023 03:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686366849; x=1717902849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t2pwB6GWvHanUQ3UYOCHhdff7QTq3oN6TJ3h+FAjB6U=;
  b=FIV9eAsyTpAje3+s8PxXGrmsHGpMlkvsfxQwhOPQQqSVOmVbZ+utSHIa
   v16kZLl8yLxtkJ7Qvf54lsbmh54FhBt5reyc1Q1+ByiiHdUwbxck4jlUn
   1RSsnP8MdHExFiQ0FdRBPKwEDLwsIhzsB/CgfvwpjZevCALWfWA1bnqT3
   TOovVSpjjEgg507z0F4SxNITzemmbcNE0OqQBsuOhqC/LAgtGaVAoU+2K
   yWMuf7F7pfQHXh9QWvU0jhqYvw4cPSG5hfOYyai5Jjq0i14adCogvrcQQ
   3oK9H4x2h5xd8BTKf4nCKtU1cIcZXOrwSYiv6CZvU4pn6RL7UUhR872L+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361088134"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="361088134"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 20:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="710560507"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="710560507"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Jun 2023 20:14:07 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7p3G-0009dx-37;
	Sat, 10 Jun 2023 03:14:06 +0000
Date: Sat, 10 Jun 2023 11:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 37/58] kernel/events/core.c:4815:4: error:
 cannot jump from this asm goto statement to one of its possible targets
Message-ID: <202306101109.PqwXuQIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   dd132e83d180b932488bcf612576529e6163a1ea
commit: bbca204d731b08997a60a4ca0530fdee8b6f429c [37/58] perf: Simplify find_get_pmu_context()
config: powerpc-gamecube_defconfig (https://download.01.org/0day-ci/archive/20230610/202306101109.PqwXuQIY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=bbca204d731b08997a60a4ca0530fdee8b6f429c
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout bbca204d731b08997a60a4ca0530fdee8b6f429c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101109.PqwXuQIY-lkp@intel.com/

All errors (new ones prefixed by >>):

     215 | __do_insb
         | ^
   arch/powerpc/include/asm/io.h:614:56: note: expanded from macro '__do_insb'
     614 | #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/events/core.c:20:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      45 | DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:217:1: note: expanded from here
     217 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
     615 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/events/core.c:20:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:219:1: note: expanded from here
     219 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/events/core.c:20:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:221:1: note: expanded from here
     221 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/events/core.c:20:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:223:1: note: expanded from here
     223 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/events/core.c:20:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:225:1: note: expanded from here
     225 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> kernel/events/core.c:4815:4: error: cannot jump from this asm goto statement to one of its possible targets
    4815 |                         WARN_ON_ONCE(epc->ctx != ctx);
         |                         ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
     112 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
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
   kernel/events/core.c:4784:4: note: possible target of asm goto statement
    4784 |                         WARN_ON_ONCE(epc->ctx != ctx);
         |                         ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
     112 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/powerpc/include/asm/bug.h:104:9: note: expanded from macro '__WARN_FLAGS'
     104 |                                                                 \
         |                                                                 ^
   kernel/events/core.c:4791:8: note: jump exits scope of variable with __attribute__((cleanup))
    4791 |         void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
         |               ^
   kernel/events/core.c:4784:4: error: cannot jump from this asm goto statement to one of its possible targets
    4784 |                         WARN_ON_ONCE(epc->ctx != ctx);
         |                         ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
     112 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
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
   kernel/events/core.c:4815:4: note: possible target of asm goto statement
    4815 |                         WARN_ON_ONCE(epc->ctx != ctx);
         |                         ^
   include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
     112 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ^
   arch/powerpc/include/asm/bug.h:104:9: note: expanded from macro '__WARN_FLAGS'
     104 |                                                                 \
         |                                                                 ^
   kernel/events/core.c:4791:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
    4791 |         void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
         |               ^
   kernel/events/core.c:11401:6: warning: no previous prototype for function '__perf_pmu_unregister' [-Wmissing-prototypes]
    11401 | void __perf_pmu_unregister(struct pmu *pmu)
          |      ^
   kernel/events/core.c:11401:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    11401 | void __perf_pmu_unregister(struct pmu *pmu)
          | ^
          | static 
   7 warnings and 2 errors generated.


vim +4815 kernel/events/core.c

0793a61d4df8da kernel/perf_counter.c Thomas Gleixner 2008-12-04  4756  
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4757  /*
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4758   * Returns a matching perf_event_pmu_context with elevated refcount or NULL.
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4759   */
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4760  static struct perf_event_pmu_context *
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4761  find_get_pmu_context(struct pmu *pmu, struct perf_event_context *ctx,
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4762  		     struct perf_event *event)
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4763  {
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4764  	struct perf_event_pmu_context *epc;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4765  	void *task_ctx_data = NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4766  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4767  	if (!ctx->task) {
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4768  		/*
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4769  		 * perf_pmu_migrate_context() / __perf_pmu_install_event()
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4770  		 * relies on the fact that find_get_pmu_context() cannot fail
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4771  		 * for CPU contexts.
b255c4a091a85e kernel/events/core.c  Peter Zijlstra  2023-06-09  4772  		 */
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
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4791  	void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4792  	if (!new)
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4793  		return NULL;
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4794  
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4795  	if (event->attach_state & PERF_ATTACH_TASK_DATA) {
bd27568117664b kernel/events/core.c  Peter Zijlstra  2022-10-08  4796  		task_ctx_data = alloc_task_ctx_data(pmu);
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4797  		if (!task_ctx_data)
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4798  			return NULL;
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
bbca204d731b08 kernel/events/core.c  Peter Zijlstra  2023-06-09  4821  	epc = no_free_ptr(new);
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
