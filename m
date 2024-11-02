Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8330C1A76CE;
	Sat,  2 Nov 2024 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730565713; cv=none; b=o/GiW0l0yrFSPQ+eC71E2ULv9jOYOzV93f/MRxrlvzUOouKlO0uRm9QYOSkZ1a/0FB0cM71m/7TZvp8BYwe3d1ZmlbDleDDppVmJ5MJkVRkFLge05ZmQp74tU/3mZaXxKNccXvuJI/Ss6OFtwjyvutOGy8AO7coUEFoVBfiwsvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730565713; c=relaxed/simple;
	bh=pzvbKG/1YY6Lrd6ApYhxLlejaUflETj2PnzShdtqvGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H81BCb439ZnBFu8ELvloGNqPmrF37ZyV8MmZMDPo3Cp+As0jdA9Ih1YQkxb3mNw5lvm9d4hz8MzJY18nQ7gLzAaREPEmPvZVnqlDY1LZD7F0oNS0ei/HRRfsHok1V+KDcKou9o8/B0OmyLnR5uYRxnO37nwt8hB610XgI4jDF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ij8Zirf/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ij8Zirf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730565712; x=1762101712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pzvbKG/1YY6Lrd6ApYhxLlejaUflETj2PnzShdtqvGY=;
  b=ij8Zirf/hxdzGOE5BkxByB+nckujLCDtlnRPiddjzo9asELQV55jEYg6
   CIBFeTnBT+bs/SjTnLfoPM+eBMIB7Rd6b+nRM1T1+Toivz7pfG7EUGQXE
   CoImuvL0rroR4zDVl5Q2z4RijD5ZB6Ni5T5Tuv64GQ/2qsc31x3Sa62LA
   HDPdOEywCcrlC0YrT+/M7ee3Ify/Tvgr9MvEG3KFjVpe8DaKnYZ4OkJ8N
   epAObbeD0Zit8xIB2uaYpMRf3xXBj9wbE+yH3JenNIqxfMCm1ogBXWKll
   n43yB5dL0/+dCIukljpKBdfUxvJx2gzIzULW9ZkEuHoLO3brZT6cDcnDB
   g==;
X-CSE-ConnectionGUID: jaBstSXLRi6jYsFKWXWzPw==
X-CSE-MsgGUID: PaHLNuAOTpmjvxvH+c9/+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34000600"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34000600"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 09:41:47 -0700
X-CSE-ConnectionGUID: UJfKkXq5Qau5WWtv13gTGQ==
X-CSE-MsgGUID: 2rq4KDklTVCE2LiiUkUYsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="120697685"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Nov 2024 09:41:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7HC2-000jAh-2D;
	Sat, 02 Nov 2024 16:41:42 +0000
Date: Sun, 3 Nov 2024 00:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: 'Guanjun' <guanjun@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v1 1/2] genirq/affinity: add support for limiting
 managed interrupts
Message-ID: <202411030024.eIDPlX3p-lkp@intel.com>
References: <20241031074618.3585491-2-guanjun@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031074618.3585491-2-guanjun@linux.alibaba.com>

Hi 'Guanjun',

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on axboe-block/for-next mszeredi-fuse/for-next tip/smp/core linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guanjun/genirq-affinity-add-support-for-limiting-managed-interrupts/20241031-154824
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20241031074618.3585491-2-guanjun%40linux.alibaba.com
patch subject: [PATCH RFC v1 1/2] genirq/affinity: add support for limiting managed interrupts
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241103/202411030024.eIDPlX3p-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030024.eIDPlX3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030024.eIDPlX3p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/group_cpus.c:480:17: error: conflicting types for 'group_cpus_evenly'
     480 | struct cpumask *group_cpus_evenly(unsigned int numgrps)
         |                 ^
   include/linux/group_cpus.h:12:17: note: previous declaration is here
      12 | struct cpumask *group_cpus_evenly(unsigned int numgrps, bool is_managed);
         |                 ^
   1 error generated.


vim +/group_cpus_evenly +480 lib/group_cpus.c

f7b3ea8cf72f3d Ming Lei    2022-12-27  379  
f7b3ea8cf72f3d Ming Lei    2022-12-27  380  /**
f7b3ea8cf72f3d Ming Lei    2022-12-27  381   * group_cpus_evenly - Group all CPUs evenly per NUMA/CPU locality
f7b3ea8cf72f3d Ming Lei    2022-12-27  382   * @numgrps: number of groups
59cfa36232b76f Guanjun     2024-10-31  383   * @is_managed: if these groups managed by kernel
f7b3ea8cf72f3d Ming Lei    2022-12-27  384   *
f7b3ea8cf72f3d Ming Lei    2022-12-27  385   * Return: cpumask array if successful, NULL otherwise. And each element
f7b3ea8cf72f3d Ming Lei    2022-12-27  386   * includes CPUs assigned to this group
f7b3ea8cf72f3d Ming Lei    2022-12-27  387   *
f7b3ea8cf72f3d Ming Lei    2022-12-27  388   * Try to put close CPUs from viewpoint of CPU and NUMA locality into
f7b3ea8cf72f3d Ming Lei    2022-12-27  389   * same group, and run two-stage grouping:
f7b3ea8cf72f3d Ming Lei    2022-12-27  390   *	1) allocate present CPUs on these groups evenly first
f7b3ea8cf72f3d Ming Lei    2022-12-27  391   *	2) allocate other possible CPUs on these groups evenly
f7b3ea8cf72f3d Ming Lei    2022-12-27  392   *
f7b3ea8cf72f3d Ming Lei    2022-12-27  393   * We guarantee in the resulted grouping that all CPUs are covered, and
f7b3ea8cf72f3d Ming Lei    2022-12-27  394   * no same CPU is assigned to multiple groups
f7b3ea8cf72f3d Ming Lei    2022-12-27  395   */
59cfa36232b76f Guanjun     2024-10-31  396  struct cpumask *group_cpus_evenly(unsigned int numgrps, bool is_managed)
f7b3ea8cf72f3d Ming Lei    2022-12-27  397  {
f7b3ea8cf72f3d Ming Lei    2022-12-27  398  	unsigned int curgrp = 0, nr_present = 0, nr_others = 0;
f7b3ea8cf72f3d Ming Lei    2022-12-27  399  	cpumask_var_t *node_to_cpumask;
f7b3ea8cf72f3d Ming Lei    2022-12-27  400  	cpumask_var_t nmsk, npresmsk;
f7b3ea8cf72f3d Ming Lei    2022-12-27  401  	int ret = -ENOMEM;
f7b3ea8cf72f3d Ming Lei    2022-12-27  402  	struct cpumask *masks = NULL;
f7b3ea8cf72f3d Ming Lei    2022-12-27  403  
f7b3ea8cf72f3d Ming Lei    2022-12-27  404  	if (!zalloc_cpumask_var(&nmsk, GFP_KERNEL))
f7b3ea8cf72f3d Ming Lei    2022-12-27  405  		return NULL;
f7b3ea8cf72f3d Ming Lei    2022-12-27  406  
f7b3ea8cf72f3d Ming Lei    2022-12-27  407  	if (!zalloc_cpumask_var(&npresmsk, GFP_KERNEL))
f7b3ea8cf72f3d Ming Lei    2022-12-27  408  		goto fail_nmsk;
f7b3ea8cf72f3d Ming Lei    2022-12-27  409  
f7b3ea8cf72f3d Ming Lei    2022-12-27  410  	node_to_cpumask = alloc_node_to_cpumask();
f7b3ea8cf72f3d Ming Lei    2022-12-27  411  	if (!node_to_cpumask)
f7b3ea8cf72f3d Ming Lei    2022-12-27  412  		goto fail_npresmsk;
f7b3ea8cf72f3d Ming Lei    2022-12-27  413  
f7b3ea8cf72f3d Ming Lei    2022-12-27  414  	masks = kcalloc(numgrps, sizeof(*masks), GFP_KERNEL);
f7b3ea8cf72f3d Ming Lei    2022-12-27  415  	if (!masks)
f7b3ea8cf72f3d Ming Lei    2022-12-27  416  		goto fail_node_to_cpumask;
f7b3ea8cf72f3d Ming Lei    2022-12-27  417  
f7b3ea8cf72f3d Ming Lei    2022-12-27  418  	build_node_to_cpumask(node_to_cpumask);
f7b3ea8cf72f3d Ming Lei    2022-12-27  419  
0263f92fadbb9d Ming Lei    2023-11-20  420  	/*
0263f92fadbb9d Ming Lei    2023-11-20  421  	 * Make a local cache of 'cpu_present_mask', so the two stages
0263f92fadbb9d Ming Lei    2023-11-20  422  	 * spread can observe consistent 'cpu_present_mask' without holding
0263f92fadbb9d Ming Lei    2023-11-20  423  	 * cpu hotplug lock, then we can reduce deadlock risk with cpu
0263f92fadbb9d Ming Lei    2023-11-20  424  	 * hotplug code.
0263f92fadbb9d Ming Lei    2023-11-20  425  	 *
0263f92fadbb9d Ming Lei    2023-11-20  426  	 * Here CPU hotplug may happen when reading `cpu_present_mask`, and
0263f92fadbb9d Ming Lei    2023-11-20  427  	 * we can live with the case because it only affects that hotplug
0263f92fadbb9d Ming Lei    2023-11-20  428  	 * CPU is handled in the 1st or 2nd stage, and either way is correct
0263f92fadbb9d Ming Lei    2023-11-20  429  	 * from API user viewpoint since 2-stage spread is sort of
0263f92fadbb9d Ming Lei    2023-11-20  430  	 * optimization.
0263f92fadbb9d Ming Lei    2023-11-20  431  	 */
0263f92fadbb9d Ming Lei    2023-11-20  432  	cpumask_copy(npresmsk, data_race(cpu_present_mask));
0263f92fadbb9d Ming Lei    2023-11-20  433  
59cfa36232b76f Guanjun     2024-10-31  434  	/* Limit the count of managed interrupts on every node */
59cfa36232b76f Guanjun     2024-10-31  435  	if (is_managed && managed_irqs_per_node)
59cfa36232b76f Guanjun     2024-10-31  436  		__group_prepare_affinity(npresmsk, node_to_cpumask);
59cfa36232b76f Guanjun     2024-10-31  437  
f7b3ea8cf72f3d Ming Lei    2022-12-27  438  	/* grouping present CPUs first */
f7b3ea8cf72f3d Ming Lei    2022-12-27  439  	ret = __group_cpus_evenly(curgrp, numgrps, node_to_cpumask,
0263f92fadbb9d Ming Lei    2023-11-20  440  				  npresmsk, nmsk, masks);
f7b3ea8cf72f3d Ming Lei    2022-12-27  441  	if (ret < 0)
f7b3ea8cf72f3d Ming Lei    2022-12-27  442  		goto fail_build_affinity;
f7b3ea8cf72f3d Ming Lei    2022-12-27  443  	nr_present = ret;
f7b3ea8cf72f3d Ming Lei    2022-12-27  444  
f7b3ea8cf72f3d Ming Lei    2022-12-27  445  	/*
f7b3ea8cf72f3d Ming Lei    2022-12-27  446  	 * Allocate non present CPUs starting from the next group to be
f7b3ea8cf72f3d Ming Lei    2022-12-27  447  	 * handled. If the grouping of present CPUs already exhausted the
f7b3ea8cf72f3d Ming Lei    2022-12-27  448  	 * group space, assign the non present CPUs to the already
f7b3ea8cf72f3d Ming Lei    2022-12-27  449  	 * allocated out groups.
f7b3ea8cf72f3d Ming Lei    2022-12-27  450  	 */
f7b3ea8cf72f3d Ming Lei    2022-12-27  451  	if (nr_present >= numgrps)
f7b3ea8cf72f3d Ming Lei    2022-12-27  452  		curgrp = 0;
f7b3ea8cf72f3d Ming Lei    2022-12-27  453  	else
f7b3ea8cf72f3d Ming Lei    2022-12-27  454  		curgrp = nr_present;
0263f92fadbb9d Ming Lei    2023-11-20  455  	cpumask_andnot(npresmsk, cpu_possible_mask, npresmsk);
f7b3ea8cf72f3d Ming Lei    2022-12-27  456  	ret = __group_cpus_evenly(curgrp, numgrps, node_to_cpumask,
f7b3ea8cf72f3d Ming Lei    2022-12-27  457  				  npresmsk, nmsk, masks);
f7b3ea8cf72f3d Ming Lei    2022-12-27  458  	if (ret >= 0)
f7b3ea8cf72f3d Ming Lei    2022-12-27  459  		nr_others = ret;
f7b3ea8cf72f3d Ming Lei    2022-12-27  460  
f7b3ea8cf72f3d Ming Lei    2022-12-27  461   fail_build_affinity:
f7b3ea8cf72f3d Ming Lei    2022-12-27  462  	if (ret >= 0)
f7b3ea8cf72f3d Ming Lei    2022-12-27  463  		WARN_ON(nr_present + nr_others < numgrps);
f7b3ea8cf72f3d Ming Lei    2022-12-27  464  
f7b3ea8cf72f3d Ming Lei    2022-12-27  465   fail_node_to_cpumask:
f7b3ea8cf72f3d Ming Lei    2022-12-27  466  	free_node_to_cpumask(node_to_cpumask);
f7b3ea8cf72f3d Ming Lei    2022-12-27  467  
f7b3ea8cf72f3d Ming Lei    2022-12-27  468   fail_npresmsk:
f7b3ea8cf72f3d Ming Lei    2022-12-27  469  	free_cpumask_var(npresmsk);
f7b3ea8cf72f3d Ming Lei    2022-12-27  470  
f7b3ea8cf72f3d Ming Lei    2022-12-27  471   fail_nmsk:
f7b3ea8cf72f3d Ming Lei    2022-12-27  472  	free_cpumask_var(nmsk);
f7b3ea8cf72f3d Ming Lei    2022-12-27  473  	if (ret < 0) {
f7b3ea8cf72f3d Ming Lei    2022-12-27  474  		kfree(masks);
f7b3ea8cf72f3d Ming Lei    2022-12-27  475  		return NULL;
f7b3ea8cf72f3d Ming Lei    2022-12-27  476  	}
f7b3ea8cf72f3d Ming Lei    2022-12-27  477  	return masks;
f7b3ea8cf72f3d Ming Lei    2022-12-27  478  }
188a569658584e Ingo Molnar 2023-01-18  479  #else /* CONFIG_SMP */
f7b3ea8cf72f3d Ming Lei    2022-12-27 @480  struct cpumask *group_cpus_evenly(unsigned int numgrps)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
