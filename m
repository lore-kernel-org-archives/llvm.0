Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57BE3F9D2;
	Wed, 14 Aug 2024 04:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723609605; cv=none; b=fEolbvj7B2NihQlticYY3c3oP6xewhzOHGCOox8nTclryW78YXmt0N2A1XfyGiTWns2x9Zl5EkvMAV89OTy82NiYYfOu+tM7XSe/eS0ja4T/mr7TfeTbi4ypOKV+azI+SKRFtCSFTJoL9dZu19IfFBP99X+6jEvC1nezaNWJY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723609605; c=relaxed/simple;
	bh=XWkEvk/M3gieSX93b6qKIZEPsk2yJyVStQR3O2UQ8yI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oUyOWvQ+HTt1tM1GNMYlRF9GBoA3JTYsIJ/2qmOu37xyHAf3U6zYP1r/niqs0BUW/iJWw1SPxZW91EGchrrVWwFCbvp0a9xERtZK0CQtP3Jy6AsMNwBPSm3Sp1aBhsU8o4fNOU2GIRyHIts0uEJkIiiostrkPHJ7xe3xZpa8uGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpPlSt0x; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpPlSt0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723609603; x=1755145603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XWkEvk/M3gieSX93b6qKIZEPsk2yJyVStQR3O2UQ8yI=;
  b=jpPlSt0xEfN5H3fpBJ1ftSigBfqGTLwbj9y7uIv/wKdv68vZmTsCfGfu
   5FPdog/FI3tb9XmTzE4Io/XdGwabTfdrijkE1/MiM/qKHfSO6pzfndBp0
   29RG7tLCvgsCFnwREGWHEk4Xu96tUXe6N4tkddTuaW3wTigNqJXWmKgQ1
   8GeuRnHxD8qwKISHBNHrnnc+mJs6gfmvJmiL5YjgqbfmDbKLddDO+zECw
   NPwCcGZbYT3X5ntC7LpnHZayyeJ7pN+E7PLSPXmLi/o3D1af0vHWCklc/
   nTFwSZ5OXGOwYsRanbcu+qtEIOwKNTvuuMm9tWxnhbaMutSPH+BvLqMvH
   Q==;
X-CSE-ConnectionGUID: TwMyTK2PQKyB4YNB90jW2w==
X-CSE-MsgGUID: qYL9PKLGRyK3xm7Y7LJEcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32950418"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="32950418"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 21:26:42 -0700
X-CSE-ConnectionGUID: 2lb+fjnqTtiZ6nFhusAhrg==
X-CSE-MsgGUID: NP+RTnFXQGiOJKaPAYrRPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="63746098"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2024 21:26:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se5an-000170-2y;
	Wed, 14 Aug 2024 04:26:37 +0000
Date: Wed, 14 Aug 2024 12:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 7/46]
 drivers/firmware/psci/psci_checker.c:400:32: warning: data argument not used
 by format string
Message-ID: <202408141243.eQiEOQQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   c61d91d0986f5e0053b7b6ab6edcf67d85b8b52b
commit: 1e17d54446b96380fb5c0c22e6a29ec2706b7ce4 [7/46] kthread: allow vararg kthread_{create,run}_on_cpu()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240814/202408141243.eQiEOQQe-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141243.eQiEOQQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141243.eQiEOQQe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/psci/psci_checker.c:24:
   In file included from arch/arm64/include/asm/cpuidle.h:8:
   In file included from arch/arm64/include/asm/arch_gicv3.h:17:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/psci/psci_checker.c:400:32: warning: data argument not used by format string [-Wformat-extra-args]
     400 |                                                (void *)(long)cpu, cpu,
         |                                                                   ^
     401 |                                                "psci_suspend_test");
         |                                                ~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:37:20: note: expanded from macro 'kthread_create_on_cpu'
      36 |         __kthread_create_on_cpu(threadfn, data, cpu, namefmt,              \
         |                                                      ~~~~~~~
      37 |                                 ##__VA_ARGS__, cpu)
         |                                                ^
   6 warnings generated.


vim +400 drivers/firmware/psci/psci_checker.c

ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  366  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  367  static int suspend_tests(void)
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  368  {
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  369  	int i, cpu, err = 0;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  370  	struct task_struct **threads;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  371  	int nb_threads = 0;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  372  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  373  	threads = kmalloc_array(nb_available_cpus, sizeof(*threads),
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  374  				GFP_KERNEL);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  375  	if (!threads)
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  376  		return -ENOMEM;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  377  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  378  	/*
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  379  	 * Stop cpuidle to prevent the idle tasks from entering a deep sleep
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  380  	 * mode, as it might interfere with the suspend threads on other CPUs.
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  381  	 * This does not prevent the suspend threads from using cpuidle (only
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  382  	 * the idle tasks check this status). Take the idle lock so that
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  383  	 * the cpuidle driver and device look-up can be carried out safely.
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  384  	 */
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  385  	cpuidle_pause_and_lock();
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  386  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  387  	for_each_online_cpu(cpu) {
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  388  		struct task_struct *thread;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  389  		/* Check that cpuidle is available on that CPU. */
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  390  		struct cpuidle_device *dev = per_cpu(cpuidle_devices, cpu);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  391  		struct cpuidle_driver *drv = cpuidle_get_cpu_driver(dev);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  392  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  393  		if (!dev || !drv) {
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  394  			pr_warn("cpuidle not available on CPU %d, ignoring\n",
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  395  				cpu);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  396  			continue;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  397  		}
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  398  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  399  		thread = kthread_create_on_cpu(suspend_test_thread,
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08 @400  					       (void *)(long)cpu, cpu,
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  401  					       "psci_suspend_test");
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  402  		if (IS_ERR(thread))
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  403  			pr_err("Failed to create kthread on CPU %d\n", cpu);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  404  		else
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  405  			threads[nb_threads++] = thread;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  406  	}
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  407  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  408  	if (nb_threads < 1) {
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  409  		err = -ENODEV;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  410  		goto out;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  411  	}
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  412  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  413  	atomic_set(&nb_active_threads, nb_threads);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  414  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  415  	/*
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  416  	 * Wake up the suspend threads. To avoid the main thread being preempted
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  417  	 * before all the threads have been unparked, the suspend threads will
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  418  	 * wait for the completion of suspend_threads_started.
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  419  	 */
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  420  	for (i = 0; i < nb_threads; ++i)
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  421  		wake_up_process(threads[i]);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  422  	complete_all(&suspend_threads_started);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  423  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  424  	wait_for_completion(&suspend_threads_done);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  425  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  426  
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  427  	/* Stop and destroy all threads, get return status. */
92e074acf6f769 drivers/firmware/psci/psci_checker.c Jean-Philippe Brucker 2019-06-10  428  	for (i = 0; i < nb_threads; ++i) {
92e074acf6f769 drivers/firmware/psci/psci_checker.c Jean-Philippe Brucker 2019-06-10  429  		err += kthread_park(threads[i]);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  430  		err += kthread_stop(threads[i]);
92e074acf6f769 drivers/firmware/psci/psci_checker.c Jean-Philippe Brucker 2019-06-10  431  	}
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  432   out:
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  433  	cpuidle_resume_and_unlock();
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  434  	kfree(threads);
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  435  	return err;
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  436  }
ea8b1c4a6019fb drivers/firmware/psci_checker.c      Kevin Brodsky         2016-11-08  437  

:::::: The code at line 400 was first introduced by commit
:::::: ea8b1c4a6019fb96ca8301f0b3ffcb13fb1cd0ae drivers: psci: PSCI checker module

:::::: TO: Kevin Brodsky <kevin.brodsky@arm.com>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
