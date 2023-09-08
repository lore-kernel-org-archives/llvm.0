Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB0610EE;
	Fri,  8 Sep 2023 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694213076; x=1725749076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zf+tVjsSKgFi0jhBNB9VQt0g+v5xRPMZjUr6WJSIP/M=;
  b=h5O4Tu94K8s6+qHtUrK5kEq2uhjcX4nwHJsJud0CzDPAi2ofV37u6nyr
   tWmj5gAGQ9haAeREES27iXAI6UKx20dXEZcEiPxavOTFF4i2Ajc1sSeJ9
   ntqSSoPong81pl38MC+fmT50Eg+cKy6HNbVlj4AUTAMtKMF3Bm/hCAXEC
   IsZJiQ+/etPySk5IDlmCyvmsUuRekPrgScIwXivEVkO4h9X/vLTX43bzH
   SOJ4aKRRgP3J6R9qxLZefL3rUWq7KbfjhgRE5Wco5AIxk9YTTf9C1yc9p
   nv6HxurypAKF0Hba1WPhlmmtbNsuV8t4wY4TvioQ0oq3kxiMzRdjwxbpB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375137686"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="375137686"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 15:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989425052"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="989425052"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Sep 2023 15:44:33 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qekDH-0002gl-2L;
	Fri, 08 Sep 2023 22:44:31 +0000
Date: Sat, 9 Sep 2023 06:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] mm/migrate: Create move_phys_pages syscall
Message-ID: <202309090612.A9EmQIQ1-lkp@intel.com>
References: <20230907075453.350554-4-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907075453.350554-4-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tip/x86/asm linus/master next-20230908]
[cannot apply to arnd-asm-generic/master v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-migrate-remove-unused-mm-argument-from-do_move_pages_to_node/20230909-004600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230907075453.350554-4-gregory.price%40memverge.com
patch subject: [RFC PATCH 3/3] mm/migrate: Create move_phys_pages syscall
config: x86_64-buildonly-randconfig-002-20230909 (https://download.01.org/0day-ci/archive/20230909/202309090612.A9EmQIQ1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090612.A9EmQIQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090612.A9EmQIQ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/migrate.c:2182:42: error: no member named 'owner' in 'struct mm_struct'
           struct task_struct *owner = vma->vm_mm->owner;
                                       ~~~~~~~~~~  ^
   1 error generated.


vim +2182 mm/migrate.c

  2170	
  2171	/*
  2172	 * Walks each vma mapping a given page and determines if those
  2173	 * vma's are both migratable, and that the target node is within
  2174	 * the allowed cpuset of the owning task.
  2175	 */
  2176	static bool phys_page_migratable(struct folio *folio,
  2177					 struct vm_area_struct *vma,
  2178					 unsigned long address,
  2179					 void *arg)
  2180	{
  2181		struct rmap_page_ctxt *ctxt = (struct rmap_page_ctxt *)arg;
> 2182		struct task_struct *owner = vma->vm_mm->owner;
  2183		nodemask_t task_nodes = cpuset_mems_allowed(owner);
  2184	
  2185		ctxt->found |= true;
  2186		ctxt->migratable &= vma_migratable(vma);
  2187		ctxt->node_allowed &= node_isset(ctxt->node, task_nodes);
  2188	
  2189		return ctxt->migratable && ctxt->node_allowed;
  2190	}
  2191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
