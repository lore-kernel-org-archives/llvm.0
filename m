Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EF91FA1
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523433; x=1682059433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iz05hkzh046AFXyvV17QUF1THEeOgPBiNmH1Mg45MDM=;
  b=e4ExhK6Du7BjQFAscTTMCj8Yf/ltKSTGdLZ5z9DDD7VrCouwxfoDDFoH
   AcFjJ598fyeHWAFhJgvfZjpHLIAD8+LKWfb5lnkLaAjTlj38nK/DF3SQJ
   D5BzvDI8LDI4O5PbKDqz+5Cng8fD/WLJ6oFSuPeG0rmWSluUy71hxCP8n
   YWLxC4DbP8/7VHHwZc/XmiNY5NianuqUWQrmc1kKp2/307VuJGi64wDJc
   eQC4o1MiIXMICC7bbmsFnbkTpKuSCSCZshIfQ7cOhve3V1SwiZdbuMAQJ
   SEmIF/bhqzG3XPJe/qn/xUkdJ9tzlczO9iHws4R7GtDIAwEtG11p0bRU7
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="246151680"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="246151680"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="805384268"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Apr 2022 23:43:51 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQXe-00080d-Ue;
	Thu, 21 Apr 2022 06:43:50 +0000
Date: Thu, 21 Apr 2022 14:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1820/2579] kernel/signal.c:190:6: error:
 implicit declaration of function 'cgroup_task_frozen' is invalid in C99
Message-ID: <202204210613.DeyJT7kn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: ec8ca2d8ef76b4edd4dc7e12899b5ff5e64657a5 [1820/2579] headers/deps: cgroups: Remove the <linux/cgroup_api.h> header from the default <linux/cgroup.h> header
config: mips-randconfig-r026-20220419 (https://download.01.org/0day-ci/archive/20220421/202204210613.DeyJT7kn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c1c49a356162b22554088d269f7689bdb044a9f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=ec8ca2d8ef76b4edd4dc7e12899b5ff5e64657a5
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout ec8ca2d8ef76b4edd4dc7e12899b5ff5e64657a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/signal.c:190:6: error: implicit declaration of function 'cgroup_task_frozen' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
               cgroup_task_frozen(t)) {
               ^
>> kernel/signal.c:2325:3: error: implicit declaration of function 'cgroup_enter_frozen' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   cgroup_enter_frozen();
                   ^
>> kernel/signal.c:2328:3: error: implicit declaration of function 'cgroup_leave_frozen' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   cgroup_leave_frozen(true);
                   ^
   kernel/signal.c:2328:3: note: did you mean 'cgroup_enter_frozen'?
   kernel/signal.c:2325:3: note: 'cgroup_enter_frozen' declared here
                   cgroup_enter_frozen();
                   ^
   kernel/signal.c:2516:3: error: implicit declaration of function 'cgroup_enter_frozen' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   cgroup_enter_frozen();
                   ^
   kernel/signal.c:2595:2: error: implicit declaration of function 'cgroup_enter_frozen' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           cgroup_enter_frozen();
           ^
   kernel/signal.c:2763:16: error: implicit declaration of function 'cgroup_task_frozen' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (unlikely(cgroup_task_frozen(current))) {
                                ^
   kernel/signal.c:2765:4: error: implicit declaration of function 'cgroup_leave_frozen' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           cgroup_leave_frozen(false);
                           ^
   kernel/signal.c:2865:4: error: implicit declaration of function 'cgroup_leave_frozen' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           cgroup_leave_frozen(true);
                           ^
   8 errors generated.


vim +/cgroup_task_frozen +190 kernel/signal.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  184  
09ae854edb2d27 Christian Brauner 2018-08-21  185  static bool recalc_sigpending_tsk(struct task_struct *t)
^1da177e4c3f41 Linus Torvalds    2005-04-16  186  {
76f969e8948d82 Roman Gushchin    2019-04-19  187  	if ((t->jobctl & (JOBCTL_PENDING_MASK | JOBCTL_TRAP_FREEZE)) ||
6616e4593f1b57 Ingo Molnar       2022-01-28  188  	    PENDING(&per_task(t, pending), &per_task(t, blocked)) ||
ec2f4babb822f7 Ingo Molnar       2022-01-28  189  	    PENDING(&t->signal->shared_pending, &per_task(t, blocked)) ||
76f969e8948d82 Roman Gushchin    2019-04-19 @190  	    cgroup_task_frozen(t)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  191  		set_tsk_thread_flag(t, TIF_SIGPENDING);
09ae854edb2d27 Christian Brauner 2018-08-21  192  		return true;
7bb44adef39ad3 Roland McGrath    2007-05-23  193  	}
09ae854edb2d27 Christian Brauner 2018-08-21  194  
b74d0deb968e1f Roland McGrath    2007-06-06  195  	/*
b74d0deb968e1f Roland McGrath    2007-06-06  196  	 * We must never clear the flag in another thread, or in current
b74d0deb968e1f Roland McGrath    2007-06-06  197  	 * when it's possible the current syscall is returning -ERESTART*.
b74d0deb968e1f Roland McGrath    2007-06-06  198  	 * So we don't clear it here, and only callers who know they should do.
b74d0deb968e1f Roland McGrath    2007-06-06  199  	 */
09ae854edb2d27 Christian Brauner 2018-08-21  200  	return false;
7bb44adef39ad3 Roland McGrath    2007-05-23  201  }
7bb44adef39ad3 Roland McGrath    2007-05-23  202  

:::::: The code at line 190 was first introduced by commit
:::::: 76f969e8948d82e78e1bc4beb6b9465908e74873 cgroup: cgroup v2 freezer

:::::: TO: Roman Gushchin <guro@fb.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
