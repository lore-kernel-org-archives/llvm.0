Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D759012B60;
	Wed, 19 Jul 2023 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689761520; x=1721297520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wCbAGtmvVfYecEAdecLv0Tjjs4EUVjZ2VFr1rFt6x1Q=;
  b=ZrE5jp78fbLH0uVVBuEtC9cQDLvbCGccAkRX1DwKApo9yycftvimo9Nm
   OJ0z0x/3LNyYNasIygEnm6IIPYrcIANmn4L6NJ+L8o3LT5i7e0YaPhbFP
   xxoV77WP34O2iRjt/TFRdJWcnjotpMcSoapG0bnBlZdFQ5aLucCyJTYgO
   gz0qFqwe6wlRR96olypmP5Lf4b0DxqYE3EEe59EK7jcRG+LrzApgSAcRn
   oPQWa1NLtB41mdx7VoeJg5iE2XvmhN7PBW861Wb0+hLAaRz+IPVQDsFA/
   MLxgakeRtMC+THTexkqYkdsfYvgDZ2oYLBAguocw+wn5xItOTkAIlwClD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366465423"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366465423"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 03:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="789365343"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="789365343"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2023 03:11:45 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM49o-0004fL-2l;
	Wed, 19 Jul 2023 10:11:44 +0000
Date: Wed, 19 Jul 2023 18:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 1/2] kernel/sched/pelt.c:474:15:
 warning: no previous prototype for function 'approximate_util_avg'
Message-ID: <202307191801.PYkX2rhD-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230719/202307191801.PYkX2rhD-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191801.PYkX2rhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191801.PYkX2rhD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:49:
   kernel/sched/pelt.c:476:2: error: must use 'struct' tag to refer to type 'sched_avg'
           sched_avg sa = {};
           ^
           struct 
   kernel/sched/pelt.c:478:17: error: use of undeclared identifier 'runtime'
           accumulate_sum(runtime, &sa, 0, 0, 1);
                          ^
   kernel/sched/pelt.c:479:24: error: too few arguments to function call, expected 2, have 1
           ___update_load_avg(&sa);
           ~~~~~~~~~~~~~~~~~~    ^
   kernel/sched/pelt.c:257:1: note: '___update_load_avg' declared here
   ___update_load_avg(struct sched_avg *sa, unsigned long load)
   ^
>> kernel/sched/pelt.c:474:15: warning: no previous prototype for function 'approximate_util_avg' [-Wmissing-prototypes]
   unsigned long approximate_util_avg(unsigned long util, u64 delta)
                 ^
   kernel/sched/pelt.c:474:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long approximate_util_avg(unsigned long util, u64 delta)
   ^
   static 
   1 warning and 3 errors generated.


vim +/approximate_util_avg +474 kernel/sched/pelt.c

   469	
   470	/*
   471	 * Approximate the new util_avg value assuming an entity has continued to run
   472	 * for @delta ns.
   473	 */
 > 474	unsigned long approximate_util_avg(unsigned long util, u64 delta)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
