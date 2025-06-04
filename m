Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC2728E5F4;
	Wed,  4 Jun 2025 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040560; cv=none; b=gCl7MF3vlftzAERZ+jfh0uU35Rvs/HZlV4sc6mvJMmhz4LwzC/VASdegcW/mPP9mnf556hkXBi9N7D4tfRkOjVugJultq/JlJGa2TqoBdu+2h/OnXEnNb4zaARl0gKMK9+7DyHZCsYIkSxoHZm+x5nDQYt6jHjL6mCixjFG5S9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040560; c=relaxed/simple;
	bh=jJ4ZwWax3vKYqqRhw91Dy/rAfyzNtvRQbgFkhNRfsXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s7z/xlUNqCidNlDl2CuHrYrQ8RUlsjISk2smRY/jK8QnM08+6Ayx2Ah6ecl5Hah2/mw5O56E/NtNkLCZ1tZOcryO43SbVTDtrAtLQDvbWPw/ekYP2qdyqAvbtSGgkoaaa4TGbGKBt9vTRWR/rNOawLQiOL6aEKLmCanv5tvTXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGJxRVpR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGJxRVpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749040558; x=1780576558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJ4ZwWax3vKYqqRhw91Dy/rAfyzNtvRQbgFkhNRfsXA=;
  b=OGJxRVpRsfMAyNeM0p8YccJQbxjskFRlQNqc12DTjr2/unDjFtXdeMEn
   ddY6rZWGNKF4ZwPpX+ZIA4oQ9k8rFEXDmMAHb0gfIW5zdUhNbBT/3q4SO
   D2ljio1OXr9IB5EdmR4YsjyWC+byvvL1L0ZapXh4HuJHw74t5rfOTBX1X
   gLwL3OLmLAq30Rq+vQqpgSflodGIrihMnMOuGelHJQ8ylmXYLLPsfaPvV
   zvJx/nFScEw835jzMIEC9dU0Sawwxg1aUfyPuB6rahA8xyIZ7y5VQo+0j
   uKyMXwI88psM6tN7DX+w+72fvN2EbYqkPcjVOELEPI5d0BQkcDJseVau9
   g==;
X-CSE-ConnectionGUID: sUMIs5ElTGa8sqjv4mpSyw==
X-CSE-MsgGUID: 15Y/oJThTKq6AbC0/lKtPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50359158"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="50359158"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 05:35:57 -0700
X-CSE-ConnectionGUID: CBnKa+3ZQz6Yl1GMDtsN+g==
X-CSE-MsgGUID: fVyPFQqvQheDG5kMssUg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="146147627"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jun 2025 05:35:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMnLN-00037t-0S;
	Wed, 04 Jun 2025 12:35:45 +0000
Date: Wed, 4 Jun 2025 20:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Vlastimil Babka <vbabka@suse.cz>
Subject: [akpm-mm:mm-new 33/59] kernel/cgroup/cpuset.c:4054:undefined
 reference to `register_node_notifier'
Message-ID: <202506042006.QuupA03H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   80bb0b2983e95be26d929303d589276875c8900a
commit: 24bc7e1b9a3e0062e4bcde941a76c7dbe5516401 [33/59] mm,memory_hotplug: implement numa node notifier
config: s390-randconfig-001-20250604 (https://download.01.org/0day-ci/archive/20250604/202506042006.QuupA03H-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042006.QuupA03H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042006.QuupA03H-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: kernel/cgroup/cpuset.o: in function `cpuset_init_smp':
>> kernel/cgroup/cpuset.c:4054:(.init.text+0x402): undefined reference to `register_node_notifier'
   s390x-linux-ld: mm/memory_hotplug.o: in function `online_pages':
>> mm/memory_hotplug.c:1243:(.text+0x6928): undefined reference to `node_notify'
   s390x-linux-ld: mm/slub.o: in function `kmem_cache_init':
>> mm/slub.c:6300:(.init.text+0x506): undefined reference to `register_node_notifier'


vim +4054 kernel/cgroup/cpuset.c

  4036	
  4037	/**
  4038	 * cpuset_init_smp - initialize cpus_allowed
  4039	 *
  4040	 * Description: Finish top cpuset after cpu, node maps are initialized
  4041	 */
  4042	void __init cpuset_init_smp(void)
  4043	{
  4044		/*
  4045		 * cpus_allowd/mems_allowed set to v2 values in the initial
  4046		 * cpuset_bind() call will be reset to v1 values in another
  4047		 * cpuset_bind() call when v1 cpuset is mounted.
  4048		 */
  4049		top_cpuset.old_mems_allowed = top_cpuset.mems_allowed;
  4050	
  4051		cpumask_copy(top_cpuset.effective_cpus, cpu_active_mask);
  4052		top_cpuset.effective_mems = node_states[N_MEMORY];
  4053	
> 4054		hotplug_node_notifier(cpuset_track_online_nodes, CPUSET_CALLBACK_PRI);
  4055	
  4056		cpuset_migrate_mm_wq = alloc_ordered_workqueue("cpuset_migrate_mm", 0);
  4057		BUG_ON(!cpuset_migrate_mm_wq);
  4058	}
  4059	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
