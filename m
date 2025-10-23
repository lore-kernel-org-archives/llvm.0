Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05132308F09;
	Thu, 23 Oct 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221200; cv=none; b=YXOAZke82DXW2QKJGY+PJMzAtTpbu3TBPxTOUnY/Ozna+LZO/mmvyi2bDjVTt9sFvo50X046LjJOg9xwc32gYH4J3VJ0sdw+AWcvop5vQ5s5Qj9mziYJu12dcYxJBuFQ42coY/gbPtmabwXP45YU6q7pDRgFhKV5rj+bNUFMhbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221200; c=relaxed/simple;
	bh=hUFi7ajUEGwyA9WFWOg8hqEkC+eBZ37WcwEYhhy4C5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXdP+m0lJSh42F/s2y9/8C3+2yBX9KdaOP4z5vaWsdtuLV3R2GOkLYsxE3fuCL6VjXLCnwKLytP93+VBFVCWRrBczE3Y8p1V+dORc7/A6rGRcPfYrwLqWIwPW3yftgrb8P6V6dF5hUagi9PEKvUYSvrhU9EqBpalT+odxaGp2U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJDVVCOt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJDVVCOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761221199; x=1792757199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hUFi7ajUEGwyA9WFWOg8hqEkC+eBZ37WcwEYhhy4C5g=;
  b=WJDVVCOtltwN4AiWBMGtyzL3BtQgBuMRV1DqjEjuKShFaSsO7yGcQU55
   XD8Jr1m1JGfGQmFB4rZAnAyqfkF9YJ1gQnTXV+JijkRUb1APOYEzoqkmq
   +f7hxoFF8HdD7mhRf4eOFF+lLutPnX/riEJ4cRqxa2e7NL3JPeMj4r6q3
   M5gn4WwPLKXGDXVPl3qp0CyJdhALoVqmIk7nD5jEU/CncWPJj81cIybcu
   MwcB8HbJYxNKCdQfsbq3jiIuczD0/voMSHi3LLz6QITEnK/kl29shMui0
   3asie25vumcFpuLhk1K/QFqQQA3vTASEw8/o5WcRVUmehBsL7yeJaDwcH
   A==;
X-CSE-ConnectionGUID: 3ItyAVx7Ruu26UOZB7q2Yw==
X-CSE-MsgGUID: ACqWP1d4QaaWohy4PZHfaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63483416"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="63483416"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 05:06:38 -0700
X-CSE-ConnectionGUID: 9eFg6qs1SMeFMlS1St6Exw==
X-CSE-MsgGUID: n6pGp/ZRQM+TMBAesUBZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="184622155"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2025 05:06:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBu5S-000DRw-2h;
	Thu, 23 Oct 2025 12:06:34 +0000
Date: Thu, 23 Oct 2025 20:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [tglx-devel:rseq/slice 27/75]
 include/linux/irq-entry-common.h:231:2: error: call to undeclared function
 'rseq_exit_to_user_mode'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202510231906.Uv4KWeoB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   f801ad51668e156d2b2ffd81ef990c62f1121998
commit: 4914c016f0a2755d442ad0c2f2de8a3220d2ceaa [27/75] rseq: Record interrupt from user space
config: i386-randconfig-141-20251023 (https://download.01.org/0day-ci/archive/20251023/202510231906.Uv4KWeoB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231906.Uv4KWeoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231906.Uv4KWeoB-lkp@intel.com/

Note: the tglx-devel/rseq/slice HEAD f801ad51668e156d2b2ffd81ef990c62f1121998 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/syscall_32.c:8:
   In file included from include/linux/entry-common.h:5:
>> include/linux/irq-entry-common.h:231:2: error: call to undeclared function 'rseq_exit_to_user_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     231 |         rseq_exit_to_user_mode();
         |         ^
   include/linux/irq-entry-common.h:231:2: note: did you mean 'arch_exit_to_user_mode'?
   include/linux/irq-entry-common.h:186:29: note: 'arch_exit_to_user_mode' declared here
     186 | static __always_inline void arch_exit_to_user_mode(void);
         |                             ^
   arch/x86/include/asm/entry-common.h:110:32: note: expanded from macro 'arch_exit_to_user_mode'
     110 | #define arch_exit_to_user_mode arch_exit_to_user_mode
         |                                ^
   In file included from arch/x86/entry/syscall_32.c:8:
   In file included from include/linux/entry-common.h:8:
   In file included from include/linux/resume_user_mode.h:9:
>> include/linux/rseq.h:95:20: error: static declaration of 'rseq_exit_to_user_mode' follows non-static declaration
      95 | static inline void rseq_exit_to_user_mode(void) { }
         |                    ^
   include/linux/irq-entry-common.h:231:2: note: previous implicit declaration is here
     231 |         rseq_exit_to_user_mode();
         |         ^
   In file included from arch/x86/entry/syscall_32.c:8:
   In file included from include/linux/entry-common.h:8:
   include/linux/resume_user_mode.h:62:32: error: too few arguments to function call, expected 2, have 1
      62 |         rseq_handle_notify_resume(regs);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~     ^
   include/linux/rseq.h:89:20: note: 'rseq_handle_notify_resume' declared here
      89 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs) { }
         |                    ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/rseq_exit_to_user_mode +231 include/linux/irq-entry-common.h

a70e9f647f501e3 Jinjie Ruan     2025-06-24  199  
a70e9f647f501e3 Jinjie Ruan     2025-06-24  200  /**
a70e9f647f501e3 Jinjie Ruan     2025-06-24  201   * exit_to_user_mode_loop - do any pending work before leaving to user space
a70e9f647f501e3 Jinjie Ruan     2025-06-24  202   */
a70e9f647f501e3 Jinjie Ruan     2025-06-24  203  unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
a70e9f647f501e3 Jinjie Ruan     2025-06-24  204  				     unsigned long ti_work);
a70e9f647f501e3 Jinjie Ruan     2025-06-24  205  
a70e9f647f501e3 Jinjie Ruan     2025-06-24  206  /**
a70e9f647f501e3 Jinjie Ruan     2025-06-24  207   * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
a70e9f647f501e3 Jinjie Ruan     2025-06-24  208   * @regs:	Pointer to pt_regs on entry stack
a70e9f647f501e3 Jinjie Ruan     2025-06-24  209   *
a70e9f647f501e3 Jinjie Ruan     2025-06-24  210   * 1) check that interrupts are disabled
a70e9f647f501e3 Jinjie Ruan     2025-06-24  211   * 2) call tick_nohz_user_enter_prepare()
a70e9f647f501e3 Jinjie Ruan     2025-06-24  212   * 3) call exit_to_user_mode_loop() if any flags from
a70e9f647f501e3 Jinjie Ruan     2025-06-24  213   *    EXIT_TO_USER_MODE_WORK are set
a70e9f647f501e3 Jinjie Ruan     2025-06-24  214   * 4) check that interrupts are still disabled
a70e9f647f501e3 Jinjie Ruan     2025-06-24  215   */
a70e9f647f501e3 Jinjie Ruan     2025-06-24  216  static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
a70e9f647f501e3 Jinjie Ruan     2025-06-24  217  {
a70e9f647f501e3 Jinjie Ruan     2025-06-24  218  	unsigned long ti_work;
a70e9f647f501e3 Jinjie Ruan     2025-06-24  219  
a70e9f647f501e3 Jinjie Ruan     2025-06-24  220  	lockdep_assert_irqs_disabled();
a70e9f647f501e3 Jinjie Ruan     2025-06-24  221  
a70e9f647f501e3 Jinjie Ruan     2025-06-24  222  	/* Flush pending rcuog wakeup before the last need_resched() check */
a70e9f647f501e3 Jinjie Ruan     2025-06-24  223  	tick_nohz_user_enter_prepare();
a70e9f647f501e3 Jinjie Ruan     2025-06-24  224  
a70e9f647f501e3 Jinjie Ruan     2025-06-24  225  	ti_work = read_thread_flags();
a70e9f647f501e3 Jinjie Ruan     2025-06-24  226  	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
a70e9f647f501e3 Jinjie Ruan     2025-06-24  227  		ti_work = exit_to_user_mode_loop(regs, ti_work);
a70e9f647f501e3 Jinjie Ruan     2025-06-24  228  
a70e9f647f501e3 Jinjie Ruan     2025-06-24  229  	arch_exit_to_user_mode_prepare(regs, ti_work);
a70e9f647f501e3 Jinjie Ruan     2025-06-24  230  
74af99887e00ed5 Thomas Gleixner 2025-09-08 @231  	rseq_exit_to_user_mode();
74af99887e00ed5 Thomas Gleixner 2025-09-08  232  
a70e9f647f501e3 Jinjie Ruan     2025-06-24  233  	/* Ensure that kernel state is sane for a return to userspace */
a70e9f647f501e3 Jinjie Ruan     2025-06-24  234  	kmap_assert_nomap();
a70e9f647f501e3 Jinjie Ruan     2025-06-24  235  	lockdep_assert_irqs_disabled();
a70e9f647f501e3 Jinjie Ruan     2025-06-24  236  	lockdep_sys_exit();
a70e9f647f501e3 Jinjie Ruan     2025-06-24  237  }
a70e9f647f501e3 Jinjie Ruan     2025-06-24  238  

:::::: The code at line 231 was first introduced by commit
:::::: 74af99887e00ed5697be12512e8e2539bbe10162 rseq: Avoid pointless evaluation in __rseq_notify_resume()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
