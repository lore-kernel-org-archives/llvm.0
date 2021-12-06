Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56868
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 10:00:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="234799558"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="234799558"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 02:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="461748619"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Dec 2021 02:00:03 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muAmw-000L9A-OO; Mon, 06 Dec 2021 10:00:02 +0000
Date: Mon, 6 Dec 2021 17:59:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:locking/core 1/11] kernel/sched/core.o: warning:
 objtool: migrate_enable()+0x1b2: unreachable instruction
Message-ID: <202112061752.t4VbQG3p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   4cf75fd4a2545ca4deea992f929602c9fdbe8058
commit: 9d0df37797453f168afdb2e6fd0353c73718ae9a [1/11] sched: Trigger warning if ->migration_disabled counter underflows.
config: x86_64-randconfig-a015-20211205 (https://download.01.org/0day-ci/archive/20211206/202112061752.t4VbQG3p-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=9d0df37797453f168afdb2e6fd0353c73718ae9a
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/core
        git checkout 9d0df37797453f168afdb2e6fd0353c73718ae9a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:3442:6: warning: no previous prototype for function 'sched_set_stop_task' [-Wmissing-prototypes]
   void sched_set_stop_task(int cpu, struct task_struct *stop)
        ^
   kernel/sched/core.c:3442:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sched_set_stop_task(int cpu, struct task_struct *stop)
   ^
   static 
   kernel/sched/core.c:1660:1: warning: unused function 'uclamp_update_active' [-Wunused-function]
   uclamp_update_active(struct task_struct *p)
   ^
   2 warnings generated.
>> kernel/sched/core.o: warning: objtool: migrate_enable()+0x1b2: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
