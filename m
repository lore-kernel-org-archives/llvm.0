Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24228C009;
	Mon,  4 May 2026 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777876071; cv=none; b=e4rIDrwNW2kVgOnesdBr3MfXooIsrhyLLaMlaQYltrqx9NgzWazVpSIk0HKz4XOqDaQsbl/faS3YLVEksZik/3iUFEsQANHw6/7CCXmAd1AdhmO3lxOYV3iN4b0BMbqB/bCLtEpHtfI79DsB37Z7ObezUnTVblLdQgYsAw29w2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777876071; c=relaxed/simple;
	bh=YEkrXlKGTnZrKR/+1qehrk7REP19RFsm+Z4069IqapQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UB4/Ynv8bKV93YncrMDvde4QeJcAs4iNsRGyKFlUZkaxsZglIlOgVn/GB730Qs28rWhOFo9wM7W27506Fb3U4Pl41uEu6sDUNAFkB/2Na+4n1mAJT0nsBslBQsofbco4sa2WwqP42z9ufIycxDp3L9TQrFGJGe9iEecaKfjv6sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQWoVxtp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQWoVxtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777876070; x=1809412070;
  h=date:from:to:cc:subject:message-id;
  bh=YEkrXlKGTnZrKR/+1qehrk7REP19RFsm+Z4069IqapQ=;
  b=HQWoVxtpuN0df+H4oiZEfVnDhIgn9YuwKUG/8922kIrhupXAX6otfd1K
   TVeSpQGMZqBKp8xn/kKIkbQXD8jSEZ/F95I+SSqT5VWYPmQ6N14SFGJaH
   hIwAQRmR/NKG3LYU+FHz5vqSS+mLv0+aTXoD8yF5lzm8Vcw6GZZHsBPwZ
   g7j3QHvHciGMnBYoe1RuIR80nnl9v/QfP7Tolsciv36wXVkVuEiyO+wKe
   XD7b/6rj/llbd5W9s9QUNGzk892hjb///Ikx+fzhye7p4YaZIawXDqacx
   Cm6eRSFAjbVOxdzIxtw4F4o7y9bsfAWQoEWDUUH8S4Annxv9YWwOuVjug
   g==;
X-CSE-ConnectionGUID: /0uEtQ4VR/OPTvkfnp8dIg==
X-CSE-MsgGUID: y0LF2W0ISkasnaGRngSVsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78829359"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78829359"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 23:27:49 -0700
X-CSE-ConnectionGUID: C2qcc3XzTBGX4rg1+WFleA==
X-CSE-MsgGUID: aq3gct/lRP2oxxQO1aa29A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="230826727"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 May 2026 23:27:47 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJmmH-000000003Y5-0Mnv;
	Mon, 04 May 2026 06:27:39 +0000
Date: Mon, 04 May 2026 14:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 9/12] kernel/softirq.c:638:11: warning:
 format specifies type 'unsigned int' but the argument has type 'long'
Message-ID: <202605041454.txTx1yHk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   25f8ae3956f6e747f0eedaca70ed975a79068ec4
commit: 06213534538c49fcab99613e767100580c940910 [9/12] preempt: x86: Avoid tracking NMI separately when 64BIT=y
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260504/202605041454.txTx1yHk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041454.txTx1yHk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041454.txTx1yHk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/softirq.c:638:11: warning: format specifies type 'unsigned int' but the argument has type 'long' [-Wformat]
     636 |                         pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
         |                                                                                  ~~~~
         |                                                                                  %08lx
     637 |                                vec_nr, softirq_to_name[vec_nr], h->action,
     638 |                                prev_count, preempt_count());
         |                                ^~~~~~~~~~
   include/linux/printk.h:554:33: note: expanded from macro 'pr_err'
     554 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.
--
>> arch/arm/kernel/traps.c:518:2: warning: unused variable 'nesting' [-Wunused-variable]
     518 |         nmi_exit();
         |         ^~~~~~~~~~
   include/linux/hardirq.h:142:3: note: expanded from macro 'nmi_exit'
     142 |                 __nmi_exit();                                   \
         |                 ^~~~~~~~~~~~
   include/linux/hardirq.h:128:16: note: expanded from macro '__nmi_exit'
     128 |                 unsigned int nesting;                           \
         |                              ^~~~~~~
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


vim +638 kernel/softirq.c

f1a83e652bedef Peter Zijlstra      2013-11-19  589  
1dd1eff161bd55 Zqiang              2024-04-27  590  static void handle_softirqs(bool ksirqd)
^1da177e4c3f41 Linus Torvalds      2005-04-16  591  {
c10d73671ad30f Eric Dumazet        2013-01-10  592  	unsigned long end = jiffies + MAX_SOFTIRQ_TIME;
907aed48f65efe Mel Gorman          2012-07-31  593  	unsigned long old_flags = current->flags;
34376a50fb1fa0 Ben Greear          2013-06-06  594  	int max_restart = MAX_SOFTIRQ_RESTART;
f1a83e652bedef Peter Zijlstra      2013-11-19  595  	struct softirq_action *h;
5c4853b60ca8ec Frederic Weisbecker 2013-11-20  596  	bool in_hardirq;
f1a83e652bedef Peter Zijlstra      2013-11-19  597  	__u32 pending;
2e702b9f6cba4e Joe Perches         2014-01-27  598  	int softirq_bit;
907aed48f65efe Mel Gorman          2012-07-31  599  
907aed48f65efe Mel Gorman          2012-07-31  600  	/*
e45506ac0af9b5 Yangtao Li          2018-10-18  601  	 * Mask out PF_MEMALLOC as the current task context is borrowed for the
e45506ac0af9b5 Yangtao Li          2018-10-18  602  	 * softirq. A softirq handled, such as network RX, might set PF_MEMALLOC
e45506ac0af9b5 Yangtao Li          2018-10-18  603  	 * again if the socket is related to swapping.
907aed48f65efe Mel Gorman          2012-07-31  604  	 */
907aed48f65efe Mel Gorman          2012-07-31  605  	current->flags &= ~PF_MEMALLOC;
^1da177e4c3f41 Linus Torvalds      2005-04-16  606  
^1da177e4c3f41 Linus Torvalds      2005-04-16  607  	pending = local_softirq_pending();
829035fd709119 Paul Mackerras      2006-07-03  608  
f02fc963e91160 Thomas Gleixner     2021-03-09  609  	softirq_handle_begin();
5c4853b60ca8ec Frederic Weisbecker 2013-11-20  610  	in_hardirq = lockdep_softirq_start();
d3759e7184f8f6 Frederic Weisbecker 2020-12-02  611  	account_softirq_enter(current);
^1da177e4c3f41 Linus Torvalds      2005-04-16  612  
^1da177e4c3f41 Linus Torvalds      2005-04-16  613  restart:
^1da177e4c3f41 Linus Torvalds      2005-04-16  614  	/* Reset the pending bitmask before enabling irqs */
3f74478b5fd726 Andi Kleen          2005-09-12  615  	set_softirq_pending(0);
^1da177e4c3f41 Linus Torvalds      2005-04-16  616  
c70f5d6610c601 Andrew Morton       2005-07-30  617  	local_irq_enable();
^1da177e4c3f41 Linus Torvalds      2005-04-16  618  
^1da177e4c3f41 Linus Torvalds      2005-04-16  619  	h = softirq_vec;
^1da177e4c3f41 Linus Torvalds      2005-04-16  620  
2e702b9f6cba4e Joe Perches         2014-01-27  621  	while ((softirq_bit = ffs(pending))) {
2e702b9f6cba4e Joe Perches         2014-01-27  622  		unsigned int vec_nr;
06213534538c49 Boqun Feng          2026-05-03  623  		long prev_count;
2e702b9f6cba4e Joe Perches         2014-01-27  624  
2e702b9f6cba4e Joe Perches         2014-01-27  625  		h += softirq_bit - 1;
2e702b9f6cba4e Joe Perches         2014-01-27  626  
2e702b9f6cba4e Joe Perches         2014-01-27  627  		vec_nr = h - softirq_vec;
2e702b9f6cba4e Joe Perches         2014-01-27  628  		prev_count = preempt_count();
8e85b4b553fc93 Thomas Gleixner     2008-10-02  629  
f4bc6bb2d56270 Thomas Gleixner     2010-10-19  630  		kstat_incr_softirqs_this_cpu(vec_nr);
f4bc6bb2d56270 Thomas Gleixner     2010-10-19  631  
f4bc6bb2d56270 Thomas Gleixner     2010-10-19  632  		trace_softirq_entry(vec_nr);
e68ac2b488495f Caleb Sander Mateos 2024-08-15  633  		h->action();
f4bc6bb2d56270 Thomas Gleixner     2010-10-19  634  		trace_softirq_exit(vec_nr);
8e85b4b553fc93 Thomas Gleixner     2008-10-02  635  		if (unlikely(prev_count != preempt_count())) {
403227641533c4 Joe Perches         2014-01-27  636  			pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
2e702b9f6cba4e Joe Perches         2014-01-27  637  			       vec_nr, softirq_to_name[vec_nr], h->action,
f4bc6bb2d56270 Thomas Gleixner     2010-10-19 @638  			       prev_count, preempt_count());
4a2b4b222743bb Peter Zijlstra      2013-08-14  639  			preempt_count_set(prev_count);
8e85b4b553fc93 Thomas Gleixner     2008-10-02  640  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  641  		h++;
2e702b9f6cba4e Joe Perches         2014-01-27  642  		pending >>= softirq_bit;
2e702b9f6cba4e Joe Perches         2014-01-27  643  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  644  
1dd1eff161bd55 Zqiang              2024-04-27  645  	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && ksirqd)
d28139c4e96713 Paul E. McKenney    2018-06-28  646  		rcu_softirq_qs();
8b1c04acad082d Thomas Gleixner     2021-03-09  647  
c70f5d6610c601 Andrew Morton       2005-07-30  648  	local_irq_disable();
^1da177e4c3f41 Linus Torvalds      2005-04-16  649  
^1da177e4c3f41 Linus Torvalds      2005-04-16  650  	pending = local_softirq_pending();
c10d73671ad30f Eric Dumazet        2013-01-10  651  	if (pending) {
34376a50fb1fa0 Ben Greear          2013-06-06  652  		if (time_before(jiffies, end) && !need_resched() &&
34376a50fb1fa0 Ben Greear          2013-06-06  653  		    --max_restart)
^1da177e4c3f41 Linus Torvalds      2005-04-16  654  			goto restart;
^1da177e4c3f41 Linus Torvalds      2005-04-16  655  
^1da177e4c3f41 Linus Torvalds      2005-04-16  656  		wakeup_softirqd();
c10d73671ad30f Eric Dumazet        2013-01-10  657  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  658  
d3759e7184f8f6 Frederic Weisbecker 2020-12-02  659  	account_softirq_exit(current);
5c4853b60ca8ec Frederic Weisbecker 2013-11-20  660  	lockdep_softirq_end(in_hardirq);
f02fc963e91160 Thomas Gleixner     2021-03-09  661  	softirq_handle_end();
717a94b5fc7092 NeilBrown           2017-04-07  662  	current_restore_flags(old_flags, PF_MEMALLOC);
^1da177e4c3f41 Linus Torvalds      2005-04-16  663  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  664  

:::::: The code at line 638 was first introduced by commit
:::::: f4bc6bb2d562703eafc895c37e7be20906de139d tracing: Cleanup the convoluted softirq tracepoints

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
