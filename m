Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143BAFD3;
	Wed, 29 Mar 2023 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680083927; x=1711619927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWz5Aud5uMbmtMrd4RE6wMv5RtHkC9GL674vLTLwZmQ=;
  b=bEANwBlkgdwsugVA3aVQQyY4YuprL1yfCLcaf2b+aYM2DCBDjs4Q/cTs
   0mf1m5+4m8kLGdgJT+8yYOf6iQYCydxoO3lhLh6CfqrlHNn6o5Zlpn64u
   rou3JcVkce0V4YzFUURUGwTe6Ld6N4Ox2BR5Z7nVw7wqzOhZJu0p5Ossw
   u1DZG7DcOSmPQ3tDZq1BCUABdnPJmr6VYr9bm8KpnLB2PQU5ZscPpwl/c
   7eU4q8rjzUNVCl0w/q98cAhnwNQo9JInRg5cmLjPNNOlQ9XvPPzlFZa+R
   235rPGBX90IrOVGrFKRBEJkbM9U+mz4CUltDyfzWgvk81izdOr8rr7qjd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320487299"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="320487299"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 02:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="748734975"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="748734975"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2023 02:58:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phSZp-000JQ2-0X;
	Wed, 29 Mar 2023 09:58:45 +0000
Date: Wed, 29 Mar 2023 17:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230328-module-alloc-opts 40/40]
 kernel/module/main.c:2593:2: error: implicit declaration of function
 'mod_stat_add64' is invalid in C99
Message-ID: <202303291722.n1hQzARC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230328-module-alloc-opts
head:   6a931d2d6ad46e4090218b63a131b8c9591699e0
commit: 6a931d2d6ad46e4090218b63a131b8c9591699e0 [40/40] module: add debug stats to help identify memory pressure
config: i386-randconfig-a011-20230327 (https://download.01.org/0day-ci/archive/20230329/202303291722.n1hQzARC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=6a931d2d6ad46e4090218b63a131b8c9591699e0
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230328-module-alloc-opts
        git checkout 6a931d2d6ad46e4090218b63a131b8c9591699e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291722.n1hQzARC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/module/main.c:2593:2: error: implicit declaration of function 'mod_stat_add64' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mod_stat_add64(text_size, &total_text_size);
           ^
>> kernel/module/main.c:2593:29: error: use of undeclared identifier 'total_text_size'; did you mean 'total_size'?
           mod_stat_add64(text_size, &total_text_size);
                                      ^~~~~~~~~~~~~~~
                                      total_size
   kernel/module/main.c:2498:30: note: 'total_size' declared here
           unsigned int text_size = 0, total_size = 0;
                                       ^
>> kernel/module/main.c:2594:30: error: use of undeclared identifier 'total_mod_size'; did you mean 'total_size'?
           mod_stat_add64(total_size, &total_mod_size);
                                       ^~~~~~~~~~~~~~
                                       total_size
   kernel/module/main.c:2498:30: note: 'total_size' declared here
           unsigned int text_size = 0, total_size = 0;
                                       ^
>> kernel/module/main.c:2596:16: error: use of undeclared identifier 'modcount'
           mod_stat_inc(&modcount);
                         ^
   kernel/module/main.c:3009:2: error: implicit declaration of function 'mod_stat_add64' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mod_stat_add64(info->len, &invalid_mod_bytes);
           ^
>> kernel/module/main.c:3009:29: error: use of undeclared identifier 'invalid_mod_bytes'
           mod_stat_add64(info->len, &invalid_mod_bytes);
                                      ^
>> kernel/module/main.c:3024:30: error: use of undeclared identifier 'invalid_mod_becoming_bytes'
                   mod_stat_add64(info->len, &invalid_mod_becoming_bytes);
                                              ^
>> kernel/module/main.c:3044:17: error: use of undeclared identifier 'failed_kreads'
                   mod_stat_inc(&failed_kreads);
                                 ^
   kernel/module/main.c:3072:17: error: use of undeclared identifier 'failed_kreads'
                   mod_stat_inc(&failed_kreads);
                                 ^
   kernel/module/main.c:3073:3: error: implicit declaration of function 'mod_stat_add64' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   mod_stat_add64(len, &invalid_kread_bytes);
                   ^
>> kernel/module/main.c:3073:24: error: use of undeclared identifier 'invalid_kread_bytes'
                   mod_stat_add64(len, &invalid_kread_bytes);
                                        ^
>> kernel/module/main.c:3081:18: error: use of undeclared identifier 'failed_decompress'; did you mean 'module_decompress'?
                           mod_stat_inc(&failed_decompress);
                                         ^~~~~~~~~~~~~~~~~
                                         module_decompress
   kernel/module/internal.h:173:39: note: expanded from macro 'mod_stat_inc'
   #define mod_stat_inc(name) atomic_inc(name)
                                         ^
   kernel/module/internal.h:206:19: note: 'module_decompress' declared here
   static inline int module_decompress(struct load_info *info,
                     ^
   kernel/module/main.c:3082:4: error: implicit declaration of function 'mod_stat_add64' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           mod_stat_add64(len, &invalid_decompress_bytes);
                           ^
>> kernel/module/main.c:3082:25: error: use of undeclared identifier 'invalid_decompress_bytes'
                           mod_stat_add64(len, &invalid_decompress_bytes);
                                                ^
   14 errors generated.


vim +/mod_stat_add64 +2593 kernel/module/main.c

  2487	
  2488	/*
  2489	 * This is where the real work happens.
  2490	 *
  2491	 * Keep it uninlined to provide a reliable breakpoint target, e.g. for the gdb
  2492	 * helper command 'lx-symbols'.
  2493	 */
  2494	static noinline int do_init_module(struct module *mod)
  2495	{
  2496		int ret = 0;
  2497		struct mod_initfree *freeinit;
> 2498		unsigned int text_size = 0, total_size = 0;
  2499	
  2500		for_each_mod_mem_type(type) {
  2501			const struct module_memory *mod_mem = &mod->mem[type];
  2502			if (mod_mem->size) {
  2503				total_size += mod_mem->size;
  2504				if (type == MOD_TEXT || type == MOD_INIT_TEXT)
  2505					text_size += mod->mem[type].size;
  2506			}
  2507		}
  2508	
  2509		freeinit = kmalloc(sizeof(*freeinit), GFP_KERNEL);
  2510		if (!freeinit) {
  2511			ret = -ENOMEM;
  2512			goto fail;
  2513		}
  2514		freeinit->init_text = mod->mem[MOD_INIT_TEXT].base;
  2515		freeinit->init_data = mod->mem[MOD_INIT_DATA].base;
  2516		freeinit->init_rodata = mod->mem[MOD_INIT_RODATA].base;
  2517	
  2518		do_mod_ctors(mod);
  2519		/* Start the module */
  2520		if (mod->init != NULL)
  2521			ret = do_one_initcall(mod->init);
  2522		if (ret < 0) {
  2523			goto fail_free_freeinit;
  2524		}
  2525		if (ret > 0) {
  2526			pr_warn("%s: '%s'->init suspiciously returned %d, it should "
  2527				"follow 0/-E convention\n"
  2528				"%s: loading module anyway...\n",
  2529				__func__, mod->name, ret, __func__);
  2530			dump_stack();
  2531		}
  2532	
  2533		/* Now it's a first class citizen! */
  2534		mod->state = MODULE_STATE_LIVE;
  2535		blocking_notifier_call_chain(&module_notify_list,
  2536					     MODULE_STATE_LIVE, mod);
  2537	
  2538		/* Delay uevent until module has finished its init routine */
  2539		kobject_uevent(&mod->mkobj.kobj, KOBJ_ADD);
  2540	
  2541		/*
  2542		 * We need to finish all async code before the module init sequence
  2543		 * is done. This has potential to deadlock if synchronous module
  2544		 * loading is requested from async (which is not allowed!).
  2545		 *
  2546		 * See commit 0fdff3ec6d87 ("async, kmod: warn on synchronous
  2547		 * request_module() from async workers") for more details.
  2548		 */
  2549		if (!mod->async_probe_requested)
  2550			async_synchronize_full();
  2551	
  2552		ftrace_free_mem(mod, mod->mem[MOD_INIT_TEXT].base,
  2553				mod->mem[MOD_INIT_TEXT].base + mod->mem[MOD_INIT_TEXT].size);
  2554		mutex_lock(&module_mutex);
  2555		/* Drop initial reference. */
  2556		module_put(mod);
  2557		trim_init_extable(mod);
  2558	#ifdef CONFIG_KALLSYMS
  2559		/* Switch to core kallsyms now init is done: kallsyms may be walking! */
  2560		rcu_assign_pointer(mod->kallsyms, &mod->core_kallsyms);
  2561	#endif
  2562		module_enable_ro(mod, true);
  2563		mod_tree_remove_init(mod);
  2564		module_arch_freeing_init(mod);
  2565		for_class_mod_mem_type(type, init) {
  2566			mod->mem[type].base = NULL;
  2567			mod->mem[type].size = 0;
  2568		}
  2569	
  2570	#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
  2571		/* .BTF is not SHF_ALLOC and will get removed, so sanitize pointer */
  2572		mod->btf_data = NULL;
  2573	#endif
  2574		/*
  2575		 * We want to free module_init, but be aware that kallsyms may be
  2576		 * walking this with preempt disabled.  In all the failure paths, we
  2577		 * call synchronize_rcu(), but we don't want to slow down the success
  2578		 * path. module_memfree() cannot be called in an interrupt, so do the
  2579		 * work and call synchronize_rcu() in a work queue.
  2580		 *
  2581		 * Note that module_alloc() on most architectures creates W+X page
  2582		 * mappings which won't be cleaned up until do_free_init() runs.  Any
  2583		 * code such as mark_rodata_ro() which depends on those mappings to
  2584		 * be cleaned up needs to sync with the queued work - ie
  2585		 * rcu_barrier()
  2586		 */
  2587		if (llist_add(&freeinit->node, &init_free_list))
  2588			schedule_work(&init_free_wq);
  2589	
  2590		mutex_unlock(&module_mutex);
  2591		wake_up_all(&module_wq);
  2592	
> 2593		mod_stat_add64(text_size, &total_text_size);
> 2594		mod_stat_add64(total_size, &total_mod_size);
  2595	
> 2596		mod_stat_inc(&modcount);
  2597	
  2598		return 0;
  2599	
  2600	fail_free_freeinit:
  2601		kfree(freeinit);
  2602	fail:
  2603		/* Try to protect us from buggy refcounters. */
  2604		mod->state = MODULE_STATE_GOING;
  2605		synchronize_rcu();
  2606		module_put(mod);
  2607		blocking_notifier_call_chain(&module_notify_list,
  2608					     MODULE_STATE_GOING, mod);
  2609		klp_module_going(mod);
  2610		ftrace_release_mod(mod);
  2611		free_module(mod);
  2612		wake_up_all(&module_wq);
  2613	
  2614		return ret;
  2615	}
  2616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
