Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384CB3FF5
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 04:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646024396; x=1677560396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=of+h04jWWIy6BNGzmUc2c/CN/+cG+DmsSBEDO7pVo18=;
  b=N/e7CUVv8EOvqYYqolATbePCVdo2A+I//I99YxGRhD7dqjFDT+FlJnbm
   cEuzmU00D9PuvLIVoPEarxMHbiYIwbtllBOUj1Dz6ryMhG4az54gwaJiC
   KDptk+CW8bq7x1ZtghrCmB/VqCPkBLJP24M0zJe/H/txxhOLn2FDfW4aO
   wxOdjeyP697cLX9ljZLHvVhCA4chywBqhXR7Iwj8kSMotrGH2IRxhlh3G
   7EO5iA5WZBYLYzz/LNh8fV88ibF6XO56pXr9Z/bHIANZg0AL3Q45EUiAo
   6WKszfuRr/a1oe3XIJGXG83B8TRUdIq7GhwytF48Q1tpvzR1noU54K/Fk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="277458796"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="277458796"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 20:59:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="492593588"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Feb 2022 20:59:53 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOY8W-00072y-MD; Mon, 28 Feb 2022 04:59:52 +0000
Date: Mon, 28 Feb 2022 12:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-de:wip/uclamp_util_cap 2/2] kernel/sched/fair.c:3878:26: error:
 no member named 'tg' in 'struct cfs_rq'
Message-ID: <202202281217.CMzbqwQB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.gitlab.arm.com/linux-arm/linux-de.git wip/uclamp_util_cap
head:   df7ef1cab37eca401198f547fd206c7c180fdac5
commit: df7ef1cab37eca401198f547fd206c7c180fdac5 [2/2] sched/fair, pelt: Force rng se/cfs_rq to !rng if se's util_avg>=uclamp_max for taskgroups
config: arm64-buildonly-randconfig-r006-20220228 (https://download.01.org/0day-ci/archive/20220228/202202281217.CMzbqwQB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add arm-de https://git.gitlab.arm.com/linux-arm/linux-de.git
        git fetch --no-tags arm-de wip/uclamp_util_cap
        git checkout df7ef1cab37eca401198f547fd206c7c180fdac5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:3878:26: error: no member named 'tg' in 'struct cfs_rq'
                           uclamp_max = gcfs_rq->tg->uclamp[UCLAMP_MAX].value;
                                        ~~~~~~~  ^
   kernel/sched/fair.c:8272:68: error: too few arguments to function call, expected 3, have 2
           decayed = update_cfs_rq_load_avg(cfs_rq_clock_pelt(cfs_rq), cfs_rq);
                     ~~~~~~~~~~~~~~~~~~~~~~                                  ^
   kernel/sched/fair.c:3698:1: note: 'update_cfs_rq_load_avg' declared here
   update_cfs_rq_load_avg(u64 now, struct cfs_rq *cfs_rq, int running)
   ^
   2 errors generated.


vim +3878 kernel/sched/fair.c

  3855	
  3856	
  3857	
  3858	/* Update task and its cfs_rq load average */
  3859	static inline void update_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
  3860	{
  3861		u64 now = cfs_rq_clock_pelt(cfs_rq);
  3862		int decayed, se_running, cfs_rq_running;
  3863	
  3864		se_running = cfs_rq->curr == se;
  3865		cfs_rq_running = cfs_rq->curr != NULL;
  3866	
  3867	#ifdef CONFIG_UCLAMP_TASK
  3868		if (se_running) {
  3869			unsigned long uclamp_max = ULONG_MAX;
  3870	
  3871			if (entity_is_task(se)) {
  3872				struct task_struct *p = task_of(se);
  3873				uclamp_max = p->uclamp_req[UCLAMP_MAX].value;
  3874			}
  3875	#ifdef CONFIG_UCLAMP_TASK_GROUP
  3876			else {
  3877				struct cfs_rq *gcfs_rq = group_cfs_rq(se);
> 3878				uclamp_max = gcfs_rq->tg->uclamp[UCLAMP_MAX].value;
  3879			}
  3880	#endif
  3881			if (se->avg.util_avg >= uclamp_max) {
  3882				se_running = 0;
  3883				cfs_rq_running = 0;
  3884			}
  3885		}
  3886	#endif
  3887	
  3888		/*
  3889		 * Track task load average for carrying it to new CPU after migrated, and
  3890		 * track group sched_entity load average for task_h_load calc in migration
  3891		 */
  3892		if (se->avg.last_update_time && !(flags & SKIP_AGE_LOAD))
  3893			__update_load_avg_se(now, cfs_rq, se, se_running);
  3894	
  3895		decayed  = update_cfs_rq_load_avg(now, cfs_rq, cfs_rq_running);
  3896		decayed |= propagate_entity_load_avg(se);
  3897	
  3898		if (!se->avg.last_update_time && (flags & DO_ATTACH)) {
  3899	
  3900			/*
  3901			 * DO_ATTACH means we're here from enqueue_entity().
  3902			 * !last_update_time means we've passed through
  3903			 * migrate_task_rq_fair() indicating we migrated.
  3904			 *
  3905			 * IOW we're enqueueing a task on a new CPU.
  3906			 */
  3907			attach_entity_load_avg(cfs_rq, se);
  3908			update_tg_load_avg(cfs_rq);
  3909	
  3910		} else if (decayed) {
  3911			cfs_rq_util_change(cfs_rq, 0);
  3912	
  3913			if (flags & UPDATE_TG)
  3914				update_tg_load_avg(cfs_rq);
  3915		}
  3916	}
  3917	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
