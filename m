Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC462CA0
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640167002; x=1671703002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QrewmhUpwejgoHh3cjb0uDzpLJjrv3+OswLbKAsIUsE=;
  b=jVz2T16CQciHOCDz9qK/ynF4CLN/uRkJ9C4AEa7MGbBnuKnMCfi1PdTV
   0Fsf4NKgKYNLOPzLSR7+iADTpepevyCb0lW4lu0NG9iyvn9Z1/AAZWhL9
   I56RgA3bxoBxAIWPhLdE7i6XToFWYwPQyEngSCauQeylzJDS0hPKtT78A
   p5Qb+eu6ZA81UwkbspirQyLlEBzdOuw4pOk92ATkO8l1L3qoD+Bs0EYK1
   9Bncj4iZtamy4onBQxYd1rg0dkZdqp5/6MfEIZbQgeks7U9a1f466rheo
   YbCOVkflo9ptiwVECMIQ7hbtIKTcCNEznol/TW3Ul0wMBV7/EM8Lcxqkl
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240812475"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="240812475"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 01:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="466616759"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Dec 2021 01:56:39 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzyMR-0000Kh-0V; Wed, 22 Dec 2021 09:56:39 +0000
Date: Wed, 22 Dec 2021 17:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:perf/wip.self 2/2] arch/x86/events/core.c:2735:13:
 error: use of undeclared identifier 'userpf'; did you mean 'userpg'?
Message-ID: <202112221712.uiBpvgmY-lkp@intel.com>
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
head:   1e109699c93d9b3d7bedec5f43d852888d035b9d
commit: 1e109699c93d9b3d7bedec5f43d852888d035b9d [2/2] perf: Better track self-monitoring events
config: i386-randconfig-r012-20211222 (https://download.01.org/0day-ci/archive/20211222/202112221712.uiBpvgmY-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=1e109699c93d9b3d7bedec5f43d852888d035b9d
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue perf/wip.self
        git checkout 1e109699c93d9b3d7bedec5f43d852888d035b9d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/events/core.c:2735:13: error: use of undeclared identifier 'userpf'; did you mean 'userpg'?
           if (likely(userpf->cap_user_time))
                      ^~~~~~
                      userpg
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   arch/x86/events/core.c:2720:40: note: 'userpg' declared here
                                  struct perf_event_mmap_page *userpg, u64 now)
                                                               ^
>> arch/x86/events/core.c:2735:13: error: use of undeclared identifier 'userpf'; did you mean 'userpg'?
           if (likely(userpf->cap_user_time))
                      ^~~~~~
                      userpg
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^
   arch/x86/events/core.c:2720:40: note: 'userpg' declared here
                                  struct perf_event_mmap_page *userpg, u64 now)
                                                               ^
   2 errors generated.


vim +2735 arch/x86/events/core.c

  2718	
  2719	void arch_perf_update_userpage(struct perf_event *event,
  2720				       struct perf_event_mmap_page *userpg, u64 now)
  2721	{
  2722		struct cyc2ns_data data;
  2723		u64 offset;
  2724	
  2725		userpg->cap_user_rdpmc = !!(event->hw.flags & PERF_X86_EVENT_RDPMC_ALLOWED);
  2726		userpg->pmc_width = x86_pmu.cntval_bits;
  2727	
  2728		if (unlikely(!using_native_sched_clock() || !sched_clock_stable())) {
  2729			userpg->cap_user_time = 0;
  2730			userpg->cap_user_time_zero = 0;
  2731			return;
  2732		}
  2733	
  2734		/* already set the time fields before */
> 2735		if (likely(userpf->cap_user_time))
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
