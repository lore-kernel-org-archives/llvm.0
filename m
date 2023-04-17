Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77357110B;
	Mon, 17 Apr 2023 01:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681695569; x=1713231569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X/GBb5HglFIjzboirRn9P8KM64/rpDYdlfzYELVLZQ0=;
  b=dygZdCiCSgZmli59xaTkvtEuLvuERHe8+6zhN7cxJF7+Yc7zF5vYO52I
   N1xif/fovfFJykvBC0XKSWcA8NhtpXoZuCvJc79bvy1iyYBPEhJlsI1+e
   12mgvojJpD8fUo89WG1KZ0uZuWtFsuUCEOTZ6OTO7MTlLAznZejpDz7wP
   hAH1xWB1V36XmyQsWW60PIZl1fJikPJoDAEGRovJeH9d11NCZI9aS78q+
   9RZ+tnEHMqFXHTGiF34ISyNwUeXLQBznpxrWXEQFWRRUWDDd9seDTMAW3
   WBPhDStmZCD3nJK0BxEZqjO3fqWNG63V5mI2+sYbUgLDk+6eCXA+C+lhi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="342272176"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="342272176"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 18:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="834221268"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="834221268"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2023 18:39:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poDq2-000c0p-0v;
	Mon, 17 Apr 2023 01:39:26 +0000
Date: Mon, 17 Apr 2023 09:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7] sched: Fix performance regression introduced by
 mm_cid
Message-ID: <202304170916.wfhHZcvE-lkp@intel.com>
References: <20230416223217.191261-1-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416223217.191261-1-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc7]
[cannot apply to tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/sched-Fix-performance-regression-introduced-by-mm_cid/20230417-063345
patch link:    https://lore.kernel.org/r/20230416223217.191261-1-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH v7] sched: Fix performance regression introduced by mm_cid
config: riscv-randconfig-r042-20230417 (https://download.01.org/0day-ci/archive/20230417/202304170916.wfhHZcvE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3ab4bef6c0bd5b33395bbd475c423ba95b9763d6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mathieu-Desnoyers/sched-Fix-performance-regression-introduced-by-mm_cid/20230417-063345
        git checkout 3ab4bef6c0bd5b33395bbd475c423ba95b9763d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304170916.wfhHZcvE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:6744:35: warning: no previous prototype for function 'schedule_user' [-Wmissing-prototypes]
   asmlinkage __visible void __sched schedule_user(void)
                                     ^
   kernel/sched/core.c:6744:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage __visible void __sched schedule_user(void)
                        ^
                        static 
>> kernel/sched/core.c:11770:15: warning: variable 'next_scan' is uninitialized when used here [-Wuninitialized]
                           old_scan = next_scan;
                                      ^~~~~~~~~
   kernel/sched/core.c:11764:31: note: initialize the variable 'next_scan' to silence this warning
                   unsigned long res, next_scan;
                                               ^
                                                = 0
   kernel/sched/core.c:1689:1: warning: unused function 'uclamp_update_active' [-Wunused-function]
   uclamp_update_active(struct task_struct *p)
   ^
   kernel/sched/core.c:6448:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
   static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
                      ^
   4 warnings generated.


vim +/next_scan +11770 kernel/sched/core.c

 11743	
 11744	static void task_mm_cid_work(struct callback_head *work)
 11745	{
 11746		struct task_struct *t = current;
 11747		struct mm_struct *mm;
 11748		int cpu;
 11749		unsigned long now = jiffies, old_scan, next_scan;
 11750		struct cpumask *cidmask;
 11751		int weight;
 11752	
 11753		SCHED_WARN_ON(t != container_of(work, struct task_struct, cid_work));
 11754	
 11755		work->next = work;	/* Prevent double-add */
 11756		if (t->flags & PF_EXITING)
 11757			return;
 11758		mm = t->mm;
 11759		if (!mm)
 11760			return;
 11761		old_scan = READ_ONCE(mm->mm_cid_next_scan);
 11762		next_scan = now + msecs_to_jiffies(MM_CID_SCAN_DELAY);
 11763		if (!old_scan) {
 11764			unsigned long res, next_scan;
 11765	
 11766			res = cmpxchg(&mm->mm_cid_next_scan, old_scan, next_scan);
 11767			if (res != old_scan)
 11768				old_scan = res;
 11769			else
 11770				old_scan = next_scan;
 11771		}
 11772		if (time_before(now, old_scan))
 11773			return;
 11774		if (!try_cmpxchg(&mm->mm_cid_next_scan, &old_scan, next_scan))
 11775			return;
 11776		cidmask = mm_cidmask(mm);
 11777		/* Clear cids that were not recently used. */
 11778		for_each_possible_cpu(cpu)
 11779			sched_mm_cid_remote_clear_old(mm, cpu);
 11780		weight = cpumask_weight(cidmask);
 11781		/*
 11782		 * Clear cids that are greater or equal to the cidmask weight to
 11783		 * recompact it.
 11784		 */
 11785		for_each_possible_cpu(cpu)
 11786			sched_mm_cid_remote_clear_weight(mm, cpu, weight);
 11787	}
 11788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
