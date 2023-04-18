Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFE2AFED;
	Tue, 18 Apr 2023 19:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681845187; x=1713381187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pCIjkH5ojZL5lr0UZi0Zh9m5e6nLH2vEJTAReE0D9R8=;
  b=lcX6rhCSiAKtIRinpilzMaUsQRwkAAv06JCBFSiX7APuGcNzyAhmkjnr
   NlRGmvIGZN/2Fa9Vr/iyhKChVRRhQ6eu0Whw8cTszfwFdNlSCCUvIUOj8
   AKw0Fj1wIsWw0pBse0ImtK/9IzHrBFi4KRNlPybse7VV1MmCx6A4EVYkf
   Mqf/oKxM9nsTSdA+MNlGZ4EzlAb980FjsD36Ouynkonr8u7Vcxugmg3If
   OPKrxzpATaTSQAnoCrAvWUa7UwSzHPOAZNj3vXgTJs5uYgLOc9F1i/TX2
   RYz5NGxxtMcKYFwZbFdWGTOVh9iu8HA7y4LFGX5oiRBVy/xojpRpaDx/s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="325599438"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="325599438"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 12:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="641481109"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="641481109"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Apr 2023 12:13:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poqlD-000dwH-1i;
	Tue, 18 Apr 2023 19:13:03 +0000
Date: Wed, 19 Apr 2023 03:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Subject: [linux-stable-rc:linux-5.15.y 9993/9999]
 kernel/cgroup/cpuset.c:2979:2: error: member reference base type 'void
 (struct cgroup *)' is not a structure or union
Message-ID: <202304190332.bk6CiRw8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   0b6a5617247cb685e4efb226d56074068ad8d0ce
commit: aa3aacdd6c3597589da61279f6a2a1666f1a1690 [9993/9999] cgroup/cpuset: Add cpuset_can_fork() and cpuset_cancel_fork() methods
config: powerpc-randconfig-r032-20230418 (https://download.01.org/0day-ci/archive/20230419/202304190332.bk6CiRw8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=aa3aacdd6c3597589da61279f6a2a1666f1a1690
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout aa3aacdd6c3597589da61279f6a2a1666f1a1690
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190332.bk6CiRw8-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cpuset.c:2979:23: error: use of undeclared identifier 'cgroup_mutex'; did you mean 'cgroup_put'?
           lockdep_assert_held(&cgroup_mutex);
                                ^~~~~~~~~~~~
                                cgroup_put
   include/linux/lockdep.h:320:33: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
                                          ^
   include/linux/lockdep.h:290:47: note: expanded from macro 'lockdep_is_held'
   #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
                                                          ^
   include/linux/lockdep.h:314:32: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                         ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^
   include/linux/cgroup.h:431:20: note: 'cgroup_put' declared here
   static inline void cgroup_put(struct cgroup *cgrp)
                      ^
>> kernel/cgroup/cpuset.c:2979:2: error: member reference base type 'void (struct cgroup *)' is not a structure or union
           lockdep_assert_held(&cgroup_mutex);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:320:17: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:290:52: note: expanded from macro 'lockdep_is_held'
   #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
                                                               ^ ~~~~~~~
   include/linux/lockdep.h:314:32: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   2 errors generated.


vim +2979 kernel/cgroup/cpuset.c

  2961	
  2962	/*
  2963	 * In case the child is cloned into a cpuset different from its parent,
  2964	 * additional checks are done to see if the move is allowed.
  2965	 */
  2966	static int cpuset_can_fork(struct task_struct *task, struct css_set *cset)
  2967	{
  2968		struct cpuset *cs = css_cs(cset->subsys[cpuset_cgrp_id]);
  2969		bool same_cs;
  2970		int ret;
  2971	
  2972		rcu_read_lock();
  2973		same_cs = (cs == task_cs(current));
  2974		rcu_read_unlock();
  2975	
  2976		if (same_cs)
  2977			return 0;
  2978	
> 2979		lockdep_assert_held(&cgroup_mutex);
  2980		percpu_down_write(&cpuset_rwsem);
  2981	
  2982		/* Check to see if task is allowed in the cpuset */
  2983		ret = cpuset_can_attach_check(cs);
  2984		if (ret)
  2985			goto out_unlock;
  2986	
  2987		ret = task_can_attach(task, cs->effective_cpus);
  2988		if (ret)
  2989			goto out_unlock;
  2990	
  2991		ret = security_task_setscheduler(task);
  2992		if (ret)
  2993			goto out_unlock;
  2994	
  2995		/*
  2996		 * Mark attach is in progress.  This makes validate_change() fail
  2997		 * changes which zero cpus/mems_allowed.
  2998		 */
  2999		cs->attach_in_progress++;
  3000	out_unlock:
  3001		percpu_up_write(&cpuset_rwsem);
  3002		return ret;
  3003	}
  3004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
