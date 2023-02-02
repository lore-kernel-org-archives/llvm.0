Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822317E5;
	Thu,  2 Feb 2023 01:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675299842; x=1706835842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TsaSl1KyqS68LJB6+EAC448CfcCoDZC7V5cWVfqIZZM=;
  b=R64zXC6rtvoZUFjACpWKgTmzAJhDCQbEUKvbfj13bHW0e+2RPCCAGRDu
   36vb1KACqXXHSfztigr49LFO3izP366RUU29mD1kF4/HkbTxBfDgPUn0+
   EdNW2TXZJhiSsOb+JR/ClZAZEQ1+hL4a1bmol1SrwSm8rTE3MsYRlSypp
   hsWsRzp43LzIwcimNEL/Zoc7Yib85YXQ+45/yV6cYL6g62v9bCTBPMT4q
   zcvKTc6f0vZSG7QrKnCUQBBAYCOK95fVC/c2k3KdheGiAtFG1yxMw1a55
   5m1dg4O/nJBftSh99jvvZC2zofWM/vcfy6WLpq1dpPSQKe2yDLgH7JDPT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326017440"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="326017440"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 17:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="789085203"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="789085203"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2023 17:04:00 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNO19-0005y0-1f;
	Thu, 02 Feb 2023 01:03:59 +0000
Date: Thu, 2 Feb 2023 09:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle.jan31 3/3] kernel/sched/rt.c:1093:6: error:
 call to undeclared function 'adjust_cg_throt_update'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202302020834.Vv6AUl8W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle.jan31
head:   963d18b2596e81d74b3abe1730572d6d2ae6a595
commit: 963d18b2596e81d74b3abe1730572d6d2ae6a595 [3/3] sched/rt: Keep throttled rt_rqs on the runqueue
config: mips-randconfig-r034-20230201 (https://download.01.org/0day-ci/archive/20230202/202302020834.Vv6AUl8W-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=963d18b2596e81d74b3abe1730572d6d2ae6a595
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle.jan31
        git checkout 963d18b2596e81d74b3abe1730572d6d2ae6a595
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:1092:28: error: no member named 'parent' in 'struct sched_rt_entity'
                                   if (!tbefore && rt_se->parent)
                                                   ~~~~~  ^
>> kernel/sched/rt.c:1093:6: error: call to undeclared function 'adjust_cg_throt_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                           adjust_cg_throt_update(rt_se->parent, true);
                                           ^
   kernel/sched/rt.c:1093:36: error: no member named 'parent' in 'struct sched_rt_entity'
                                           adjust_cg_throt_update(rt_se->parent, true);
                                                                  ~~~~~  ^
   kernel/sched/rt.c:1380:13: error: static declaration of 'adjust_cg_throt_update' follows non-static declaration
   static void adjust_cg_throt_update(struct sched_rt_entity *rt_se, bool throt) { }
               ^
   kernel/sched/rt.c:1093:6: note: previous implicit declaration is here
                                           adjust_cg_throt_update(rt_se->parent, true);
                                           ^
   kernel/sched/rt.c:1390:2: error: must use 'struct' tag to refer to type 'rt_rq'
           rt_rq->rt_se_running--;
           ^
           struct 
   kernel/sched/rt.c:1390:7: error: expected identifier or '('
           rt_rq->rt_se_running--;
                ^
   6 errors generated.


vim +/adjust_cg_throt_update +1093 kernel/sched/rt.c

  1042	
  1043	/*
  1044	 * Update the current task's runtime statistics. Skip current tasks that
  1045	 * are not in our scheduling class.
  1046	 */
  1047	static void update_curr_rt(struct rq *rq)
  1048	{
  1049		struct task_struct *curr = rq->curr;
  1050		struct sched_rt_entity *rt_se = &curr->rt;
  1051		u64 delta_exec;
  1052		u64 now;
  1053	
  1054		if (curr->sched_class != &rt_sched_class)
  1055			return;
  1056	
  1057		now = rq_clock_task(rq);
  1058		delta_exec = now - curr->se.exec_start;
  1059		if (unlikely((s64)delta_exec <= 0))
  1060			return;
  1061	
  1062		schedstat_set(curr->stats.exec_max,
  1063			      max(curr->stats.exec_max, delta_exec));
  1064	
  1065		trace_sched_stat_runtime(curr, delta_exec, 0);
  1066	
  1067		update_current_exec_runtime(curr, now, delta_exec);
  1068	
  1069		if (!rt_bandwidth_enabled())
  1070			return;
  1071	
  1072		for_each_sched_rt_entity(rt_se) {
  1073			struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
  1074			int exceeded;
  1075	
  1076			if (sched_rt_runtime(rt_rq) != RUNTIME_INF) {
  1077				bool tbefore;
  1078				raw_spin_lock(&rt_rq->rt_runtime_lock);
  1079				tbefore = rt_rq_throttled(rt_rq);
  1080	
  1081				rt_rq->rt_time += delta_exec;
  1082				exceeded = sched_rt_runtime_exceeded(rt_rq);
  1083				if (exceeded) {
  1084					resched_curr(rq);
  1085	
  1086					/*
  1087					 * Whenever reasons of our parent group's
  1088					 * throttling change (bw ran out here), we have
  1089					 * to adjust grandparent's cg throttling state
  1090					 * and so forth. @rt_se can be a task or group.
  1091					 */
  1092					if (!tbefore && rt_se->parent)
> 1093						adjust_cg_throt_update(rt_se->parent, true);
  1094				}
  1095	
  1096				raw_spin_unlock(&rt_rq->rt_runtime_lock);
  1097				if (exceeded)
  1098					do_start_rt_bandwidth(sched_rt_bandwidth(rt_rq));
  1099			}
  1100		}
  1101	}
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
