Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F526AF3;
	Wed, 29 May 2024 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717017406; cv=none; b=a40/J/xqOI9GcmsGbUK5jGBfbS6j7ao1ifP2yisAxsum3ec0BM6hZV2/dtxIiPZqQrBwXOUtK+64WNkv+tYqADnHpr3/evvFjK8WK+lmCPW34yDEBdSUBaMuK5237YOpw7XV72AjG6VVd1c1pLoLA6MYjAxo6KEXRB5EdA4OwdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717017406; c=relaxed/simple;
	bh=aRl9eNmFJZGJdj9IohaJE01Mwbt5Hsh96tkwxTyDkX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tBiUsdRAfihiN+1OsXBeWVfjqeBaSBEL+5B3UkBOYkjKEy1P9xGIjhgcmWyYsyI3qNHe9/IpBwTfHn4/xw6n/7E6ltK+8BaApXK7D20NrwnN2YYMo2r632aritSvBZE7jy0W6AMiyEj/lnz63blgE0WSVlc2otI9Dga8bH+784M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/wzguuB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/wzguuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717017405; x=1748553405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRl9eNmFJZGJdj9IohaJE01Mwbt5Hsh96tkwxTyDkX0=;
  b=n/wzguuB+0yJIOIezlyf7yZgqZVOK/nM7tA8qTDZpcYZtua0YQYF+48/
   YH5mvD783nYpzUKffy/yU5KoE+a8U3a0mt30gh2EQUDfvqzPq+6iA2Vm7
   mKGZs9zVAxSElVkLk5UQ0s1YhkLMz/9+fKl5+doMD95OxUhocxHj1UUuU
   +fxeEYbzSP7gso2mJ6bYJp5wt5laFPfDgWQfkWbDNGkl2sjhLf2apNlsh
   p4sHkzcAxP0N8Cy6/cb2HeAgljKl0E0PVYdUkoS8gK7AFnvGZVvkO3+Mm
   5Q+Ubm2oYcKcmwwoSQjk1jXJSdDxUZut4DvevMOFswoKYR44bCeXyuAXH
   w==;
X-CSE-ConnectionGUID: Sd4iJoDBS7aF1+hpHUp5Kg==
X-CSE-MsgGUID: QRu1PyYDSUOlxk3bsziHSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17289928"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="17289928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 14:16:44 -0700
X-CSE-ConnectionGUID: lHXdzQPiS4+pqkYJlY6eBw==
X-CSE-MsgGUID: cuu9iGiXRiySgEafrll9dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36116780"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2024 14:16:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCQf2-000EDe-0M;
	Wed, 29 May 2024 21:16:40 +0000
Date: Thu, 30 May 2024 05:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.10.y-rt-rebase 11/93] kernel/softirq.c:663:40:
 error: call to undeclared function 'local_pending_timers'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202405300512.kGipfc2J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.10.y-rt-rebase
head:   6d20efa57a896036453f4b061ae22601ef61b494
commit: 9105c9af2449940dbb3b9c2b98f2c9868a384410 [11/93] softirq: Use a dedicated thread for timer wakeups.
config: i386-randconfig-012-20240529 (https://download.01.org/0day-ci/archive/20240530/202405300512.kGipfc2J-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300512.kGipfc2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300512.kGipfc2J-lkp@intel.com/

Note: the rt-devel/linux-6.10.y-rt-rebase HEAD 6d20efa57a896036453f4b061ae22601ef61b494 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/softirq.c:663:40: error: call to undeclared function 'local_pending_timers'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     663 |                 if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
         |                                                      ^
   1 error generated.


vim +/local_pending_timers +663 kernel/softirq.c

   649	
   650	static inline void __irq_exit_rcu(void)
   651	{
   652	#ifndef __ARCH_IRQ_EXIT_IRQS_DISABLED
   653		local_irq_disable();
   654	#else
   655		lockdep_assert_irqs_disabled();
   656	#endif
   657		account_hardirq_exit(current);
   658		preempt_count_sub(HARDIRQ_OFFSET);
   659		if (!in_interrupt()) {
   660			if (local_softirq_pending())
   661				invoke_softirq();
   662	
 > 663			if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
   664				wake_timersd();
   665		}
   666	
   667		tick_irq_exit();
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
