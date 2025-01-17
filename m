Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C4D17555;
	Fri, 17 Jan 2025 06:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737093778; cv=none; b=KNZIK7uDd/YfVM478WAKyv3zTN2XXk8fXxHvZTa4UmJS88X9shdMmqaF5owlVK3rGXNuhm5gsdSRI9yL2dCvvnSfzAzVZ61A2MrXRm4IJYrmB2BQXueUnH9Cl0wZXz0ZhG+GYoyJb1wBmiH8c9ZfL5/2b5E4NCg5tN1df8rkeXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737093778; c=relaxed/simple;
	bh=ShY9Cf9NJ9ZcgcE/evL78rmAME3E+6A3VsnhQJ1585A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cbIvjxKZBFvkExwQ6ODnckJqU6GUWMxAGmaMXFOPu5FtKpEec3Wv7XyR5DzaQraDB9Yql7YfwpXupu1K+16oEe4VEKtnEvMOmHaqHK8E3k+Vd0xeQr6cOLHfPjHhgZiyJttj4JmdAzuCz5FbynGQf1kGcZbD3Q0f9ny6hkTd+Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhCkm/MM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhCkm/MM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737093778; x=1768629778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ShY9Cf9NJ9ZcgcE/evL78rmAME3E+6A3VsnhQJ1585A=;
  b=VhCkm/MMvd8Mn218sV5upDSbfAfY5RGA0R2aEb1+p1J99o2wJ0HdgUi6
   ErbQ7zPTFysz0CjwTi2MIlUjxjjkMVAkQ6dy+9MptEgtzPbTZxhJNSVXY
   lPt38HDN3kYJWpG1JOAE71Tfu/wZND9TIELOYMOlsP1ErjG+AxUw100Mn
   mPXlHDsBIPbo0KM2WZQxGNxzxsu7zV8B5gbed+0coW7AcyIYZ04c75/w0
   DaXzt+5ybKo1r7pxuc+8NrjDGHmx61SFDF83veqeNq809lM+Gccus5aYd
   koGCXVBIvOubB9HaKhNAST7YYeohhD+bcmlWmJQ7j0BAzq27a8OOc8Qn/
   w==;
X-CSE-ConnectionGUID: q5Xcr1bJS+aFslCwuQEgfg==
X-CSE-MsgGUID: /Ojith+eTNihZMmqpcsznQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="41192934"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="41192934"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 22:02:57 -0800
X-CSE-ConnectionGUID: Hg6hTSfxQU2JtuRJ/hmrqA==
X-CSE-MsgGUID: 5Yul5vzoSLWJl9V5vMBQow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109787409"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jan 2025 22:02:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYfRU-000SpJ-1J;
	Fri, 17 Jan 2025 06:02:52 +0000
Date: Fri, 17 Jan 2025 14:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 27/36] include/linux/entry-common.h:366:2: error:
 call to undeclared function 'unwind_exit_to_user_mode'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202501171355.k9haynay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   dc92bc7c1009e5d80cd83d21ead7228bc6887c23
commit: 0b9c279e2f1ea50bbb9d78c3a3744e2d4df4a441 [27/36] unwind: Add deferred userspace unwinding API
config: i386-buildonly-randconfig-001-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171355.k9haynay-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171355.k9haynay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171355.k9haynay-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/mm/fault.c:11:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/x86/mm/fault.c:26:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:15:
   include/linux/unwind_deferred.h:49:6: warning: no previous prototype for function 'unwind_deferred_cancel' [-Wmissing-prototypes]
      49 | bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
         |      ^
   include/linux/unwind_deferred.h:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      49 | bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
         | ^
         | static 
   In file included from arch/x86/mm/fault.c:26:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
>> include/linux/entry-common.h:366:2: error: call to undeclared function 'unwind_exit_to_user_mode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     366 |         unwind_exit_to_user_mode();
         |         ^
   include/linux/entry-common.h:366:2: note: did you mean 'arch_exit_to_user_mode'?
   include/linux/entry-common.h:290:29: note: 'arch_exit_to_user_mode' declared here
     290 | static __always_inline void arch_exit_to_user_mode(void);
         |                             ^
   arch/x86/include/asm/entry-common.h:102:32: note: expanded from macro 'arch_exit_to_user_mode'
     102 | #define arch_exit_to_user_mode arch_exit_to_user_mode
         |                                ^
   2 warnings and 1 error generated.


vim +/unwind_exit_to_user_mode +366 include/linux/entry-common.h

   340	
   341	/**
   342	 * exit_to_user_mode - Fixup state when exiting to user mode
   343	 *
   344	 * Syscall/interrupt exit enables interrupts, but the kernel state is
   345	 * interrupts disabled when this is invoked. Also tell RCU about it.
   346	 *
   347	 * 1) Trace interrupts on state
   348	 * 2) Invoke context tracking if enabled to adjust RCU state
   349	 * 3) Invoke architecture specific last minute exit code, e.g. speculation
   350	 *    mitigations, etc.: arch_exit_to_user_mode()
   351	 * 4) Tell lockdep that interrupts are enabled
   352	 *
   353	 * Invoked from architecture specific code when syscall_exit_to_user_mode()
   354	 * is not suitable as the last step before returning to userspace. Must be
   355	 * invoked with interrupts disabled and the caller must be
   356	 * non-instrumentable.
   357	 * The caller has to invoke syscall_exit_to_user_mode_work() before this.
   358	 */
   359	static __always_inline void exit_to_user_mode(void)
   360	{
   361		instrumentation_begin();
   362		trace_hardirqs_on_prepare();
   363		lockdep_hardirqs_on_prepare();
   364		instrumentation_end();
   365	
 > 366		unwind_exit_to_user_mode();
   367		user_enter_irqoff();
   368		arch_exit_to_user_mode();
   369		lockdep_hardirqs_on(CALLER_ADDR0);
   370	}
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
