Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DE2BA2F;
	Thu,  1 Jun 2023 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685635460; x=1717171460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ONiRBD+4hRflOQwlhSxxTdfvpTF2t0Qt/Up3daTp3OU=;
  b=ig6nqeCf3AF3oFQoyiM8R41fzgCYUDiTB9nNPkQgC0H7LvixlM2Gndzi
   OcROdmmjD8E4m4f2WoubH84MEHMHBILoqYfittc9VcmEGCTV+NuCmT+YK
   VasexPQ7ky+6vNIvpVtYwsNbzzzJZrIKnsnhTjDQOipLD/FDc/PaAaCq8
   LH0eoSu/ct1J2VO9vsFPw32wdVFGIK5rsO6fRnDxtAOrViZmhXR2nY/3s
   S/7RV5hz3aakLCM8rAX3TvZn/rSCtOTz+ZzllrAuiu+iBohvcf+svbPe6
   kLJ72eR9cINPafdh306EXo42laQyCzribd2B5FkklBs6ZjUwMyXD0widN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354456277"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="354456277"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 09:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="831629581"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="831629581"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Jun 2023 09:03:30 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4klt-0002SC-1h;
	Thu, 01 Jun 2023 16:03:29 +0000
Date: Fri, 2 Jun 2023 00:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 25/25] kernel/sched/core.c:4053:24: error:
 call to undeclared function '__task_state_match'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202306012322.qZLstogi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   1fd7ac28685ef6c242cc8689f97bc7014ae82ca5
commit: 1fd7ac28685ef6c242cc8689f97bc7014ae82ca5 [25/25] sched: Consider task_struct::saved_state in wait_task_inactive()
config: riscv-randconfig-r042-20230531 (https://download.01.org/0day-ci/archive/20230601/202306012322.qZLstogi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=1fd7ac28685ef6c242cc8689f97bc7014ae82ca5
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/core
        git checkout 1fd7ac28685ef6c242cc8689f97bc7014ae82ca5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306012322.qZLstogi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:4053:24: error: call to undeclared function '__task_state_match'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           *success = !!(match = __task_state_match(p, state));
                                 ^
   kernel/sched/core.c:6815:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
   asmlinkage __visible void __sched schedule_user(void)
                                     ^
   kernel/sched/core.c:6815:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage __visible void __sched schedule_user(void)
                        ^
                        static 
   1 warning and 1 error generated.


vim +/__task_state_match +4053 kernel/sched/core.c

  4028	
  4029	/*
  4030	 * Invoked from try_to_wake_up() to check whether the task can be woken up.
  4031	 *
  4032	 * The caller holds p::pi_lock if p != current or has preemption
  4033	 * disabled when p == current.
  4034	 *
  4035	 * The rules of PREEMPT_RT saved_state:
  4036	 *
  4037	 *   The related locking code always holds p::pi_lock when updating
  4038	 *   p::saved_state, which means the code is fully serialized in both cases.
  4039	 *
  4040	 *   The lock wait and lock wakeups happen via TASK_RTLOCK_WAIT. No other
  4041	 *   bits set. This allows to distinguish all wakeup scenarios.
  4042	 */
  4043	static __always_inline
  4044	bool ttwu_state_match(struct task_struct *p, unsigned int state, int *success)
  4045	{
  4046		int match;
  4047	
  4048		if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)) {
  4049			WARN_ON_ONCE((state & TASK_RTLOCK_WAIT) &&
  4050				     state != TASK_RTLOCK_WAIT);
  4051		}
  4052	
> 4053		*success = !!(match = __task_state_match(p, state));
  4054	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
