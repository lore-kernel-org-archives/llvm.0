Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068BC3D86;
	Wed, 19 Jul 2023 05:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689743105; x=1721279105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNWgIyDImzSfAN73E8djkiK2n+65c6wPWeT0GzE81aY=;
  b=JzehtxVt/Vck1RHn8ppfR4hQYaNZuuOcA2tCJwlCXOo8CzO0q6BELdxa
   MuqioGOci/tI+m6Neuok6heof5lVts63dD2hgeUadkrprGMXOovlrtJ5U
   +kN83+J0cf1t1NTuq+9+AFrMDnh6Y4HZGlW64QW+Uns+u9aywFUajAjvC
   OVk/y2p8FqPcd2JpK0n0oEXVKyCI+Mu8cUSyUsAWY5cnUqelmI1yA88G+
   8+gIRLL9DAESNlQqV1wd0vwtD4SHHjyiTE2fHLauE21uxPtmk2w9LL/Kn
   gZfKO44SOfRBQh4SrCWoliQP2lQ6f9ZFYzejFLlFQ7jEdrS/xHtOP55Fo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="346676113"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="346676113"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 22:05:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="789282119"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="789282119"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2023 22:05:02 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLzN0-0004AP-0M;
	Wed, 19 Jul 2023 05:05:02 +0000
Date: Wed, 19 Jul 2023 13:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 2/2] kernel/sched/fair.c:165:15: error:
 type specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <202307191211.oFljVu7F-lkp@intel.com>
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
commit: f49a0141f6fa8e9f6dd3b8cacae3531f90c74343 [2/2] sched/fair: Remove magic margin in fits_capacity()
config: powerpc-randconfig-r026-20230718 (https://download.01.org/0day-ci/archive/20230719/202307191211.oFljVu7F-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191211.oFljVu7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191211.oFljVu7F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:165:15: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     165 | static inline fits_capacity(unsigned long util, unsigned long capacity)
         | ~~~~~~~~~~~~~ ^
         | int
>> kernel/sched/fair.c:167:9: error: call to undeclared function 'approximate_util_avg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     167 |         return approximate_util_avg(util, TICK_NSEC) < capacity;
         |                ^
   2 errors generated.


vim +/int +165 kernel/sched/fair.c

   150	
   151	/*
   152	 * The util will fit the capacity if it has enough headroom to grow within the
   153	 * next tick - which is when any load balancing activity happens to do the
   154	 * correction.
   155	 *
   156	 * If util stays within the capacity before tick has elapsed, then it should be
   157	 * fine. If not, then a correction action must happen shortly after it starts
   158	 * running, hence we treat it as !fit.
   159	 *
   160	 * TODO: TICK is not actually accurate enough. balance_interval is the correct
   161	 * one to use as the next load balance doesn't not happen religiously at tick.
   162	 * Accessing balance_interval might be tricky and will require some refactoring
   163	 * first.
   164	 */
 > 165	static inline fits_capacity(unsigned long util, unsigned long capacity)
   166	{
 > 167		return approximate_util_avg(util, TICK_NSEC) < capacity;
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
