Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94E7238E27;
	Wed, 11 Dec 2024 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733917201; cv=none; b=M2kAMMawNUiaNhZ73nQPOa8Il0ppv2fudfKv799ILvMs9+jx5/6a4Bw1h1lNvK9x2OlFccuuxG7drqkEgoRrbMUt3Yz/Bc9a+88+t6w3mLGHrp2vYnaJtUwHNSPvYi+7kUnbhyF2Une8L7+FkPxFb1pE2KJ0YPK4JX5CNj44qA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733917201; c=relaxed/simple;
	bh=lIBgsgzjBcV0Fyqz6oM6NvR8c8iQDh1PZFc/YdXUBFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLBBDaW8A2aOtLSLEchCjx0U/0z9hyDx1ss680rnSwg7yatviXEi/T54GBO4xX/N/fq3PRpzq9bm6PQBD/dcN2uhld4jx/2g+Fh31qNJ9zeSp8OADnijXKqZ9z1zG4M/uCN+OBc2i34z/MN1ovK+EWdTWC7epwVkS5+a63+663A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+HZJ7rM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+HZJ7rM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733917199; x=1765453199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lIBgsgzjBcV0Fyqz6oM6NvR8c8iQDh1PZFc/YdXUBFw=;
  b=Y+HZJ7rM2Arjdx1TMi2P7HK1xE/3gV8Ur6oKI1mL4pWGrYw8uPF2aHP3
   PJmFTSQD22/TBlcYYFNfbYwR6ab18hRx7m5MBoNJd8vtIqOdIIWLb60Qs
   cRvwqUvDw6J0A7eMJFAQb+JPqzkD8SAgK4vpTDYCVGMxNE2+5TLgtRp98
   IjoOGzOkhJW7D91L7hcr+lCoP7kubUGtHAZLr/eJ5MSMtDWO9gG6YhGm6
   cY6srEHX5lv1syj8bCrY7t1WJvgWL9pzUSwul+BEPiqMIf4SIBYR8ViLK
   FA/icmr9KTE1iMghzQzO7wtfeBbGaXPl7JyZjQcNkLtOI/85p+EKuRxnZ
   Q==;
X-CSE-ConnectionGUID: ER5EcVVNSQentJE38M9j9Q==
X-CSE-MsgGUID: GA9QyDWmQ5an3jWnn2XaYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34192972"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="34192972"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 03:39:59 -0800
X-CSE-ConnectionGUID: 0Rp8XWDYQhucevIQKP7n5Q==
X-CSE-MsgGUID: aI7YOZR3RjSJ+zTng7hotw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96583256"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2024 03:39:58 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLL4M-0006c1-2a;
	Wed, 11 Dec 2024 11:39:54 +0000
Date: Wed, 11 Dec 2024 19:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm/mempolicy: Weighted interleave auto-tuning
Message-ID: <202412111959.U5DOpNXr-lkp@intel.com>
References: <20241210215439.94819-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210215439.94819-1-joshua.hahnjy@gmail.com>

Hi Joshua,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-mempolicy-Weighted-interleave-auto-tuning/20241211-055713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241210215439.94819-1-joshua.hahnjy%40gmail.com
patch subject: [RFC PATCH] mm/mempolicy: Weighted interleave auto-tuning
config: i386-buildonly-randconfig-001-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111959.U5DOpNXr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111959.U5DOpNXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111959.U5DOpNXr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mempolicy.c:80:
   In file included from include/linux/mempolicy.h:16:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/mempolicy.c:108:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/mempolicy.c:227:13: warning: result of comparison of constant 1844674407370955161 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
     227 |         if (bw_val > (U64_MAX / 10))
         |             ~~~~~~ ^ ~~~~~~~~~~~~~~
   6 warnings generated.


vim +227 mm/mempolicy.c

    79	
    80	#include <linux/mempolicy.h>
    81	#include <linux/pagewalk.h>
    82	#include <linux/highmem.h>
    83	#include <linux/hugetlb.h>
    84	#include <linux/kernel.h>
    85	#include <linux/sched.h>
    86	#include <linux/sched/mm.h>
    87	#include <linux/sched/numa_balancing.h>
    88	#include <linux/sched/task.h>
    89	#include <linux/nodemask.h>
    90	#include <linux/cpuset.h>
    91	#include <linux/slab.h>
    92	#include <linux/string.h>
    93	#include <linux/export.h>
    94	#include <linux/nsproxy.h>
    95	#include <linux/interrupt.h>
    96	#include <linux/init.h>
    97	#include <linux/compat.h>
    98	#include <linux/ptrace.h>
    99	#include <linux/swap.h>
   100	#include <linux/seq_file.h>
   101	#include <linux/proc_fs.h>
   102	#include <linux/migrate.h>
   103	#include <linux/ksm.h>
   104	#include <linux/rmap.h>
   105	#include <linux/security.h>
   106	#include <linux/syscalls.h>
   107	#include <linux/ctype.h>
 > 108	#include <linux/mm_inline.h>
   109	#include <linux/mmu_notifier.h>
   110	#include <linux/printk.h>
   111	#include <linux/swapops.h>
   112	#include <linux/gcd.h>
   113	
   114	#include <asm/tlbflush.h>
   115	#include <asm/tlb.h>
   116	#include <linux/uaccess.h>
   117	
   118	#include "internal.h"
   119	
   120	/* Internal flags */
   121	#define MPOL_MF_DISCONTIG_OK (MPOL_MF_INTERNAL << 0)	/* Skip checks for continuous vmas */
   122	#define MPOL_MF_INVERT       (MPOL_MF_INTERNAL << 1)	/* Invert check for nodemask */
   123	#define MPOL_MF_WRLOCK       (MPOL_MF_INTERNAL << 2)	/* Write-lock walked vmas */
   124	
   125	static struct kmem_cache *policy_cache;
   126	static struct kmem_cache *sn_cache;
   127	
   128	/* Highest zone. An specific allocation for a zone below that is not
   129	   policied. */
   130	enum zone_type policy_zone = 0;
   131	
   132	/*
   133	 * run-time system-wide default policy => local allocation
   134	 */
   135	static struct mempolicy default_policy = {
   136		.refcnt = ATOMIC_INIT(1), /* never free it */
   137		.mode = MPOL_LOCAL,
   138	};
   139	
   140	static struct mempolicy preferred_node_policy[MAX_NUMNODES];
   141	
   142	/*
   143	 * iw_table is the sysfs-set interleave weight table, a value of 0 denotes
   144	 * system-default value should be used. A NULL iw_table also denotes that
   145	 * system-default values should be used. Until the system-default table
   146	 * is implemented, the system-default is always 1.
   147	 *
   148	 * iw_table is RCU protected
   149	 */
   150	static unsigned long *node_bw_table;
   151	static u8 __rcu *default_iw_table;
   152	static DEFINE_MUTEX(default_iwt_lock);
   153	
   154	static u8 __rcu *iw_table;
   155	static DEFINE_MUTEX(iw_table_lock);
   156	
   157	static int max_node_weight = 32;
   158	
   159	static u8 get_il_weight(int node)
   160	{
   161		u8 *table, *defaults;
   162		u8 weight;
   163	
   164		rcu_read_lock();
   165		defaults = rcu_dereference(default_iw_table);
   166		table = rcu_dereference(iw_table);
   167		/* if no iw_table, use system default - if no default, use 1 */
   168		weight = table ? table[node] : 0;
   169		weight = weight ? weight : (defaults ? defaults[node] : 1);
   170		rcu_read_unlock();
   171		return weight;
   172	}
   173	
   174	/*
   175	 * Convert ACPI-reported bandwidths into weighted interleave weights for
   176	 * informed page allocation.
   177	 * Call with default_iwt_lock held
   178	 */
   179	static void reduce_interleave_weights(unsigned long *bw, u8 *new_iw)
   180	{
   181		uint64_t ttl_bw = 0, ttl_iw = 0, scaling_factor = 1;
   182		unsigned int iw_gcd = 1, i = 0;
   183	
   184		/* Recalculate the bandwidth distribution given the new info */
   185		for (i = 0; i < nr_node_ids; i++)
   186			ttl_bw += bw[i];
   187	
   188		/* If node is not set or has < 1% of total bw, use minimum value of 1 */
   189		for (i = 0; i < nr_node_ids; i++) {
   190			if (bw[i]) {
   191				scaling_factor = 100 * bw[i];
   192				new_iw[i] = max(scaling_factor / ttl_bw, 1);
   193			} else {
   194				new_iw[i] = 1;
   195			}
   196			ttl_iw += new_iw[i];
   197		}
   198	
   199		/*
   200		 * Scale each node's share of the total bandwidth from percentages
   201		 * to whole numbers in the range [1, max_node_weight]
   202		 */
   203		for (i = 0; i < nr_node_ids; i++) {
   204			scaling_factor = max_node_weight * new_iw[i];
   205			new_iw[i] = max(scaling_factor / ttl_iw, 1);
   206			if (unlikely(i == 0))
   207				iw_gcd = new_iw[0];
   208			iw_gcd = gcd(iw_gcd, new_iw[i]);
   209		}
   210	
   211		/* 1:2 is strictly better than 16:32. Reduce by the weights' GCD. */
   212		for (i = 0; i < nr_node_ids; i++)
   213			new_iw[i] /= iw_gcd;
   214	}
   215	
   216	int mempolicy_set_node_perf(unsigned int node, struct access_coordinate *coords)
   217	{
   218		unsigned long *old_bw, *new_bw;
   219		unsigned long bw_val;
   220		u8 *old_iw, *new_iw;
   221	
   222		/*
   223		 * Bandwidths above this limit causes rounding errors when reducing
   224		 * weights. This value is ~16 exabytes, which is unreasonable anyways.
   225		 */
   226		bw_val = min(coords->read_bandwidth, coords->write_bandwidth);
 > 227		if (bw_val > (U64_MAX / 10))
   228			return -EINVAL;
   229	
   230		new_bw = kcalloc(nr_node_ids, sizeof(unsigned long), GFP_KERNEL);
   231		if (!new_bw)
   232			return -ENOMEM;
   233	
   234		new_iw = kzalloc(nr_node_ids, GFP_KERNEL);
   235		if (!new_iw) {
   236			kfree(new_bw);
   237			return -ENOMEM;
   238		}
   239	
   240		mutex_lock(&default_iwt_lock);
   241		old_bw = node_bw_table;
   242		old_iw = rcu_dereference_protected(default_iw_table,
   243						   lockdep_is_held(&default_iwt_lock));
   244	
   245		if (old_bw)
   246			memcpy(new_bw, old_bw, nr_node_ids*sizeof(unsigned long));
   247		new_bw[node] = bw_val;
   248		node_bw_table = new_bw;
   249	
   250		reduce_interleave_weights(new_bw, new_iw);
   251		rcu_assign_pointer(default_iw_table, new_iw);
   252	
   253		mutex_unlock(&default_iwt_lock);
   254		synchronize_rcu();
   255		kfree(old_bw);
   256		kfree(old_iw);
   257		return 0;
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
