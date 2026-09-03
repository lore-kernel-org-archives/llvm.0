Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A5317A2E8;
	Thu,  3 Sep 2026 00:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788395356; cv=none; b=Dq8wqIaoBzAuSDxcPKkKO15Y7dH4KMdfmuxRBlO2otJmfwUO4U7hwr9sggj17oy57A3k5tQpAdMvdvzeiLbYLwRcQpWd3PfCsKdEWNdje7B0myQiljyOu9VBd4eYk7qGXIKKr2cYr7iaV3slxvJDpY3o6d3cRPV2YhJeoHMoExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788395356; c=relaxed/simple;
	bh=2HDjAW+xn5Ct94Deurtu4kFNArq9RSbfJYaF2knok9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gtiWDEOryDXOB85nvm7P+vudg7ljbFXJEKTfRQZy99gXtgIcg+3C88yL48h0j2JVJxslzufI7xQ+L/dr+AOVivvlW8w0GccS6mb+uhbcI8zGbw09GavloWtaQWRk/15tFvsbsk5X8+OvkBZ9u6111zf24n0kmP7MU8umGIb7BBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kx+9mW9O; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kx+9mW9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788395354; x=1819931354;
  h=date:from:to:cc:subject:message-id;
  bh=2HDjAW+xn5Ct94Deurtu4kFNArq9RSbfJYaF2knok9A=;
  b=Kx+9mW9OSpUlI3G2GtWuwlIH8CP94YyuR6MOMkxSqQ+PcWKjLAVh4Tch
   4ibso6J5DEhGprho5yD5ReDpO6dK0qByowrRC91jDAGsD7HkhRlAotS4E
   /u8D6Vt0yiM0y7OQv//Sm6JgnE7khZ+4iGjlfXV/04kU34X4Lx5dkUnjF
   NyGsDzgEDZupa3YEHPc2sz+zFTDXjIgzYMQ4jnz/cpn0mKm3kTF1nCQgq
   lDiiIv/s0i6shgw+zsLLippcJ9h5abZG6P7xAI6ERSmucDfAwch6DD8FN
   OlCJU6ZLZGXbl29S9IUykts1qIwnuLwzjBhfp40FSjTpX+/sV26+2w4mL
   w==;
X-CSE-ConnectionGUID: wwqKGtrJS821itomNzow/g==
X-CSE-MsgGUID: KFkwv1LxQd6Jyz2zUvA0fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100220553"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100220553"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 17:29:13 -0700
X-CSE-ConnectionGUID: EYEcEpGhQSepeTllFz1jXw==
X-CSE-MsgGUID: H0CCvzxeSuOHn4aPTDaZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266315158"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 17:29:12 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1vKH-000000003XK-3McU;
	Thu, 03 Sep 2026 00:29:09 +0000
Date: Thu, 03 Sep 2026 08:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/task_h_load 25/27]
 kernel/sched/fair.c:2080:2: error: call to undeclared function 'cfs_of_of';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202609030843.mfhuyAcC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/task_h_load
head:   4cbbcdc1a5585407e918e633887e57d978ddf0c6
commit: 65fc965b77f4f7f70aff38ad18e2a4e09880dad4 [25/27] sched/fair: Fold cfs_rq_of(se) into for_each_sched_entity()
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260903/202609030843.mfhuyAcC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c2cffa015e9549aafba9e514384b08204c7cc4b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030843.mfhuyAcC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030843.mfhuyAcC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:2080:2: error: call to undeclared function 'cfs_of_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2080 |         for_each_sched_entity(se, cfs_rq)
         |         ^
   kernel/sched/fair.c:456:29: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^
   kernel/sched/fair.c:2080:2: note: did you mean 'cfs_rq_of'?
   kernel/sched/fair.c:456:29: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^
   kernel/sched/sched.h:1765:30: note: 'cfs_rq_of' declared here
    1765 | static inline struct cfs_rq *cfs_rq_of(const struct sched_entity *se)
         |                              ^
>> kernel/sched/fair.c:2080:2: error: incompatible integer to pointer conversion assigning to 'struct cfs_rq *' from 'int' [-Wint-conversion]
    2080 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:456:27: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^ ~~~~~~~~~~~~~
   kernel/sched/fair.c:4815:2: error: call to undeclared function 'cfs_of_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4815 |         for_each_sched_entity(se, cfs_rq)
         |         ^
   kernel/sched/fair.c:456:29: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^
   kernel/sched/fair.c:4815:2: error: incompatible integer to pointer conversion assigning to 'struct cfs_rq *' from 'int' [-Wint-conversion]
    4815 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:456:27: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^ ~~~~~~~~~~~~~
   kernel/sched/fair.c:6399:2: error: call to undeclared function 'cfs_of_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6399 |         for_each_sched_entity(se, cfs_rq)
         |         ^
   kernel/sched/fair.c:456:29: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^
   kernel/sched/fair.c:6399:2: error: incompatible integer to pointer conversion assigning to 'struct cfs_rq *' from 'int' [-Wint-conversion]
    6399 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:456:27: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^ ~~~~~~~~~~~~~
   kernel/sched/fair.c:6418:2: error: call to undeclared function 'cfs_of_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6418 |         for_each_sched_entity(se, cfs_rq)
         |         ^
   kernel/sched/fair.c:456:29: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^
   kernel/sched/fair.c:6418:2: error: incompatible integer to pointer conversion assigning to 'struct cfs_rq *' from 'int' [-Wint-conversion]
    6418 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:456:27: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^ ~~~~~~~~~~~~~
   kernel/sched/fair.c:7941:2: error: call to undeclared function 'cfs_of_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7941 |         for_each_sched_entity(se, cfs_rq) {
         |         ^
   kernel/sched/fair.c:456:29: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^
   kernel/sched/fair.c:7941:2: error: incompatible integer to pointer conversion assigning to 'struct cfs_rq *' from 'int' [-Wint-conversion]
    7941 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:456:27: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^ ~~~~~~~~~~~~~
   kernel/sched/fair.c:8078:2: error: call to undeclared function 'cfs_of_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    8078 |         for_each_sched_entity(se, cfs_rq) {
         |         ^
   kernel/sched/fair.c:456:29: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^
   kernel/sched/fair.c:8078:2: error: incompatible integer to pointer conversion assigning to 'struct cfs_rq *' from 'int' [-Wint-conversion]
    8078 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:456:27: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^ ~~~~~~~~~~~~~
   kernel/sched/fair.c:15056:3: error: call to undeclared function 'cfs_of_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    15056 |                 for_each_sched_entity(se, cfs_rq) {
          |                 ^
   kernel/sched/fair.c:456:29: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^
   kernel/sched/fair.c:15056:3: error: incompatible integer to pointer conversion assigning to 'struct cfs_rq *' from 'int' [-Wint-conversion]
    15056 |                 for_each_sched_entity(se, cfs_rq) {
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:456:27: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^ ~~~~~~~~~~~~~
   kernel/sched/fair.c:15242:2: error: call to undeclared function 'cfs_of_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    15242 |         for_each_sched_entity(se, cfs_rq) {
          |         ^
   kernel/sched/fair.c:456:29: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^
   kernel/sched/fair.c:15242:2: error: incompatible integer to pointer conversion assigning to 'struct cfs_rq *' from 'int' [-Wint-conversion]
    15242 |         for_each_sched_entity(se, cfs_rq) {
          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:456:27: note: expanded from macro 'for_each_sched_entity'
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^ ~~~~~~~~~~~~~
   16 errors generated.


vim +/cfs_of_of +2080 kernel/sched/fair.c

  2074	
  2075	static void update_curr_fair(struct rq *rq)
  2076	{
  2077		struct sched_entity *se = &rq->donor->se;
  2078		struct cfs_rq *cfs_rq;
  2079	
> 2080		for_each_sched_entity(se, cfs_rq)
  2081			update_curr(cfs_rq);
  2082	}
  2083	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
