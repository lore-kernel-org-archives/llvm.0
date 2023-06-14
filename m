Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E3F747D;
	Wed, 14 Jun 2023 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686742792; x=1718278792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7saw5N683whe9FE6tJR9ykZLOEvMdGgMTKprfq9kE6o=;
  b=H4OAzSpfYDGzIK0snR7Bcg4OO6hkqJ/Bcy8wKs0P0010URD+VcO8O8S/
   T9Os//axC9E7PBJcGPiy/rCRnwMz5TAbRc2mgtJZn9662rLiefSIIu8Ra
   E+kJPzV7r/Q0XgEZkLHQwR0eXiy81GZqt26lW0Wi29VN3G6In9Yg8k1Lj
   osZQPPSDnUbPFzIp7W68GIPMm0Nz6gFwMcr/3aCvRX680V8SIjskfVOvo
   RMX7cE79udQ045EfVYkFB6FsYH5BcKTezRoNxVPKrjQgb4vu/TFOxUBAp
   aXbbON4Mp7L7uV+oolBduoRDgZU0jMtRmKESgG3e8G6VRnEv8BnFD5Nhg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="356080938"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="356080938"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 04:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="706189819"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="706189819"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Jun 2023 04:39:49 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9Oqm-0000ZZ-1E;
	Wed, 14 Jun 2023 11:39:45 +0000
Date: Wed, 14 Jun 2023 19:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7890/9793] kernel/rcu/rcuscale.c:301:20: error:
 use of undeclared identifier 'get_rcu_tasks_gp_kthread'; did you mean
 'get_rcu_tasks_trace_gp_kthread'?
Message-ID: <202306141920.TTvpsXwJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b16049b21162bb649cdd8519642a35972b7910fe
commit: df8fa2f1fc4c20cd300855a11b31ba5565f45ac6 [7890/9793] rcuscale: Measure RCU Tasks Trace grace-period kthread CPU time
config: arm-randconfig-r046-20230614 (https://download.01.org/0day-ci/archive/20230614/202306141920.TTvpsXwJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=df8fa2f1fc4c20cd300855a11b31ba5565f45ac6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout df8fa2f1fc4c20cd300855a11b31ba5565f45ac6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141920.TTvpsXwJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/rcu/rcuscale.c:301:20: error: use of undeclared identifier 'get_rcu_tasks_gp_kthread'; did you mean 'get_rcu_tasks_trace_gp_kthread'?
     301 |         .rso_gp_kthread = get_rcu_tasks_gp_kthread,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                           get_rcu_tasks_trace_gp_kthread
   include/linux/rcupdate_trace.h:90:21: note: 'get_rcu_tasks_trace_gp_kthread' declared here
      90 | struct task_struct *get_rcu_tasks_trace_gp_kthread(void);
         |                     ^
   1 error generated.
--
   In file included from kernel/rcu/update.c:649:
>> kernel/rcu/tasks.h:1113:21: warning: no previous prototype for function 'get_rcu_tasks_gp_kthread' [-Wmissing-prototypes]
    1113 | struct task_struct *get_rcu_tasks_gp_kthread(void)
         |                     ^
   kernel/rcu/tasks.h:1113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1113 | struct task_struct *get_rcu_tasks_gp_kthread(void)
         | ^
         | static 
   1 warning generated.


vim +301 kernel/rcu/rcuscale.c

   289	
   290	static struct rcu_scale_ops tasks_ops = {
   291		.ptype		= RCU_TASKS_FLAVOR,
   292		.init		= rcu_sync_scale_init,
   293		.readlock	= tasks_scale_read_lock,
   294		.readunlock	= tasks_scale_read_unlock,
   295		.get_gp_seq	= rcu_no_completed,
   296		.gp_diff	= rcu_seq_diff,
   297		.async		= call_rcu_tasks,
   298		.gp_barrier	= rcu_barrier_tasks,
   299		.sync		= synchronize_rcu_tasks,
   300		.exp_sync	= synchronize_rcu_tasks,
 > 301		.rso_gp_kthread	= get_rcu_tasks_gp_kthread,
   302		.name		= "tasks"
   303	};
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
