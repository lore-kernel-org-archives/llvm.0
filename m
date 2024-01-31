Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2192717BD1;
	Wed, 31 Jan 2024 04:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706676025; cv=none; b=Cis5tAnOuWo8dGRtvF+hPqVaJBzSnT4dbG2HP/M9s6qPckY7KV9Tmw9ep9/vOJ7mwC0e84ua0Sk3MNj3GKmOl9Eze77S0n/zaEwl+83s40FJBJM9VTBNeBY3gterOZeTiRW8oB3h5Eq1Y0LAVPRzztpbOxfBUDFNA/I5Mv2Ylfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706676025; c=relaxed/simple;
	bh=EiXd/VelQ+3ENWSEAqwlyMx7RrnNmnwxZNt1ZUJz0PM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKalsz4QxssR2cQA0TVKANvkWHPnNA4U/hFl8aFRQ/UNoPam+Xr4agpqwmDQwLEvO54R9SPfPDocK1RLEKpzwBL0YFzlnQ5DQTAvC6BUcKqKrrposf6ZaJPpwmY8E7H4ddiy8oToLPfECHvhjnmAvO7lupCYh1CKtWSM3xRUXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2YhoV5r; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2YhoV5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706676023; x=1738212023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EiXd/VelQ+3ENWSEAqwlyMx7RrnNmnwxZNt1ZUJz0PM=;
  b=e2YhoV5rzG7PVMPfzt747WR9TTfHpNU3duzarvdX4gP4vqCqDdnnqY0t
   /MjDnDI7vFTqIDTpHV3A5yFQa8L11B6BfAB74vUUD5CrOYcPSi2R/bMqS
   JuA46ZzUx18ncBXWXjbVv6PQAtUL7gPJwR4ZixkcDOeEZYrnS/XqNZcb/
   hzPaiOHEur4Bcobj/GRxP5lcpyMAmFsAGjy3AoTK0MYOKpnIfHJzsRLA7
   7GAuQEmyiXDgFP6+Eg3mnaRkVuwX7QC8KOh8AeOvZ24Iqv4FiMFl19yI1
   mguwlGnBsBU3BGAY50vyrGkb2/xu+xEuJOUlI/hXBSWWvVisGGc8dQYbZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434657372"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="434657372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 20:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36734820"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2024 20:40:16 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV2OR-00018w-3A;
	Wed, 31 Jan 2024 04:40:12 +0000
Date: Wed, 31 Jan 2024 12:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>, Honggyu Kim <honggyu.kim@sk.com>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>,
	Srinivasulu Thanneeru <sthanneeru.opensrc@micron.com>,
	Ravi Jonnalagadda <ravis.opensrc@micron.com>
Subject: [gmprice:weighted_interleave-next 3/3] mm/mempolicy.c:2415:34:
 warning: variable 'next_node' is uninitialized when used here
Message-ID: <202401311232.MSZXYoFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux weighted_interleave-next
head:   8b894625fd0b7f702c0aa6e14bb673c59f42effc
commit: 8b894625fd0b7f702c0aa6e14bb673c59f42effc [3/3] mm/mempolicy: introduce MPOL_WEIGHTED_INTERLEAVE for weighted interleaving
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240131/202401311232.MSZXYoFZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fdac7d0b6f74f919d319b31a0680c77f66732586)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311232.MSZXYoFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311232.MSZXYoFZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mempolicy.c:2415:34: warning: variable 'next_node' is uninitialized when used here [-Wuninitialized]
    2415 |                         me->il_weight = get_il_weight(next_node);
         |                                                       ^~~~~~~~~
   mm/mempolicy.c:2385:29: note: initialize the variable 'next_node' to silence this warning
    2385 |         int nnodes, node, next_node;
         |                                    ^
         |                                     = 0
   1 warning generated.


vim +/next_node +2415 mm/mempolicy.c

  2371	
  2372	static unsigned long alloc_pages_bulk_array_weighted_interleave(gfp_t gfp,
  2373			struct mempolicy *pol, unsigned long nr_pages,
  2374			struct page **page_array)
  2375	{
  2376		struct task_struct *me = current;
  2377		unsigned long total_allocated = 0;
  2378		unsigned long nr_allocated = 0;
  2379		unsigned long rounds;
  2380		unsigned long node_pages, delta;
  2381		u8 __rcu *table, *weights, weight;
  2382		unsigned int weight_total = 0;
  2383		unsigned long rem_pages = nr_pages;
  2384		nodemask_t nodes;
  2385		int nnodes, node, next_node;
  2386		int resume_node = MAX_NUMNODES - 1;
  2387		u8 resume_weight = 0;
  2388		int prev_node;
  2389		int i;
  2390	
  2391		if (!nr_pages)
  2392			return 0;
  2393	
  2394		nnodes = read_once_policy_nodemask(pol, &nodes);
  2395		if (!nnodes)
  2396			return 0;
  2397	
  2398		/* Continue allocating from most recent node and adjust the nr_pages */
  2399		node = me->il_prev;
  2400		weight = me->il_weight;
  2401		if (weight && node_isset(node, nodes)) {
  2402			node_pages = min(rem_pages, weight);
  2403			nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
  2404							  NULL, page_array);
  2405			page_array += nr_allocated;
  2406			total_allocated += nr_allocated;
  2407			/* if that's all the pages, no need to interleave */
  2408			if (rem_pages < weight) {
  2409				/* stay on current node, adjust il_weight */
  2410				me->il_weight -= rem_pages;
  2411				return total_allocated;
  2412			} else if (rem_pages == weight) {
  2413				/* move to next node / weight */
  2414				me->il_prev = next_node_in(node, nodes);
> 2415				me->il_weight = get_il_weight(next_node);
  2416				return total_allocated;
  2417			}
  2418			/* Otherwise we adjust remaining pages, continue from there */
  2419			rem_pages -= weight;
  2420		}
  2421		/* clear active weight in case of an allocation failure */
  2422		me->il_weight = 0;
  2423		prev_node = node;
  2424	
  2425		/* create a local copy of node weights to operate on outside rcu */
  2426		weights = kzalloc(nr_node_ids, GFP_KERNEL);
  2427		if (!weights)
  2428			return total_allocated;
  2429	
  2430		rcu_read_lock();
  2431		table = rcu_dereference(iw_table);
  2432		if (table)
  2433			memcpy(weights, table, nr_node_ids);
  2434		rcu_read_unlock();
  2435	
  2436		/* calculate total, detect system default usage */
  2437		for_each_node_mask(node, nodes) {
  2438			if (!weights[node])
  2439				weights[node] = 1;
  2440			weight_total += weights[node];
  2441		}
  2442	
  2443		/*
  2444		 * Calculate rounds/partial rounds to minimize __alloc_pages_bulk calls.
  2445		 * Track which node weighted interleave should resume from.
  2446		 *
  2447		 * if (rounds > 0) and (delta == 0), resume_node will always be
  2448		 * the node following prev_node and its weight.
  2449		 */
  2450		rounds = rem_pages / weight_total;
  2451		delta = rem_pages % weight_total;
  2452		resume_node = next_node_in(prev_node, nodes);
  2453		resume_weight = weights[resume_node];
  2454		for (i = 0; i < nnodes; i++) {
  2455			node = next_node_in(prev_node, nodes);
  2456			weight = weights[node];
  2457			node_pages = weight * rounds;
  2458			/* If a delta exists, add this node's portion of the delta */
  2459			if (delta > weight) {
  2460				node_pages += weight;
  2461				delta -= weight;
  2462			} else if (delta) {
  2463				node_pages += delta;
  2464				/* delta may deplete on a boundary or w/ a remainder */
  2465				if (delta == weight) {
  2466					/* boundary: resume from next node/weight */
  2467					resume_node = next_node_in(node, nodes);
  2468					resume_weight = weights[resume_node];
  2469				} else {
  2470					/* remainder: resume this node w/ remainder */
  2471					resume_node = node;
  2472					resume_weight = weight - delta;
  2473				}
  2474				delta = 0;
  2475			}
  2476			/* node_pages can be 0 if an allocation fails and rounds == 0 */
  2477			if (!node_pages)
  2478				break;
  2479			nr_allocated = __alloc_pages_bulk(gfp, node, NULL, node_pages,
  2480							  NULL, page_array);
  2481			page_array += nr_allocated;
  2482			total_allocated += nr_allocated;
  2483			if (total_allocated == nr_pages)
  2484				break;
  2485			prev_node = node;
  2486		}
  2487		me->il_prev = resume_node;
  2488		me->il_weight = resume_weight;
  2489		kfree(weights);
  2490		return total_allocated;
  2491	}
  2492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
