Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8527B757EF;
	Sun, 31 Mar 2024 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711877428; cv=none; b=gvexTZSfZB8EAdkSDuQclM3e92FnElqxGKqYgqv4kc2rpmGnkwOoC5D3XwaXtH9IEs6rxOjY0JNUy9FW6EBOdSIp8MFFX54Gr4QPPMWl4KO8IsDU/CKNxf/ZSQPmJPUrZrkMPGBKSX00foFPfbzHy6l1iSwYkzEkYz8TDMlaswI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711877428; c=relaxed/simple;
	bh=L7vWnNC9hHZ7ZLX4M85gGhLpVGzsvXvsNJusiL0gWJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ub/Exyq55oEn8sXLu9YGVwp+lTWACHHvCQM8jzvnljzQVq7Rk9iGPGboORmq5ora3Gl+kb4zUVA7KUq9Vj5nd+okFhjWyTB8h4lxIy7IrKg+LJf2fxq/BRDgFUTTSHekvdDKzBiL2EIfYNG8Ze09Wa1goWjI2r/7j6EgHxp+sbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yuiut+1u; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yuiut+1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711877427; x=1743413427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L7vWnNC9hHZ7ZLX4M85gGhLpVGzsvXvsNJusiL0gWJk=;
  b=Yuiut+1uqsoXXGtLhZ+izxSw3J2MDj6WuDNA8R3RgCnVHJveQsNvt3Ys
   1A3DjCO+SW69xjgRqmBjqoevEzD2PkQTViLb8ESG7PxI7+ZZWYDOsgZxS
   2Huu0rZmj7kE+3znCI/fZQh/PVEJOcf368AoN8qK+yyjK3bFmqgQmQ4l3
   h7z5JFMBB+bV4PZxliy7RukbfvnuHAHUMr9EhUAqe+hUI7NrM6dtzoFLC
   ZgZH3e1wa5fTDxYOUmBR6ZthrkOilVeZO/98YpKiKzMSzOjPDcd1WAmZy
   YmX/M9NACnUcsPnxfdoBxJgWD0/JYitf2w9UI1OqkbiM/RArZWFYX+UcJ
   g==;
X-CSE-ConnectionGUID: XaMTFuSxSqyXFSFAYieXIA==
X-CSE-MsgGUID: ZyxMPPOTRSGj2uygOaSZdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="24472809"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="24472809"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 02:30:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17495666"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2024 02:30:21 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqrW7-0000z6-1j;
	Sun, 31 Mar 2024 09:30:19 +0000
Date: Sun, 31 Mar 2024 17:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [akpm-mm:mm-unstable 262/270] include/linux/memory-tiers.h:143:25:
 warning: no previous prototype for function 'mt_find_alloc_memory_type'
Message-ID: <202403311754.pBuEzHw6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   0cef2c0a2a356137b170c3cb46cb9c1dd2ca3e6b
commit: 57fc2afac84efdb0968e028382023a937bb4d6a0 [262/270] memory tier: dax/kmem: introduce an abstract layer for finding, allocating, and putting memory types
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240331/202403311754.pBuEzHw6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311754.pBuEzHw6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311754.pBuEzHw6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:43:
>> include/linux/memory-tiers.h:143:25: warning: no previous prototype for function 'mt_find_alloc_memory_type' [-Wmissing-prototypes]
     143 | struct memory_dev_type *mt_find_alloc_memory_type(int adist, struct list_head *memory_types)
         |                         ^
   include/linux/memory-tiers.h:143:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     143 | struct memory_dev_type *mt_find_alloc_memory_type(int adist, struct list_head *memory_types)
         | ^
         | static 
>> include/linux/memory-tiers.h:148:6: warning: no previous prototype for function 'mt_put_memory_types' [-Wmissing-prototypes]
     148 | void mt_put_memory_types(struct list_head *memory_types)
         |      ^
   include/linux/memory-tiers.h:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     148 | void mt_put_memory_types(struct list_head *memory_types)
         | ^
         | static 
   kernel/sched/fair.c:488:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
     488 | static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:509:19: warning: unused function 'tg_is_idle' [-Wunused-function]
     509 | static inline int tg_is_idle(struct task_group *tg)
         |                   ^~~~~~~~~~
   kernel/sched/fair.c:533:19: warning: unused function 'max_vruntime' [-Wunused-function]
     533 | static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
         |                   ^~~~~~~~~~~~
   kernel/sched/fair.c:1308:20: warning: unused function 'is_core_idle' [-Wunused-function]
    1308 | static inline bool is_core_idle(int cpu)
         |                    ^~~~~~~~~~~~
   kernel/sched/fair.c:3561:20: warning: unused function 'account_numa_enqueue' [-Wunused-function]
    3561 | static inline void account_numa_enqueue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3565:20: warning: unused function 'account_numa_dequeue' [-Wunused-function]
    3565 | static inline void account_numa_dequeue(struct rq *rq, struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3569:20: warning: unused function 'update_scan_period' [-Wunused-function]
    3569 | static inline void update_scan_period(struct task_struct *p, int new_cpu)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5123:20: warning: unused function 'cfs_rq_is_decayed' [-Wunused-function]
    5123 | static inline bool cfs_rq_is_decayed(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5138:20: warning: unused function 'remove_entity_load_avg' [-Wunused-function]
    5138 | static inline void remove_entity_load_avg(struct sched_entity *se) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6568:20: warning: unused function 'cfs_bandwidth_used' [-Wunused-function]
    6568 | static inline bool cfs_bandwidth_used(void)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6576:20: warning: unused function 'sync_throttle' [-Wunused-function]
    6576 | static inline void sync_throttle(struct task_group *tg, int cpu) {}
         |                    ^~~~~~~~~~~~~
   kernel/sched/fair.c:6589:19: warning: unused function 'throttled_lb_pair' [-Wunused-function]
    6589 | static inline int throttled_lb_pair(struct task_group *tg,
         |                   ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6600:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
    6600 | static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
         |                                     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6604:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
    6604 | static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6605:20: warning: unused function 'update_runtime_enabled' [-Wunused-function]
    6605 | static inline void update_runtime_enabled(struct rq *rq) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6606:20: warning: unused function 'unthrottle_offline_cfs_rqs' [-Wunused-function]
    6606 | static inline void unthrottle_offline_cfs_rqs(struct rq *rq) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   18 warnings generated.


vim +/mt_find_alloc_memory_type +143 include/linux/memory-tiers.h

   142	
 > 143	struct memory_dev_type *mt_find_alloc_memory_type(int adist, struct list_head *memory_types)
   144	{
   145		return NULL;
   146	}
   147	
 > 148	void mt_put_memory_types(struct list_head *memory_types)
   149	{
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
