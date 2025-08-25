Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4672797A1;
	Mon, 25 Aug 2025 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756149879; cv=none; b=ZnOy0SunluODyvKt/x4CeuOoouIraB7e3pcadLrMHWCKRAjrNb55Z9+5GbQ5lh69358o4MQNjhvKLYAC3phHytJWUUF4uTB0JFhH+FtADoweYagcuI++byGYIbMgFlxhwjmnwd5HAijPKi+rx13B5VDS8QLkhUL7LWRaFsMO4j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756149879; c=relaxed/simple;
	bh=gl62tBm8UQ/ttSNnxsehDR6RntmGpPaDQGfy90qZfLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPsJApwwxAGD6UER8pNMvmPKIy2WbB/vivGXspLXQasfr8w3fVyYt/pFclbqXHCnwF314jyzDmDUsC5tAEqwnzsXD60pz0z/uZLshzkjFW6+h/b2nb9X1mWzGsJxscrnGu+rZWwYnyPvGd8Xz9NXWfGkP9p5vRogZUhkgwcKl88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xsy60M3Y; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xsy60M3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756149878; x=1787685878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gl62tBm8UQ/ttSNnxsehDR6RntmGpPaDQGfy90qZfLs=;
  b=Xsy60M3YRXqy3Ky65+XT/+bu9guq7fkkMm/NDPX/nsHs+ee7mOkdIUep
   XcSZg9rFx/eU/AWAijuyk6YmrzFxf0HnvL4hblapNRKnmyEFC8PYSg4SG
   N2DRO0Sx3q6N71vgrPbVTJbYWgqi7ZEicGxZDXMUf+8kMGjB27yuhM7pL
   E87vaRE1HQ41mEIpA7ubozWd9YSzhZi0FlPyk4pHlH8Y6v4RxjGkgyzH/
   xYnba1u2p6KLpJJaTy9l7zDYuWuxP/qzqyD+QD9XH6jxOkcd1aR0Cj7oP
   1YUH5Yc4KaEUy8lGvkhQnWtb5g4sLeLBVnFsM8x1u+7gScHucUIaIK5vv
   Q==;
X-CSE-ConnectionGUID: xl8E9Z+0Tp+W83PMvysU4w==
X-CSE-MsgGUID: 7gytL/hQQIGYjchxBlsdCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="61006253"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="61006253"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:24:35 -0700
X-CSE-ConnectionGUID: fGSTXrdiRUGGgoMlJhN6jA==
X-CSE-MsgGUID: TB1Tk4fKRYCojH8dEzBodQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="193043777"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Aug 2025 12:24:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqcnu-000Nxh-26;
	Mon, 25 Aug 2025 19:24:30 +0000
Date: Tue, 26 Aug 2025 03:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [peterz-queue:sched/core 1/1] arch/s390/kernel/topology.c:512:23:
 error: conflicting types for 'cpu_coregroup_mask'
Message-ID: <202508260328.jsXPrTzT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   6aa2edf8f340935f35e7be32f223792b028b574d
commit: 6aa2edf8f340935f35e7be32f223792b028b574d [1/1] sched/fair: Get rid of sched_domains_curr_level hack for tl->cpumask()
config: s390-randconfig-001-20250826 (https://download.01.org/0day-ci/archive/20250826/202508260328.jsXPrTzT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508260328.jsXPrTzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508260328.jsXPrTzT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/topology.c:512:23: error: conflicting types for 'cpu_coregroup_mask'
     512 | const struct cpumask *cpu_coregroup_mask(struct sched_domain_topology_level *tl, int cpu)
         |                       ^
   arch/s390/include/asm/topology.h:50:23: note: previous declaration is here
      50 | const struct cpumask *cpu_coregroup_mask(int cpu);
         |                       ^
>> arch/s390/kernel/topology.c:529:12: error: incompatible function pointer types initializing 'sched_domain_mask_f' (aka 'const struct cpumask *(*)(struct sched_domain_topology_level *, int)') with an expression of type 'const struct cpumask *(int)' [-Wincompatible-function-pointer-types]
     529 |         SDTL_INIT(cpu_coregroup_mask, cpu_core_flags, MC),
         |                   ^~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/cpu_coregroup_mask +512 arch/s390/kernel/topology.c

   511	
 > 512	const struct cpumask *cpu_coregroup_mask(struct sched_domain_topology_level *tl, int cpu)
   513	{
   514		return &cpu_topology[cpu].core_mask;
   515	}
   516	
   517	static const struct cpumask *cpu_book_mask(struct sched_domain_topology_level *tl, int cpu)
   518	{
   519		return &cpu_topology[cpu].book_mask;
   520	}
   521	
   522	static const struct cpumask *cpu_drawer_mask(struct sched_domain_topology_level *tl, int cpu)
   523	{
   524		return &cpu_topology[cpu].drawer_mask;
   525	}
   526	
   527	static struct sched_domain_topology_level s390_topology[] = {
   528		SDTL_INIT(tl_smt_mask, cpu_smt_flags, SMT),
 > 529		SDTL_INIT(cpu_coregroup_mask, cpu_core_flags, MC),
   530		SDTL_INIT(cpu_book_mask, NULL, BOOK),
   531		SDTL_INIT(cpu_drawer_mask, NULL, DRAWER),
   532		SDTL_INIT(tl_pkg_mask, NULL, PKG),
   533		{ NULL, },
   534	};
   535	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
