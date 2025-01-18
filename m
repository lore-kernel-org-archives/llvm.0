Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AC925A63C;
	Sat, 18 Jan 2025 00:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737161462; cv=none; b=TG0BR+PpWiv1lUyRPAaaH6kt/E/k3ke13SPYTcn9XmG7FeMGrxhSEpyr7bv48wxLcmKUKlvo6OCoEC8NmXjXIcbnd+AAdN4OC2BmLJrmnYvmy5Sd16GiLSe6WfmKl3LNr7pDArSGKDFQdkApl7N0UMMWKlv0q0z0/eZP7138hfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737161462; c=relaxed/simple;
	bh=Df6ej1tCyXg56NNvjtKkzsF5rj4/9kNo8BV7BwxC7VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITpuizoeCq6WKMFJReg2uShAkTA+QZBSuSByEJ4BPzVt6xlsLUqsJXH/g1oHgbBl1qfsUiLrPg3NZ4b6nWV6nu4j6VDpUjWBzetfDzFGnP6m1hV1hgV3AWWI8qIqEOb192Kv+pOsctj6XIw+C9nPPN1ueBMzsHMRuaVLkuNAiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FunvFfOw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FunvFfOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737161460; x=1768697460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Df6ej1tCyXg56NNvjtKkzsF5rj4/9kNo8BV7BwxC7VY=;
  b=FunvFfOw8OeO33D5Xlv10CwEg4lokmD+DxX/4HFfGTGyWWr78VfB/DwN
   mX3VvytZWS0cZopd/4m+SSeb4FLnrYVZwyMzaL9lk2belNNAbqhD/AMIL
   9TTKuqjmUvCTRj3hmNTaY15PwNSWXQG4ZhOLw4KbUDzpN2HYiodzz3XCb
   qC5jZixGzh4lRK9NRIz8KqS2JSXD6e5vNdnYINX7yPSdHbCZSt3HGuMKN
   I5ee1jR4tOaEw8CvzHwDfhHzlelguy50G6hRy4fwp8hFw35jA9PxbpvkE
   vDKR3+PZ3LJo/7MvbnHclc1kDR4fHbM8DCd/R5zfAcoL0oX95Z1GaqEEf
   Q==;
X-CSE-ConnectionGUID: SbEJogs0Tyyf32Unff326Q==
X-CSE-MsgGUID: i0QXLMqoTtScqh6d8i4bug==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37301766"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37301766"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 16:50:59 -0800
X-CSE-ConnectionGUID: kcU7d6K/QReQ8YrlEo721g==
X-CSE-MsgGUID: PV0tdzRkReiOFsSceAFk/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129217243"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2025 16:50:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYx38-000Tt9-2d;
	Sat, 18 Jan 2025 00:50:54 +0000
Date: Sat, 18 Jan 2025 08:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	hbathini@linux.ibm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.vnet.ibm.com
Subject: Re: [PATCH 1/2] arch/powerpc/perf: Check the instruction type before
 creating sample with perf_mem_data_src
Message-ID: <202501180825.LpRG6wYe-lkp@intel.com>
References: <20250113062818.33187-1-atrajeev@linux.vnet.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113062818.33187-1-atrajeev@linux.vnet.ibm.com>

Hi Athira,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.13-rc7 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Athira-Rajeev/arch-powerpc-perf-Update-get_mem_data_src-function-to-use-saved-values-of-sier-and-mmcra-regs/20250113-143059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250113062818.33187-1-atrajeev%40linux.vnet.ibm.com
patch subject: [PATCH 1/2] arch/powerpc/perf: Check the instruction type before creating sample with perf_mem_data_src
config: powerpc-gamecube_defconfig (https://download.01.org/0day-ci/archive/20250118/202501180825.LpRG6wYe-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180825.LpRG6wYe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180825.LpRG6wYe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/perf/core-book3s.c:2303:22: error: use of undeclared identifier 'ISA207_SIER_TYPE_MASK'
                   val = (regs->dar & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
                                      ^
>> arch/powerpc/perf/core-book3s.c:2303:48: error: use of undeclared identifier 'ISA207_SIER_TYPE_SHIFT'
                   val = (regs->dar & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
                                                                ^
   2 errors generated.


vim +/ISA207_SIER_TYPE_MASK +2303 arch/powerpc/perf/core-book3s.c

  2222	
  2223	#define PERF_SAMPLE_ADDR_TYPE  (PERF_SAMPLE_ADDR |		\
  2224					PERF_SAMPLE_PHYS_ADDR |		\
  2225					PERF_SAMPLE_DATA_PAGE_SIZE)
  2226	/*
  2227	 * A counter has overflowed; update its count and record
  2228	 * things if requested.  Note that interrupts are hard-disabled
  2229	 * here so there is no possibility of being interrupted.
  2230	 */
  2231	static void record_and_restart(struct perf_event *event, unsigned long val,
  2232				       struct pt_regs *regs)
  2233	{
  2234		u64 period = event->hw.sample_period;
  2235		s64 prev, delta, left;
  2236		int record = 0;
  2237	
  2238		if (event->hw.state & PERF_HES_STOPPED) {
  2239			write_pmc(event->hw.idx, 0);
  2240			return;
  2241		}
  2242	
  2243		/* we don't have to worry about interrupts here */
  2244		prev = local64_read(&event->hw.prev_count);
  2245		delta = check_and_compute_delta(prev, val);
  2246		local64_add(delta, &event->count);
  2247	
  2248		/*
  2249		 * See if the total period for this event has expired,
  2250		 * and update for the next period.
  2251		 */
  2252		val = 0;
  2253		left = local64_read(&event->hw.period_left) - delta;
  2254		if (delta == 0)
  2255			left++;
  2256		if (period) {
  2257			if (left <= 0) {
  2258				left += period;
  2259				if (left <= 0)
  2260					left = period;
  2261	
  2262				/*
  2263				 * If address is not requested in the sample via
  2264				 * PERF_SAMPLE_IP, just record that sample irrespective
  2265				 * of SIAR valid check.
  2266				 */
  2267				if (event->attr.sample_type & PERF_SAMPLE_IP)
  2268					record = siar_valid(regs);
  2269				else
  2270					record = 1;
  2271	
  2272				event->hw.last_period = event->hw.sample_period;
  2273			}
  2274			if (left < 0x80000000LL)
  2275				val = 0x80000000LL - left;
  2276		}
  2277	
  2278		write_pmc(event->hw.idx, val);
  2279		local64_set(&event->hw.prev_count, val);
  2280		local64_set(&event->hw.period_left, left);
  2281		perf_event_update_userpage(event);
  2282	
  2283		/*
  2284		 * Due to hardware limitation, sometimes SIAR could sample a kernel
  2285		 * address even when freeze on supervisor state (kernel) is set in
  2286		 * MMCR2. Check attr.exclude_kernel and address to drop the sample in
  2287		 * these cases.
  2288		 */
  2289		if (event->attr.exclude_kernel &&
  2290		    (event->attr.sample_type & PERF_SAMPLE_IP) &&
  2291		    is_kernel_addr(mfspr(SPRN_SIAR)))
  2292			record = 0;
  2293	
  2294		/*
  2295		 * SIER[46-48] presents instruction type of the sampled instruction.
  2296		 * In ISA v3.0 and before values "0" and "7" are considered reserved.
  2297		 * In ISA v3.1, value "7" has been used to indicate "larx/stcx".
  2298		 * Drop the sample if "type" has reserved values for this field with a
  2299		 * ISA version check.
  2300		 */
  2301		if (event->attr.sample_type & PERF_SAMPLE_DATA_SRC &&
  2302				ppmu->get_mem_data_src) {
> 2303			val = (regs->dar & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
  2304			if (val == 0 || (val == 7 && !cpu_has_feature(CPU_FTR_ARCH_31))) {
  2305				record = 0;
  2306				atomic64_inc(&event->lost_samples);
  2307			}
  2308		}
  2309	
  2310		/*
  2311		 * Finally record data if requested.
  2312		 */
  2313		if (record) {
  2314			struct perf_sample_data data;
  2315	
  2316			perf_sample_data_init(&data, ~0ULL, event->hw.last_period);
  2317	
  2318			if (event->attr.sample_type & PERF_SAMPLE_ADDR_TYPE)
  2319				perf_get_data_addr(event, regs, &data.addr);
  2320	
  2321			if (event->attr.sample_type & PERF_SAMPLE_BRANCH_STACK) {
  2322				struct cpu_hw_events *cpuhw;
  2323				cpuhw = this_cpu_ptr(&cpu_hw_events);
  2324				power_pmu_bhrb_read(event, cpuhw);
  2325				perf_sample_save_brstack(&data, event, &cpuhw->bhrb_stack, NULL);
  2326			}
  2327	
  2328			if (event->attr.sample_type & PERF_SAMPLE_DATA_SRC &&
  2329							ppmu->get_mem_data_src) {
  2330				ppmu->get_mem_data_src(&data.data_src, ppmu->flags, regs);
  2331				data.sample_flags |= PERF_SAMPLE_DATA_SRC;
  2332			}
  2333	
  2334			if (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE &&
  2335							ppmu->get_mem_weight) {
  2336				ppmu->get_mem_weight(&data.weight.full, event->attr.sample_type);
  2337				data.sample_flags |= PERF_SAMPLE_WEIGHT_TYPE;
  2338			}
  2339			if (perf_event_overflow(event, &data, regs))
  2340				power_pmu_stop(event, 0);
  2341		} else if (period) {
  2342			/* Account for interrupt in case of invalid SIAR */
  2343			if (perf_event_account_interrupt(event))
  2344				power_pmu_stop(event, 0);
  2345		}
  2346	}
  2347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
