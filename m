Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CCA1D69E;
	Fri, 16 Aug 2024 08:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797605; cv=none; b=sS1Bnmd1bJShRMeyPq8xyYKgAGMC1J33epQXKBik19wCCxR56Y7FON14vuOQsy31wiZeMeqtzwVrdZ2wK1mI1xyyPECjGIr+Rm+fDn8urzKNz2gcn20H0GcE5vsZ8yVWYc40Q9vu9Og7M7KFuUJD+5Q3WLJb7YmjOWIASP7r/Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797605; c=relaxed/simple;
	bh=zgJdPsQuIzKATwJaxGKsEk+ujOluJwitq3QTp5gV358=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rWY0FM19CVi24MvxkgKLqvpaMnQb1MaX/ZJ/2uI1uSzWqiewzmoo6LNKX0VhlC8WrkLWTzHr3qAwyvRxaQoJRczlJUKQNWFrMj3W24f/fYWikU+Hh9sdc2NcbAPCRE+9/77UJh+BlvkSQw94A4SAZNSAvqlMyvULhD2b0/qbzvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIDJelX4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIDJelX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723797603; x=1755333603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zgJdPsQuIzKATwJaxGKsEk+ujOluJwitq3QTp5gV358=;
  b=VIDJelX4ELmJQOp6bZh1/YZtbYHKF56irygXjiL8413BuuXaK2K1oujO
   1/9JL6KJ9CuwxE77Az4cPesflBZ1DifUYKtQKW6O+wcWUnVPFJm4gfWr5
   QoaK4kNV0POh2RSbp5+StVWyT57rcV2rBt5t8Vq/t11yquGbb5KU63A57
   BI1Rqu9eTcIh7NzPp/RbCmLzEH2JXcDsxcImUPothtS3bDRRlSo9nouNI
   MrtYVZUgvcW9V8tE6MRjj2WE713bfFFmg5TNrT9OPGG6Dl7FKRs1h9RL7
   rrK31Uen4Dgrv6Ns1CbnSrOYOD4aU6vF65gE3298wnKreUcVpzELU+/CP
   Q==;
X-CSE-ConnectionGUID: dAT1jQxXTVK2lsL8DPMVaw==
X-CSE-MsgGUID: yrPU+ktiQdqyGvr6ioSsDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22231238"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="22231238"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 01:40:01 -0700
X-CSE-ConnectionGUID: KFGomDEIRVqHeQSBZisN9w==
X-CSE-MsgGUID: VDRb+2X+SROvDpBZxcXH9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="64457497"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Aug 2024 01:40:00 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sesV4-0006B7-0P;
	Fri, 16 Aug 2024 08:39:58 +0000
Date: Fri, 16 Aug 2024 16:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 10/19]
 include/linux/ftrace.h:264:28: error: call to undeclared function
 'ftrace_regs_get_stack_pointer'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202408161636.mIm5W04D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   d00cdb5960eaccf07cb9c52d10c67ddb44035e52
commit: 64dcf89f4462f3bb3bf5a39ddfd8c2689bbe2b88 [10/19] tracing/fprobe: Enable fprobe events with CONFIG_DYNAMIC_FTRACE_WITH_ARGS
config: riscv-randconfig-001-20240816 (https://download.01.org/0day-ci/archive/20240816/202408161636.mIm5W04D-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408161636.mIm5W04D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408161636.mIm5W04D-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   include/linux/ftrace.h:176:9: error: call to undeclared function 'arch_ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     176 |         return arch_ftrace_get_regs(fregs);
         |                ^
   include/linux/ftrace.h:176:9: note: did you mean 'ftrace_get_regs'?
   include/linux/ftrace.h:171:40: note: 'ftrace_get_regs' declared here
     171 | static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
         |                                        ^
     172 | {
     173 |         if (!fregs)
     174 |                 return NULL;
     175 | 
     176 |         return arch_ftrace_get_regs(fregs);
         |                ~~~~~~~~~~~~~~~~~~~~
         |                ftrace_get_regs
   include/linux/ftrace.h:176:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct pt_regs *' [-Wint-conversion]
     176 |         return arch_ftrace_get_regs(fregs);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ftrace.h:264:28: error: call to undeclared function 'ftrace_regs_get_stack_pointer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     264 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                                   ^
>> include/linux/ftrace.h:264:11: warning: cast to 'unsigned long *' from smaller integer type 'int' [-Wint-to-pointer-cast]
     264 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 3 errors generated.
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=3949777697
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2 shuffle=3949777697
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=3949777697
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=3949777697
   make: Target 'prepare' not remade because of errors.


vim +/ftrace_regs_get_stack_pointer +264 include/linux/ftrace.h

   170	
   171	static __always_inline struct pt_regs *ftrace_get_regs(struct ftrace_regs *fregs)
   172	{
   173		if (!fregs)
   174			return NULL;
   175	
 > 176		return arch_ftrace_get_regs(fregs);
   177	}
   178	
   179	#if !defined(CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS) || \
   180		defined(CONFIG_HAVE_PT_REGS_TO_FTRACE_REGS_CAST)
   181	
   182	static __always_inline struct pt_regs *
   183	ftrace_partial_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
   184	{
   185		/*
   186		 * If CONFIG_HAVE_PT_REGS_TO_FTRACE_REGS_CAST=y, ftrace_regs memory
   187		 * layout is the same as pt_regs. So always returns that address.
   188		 * Since arch_ftrace_get_regs() will check some members and may return
   189		 * NULL, we can not use it.
   190		 */
   191		return &fregs->regs;
   192	}
   193	
   194	#endif /* !CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS || CONFIG_HAVE_PT_REGS_TO_FTRACE_REGS_CAST */
   195	
   196	#ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
   197	
   198	/*
   199	 * Please define arch dependent pt_regs which compatible to the
   200	 * perf_arch_fetch_caller_regs() but based on ftrace_regs.
   201	 * This requires
   202	 *   - user_mode(_regs) returns false (always kernel mode).
   203	 *   - able to use the _regs for stack trace.
   204	 */
   205	#ifndef arch_ftrace_fill_perf_regs
   206	/* As same as perf_arch_fetch_caller_regs(), do nothing by default */
   207	#define arch_ftrace_fill_perf_regs(fregs, _regs) do {} while (0)
   208	#endif
   209	
   210	static __always_inline struct pt_regs *
   211	ftrace_fill_perf_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
   212	{
   213		arch_ftrace_fill_perf_regs(fregs, regs);
   214		return regs;
   215	}
   216	
   217	#else /* !CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS */
   218	
   219	static __always_inline struct pt_regs *
   220	ftrace_fill_perf_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
   221	{
   222		return &fregs->regs;
   223	}
   224	
   225	#endif
   226	
   227	/*
   228	 * When true, the ftrace_regs_{get,set}_*() functions may be used on fregs.
   229	 * Note: this can be true even when ftrace_get_regs() cannot provide a pt_regs.
   230	 */
   231	static __always_inline bool ftrace_regs_has_args(struct ftrace_regs *fregs)
   232	{
   233		if (IS_ENABLED(CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS))
   234			return true;
   235	
   236		return ftrace_get_regs(fregs) != NULL;
   237	}
   238	
   239	#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
   240	#define ftrace_regs_get_instruction_pointer(fregs) \
   241		instruction_pointer(ftrace_get_regs(fregs))
   242	#define ftrace_regs_get_argument(fregs, n) \
   243		regs_get_kernel_argument(ftrace_get_regs(fregs), n)
   244	#define ftrace_regs_get_stack_pointer(fregs) \
   245		kernel_stack_pointer(ftrace_get_regs(fregs))
   246	#define ftrace_regs_get_return_value(fregs) \
   247		regs_return_value(ftrace_get_regs(fregs))
   248	#define ftrace_regs_set_return_value(fregs, ret) \
   249		regs_set_return_value(ftrace_get_regs(fregs), ret)
   250	#define ftrace_override_function_with_return(fregs) \
   251		override_function_with_return(ftrace_get_regs(fregs))
   252	#define ftrace_regs_query_register_offset(name) \
   253		regs_query_register_offset(name)
   254	#define ftrace_regs_get_frame_pointer(fregs) \
   255		frame_pointer(&(fregs)->regs)
   256	#endif
   257	
   258	#ifdef CONFIG_HAVE_REGS_AND_STACK_ACCESS_API
   259	static __always_inline unsigned long
   260	ftrace_regs_get_kernel_stack_nth(struct ftrace_regs *fregs, unsigned int nth)
   261	{
   262		unsigned long *stackp;
   263	
 > 264		stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
   265		if (((unsigned long)(stackp + nth) & ~(THREAD_SIZE - 1)) ==
   266		    ((unsigned long)stackp & ~(THREAD_SIZE - 1)))
   267			return *(stackp + nth);
   268	
   269		return 0;
   270	}
   271	#else /* !CONFIG_HAVE_REGS_AND_STACK_ACCESS_API */
   272	#define ftrace_regs_get_kernel_stack_nth(fregs, nth)	(0L)
   273	#endif /* CONFIG_HAVE_REGS_AND_STACK_ACCESS_API */
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
