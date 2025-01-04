Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C2C8F0;
	Sat,  4 Jan 2025 04:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735966321; cv=none; b=RBRZ5nJXS/6Ljoc/486DE4F//QIEhJM1/OeJ/wyzkNMVVfUUAzsCpLzQEMxkf6GnC4dqFUP/22NX6mD0aqNW5Vs0FdQd+Yb90y6CNe+M9zhL1Kz8+Hg+XjK6wzCyqo4sexFcvci4iF9JpjOimpxUNGH8wa6wiZLODPyBHkQVwZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735966321; c=relaxed/simple;
	bh=1VejVXvr4Yy7KAb6dLxQSgB4/UXaiyhZueUCS1ti+gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iG4AaEo7W2JaW16vHEuxC2V6sOLmu0BZ8fh4MR55rMi4XmEc9q8+kdUuY4jLxYndqo+0ZNwD7LN6XcRWfBkJtTm99Td0OvVutBRR2kq7QUmbGlyWjGRtv7jg8qhgisLCIvJc31qeZ8O3rNpsQX7FGQu5XitGmrwIxv80BsTagPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkKwvDw2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkKwvDw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735966320; x=1767502320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1VejVXvr4Yy7KAb6dLxQSgB4/UXaiyhZueUCS1ti+gQ=;
  b=PkKwvDw2pae/wuh8C+GdvdF9IAbepykt67K5Gkw25pOYm10K6JCBRd6V
   2n5fbqvSKUUxA7WpxWFgvEhIII9hiI6BqJa1A7MCsIvOTn2ahOjsk14Ii
   wR7LGiOlySG2EvGVeFl2xYb+BmI05gKlk2YKdCCEVdJBf2DISF2BbUqM9
   KT45Q+bSE0N3ovGKrjIGydC0MZxGhs0RW5cdqzzPt9Z/e/1WMGfPY1Shy
   CBr+OEmE5Bc4lNLwcknHdckP8QkIEDuVYKHy8yPi9d51lRJGoTtTzNlbt
   n+5WhPZedaoFzxSwxSo3rNV7QJcwx63058MM1nXHISvtipyb0ELbbDwOC
   Q==;
X-CSE-ConnectionGUID: 6ZjEW2CSR9CZ/QhbJPaz6w==
X-CSE-MsgGUID: C/olNnhsQLKJB156Nqguow==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46701205"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="46701205"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 20:51:59 -0800
X-CSE-ConnectionGUID: Y2S2uSiUQHebUrq/rziqxQ==
X-CSE-MsgGUID: B3c8RI+5TqKahq/J6oCPLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102446465"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Jan 2025 20:51:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTw8h-000AcX-2x;
	Sat, 04 Jan 2025 04:51:55 +0000
Date: Sat, 4 Jan 2025 12:51:31 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] test: add sysctl for folio copy tests and adjust
 NR_MAX_BATCHED_MIGRATION
Message-ID: <202501041224.wjWZ3pHL-lkp@intel.com>
References: <20250103172419.4148674-6-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103172419.4148674-6-ziy@nvidia.com>

Hi Zi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master sysctl/sysctl-next v6.13-rc5 next-20241220]
[cannot apply to mcgrof/sysctl-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-separate-move-undo-doing-on-folio-list-from-migrate_pages_batch/20250104-012955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250103172419.4148674-6-ziy%40nvidia.com
patch subject: [RFC PATCH 5/5] test: add sysctl for folio copy tests and adjust NR_MAX_BATCHED_MIGRATION
config: i386-buildonly-randconfig-001-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041224.wjWZ3pHL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041224.wjWZ3pHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041224.wjWZ3pHL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sysctl.c:2096:13: error: use of undeclared identifier 'use_mt_copy'
    2096 |                 .data           = &use_mt_copy,
         |                                    ^
   kernel/sysctl.c:2097:21: error: use of undeclared identifier 'use_mt_copy'
    2097 |                 .maxlen         = sizeof(use_mt_copy),
         |                                          ^
>> kernel/sysctl.c:2105:13: error: use of undeclared identifier 'limit_mt_num'
    2105 |                 .data           = &limit_mt_num,
         |                                    ^
   kernel/sysctl.c:2106:21: error: use of undeclared identifier 'limit_mt_num'
    2106 |                 .maxlen         = sizeof(limit_mt_num),
         |                                          ^
>> kernel/sysctl.c:2114:13: error: use of undeclared identifier 'push_0_pull_1'
    2114 |                 .data           = &push_0_pull_1,
         |                                    ^
   kernel/sysctl.c:2115:21: error: use of undeclared identifier 'push_0_pull_1'
    2115 |                 .maxlen         = sizeof(push_0_pull_1),
         |                                          ^
>> kernel/sysctl.c:2268:2: error: invalid application of 'sizeof' to an incomplete type 'struct ctl_table[]'
    2268 |         register_sysctl_init("vm", vm_table);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:234:46: note: expanded from macro 'register_sysctl_init'
     234 |         __register_sysctl_init(path, table, #table, ARRAY_SIZE(table))
         |                                                     ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   7 errors generated.


vim +/use_mt_copy +2096 kernel/sysctl.c

  2032	
  2033	static struct ctl_table vm_table[] = {
  2034		{
  2035			.procname	= "overcommit_memory",
  2036			.data		= &sysctl_overcommit_memory,
  2037			.maxlen		= sizeof(sysctl_overcommit_memory),
  2038			.mode		= 0644,
  2039			.proc_handler	= overcommit_policy_handler,
  2040			.extra1		= SYSCTL_ZERO,
  2041			.extra2		= SYSCTL_TWO,
  2042		},
  2043		{
  2044			.procname	= "overcommit_ratio",
  2045			.data		= &sysctl_overcommit_ratio,
  2046			.maxlen		= sizeof(sysctl_overcommit_ratio),
  2047			.mode		= 0644,
  2048			.proc_handler	= overcommit_ratio_handler,
  2049		},
  2050		{
  2051			.procname	= "overcommit_kbytes",
  2052			.data		= &sysctl_overcommit_kbytes,
  2053			.maxlen		= sizeof(sysctl_overcommit_kbytes),
  2054			.mode		= 0644,
  2055			.proc_handler	= overcommit_kbytes_handler,
  2056		},
  2057		{
  2058			.procname	= "page-cluster",
  2059			.data		= &page_cluster,
  2060			.maxlen		= sizeof(int),
  2061			.mode		= 0644,
  2062			.proc_handler	= proc_dointvec_minmax,
  2063			.extra1		= SYSCTL_ZERO,
  2064			.extra2		= (void *)&page_cluster_max,
  2065		},
  2066		{
  2067			.procname	= "dirtytime_expire_seconds",
  2068			.data		= &dirtytime_expire_interval,
  2069			.maxlen		= sizeof(dirtytime_expire_interval),
  2070			.mode		= 0644,
  2071			.proc_handler	= dirtytime_interval_handler,
  2072			.extra1		= SYSCTL_ZERO,
  2073		},
  2074		{
  2075			.procname	= "swappiness",
  2076			.data		= &vm_swappiness,
  2077			.maxlen		= sizeof(vm_swappiness),
  2078			.mode		= 0644,
  2079			.proc_handler	= proc_dointvec_minmax,
  2080			.extra1		= SYSCTL_ZERO,
  2081			.extra2		= SYSCTL_TWO_HUNDRED,
  2082		},
  2083	#ifdef CONFIG_NUMA
  2084		{
  2085			.procname	= "numa_stat",
  2086			.data		= &sysctl_vm_numa_stat,
  2087			.maxlen		= sizeof(int),
  2088			.mode		= 0644,
  2089			.proc_handler	= sysctl_vm_numa_stat_handler,
  2090			.extra1		= SYSCTL_ZERO,
  2091			.extra2		= SYSCTL_ONE,
  2092		},
  2093	#endif
  2094		{
  2095			.procname	= "use_mt_copy",
> 2096			.data		= &use_mt_copy,
  2097			.maxlen		= sizeof(use_mt_copy),
  2098			.mode		= 0644,
  2099			.proc_handler	= proc_dointvec_minmax,
  2100			.extra1		= SYSCTL_ZERO,
  2101			.extra2		= SYSCTL_ONE,
  2102		},
  2103		{
  2104			.procname	= "limit_mt_num",
> 2105			.data		= &limit_mt_num,
  2106			.maxlen		= sizeof(limit_mt_num),
  2107			.mode		= 0644,
  2108			.proc_handler	= proc_dointvec_minmax,
  2109			.extra1		= SYSCTL_ONE,
  2110			.extra2		= SYSCTL_32,
  2111		},
  2112		{
  2113			.procname	= "push_0_pull_1",
> 2114			.data		= &push_0_pull_1,
  2115			.maxlen		= sizeof(push_0_pull_1),
  2116			.mode		= 0644,
  2117			.proc_handler	= proc_dointvec_minmax,
  2118			.extra1		= SYSCTL_ZERO,
  2119			.extra2		= SYSCTL_ONE,
  2120		},
  2121		{
  2122			.procname	= "drop_caches",
  2123			.data		= &sysctl_drop_caches,
  2124			.maxlen		= sizeof(int),
  2125			.mode		= 0200,
  2126			.proc_handler	= drop_caches_sysctl_handler,
  2127			.extra1		= SYSCTL_ONE,
  2128			.extra2		= SYSCTL_FOUR,
  2129		},
  2130		{
  2131			.procname	= "page_lock_unfairness",
  2132			.data		= &sysctl_page_lock_unfairness,
  2133			.maxlen		= sizeof(sysctl_page_lock_unfairness),
  2134			.mode		= 0644,
  2135			.proc_handler	= proc_dointvec_minmax,
  2136			.extra1		= SYSCTL_ZERO,
  2137		},
  2138	#ifdef CONFIG_MMU
  2139		{
  2140			.procname	= "max_map_count",
  2141			.data		= &sysctl_max_map_count,
  2142			.maxlen		= sizeof(sysctl_max_map_count),
  2143			.mode		= 0644,
  2144			.proc_handler	= proc_dointvec_minmax,
  2145			.extra1		= SYSCTL_ZERO,
  2146		},
  2147	#else
  2148		{
  2149			.procname	= "nr_trim_pages",
  2150			.data		= &sysctl_nr_trim_pages,
  2151			.maxlen		= sizeof(sysctl_nr_trim_pages),
  2152			.mode		= 0644,
  2153			.proc_handler	= proc_dointvec_minmax,
  2154			.extra1		= SYSCTL_ZERO,
  2155		},
  2156	#endif
  2157		{
  2158			.procname	= "vfs_cache_pressure",
  2159			.data		= &sysctl_vfs_cache_pressure,
  2160			.maxlen		= sizeof(sysctl_vfs_cache_pressure),
  2161			.mode		= 0644,
  2162			.proc_handler	= proc_dointvec_minmax,
  2163			.extra1		= SYSCTL_ZERO,
  2164		},
  2165	#if defined(HAVE_ARCH_PICK_MMAP_LAYOUT) || \
  2166	    defined(CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT)
  2167		{
  2168			.procname	= "legacy_va_layout",
  2169			.data		= &sysctl_legacy_va_layout,
  2170			.maxlen		= sizeof(sysctl_legacy_va_layout),
  2171			.mode		= 0644,
  2172			.proc_handler	= proc_dointvec_minmax,
  2173			.extra1		= SYSCTL_ZERO,
  2174		},
  2175	#endif
  2176	#ifdef CONFIG_NUMA
  2177		{
  2178			.procname	= "zone_reclaim_mode",
  2179			.data		= &node_reclaim_mode,
  2180			.maxlen		= sizeof(node_reclaim_mode),
  2181			.mode		= 0644,
  2182			.proc_handler	= proc_dointvec_minmax,
  2183			.extra1		= SYSCTL_ZERO,
  2184		},
  2185	#endif
  2186	#ifdef CONFIG_SMP
  2187		{
  2188			.procname	= "stat_interval",
  2189			.data		= &sysctl_stat_interval,
  2190			.maxlen		= sizeof(sysctl_stat_interval),
  2191			.mode		= 0644,
  2192			.proc_handler	= proc_dointvec_jiffies,
  2193		},
  2194		{
  2195			.procname	= "stat_refresh",
  2196			.data		= NULL,
  2197			.maxlen		= 0,
  2198			.mode		= 0600,
  2199			.proc_handler	= vmstat_refresh,
  2200		},
  2201	#endif
  2202	#ifdef CONFIG_MMU
  2203		{
  2204			.procname	= "mmap_min_addr",
  2205			.data		= &dac_mmap_min_addr,
  2206			.maxlen		= sizeof(unsigned long),
  2207			.mode		= 0644,
  2208			.proc_handler	= mmap_min_addr_handler,
  2209		},
  2210	#endif
  2211	#if (defined(CONFIG_X86_32) && !defined(CONFIG_UML))|| \
  2212	   (defined(CONFIG_SUPERH) && defined(CONFIG_VSYSCALL))
  2213		{
  2214			.procname	= "vdso_enabled",
  2215	#ifdef CONFIG_X86_32
  2216			.data		= &vdso32_enabled,
  2217			.maxlen		= sizeof(vdso32_enabled),
  2218	#else
  2219			.data		= &vdso_enabled,
  2220			.maxlen		= sizeof(vdso_enabled),
  2221	#endif
  2222			.mode		= 0644,
  2223			.proc_handler	= proc_dointvec,
  2224			.extra1		= SYSCTL_ZERO,
  2225		},
  2226	#endif
  2227		{
  2228			.procname	= "user_reserve_kbytes",
  2229			.data		= &sysctl_user_reserve_kbytes,
  2230			.maxlen		= sizeof(sysctl_user_reserve_kbytes),
  2231			.mode		= 0644,
  2232			.proc_handler	= proc_doulongvec_minmax,
  2233		},
  2234		{
  2235			.procname	= "admin_reserve_kbytes",
  2236			.data		= &sysctl_admin_reserve_kbytes,
  2237			.maxlen		= sizeof(sysctl_admin_reserve_kbytes),
  2238			.mode		= 0644,
  2239			.proc_handler	= proc_doulongvec_minmax,
  2240		},
  2241	#ifdef CONFIG_HAVE_ARCH_MMAP_RND_BITS
  2242		{
  2243			.procname	= "mmap_rnd_bits",
  2244			.data		= &mmap_rnd_bits,
  2245			.maxlen		= sizeof(mmap_rnd_bits),
  2246			.mode		= 0600,
  2247			.proc_handler	= proc_dointvec_minmax,
  2248			.extra1		= (void *)&mmap_rnd_bits_min,
  2249			.extra2		= (void *)&mmap_rnd_bits_max,
  2250		},
  2251	#endif
  2252	#ifdef CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS
  2253		{
  2254			.procname	= "mmap_rnd_compat_bits",
  2255			.data		= &mmap_rnd_compat_bits,
  2256			.maxlen		= sizeof(mmap_rnd_compat_bits),
  2257			.mode		= 0600,
  2258			.proc_handler	= proc_dointvec_minmax,
  2259			.extra1		= (void *)&mmap_rnd_compat_bits_min,
  2260			.extra2		= (void *)&mmap_rnd_compat_bits_max,
  2261		},
  2262	#endif
  2263	};
  2264	
  2265	int __init sysctl_init_bases(void)
  2266	{
  2267		register_sysctl_init("kernel", kern_table);
> 2268		register_sysctl_init("vm", vm_table);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
