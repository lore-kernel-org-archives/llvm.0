Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2602A82876;
	Thu,  9 May 2024 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715288728; cv=none; b=ovpCxKwc1KXE5DBI3TgZc2P8x76E5C0+vu8fWkyO8K0M/q/EVtrAsSkXMoPi9ab7rvMvIOfWfAkN8TFmb1lZluqb/F4Jen01+45KugADVC1qqAFDSL8f79fTRuMirZsahcZG8Esqmt595/q4SM7w44LII5kHoG95QkNvlUTlj10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715288728; c=relaxed/simple;
	bh=EQwD5qQz1wwQh4rYd/Q+odH7uY7DweQtUtgwjvV8F9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blNrfMyitNDApwaj274y+OKCbWZnnRmSUYl4U60uW3CiiVlOh8L7KGtLXxmfnJPw/ZAYPFEo4r+guwM9GwpDjVf1ZcvG2GfR9UAEEMrUY6S9eT8ZrpucXZfmF/6NjosDcDyNNo006+wLszWlZYSyXiedRzprdTUP3mHyshKWW9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHIVr50N; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHIVr50N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715288726; x=1746824726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EQwD5qQz1wwQh4rYd/Q+odH7uY7DweQtUtgwjvV8F9M=;
  b=AHIVr50NNyG1bhEremAOh1wUpljd/kVXXeaKqi24xrO7o2duJMTyyWLw
   OumZcD4B5QGbwmIR3PC7pAszzKjZ2eYyUK1rRB/EPLK3iBVRPqQ8VzNdV
   ALp1Lf/VWCxgWdGxSAoMUtH1Nl/4elhFikXF2B8avvcDF93TW7Vp8PMgt
   U0FkqWVPZCkfIGxlG7DlD1mQpZeBqDS+KwR/xmNltznOPiqb9XtR291Mv
   F7OMgztBuEBY4AI2sswsk2lKfaH0NpVUJSpHcwRRUhfrWiw+OcrWG7bYF
   JJX3O5Mvcu1PmTiehJORJfsvwkLd60j1A0iGmirYKv24e6sg5LOWQbs76
   Q==;
X-CSE-ConnectionGUID: lER5W8IiSzavfr2wQ6YufQ==
X-CSE-MsgGUID: +jGmfDRGR7eKuIWvPy/qZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21814561"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="21814561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 14:05:26 -0700
X-CSE-ConnectionGUID: e0rmWpgrS/yz7SKEiUAq9Q==
X-CSE-MsgGUID: nPzFq5hgQxyMyUGgXpAXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="34048248"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2024 14:05:24 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Ax8-0005N9-0L;
	Thu, 09 May 2024 21:05:22 +0000
Date: Fri, 10 May 2024 05:04:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hongyan Xia <hongyan.xia2@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 2/6] sched/uclamp: Track a new util_avg_bias signal
Message-ID: <202405100428.Ao1oE7iL-lkp@intel.com>
References: <2e43dc6b376ea6d785976a398b5d9ffe823cf35d.1715082714.git.hongyan.xia2@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e43dc6b376ea6d785976a398b5d9ffe823cf35d.1715082714.git.hongyan.xia2@arm.com>

Hi Hongyan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master next-20240509]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge linus/master tip/auto-latest peterz-queue/sched/core v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongyan-Xia/Revert-sched-uclamp-Set-max_spare_cap_cpu-even-if-max_spare_cap-is-0/20240507-205300
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/2e43dc6b376ea6d785976a398b5d9ffe823cf35d.1715082714.git.hongyan.xia2%40arm.com
patch subject: [RFC PATCH v3 2/6] sched/uclamp: Track a new util_avg_bias signal
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240510/202405100428.Ao1oE7iL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100428.Ao1oE7iL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100428.Ao1oE7iL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:27:
   In file included from include/linux/mm_api.h:1:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/fair.c:6805:29: error: no member named 'avg' in 'struct cfs_rq'
    6805 |         util_bias_enqueue(&rq->cfs.avg, p);
         |                            ~~~~~~~ ^
   kernel/sched/fair.c:6899:29: error: no member named 'avg' in 'struct cfs_rq'
    6899 |         util_bias_dequeue(&rq->cfs.avg, p);
         |                            ~~~~~~~ ^
   1 warning and 2 errors generated.


vim +6805 kernel/sched/fair.c

  6736	
  6737	/*
  6738	 * The enqueue_task method is called before nr_running is
  6739	 * increased. Here we update the fair scheduling stats and
  6740	 * then put the task into the rbtree:
  6741	 */
  6742	static void
  6743	enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
  6744	{
  6745		struct cfs_rq *cfs_rq;
  6746		struct sched_entity *se = &p->se;
  6747		int idle_h_nr_running = task_has_idle_policy(p);
  6748		int task_new = !(flags & ENQUEUE_WAKEUP);
  6749	
  6750		/*
  6751		 * The code below (indirectly) updates schedutil which looks at
  6752		 * the cfs_rq utilization to select a frequency.
  6753		 * Let's add the task's estimated utilization to the cfs_rq's
  6754		 * estimated utilization, before we update schedutil.
  6755		 */
  6756		util_est_enqueue(&rq->cfs, p);
  6757	
  6758		/*
  6759		 * If in_iowait is set, the code below may not trigger any cpufreq
  6760		 * utilization updates, so do it here explicitly with the IOWAIT flag
  6761		 * passed.
  6762		 */
  6763		if (p->in_iowait)
  6764			cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
  6765	
  6766		for_each_sched_entity(se) {
  6767			if (se->on_rq)
  6768				break;
  6769			cfs_rq = cfs_rq_of(se);
  6770			enqueue_entity(cfs_rq, se, flags);
  6771	
  6772			cfs_rq->h_nr_running++;
  6773			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6774	
  6775			if (cfs_rq_is_idle(cfs_rq))
  6776				idle_h_nr_running = 1;
  6777	
  6778			/* end evaluation on encountering a throttled cfs_rq */
  6779			if (cfs_rq_throttled(cfs_rq))
  6780				goto enqueue_throttle;
  6781	
  6782			flags = ENQUEUE_WAKEUP;
  6783		}
  6784	
  6785		for_each_sched_entity(se) {
  6786			cfs_rq = cfs_rq_of(se);
  6787	
  6788			update_load_avg(cfs_rq, se, UPDATE_TG);
  6789			se_update_runnable(se);
  6790			update_cfs_group(se);
  6791	
  6792			cfs_rq->h_nr_running++;
  6793			cfs_rq->idle_h_nr_running += idle_h_nr_running;
  6794	
  6795			if (cfs_rq_is_idle(cfs_rq))
  6796				idle_h_nr_running = 1;
  6797	
  6798			/* end evaluation on encountering a throttled cfs_rq */
  6799			if (cfs_rq_throttled(cfs_rq))
  6800				goto enqueue_throttle;
  6801		}
  6802	
  6803		/* At this point se is NULL and we are at root level*/
  6804		add_nr_running(rq, 1);
> 6805		util_bias_enqueue(&rq->cfs.avg, p);
  6806		/* XXX: We should skip the update above and only do it once here. */
  6807		cpufreq_update_util(rq, 0);
  6808	
  6809		/*
  6810		 * Since new tasks are assigned an initial util_avg equal to
  6811		 * half of the spare capacity of their CPU, tiny tasks have the
  6812		 * ability to cross the overutilized threshold, which will
  6813		 * result in the load balancer ruining all the task placement
  6814		 * done by EAS. As a way to mitigate that effect, do not account
  6815		 * for the first enqueue operation of new tasks during the
  6816		 * overutilized flag detection.
  6817		 *
  6818		 * A better way of solving this problem would be to wait for
  6819		 * the PELT signals of tasks to converge before taking them
  6820		 * into account, but that is not straightforward to implement,
  6821		 * and the following generally works well enough in practice.
  6822		 */
  6823		if (!task_new)
  6824			check_update_overutilized_status(rq);
  6825	
  6826	enqueue_throttle:
  6827		assert_list_leaf_cfs_rq(rq);
  6828	
  6829		hrtick_update(rq);
  6830	}
  6831	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
