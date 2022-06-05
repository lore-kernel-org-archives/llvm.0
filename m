Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C323B3
	for <llvm@lists.linux.dev>; Sun,  5 Jun 2022 22:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654467316; x=1686003316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CctuFE2R2ZyK67GiYVfDjlk6qASqOTichirYJ8V+u6E=;
  b=k0J3DsMqMGElTcwf8tvG3UmEOnC4yu6Z/oHJ96+Sn8wmI4BftgAzUgmz
   T2Uuz0QAxJmL+K07VaCStoysiIIyHBaVxVQAydO3fCS8OVIg2svXzPxqt
   vx7hxguF+M0EcAElCCqe9+hZkaZuIWyJlN+uxRtzhJUD5AiBFYNst+mOc
   6lobH82jgc5KIc/WwuVhyD3PqDiDi32PCjUZOhl6LrxoqmHf0zETbuTI4
   jk9EjpD2Uk8mCNGgCDlRq/22TFLCNDJEIFc9RCrjOXipNOg8yhrp6GNnz
   2nCYADuHuX3AxMQ4KcDVZsH5ca6DtuHvl62udNNIr/O0aaqq9WoJI8vKg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="339709127"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="339709127"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2022 15:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="614070982"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Jun 2022 15:13:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxyVS-000CIC-Fi;
	Sun, 05 Jun 2022 22:13:58 +0000
Date: Mon, 6 Jun 2022 06:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:sched/idle 15/37] kernel/time/tick-broadcast.c:627:9:
 error: call to undeclared function 'arch_test_bit'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202206060612.7U4QNOzX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/idle
head:   e11e56428f57b36930eb0f8eed997a462010aa95
commit: b581e362d475d40edb2d1099d19a8e12721e7734 [15/37] cpuidle: Fix rcu_idle_*() usage
config: hexagon-randconfig-r024-20220605 (https://download.01.org/0day-ci/archive/20220606/202206060612.7U4QNOzX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 416a5080d89066029f9889dc23f94de47c2fa895)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=b581e362d475d40edb2d1099d19a8e12721e7734
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout b581e362d475d40edb2d1099d19a8e12721e7734
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/time/tick-broadcast.c:627:9: error: call to undeclared function 'arch_test_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return arch_test_bit(smp_processor_id(), cpumask_bits(tick_broadcast_force_mask));
                  ^
   kernel/time/tick-broadcast.c:627:9: note: did you mean '__test_bit'?
   arch/hexagon/include/asm/bitops.h:161:19: note: '__test_bit' declared here
   static inline int __test_bit(int nr, const volatile unsigned long *addr)
                     ^
   1 error generated.


vim +/arch_test_bit +627 kernel/time/tick-broadcast.c

   617	
   618	/*
   619	 * Called before going idle with interrupts disabled. Checks whether a
   620	 * broadcast event from the other core is about to happen. We detected
   621	 * that in tick_broadcast_oneshot_control(). The callsite can use this
   622	 * to avoid a deep idle transition as we are about to get the
   623	 * broadcast IPI right away.
   624	 */
   625	noinstr int tick_check_broadcast_expired(void)
   626	{
 > 627		return arch_test_bit(smp_processor_id(), cpumask_bits(tick_broadcast_force_mask));
   628	}
   629	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
