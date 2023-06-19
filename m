Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19A215A0;
	Mon, 19 Jun 2023 04:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687149846; x=1718685846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bUCFA7qHgbmkXh7nKLQJWhe3mIqCB8quJxSpRgkECHk=;
  b=JrvcxY3tGre+tJ8jQghtCbBI/zYW7qOqan/aR2DLForYtEUS+gnjdRWZ
   whQ6RVTgGgB6TjWiS2uadlVUrW0GWQEk/T++jOk9tPr9tR3BukD6OFLhb
   r2xxBcAmLHCsvIaGTJwi7cybb1INs6dFksVssYb4l9fjzW7MNoUwYxNoL
   vUFknlKnGkqCGzlA8MRThoqkS68Xl4U9NtvsE8uWQFSXCNB3jFc8ONwMo
   Np1kQPI95Jw8pXLtmHX49n5QKIOzbDU8ImSK+uEr53CX7zBnpZb1Nj1Nd
   YCEEx/Bo2EFX7+7im3EwclwUDKnRQFcUKqXzdSQYO6CfmQRvkQwwER7Nd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="423203645"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="423203645"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 21:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="690955363"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="690955363"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Jun 2023 21:44:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB6kF-0004LA-1q;
	Mon, 19 Jun 2023 04:44:03 +0000
Date: Mon, 19 Jun 2023 12:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-20230618-hacks-v2 44/45]
 include/linux/blkdev.h:1530:6: warning: no previous prototype for function
 'bdev_aops_reset'
Message-ID: <202306191243.g0jcBcnz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230618-hacks-v2
head:   45755261f269a9ff35d37c5aa481e86424e78716
commit: f698784915e1c993a52b563936ef824727a98e77 [44/45] bdev: allow to switch between bdev aops
config: riscv-randconfig-r042-20230619 (https://download.01.org/0day-ci/archive/20230619/202306191243.g0jcBcnz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191243.g0jcBcnz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191243.g0jcBcnz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:40:
>> include/linux/blkdev.h:1530:6: warning: no previous prototype for function 'bdev_aops_reset' [-Wmissing-prototypes]
    1530 | void bdev_aops_reset(struct block_device *bdev)
         |      ^
   include/linux/blkdev.h:1530:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1530 | void bdev_aops_reset(struct block_device *bdev)
         | ^
         | static 
   kernel/sched/core.c:2442:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
    2442 | static inline bool rq_has_pinned_tasks(struct rq *rq)
         |                    ^
   kernel/sched/core.c:5821:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
    5821 | static inline void sched_tick_stop(int cpu) { }
         |                    ^
   kernel/sched/core.c:6522:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
    6522 | static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
         |                    ^
   kernel/sched/core.c:6523:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
    6523 | static inline void sched_core_cpu_dying(unsigned int cpu) {}
         |                    ^
   kernel/sched/core.c:9560:20: warning: unused function 'balance_hotplug_wait' [-Wunused-function]
    9560 | static inline void balance_hotplug_wait(void)
         |                    ^
   6 warnings generated.


vim +/bdev_aops_reset +1530 include/linux/blkdev.h

  1488	
  1489	#ifdef CONFIG_BLOCK
  1490	void invalidate_bdev(struct block_device *bdev);
  1491	int sync_blockdev(struct block_device *bdev);
  1492	int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend);
  1493	int sync_blockdev_nowait(struct block_device *bdev);
  1494	void sync_bdevs(bool wait);
  1495	void bdev_statx_dioalign(struct inode *inode, struct kstat *stat);
  1496	void printk_all_partitions(void);
  1497	int __init early_lookup_bdev(const char *pathname, dev_t *dev);
  1498	#ifdef CONFIG_BUFFER_HEAD
  1499	void bdev_aops_reset(struct block_device *bdev);
  1500	#else
  1501	void bdev_aops_reset(struct block_device *bdev)
  1502	{
  1503	}
  1504	#endif
  1505	#else
  1506	static inline void invalidate_bdev(struct block_device *bdev)
  1507	{
  1508	}
  1509	static inline int sync_blockdev(struct block_device *bdev)
  1510	{
  1511		return 0;
  1512	}
  1513	static inline int sync_blockdev_nowait(struct block_device *bdev)
  1514	{
  1515		return 0;
  1516	}
  1517	static inline void sync_bdevs(bool wait)
  1518	{
  1519	}
  1520	static inline void bdev_statx_dioalign(struct inode *inode, struct kstat *stat)
  1521	{
  1522	}
  1523	static inline void printk_all_partitions(void)
  1524	{
  1525	}
  1526	static inline int early_lookup_bdev(const char *pathname, dev_t *dev)
  1527	{
  1528		return -EINVAL;
  1529	}
> 1530	void bdev_aops_reset(struct block_device *bdev)
  1531	{
  1532	}
  1533	#endif /* CONFIG_BLOCK */
  1534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
