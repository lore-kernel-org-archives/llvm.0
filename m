Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F55335BBB;
	Fri, 14 Aug 2026 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786715830; cv=none; b=jvSsMTFHCERL06VaUriSZN5fSrBvkcXqxgRQz8ZGzyegY5ck6iNXKVDbh7kZPZgG5FvAYUG+viqO3H9Wc+ZU46toEOXTh4DRzlUfZUCDxGGM5ev9GDA78W+X9pikWJN0GT0TT+TEv+jqtjAE6TBc6b1XvAbKDjZyZgvO9+IJi0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786715830; c=relaxed/simple;
	bh=D6DyQseefHIu9DZgQ1dva2OVkBIS793EnP9uLGMfCVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFkFuRLjZ2mZonpOuU9RVnoipR62+ljavkIN27HX1eD0C63dUsf1x0YJBxBLQ7uEFXG1bJY2YwV3kUCjIigelxo16n4UIPMCJjQ+T63zKIZV3bPTw7L1l2eAWV/1fAD59YAPc+xsU7VP7GduvR8PIsv0xhLoGvvK+w8Ga80GvCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnMbVxjN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnMbVxjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786715825; x=1818251825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D6DyQseefHIu9DZgQ1dva2OVkBIS793EnP9uLGMfCVM=;
  b=QnMbVxjNergsT2As0uT5klE6y0TgBmnpUUYEV4qQtzgE0vE2vROOJkXe
   nAl7IJ2qBnrm5H37OkZXr/s/FKUYndWdgmozmkr8d5QgNwTyK2QC16Uin
   uuXaAnpsl5QlwG1dzY12VPNMnt3xiMFeK8fSkuEJ4zyBuHh0vze75f92H
   FnjJLhhknG4hnhoSQiJPL5k3wLtOzZtyumZtx/+13GzwnJ3Y0ndHCB+GR
   4WJ3ovq1gf7wFmPh7y9lHs5jvoE2TUEMMERXttLtyq2Ks5S/laz8E0RHI
   2Aw4gIWwPJHXmyHsX10rOi02pd462krwcMTdYpiGa+5CDtANVHZc3c7n+
   A==;
X-CSE-ConnectionGUID: YZk7l1L4SdilSs+G9Xv9Ag==
X-CSE-MsgGUID: FSHCWXBARNqOY/lmX3nwjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87218173"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87218173"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 06:57:04 -0700
X-CSE-ConnectionGUID: YlqOIiufSJqOFUaTiAmIrA==
X-CSE-MsgGUID: 6i2srB89TiixPoKqjj0lSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="268087991"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2026 06:57:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wusP3-00000000Z1K-1Gu9;
	Fri, 14 Aug 2026 13:56:57 +0000
Date: Fri, 14 Aug 2026 21:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: "monios114514@outlook.com" <monios114514@outlook.com>,
	"mingo@redhat.com" <mingo@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"peterz@infradead.org" <peterz@infradead.org>,
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"bsegall@google.com" <bsegall@google.com>,
	"mgorman@suse.de" <mgorman@suse.de>,
	"vschneid@redhat.com" <vschneid@redhat.com>,
	"kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] sched/topology: fix memory leaks in allocation failure
 paths
Message-ID: <202608142104.E7fmtysw-lkp@intel.com>
References: <SL2P216MB261965EB5BCCF15723D13A76C1FE2@SL2P216MB2619.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SL2P216MB261965EB5BCCF15723D13A76C1FE2@SL2P216MB2619.KORP216.PROD.OUTLOOK.COM>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on peterz-queue/sched/core linus/master v7.2-rc7 next-20260813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/monios114514-outlook-com/sched-topology-fix-memory-leaks-in-allocation-failure-paths/20260813-171714
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/SL2P216MB261965EB5BCCF15723D13A76C1FE2%40SL2P216MB2619.KORP216.PROD.OUTLOOK.COM
patch subject: [PATCH] sched/topology: fix memory leaks in allocation failure paths
config: riscv-randconfig-002-20260814 (https://download.01.org/0day-ci/archive/20260814/202608142104.E7fmtysw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608142104.E7fmtysw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608142104.E7fmtysw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:86:
>> kernel/sched/topology.c:2364:12: warning: explicitly assigning value of variable of type 'int' to itself [-Wself-assign]
    2364 |                                 for (i = i; i >= 0; i--) {
         |                                      ~ ^ ~
   1 warning generated.


vim +/int +2364 kernel/sched/topology.c

  2310	
  2311	void sched_init_numa(int offline_node)
  2312	{
  2313		struct sched_domain_topology_level *tl;
  2314		int nr_levels, nr_node_levels;
  2315		int i, j;
  2316		int *distances, *domain_distances;
  2317		struct cpumask ***masks;
  2318	
  2319		if (sched_record_numa_dist(offline_node, numa_node_dist, &distances,
  2320					   &nr_node_levels))
  2321			return;
  2322	
  2323		if (modified_sched_node_distance()) {
  2324			if (sched_record_numa_dist(offline_node, arch_sched_node_distance,
  2325						   &domain_distances, &nr_levels)) {
  2326				kfree(distances);
  2327				return;
  2328			}
  2329		} else {
  2330			domain_distances = distances;
  2331			nr_levels = nr_node_levels;
  2332		}
  2333		rcu_assign_pointer(sched_numa_node_distance, distances);
  2334		WRITE_ONCE(sched_max_numa_distance, distances[nr_node_levels - 1]);
  2335		WRITE_ONCE(sched_numa_node_levels, nr_node_levels);
  2336	
  2337		rcu_assign_pointer(sched_domains_numa_distance, domain_distances);
  2338	
  2339		sched_domains_numa_levels = 0;
  2340	
  2341		masks = kzalloc(sizeof(void *) * nr_levels, GFP_KERNEL);
  2342		if (!masks)
  2343			goto free_distance;
  2344	
  2345		for (i = 0; i < nr_levels; i++) {
  2346			masks[i] = kzalloc(nr_node_ids * sizeof(void *), GFP_KERNEL);
  2347			if (!masks[i]) {
  2348				for (i = i - 1; i >= 0; i--) {
  2349					if (!masks[i])
  2350						continue;
  2351					for_each_cpu_node_but(j, offline_node)
  2352						kfree(masks[i][j]);
  2353					kfree(masks[i]);
  2354				}
  2355				kfree(masks);
  2356				goto free_distance;
  2357			}
  2358	
  2359			for_each_cpu_node_but(j, offline_node) {
  2360				struct cpumask *mask = kzalloc(cpumask_size(), GFP_KERNEL);
  2361				int k;
  2362	
  2363				if (!mask) {
> 2364					for (i = i; i >= 0; i--) {
  2365						if (!masks[i])
  2366							continue;
  2367						for_each_cpu_node_but(j, offline_node)
  2368							kfree(masks[i][j]);
  2369						kfree(masks[i]);
  2370					}
  2371					kfree(masks);
  2372					goto free_distance;
  2373				}
  2374	
  2375				masks[i][j] = mask;
  2376	
  2377				for_each_cpu_node_but(k, offline_node) {
  2378					if (sched_debug() &&
  2379					    (arch_sched_node_distance(j, k) !=
  2380					     arch_sched_node_distance(k, j)))
  2381						sched_numa_warn("Node-distance not symmetric");
  2382	
  2383					if (arch_sched_node_distance(j, k) >
  2384					    sched_domains_numa_distance[i])
  2385						continue;
  2386	
  2387					cpumask_or(mask, mask, cpumask_of_node(k));
  2388				}
  2389			}
  2390		}
  2391		rcu_assign_pointer(sched_domains_numa_masks, masks);
  2392	
  2393		for (i = 0; sched_domain_topology[i].mask; i++);
  2394	
  2395		tl = kzalloc((i + nr_levels + 1) *
  2396				sizeof(struct sched_domain_topology_level), GFP_KERNEL);
  2397		if (!tl) {
  2398			rcu_assign_pointer(sched_domains_numa_masks, NULL);
  2399			for (i = nr_levels - 1; i >= 0; i--) {
  2400				if (!masks[i])
  2401					continue;
  2402				for_each_cpu_node_but(j, offline_node)
  2403					kfree(masks[i][j]);
  2404				kfree(masks[i]);
  2405			}
  2406			kfree(masks);
  2407			goto free_distance;
  2408		}
  2409	
  2410		for (i = 0; sched_domain_topology[i].mask; i++)
  2411			tl[i] = sched_domain_topology[i];
  2412	
  2413		tl[i++] = SDTL_INIT(sd_numa_mask, NULL, NODE);
  2414	
  2415		for (j = 1; j < nr_levels; i++, j++) {
  2416			tl[i] = SDTL_INIT(sd_numa_mask, cpu_numa_flags, NUMA);
  2417			tl[i].numa_level = j;
  2418		}
  2419	
  2420		sched_domain_topology_saved = sched_domain_topology;
  2421		sched_domain_topology = tl;
  2422	
  2423		sched_domains_numa_levels = nr_levels;
  2424	
  2425		init_numa_topology_type(offline_node);
  2426		return;
  2427	
  2428	free_distance:
  2429		if (domain_distances != distances)
  2430			kfree(domain_distances);
  2431	}
  2432	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
