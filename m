Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62141FDE31;
	Fri,  6 Feb 2026 01:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770341623; cv=none; b=KJIdz4X2CUd5UUhWGF635Lqs2cHN3LOhUolJYIm6b1VkyzT9yfP5PbBEZgUCVxoB3FmnF7sR8Dlo57wIO3Cm8uzxkFrKUzAd+6vBbZZlkCK7AxA8deXhDwieS3JUcXqpPAB4as+akoY4ZH8ppB5p6pVZvZ0wK1s7ZujCnFDh6AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770341623; c=relaxed/simple;
	bh=yHDh+S1r+1TNj6ko2UPparSwOoQV6+1cUk8ZEx6aPwk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A2pOAVhG3xcYUFqgHkyfCxwTN6kuZAPf8ooSDNGV01Mizo2J8G1rRzSvNOnyhOzOlx6nHr5LI0bWMmLX36moczgHxAQ217zfQP8iOOc418y1+ycT8dqk2CVHt1t6+y515QZgmR4BA47p53RD8gTQquusYExvemFSS/YkKEGjjsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMRfiYHE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMRfiYHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770341623; x=1801877623;
  h=date:from:to:cc:subject:message-id;
  bh=yHDh+S1r+1TNj6ko2UPparSwOoQV6+1cUk8ZEx6aPwk=;
  b=iMRfiYHEHBrb37EEh1kUM1zyJaxAUfJaeDfoF6dawc6gZXcYyJ6v/kgC
   kohB9eUthYvIDSMUoLXoXx3oo7lkVRM7T9IW7XhLxf64rbJlue/dOCxX4
   zfDchfI+FpjFXw6tVPIMAf7JcUsHqyfEt0KoS+q2bC67v89E6hm5zRGKr
   uEhXDInU/H6aToxnwKJjKJhzIdxiyJFU6V1AHfSd/qHVADGXIB/LHxcxT
   S2+U5979Lv+6d6Qgf3MhIW4pKheDdJCFbS75mYj+zNl+4QjLm0s6kqtoQ
   WZZuV7wGwqX1uxfDYQ3/dRO8ik8DV8oT9E6wx6w5aEB1pz2V5rGiGinYS
   w==;
X-CSE-ConnectionGUID: FEvaS1TTQQWSyMjj29wu0A==
X-CSE-MsgGUID: Uz+RS1/aSjyBSyWLbmkleQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75407477"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="75407477"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 17:33:41 -0800
X-CSE-ConnectionGUID: sLRPVJJcRsCZD0veffExMQ==
X-CSE-MsgGUID: /KWz2E30Qraan0n79gHUpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="209820882"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2026 17:33:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voAj2-00000000kLm-3awY;
	Fri, 06 Feb 2026 01:33:36 +0000
Date: Fri, 06 Feb 2026 09:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>
Subject: [boqun:rust-sync 12/17] kernel/softirq.c:635:11: warning:
 format specifies type 'unsigned int' but the argument has type 'long'
Message-ID: <202602060907.gBjZPa7W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   3ef437b5dd8b13bd88b1512531391ad30c26d539
commit: 6969095afa2073e65ecc958bb5064ddf808309b3 [12/17] preempt: Introduce HARDIRQ_DISABLE_BITS and PREEMPT_LONG
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260206/202602060907.gBjZPa7W-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060907.gBjZPa7W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060907.gBjZPa7W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/softirq.c:635:11: warning: format specifies type 'unsigned int' but the argument has type 'long' [-Wformat]
     633 |                         pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
         |                                                                                  ~~~~
         |                                                                                  %08lx
     634 |                                vec_nr, softirq_to_name[vec_nr], h->action,
     635 |                                prev_count, preempt_count());
         |                                ^~~~~~~~~~
   include/linux/printk.h:555:33: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.
--
>> kernel/time/timer.c:1755:10: warning: format specifies type 'unsigned int' but the argument has type 'long' [-Wformat]
    1754 |                 WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
         |                                                        ~~~~
         |                                                        %08lx
    1755 |                           fn, count, preempt_count());
         |                               ^~~~~
   include/asm-generic/bug.h:185:38: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                             ^~~~~~
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/asm-generic/bug.h:166:29: note: expanded from macro 'WARN'
     166 |                 __WARN_printf(TAINT_WARN, format);                      \
         |                                           ^~~~~~
   include/asm-generic/bug.h:142:48: note: expanded from macro '__WARN_printf'
     142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
         |                                                              ^~~
   1 warning generated.


vim +635 kernel/softirq.c

f1a83e652bedef Peter Zijlstra      2013-11-19  586  
1dd1eff161bd55 Zqiang              2024-04-27  587  static void handle_softirqs(bool ksirqd)
^1da177e4c3f41 Linus Torvalds      2005-04-16  588  {
c10d73671ad30f Eric Dumazet        2013-01-10  589  	unsigned long end = jiffies + MAX_SOFTIRQ_TIME;
907aed48f65efe Mel Gorman          2012-07-31  590  	unsigned long old_flags = current->flags;
34376a50fb1fa0 Ben Greear          2013-06-06  591  	int max_restart = MAX_SOFTIRQ_RESTART;
f1a83e652bedef Peter Zijlstra      2013-11-19  592  	struct softirq_action *h;
5c4853b60ca8ec Frederic Weisbecker 2013-11-20  593  	bool in_hardirq;
f1a83e652bedef Peter Zijlstra      2013-11-19  594  	__u32 pending;
2e702b9f6cba4e Joe Perches         2014-01-27  595  	int softirq_bit;
907aed48f65efe Mel Gorman          2012-07-31  596  
907aed48f65efe Mel Gorman          2012-07-31  597  	/*
e45506ac0af9b5 Yangtao Li          2018-10-18  598  	 * Mask out PF_MEMALLOC as the current task context is borrowed for the
e45506ac0af9b5 Yangtao Li          2018-10-18  599  	 * softirq. A softirq handled, such as network RX, might set PF_MEMALLOC
e45506ac0af9b5 Yangtao Li          2018-10-18  600  	 * again if the socket is related to swapping.
907aed48f65efe Mel Gorman          2012-07-31  601  	 */
907aed48f65efe Mel Gorman          2012-07-31  602  	current->flags &= ~PF_MEMALLOC;
^1da177e4c3f41 Linus Torvalds      2005-04-16  603  
^1da177e4c3f41 Linus Torvalds      2005-04-16  604  	pending = local_softirq_pending();
829035fd709119 Paul Mackerras      2006-07-03  605  
f02fc963e91160 Thomas Gleixner     2021-03-09  606  	softirq_handle_begin();
5c4853b60ca8ec Frederic Weisbecker 2013-11-20  607  	in_hardirq = lockdep_softirq_start();
d3759e7184f8f6 Frederic Weisbecker 2020-12-02  608  	account_softirq_enter(current);
^1da177e4c3f41 Linus Torvalds      2005-04-16  609  
^1da177e4c3f41 Linus Torvalds      2005-04-16  610  restart:
^1da177e4c3f41 Linus Torvalds      2005-04-16  611  	/* Reset the pending bitmask before enabling irqs */
3f74478b5fd726 Andi Kleen          2005-09-12  612  	set_softirq_pending(0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  613  
c70f5d6610c601 Andrew Morton       2005-07-30  614  	local_irq_enable();
^1da177e4c3f41 Linus Torvalds      2005-04-16  615  
^1da177e4c3f41 Linus Torvalds      2005-04-16  616  	h = softirq_vec;
^1da177e4c3f41 Linus Torvalds      2005-04-16  617  
2e702b9f6cba4e Joe Perches         2014-01-27  618  	while ((softirq_bit = ffs(pending))) {
2e702b9f6cba4e Joe Perches         2014-01-27  619  		unsigned int vec_nr;
6969095afa2073 Peter Zijlstra      2026-02-04  620  		long prev_count;
2e702b9f6cba4e Joe Perches         2014-01-27  621  
2e702b9f6cba4e Joe Perches         2014-01-27  622  		h += softirq_bit - 1;
2e702b9f6cba4e Joe Perches         2014-01-27  623  
2e702b9f6cba4e Joe Perches         2014-01-27  624  		vec_nr = h - softirq_vec;
2e702b9f6cba4e Joe Perches         2014-01-27  625  		prev_count = preempt_count();
8e85b4b553fc93 Thomas Gleixner     2008-10-02  626  
f4bc6bb2d56270 Thomas Gleixner     2010-10-19  627  		kstat_incr_softirqs_this_cpu(vec_nr);
f4bc6bb2d56270 Thomas Gleixner     2010-10-19  628  
f4bc6bb2d56270 Thomas Gleixner     2010-10-19  629  		trace_softirq_entry(vec_nr);
e68ac2b488495f Caleb Sander Mateos 2024-08-15  630  		h->action();
f4bc6bb2d56270 Thomas Gleixner     2010-10-19  631  		trace_softirq_exit(vec_nr);
8e85b4b553fc93 Thomas Gleixner     2008-10-02  632  		if (unlikely(prev_count != preempt_count())) {
403227641533c4 Joe Perches         2014-01-27  633  			pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
2e702b9f6cba4e Joe Perches         2014-01-27  634  			       vec_nr, softirq_to_name[vec_nr], h->action,
f4bc6bb2d56270 Thomas Gleixner     2010-10-19 @635  			       prev_count, preempt_count());
4a2b4b222743bb Peter Zijlstra      2013-08-14  636  			preempt_count_set(prev_count);
8e85b4b553fc93 Thomas Gleixner     2008-10-02  637  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  638  		h++;
2e702b9f6cba4e Joe Perches         2014-01-27  639  		pending >>= softirq_bit;
2e702b9f6cba4e Joe Perches         2014-01-27  640  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  641  
1dd1eff161bd55 Zqiang              2024-04-27  642  	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && ksirqd)
d28139c4e96713 Paul E. McKenney    2018-06-28  643  		rcu_softirq_qs();
8b1c04acad082d Thomas Gleixner     2021-03-09  644  
c70f5d6610c601 Andrew Morton       2005-07-30  645  	local_irq_disable();
^1da177e4c3f41 Linus Torvalds      2005-04-16  646  
^1da177e4c3f41 Linus Torvalds      2005-04-16  647  	pending = local_softirq_pending();
c10d73671ad30f Eric Dumazet        2013-01-10  648  	if (pending) {
34376a50fb1fa0 Ben Greear          2013-06-06  649  		if (time_before(jiffies, end) && !need_resched() &&
34376a50fb1fa0 Ben Greear          2013-06-06  650  		    --max_restart)
^1da177e4c3f41 Linus Torvalds      2005-04-16  651  			goto restart;
^1da177e4c3f41 Linus Torvalds      2005-04-16  652  
^1da177e4c3f41 Linus Torvalds      2005-04-16  653  		wakeup_softirqd();
c10d73671ad30f Eric Dumazet        2013-01-10  654  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  655  
d3759e7184f8f6 Frederic Weisbecker 2020-12-02  656  	account_softirq_exit(current);
5c4853b60ca8ec Frederic Weisbecker 2013-11-20  657  	lockdep_softirq_end(in_hardirq);
f02fc963e91160 Thomas Gleixner     2021-03-09  658  	softirq_handle_end();
717a94b5fc7092 NeilBrown           2017-04-07  659  	current_restore_flags(old_flags, PF_MEMALLOC);
^1da177e4c3f41 Linus Torvalds      2005-04-16  660  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  661  

:::::: The code at line 635 was first introduced by commit
:::::: f4bc6bb2d562703eafc895c37e7be20906de139d tracing: Cleanup the convoluted softirq tracepoints

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
