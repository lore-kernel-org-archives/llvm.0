Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73ED17C9
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 02:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653963893; x=1685499893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aR0PHKL++ulIC/jYDhmlRB/ENp4XVEkPyXmnkAx4ymI=;
  b=QynWwu7txmHLPBycyQ8Qxvq0ak3gAtC59F/0aztL1hpIzzQb4ZjHZfOG
   o8WOW0lxG493rYfo1WwzeTm4zvN5t9rTr7pe6dDw/NhIYYcDPw6JRPGz3
   ualm19qo1J8cgg7iWYZk07MGG1kBSFcEXfpW4XaNBBzp2t5AQnU/HA5Um
   pWvk9aoW29680E8xUxFwA7e4+PXzlMv3jVrFQ43D0SRjA8DypKmzrc/W2
   eYLNyc9DDI4Oj6thQCIhWcVv7HMF68vVeQ8HWbpCCBvx8DUascL12KxdN
   yHMAuc4q9sPemWlDNBmz8HwKuZSxNVrGlw0dEMCSw++eClT4uABt8HF8N
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="254990297"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="254990297"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 19:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; 
   d="scan'208";a="753612812"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 May 2022 19:24:51 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvrYw-0002Dy-PS;
	Tue, 31 May 2022 02:24:50 +0000
Date: Tue, 31 May 2022 10:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:perf/wip.cleanup 9/10]
 arch/x86/events/intel/core.c:2841:26: error: invalid operands to binary
 expression ('unsigned long[1]' and 'unsigned long long')
Message-ID: <202205311016.hS64MKjw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/wip.cleanup
head:   d096f17be1e500e9b733118925230e46b4c3a14c
commit: be787b9861afcf5c89dd697a71367a3b6aae6dca [9/10] perf/x86/intel: Optimize short PEBS counters
config: x86_64-randconfig-a011-20220530 (https://download.01.org/0day-ci/archive/20220531/202205311016.hS64MKjw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c48f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=be787b9861afcf5c89dd697a71367a3b6aae6dca
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue perf/wip.cleanup
        git checkout be787b9861afcf5c89dd697a71367a3b6aae6dca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/events/intel/core.c:2841:26: error: invalid operands to binary expression ('unsigned long[1]' and 'unsigned long long')
           if (!(cpuc->active_mask & (1ULL << hwc->idx)))
                 ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2841 arch/x86/events/intel/core.c

  2834	
  2835	static void intel_pmu_handle_short_pebs(struct perf_event *event)
  2836	{
  2837		struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
  2838		struct hw_perf_event *hwc = &event->hw;
  2839	
  2840		/* if the event is not enabled; intel_pmu_pebs_enable() DTRT */
> 2841		if (!(cpuc->active_mask & (1ULL << hwc->idx)))
  2842			return;
  2843	
  2844		WARN_ON_ONCE(cpuc->enabled);
  2845	
  2846		if (intel_pmu_is_short_pebs(event)) {
  2847	
  2848			/* stripped down intel_pmu_pebs_disable() */
  2849			cpuc->pebs_enabled &= ~(1ULL << hwc->idx);
  2850			hwc->config |= ARCH_PERFMON_EVENTSEL_INT;
  2851	
  2852			intel_pmu_update_config(event);
  2853	
  2854		} else if (!(cpuc->pebs_enabled & (1ULL << hwc->idx))) {
  2855	
  2856			/* stripped down intel_pmu_pebs_enable() */
  2857			hwc->config &= ~ARCH_PERFMON_EVENTSEL_INT;
  2858			cpuc->pebs_enabled |= (1ULL << hwc->idx);
  2859	
  2860			intel_pmu_update_config(event);
  2861		}
  2862	}
  2863	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
