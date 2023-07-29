Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E638C;
	Sat, 29 Jul 2023 03:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690602294; x=1722138294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dmBgKM+Qa68YExJMGzjV+jVaYPaBUJUv8PIN/rRNWrE=;
  b=X7J5LbN+pW3Tq7//v24iPx5/c7+WpyPS6oJHcHznFJXhlRsTnP/NcRO+
   Il9wS1cyQXsr00ivYKk45bSmXRkl2nbCFMTSDHAoaRZ6Rf+FtV/UDet6v
   UQj/9I7pbH0cfYTr5RLwb/R7a7MtDJx5fkG/Rl8CZ9BcI0PEXUN6qNmoa
   KGGjHlf4q8lIuRtg1yaDp1qeiKmHMYvR5mGbBh584oDxXTsTR1/yJuXGr
   1+wvzXN23Yu2X0OfItFUS6+EoU9L6QvBaB3jAu/6FTF34Ux01qTb2ZpI7
   Y8Z5bqORQffjpn5VRAy2sT87km+wgqyHFIDQjXd9U4CfkqDfb7HPZlIBN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="353632106"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="353632106"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 20:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871041148"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2023 20:44:54 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPast-0003o1-3D;
	Sat, 29 Jul 2023 03:44:51 +0000
Date: Sat, 29 Jul 2023 11:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:tcx_warn_dbg 1/1]
 net/sched/sch_generic.c:1146:4: warning: format specifies type 'unsigned
 long' but the argument has type 'int'
Message-ID: <202307291120.NRPh3Ffw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git tcx_warn_dbg
head:   60e4b66be28ba06cc6c12d45f741e2ff760ed18f
commit: 60e4b66be28ba06cc6c12d45f741e2ff760ed18f [1/1] dbg print for tcx warn splat
config: i386-randconfig-i012-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291120.NRPh3Ffw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291120.NRPh3Ffw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291120.NRPh3Ffw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sched/sch_generic.c:1146:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
                           dev_ingress_queue(dev) == dev_queue ? 0xdead : dev_queue - &dev->_tx[0],
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1146 net/sched/sch_generic.c

  1131	
  1132	static void shutdown_scheduler_queue(struct net_device *dev,
  1133					     struct netdev_queue *dev_queue,
  1134					     void *_qdisc_default)
  1135	{
  1136		struct Qdisc *qdisc = rtnl_dereference(dev_queue->qdisc_sleeping);
  1137		struct Qdisc *qdisc_default = _qdisc_default;
  1138	
  1139		if (qdisc) {
  1140			rcu_assign_pointer(dev_queue->qdisc, qdisc_default);
  1141			rcu_assign_pointer(dev_queue->qdisc_sleeping, qdisc_default);
  1142	
  1143			qdisc_put(qdisc);
  1144			pr_info("%s dev %s %lx txq %lx qdisc %lx refcnt %d\n",
  1145				__func__, dev->name, (long)dev,
> 1146				dev_ingress_queue(dev) == dev_queue ? 0xdead : dev_queue - &dev->_tx[0],
  1147				(long)qdisc->dev_queue, refcount_read(&qdisc->refcnt));
  1148		}
  1149	}
  1150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
