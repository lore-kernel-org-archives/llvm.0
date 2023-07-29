Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9856EC1;
	Sat, 29 Jul 2023 02:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690598510; x=1722134510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSa99IdhikebdB+3hnC39lCW1UsP457Lh/P+CBuAqRM=;
  b=Ft5ePinEwgMBDqBQR1m4q2lUKASL8YntXCtkbpFV3rhhuKOAsuG59Kr/
   4gwceYVe1lm+tEusbzc5djLUZbkphkYEQOtPmcRtHcLoat+yPvAYTtZ2p
   2ARQadjC6Q4klD7A4VkPyittE9L7OXCrmeu3ow0Xid29zbo8ZSyNqviF3
   0jUjTFQjqIJEaKIbT6P4phKr1pxsxAvfQPgqRo/cgNMZ4y1W+XrKk/HzB
   nVeDprGKvN7bnt9LiL8UzEQ2Jlas4q+GkL+kSaTdUn0ySIGGZQWbfP3Di
   OiBhVekA0QX7qUZ3LXrG72w93dPzVfkrb7a5z0eihExWurD5+9IZCDANW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="455081147"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="455081147"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 19:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="727669776"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="727669776"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Jul 2023 19:41:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPZto-0003ly-2u;
	Sat, 29 Jul 2023 02:41:44 +0000
Date: Sat, 29 Jul 2023 10:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 52/146] fs/resctrl/monitor.c:584:23:
 warning: variable 'r' set but not used
Message-ID: <202307291032.6mE5rklf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   8a35b09275f16d009ed31e93b8b4b3004b04bceb
commit: eb73c346f06a1570cd8a6791164482440dafc0fc [52/146] x86/resctrl: Move all the filesystem code to /fs/resctrl
config: i386-randconfig-i013-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291032.6mE5rklf-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291032.6mE5rklf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291032.6mE5rklf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl/monitor.c:584:23: warning: variable 'r' set but not used [-Wunused-but-set-variable]
           struct rdt_resource *r;
                                ^
   1 warning generated.


vim +/r +584 fs/resctrl/monitor.c

   576	
   577	/*
   578	 * Handler to scan the limbo list and move the RMIDs
   579	 * to free list whose occupancy < threshold_occupancy.
   580	 */
   581	void cqm_handle_limbo(struct work_struct *work)
   582	{
   583		unsigned long delay = msecs_to_jiffies(CQM_LIMBOCHECK_INTERVAL);
 > 584		struct rdt_resource *r;
   585		struct rdt_domain *d;
   586		int cpu;
   587	
   588		mutex_lock(&rdtgroup_mutex);
   589	
   590		r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
   591		d = container_of(work, struct rdt_domain, cqm_limbo.work);
   592	
   593		__check_limbo(d, false);
   594	
   595		if (has_busy_rmid(d)) {
   596			cpu = cpumask_any_housekeeping(&d->cpu_mask);
   597			schedule_delayed_work_on(cpu, &d->cqm_limbo, delay);
   598		}
   599	
   600		mutex_unlock(&rdtgroup_mutex);
   601	}
   602	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
