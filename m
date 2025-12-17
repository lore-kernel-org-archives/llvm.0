Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C55A32E72E;
	Wed, 17 Dec 2025 15:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765984615; cv=none; b=ZN+euRyH856i3bw2jLOvv3Aw2L2t4xWY/BB9/wQktCvmaoDtu8pHRLDRLCbp3GitD6h84tLIJlnS56X1DKQM+Gt+qVuC2dX5IfDkkBrgf37Vo+1a9L4/l8e8ZjjPsc9/8R28o6rkR8N9X4QQpuga+ENsmacyf5nbFKL9rPKm/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765984615; c=relaxed/simple;
	bh=PioOkag10JYV7rpgIvRmKEt4AD0z054+2DHWWDH6WaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFlhxu91r164Lk9DRdfHRCOwahV7WhlDBOI+cislvlXHJuuzpXBK6u3mXvYF/0Ik2kQZRwbUdf1QWnFMsvHjbqllenNfcpD4E8BsQgs9GoW21wymiEQDO/1k2RpTV5zfHtjZC+Is07JC8ePAixTmzIL+JLPwyk0/zsf39aSBkMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xx0s9c9q; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xx0s9c9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765984614; x=1797520614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PioOkag10JYV7rpgIvRmKEt4AD0z054+2DHWWDH6WaU=;
  b=Xx0s9c9qm9xAR3Sv0MRCj5itljtY/h6jrgfS/AQG71X7Ly49XlvyTWGd
   sSflWksGBtWmMpYW8KU6udQEfMolsl58X3Cqtm6EOtkxAYkFIYOOYEfnU
   A6j3OJ3IZvaoijYfKzRh5xagWybjV3MmWhnf5TNwXVT29vY/0Gnb3qwRR
   xjjMnFIlR7E4wl156XRdnfQBWqgE8YNSeOwAX9QrOmyS9ldbyEychc8On
   tTzTNhUPhfGdpfzIIcpgPejp2rcE8gu0thIjuyQCDlhPKO2EkYH6/MPcO
   wCpPSSN8i1xSnJDY7T9xDo8IBmXe2kIzEBHSWmB0aLp5b9vl2vYds0u7o
   Q==;
X-CSE-ConnectionGUID: hviwIgJiTWKZWdJDLbUDtg==
X-CSE-MsgGUID: 4CEyK6HNQH2fqJLSESgnVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71780132"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71780132"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 07:16:54 -0800
X-CSE-ConnectionGUID: 1UNwHFf3TMi9BwuNgWZujA==
X-CSE-MsgGUID: FhAYPDYRR6y0EmKR30KrBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229010616"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2025 07:16:53 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVtGj-000000000pn-3iE2;
	Wed, 17 Dec 2025 15:16:49 +0000
Date: Wed, 17 Dec 2025 23:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:hugetlb-init/v0 2/3] mm/hugetlb_cma.c:142:32: error: a
 function declaration without a prototype is deprecated in all versions of C
Message-ID: <202512172353.in1pJLm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git hugetlb-init/v0
head:   604b7fc7172e480098a23d5a9a329ecf066bc420
commit: 465a894a24dfade53e9101e806d14a946241888c [2/3] dev: mm, arch: call hugetlb_reserve_cma from mm init
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251217/202512172353.in1pJLm5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172353.in1pJLm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172353.in1pJLm5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hugetlb_cma.c:142:32: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     142 | void __init hugetlb_cma_reserve()
         |                                ^
         |                                 void
   1 error generated.


vim +142 mm/hugetlb_cma.c

   141	
 > 142	void __init hugetlb_cma_reserve()
   143	{
   144		unsigned long size, reserved, per_node, order;
   145		bool node_specific_cma_alloc = false;
   146		int nid;
   147	
   148		if (!hugetlb_cma_size)
   149			return;
   150	
   151		order = arch_hugetlb_cma_order();
   152		if (!order)
   153			return;
   154	
   155		/*
   156		 * HugeTLB CMA reservation is required for gigantic
   157		 * huge pages which could not be allocated via the
   158		 * page allocator. Just warn if there is any change
   159		 * breaking this assumption.
   160		 */
   161		VM_WARN_ON(order <= MAX_PAGE_ORDER);
   162		cma_reserve_called = true;
   163	
   164		hugetlb_bootmem_set_nodes();
   165	
   166		for (nid = 0; nid < MAX_NUMNODES; nid++) {
   167			if (hugetlb_cma_size_in_node[nid] == 0)
   168				continue;
   169	
   170			if (!node_isset(nid, hugetlb_bootmem_nodes)) {
   171				pr_warn("hugetlb_cma: invalid node %d specified\n", nid);
   172				hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
   173				hugetlb_cma_size_in_node[nid] = 0;
   174				continue;
   175			}
   176	
   177			if (hugetlb_cma_size_in_node[nid] < (PAGE_SIZE << order)) {
   178				pr_warn("hugetlb_cma: cma area of node %d should be at least %lu MiB\n",
   179					nid, (PAGE_SIZE << order) / SZ_1M);
   180				hugetlb_cma_size -= hugetlb_cma_size_in_node[nid];
   181				hugetlb_cma_size_in_node[nid] = 0;
   182			} else {
   183				node_specific_cma_alloc = true;
   184			}
   185		}
   186	
   187		/* Validate the CMA size again in case some invalid nodes specified. */
   188		if (!hugetlb_cma_size)
   189			return;
   190	
   191		if (hugetlb_cma_size < (PAGE_SIZE << order)) {
   192			pr_warn("hugetlb_cma: cma area should be at least %lu MiB\n",
   193				(PAGE_SIZE << order) / SZ_1M);
   194			hugetlb_cma_size = 0;
   195			return;
   196		}
   197	
   198		if (!node_specific_cma_alloc) {
   199			/*
   200			 * If 3 GB area is requested on a machine with 4 numa nodes,
   201			 * let's allocate 1 GB on first three nodes and ignore the last one.
   202			 */
   203			per_node = DIV_ROUND_UP(hugetlb_cma_size,
   204						nodes_weight(hugetlb_bootmem_nodes));
   205			pr_info("hugetlb_cma: reserve %lu MiB, up to %lu MiB per node\n",
   206				hugetlb_cma_size / SZ_1M, per_node / SZ_1M);
   207		}
   208	
   209		reserved = 0;
   210		for_each_node_mask(nid, hugetlb_bootmem_nodes) {
   211			int res;
   212			char name[CMA_MAX_NAME];
   213	
   214			if (node_specific_cma_alloc) {
   215				if (hugetlb_cma_size_in_node[nid] == 0)
   216					continue;
   217	
   218				size = hugetlb_cma_size_in_node[nid];
   219			} else {
   220				size = min(per_node, hugetlb_cma_size - reserved);
   221			}
   222	
   223			size = round_up(size, PAGE_SIZE << order);
   224	
   225			snprintf(name, sizeof(name), "hugetlb%d", nid);
   226			/*
   227			 * Note that 'order per bit' is based on smallest size that
   228			 * may be returned to CMA allocator in the case of
   229			 * huge page demotion.
   230			 */
   231			res = cma_declare_contiguous_multi(size, PAGE_SIZE << order,
   232						HUGETLB_PAGE_ORDER, name,
   233						&hugetlb_cma[nid], nid);
   234			if (res) {
   235				pr_warn("hugetlb_cma: reservation failed: err %d, node %d",
   236					res, nid);
   237				continue;
   238			}
   239	
   240			reserved += size;
   241			pr_info("hugetlb_cma: reserved %lu MiB on node %d\n",
   242				size / SZ_1M, nid);
   243	
   244			if (reserved >= hugetlb_cma_size)
   245				break;
   246		}
   247	
   248		if (!reserved)
   249			/*
   250			 * hugetlb_cma_size is used to determine if allocations from
   251			 * cma are possible.  Set to zero if no cma regions are set up.
   252			 */
   253			hugetlb_cma_size = 0;
   254	}
   255	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
