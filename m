Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F9F322A;
	Wed,  5 Apr 2023 22:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680735210; x=1712271210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BrEnmERmCLE1aSlQK5TEew++7k+j2HOov65+zVlTWMQ=;
  b=XBl39HtIsl0TTkDAhxjgUpVizQNwHrwVV9+qhHIBfSomXaoPQ5QPML4t
   UGsKpRbApV6rv+ljGgm6fcluYAMiHbqmEkqk038P37E3bPQgMMv5R1hl0
   RiPesyUBYUirvTyJYCexfgA4/ApCAtKMDdEuRI9SULFPWsSfuyxVPtpLY
   HFnZZF3+LYrvNL45ykvDzgSeO9hqarY9Ml+5hojGiYYDR/mVWJM2Vlq9N
   hoAMGkhIc0hjV7BmVVmaDrkWSlm/ARbTqgfqnIj4Mgnu9Pu1XXurqTEUE
   C+gsD2sKhUI7FlY6geieFzmA+hie1rE1MdHVhx32duMwZdCTMgzElrtT0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="345177110"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="345177110"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 15:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="861157638"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="861157638"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Apr 2023 15:53:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkC0O-000Qry-0R;
	Wed, 05 Apr 2023 22:53:28 +0000
Date: Thu, 6 Apr 2023 06:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230405-semaphore-kmod 37/39] kernel/module/main.c:2513:15:
 warning: variable 'text_size' set but not used
Message-ID: <202304060645.MG3w5wRC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230405-semaphore-kmod
head:   2325b9647badfb76f870c04a257c2e917e1dc746
commit: b55ef46cae96876e0bdb8c057a1f9e59eb581a90 [37/39] module: add debug stats to help identify memory pressure
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230406/202304060645.MG3w5wRC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=b55ef46cae96876e0bdb8c057a1f9e59eb581a90
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230405-semaphore-kmod
        git checkout b55ef46cae96876e0bdb8c057a1f9e59eb581a90
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/module/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060645.MG3w5wRC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/main.c:2513:15: warning: variable 'text_size' set but not used [-Wunused-but-set-variable]
           unsigned int text_size = 0, total_size = 0;
                        ^
>> kernel/module/main.c:2513:30: warning: variable 'total_size' set but not used [-Wunused-but-set-variable]
           unsigned int text_size = 0, total_size = 0;
                                       ^
   2 warnings generated.


vim +/text_size +2513 kernel/module/main.c

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
> 2513		unsigned int text_size = 0, total_size = 0;
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
