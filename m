Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1BF173
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 20:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642193909; x=1673729909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JmzRu99xoPHOIUL6oRvMiGQeumz3p9hDCpTCwXUwDDU=;
  b=f2cS8KruPpfIXJ0L29aQ/V3aua9lmRAI4izzkmz+MwpTMOldfRxBoWqC
   tAD+qoFaN0DNTfDjKSyqm71woWCqTxHg2Bk7GYr92s4vUwHSgpjrdj7DZ
   KVxT3R8qiPlxSvZOsEUmVOdqoCFlvNzwWvS1dO3v3nnihLoPtWT1LhDZD
   BlIjFK4io2ZhvB1Fhixntn0nCR5RIJeQJcSWcdxaJHkbn3hkifq8q+m9V
   L4u7jFWGVAjnA33WW6lRmOwxYpbigN7KK/3bvT3kkZdZDeKRsWlMIDLR2
   etBdXe9w3lJCTiwnHPdflcq2OcQ+6Op46vwlzMheSxHAxUALzHU8KDYL3
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="268696736"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="268696736"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 12:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="624475691"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Jan 2022 12:58:26 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8TeU-0008za-4n; Fri, 14 Jan 2022 20:58:26 +0000
Date: Sat, 15 Jan 2022 04:58:02 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:perf/wip.self 9/9] arch/x86/events/core.c:2725:48:
 error: use of undeclared identifier 'PERF_X86_EVENT_RDPMC_ALLOWED'
Message-ID: <202201150418.32fAKxxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/wip.self
head:   1b4635e33f629e20b5bbecd62d27c9191d5ec390
commit: 1b4635e33f629e20b5bbecd62d27c9191d5ec390 [9/9] perf: Better track self-monitoring events
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220115/202201150418.32fAKxxq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=1b4635e33f629e20b5bbecd62d27c9191d5ec390
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue perf/wip.self
        git checkout 1b4635e33f629e20b5bbecd62d27c9191d5ec390
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/events/core.c:2725:48: error: use of undeclared identifier 'PERF_X86_EVENT_RDPMC_ALLOWED'
           userpg->cap_user_rdpmc = !!(event->hw.flags & PERF_X86_EVENT_RDPMC_ALLOWED);
                                                         ^
   1 error generated.


vim +/PERF_X86_EVENT_RDPMC_ALLOWED +2725 arch/x86/events/core.c

  2718	
  2719	void arch_perf_update_userpage(struct perf_event *event,
  2720				       struct perf_event_mmap_page *userpg, u64 now)
  2721	{
  2722		struct cyc2ns_data data;
  2723		u64 offset;
  2724	
> 2725		userpg->cap_user_rdpmc = !!(event->hw.flags & PERF_X86_EVENT_RDPMC_ALLOWED);
  2726		userpg->pmc_width = x86_pmu.cntval_bits;
  2727	
  2728		if (unlikely(!using_native_sched_clock() || !sched_clock_stable())) {
  2729			userpg->cap_user_time = 0;
  2730			userpg->cap_user_time_zero = 0;
  2731			return;
  2732		}
  2733	
  2734		/* already set the time fields before */
  2735		if (likely(userpg->cap_user_time))
  2736			return;
  2737	
  2738		cyc2ns_read_begin(&data);
  2739	
  2740		offset = data.cyc2ns_offset + __sched_clock_offset;
  2741	
  2742		/*
  2743		 * Internal timekeeping for enabled/running/stopped times
  2744		 * is always in the local_clock domain.
  2745		 */
  2746		userpg->cap_user_time = 1;
  2747		userpg->time_mult = data.cyc2ns_mul;
  2748		userpg->time_shift = data.cyc2ns_shift;
  2749		userpg->time_offset = offset - now;
  2750	
  2751		/*
  2752		 * cap_user_time_zero doesn't make sense when we're using a different
  2753		 * time base for the records.
  2754		 */
  2755		if (!event->attr.use_clockid) {
  2756			userpg->cap_user_time_zero = 1;
  2757			userpg->time_zero = offset;
  2758		}
  2759	
  2760		cyc2ns_read_end();
  2761	}
  2762	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
