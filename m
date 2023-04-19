Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FEF179;
	Wed, 19 Apr 2023 00:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681863599; x=1713399599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVlUKJAhAzFmBsriH2rfMnbr7Dx4Kz8bc5EMVu7lhdU=;
  b=Z1UtIo0LGA3+NG2U/Ixi0m0Hgqnb89neTfb8gKx5XKkpyEM3HJeG4u8e
   4cGU7wt6WuJiOR0R4T/0XYqfv8J6zmPNLNXA1cK8+Ttv6G1bLQk/bGHzo
   jeDIeujXv4aaFuAfMpeVSyTueLaxlDPlJFwGdCYVmneqo1vb6qQkLTOe4
   tzdgyqJnafuxOsAUeaVlbJF+De/NcRu0dBzx6YDvOXYTk/dc0jK5wHCg9
   wIeKTyXOZiNB2qoCoqk7Xpldx15Bl86JRu/eMYH7MQWKyMwOwneVXBFLm
   sO/s0lAeoW82zctpu6H4T4bLztdqmS/0p/xTAAYxCpsH1g3do7eWGRqOV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="373193461"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="373193461"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 17:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="780667641"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="780667641"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Apr 2023 17:19:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1povXa-000eGT-1X;
	Wed, 19 Apr 2023 00:19:18 +0000
Date: Wed, 19 Apr 2023 08:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Subject: [linux-stable-rc:linux-5.15.y 9993/9999]
 kernel/cgroup/cpuset.c:2979:23: error: use of undeclared identifier
 'cgroup_mutex'; did you mean 'cgroup_put'?
Message-ID: <202304190816.wyhGAfIY-lkp@intel.com>
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
commit: 91ee1d88edbef3f1620d5fbaa1649680e586a5a8 [9993/9999] cgroup/cpuset: Add cpuset_can_fork() and cpuset_cancel_fork() methods
config: s390-buildonly-randconfig-r001-20230417 (https://download.01.org/0day-ci/archive/20230419/202304190816.wyhGAfIY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=91ee1d88edbef3f1620d5fbaa1649680e586a5a8
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout 91ee1d88edbef3f1620d5fbaa1649680e586a5a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/cgroup/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190816.wyhGAfIY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/cgroup/cpuset.c:60:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:23:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/cgroup/cpuset.c:60:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:23:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/cgroup/cpuset.c:60:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:23:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/cgroup/cpuset.c:2979:23: error: use of undeclared identifier 'cgroup_mutex'; did you mean 'cgroup_put'?
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
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
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
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   12 warnings and 2 errors generated.


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
