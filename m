Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFF2C80
	for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 22:53:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235636996"
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="235636996"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 14:53:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,261,1631602800"; 
   d="scan'208";a="607357391"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Nov 2021 14:53:05 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mq18S-0005SV-9q; Wed, 24 Nov 2021 22:53:04 +0000
Date: Thu, 25 Nov 2021 06:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] module: Introduce module unload taint tracking
Message-ID: <202111250617.SNgvKWHi-lkp@intel.com>
References: <20211124173327.3878177-1-atomlin@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124173327.3878177-1-atomlin@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Aaron,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linux/master]
[also build test ERROR on linus/master jeyu/modules-next v5.16-rc2 next-20211124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Aaron-Tomlin/module-Introduce-module-unload-taint-tracking/20211125-013753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 136057256686de39cc3a07c2e39ef6bc43003ff6
config: hexagon-randconfig-r041-20211124 (https://download.01.org/0day-ci/archive/20211125/202111250617.SNgvKWHi-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 67a1c45def8a75061203461ab0060c75c864df1c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c843ee3eaddb5f5cf7e0d1bf927679da1f6eb608
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Aaron-Tomlin/module-Introduce-module-unload-taint-tracking/20211125-013753
        git checkout c843ee3eaddb5f5cf7e0d1bf927679da1f6eb608
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/module.c:2266:3: error: implicit declaration of function 'pr_error' [-Werror,-Wimplicit-function-declaration]
                   pr_error("%s: adding tainted module to the unloaded tainted modules list failed.\n",
                   ^
   1 error generated.


vim +/pr_error +2266 kernel/module.c

  2225	
  2226	/* Free a module, remove from lists, etc. */
  2227	static void free_module(struct module *mod)
  2228	{
  2229		trace_module_free(mod);
  2230	
  2231		mod_sysfs_teardown(mod);
  2232	
  2233		/*
  2234		 * We leave it in list to prevent duplicate loads, but make sure
  2235		 * that noone uses it while it's being deconstructed.
  2236		 */
  2237		mutex_lock(&module_mutex);
  2238		mod->state = MODULE_STATE_UNFORMED;
  2239		mutex_unlock(&module_mutex);
  2240	
  2241		/* Remove dynamic debug info */
  2242		ddebug_remove_module(mod->name);
  2243	
  2244		/* Arch-specific cleanup. */
  2245		module_arch_cleanup(mod);
  2246	
  2247		/* Module unload stuff */
  2248		module_unload_free(mod);
  2249	
  2250		/* Free any allocated parameters. */
  2251		destroy_params(mod->kp, mod->num_kp);
  2252	
  2253		if (is_livepatch_module(mod))
  2254			free_module_elf(mod);
  2255	
  2256		/* Now we can delete it from the lists */
  2257		mutex_lock(&module_mutex);
  2258		/* Unlink carefully: kallsyms could be walking list. */
  2259		list_del_rcu(&mod->list);
  2260		mod_tree_remove(mod);
  2261		/* Remove this module from bug list, this uses list_del_rcu */
  2262		module_bug_cleanup(mod);
  2263		/* Wait for RCU-sched synchronizing before releasing mod->list and buglist. */
  2264		synchronize_rcu();
  2265		if (try_add_tainted_module(mod))
> 2266			pr_error("%s: adding tainted module to the unloaded tainted modules list failed.\n",
  2267				 mod->name);
  2268		mutex_unlock(&module_mutex);
  2269	
  2270		/* Clean up CFI for the module. */
  2271		cfi_cleanup(mod);
  2272	
  2273		/* This may be empty, but that's OK */
  2274		module_arch_freeing_init(mod);
  2275		module_memfree(mod->init_layout.base);
  2276		kfree(mod->args);
  2277		percpu_modfree(mod);
  2278	
  2279		/* Free lock-classes; relies on the preceding sync_rcu(). */
  2280		lockdep_free_key_range(mod->core_layout.base, mod->core_layout.size);
  2281	
  2282		/* Finally, free the core (containing the module structure) */
  2283		module_memfree(mod->core_layout.base);
  2284	}
  2285	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
