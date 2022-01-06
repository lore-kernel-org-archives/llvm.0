Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB7E173
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641451690; x=1672987690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gZ+KzonPfA+AjRn0t63liO2/72tGush2C7Tjs/Z9Z6g=;
  b=WxUdxEhhyXEId0us8W+LtlsR+XCnZHPEW3YuBdsIG/4fBu01aNjevu3Q
   4PrNJWXFU6glehG9VjRMKZfEhkrNCT3fL26lynHTEZvItQ4TJU3toWCHH
   J5dmY+3Q2zCWw1rZxRSduemdLx6O2f7WnHVtTdnGSqGHmYPCq4ya2zvuL
   a45SxlvE3tta1w4+//wOMoypq5xCbT1rs+yA9SFSfA2yfO4RZzJaSy1rn
   itieYssPohSwS7KOpE3oW3TV0i0dzAghK5FpKTvL97fwDuvpMd5hpSVU0
   NGIXZmdC7iiypjvpsSFo38NKUXxXtyj7z8HNqJ1IT1fHUk9CUPL0OsKdP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242560392"
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; 
   d="scan'208";a="242560392"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 22:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; 
   d="scan'208";a="689297133"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2022 22:48:08 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5MZD-000HQN-U3; Thu, 06 Jan 2022 06:48:07 +0000
Date: Thu, 6 Jan 2022 14:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC 15/16] sched/fair: Account kthread runtime debt for CFS
 bandwidth
Message-ID: <202201061412.xko6OiVF-lkp@intel.com>
References: <20220106004656.126790-16-daniel.m.jordan@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106004656.126790-16-daniel.m.jordan@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 7d2a07b769330c34b4deabeed939325c77a7ec2f]

url:    https://github.com/0day-ci/linux/commits/Daniel-Jordan/padata-vfio-sched-Multithreaded-VFIO-page-pinning/20220106-084934
base:   7d2a07b769330c34b4deabeed939325c77a7ec2f
config: hexagon-buildonly-randconfig-r001-20220105 (https://download.01.org/0day-ci/archive/20220106/202201061412.xko6OiVF-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4c1eb3c284a7aac84110e319700d89e847dd0874
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Jordan/padata-vfio-sched-Multithreaded-VFIO-page-pinning/20220106-084934
        git checkout 4c1eb3c284a7aac84110e319700d89e847dd0874
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/sched/core.c:3282:13: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
           struct rq *rq;
                      ^
>> kernel/sched/core.c:10199:6: warning: no previous prototype for function 'cpu_cgroup_remote_begin' [-Wmissing-prototypes]
   void cpu_cgroup_remote_begin(struct task_struct *p,
        ^
   kernel/sched/core.c:10199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cpu_cgroup_remote_begin(struct task_struct *p,
   ^
   static 
>> kernel/sched/core.c:10216:6: warning: no previous prototype for function 'cpu_cgroup_remote_charge' [-Wmissing-prototypes]
   void cpu_cgroup_remote_charge(struct task_struct *p,
        ^
   kernel/sched/core.c:10216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cpu_cgroup_remote_charge(struct task_struct *p,
   ^
   static 
   kernel/sched/core.c:3272:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
   static inline bool rq_has_pinned_tasks(struct rq *rq)
                      ^
   kernel/sched/core.c:5123:20: warning: unused function 'sched_tick_start' [-Wunused-function]
   static inline void sched_tick_start(int cpu) { }
                      ^
   kernel/sched/core.c:5124:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
   static inline void sched_tick_stop(int cpu) { }
                      ^
   kernel/sched/core.c:5853:20: warning: unused function 'sched_core_cpu_starting' [-Wunused-function]
   static inline void sched_core_cpu_starting(unsigned int cpu) {}
                      ^
   kernel/sched/core.c:5854:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
   static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
                      ^
   kernel/sched/core.c:5855:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
   static inline void sched_core_cpu_dying(unsigned int cpu) {}
                      ^
   9 warnings generated.


vim +/cpu_cgroup_remote_begin +10199 kernel/sched/core.c

 10185	
 10186	/**
 10187	 * cpu_cgroup_remote_begin - begin charging p's CPU usage to a remote css
 10188	 * @p: the kernel thread whose CPU usage should be accounted
 10189	 * @css: the css to which the CPU usage should be accounted
 10190	 *
 10191	 * Begin charging a kernel thread's CPU usage to a remote (non-root) task group
 10192	 * to account CPU time that the kernel thread spends working on behalf of the
 10193	 * group.  Pair with at least one subsequent call to cpu_cgroup_remote_charge()
 10194	 * to complete the charge.
 10195	 *
 10196	 * Supports CFS bandwidth and cgroup2 CPU accounting stats but not weight-based
 10197	 * control for now.
 10198	 */
 10199	void cpu_cgroup_remote_begin(struct task_struct *p,
 10200				     struct cgroup_subsys_state *css)
 10201	{
 10202		if (p->sched_class == &fair_sched_class)
 10203			cpu_cgroup_remote_begin_fair(p, css_tg(css));
 10204	}
 10205	
 10206	/**
 10207	 * cpu_cgroup_remote_charge - account p's CPU usage to a remote css
 10208	 * @p: the kernel thread whose CPU usage should be accounted
 10209	 * @css: the css to which the CPU usage should be accounted
 10210	 *
 10211	 * Account a kernel thread's CPU usage to a remote (non-root) task group.  Pair
 10212	 * with a previous call to cpu_cgroup_remote_begin() with the same @p and @css.
 10213	 * This may be invoked multiple times after the initial
 10214	 * cpu_cgroup_remote_begin() to account additional CPU usage.
 10215	 */
 10216	void cpu_cgroup_remote_charge(struct task_struct *p,
 10217				      struct cgroup_subsys_state *css)
 10218	{
 10219		if (p->sched_class == &fair_sched_class)
 10220			cpu_cgroup_remote_charge_fair(p, css_tg(css));
 10221	}
 10222	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
