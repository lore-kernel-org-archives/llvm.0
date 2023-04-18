Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A78AFC3;
	Tue, 18 Apr 2023 17:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681838941; x=1713374941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8sTyy/MBLR7M7+ZMaGdrA3Vqd4cpkWN0mXm9dxewjUs=;
  b=eC5Id2t2B/kEgdKcCP7kLpbGTETs0E6TFPbG35DzmOJhEew8gW/MhJIF
   7XpoY637Wwrz1ICUPjDWX03vc8ZOe1SJeFH6QgEzAMI+b3bbL0l/BTb2j
   inYtnEheHZmEkedTgBNqOuYd8neyeOBkzjS4Dpox+mnC39+8ZhMN/AgMt
   ER2xAkjzuWUiKoelTJ9Jf2ZxGV7X//MvuFt7dF9hDxwEoUSbJrVmo2ScE
   eR2YFG5wSkWfooUrnQxVJwV2oH9GzH0tytZsAmMh6hsz6Y3Zi/YcHL7zf
   vAS9SQn/puRYaFi8MbhjU4eRI3c1qLGb2a6mKNh5JKQtyjCwdYPOOikzH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="347088896"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="347088896"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 10:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="755767769"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="755767769"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Apr 2023 10:28:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pop8T-000doH-3D;
	Tue, 18 Apr 2023 17:28:57 +0000
Date: Wed, 19 Apr 2023 01:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>, Tejun Heo <tj@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.15 86/88] kernel/cgroup/cpuset.c:2979:23:
 error: use of undeclared identifier 'cgroup_mutex'; did you mean
 'cgroup_put'?
Message-ID: <202304190126.6FziYqlt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   ec40996c2eeacb96d6a8f06f270cc0d5aa89d2a5
commit: d7b4889d3500cbc6111502bd24c9292c3942bdad [86/88] cgroup/cpuset: Add cpuset_can_fork() and cpuset_cancel_fork() methods
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20230419/202304190126.6FziYqlt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=d7b4889d3500cbc6111502bd24c9292c3942bdad
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout d7b4889d3500cbc6111502bd24c9292c3942bdad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190126.6FziYqlt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:2979:23: error: use of undeclared identifier 'cgroup_mutex'; did you mean 'cgroup_put'?
           lockdep_assert_held(&cgroup_mutex);
                                ^~~~~~~~~~~~
                                cgroup_put
   include/linux/lockdep.h:415:46: note: expanded from macro 'lockdep_assert_held'
   #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
                                                               ^
   include/linux/cgroup.h:431:20: note: 'cgroup_put' declared here
   static inline void cgroup_put(struct cgroup *cgrp)
                      ^
   1 error generated.


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
