Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE86A45974;
	Sun, 21 Apr 2024 23:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713742907; cv=none; b=g//TH5yfC7Vn8xyZJ8YfjNNotLE8/2Az7cWIrNsYl/ZZuFSCkslaK6sNVElMI7ro6QeGLo5iXHq8hLsBiGsL1H4ShDwB2FW4Y8or55hVSUESN21j5YhOt+dbgovC98Z3APMlwzWnLcFiEPw2PoXliJak4sNunDAdu4vvJUWoVqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713742907; c=relaxed/simple;
	bh=WnNruZHN5BfmR5CGYtYlhIR4IYem4T78amG2rTz85JI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kK0BzEsHv4fHjYdOVySo5KJz8T6vksHM9luDiqOqbE1POFAuZt7zEeqgvfxX9BPzUASBi/HHSrm0zXD1fuBs9QUH2X9qwOjpHLU8s8943xICsmKMn11eRAom+qsZdCjdNw4duM6Gi5mWXMTehEzfbMQieXSYfPAuwMBVyLDVPRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atDhHXO3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atDhHXO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713742905; x=1745278905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnNruZHN5BfmR5CGYtYlhIR4IYem4T78amG2rTz85JI=;
  b=atDhHXO33/4FA+OZYTEXakVmpoK8C8v8ppJWg8NSjuIDAK9415m+Lq/X
   w9kPcnU8Xlygnt5KAbuZI5lNf93TZtth8Q0OEtJKzTafwHfJy1pFFaJ1I
   +nIz42ij82yWLaPHuyQBAA5v6YYnhGPaOBOzqb12HH8vrVPTWOxzCWnJS
   pGaaSHiva36kffZpkpJQ9EjRa8Y82iIdNXPohJdp7ckMqQ/IiDDC7k30X
   uaw8bnZrVZaSyFD48mm0x3ebbejxlvIn1DrZQLH4P3OG//vdbEMr4uhpD
   tGZrGban4eoHBvjtCQkUjDAvgs2Mi6m/Vk2tfOoaxV4hOkKsYOUFq/EeB
   A==;
X-CSE-ConnectionGUID: W0IxuKRcS5G2OuwvUFyCAw==
X-CSE-MsgGUID: uoM5kbZ6S+CG7uU4UID5sQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9185217"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9185217"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 16:41:42 -0700
X-CSE-ConnectionGUID: cAppcaLeRKmQAaziG5be9Q==
X-CSE-MsgGUID: bU2HJ+53Re2lysGtY5Q9sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="23871861"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Apr 2024 16:41:41 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rygoV-000CDS-0V;
	Sun, 21 Apr 2024 23:41:39 +0000
Date: Mon, 22 Apr 2024 07:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:task/work 5/6]
 include/linux/sched/isolation.h:88:52: warning: non-void function does not
 return a value
Message-ID: <202404220757.sIAJ9dw8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git task/work
head:   4bf6e6afb803e5862efb2cc8f2585d10e2f597f2
commit: b5ed7ff8dcb5e3c63e9e3efd32f62ee871ba3f1e [5/6] sched/isolation: Introduce isolated task work
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240422/202404220757.sIAJ9dw8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404220757.sIAJ9dw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220757.sIAJ9dw8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/time/hrtimer.c:41:
>> include/linux/sched/isolation.h:88:52: warning: non-void function does not return a value [-Wreturn-type]
      88 | static inline int isolated_task_work_queue(void) { }
         |                                                    ^
   kernel/time/hrtimer.c:1655:7: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1655 |         bool expires_in_hardirq;
         |              ^
   kernel/time/hrtimer.c:278:20: warning: unused function 'is_migration_base' [-Wunused-function]
     278 | static inline bool is_migration_base(struct hrtimer_clock_base *base)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:653:19: warning: unused function 'hrtimer_hres_active' [-Wunused-function]
     653 | static inline int hrtimer_hres_active(void)
         |                   ^~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:1894:20: warning: unused function '__hrtimer_peek_ahead_timers' [-Wunused-function]
    1894 | static inline void __hrtimer_peek_ahead_timers(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +88 include/linux/sched/isolation.h

    85	
    86	extern void isolated_task_work_init(struct task_struct *tsk);
    87	#else
  > 88	static inline int isolated_task_work_queue(void) { }
    89	static inline void isolated_task_work_init(struct task_struct *tsk) { }
    90	#endif /* CONFIG_NO_HZ_FULL && CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK */
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
