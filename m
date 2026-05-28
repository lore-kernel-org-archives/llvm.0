Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85CA38A72C;
	Thu, 28 May 2026 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962355; cv=none; b=u01rC8q9K6fHKmS6r2QPappe2jNFeE6DYeGIgLhOPv11Nmacq+XfO2OvzJB9AGuLhIqIiOxg4SVNMRVkP2wwKzXiDqT7moKs4KoIbpc/OlK615bALnysSP3Wbl6Sk/sZ9CNQklb6uxB87KLcIgsP6jECI9ndBZToJjl7sba0KRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962355; c=relaxed/simple;
	bh=u4KQyevO0lsjfzitdwGKGzyIBtc5q/zb1uFGBX9/SAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvQX5xC7pieknRC0K/BWMx1wW84jbSXvUvRwZCL0bgv/cNzexe1rD3bllSXTC6qzobC2ap0JnaRD0mfhVQYOFuyB0EO0C5ZFHtLDMQoJVejQkTiFWBNMuO29xNUqy8rZwltTuKZjQdicgwMqAl4iB9Xgt8G2BP8Je65P/2KiD9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yrdx6iLv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yrdx6iLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779962354; x=1811498354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u4KQyevO0lsjfzitdwGKGzyIBtc5q/zb1uFGBX9/SAU=;
  b=Yrdx6iLv5lUNmvMJ5jpbiVGcehmPWGZXjVZIYixKhOsVe6JK29NyiYAn
   KKnvK9OIYvZGJqTgWJIfzWIa1jc70KzGviYSrSSdUY8XWr+0/AcnfCt07
   2+G0S9uLL8+PguMRUyn+E8EzHcoJztoPAPym7K5caDsCWt0JEdg+qMB6P
   XBjeRz5fQpJaWGfnU5vrWiXJxNKK3P8TkUjsDsVHnFkR+jX2LRfpb8oHu
   6oz1VBZYHHPsQ29R+clfK3wH7BL4mrllo2E97dCZ0nW604YSza9iw0q7e
   qYKjCOiArTAdZ1KNnyFO1yV0nIU62kclW5LBeqVia8M2UDe2aQ1qrtx9b
   Q==;
X-CSE-ConnectionGUID: RrTE6yKTRiWM+IpSH44+cw==
X-CSE-MsgGUID: Ss2vD4YDSU+SyhoB21PuGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84690777"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="84690777"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 02:59:14 -0700
X-CSE-ConnectionGUID: bx3Fkm9MQyOeZz9pp4l+wQ==
X-CSE-MsgGUID: wNR4CYXHQn6vbs38vm32ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="238322484"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 May 2026 02:59:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSXW7-000000005oK-1CaQ;
	Thu, 28 May 2026 09:59:07 +0000
Date: Thu, 28 May 2026 17:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Li kunyu <likunyu10@163.com>, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Li kunyu <likunyu10@163.com>
Subject: Re: [PATCH v2] kernel/sched/fair: Fix the issue of virtual runtime
 conversion error
Message-ID: <202605281756.0qWgdGW5-lkp@intel.com>
References: <20260527072113.359604-1-likunyu10@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527072113.359604-1-likunyu10@163.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on peterz-queue/sched/core linus/master v7.1-rc5 next-20260527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-kunyu/kernel-sched-fair-Fix-the-issue-of-virtual-runtime-conversion-error/20260527-152554
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260527072113.359604-1-likunyu10%40163.com
patch subject: [PATCH v2] kernel/sched/fair: Fix the issue of virtual runtime conversion error
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260528/202605281756.0qWgdGW5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281756.0qWgdGW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281756.0qWgdGW5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:7632:6: warning: variable 'delta' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    7632 |         if (unlikely(se->load.weight != NICE_0_LOAD))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:7644:28: note: uninitialized use occurs here
    7644 |         hrtick_start(rq, (scale * delta) / 1024);
         |                                   ^~~~~
   kernel/sched/fair.c:7632:2: note: remove the 'if' if its condition is always true
    7632 |         if (unlikely(se->load.weight != NICE_0_LOAD))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    7633 |                 delta = div64_ul(NICE_0_LOAD * vdelta, se->load.weight);
   kernel/sched/fair.c:7615:11: note: initialize the variable 'delta' to silence this warning
    7615 |         u64 delta;
         |                  ^
         |                   = 0
   1 warning generated.


vim +7632 kernel/sched/fair.c

  7603	
  7604	/**************************************************
  7605	 * CFS operations on tasks:
  7606	 */
  7607	
  7608	#ifdef CONFIG_SCHED_HRTICK
  7609	static void hrtick_start_fair(struct rq *rq, struct task_struct *p)
  7610	{
  7611		struct sched_entity *se = &p->se;
  7612		unsigned long scale = 1024;
  7613		unsigned long util = 0;
  7614		u64 vdelta;
  7615		u64 delta;
  7616	
  7617		WARN_ON_ONCE(task_rq(p) != rq);
  7618	
  7619		if (rq->cfs.h_nr_queued <= 1)
  7620			return;
  7621	
  7622		/*
  7623		 * Compute time until virtual deadline
  7624		 */
  7625		vdelta = se->deadline - se->vruntime;
  7626		if ((s64)vdelta < 0) {
  7627			if (task_current_donor(rq, p))
  7628				resched_curr(rq);
  7629			return;
  7630		}
  7631	
> 7632		if (unlikely(se->load.weight != NICE_0_LOAD))
  7633			delta = div64_ul(NICE_0_LOAD * vdelta, se->load.weight);
  7634	
  7635		/*
  7636		 * Correct for instantaneous load of other classes.
  7637		 */
  7638		util += cpu_util_irq(rq);
  7639		if (util && util < 1024) {
  7640			scale *= 1024;
  7641			scale /= (1024 - util);
  7642		}
  7643	
  7644		hrtick_start(rq, (scale * delta) / 1024);
  7645	}
  7646	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
