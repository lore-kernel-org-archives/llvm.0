Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB723A5;
	Sat,  4 Feb 2023 13:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675515779; x=1707051779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nyyit6VQ98ir7P6XSgzKoBY9/wcbWCF32Qi19hHZyXw=;
  b=XSQ7uyUPb1Kr8NNa0klDA7sdvaYzkgrx5vkA0QCMTYpDwk5HuPUxs1vz
   n8YRjc5fkm4FtloKO1NpqmPL3YS4ARx2+20rmlRJ757h9gEWe5EDu8D1z
   B3DcrQQKdzrH3+ncyXFe+LTAATmd7EyrCjZAgOMHoHTBv5bYmbLGURQZF
   7GxYAdieifIA9usEMVhSIw8Fzgoed8W4I8msaFW3ov/46iYzv8bNrmH2V
   6e0tmI81iXO79C4G1pmOFZYlsL9ekW0X+A8TdEWUrKHvd9tnLbeEY3Nk6
   GbqDO0Iw9xaQuFLyM5jRiPCynGdGBIdV1N+lcnPrhyKbcEhlWFKXL8GJj
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415155953"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="415155953"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 05:02:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643557854"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="643557854"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Feb 2023 05:02:44 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOIBo-0001Jf-0H;
	Sat, 04 Feb 2023 13:02:44 +0000
Date: Sat, 4 Feb 2023 21:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1] sched/deadline: Add more reschedule cases to
 prio_changed_dl()
Message-ID: <202302042016.wBoBvL60-lkp@intel.com>
References: <20230202182854.3696665-1-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202182854.3696665-1-vschneid@redhat.com>

Hi Valentin,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master tip/auto-latest linus/master v6.2-rc6 next-20230203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/sched-deadline-Add-more-reschedule-cases-to-prio_changed_dl/20230203-023449
patch link:    https://lore.kernel.org/r/20230202182854.3696665-1-vschneid%40redhat.com
patch subject: [RFC PATCH v1] sched/deadline: Add more reschedule cases to prio_changed_dl()
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230204/202302042016.wBoBvL60-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/83c5e4c04268bf314814c49022d874719a516dbe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Valentin-Schneider/sched-deadline-Add-more-reschedule-cases-to-prio_changed_dl/20230203-023449
        git checkout 83c5e4c04268bf314814c49022d874719a516dbe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:53:
>> kernel/sched/deadline.c:2684:14: error: no member named 'overloaded' in 'struct dl_rq'
           if (!rq->dl.overloaded)
                ~~~~~~ ^
>> kernel/sched/deadline.c:2693:29: error: no member named 'earliest_dl' in 'struct dl_rq'
                   if (dl_time_before(rq->dl.earliest_dl.curr, p->dl.deadline))
                                      ~~~~~~ ^
   2 errors generated.


vim +2684 kernel/sched/deadline.c

aab03e05e8f7e2 Dario Faggioli     2013-11-28  2658  
1baca4ce16b8cc Juri Lelli         2013-11-07  2659  /*
1baca4ce16b8cc Juri Lelli         2013-11-07  2660   * If the scheduling parameters of a -deadline task changed,
1baca4ce16b8cc Juri Lelli         2013-11-07  2661   * a push or pull operation might be needed.
1baca4ce16b8cc Juri Lelli         2013-11-07  2662   */
aab03e05e8f7e2 Dario Faggioli     2013-11-28  2663  static void prio_changed_dl(struct rq *rq, struct task_struct *p,
aab03e05e8f7e2 Dario Faggioli     2013-11-28  2664  			    int oldprio)
aab03e05e8f7e2 Dario Faggioli     2013-11-28  2665  {
83c5e4c04268bf Valentin Schneider 2023-02-02  2666  	if (!task_on_rq_queued(p))
83c5e4c04268bf Valentin Schneider 2023-02-02  2667  		return;
83c5e4c04268bf Valentin Schneider 2023-02-02  2668  
83c5e4c04268bf Valentin Schneider 2023-02-02  2669  	/*
83c5e4c04268bf Valentin Schneider 2023-02-02  2670  	 * We don't know if p has a earlier or later deadline, so let's blindly
83c5e4c04268bf Valentin Schneider 2023-02-02  2671  	 * set a (maybe not needed) rescheduling point.
83c5e4c04268bf Valentin Schneider 2023-02-02  2672  	 */
83c5e4c04268bf Valentin Schneider 2023-02-02  2673  	if (!IS_ENABLED(CONFIG_SMP)) {
83c5e4c04268bf Valentin Schneider 2023-02-02  2674  		resched_curr(rq);
83c5e4c04268bf Valentin Schneider 2023-02-02  2675  		return;
83c5e4c04268bf Valentin Schneider 2023-02-02  2676  	}
83c5e4c04268bf Valentin Schneider 2023-02-02  2677  
1baca4ce16b8cc Juri Lelli         2013-11-07  2678  	/*
1baca4ce16b8cc Juri Lelli         2013-11-07  2679  	 * This might be too much, but unfortunately
1baca4ce16b8cc Juri Lelli         2013-11-07  2680  	 * we don't have the old deadline value, and
1baca4ce16b8cc Juri Lelli         2013-11-07  2681  	 * we can't argue if the task is increasing
1baca4ce16b8cc Juri Lelli         2013-11-07  2682  	 * or lowering its prio, so...
1baca4ce16b8cc Juri Lelli         2013-11-07  2683  	 */
1baca4ce16b8cc Juri Lelli         2013-11-07 @2684  	if (!rq->dl.overloaded)
02d8ec9456f47b Ingo Molnar        2018-03-03  2685  		deadline_queue_pull_task(rq);
1baca4ce16b8cc Juri Lelli         2013-11-07  2686  
83c5e4c04268bf Valentin Schneider 2023-02-02  2687  	if (task_current(rq, p)) {
1baca4ce16b8cc Juri Lelli         2013-11-07  2688  		/*
1baca4ce16b8cc Juri Lelli         2013-11-07  2689  		 * If we now have a earlier deadline task than p,
1baca4ce16b8cc Juri Lelli         2013-11-07  2690  		 * then reschedule, provided p is still on this
1baca4ce16b8cc Juri Lelli         2013-11-07  2691  		 * runqueue.
1baca4ce16b8cc Juri Lelli         2013-11-07  2692  		 */
9916e214998a4a Peter Zijlstra     2015-06-11 @2693  		if (dl_time_before(rq->dl.earliest_dl.curr, p->dl.deadline))
8875125efe8402 Kirill Tkhai       2014-06-29  2694  			resched_curr(rq);
83c5e4c04268bf Valentin Schneider 2023-02-02  2695  	} else {
1baca4ce16b8cc Juri Lelli         2013-11-07  2696  		/*
83c5e4c04268bf Valentin Schneider 2023-02-02  2697  		 * Current may not be deadline in case p was throttled but we
83c5e4c04268bf Valentin Schneider 2023-02-02  2698  		 * have just replenished it (e.g. rt_mutex_setprio()).
83c5e4c04268bf Valentin Schneider 2023-02-02  2699  		 *
83c5e4c04268bf Valentin Schneider 2023-02-02  2700  		 * Otherwise, if p was given an earlier deadline, reschedule.
1baca4ce16b8cc Juri Lelli         2013-11-07  2701  		 */
83c5e4c04268bf Valentin Schneider 2023-02-02  2702  		if (!dl_task(rq->curr) ||
83c5e4c04268bf Valentin Schneider 2023-02-02  2703  		    dl_time_before(p->dl.deadline, rq->curr->dl.deadline))
8875125efe8402 Kirill Tkhai       2014-06-29  2704  			resched_curr(rq);
801ccdbf018ca5 Peter Zijlstra     2016-02-25  2705  	}
aab03e05e8f7e2 Dario Faggioli     2013-11-28  2706  }
aab03e05e8f7e2 Dario Faggioli     2013-11-28  2707  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
