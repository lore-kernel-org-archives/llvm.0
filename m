Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E14134B4;
	Wed, 19 Jul 2023 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689764735; x=1721300735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P0KubPk138k9cErf1uYymJ5zyjOv5tw3WXvCBTgkZSw=;
  b=K1GMAvTe4WnGaq5SjgZ5Nbk/G2CJ4RFsEDIilZ7rCkp9YAIELL+y8xJ3
   /wbN+mLsKBOGyxp+4NirpLiG55+MgCqdYV5fAQQN5gVbzUNEt4Rn6UzBE
   Oh4uoOrSs5Fol7Y9WTsr0XXg1lmIGkOiv7DQ865hVYRz+jYJ0ke5jeLKD
   IvV2Lfd7OjVeiBnB7uKZFH+ukW/HlPlPHq00imvlQxg2UF93UmulZNNy2
   WUviW0oddtnIbMvebztqN3q30v/Crli5aI8M4xMz8a7Dbk5J69NI1WnAU
   /n8KnO/G4kaZbL09HjY5tL+wH4N9IEBh6jcktCpoeuh3xs3WPmm+tvmfJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="346023049"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="346023049"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 04:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867422496"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2023 04:05:13 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM4zW-0004hd-0a;
	Wed, 19 Jul 2023 11:05:10 +0000
Date: Wed, 19 Jul 2023 19:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 1/2] kernel/sched/pelt.c:476:2: error:
 must use 'struct' tag to refer to type 'sched_avg'
Message-ID: <202307191807.sjcNAybu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux remove-margins
head:   f49a0141f6fa8e9f6dd3b8cacae3531f90c74343
commit: 88a5e45c9556977f198d903b4c19ec50d91ade9f [1/2] sched/pelt: Add a new function to approximate the future util_avg value
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230719/202307191807.sjcNAybu-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191807.sjcNAybu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191807.sjcNAybu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:49:
>> kernel/sched/pelt.c:476:2: error: must use 'struct' tag to refer to type 'sched_avg'
           sched_avg sa = {};
           ^
           struct 
>> kernel/sched/pelt.c:478:17: error: use of undeclared identifier 'runtime'
           accumulate_sum(runtime, &sa, 0, 0, 1);
                          ^
>> kernel/sched/pelt.c:479:24: error: too few arguments to function call, expected 2, have 1
           ___update_load_avg(&sa);
           ~~~~~~~~~~~~~~~~~~    ^
   kernel/sched/pelt.c:257:1: note: '___update_load_avg' declared here
   ___update_load_avg(struct sched_avg *sa, unsigned long load)
   ^
   kernel/sched/pelt.c:474:15: warning: no previous prototype for function 'approximate_util_avg' [-Wmissing-prototypes]
   unsigned long approximate_util_avg(unsigned long util, u64 delta)
                 ^
   kernel/sched/pelt.c:474:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long approximate_util_avg(unsigned long util, u64 delta)
   ^
   static 
   1 warning and 3 errors generated.


vim +476 kernel/sched/pelt.c

   469	
   470	/*
   471	 * Approximate the new util_avg value assuming an entity has continued to run
   472	 * for @delta ns.
   473	 */
   474	unsigned long approximate_util_avg(unsigned long util, u64 delta)
   475	{
 > 476		sched_avg sa = {};
   477	
 > 478		accumulate_sum(runtime, &sa, 0, 0, 1);
 > 479		___update_load_avg(&sa);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
