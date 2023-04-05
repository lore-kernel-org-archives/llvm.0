Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFEC7C;
	Wed,  5 Apr 2023 06:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680677224; x=1712213224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EDNLMQr/AButjMzlBmeRiq1rfvL6nHNMfoR0UGy3Mt8=;
  b=eL/5pMUcRcy/ZYDXtMjlWWuP1MnB3NejAr5iBzA9gbP0OkHeM/mBM5cB
   3kkeEOjfzX6OrVNGXZ7AkKTc/WywRdfPAJFlhA6B3rf7kZkNaZGUpgi+Q
   1Z7xszlJjpsU0EpTmyLasSS8+AVUdj2SaftNt23O9lMdpxXl18BvFuKIK
   tt9tvijLkUMi1OMra8yfGe6yXZnMaugfVT8X+IehrwOCqv+MaTmG2vGBt
   YHNb5g0R0K0tCpQQbDFTyJzgEbA/7Ym0JDJ6SxylZzhNbRrXYHE35XMg+
   O0pxAtP5RStF9qTPw8PzOdbcuE8EWh5MMZJ5+d2KH+POi9IKsIKvPcHqB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="339878745"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="339878745"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 23:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="680180409"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="680180409"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Apr 2023 23:47:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjwv6-000QN0-2f;
	Wed, 05 Apr 2023 06:47:00 +0000
Date: Wed, 5 Apr 2023 14:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230404-module-alloc-opts 39/41]
 kernel/module/main.c:2608:28: error: too many arguments provided to
 function-like macro invocation
Message-ID: <202304051457.1lVfYGYr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230404-module-alloc-opts
head:   972a42717ab4ae90acc80cae25d97860a7d04184
commit: 3cd12ffc14eea5599e4511e011f04a5045ed8041 [39/41] module: add debug stats to help identify memory pressure
config: powerpc-ppc44x_defconfig (https://download.01.org/0day-ci/archive/20230405/202304051457.1lVfYGYr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=3cd12ffc14eea5599e4511e011f04a5045ed8041
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230404-module-alloc-opts
        git checkout 3cd12ffc14eea5599e4511e011f04a5045ed8041
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051457.1lVfYGYr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/module/main.c:2608:28: error: too many arguments provided to function-like macro invocation
           mod_stat_add64(text_size, &total_text_size);
                                     ^
   kernel/module/internal.h:201:9: note: macro 'mod_stat_add64' defined here
   #define mod_stat_add64(name)
           ^
>> kernel/module/main.c:2608:2: error: use of undeclared identifier 'mod_stat_add64'
           mod_stat_add64(text_size, &total_text_size);
           ^
   kernel/module/main.c:2609:29: error: too many arguments provided to function-like macro invocation
           mod_stat_add64(total_size, &total_mod_size);
                                      ^
   kernel/module/internal.h:201:9: note: macro 'mod_stat_add64' defined here
   #define mod_stat_add64(name)
           ^
   kernel/module/main.c:2609:2: error: use of undeclared identifier 'mod_stat_add64'
           mod_stat_add64(total_size, &total_mod_size);
           ^
   kernel/module/main.c:3061:23: error: too many arguments provided to function-like macro invocation
                   mod_stat_add64(len, &invalid_kread_bytes);
                                       ^
   kernel/module/internal.h:201:9: note: macro 'mod_stat_add64' defined here
   #define mod_stat_add64(name)
           ^
   kernel/module/main.c:3061:3: error: use of undeclared identifier 'mod_stat_add64'
                   mod_stat_add64(len, &invalid_kread_bytes);
                   ^
   kernel/module/main.c:3090:23: error: too many arguments provided to function-like macro invocation
                   mod_stat_add64(len, &invalid_kread_bytes);
                                       ^
   kernel/module/internal.h:201:9: note: macro 'mod_stat_add64' defined here
   #define mod_stat_add64(name)
           ^
   kernel/module/main.c:3090:3: error: use of undeclared identifier 'mod_stat_add64'
                   mod_stat_add64(len, &invalid_kread_bytes);
                   ^
   kernel/module/main.c:3099:24: error: too many arguments provided to function-like macro invocation
                           mod_stat_add64(len, &invalid_decompress_bytes);
                                               ^
   kernel/module/internal.h:201:9: note: macro 'mod_stat_add64' defined here
   #define mod_stat_add64(name)
           ^
   kernel/module/main.c:3099:4: error: use of undeclared identifier 'mod_stat_add64'
                           mod_stat_add64(len, &invalid_decompress_bytes);
                           ^
   10 errors generated.


vim +2608 kernel/module/main.c

  2502	
  2503	/*
  2504	 * This is where the real work happens.
  2505	 *
  2506	 * Keep it uninlined to provide a reliable breakpoint target, e.g. for the gdb
  2507	 * helper command 'lx-symbols'.
  2508	 */
  2509	static noinline int do_init_module(struct module *mod)
  2510	{
  2511		int ret = 0;
  2512		struct mod_initfree *freeinit;
  2513		unsigned int text_size = 0, total_size = 0;
  2514	
  2515		for_each_mod_mem_type(type) {
  2516			const struct module_memory *mod_mem = &mod->mem[type];
  2517			if (mod_mem->size) {
  2518				total_size += mod_mem->size;
  2519				if (type == MOD_TEXT || type == MOD_INIT_TEXT)
  2520					text_size += mod->mem[type].size;
  2521			}
  2522		}
  2523	
  2524		freeinit = kmalloc(sizeof(*freeinit), GFP_KERNEL);
  2525		if (!freeinit) {
  2526			ret = -ENOMEM;
  2527			goto fail;
  2528		}
  2529		freeinit->init_text = mod->mem[MOD_INIT_TEXT].base;
  2530		freeinit->init_data = mod->mem[MOD_INIT_DATA].base;
  2531		freeinit->init_rodata = mod->mem[MOD_INIT_RODATA].base;
  2532	
  2533		do_mod_ctors(mod);
  2534		/* Start the module */
  2535		if (mod->init != NULL)
  2536			ret = do_one_initcall(mod->init);
  2537		if (ret < 0) {
  2538			goto fail_free_freeinit;
  2539		}
  2540		if (ret > 0) {
  2541			pr_warn("%s: '%s'->init suspiciously returned %d, it should "
  2542				"follow 0/-E convention\n"
  2543				"%s: loading module anyway...\n",
  2544				__func__, mod->name, ret, __func__);
  2545			dump_stack();
  2546		}
  2547	
  2548		/* Now it's a first class citizen! */
  2549		mod->state = MODULE_STATE_LIVE;
  2550		blocking_notifier_call_chain(&module_notify_list,
  2551					     MODULE_STATE_LIVE, mod);
  2552	
  2553		/* Delay uevent until module has finished its init routine */
  2554		kobject_uevent(&mod->mkobj.kobj, KOBJ_ADD);
  2555	
  2556		/*
  2557		 * We need to finish all async code before the module init sequence
  2558		 * is done. This has potential to deadlock if synchronous module
  2559		 * loading is requested from async (which is not allowed!).
  2560		 *
  2561		 * See commit 0fdff3ec6d87 ("async, kmod: warn on synchronous
  2562		 * request_module() from async workers") for more details.
  2563		 */
  2564		if (!mod->async_probe_requested)
  2565			async_synchronize_full();
  2566	
  2567		ftrace_free_mem(mod, mod->mem[MOD_INIT_TEXT].base,
  2568				mod->mem[MOD_INIT_TEXT].base + mod->mem[MOD_INIT_TEXT].size);
  2569		mutex_lock(&module_mutex);
  2570		/* Drop initial reference. */
  2571		module_put(mod);
  2572		trim_init_extable(mod);
  2573	#ifdef CONFIG_KALLSYMS
  2574		/* Switch to core kallsyms now init is done: kallsyms may be walking! */
  2575		rcu_assign_pointer(mod->kallsyms, &mod->core_kallsyms);
  2576	#endif
  2577		module_enable_ro(mod, true);
  2578		mod_tree_remove_init(mod);
  2579		module_arch_freeing_init(mod);
  2580		for_class_mod_mem_type(type, init) {
  2581			mod->mem[type].base = NULL;
  2582			mod->mem[type].size = 0;
  2583		}
  2584	
  2585	#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
  2586		/* .BTF is not SHF_ALLOC and will get removed, so sanitize pointer */
  2587		mod->btf_data = NULL;
  2588	#endif
  2589		/*
  2590		 * We want to free module_init, but be aware that kallsyms may be
  2591		 * walking this with preempt disabled.  In all the failure paths, we
  2592		 * call synchronize_rcu(), but we don't want to slow down the success
  2593		 * path. module_memfree() cannot be called in an interrupt, so do the
  2594		 * work and call synchronize_rcu() in a work queue.
  2595		 *
  2596		 * Note that module_alloc() on most architectures creates W+X page
  2597		 * mappings which won't be cleaned up until do_free_init() runs.  Any
  2598		 * code such as mark_rodata_ro() which depends on those mappings to
  2599		 * be cleaned up needs to sync with the queued work - ie
  2600		 * rcu_barrier()
  2601		 */
  2602		if (llist_add(&freeinit->node, &init_free_list))
  2603			schedule_work(&init_free_wq);
  2604	
  2605		mutex_unlock(&module_mutex);
  2606		wake_up_all(&module_wq);
  2607	
> 2608		mod_stat_add64(text_size, &total_text_size);
  2609		mod_stat_add64(total_size, &total_mod_size);
  2610	
  2611		mod_stat_inc(&modcount);
  2612	
  2613		return 0;
  2614	
  2615	fail_free_freeinit:
  2616		kfree(freeinit);
  2617	fail:
  2618		/* Try to protect us from buggy refcounters. */
  2619		mod->state = MODULE_STATE_GOING;
  2620		synchronize_rcu();
  2621		module_put(mod);
  2622		blocking_notifier_call_chain(&module_notify_list,
  2623					     MODULE_STATE_GOING, mod);
  2624		klp_module_going(mod);
  2625		ftrace_release_mod(mod);
  2626		free_module(mod);
  2627		wake_up_all(&module_wq);
  2628	
  2629		return ret;
  2630	}
  2631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
