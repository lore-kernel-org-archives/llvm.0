Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030CC3F075F;
	Tue, 28 Apr 2026 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377474; cv=none; b=hnpZb0M4KcJiWB/MWS0ieOjWXKuXBUkogOON8W7EZllzjkMFiCY4hm2gYMF9BRnS3IoA3K9DU37vReweoWYD/09qtqiLIBV9QsRarCxQkbY2+4FjY66UaaN4iKVuldlQt6dBOJAa0a1GbKnWIzyYaMfCESiVlE5KzfvpU6dvauY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377474; c=relaxed/simple;
	bh=uJ602cebdl+3oAgKgBIwWJBufSQRJFl4YljPHozV92Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcbgcH+ZA0ZDkiFDNxjscB7VBfRunV0wp6sPi+VaNaa962kNy473H+rO2F6sVDeEDHd3ztEKbwAzrxgr0bUws/TrwLR/63EeFZZELBj8MeJicIU51y0gSHWQwW9e7Q6xlQaUl8BemvRqxbRiSi8p8EaMFZOfHdx0yXDBsdlFQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKbn/6vu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKbn/6vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777377472; x=1808913472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uJ602cebdl+3oAgKgBIwWJBufSQRJFl4YljPHozV92Y=;
  b=CKbn/6vu9Hq8ZfKHD1GOWi9Mu2sY1Ql5nC6jRoFNIFNopDzyo2Y8MG7w
   MmaxiJlpkEk0/R6csZ1rXlBhlyIZCoOTXTcZR7yd9z/J4MEaMoYv+TrLs
   CKco3CyHLrH7mrw3bw4cHPw/7P+mT8uQVg+14+8AaoGTgvMwIQ28Kn5bT
   U/TogqOlX9+WdSbOlm1PijvbzWVDqsv2AE1IlyjDDAmg1bY3PyCHlZ24m
   lnYJNUpFJ75dUAf4WbVwvVVFt76q0HpgD/46+h4dTK7mOlAI26w151eiv
   yyBK5Y79fBgrg5uTeRyILsbrHkmxUWfxLQFHhRKxxl/eWeytSCuKoTDQ8
   w==;
X-CSE-ConnectionGUID: j7eogzN0S7S1OYqKyYV/bA==
X-CSE-MsgGUID: +hLAQh23Qe2eAAJYjzXwpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82147582"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="82147582"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 04:57:52 -0700
X-CSE-ConnectionGUID: 2TNGost8TISb7zI6X1w72g==
X-CSE-MsgGUID: tJvoiE1oQbG3l9AzNEZ2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="232921005"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2026 04:57:51 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHh4V-000000009mS-3CHk;
	Tue, 28 Apr 2026 11:57:47 +0000
Date: Tue, 28 Apr 2026 19:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm/hugetlb_cma: round up per_node before logging it
Message-ID: <202604281948.FEX8Kc9q-lkp@intel.com>
References: <20260421230220.4122996-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421230220.4122996-1-ekffu200098@gmail.com>

Hi Sang-Heon,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0]
[also build test ERROR on linus/master]
[cannot apply to akpm-mm/mm-everything next-20260427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sang-Heon-Jeon/mm-hugetlb_cma-round-up-per_node-before-logging-it/20260427-012923
base:   v7.0
patch link:    https://lore.kernel.org/r/20260421230220.4122996-1-ekffu200098%40gmail.com
patch subject: [RFC PATCH] mm/hugetlb_cma: round up per_node before logging it
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260428/202604281948.FEX8Kc9q-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604281948.FEX8Kc9q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604281948.FEX8Kc9q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hugetlb_cma.c:208:3: error: expected expression
     208 |                 pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
         |                 ^
   include/linux/printk.h:584:2: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^
   include/linux/printk.h:511:26: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^
   include/linux/printk.h:481:3: note: expanded from macro 'printk_index_wrap'
     481 |         ({                                                              \
         |          ^
   1 error generated.


vim +208 mm/hugetlb_cma.c

9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  142) 
9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  143) void __init hugetlb_cma_reserve(void)
9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  144) {
9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  145) 	unsigned long size, reserved, per_node, order;
474fe91f213a40 Frank van der Linden      2025-02-28  146  	bool node_specific_cma_alloc = false;
474fe91f213a40 Frank van der Linden      2025-02-28  147  	int nid;
474fe91f213a40 Frank van der Linden      2025-02-28  148  
9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  149) 	if (!hugetlb_cma_size)
9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  150) 		return;
9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  151) 
9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  152) 	order = arch_hugetlb_cma_order();
7a9c0bf0aec621 Mike Rapoport (Microsoft  2026-01-11  153) 	if (!order) {
7a9c0bf0aec621 Mike Rapoport (Microsoft  2026-01-11  154) 		pr_warn("hugetlb_cma: the option isn't supported by current arch\n");
9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  155) 		return;
7a9c0bf0aec621 Mike Rapoport (Microsoft  2026-01-11  156) 	}
9fac145b6d3fe5 Mike Rapoport (Microsoft  2026-01-11  157) 
474fe91f213a40 Frank van der Linden      2025-02-28  158  	/*
474fe91f213a40 Frank van der Linden      2025-02-28  159  	 * HugeTLB CMA reservation is required for gigantic
474fe91f213a40 Frank van der Linden      2025-02-28  160  	 * huge pages which could not be allocated via the
474fe91f213a40 Frank van der Linden      2025-02-28  161  	 * page allocator. Just warn if there is any change
474fe91f213a40 Frank van der Linden      2025-02-28  162  	 * breaking this assumption.
474fe91f213a40 Frank van der Linden      2025-02-28  163  	 */
474fe91f213a40 Frank van der Linden      2025-02-28  164  	VM_WARN_ON(order <= MAX_PAGE_ORDER);
474fe91f213a40 Frank van der Linden      2025-02-28  165  
8d88b0769e256c Frank van der Linden      2025-04-02  166  	hugetlb_bootmem_set_nodes();
8d88b0769e256c Frank van der Linden      2025-04-02  167  
474fe91f213a40 Frank van der Linden      2025-02-28  168  	for (nid = 0; nid < MAX_NUMNODES; nid++) {
474fe91f213a40 Frank van der Linden      2025-02-28  169  		if (hugetlb_cma_size_in_node[nid] == 0)
474fe91f213a40 Frank van der Linden      2025-02-28  170  			continue;
474fe91f213a40 Frank van der Linden      2025-02-28  171  
8d88b0769e256c Frank van der Linden      2025-04-02  172  		if (!node_isset(nid, hugetlb_bootmem_nodes)) {
474fe91f213a40 Frank van der Linden      2025-02-28  173  			pr_warn("hugetlb_cma: invalid node %d specified\n", nid);
474fe91f213a40 Frank van der Linden      2025-02-28  174  			hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
474fe91f213a40 Frank van der Linden      2025-02-28  175  			hugetlb_cma_size_in_node[nid] = 0;
474fe91f213a40 Frank van der Linden      2025-02-28  176  			continue;
474fe91f213a40 Frank van der Linden      2025-02-28  177  		}
474fe91f213a40 Frank van der Linden      2025-02-28  178  
474fe91f213a40 Frank van der Linden      2025-02-28  179  		if (hugetlb_cma_size_in_node[nid] < (PAGE_SIZE << order)) {
474fe91f213a40 Frank van der Linden      2025-02-28  180  			pr_warn("hugetlb_cma: cma area of node %d should be at least %lu MiB\n",
474fe91f213a40 Frank van der Linden      2025-02-28  181  				nid, (PAGE_SIZE << order) / SZ_1M);
474fe91f213a40 Frank van der Linden      2025-02-28  182  			hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
474fe91f213a40 Frank van der Linden      2025-02-28  183  			hugetlb_cma_size_in_node[nid] = 0;
474fe91f213a40 Frank van der Linden      2025-02-28  184  		} else {
474fe91f213a40 Frank van der Linden      2025-02-28  185  			node_specific_cma_alloc = true;
474fe91f213a40 Frank van der Linden      2025-02-28  186  		}
474fe91f213a40 Frank van der Linden      2025-02-28  187  	}
474fe91f213a40 Frank van der Linden      2025-02-28  188  
474fe91f213a40 Frank van der Linden      2025-02-28  189  	/* Validate the CMA size again in case some invalid nodes specified. */
474fe91f213a40 Frank van der Linden      2025-02-28  190  	if (!hugetlb_cma_size)
474fe91f213a40 Frank van der Linden      2025-02-28  191  		return;
474fe91f213a40 Frank van der Linden      2025-02-28  192  
474fe91f213a40 Frank van der Linden      2025-02-28  193  	if (hugetlb_cma_size < (PAGE_SIZE << order)) {
474fe91f213a40 Frank van der Linden      2025-02-28  194  		pr_warn("hugetlb_cma: cma area should be at least %lu MiB\n",
474fe91f213a40 Frank van der Linden      2025-02-28  195  			(PAGE_SIZE << order) / SZ_1M);
474fe91f213a40 Frank van der Linden      2025-02-28  196  		hugetlb_cma_size = 0;
474fe91f213a40 Frank van der Linden      2025-02-28  197  		return;
474fe91f213a40 Frank van der Linden      2025-02-28  198  	}
474fe91f213a40 Frank van der Linden      2025-02-28  199  
474fe91f213a40 Frank van der Linden      2025-02-28  200  	if (!node_specific_cma_alloc) {
474fe91f213a40 Frank van der Linden      2025-02-28  201  		/*
474fe91f213a40 Frank van der Linden      2025-02-28  202  		 * If 3 GB area is requested on a machine with 4 numa nodes,
474fe91f213a40 Frank van der Linden      2025-02-28  203  		 * let's allocate 1 GB on first three nodes and ignore the last one.
474fe91f213a40 Frank van der Linden      2025-02-28  204  		 */
8d88b0769e256c Frank van der Linden      2025-04-02  205  		per_node = DIV_ROUND_UP(hugetlb_cma_size,
8d88b0769e256c Frank van der Linden      2025-04-02  206  					nodes_weight(hugetlb_bootmem_nodes));
1260cb5196af67 Sang-Heon Jeon            2026-04-22  207  		per_node = round_up(per_node, PAGE_SIZE << order)
474fe91f213a40 Frank van der Linden      2025-02-28 @208  		pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
474fe91f213a40 Frank van der Linden      2025-02-28  209  			hugetlb_cma_size / SZ_1M, per_node / SZ_1M);
474fe91f213a40 Frank van der Linden      2025-02-28  210  	}
474fe91f213a40 Frank van der Linden      2025-02-28  211  
474fe91f213a40 Frank van der Linden      2025-02-28  212  	reserved = 0;
8d88b0769e256c Frank van der Linden      2025-04-02  213  	for_each_node_mask(nid, hugetlb_bootmem_nodes) {
474fe91f213a40 Frank van der Linden      2025-02-28  214  		int res;
474fe91f213a40 Frank van der Linden      2025-02-28  215  		char name[CMA_MAX_NAME];
474fe91f213a40 Frank van der Linden      2025-02-28  216  
474fe91f213a40 Frank van der Linden      2025-02-28  217  		if (node_specific_cma_alloc) {
474fe91f213a40 Frank van der Linden      2025-02-28  218  			if (hugetlb_cma_size_in_node[nid] == 0)
474fe91f213a40 Frank van der Linden      2025-02-28  219  				continue;
474fe91f213a40 Frank van der Linden      2025-02-28  220  
474fe91f213a40 Frank van der Linden      2025-02-28  221  			size = hugetlb_cma_size_in_node[nid];
474fe91f213a40 Frank van der Linden      2025-02-28  222  		} else {
474fe91f213a40 Frank van der Linden      2025-02-28  223  			size = min(per_node, hugetlb_cma_size - reserved);
474fe91f213a40 Frank van der Linden      2025-02-28  224  		}
474fe91f213a40 Frank van der Linden      2025-02-28  225  
474fe91f213a40 Frank van der Linden      2025-02-28  226  		size = round_up(size, PAGE_SIZE << order);
474fe91f213a40 Frank van der Linden      2025-02-28  227  
474fe91f213a40 Frank van der Linden      2025-02-28  228  		snprintf(name, sizeof(name), "hugetlb%d", nid);
474fe91f213a40 Frank van der Linden      2025-02-28  229  		/*
474fe91f213a40 Frank van der Linden      2025-02-28  230  		 * Note that 'order per bit' is based on smallest size that
474fe91f213a40 Frank van der Linden      2025-02-28  231  		 * may be returned to CMA allocator in the case of
474fe91f213a40 Frank van der Linden      2025-02-28  232  		 * huge page demotion.
474fe91f213a40 Frank van der Linden      2025-02-28  233  		 */
474fe91f213a40 Frank van der Linden      2025-02-28  234  		res = cma_declare_contiguous_multi(size, PAGE_SIZE << order,
474fe91f213a40 Frank van der Linden      2025-02-28  235  					HUGETLB_PAGE_ORDER, name,
474fe91f213a40 Frank van der Linden      2025-02-28  236  					&hugetlb_cma[nid], nid);
474fe91f213a40 Frank van der Linden      2025-02-28  237  		if (res) {
474fe91f213a40 Frank van der Linden      2025-02-28  238  			pr_warn("hugetlb_cma: reservation failed: err %d, node %d",
474fe91f213a40 Frank van der Linden      2025-02-28  239  				res, nid);
474fe91f213a40 Frank van der Linden      2025-02-28  240  			continue;
474fe91f213a40 Frank van der Linden      2025-02-28  241  		}
474fe91f213a40 Frank van der Linden      2025-02-28  242  
474fe91f213a40 Frank van der Linden      2025-02-28  243  		reserved += size;
474fe91f213a40 Frank van der Linden      2025-02-28  244  		pr_info("hugetlb_cma: reserved %lu MiB on node %d\n",
474fe91f213a40 Frank van der Linden      2025-02-28  245  			size / SZ_1M, nid);
474fe91f213a40 Frank van der Linden      2025-02-28  246  
474fe91f213a40 Frank van der Linden      2025-02-28  247  		if (reserved >= hugetlb_cma_size)
474fe91f213a40 Frank van der Linden      2025-02-28  248  			break;
474fe91f213a40 Frank van der Linden      2025-02-28  249  	}
474fe91f213a40 Frank van der Linden      2025-02-28  250  
474fe91f213a40 Frank van der Linden      2025-02-28  251  	if (!reserved)
474fe91f213a40 Frank van der Linden      2025-02-28  252  		/*
474fe91f213a40 Frank van der Linden      2025-02-28  253  		 * hugetlb_cma_size is used to determine if allocations from
474fe91f213a40 Frank van der Linden      2025-02-28  254  		 * cma are possible.  Set to zero if no cma regions are set up.
474fe91f213a40 Frank van der Linden      2025-02-28  255  		 */
474fe91f213a40 Frank van der Linden      2025-02-28  256  		hugetlb_cma_size = 0;
474fe91f213a40 Frank van der Linden      2025-02-28  257  }
474fe91f213a40 Frank van der Linden      2025-02-28  258  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
