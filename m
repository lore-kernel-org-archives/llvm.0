Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DA5235BF5;
	Mon, 13 Jan 2025 09:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736761585; cv=none; b=rkwkdtsipTQa1o1h4thubDqe8sjSNQzrwhw35NQ0Cxr9xs5rzlvnEwsDy6RDkGGHRZ9eY1Az7ZgAiqExUAQ63UCuXQ94GM2RwweGicCGNW3BXCIQgeWodGw+n4/xJzWC98XFx15yPooBio9uMfxVM+jdJ7PInqhII9wjdMSuVog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736761585; c=relaxed/simple;
	bh=FDkhtEmu4sK9PKqGIFanAodedTF9nXkHJEJ8tLAR2Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGhkcHrkEDEC5QpIL0REKhHZ/j0cybubK8bOWDexRpGU5NF608KLobw/Ivr8OcFKqGuqvZFoy0CYRM9D+nKW6ngCj6R4YUe/FHFLUZED7z9in3oNkeT5IfmhbD4o8Z/oerMjIGbAx2WMyH88vC9UGZda6yASwBIIX6N9aMhY/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMJ9Y40J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMJ9Y40J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736761583; x=1768297583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FDkhtEmu4sK9PKqGIFanAodedTF9nXkHJEJ8tLAR2Ew=;
  b=hMJ9Y40JtCSPB3Mx5MOAzzbhxgCO4pY2j87iLeMoe5zDckrh4h6V1bHV
   DWWVnyacLZKlT+uEQBRWuxFOvQQL+SNwgdkrq/mLg3BM+YPzo5i0N/QA2
   ZVzIDLpBpN/utfbURvUn9ltYuZhuydbxcTT4q/P5cz4U6gXzSuOuYOHp4
   YHz15pkwZlCDjhnISQqY+jS0P0M3O41wdcojyquSKJpGqflfNo2MU5mEs
   ByYI7x0iPttK1zXkafWGrTkbft/3salyHkAAXcV7YIFvE64JfgBVMOxL/
   /5YLfrjARGRS8HRA6+/Ce/twg+u/RIuzI1kaYA3HsIxxPtLbCS0xt5eeP
   A==;
X-CSE-ConnectionGUID: TvozRTzZTuy2SAsFZt5XLg==
X-CSE-MsgGUID: IqlAsxDhS9ORafCoubw+lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="39828267"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39828267"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 01:46:22 -0800
X-CSE-ConnectionGUID: ujf3P+vVTeu5cbC9n3bvMw==
X-CSE-MsgGUID: fSOZWjVpQ0yD0KZzpXhfbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105290145"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jan 2025 01:46:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXH1W-000MyU-0x;
	Mon, 13 Jan 2025 09:46:18 +0000
Date: Mon, 13 Jan 2025 17:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] cpumask: Implement "random" version of
 cpumask_any_but()
Message-ID: <202501131709.T02YI6Rr-lkp@intel.com>
References: <20250113061839.22131-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113061839.22131-1-richard120310@gmail.com>

Hi Hsin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc7 next-20250113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/I-Hsin-Cheng/cpumask-Implement-random-version-of-cpumask_any_but/20250113-142111
base:   linus/master
patch link:    https://lore.kernel.org/r/20250113061839.22131-1-richard120310%40gmail.com
patch subject: [RFC PATCH] cpumask: Implement "random" version of cpumask_any_but()
config: i386-buildonly-randconfig-001-20250113 (https://download.01.org/0day-ci/archive/20250113/202501131709.T02YI6Rr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501131709.T02YI6Rr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131709.T02YI6Rr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
>> include/linux/cpumask.h:407:11: error: call to undeclared function 'cpumask_weight'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     407 |         weight = cpumask_weight(mask);
         |                  ^
>> include/linux/cpumask.h:408:6: error: call to undeclared function 'get_random_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     408 |         n = get_random_u32() % weight;
         |             ^
>> include/linux/cpumask.h:415:6: error: call to undeclared function 'cpumask_nth'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     415 |         i = cpumask_nth(n, mask);
         |             ^
   include/linux/cpumask.h:415:6: note: did you mean 'cpumask_next'?
   include/linux/cpumask.h:217:14: note: 'cpumask_next' declared here
     217 | unsigned int cpumask_next(int n, const struct cpumask *srcp)
         |              ^
>> include/linux/cpumask.h:450:14: error: static declaration of 'cpumask_nth' follows non-static declaration
     450 | unsigned int cpumask_nth(unsigned int cpu, const struct cpumask *srcp)
         |              ^
   include/linux/cpumask.h:415:6: note: previous implicit declaration is here
     415 |         i = cpumask_nth(n, mask);
         |             ^
>> include/linux/cpumask.h:779:37: error: static declaration of 'cpumask_weight' follows non-static declaration
     779 | static __always_inline unsigned int cpumask_weight(const struct cpumask *srcp)
         |                                     ^
   include/linux/cpumask.h:407:11: note: previous implicit declaration is here
     407 |         weight = cpumask_weight(mask);
         |                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:18:
   In file included from include/linux/nodemask.h:98:
>> include/linux/random.h:42:5: error: conflicting types for 'get_random_u32'
      42 | u32 get_random_u32(void);
         |     ^
   include/linux/cpumask.h:408:6: note: previous implicit declaration is here
     408 |         n = get_random_u32() % weight;
         |             ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:


vim +/cpumask_weight +407 include/linux/cpumask.h

   317	
   318	/**
   319	 * for_each_cpu_wrap - iterate over every cpu in a mask, starting at a specified location
   320	 * @cpu: the (optionally unsigned) integer iterator
   321	 * @mask: the cpumask pointer
   322	 * @start: the start location
   323	 *
   324	 * The implementation does not assume any bit in @mask is set (including @start).
   325	 *
   326	 * After the loop, cpu is >= nr_cpu_ids.
   327	 */
   328	#define for_each_cpu_wrap(cpu, mask, start)				\
   329		for_each_set_bit_wrap(cpu, cpumask_bits(mask), small_cpumask_bits, start)
   330	
   331	/**
   332	 * for_each_cpu_and - iterate over every cpu in both masks
   333	 * @cpu: the (optionally unsigned) integer iterator
   334	 * @mask1: the first cpumask pointer
   335	 * @mask2: the second cpumask pointer
   336	 *
   337	 * This saves a temporary CPU mask in many places.  It is equivalent to:
   338	 *	struct cpumask tmp;
   339	 *	cpumask_and(&tmp, &mask1, &mask2);
   340	 *	for_each_cpu(cpu, &tmp)
   341	 *		...
   342	 *
   343	 * After the loop, cpu is >= nr_cpu_ids.
   344	 */
   345	#define for_each_cpu_and(cpu, mask1, mask2)				\
   346		for_each_and_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
   347	
   348	/**
   349	 * for_each_cpu_andnot - iterate over every cpu present in one mask, excluding
   350	 *			 those present in another.
   351	 * @cpu: the (optionally unsigned) integer iterator
   352	 * @mask1: the first cpumask pointer
   353	 * @mask2: the second cpumask pointer
   354	 *
   355	 * This saves a temporary CPU mask in many places.  It is equivalent to:
   356	 *	struct cpumask tmp;
   357	 *	cpumask_andnot(&tmp, &mask1, &mask2);
   358	 *	for_each_cpu(cpu, &tmp)
   359	 *		...
   360	 *
   361	 * After the loop, cpu is >= nr_cpu_ids.
   362	 */
   363	#define for_each_cpu_andnot(cpu, mask1, mask2)				\
   364		for_each_andnot_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
   365	
   366	/**
   367	 * for_each_cpu_or - iterate over every cpu present in either mask
   368	 * @cpu: the (optionally unsigned) integer iterator
   369	 * @mask1: the first cpumask pointer
   370	 * @mask2: the second cpumask pointer
   371	 *
   372	 * This saves a temporary CPU mask in many places.  It is equivalent to:
   373	 *	struct cpumask tmp;
   374	 *	cpumask_or(&tmp, &mask1, &mask2);
   375	 *	for_each_cpu(cpu, &tmp)
   376	 *		...
   377	 *
   378	 * After the loop, cpu is >= nr_cpu_ids.
   379	 */
   380	#define for_each_cpu_or(cpu, mask1, mask2)				\
   381		for_each_or_bit(cpu, cpumask_bits(mask1), cpumask_bits(mask2), small_cpumask_bits)
   382	
   383	/**
   384	 * for_each_cpu_from - iterate over CPUs present in @mask, from @cpu to the end of @mask.
   385	 * @cpu: the (optionally unsigned) integer iterator
   386	 * @mask: the cpumask pointer
   387	 *
   388	 * After the loop, cpu is >= nr_cpu_ids.
   389	 */
   390	#define for_each_cpu_from(cpu, mask)				\
   391		for_each_set_bit_from(cpu, cpumask_bits(mask), small_cpumask_bits)
   392	
   393	/**
   394	 * cpumask_any_but - return a "random" in a cpumask, but not this one.
   395	 * @mask: the cpumask to search
   396	 * @cpu: the cpu to ignore.
   397	 *
   398	 * Often used to find any cpu but smp_processor_id() in a mask.
   399	 * Return: >= nr_cpu_ids if no cpus set.
   400	 */
   401	static __always_inline
   402	unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
   403	{
   404		unsigned int i, n, weight;
   405	
   406		cpumask_check(cpu);
 > 407		weight = cpumask_weight(mask);
 > 408		n = get_random_u32() % weight;
   409	
   410		/* If we accidentally pick "n" equal to "cpu",
   411		 * then simply choose "n + 1"th cpu.
   412		 */
   413		if (n == cpu)
   414			n = (n + 1) % weight;
 > 415		i = cpumask_nth(n, mask);
   416		return i;
   417	}
   418	
   419	/**
   420	 * cpumask_any_and_but - pick a "random" cpu from *mask1 & *mask2, but not this one.
   421	 * @mask1: the first input cpumask
   422	 * @mask2: the second input cpumask
   423	 * @cpu: the cpu to ignore
   424	 *
   425	 * Returns >= nr_cpu_ids if no cpus set.
   426	 */
   427	static __always_inline
   428	unsigned int cpumask_any_and_but(const struct cpumask *mask1,
   429					 const struct cpumask *mask2,
   430					 unsigned int cpu)
   431	{
   432		unsigned int i;
   433	
   434		cpumask_check(cpu);
   435		i = cpumask_first_and(mask1, mask2);
   436		if (i != cpu)
   437			return i;
   438	
   439		return cpumask_next_and(cpu, mask1, mask2);
   440	}
   441	
   442	/**
   443	 * cpumask_nth - get the Nth cpu in a cpumask
   444	 * @srcp: the cpumask pointer
   445	 * @cpu: the Nth cpu to find, starting from 0
   446	 *
   447	 * Return: >= nr_cpu_ids if such cpu doesn't exist.
   448	 */
   449	static __always_inline
 > 450	unsigned int cpumask_nth(unsigned int cpu, const struct cpumask *srcp)
   451	{
   452		return find_nth_bit(cpumask_bits(srcp), small_cpumask_bits, cpumask_check(cpu));
   453	}
   454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
