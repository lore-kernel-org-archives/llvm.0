Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645F910941;
	Sun, 17 Dec 2023 07:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XuTPTvs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702797323; x=1734333323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WbZnAws1ebDZLBNyh0l0cVIWSHRKi3Kl8mAWBPU9oKE=;
  b=XuTPTvs/zHXdz+7XBgt3hSuzNzNJ+QcQSOi3M8VRvsJSobsWcXHph2N9
   lKrL36xVi2K/TjdS3Uz+bYSYJWQfvJHmFoUw4Xa0Z7L/ow7QdmwNu0nvl
   EajnHGUyfkXWUdpS9qx/aTszulktrH7pRiOjMZygj7lAEFv5dcUCB1rpx
   a5WWJsIv12yuwebVoTOuFF7J0dZsXU0vqaZxLOVbs20XdvQJjgb9oA8n5
   Suj9y1BOAkvPs3SuwyJWRe1dU3ACwvGsO/0Tm4hX9s8oZ2Whz7Wg7VPD5
   7ID768PdZwpyQ9db+aBNT21JxAk5HmlcyZNhr1NJjgps9CcfuxloxMOwT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="374903038"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="374903038"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 23:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768468543"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="768468543"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 23:15:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rElMt-0002nQ-05;
	Sun, 17 Dec 2023 07:15:19 +0000
Date: Sun, 17 Dec 2023 15:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Imran Khan <imran.f.khan@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] sched: fair: reset task_group.load_avg when there
 are no running tasks.
Message-ID: <202312171425.MFabjrns-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171425.MFabjrns-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171425.MFabjrns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171425.MFabjrns-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:3579:43: error: incomplete definition of type 'struct task_group'
                   atomic_long_inc(&task_group(task_of(se))->cfs_nr_running);
                                    ~~~~~~~~~~~~~~~~~~~~~~~^
   include/linux/sched.h:71:8: note: forward declaration of 'struct task_group'
   struct task_group;
          ^
   kernel/sched/fair.c:3595:43: error: incomplete definition of type 'struct task_group'
                   atomic_long_dec(&task_group(task_of(se))->cfs_nr_running);
                                    ~~~~~~~~~~~~~~~~~~~~~~~^
   include/linux/sched.h:71:8: note: forward declaration of 'struct task_group'
   struct task_group;
          ^
   kernel/sched/fair.c:13091:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
   void free_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13091:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void free_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13093:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
       ^
   kernel/sched/fair.c:13093:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
   ^
   static 
   kernel/sched/fair.c:13098:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
   void online_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13098:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void online_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   kernel/sched/fair.c:13100:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
   void unregister_fair_sched_group(struct task_group *tg) { }
        ^
   kernel/sched/fair.c:13100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void unregister_fair_sched_group(struct task_group *tg) { }
   ^
   static 
   4 warnings and 2 errors generated.


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
