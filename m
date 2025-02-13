Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2819B5A9;
	Thu, 13 Feb 2025 15:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739461859; cv=none; b=adfUKWreiNmwwYj3vBlGW51Ov1z/A/9T6fbt0xzY+FaEz1uTl0S6N1KyTuqwjPC81/UY9IxaoVAOJHUdZidRVrFnEW07oU32vJsNhIEU61nWJB7YxMIfjFNq1qahs8IFBplPIA/HDeshSpAhiltBm01Nqr+Q1zhlvruTqJx6ntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739461859; c=relaxed/simple;
	bh=neBzSs/Q2VbuMGlj/vqVHIPSEiZRbs8T07e3BLP2xZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bawkNIB8LZnwmK9vDLTEfq5itCpsmxSMluhj3BgPRqzAJObil4OYtHZluR4YJne4XXWyWU/MyMyYF9chi4A+rQnLjzeioLNeoupkQCdV7wGlqF6lQfchF6jxDYcLM+lz4e3BWnoqaauw3xriofNe1WwGJtwAIey2UEhyaRbS/0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUkVTRBX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUkVTRBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739461857; x=1770997857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=neBzSs/Q2VbuMGlj/vqVHIPSEiZRbs8T07e3BLP2xZ4=;
  b=aUkVTRBXwIm9GvX2jyhyP2ri6TnY4Rc893xRWkDx59yZksPJNczWbhBL
   KkDWt7JRNlky6qBhL+9VUJc0PBXXZhki+BOSdUgNXIHER1tYH4AnbPOtM
   kgleIaIkHFjT6Dr9grePzIC+H5ruIIi7TXN4F3d/6JsKRitgoiDnsv5Wg
   5UzDIt2N4JOexq+wlKm15/b+LhHjFvhA10v5qEre9J1AYGhOz39FilnZk
   dEh2+F2QjSQ4FZWpCL71Fj+IkItgeCOU7nGQsIFB1hSgdm6sVRP6e8Ru3
   o/cXR8/DgXXANGAWuscfGa+Ve5Kp+Yw/RnX1TqZDqAhig9TZmqvzxac2B
   Q==;
X-CSE-ConnectionGUID: fwg+64MVT5eO4osdJo7URQ==
X-CSE-MsgGUID: eB49kqeWRXenHAbzHuTVIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="44102485"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="44102485"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 07:50:55 -0800
X-CSE-ConnectionGUID: 5cpCUjHoSEmxgOyVgSsmAQ==
X-CSE-MsgGUID: dVQrsF+GQGKfrOH3sOfpjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="144032709"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Feb 2025 07:50:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tibUJ-0018Np-2I;
	Thu, 13 Feb 2025 15:50:51 +0000
Date: Thu, 13 Feb 2025 23:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: zihan zhou <15645113830zzh@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [peterz-queue:sched/core 1/5] kernel/sched/fair.c:942:40: error:
 invalid operands to binary expression ('int' and 'void')
Message-ID: <202502132351.2AEevb2A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   f5e5644f37620a7177ec30bf771fe90926ed9e7a
commit: a776cf5efa44410204ec367cd593ad56b9d3df5e [1/5] sched: Cancel the slice protection of the idle entity
config: i386-buildonly-randconfig-003-20250213 (https://download.01.org/0day-ci/archive/20250213/202502132351.2AEevb2A-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502132351.2AEevb2A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502132351.2AEevb2A-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:897:11: warning: equality comparison result unused [-Wunused-comparison]
     897 |         se->vlag == se->deadline;
         |         ~~~~~~~~~^~~~~~~~~~~~~~~
   kernel/sched/fair.c:897:11: note: use '=' to turn this equality comparison into an assignment
     897 |         se->vlag == se->deadline;
         |                  ^~
         |                  =
   kernel/sched/fair.c:902:2: error: statement requires expression of scalar type ('void' invalid)
     902 |         if (protect_slice(se))
         |         ^   ~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:942:40: error: invalid operands to binary expression ('int' and 'void')
     942 |         if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +942 kernel/sched/fair.c

   905	
   906	/*
   907	 * Earliest Eligible Virtual Deadline First
   908	 *
   909	 * In order to provide latency guarantees for different request sizes
   910	 * EEVDF selects the best runnable task from two criteria:
   911	 *
   912	 *  1) the task must be eligible (must be owed service)
   913	 *
   914	 *  2) from those tasks that meet 1), we select the one
   915	 *     with the earliest virtual deadline.
   916	 *
   917	 * We can do this in O(log n) time due to an augmented RB-tree. The
   918	 * tree keeps the entries sorted on deadline, but also functions as a
   919	 * heap based on the vruntime by keeping:
   920	 *
   921	 *  se->min_vruntime = min(se->vruntime, se->{left,right}->min_vruntime)
   922	 *
   923	 * Which allows tree pruning through eligibility.
   924	 */
   925	static struct sched_entity *pick_eevdf(struct cfs_rq *cfs_rq)
   926	{
   927		struct rb_node *node = cfs_rq->tasks_timeline.rb_root.rb_node;
   928		struct sched_entity *se = __pick_first_entity(cfs_rq);
   929		struct sched_entity *curr = cfs_rq->curr;
   930		struct sched_entity *best = NULL;
   931	
   932		/*
   933		 * We can safely skip eligibility check if there is only one entity
   934		 * in this cfs_rq, saving some cycles.
   935		 */
   936		if (cfs_rq->nr_queued == 1)
   937			return curr && curr->on_rq ? curr : se;
   938	
   939		if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
   940			curr = NULL;
   941	
 > 942		if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
   943			return curr;
   944	
   945		/* Pick the leftmost entity if it's eligible */
   946		if (se && entity_eligible(cfs_rq, se)) {
   947			best = se;
   948			goto found;
   949		}
   950	
   951		/* Heap search for the EEVD entity */
   952		while (node) {
   953			struct rb_node *left = node->rb_left;
   954	
   955			/*
   956			 * Eligible entities in left subtree are always better
   957			 * choices, since they have earlier deadlines.
   958			 */
   959			if (left && vruntime_eligible(cfs_rq,
   960						__node_2_se(left)->min_vruntime)) {
   961				node = left;
   962				continue;
   963			}
   964	
   965			se = __node_2_se(node);
   966	
   967			/*
   968			 * The left subtree either is empty or has no eligible
   969			 * entity, so check the current node since it is the one
   970			 * with earliest deadline that might be eligible.
   971			 */
   972			if (entity_eligible(cfs_rq, se)) {
   973				best = se;
   974				break;
   975			}
   976	
   977			node = node->rb_right;
   978		}
   979	found:
   980		if (!best || (curr && entity_before(curr, best)))
   981			best = curr;
   982	
   983		return best;
   984	}
   985	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
