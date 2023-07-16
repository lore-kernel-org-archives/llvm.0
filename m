Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77024187D;
	Sun, 16 Jul 2023 06:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689488540; x=1721024540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jtHMY3j5vyg7aYLkc+Tx4QbMdu8lnrI8tkPS5uSPSI8=;
  b=DoeppzyoMLh4qDs3eBF9nSTMypc5eHvezG4YY3qa+jHdKvsXA7vFDs8b
   yihSUDMYG5KvZ47u0GjMaapOU2oaTpJSb625/8IahTjVimC4bH7FAY79y
   vV59YwqO7HSEbjSm3qGb5QLrhv2c1GSLVZxzFS9qcZUQqa2eLiZ0whtf8
   XyxOowQpa/wJLfYL/PDmbBUvdS1BzWZhBWOPyy/VAtCJvADfH0XjkE04F
   MFKyaWT+K4uL9voVbHiBKIrKmL6dPI3zvqksyuuK4KIPtk4qrBRUYmz3y
   YETPuqntkyxq5Mjlyz01e1gyio5TgPg7EtLZ1S9LMV6IV085M1kFd80Q/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="429490795"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="429490795"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 23:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="836505062"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="836505062"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2023 23:22:17 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKv97-0008fD-0H;
	Sun, 16 Jul 2023 06:22:17 +0000
Date: Sun, 16 Jul 2023 14:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:sched-setscheduler-hide 2/6]
 kernel/rcu/rcutorture.c:3174:9: error: call to undeclared function
 'rcu_get_gp_kthreads_prio'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202307161419.xPpN86Fv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux sched-setscheduler-hide
head:   40f87f6acda90270ee3eb284cbd13a8751ac4e61
commit: d8106d64bbf0e8d98e636ddda1524fae375c8cf5 [2/6] rcu: Use a new sched_set_rcu_fifo() to set gp kthread prio
config: x86_64-randconfig-r024-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161419.xPpN86Fv-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161419.xPpN86Fv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161419.xPpN86Fv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture.c:3174:9: error: call to undeclared function 'rcu_get_gp_kthreads_prio'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           prio = rcu_get_gp_kthreads_prio();
                  ^
   1 error generated.


vim +/rcu_get_gp_kthreads_prio +3174 kernel/rcu/rcutorture.c

fae4b54f28f034 kernel/rcutorture.c     Paul E. McKenney        2012-02-20  3163  
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3164) static bool rcu_torture_can_boost(void)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3165) {
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3166) 	static int boost_warn_once;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3167) 	int prio;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3168) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3169) 	if (!(test_boost == 1 && cur_ops->can_boost) && test_boost != 2)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3170) 		return false;
ea6d962e80b619 kernel/rcu/rcutorture.c Paul E. McKenney        2021-03-30  3171  	if (!cur_ops->start_gp_poll || !cur_ops->poll_gp_state)
5e59fba573e64c kernel/rcu/rcutorture.c Paul E. McKenney        2021-01-15  3172  		return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3173) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19 @3174) 	prio = rcu_get_gp_kthreads_prio();
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3175) 	if (!prio)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3176) 		return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3177) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3178) 	if (prio < 2) {
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3179) 		if (boost_warn_once == 1)
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3180) 			return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3181) 
bf5b64355a3ce4 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3182) 		pr_alert("%s: WARN: RCU kthread priority too low to test boosting.  Skipping RCU boost test. Try passing rcutree.kthread_prio > 1 on the kernel command line.\n", KBUILD_MODNAME);
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3183) 		boost_warn_once = 1;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3184) 		return false;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3185) 	}
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3186) 
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3187) 	return true;
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3188) }
4babd855fd6137 kernel/rcu/rcutorture.c Joel Fernandes (Google  2018-06-19  3189) 

:::::: The code at line 3174 was first introduced by commit
:::::: 4babd855fd6137f9792117eb73b096c221a49d3c rcutorture: Add support to detect if boost kthread prio is too low

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
