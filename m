Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB117EF;
	Sat,  2 Sep 2023 03:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693625530; x=1725161530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fv8QdqYHEf5YPepUzDUyaowSY9DHICKOcyXhDDjGWL8=;
  b=laMlEFjIIb3O41HRioehM5x5B/PAZnoW2y5oUr6cjhZ1OwzjwihOIL5o
   dCS/y6levZJTOzg0w67RYSwJM92CWK4HZeh9sKxy//Oo1EBi/HX3Q1bYf
   /ZLdSfjBoFcZU2gMyaWyRxi4rLM3hIDVXX0HdSEePvb4o/Eax9sm1ouEP
   TfTk+6xoiTyorffUqvgsE7FnlNq4FMte0K1KrCqxfgQ4REcqf1g4Whuhf
   3SqvBtGKBQfEz7XbC9gSXebzUmSP0PZlRqYZh6gTEZJJhW2Dotw48Gi2Q
   fjiF6rfPpXB7jz42yFvG6DlGNMIAp7iABcXBUIVenceC94wH5GJnXqCl6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442745924"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="442745924"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 20:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="769393434"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="769393434"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Sep 2023 20:32:06 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcHMh-0001vV-2g;
	Sat, 02 Sep 2023 03:32:03 +0000
Date: Sat, 2 Sep 2023 11:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-20230901 46/46]
 include/linux/blkdev.h:1538:6: warning: no previous prototype for function
 'bdev_aops_reset'
Message-ID: <202309021135.y6AhlrAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230901
head:   8e33509f10cabce9067f10fcabb3f4350048056d
commit: 8e33509f10cabce9067f10fcabb3f4350048056d [46/46] bdev: allow to switch between bdev aops
config: x86_64-randconfig-004-20230902 (https://download.01.org/0day-ci/archive/20230902/202309021135.y6AhlrAq-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309021135.y6AhlrAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309021135.y6AhlrAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:40:
>> include/linux/blkdev.h:1538:6: warning: no previous prototype for function 'bdev_aops_reset' [-Wmissing-prototypes]
   void bdev_aops_reset(struct block_device *bdev)
        ^
   include/linux/blkdev.h:1538:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void bdev_aops_reset(struct block_device *bdev)
   ^
   static 
   kernel/sched/core.c:3706:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
   static inline bool rq_has_pinned_tasks(struct rq *rq)
                      ^
   kernel/sched/core.c:5812:20: warning: unused function 'sched_tick_start' [-Wunused-function]
   static inline void sched_tick_start(int cpu) { }
                      ^
   kernel/sched/core.c:5813:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
   static inline void sched_tick_stop(int cpu) { }
                      ^
   kernel/sched/core.c:6507:20: warning: unused function 'sched_core_cpu_starting' [-Wunused-function]
   static inline void sched_core_cpu_starting(unsigned int cpu) {}
                      ^
   kernel/sched/core.c:6508:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
   static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
                      ^
   kernel/sched/core.c:6509:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
   static inline void sched_core_cpu_dying(unsigned int cpu) {}
                      ^
   7 warnings generated.


vim +/bdev_aops_reset +1538 include/linux/blkdev.h

  1496	
  1497	#ifdef CONFIG_BLOCK
  1498	void invalidate_bdev(struct block_device *bdev);
  1499	int sync_blockdev(struct block_device *bdev);
  1500	int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend);
  1501	int sync_blockdev_nowait(struct block_device *bdev);
  1502	void sync_bdevs(bool wait);
  1503	void bdev_statx_dioalign(struct inode *inode, struct kstat *stat);
  1504	void printk_all_partitions(void);
  1505	int __init early_lookup_bdev(const char *pathname, dev_t *dev);
  1506	#ifdef CONFIG_BUFFER_HEAD
  1507	void bdev_aops_reset(struct block_device *bdev);
  1508	#else
  1509	void bdev_aops_reset(struct block_device *bdev)
  1510	{
  1511	}
  1512	#endif
  1513	#else
  1514	static inline void invalidate_bdev(struct block_device *bdev)
  1515	{
  1516	}
  1517	static inline int sync_blockdev(struct block_device *bdev)
  1518	{
  1519		return 0;
  1520	}
  1521	static inline int sync_blockdev_nowait(struct block_device *bdev)
  1522	{
  1523		return 0;
  1524	}
  1525	static inline void sync_bdevs(bool wait)
  1526	{
  1527	}
  1528	static inline void bdev_statx_dioalign(struct inode *inode, struct kstat *stat)
  1529	{
  1530	}
  1531	static inline void printk_all_partitions(void)
  1532	{
  1533	}
  1534	static inline int early_lookup_bdev(const char *pathname, dev_t *dev)
  1535	{
  1536		return -EINVAL;
  1537	}
> 1538	void bdev_aops_reset(struct block_device *bdev)
  1539	{
  1540	}
  1541	#endif /* CONFIG_BLOCK */
  1542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
