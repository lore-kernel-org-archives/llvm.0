Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BEF1845;
	Sun, 17 Dec 2023 06:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMT1MHR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702793493; x=1734329493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oQ2jZoJje2/QbSj32mORA210pg2dzMoRZ9mrxVVf/pM=;
  b=WMT1MHR6TI6pktyaa0UfM5ZCymXpE31EjcIaaduwC4KLdihQBfXBeAg0
   1ntQ9gg81dCjoTt9e2+RNIumayI4BCDwv+H8JQM0YPqE/B7h7tuUtEW5W
   mVFS+aNtxnfXCZpn0yzKbWhaoEi8jSXcr1XMeoA3VuFE3NaewqUSqDEA6
   Ps/WJLUJe/JPqZqzmvJgRri8A8OyA2KmnC/d8/STktBogzK5MiU+0XpMn
   scAw6YfkuzwlVf/pBVLg98HLDi1wFuA/u0dP9FhfkvKJKf8K4ZcC7LyYz
   XXbfK7Q1MfsnSWhog6kVilN/zcZem1M3Fk3AMeEijtC5h+M9meUvdEg/M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2596366"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2596366"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 22:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16783403"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Dec 2023 22:11:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEkN6-0002j0-01;
	Sun, 17 Dec 2023 06:11:28 +0000
Date: Sun, 17 Dec 2023 14:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Imran Khan <imran.f.khan@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] sched: fair: reset task_group.load_avg when there
 are no running tasks.
Message-ID: <202312171440.Nj64lUjd-lkp@intel.com>
References: <20231215052652.917741-1-imran.f.khan@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215052652.917741-1-imran.f.khan@oracle.com>

Hi Imran,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on peterz-queue/sched/core linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Imran-Khan/sched-fair-reset-task_group-load_avg-when-there-are-no-running-tasks/20231215-132912
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20231215052652.917741-1-imran.f.khan%40oracle.com
patch subject: [RFC PATCH] sched: fair: reset task_group.load_avg when there are no running tasks.
config: i386-buildonly-randconfig-001-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171440.Nj64lUjd-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171440.Nj64lUjd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171440.Nj64lUjd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:3579:45: error: no member named 'cfs_nr_running' in 'struct task_group'
                   atomic_long_inc(&task_group(task_of(se))->cfs_nr_running);
                                    ~~~~~~~~~~~~~~~~~~~~~~~  ^
   kernel/sched/fair.c:3595:45: error: no member named 'cfs_nr_running' in 'struct task_group'
                   atomic_long_dec(&task_group(task_of(se))->cfs_nr_running);
                                    ~~~~~~~~~~~~~~~~~~~~~~~  ^
   2 errors generated.


vim +3579 kernel/sched/fair.c

  3568	
  3569	static void
  3570	account_entity_enqueue(struct cfs_rq *cfs_rq, struct sched_entity *se)
  3571	{
  3572		update_load_add(&cfs_rq->load, se->load.weight);
  3573	#ifdef CONFIG_SMP
  3574		if (entity_is_task(se)) {
  3575			struct rq *rq = rq_of(cfs_rq);
  3576	
  3577			account_numa_enqueue(rq, task_of(se));
  3578			list_add(&se->group_node, &rq->cfs_tasks);
> 3579			atomic_long_inc(&task_group(task_of(se))->cfs_nr_running);
  3580		}
  3581	#endif
  3582		cfs_rq->nr_running++;
  3583		if (se_is_idle(se))
  3584			cfs_rq->idle_nr_running++;
  3585	}
  3586	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
