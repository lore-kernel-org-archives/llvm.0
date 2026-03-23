Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FBFCA52;
	Mon, 23 Mar 2026 00:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774224900; cv=none; b=KDJiL8lk1YBcN1oM2tvLUMdsN7+KtKxjiCKse5iPpUZ3lL1WXEjXtCpexqSOITf7Wa4NP/DTnUK0nTOtmAhs87qWqMyYjT2N1utEOyNvZKPutBf0Kz8FyQILnuQgacyv3DC/H2Kyzu0fy3ar+36GvH56EzwgLayvwKQeNaPvxSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774224900; c=relaxed/simple;
	bh=fWhZF7kVkOLrOx/XWjKeN9W16417UkUNq7U9tSo5qzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gM1I17x4BmujzSjPswZ2i6nskCacD1797r+YPhCxvH1z0whfTAg4Y5lDm7gCfkvgc2zQ+us0scmKqTP8zUPFGkPFJC0H0yhBJqgxsS8oEvPjd4J1eF7p/cWO0iwiB3jICk33eWTi3Ijwh8XLzo/PBCYx5alKfqa3rhbLg4fm/Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKk2raO9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKk2raO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774224898; x=1805760898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fWhZF7kVkOLrOx/XWjKeN9W16417UkUNq7U9tSo5qzQ=;
  b=eKk2raO9zKGqEuEg27um31WzVob35b3HCjeXxQO9L2ybVe7YUtQ/xsb+
   BBYzeufcOJ5RHUzlIdGVqjyBUMrp4opGkxNNsO41s3px30xf6rv+KDv5I
   +KU41zM2rzE0U1G/kScOn0yYoNsZtBHDJVWI3H9sV+zj4i9CFX321sWKA
   kx+JeBNwDpaus0+guB7//p+hANXkYYLUCe1K7+DoxIwWLhDk0m82SeYjm
   /DA+pNNJP1/E0xLvB362KApbBGJRMfIYE4JUUNE74TfvgcXPHmnedKXto
   Kyso+OuRciHgXiFpWYD6Obj1KlpEljwmThgxvZULy3NvFHcz997aZwFl6
   A==;
X-CSE-ConnectionGUID: JI9UZCKYTmuBV4tFoa53Rw==
X-CSE-MsgGUID: 2hYcIKBRRI+X/t8c6O/AyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79131601"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="79131601"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 17:14:58 -0700
X-CSE-ConnectionGUID: gH0cIRmfTBSqHNU4/gFEhA==
X-CSE-MsgGUID: IbQKCpPhSlGPdksS/4IWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="222940426"
Received: from lkp-server02.sh.intel.com (HELO 391eea459618) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Mar 2026 17:14:56 -0700
Received: from kbuild by 391eea459618 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4SwX-00000000097-2hb2;
	Mon, 23 Mar 2026 00:14:53 +0000
Date: Mon, 23 Mar 2026 08:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Jinghuang <chenjinghuang2@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 8/9] sched/fair: Steal work from an overloaded CPU
 when CPU goes idle
Message-ID: <202603230856.FTVv1O5z-lkp@intel.com>
References: <20260320055920.2518389-9-chenjinghuang2@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320055920.2518389-9-chenjinghuang2@huawei.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.0-rc5]
[cannot apply to tip/sched/core peterz-queue/sched/core next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Jinghuang/sched-Provide-sparsemask-a-reduced-contention-bitmap/20260321-084706
base:   linus/master
patch link:    https://lore.kernel.org/r/20260320055920.2518389-9-chenjinghuang2%40huawei.com
patch subject: [RFC PATCH v5 8/9] sched/fair: Steal work from an overloaded CPU when CPU goes idle
config: arm-randconfig-001-20260323 (https://download.01.org/0day-ci/archive/20260323/202603230856.FTVv1O5z-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b1cf9b0835d214bcbd0d6e8882760c07cfccb298)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230856.FTVv1O5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230856.FTVv1O5z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:13272:3: warning: releasing raw_spinlock 'rq_lockp(dst_rq)' that was not held [-Wthread-safety-analysis]
    13272 |                 raw_spin_rq_unlock(dst_rq);
          |                 ^
>> kernel/sched/fair.c:13293:2: warning: raw_spinlock 'rq_lockp(dst_rq)' is not held on every path through here [-Wthread-safety-analysis]
    13293 |         local_irq_restore(rf.flags);
          |         ^
   include/linux/irqflags.h:223:8: note: expanded from macro 'local_irq_restore'
     223 |                 if (!raw_irqs_disabled_flags(flags))    \
         |                      ^
   include/linux/irqflags.h:188:13: note: expanded from macro 'raw_irqs_disabled_flags'
     188 |                 typecheck(unsigned long, flags);        \
         |                           ^
   kernel/sched/fair.c:13286:3: note: raw_spinlock acquired here
    13286 |                 raw_spin_rq_lock(dst_rq);
          |                 ^
   kernel/sched/fair.c:13310:12: error: redefinition of 'try_steal'
    13310 | static int try_steal(struct rq *dst_rq, struct rq_flags *dst_rf)
          |            ^
   kernel/sched/fair.c:5195:19: note: previous definition is here
    5195 | static inline int try_steal(struct rq *this_rq, struct rq_flags *rf)
         |                   ^
   2 warnings and 1 error generated.


vim +13272 kernel/sched/fair.c

 13250	
 13251	/*
 13252	 * Attempt to migrate a CFS task from @src_cpu to @dst_rq.  @locked indicates
 13253	 * whether @dst_rq is already locked on entry.  This function may lock or
 13254	 * unlock @dst_rq, and updates @locked to indicate the locked state on return.
 13255	 * The locking protocol is based on idle_balance().
 13256	 * Returns 1 on success and 0 on failure.
 13257	 */
 13258	static int steal_from(struct rq *dst_rq, struct rq_flags *dst_rf, bool *locked,
 13259			      int src_cpu)
 13260	{
 13261		struct task_struct *p;
 13262		struct rq_flags rf;
 13263		int stolen = 0;
 13264		int dst_cpu = dst_rq->cpu;
 13265		struct rq *src_rq = cpu_rq(src_cpu);
 13266	
 13267		if (dst_cpu == src_cpu || src_rq->cfs.h_nr_runnable < 2)
 13268			return 0;
 13269	
 13270		if (*locked) {
 13271			rq_unpin_lock(dst_rq, dst_rf);
 13272			raw_spin_rq_unlock(dst_rq);
 13273			*locked = false;
 13274		}
 13275		rq_lock_irqsave(src_rq, &rf);
 13276		update_rq_clock(src_rq);
 13277	
 13278		if (src_rq->cfs.h_nr_runnable < 2 || !cpu_active(src_cpu))
 13279			p = NULL;
 13280		else
 13281			p = detach_next_task(&src_rq->cfs, dst_rq);
 13282	
 13283		rq_unlock(src_rq, &rf);
 13284	
 13285		if (p) {
 13286			raw_spin_rq_lock(dst_rq);
 13287			rq_repin_lock(dst_rq, dst_rf);
 13288			*locked = true;
 13289			update_rq_clock(dst_rq);
 13290			attach_task(dst_rq, p);
 13291			stolen = 1;
 13292		}
 13293		local_irq_restore(rf.flags);
 13294	
 13295		return stolen;
 13296	}
 13297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
