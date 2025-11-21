Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9381F09A3;
	Fri, 21 Nov 2025 19:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763753088; cv=none; b=rJuIzjPIB/p1gtgMPaN0dbILn+iZsqbZz1adG+cixx+4gW7fF7vqSX8+3XcPG1OHhgSWERftuVcWMGicfGYbAS4WV1Vl9rMT4CSr0EQLFX+8R3259ru+L6z0cc3jkYHXiFpxFOthRE9+Xv03DZ2VG+Ek6YMtcdHy6Ck3rzI18ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763753088; c=relaxed/simple;
	bh=n+ZdycnKAlhjZnXNPBRiu66Un4r/NAkMG8mvS6eLJnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtY/K4Mb53LtGtatj99kGv3oyGHAjCBINuQ0K9YgVbAMJ2lS5YcqWQ8TDKnEC4fsAZM3Ay/rEFmOlM54cGrYFhXdiHyOAO1siK6zPYRjTzrIe/640GsHOzlaI/YA/4AsXYcDl5jzRxvh+zqvvXtvNATr3xORZb4UQqO2JQ8A0aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmUNKcK0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmUNKcK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763753086; x=1795289086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n+ZdycnKAlhjZnXNPBRiu66Un4r/NAkMG8mvS6eLJnw=;
  b=VmUNKcK0DZzlm4oHzGYCQSDjry8G5D/ZGiUqrhySH6W1Q3liEkaAXEhl
   Bg20YpQfEQxUHVrK64hRvQGGy/VYROZe5lG97Vb87D/4TaT9K64R+8jD3
   nkpOnmPDnGxSHgpad5ISBIy5+jx3b01yOYYu7h5a7AsvP9xYaVRlsXyq4
   kmAsCDHvuR7vu3DWk/FRgu+tnxHtXUvdelW7XwlAuRxZioshebqlclnV8
   NJNc98s4zKB3u15ou4JTed0m5MqF9rqFQe6Hr+MErVTCnFuJ1jkSxyOZu
   CHuEAd+wmvxwFlHBLSuIBCoMOC++vzXDNuv6UvgcLXxl0NrFATyF/p1pf
   g==;
X-CSE-ConnectionGUID: xR8uf0YRRDy+DW9VluEQNQ==
X-CSE-MsgGUID: vZxl8fIDQxicmHCZiOKlJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76965059"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="76965059"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 11:24:46 -0800
X-CSE-ConnectionGUID: pKa2aKFDTJqVRtdC6M+gkQ==
X-CSE-MsgGUID: J6bmILkDR9uPnQedbFqidw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="190957221"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Nov 2025 11:24:31 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMWk6-0006mt-2Y;
	Fri, 21 Nov 2025 19:24:26 +0000
Date: Sat, 22 Nov 2025 03:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] memcg: add eBPF struct ops support for memory
 charging
Message-ID: <202511220227.thU6cgqc-lkp@intel.com>
References: <15f95166c6c516f303f3092e74c88ace5164bdf0.1763457705.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15f95166c6c516f303f3092e74c88ace5164bdf0.1763457705.git.zhuhui@kylinos.cn>

Hi Hui,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/net]
[also build test ERROR on bpf-next/master bpf/master linus/master v6.18-rc6 next-20251121]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/memcg-add-eBPF-struct-ops-support-for-memory-charging/20251119-093645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/15f95166c6c516f303f3092e74c88ace5164bdf0.1763457705.git.zhuhui%40kylinos.cn
patch subject: [RFC PATCH 1/3] memcg: add eBPF struct ops support for memory charging
config: hexagon-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220227.thU6cgqc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220227.thU6cgqc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220227.thU6cgqc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:2341:14: error: assigning to 'unsigned long' from incompatible type 'void'
    2341 |         nr_reclaime = bpf_try_charge_memcg(memcg, gfp_mask, nr_pages,
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2342 |                                            mem_over_limit,
         |                                            ~~~~~~~~~~~~~~~
    2343 |                                            reclaim_options,
         |                                            ~~~~~~~~~~~~~~~~
    2344 |                                            charge_done);
         |                                            ~~~~~~~~~~~~
   1 error generated.


vim +2341 mm/memcontrol.c

  2297	
  2298	static int try_charge_memcg(struct mem_cgroup *memcg, gfp_t gfp_mask,
  2299				    unsigned int nr_pages)
  2300	{
  2301		unsigned int batch = max(MEMCG_CHARGE_BATCH, nr_pages);
  2302		int nr_retries = MAX_RECLAIM_RETRIES;
  2303		struct mem_cgroup *mem_over_limit;
  2304		struct page_counter *counter;
  2305		unsigned long nr_reclaime, nr_reclaimed;
  2306		bool passed_oom = false;
  2307		unsigned int reclaim_options = MEMCG_RECLAIM_MAY_SWAP;
  2308		bool drained = false;
  2309		bool raised_max_event = false;
  2310		unsigned long pflags;
  2311		bool allow_spinning = gfpflags_allow_spinning(gfp_mask);
  2312		bool charge_done = false;
  2313	
  2314	retry:
  2315		if (consume_stock(memcg, nr_pages))
  2316			return 0;
  2317	
  2318		if (!allow_spinning)
  2319			/* Avoid the refill and flush of the older stock */
  2320			batch = nr_pages;
  2321	
  2322		if (!do_memsw_account() ||
  2323		    page_counter_try_charge(&memcg->memsw, batch, &counter)) {
  2324			if (page_counter_try_charge(&memcg->memory, batch, &counter))
  2325				charge_done = true;
  2326			else {
  2327				if (do_memsw_account())
  2328					page_counter_uncharge(&memcg->memsw, batch);
  2329				mem_over_limit = mem_cgroup_from_counter(counter, memory);
  2330			}
  2331		} else {
  2332			mem_over_limit = mem_cgroup_from_counter(counter, memsw);
  2333			reclaim_options &= ~MEMCG_RECLAIM_MAY_SWAP;
  2334		}
  2335	
  2336		if (!charge_done && batch > nr_pages) {
  2337			batch = nr_pages;
  2338			goto retry;
  2339		}
  2340	
> 2341		nr_reclaime = bpf_try_charge_memcg(memcg, gfp_mask, nr_pages,
  2342						   mem_over_limit,
  2343						   reclaim_options,
  2344						   charge_done);
  2345	
  2346		if (charge_done)
  2347			goto done_restock;
  2348	
  2349		/*
  2350		 * Prevent unbounded recursion when reclaim operations need to
  2351		 * allocate memory. This might exceed the limits temporarily,
  2352		 * but we prefer facilitating memory reclaim and getting back
  2353		 * under the limit over triggering OOM kills in these cases.
  2354		 */
  2355		if (unlikely(current->flags & PF_MEMALLOC))
  2356			goto force;
  2357	
  2358		if (unlikely(task_in_memcg_oom(current)))
  2359			goto nomem;
  2360	
  2361		if (!gfpflags_allow_blocking(gfp_mask))
  2362			goto nomem;
  2363	
  2364		__memcg_memory_event(mem_over_limit, MEMCG_MAX, allow_spinning);
  2365		raised_max_event = true;
  2366	
  2367		psi_memstall_enter(&pflags);
  2368		nr_reclaimed = try_to_free_mem_cgroup_pages(mem_over_limit, nr_reclaime,
  2369							    gfp_mask, reclaim_options, NULL);
  2370		psi_memstall_leave(&pflags);
  2371	
  2372		if (mem_cgroup_margin(mem_over_limit) >= nr_pages)
  2373			goto retry;
  2374	
  2375		if (!drained) {
  2376			drain_all_stock(mem_over_limit);
  2377			drained = true;
  2378			goto retry;
  2379		}
  2380	
  2381		if (gfp_mask & __GFP_NORETRY)
  2382			goto nomem;
  2383		/*
  2384		 * Even though the limit is exceeded at this point, reclaim
  2385		 * may have been able to free some pages.  Retry the charge
  2386		 * before killing the task.
  2387		 *
  2388		 * Only for regular pages, though: huge pages are rather
  2389		 * unlikely to succeed so close to the limit, and we fall back
  2390		 * to regular pages anyway in case of failure.
  2391		 */
  2392		if (nr_reclaimed && nr_pages <= (1 << PAGE_ALLOC_COSTLY_ORDER))
  2393			goto retry;
  2394	
  2395		if (nr_retries--)
  2396			goto retry;
  2397	
  2398		if (gfp_mask & __GFP_RETRY_MAYFAIL)
  2399			goto nomem;
  2400	
  2401		/* Avoid endless loop for tasks bypassed by the oom killer */
  2402		if (passed_oom && task_is_dying())
  2403			goto nomem;
  2404	
  2405		/*
  2406		 * keep retrying as long as the memcg oom killer is able to make
  2407		 * a forward progress or bypass the charge if the oom killer
  2408		 * couldn't make any progress.
  2409		 */
  2410		if (mem_cgroup_oom(mem_over_limit, gfp_mask,
  2411				   get_order(nr_pages * PAGE_SIZE))) {
  2412			passed_oom = true;
  2413			nr_retries = MAX_RECLAIM_RETRIES;
  2414			goto retry;
  2415		}
  2416	nomem:
  2417		/*
  2418		 * Memcg doesn't have a dedicated reserve for atomic
  2419		 * allocations. But like the global atomic pool, we need to
  2420		 * put the burden of reclaim on regular allocation requests
  2421		 * and let these go through as privileged allocations.
  2422		 */
  2423		if (!(gfp_mask & (__GFP_NOFAIL | __GFP_HIGH)))
  2424			return -ENOMEM;
  2425	force:
  2426		/*
  2427		 * If the allocation has to be enforced, don't forget to raise
  2428		 * a MEMCG_MAX event.
  2429		 */
  2430		if (!raised_max_event)
  2431			__memcg_memory_event(mem_over_limit, MEMCG_MAX, allow_spinning);
  2432	
  2433		/*
  2434		 * The allocation either can't fail or will lead to more memory
  2435		 * being freed very soon.  Allow memory usage go over the limit
  2436		 * temporarily by force charging it.
  2437		 */
  2438		page_counter_charge(&memcg->memory, nr_pages);
  2439		if (do_memsw_account())
  2440			page_counter_charge(&memcg->memsw, nr_pages);
  2441	
  2442		return 0;
  2443	
  2444	done_restock:
  2445		if (batch > nr_pages)
  2446			refill_stock(memcg, batch - nr_pages);
  2447	
  2448		/*
  2449		 * If the hierarchy is above the normal consumption range, schedule
  2450		 * reclaim on returning to userland.  We can perform reclaim here
  2451		 * if __GFP_RECLAIM but let's always punt for simplicity and so that
  2452		 * GFP_KERNEL can consistently be used during reclaim.  @memcg is
  2453		 * not recorded as it most likely matches current's and won't
  2454		 * change in the meantime.  As high limit is checked again before
  2455		 * reclaim, the cost of mismatch is negligible.
  2456		 */
  2457		do {
  2458			bool mem_high, swap_high;
  2459	
  2460			mem_high = page_counter_read(&memcg->memory) >
  2461				READ_ONCE(memcg->memory.high);
  2462			swap_high = page_counter_read(&memcg->swap) >
  2463				READ_ONCE(memcg->swap.high);
  2464	
  2465			/* Don't bother a random interrupted task */
  2466			if (!in_task()) {
  2467				if (mem_high) {
  2468					schedule_work(&memcg->high_work);
  2469					break;
  2470				}
  2471				continue;
  2472			}
  2473	
  2474			if (mem_high || swap_high) {
  2475				/*
  2476				 * The allocating tasks in this cgroup will need to do
  2477				 * reclaim or be throttled to prevent further growth
  2478				 * of the memory or swap footprints.
  2479				 *
  2480				 * Target some best-effort fairness between the tasks,
  2481				 * and distribute reclaim work and delay penalties
  2482				 * based on how much each task is actually allocating.
  2483				 */
  2484				current->memcg_nr_pages_over_high += batch;
  2485				set_notify_resume(current);
  2486				break;
  2487			}
  2488		} while ((memcg = parent_mem_cgroup(memcg)));
  2489	
  2490		/*
  2491		 * Reclaim is set up above to be called from the userland
  2492		 * return path. But also attempt synchronous reclaim to avoid
  2493		 * excessive overrun while the task is still inside the
  2494		 * kernel. If this is successful, the return path will see it
  2495		 * when it rechecks the overage and simply bail out.
  2496		 */
  2497		if (current->memcg_nr_pages_over_high > MEMCG_CHARGE_BATCH &&
  2498		    !(current->flags & PF_MEMALLOC) &&
  2499		    gfpflags_allow_blocking(gfp_mask))
  2500			__mem_cgroup_handle_over_high(gfp_mask);
  2501		return 0;
  2502	}
  2503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
