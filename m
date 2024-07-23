Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0AD25760;
	Tue, 23 Jul 2024 22:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721775542; cv=none; b=qUroJC1YNV3Gtf+VvCYw/Ms/b6GHYjPN4OZ/+7kzdcZs1gI1RqFzaHjhyAXFP/eFYU3Zd4BMXkB2P/MC9zbgm7T9zHHUoGCwMA4kYxQojIGXnEbRdOIwUtq6PkXvSlv9qE8hsjaD0Y1AVbKt6hopahYcvyYHHzi3n/IoQzwgyQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721775542; c=relaxed/simple;
	bh=v11YmFyuNRTljr5YnoM9cW6ob/nLgGcmVpIeHK8y2nY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIAFdTxUtpLFvoDyQtQmuhTRdpWTXxQJw0lshOouJJK+Jv7VzYPX0LJ4WFwzGnIlfsbBcVWS5BuOy+HU1VX3NsfvQi9FaJ+GtxImO7TNygmw4mdZbd/fXkzicWrq3hGzNpW8bBIkThq+zHx84FDifihYUYL7b708levaa5maDNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjwJseWY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjwJseWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721775537; x=1753311537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v11YmFyuNRTljr5YnoM9cW6ob/nLgGcmVpIeHK8y2nY=;
  b=KjwJseWYr1QDiQ5qZf8DbAR1AbccsezwEZr6Ug2dPLbMKvoQcm0vwvlA
   y2iTnzYpFTBaBHdJsYzXhPDWft9erjP5pj7m/m7TdezsoW7cRpj6X7oR5
   1g6iNOAkeNgzz4VSUVu3MPCt6EaHtFgcBIJdqZ+X+2GinUH6ADDGz3PH8
   PoOVXML/XBIvj0LhkSo/Ncolh1286vWab2vCBhtRJ0y65jzZGGumnRsUs
   TPdd+fSEuuBpbdaDMHXJE7zMLJLbCc2QqzdAzM7vXyFUrKNCX1we/Mu+B
   El5XB+ZYqZmOQ7JADUR4sfdBEIZqDqoOwDN2/Nhooqc/4KKGwLCChD+AQ
   A==;
X-CSE-ConnectionGUID: tA8Xs21CTR+ugMeNMp44bw==
X-CSE-MsgGUID: +JurGNUQQVWJNHE9G6OLlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19234160"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="19234160"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 15:58:56 -0700
X-CSE-ConnectionGUID: 0yG2NBOhTaWQvqPIIbKYJg==
X-CSE-MsgGUID: 49XoNZKxTj++OWPTGBGZIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="52413934"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2024 15:58:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWOT6-000mQu-1O;
	Tue, 23 Jul 2024 22:58:52 +0000
Date: Wed, 24 Jul 2024 06:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/scx 41/42] kernel/sched/core.c:6072:7: warning:
 variable 'p' is used uninitialized whenever 'if' condition is true
Message-ID: <202407240955.E1PWz6eH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/scx
head:   df64e1ce653e6748aff3f6d7dea17a02c7905075
commit: 929779e3c90a5ca107489bf418463d952bc1a194 [41/42] sched: Add put_prev_task(.change_class)
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240724/202407240955.E1PWz6eH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240955.E1PWz6eH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240955.E1PWz6eH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/core.c:34:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from kernel/sched/core.c:34:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from kernel/sched/core.c:34:
   In file included from include/linux/sched/isolation.h:7:
   In file included from include/linux/tick.h:8:
   In file included from include/linux/clockchips.h:14:
   In file included from include/linux/clocksource.h:22:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> kernel/sched/core.c:6072:7: warning: variable 'p' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    6072 |                 if (!next->core_cookie) {
         |                     ^~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:6200:35: note: uninitialized use occurs here
    6200 |         put_prev_set_next_task(rq, prev, p);
         |                                          ^
   kernel/sched/core.c:6072:3: note: remove the 'if' if its condition is always false
    6072 |                 if (!next->core_cookie) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
    6073 |                         rq->core_pick = NULL;
         |                         ~~~~~~~~~~~~~~~~~~~~~
    6074 |                         /*
         |                         ~~
    6075 |                          * For robustness, update the min_vruntime_fi for
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6076 |                          * unconstrained picks as well.
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6077 |                          */
         |                          ~~
    6078 |                         WARN_ON_ONCE(fi_before);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
    6079 |                         task_vruntime_update(rq, next, false);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6080 |                         goto out_set_next;
         |                         ~~~~~~~~~~~~~~~~~~
    6081 |                 }
         |                 ~
   kernel/sched/core.c:5984:30: note: initialize the variable 'p' to silence this warning
    5984 |         struct task_struct *next, *p, *max = NULL;
         |                                     ^
         |                                      = NULL
   kernel/sched/core.c:6316:1: warning: unused function 'class_core_lock_lock_ptr' [-Wunused-function]
    6316 | DEFINE_LOCK_GUARD_1(core_lock, int,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6317 |                     sched_core_lock(*_T->lock, &_T->flags),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6318 |                     sched_core_unlock(*_T->lock, &_T->flags),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6319 |                     unsigned long flags)
         |                     ~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:235:65: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     235 | #define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)          \
         |                                                                         ^
     236 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:212:21: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     212 | static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T)     \
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:124:1: note: expanded from here
     124 | class_core_lock_lock_ptr
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   19 warnings generated.


vim +6072 kernel/sched/core.c

5b6547ed97f4f5 Peter Zijlstra          2022-03-16  5980  
539f65125d20aa Peter Zijlstra          2020-11-17  5981  static struct task_struct *
539f65125d20aa Peter Zijlstra          2020-11-17  5982  pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
539f65125d20aa Peter Zijlstra          2020-11-17  5983  {
bc9ffef31bf598 Peter Zijlstra          2021-08-24  5984  	struct task_struct *next, *p, *max = NULL;
539f65125d20aa Peter Zijlstra          2020-11-17  5985  	const struct cpumask *smt_mask;
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  5986) 	bool fi_before = false;
4feee7d12603de Josh Don                2021-10-18  5987  	bool core_clock_updated = (rq == rq->core);
bc9ffef31bf598 Peter Zijlstra          2021-08-24  5988  	unsigned long cookie;
bc9ffef31bf598 Peter Zijlstra          2021-08-24  5989  	int i, cpu, occ = 0;
bc9ffef31bf598 Peter Zijlstra          2021-08-24  5990  	struct rq *rq_i;
539f65125d20aa Peter Zijlstra          2020-11-17  5991  	bool need_sync;
539f65125d20aa Peter Zijlstra          2020-11-17  5992  
539f65125d20aa Peter Zijlstra          2020-11-17  5993  	if (!sched_core_enabled(rq))
539f65125d20aa Peter Zijlstra          2020-11-17  5994  		return __pick_next_task(rq, prev, rf);
539f65125d20aa Peter Zijlstra          2020-11-17  5995  
539f65125d20aa Peter Zijlstra          2020-11-17  5996  	cpu = cpu_of(rq);
539f65125d20aa Peter Zijlstra          2020-11-17  5997  
539f65125d20aa Peter Zijlstra          2020-11-17  5998  	/* Stopper task is switching into idle, no need core-wide selection. */
539f65125d20aa Peter Zijlstra          2020-11-17  5999  	if (cpu_is_offline(cpu)) {
539f65125d20aa Peter Zijlstra          2020-11-17  6000  		/*
539f65125d20aa Peter Zijlstra          2020-11-17  6001  		 * Reset core_pick so that we don't enter the fastpath when
539f65125d20aa Peter Zijlstra          2020-11-17  6002  		 * coming online. core_pick would already be migrated to
539f65125d20aa Peter Zijlstra          2020-11-17  6003  		 * another cpu during offline.
539f65125d20aa Peter Zijlstra          2020-11-17  6004  		 */
539f65125d20aa Peter Zijlstra          2020-11-17  6005  		rq->core_pick = NULL;
539f65125d20aa Peter Zijlstra          2020-11-17  6006  		return __pick_next_task(rq, prev, rf);
539f65125d20aa Peter Zijlstra          2020-11-17  6007  	}
539f65125d20aa Peter Zijlstra          2020-11-17  6008  
539f65125d20aa Peter Zijlstra          2020-11-17  6009  	/*
539f65125d20aa Peter Zijlstra          2020-11-17  6010  	 * If there were no {en,de}queues since we picked (IOW, the task
539f65125d20aa Peter Zijlstra          2020-11-17  6011  	 * pointers are all still valid), and we haven't scheduled the last
539f65125d20aa Peter Zijlstra          2020-11-17  6012  	 * pick yet, do so now.
539f65125d20aa Peter Zijlstra          2020-11-17  6013  	 *
539f65125d20aa Peter Zijlstra          2020-11-17  6014  	 * rq->core_pick can be NULL if no selection was made for a CPU because
539f65125d20aa Peter Zijlstra          2020-11-17  6015  	 * it was either offline or went offline during a sibling's core-wide
539f65125d20aa Peter Zijlstra          2020-11-17  6016  	 * selection. In this case, do a core-wide selection.
539f65125d20aa Peter Zijlstra          2020-11-17  6017  	 */
539f65125d20aa Peter Zijlstra          2020-11-17  6018  	if (rq->core->core_pick_seq == rq->core->core_task_seq &&
539f65125d20aa Peter Zijlstra          2020-11-17  6019  	    rq->core->core_pick_seq != rq->core_sched_seq &&
539f65125d20aa Peter Zijlstra          2020-11-17  6020  	    rq->core_pick) {
539f65125d20aa Peter Zijlstra          2020-11-17  6021  		WRITE_ONCE(rq->core_sched_seq, rq->core->core_pick_seq);
539f65125d20aa Peter Zijlstra          2020-11-17  6022  
539f65125d20aa Peter Zijlstra          2020-11-17  6023  		next = rq->core_pick;
539f65125d20aa Peter Zijlstra          2020-11-17  6024  		if (next != prev) {
539f65125d20aa Peter Zijlstra          2020-11-17  6025  			put_prev_task(rq, prev);
539f65125d20aa Peter Zijlstra          2020-11-17  6026  			set_next_task(rq, next);
539f65125d20aa Peter Zijlstra          2020-11-17  6027  		}
539f65125d20aa Peter Zijlstra          2020-11-17  6028  
539f65125d20aa Peter Zijlstra          2020-11-17  6029  		rq->core_pick = NULL;
5b6547ed97f4f5 Peter Zijlstra          2022-03-16  6030  		goto out;
539f65125d20aa Peter Zijlstra          2020-11-17  6031  	}
539f65125d20aa Peter Zijlstra          2020-11-17  6032  
6bef643d2583b2 Peter Zijlstra          2024-07-22  6033  	prev_balance(rq, prev, rf);
6bef643d2583b2 Peter Zijlstra          2024-07-22  6034  
539f65125d20aa Peter Zijlstra          2020-11-17  6035  	smt_mask = cpu_smt_mask(cpu);
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6036) 	need_sync = !!rq->core->core_cookie;
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6037) 
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6038) 	/* reset state */
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6039) 	rq->core->core_cookie = 0UL;
4feee7d12603de Josh Don                2021-10-18  6040  	if (rq->core->core_forceidle_count) {
4feee7d12603de Josh Don                2021-10-18  6041  		if (!core_clock_updated) {
4feee7d12603de Josh Don                2021-10-18  6042  			update_rq_clock(rq->core);
4feee7d12603de Josh Don                2021-10-18  6043  			core_clock_updated = true;
4feee7d12603de Josh Don                2021-10-18  6044  		}
4feee7d12603de Josh Don                2021-10-18  6045  		sched_core_account_forceidle(rq);
4feee7d12603de Josh Don                2021-10-18  6046  		/* reset after accounting force idle */
4feee7d12603de Josh Don                2021-10-18  6047  		rq->core->core_forceidle_start = 0;
4feee7d12603de Josh Don                2021-10-18  6048  		rq->core->core_forceidle_count = 0;
4feee7d12603de Josh Don                2021-10-18  6049  		rq->core->core_forceidle_occupation = 0;
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6050) 		need_sync = true;
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6051) 		fi_before = true;
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6052) 	}
539f65125d20aa Peter Zijlstra          2020-11-17  6053  
539f65125d20aa Peter Zijlstra          2020-11-17  6054  	/*
539f65125d20aa Peter Zijlstra          2020-11-17  6055  	 * core->core_task_seq, core->core_pick_seq, rq->core_sched_seq
539f65125d20aa Peter Zijlstra          2020-11-17  6056  	 *
539f65125d20aa Peter Zijlstra          2020-11-17  6057  	 * @task_seq guards the task state ({en,de}queues)
539f65125d20aa Peter Zijlstra          2020-11-17  6058  	 * @pick_seq is the @task_seq we did a selection on
539f65125d20aa Peter Zijlstra          2020-11-17  6059  	 * @sched_seq is the @pick_seq we scheduled
539f65125d20aa Peter Zijlstra          2020-11-17  6060  	 *
539f65125d20aa Peter Zijlstra          2020-11-17  6061  	 * However, preemptions can cause multiple picks on the same task set.
539f65125d20aa Peter Zijlstra          2020-11-17  6062  	 * 'Fix' this by also increasing @task_seq for every pick.
539f65125d20aa Peter Zijlstra          2020-11-17  6063  	 */
539f65125d20aa Peter Zijlstra          2020-11-17  6064  	rq->core->core_task_seq++;
539f65125d20aa Peter Zijlstra          2020-11-17  6065  
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6066) 	/*
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6067) 	 * Optimize for common case where this CPU has no cookies
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6068) 	 * and there are no cookied tasks running on siblings.
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6069) 	 */
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6070) 	if (!need_sync) {
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6071  		next = pick_task(rq);
7afbba119f0da0 Joel Fernandes (Google  2020-11-17 @6072) 		if (!next->core_cookie) {
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6073) 			rq->core_pick = NULL;
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6074) 			/*
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6075) 			 * For robustness, update the min_vruntime_fi for
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6076) 			 * unconstrained picks as well.
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6077) 			 */
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6078) 			WARN_ON_ONCE(fi_before);
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6079) 			task_vruntime_update(rq, next, false);
5b6547ed97f4f5 Peter Zijlstra          2022-03-16  6080  			goto out_set_next;
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6081) 		}
8039e96fcc1de3 Vineeth Pillai          2020-11-17  6082  	}
7afbba119f0da0 Joel Fernandes (Google  2020-11-17  6083) 
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6084  	/*
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6085  	 * For each thread: do the regular task pick and find the max prio task
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6086  	 * amongst them.
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6087  	 *
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6088  	 * Tie-break prio towards the current CPU
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6089  	 */
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6090  	for_each_cpu_wrap(i, smt_mask, cpu) {
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6091  		rq_i = cpu_rq(i);
539f65125d20aa Peter Zijlstra          2020-11-17  6092  
4feee7d12603de Josh Don                2021-10-18  6093  		/*
4feee7d12603de Josh Don                2021-10-18  6094  		 * Current cpu always has its clock updated on entrance to
4feee7d12603de Josh Don                2021-10-18  6095  		 * pick_next_task(). If the current cpu is not the core,
4feee7d12603de Josh Don                2021-10-18  6096  		 * the core may also have been updated above.
4feee7d12603de Josh Don                2021-10-18  6097  		 */
4feee7d12603de Josh Don                2021-10-18  6098  		if (i != cpu && (rq_i != rq->core || !core_clock_updated))
539f65125d20aa Peter Zijlstra          2020-11-17  6099  			update_rq_clock(rq_i);
539f65125d20aa Peter Zijlstra          2020-11-17  6100  
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6101  		p = rq_i->core_pick = pick_task(rq_i);
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6102  		if (!max || prio_less(max, p, fi_before))
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6103  			max = p;
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6104  	}
539f65125d20aa Peter Zijlstra          2020-11-17  6105  
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6106  	cookie = rq->core->core_cookie = max->core_cookie;
539f65125d20aa Peter Zijlstra          2020-11-17  6107  
539f65125d20aa Peter Zijlstra          2020-11-17  6108  	/*
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6109  	 * For each thread: try and find a runnable task that matches @max or
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6110  	 * force idle.
539f65125d20aa Peter Zijlstra          2020-11-17  6111  	 */
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6112  	for_each_cpu(i, smt_mask) {
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6113  		rq_i = cpu_rq(i);
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6114  		p = rq_i->core_pick;
539f65125d20aa Peter Zijlstra          2020-11-17  6115  
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6116  		if (!cookie_equals(p, cookie)) {
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6117  			p = NULL;
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6118  			if (cookie)
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6119  				p = sched_core_find(rq_i, cookie);
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6120  			if (!p)
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6121  				p = idle_sched_class.pick_task(rq_i);
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6122  		}
d2dfa17bc7de67 Peter Zijlstra          2020-11-17  6123  
539f65125d20aa Peter Zijlstra          2020-11-17  6124  		rq_i->core_pick = p;
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6125  
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6126  		if (p == rq_i->idle) {
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6127  			if (rq_i->nr_running) {
4feee7d12603de Josh Don                2021-10-18  6128  				rq->core->core_forceidle_count++;
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6129) 				if (!fi_before)
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6130) 					rq->core->core_forceidle_seq++;
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6131) 			}
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6132  		} else {
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6133  			occ++;
539f65125d20aa Peter Zijlstra          2020-11-17  6134  		}
539f65125d20aa Peter Zijlstra          2020-11-17  6135  	}
539f65125d20aa Peter Zijlstra          2020-11-17  6136  
4feee7d12603de Josh Don                2021-10-18  6137  	if (schedstat_enabled() && rq->core->core_forceidle_count) {
4feee7d12603de Josh Don                2021-10-18  6138  		rq->core->core_forceidle_start = rq_clock(rq->core);
4feee7d12603de Josh Don                2021-10-18  6139  		rq->core->core_forceidle_occupation = occ;
4feee7d12603de Josh Don                2021-10-18  6140  	}
4feee7d12603de Josh Don                2021-10-18  6141  
539f65125d20aa Peter Zijlstra          2020-11-17  6142  	rq->core->core_pick_seq = rq->core->core_task_seq;
539f65125d20aa Peter Zijlstra          2020-11-17  6143  	next = rq->core_pick;
539f65125d20aa Peter Zijlstra          2020-11-17  6144  	rq->core_sched_seq = rq->core->core_pick_seq;
539f65125d20aa Peter Zijlstra          2020-11-17  6145  
539f65125d20aa Peter Zijlstra          2020-11-17  6146  	/* Something should have been selected for current CPU */
539f65125d20aa Peter Zijlstra          2020-11-17  6147  	WARN_ON_ONCE(!next);
539f65125d20aa Peter Zijlstra          2020-11-17  6148  
539f65125d20aa Peter Zijlstra          2020-11-17  6149  	/*
539f65125d20aa Peter Zijlstra          2020-11-17  6150  	 * Reschedule siblings
539f65125d20aa Peter Zijlstra          2020-11-17  6151  	 *
539f65125d20aa Peter Zijlstra          2020-11-17  6152  	 * NOTE: L1TF -- at this point we're no longer running the old task and
539f65125d20aa Peter Zijlstra          2020-11-17  6153  	 * sending an IPI (below) ensures the sibling will no longer be running
539f65125d20aa Peter Zijlstra          2020-11-17  6154  	 * their task. This ensures there is no inter-sibling overlap between
539f65125d20aa Peter Zijlstra          2020-11-17  6155  	 * non-matching user state.
539f65125d20aa Peter Zijlstra          2020-11-17  6156  	 */
539f65125d20aa Peter Zijlstra          2020-11-17  6157  	for_each_cpu(i, smt_mask) {
bc9ffef31bf598 Peter Zijlstra          2021-08-24  6158  		rq_i = cpu_rq(i);
539f65125d20aa Peter Zijlstra          2020-11-17  6159  
539f65125d20aa Peter Zijlstra          2020-11-17  6160  		/*
539f65125d20aa Peter Zijlstra          2020-11-17  6161  		 * An online sibling might have gone offline before a task
539f65125d20aa Peter Zijlstra          2020-11-17  6162  		 * could be picked for it, or it might be offline but later
539f65125d20aa Peter Zijlstra          2020-11-17  6163  		 * happen to come online, but its too late and nothing was
539f65125d20aa Peter Zijlstra          2020-11-17  6164  		 * picked for it.  That's Ok - it will pick tasks for itself,
539f65125d20aa Peter Zijlstra          2020-11-17  6165  		 * so ignore it.
539f65125d20aa Peter Zijlstra          2020-11-17  6166  		 */
539f65125d20aa Peter Zijlstra          2020-11-17  6167  		if (!rq_i->core_pick)
539f65125d20aa Peter Zijlstra          2020-11-17  6168  			continue;
539f65125d20aa Peter Zijlstra          2020-11-17  6169  
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6170) 		/*
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6171) 		 * Update for new !FI->FI transitions, or if continuing to be in !FI:
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6172) 		 * fi_before     fi      update?
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6173) 		 *  0            0       1
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6174) 		 *  0            1       1
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6175) 		 *  1            0       1
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6176) 		 *  1            1       0
c6047c2e3af68d Joel Fernandes (Google  2020-11-17  6177) 		 */
4feee7d12603de Josh Don                2021-10-18  6178  		if (!(fi_before && rq->core->core_forceidle_count))
4feee7d12603de Josh Don                2021-10-18  6179  			task_vruntime_update(rq_i, rq_i->core_pick, !!rq->core->core_forceidle_count);
539f65125d20aa Peter Zijlstra          2020-11-17  6180  
d2dfa17bc7de67 Peter Zijlstra          2020-11-17  6181  		rq_i->core_pick->core_occupation = occ;
d2dfa17bc7de67 Peter Zijlstra          2020-11-17  6182  
539f65125d20aa Peter Zijlstra          2020-11-17  6183  		if (i == cpu) {
539f65125d20aa Peter Zijlstra          2020-11-17  6184  			rq_i->core_pick = NULL;
539f65125d20aa Peter Zijlstra          2020-11-17  6185  			continue;
539f65125d20aa Peter Zijlstra          2020-11-17  6186  		}
539f65125d20aa Peter Zijlstra          2020-11-17  6187  
539f65125d20aa Peter Zijlstra          2020-11-17  6188  		/* Did we break L1TF mitigation requirements? */
539f65125d20aa Peter Zijlstra          2020-11-17  6189  		WARN_ON_ONCE(!cookie_match(next, rq_i->core_pick));
539f65125d20aa Peter Zijlstra          2020-11-17  6190  
539f65125d20aa Peter Zijlstra          2020-11-17  6191  		if (rq_i->curr == rq_i->core_pick) {
539f65125d20aa Peter Zijlstra          2020-11-17  6192  			rq_i->core_pick = NULL;
539f65125d20aa Peter Zijlstra          2020-11-17  6193  			continue;
539f65125d20aa Peter Zijlstra          2020-11-17  6194  		}
539f65125d20aa Peter Zijlstra          2020-11-17  6195  
539f65125d20aa Peter Zijlstra          2020-11-17  6196  		resched_curr(rq_i);
539f65125d20aa Peter Zijlstra          2020-11-17  6197  	}
539f65125d20aa Peter Zijlstra          2020-11-17  6198  
5b6547ed97f4f5 Peter Zijlstra          2022-03-16  6199  out_set_next:
4dc9ef89e52432 Peter Zijlstra          2024-07-22  6200  	put_prev_set_next_task(rq, prev, p);
5b6547ed97f4f5 Peter Zijlstra          2022-03-16  6201  out:
5b6547ed97f4f5 Peter Zijlstra          2022-03-16  6202  	if (rq->core->core_forceidle_count && next == rq->idle)
5b6547ed97f4f5 Peter Zijlstra          2022-03-16  6203  		queue_core_balance(rq);
5b6547ed97f4f5 Peter Zijlstra          2022-03-16  6204  
539f65125d20aa Peter Zijlstra          2020-11-17  6205  	return next;
539f65125d20aa Peter Zijlstra          2020-11-17  6206  }
9edeaea1bc4523 Peter Zijlstra          2020-11-17  6207  

:::::: The code at line 6072 was first introduced by commit
:::::: 7afbba119f0da09824d723f8081608ea1f74ff57 sched: Fix priority inversion of cookied task with sibling

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
