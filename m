Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684DC1885A1;
	Sun, 25 May 2025 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748166758; cv=none; b=t1rZdEnvrB2RKvSs2M6Ld/wNsATcB5rjgJ6kiVP7LaDZMKaOPGWTIgfjOAen5jKVzPVc5EyUbYKYX4JhicRwLPmWIjnza2jNwApoRciVyYOaVb9g08a6OlOdrIHrW3hWvyfQaLik6tBg7mw3Nud0T2/rgUw+xmOpLaLccm9Rgpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748166758; c=relaxed/simple;
	bh=c5SsShpEu5MwMFqmtEglGWkF3VrwgGsgOVecay5r95g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8Z3Fn8KIKg9VP+vuCRbwQMu4/In6A6AKa+Uf5xsZfTv/DxiBOUzyK1FRC+6rkZa/ZJzDb8RIScHf+paw0nobeyj2KgqHbjRsH3FBr8PjGSgZoi7W3tLoEEG9xoL9KB9XnH2+8I+Ee7PHJblLuyo1LzDnKbutBbLxKj/GUEjIeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UM7STFI+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UM7STFI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748166757; x=1779702757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5SsShpEu5MwMFqmtEglGWkF3VrwgGsgOVecay5r95g=;
  b=UM7STFI+xb5+eITtkEPuZ7uE1XeAgGYiN0Ht1l1OB7YQbj5mCcqeL4b3
   cRLUlf3EfUK1oLl5JYCDMeE9FPd3EoUERYNFUBirz3148XoCeTMTki2rB
   WDKaqfjlPx90kGMIhAxygGGCCg/WVbgBkvMRW3PDtuSN2Kk91Y2U5It5q
   4ZHol9IkywnuCwe4Lk/7VkH1VT1/LOmkt03xNZ4SdpNBAxlFywVSlvwYJ
   JKKumQeZE9ldewICjM2af1tv70mKzN9cZN/KDv92LuAslTX1rjwewn1bs
   W6eyyZcoTX+/DXa6F/MlsxsVuLaXHKpImArwjjf2v7Y1HtUkNIijl4TYV
   g==;
X-CSE-ConnectionGUID: KnmP2Z3vSqaOIWkLKY3SWA==
X-CSE-MsgGUID: +OyTgGoKS4+1tP/OCMPksA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="61515052"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="61515052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 02:52:34 -0700
X-CSE-ConnectionGUID: biro4fWGQoyrBEv32Zp5yQ==
X-CSE-MsgGUID: KoMQN+lUSjCwntp8zx+24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="172806687"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 May 2025 02:52:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ81u-000Rji-1Y;
	Sun, 25 May 2025 09:52:30 +0000
Date: Sun, 25 May 2025 17:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Daisuke Matsuda <dskmtsd@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [rdma-rdma:wip/leon-for-next 21/25]
 drivers/infiniband/core/umem_odp.c:84:2: error: use of undeclared identifier
 'nap'; did you mean 'map'?
Message-ID: <202505251700.tcxrqcAy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   de748d531c52a5b94af1cf55f1efc64bde5390a2
commit: 5071e94f47af4227e0029598a6c07a26cefb6bf5 [21/25] RDMA/core: Avoid hmm_dma_map_alloc() for virtual DMA devices
config: riscv-randconfig-001-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251700.tcxrqcAy-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505251700.tcxrqcAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251700.tcxrqcAy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/core/umem_odp.c:84:2: error: use of undeclared identifier 'nap'; did you mean 'map'?
      84 |         nap = &umem_odp->map;
         |         ^~~
         |         map
   drivers/infiniband/core/umem_odp.c:63:22: note: 'map' declared here
      63 |         struct hmm_dma_map *map;
         |                             ^
>> drivers/infiniband/core/umem_odp.c:279:22: error: member reference type 'struct hmm_dma_map' is not a pointer; did you mean to use '.'?
     279 |                 kfree(umem_odp->map->pfn_list);
         |                       ~~~~~~~~~~~~~^~
         |                                    .
   2 errors generated.


vim +84 drivers/infiniband/core/umem_odp.c

    57	
    58	static int ib_init_umem_odp(struct ib_umem_odp *umem_odp,
    59				    const struct mmu_interval_notifier_ops *ops)
    60	{
    61		struct ib_device *dev = umem_odp->umem.ibdev;
    62		size_t page_size = 1UL << umem_odp->page_shift;
    63		struct hmm_dma_map *map;
    64		unsigned long start;
    65		unsigned long end;
    66		size_t nr_entries;
    67		int ret = 0;
    68	
    69		umem_odp->umem.is_odp = 1;
    70		mutex_init(&umem_odp->umem_mutex);
    71	
    72		start = ALIGN_DOWN(umem_odp->umem.address, page_size);
    73		if (check_add_overflow(umem_odp->umem.address,
    74				       (unsigned long)umem_odp->umem.length, &end))
    75			return -EOVERFLOW;
    76		end = ALIGN(end, page_size);
    77		if (unlikely(end < page_size))
    78			return -EOVERFLOW;
    79	
    80		nr_entries = (end - start) >> PAGE_SHIFT;
    81		if (!(nr_entries * PAGE_SIZE / page_size))
    82			return -EINVAL;
    83	
  > 84		nap = &umem_odp->map;
    85		if (ib_uses_virt_dma(dev)) {
    86			map->pfn_list = kvcalloc(nr_entries, sizeof(*map->pfn_list),
    87						 GFP_KERNEL | __GFP_NOWARN);
    88			if (!map->pfn_list)
    89				ret = -ENOMEM;
    90		} else
    91			ret = hmm_dma_map_alloc(dev->dma_device, &umem_odp->map,
    92						(end - start) >> PAGE_SHIFT,
    93						1 << umem_odp->page_shift);
    94		if (ret)
    95			return ret;
    96	
    97		ret = mmu_interval_notifier_insert(&umem_odp->notifier,
    98						   umem_odp->umem.owning_mm, start,
    99						   end - start, ops);
   100		if (ret)
   101			goto out_free_map;
   102	
   103		return 0;
   104	
   105	out_free_map:
   106		if (ib_uses_virt_dma(dev))
   107			kfree(map->pfn_list);
   108		else
   109			hmm_dma_map_free(dev->dma_device, &umem_odp->map);
   110		return ret;
   111	}
   112	
   113	/**
   114	 * ib_umem_odp_alloc_implicit - Allocate a parent implicit ODP umem
   115	 *
   116	 * Implicit ODP umems do not have a VA range and do not have any page lists.
   117	 * They exist only to hold the per_mm reference to help the driver create
   118	 * children umems.
   119	 *
   120	 * @device: IB device to create UMEM
   121	 * @access: ib_reg_mr access flags
   122	 */
   123	struct ib_umem_odp *ib_umem_odp_alloc_implicit(struct ib_device *device,
   124						       int access)
   125	{
   126		struct ib_umem *umem;
   127		struct ib_umem_odp *umem_odp;
   128	
   129		if (access & IB_ACCESS_HUGETLB)
   130			return ERR_PTR(-EINVAL);
   131	
   132		umem_odp = kzalloc(sizeof(*umem_odp), GFP_KERNEL);
   133		if (!umem_odp)
   134			return ERR_PTR(-ENOMEM);
   135		umem = &umem_odp->umem;
   136		umem->ibdev = device;
   137		umem->writable = ib_access_writable(access);
   138		umem->owning_mm = current->mm;
   139		umem_odp->page_shift = PAGE_SHIFT;
   140	
   141		umem_odp->tgid = get_task_pid(current->group_leader, PIDTYPE_PID);
   142		ib_init_umem_implicit_odp(umem_odp);
   143		return umem_odp;
   144	}
   145	EXPORT_SYMBOL(ib_umem_odp_alloc_implicit);
   146	
   147	/**
   148	 * ib_umem_odp_alloc_child - Allocate a child ODP umem under an implicit
   149	 *                           parent ODP umem
   150	 *
   151	 * @root: The parent umem enclosing the child. This must be allocated using
   152	 *        ib_alloc_implicit_odp_umem()
   153	 * @addr: The starting userspace VA
   154	 * @size: The length of the userspace VA
   155	 * @ops: MMU interval ops, currently only @invalidate
   156	 */
   157	struct ib_umem_odp *
   158	ib_umem_odp_alloc_child(struct ib_umem_odp *root, unsigned long addr,
   159				size_t size,
   160				const struct mmu_interval_notifier_ops *ops)
   161	{
   162		/*
   163		 * Caller must ensure that root cannot be freed during the call to
   164		 * ib_alloc_odp_umem.
   165		 */
   166		struct ib_umem_odp *odp_data;
   167		struct ib_umem *umem;
   168		int ret;
   169	
   170		if (WARN_ON(!root->is_implicit_odp))
   171			return ERR_PTR(-EINVAL);
   172	
   173		odp_data = kzalloc(sizeof(*odp_data), GFP_KERNEL);
   174		if (!odp_data)
   175			return ERR_PTR(-ENOMEM);
   176		umem = &odp_data->umem;
   177		umem->ibdev = root->umem.ibdev;
   178		umem->length     = size;
   179		umem->address    = addr;
   180		umem->writable   = root->umem.writable;
   181		umem->owning_mm  = root->umem.owning_mm;
   182		odp_data->page_shift = PAGE_SHIFT;
   183		odp_data->notifier.ops = ops;
   184	
   185		/*
   186		 * A mmget must be held when registering a notifier, the owming_mm only
   187		 * has a mm_grab at this point.
   188		 */
   189		if (!mmget_not_zero(umem->owning_mm)) {
   190			ret = -EFAULT;
   191			goto out_free;
   192		}
   193	
   194		odp_data->tgid = get_pid(root->tgid);
   195		ret = ib_init_umem_odp(odp_data, ops);
   196		if (ret)
   197			goto out_tgid;
   198		mmput(umem->owning_mm);
   199		return odp_data;
   200	
   201	out_tgid:
   202		put_pid(odp_data->tgid);
   203		mmput(umem->owning_mm);
   204	out_free:
   205		kfree(odp_data);
   206		return ERR_PTR(ret);
   207	}
   208	EXPORT_SYMBOL(ib_umem_odp_alloc_child);
   209	
   210	/**
   211	 * ib_umem_odp_get - Create a umem_odp for a userspace va
   212	 *
   213	 * @device: IB device struct to get UMEM
   214	 * @addr: userspace virtual address to start at
   215	 * @size: length of region to pin
   216	 * @access: IB_ACCESS_xxx flags for memory being pinned
   217	 * @ops: MMU interval ops, currently only @invalidate
   218	 *
   219	 * The driver should use when the access flags indicate ODP memory. It avoids
   220	 * pinning, instead, stores the mm for future page fault handling in
   221	 * conjunction with MMU notifiers.
   222	 */
   223	struct ib_umem_odp *ib_umem_odp_get(struct ib_device *device,
   224					    unsigned long addr, size_t size, int access,
   225					    const struct mmu_interval_notifier_ops *ops)
   226	{
   227		struct ib_umem_odp *umem_odp;
   228		int ret;
   229	
   230		if (WARN_ON_ONCE(!(access & IB_ACCESS_ON_DEMAND)))
   231			return ERR_PTR(-EINVAL);
   232	
   233		umem_odp = kzalloc(sizeof(struct ib_umem_odp), GFP_KERNEL);
   234		if (!umem_odp)
   235			return ERR_PTR(-ENOMEM);
   236	
   237		umem_odp->umem.ibdev = device;
   238		umem_odp->umem.length = size;
   239		umem_odp->umem.address = addr;
   240		umem_odp->umem.writable = ib_access_writable(access);
   241		umem_odp->umem.owning_mm = current->mm;
   242		umem_odp->notifier.ops = ops;
   243	
   244		umem_odp->page_shift = PAGE_SHIFT;
   245	#ifdef CONFIG_HUGETLB_PAGE
   246		if (access & IB_ACCESS_HUGETLB)
   247			umem_odp->page_shift = HPAGE_SHIFT;
   248	#endif
   249	
   250		umem_odp->tgid = get_task_pid(current->group_leader, PIDTYPE_PID);
   251		ret = ib_init_umem_odp(umem_odp, ops);
   252		if (ret)
   253			goto err_put_pid;
   254		return umem_odp;
   255	
   256	err_put_pid:
   257		put_pid(umem_odp->tgid);
   258		kfree(umem_odp);
   259		return ERR_PTR(ret);
   260	}
   261	EXPORT_SYMBOL(ib_umem_odp_get);
   262	
   263	static void ib_umem_odp_free(struct ib_umem_odp *umem_odp)
   264	{
   265		struct ib_device *dev = umem_odp->umem.ibdev;
   266	
   267		/*
   268		 * Ensure that no more pages are mapped in the umem.
   269		 *
   270		 * It is the driver's responsibility to ensure, before calling us,
   271		 * that the hardware will not attempt to access the MR any more.
   272		 */
   273		mutex_lock(&umem_odp->umem_mutex);
   274		ib_umem_odp_unmap_dma_pages(umem_odp, ib_umem_start(umem_odp),
   275					    ib_umem_end(umem_odp));
   276		mutex_unlock(&umem_odp->umem_mutex);
   277		mmu_interval_notifier_remove(&umem_odp->notifier);
   278		if (ib_uses_virt_dma(dev))
 > 279			kfree(umem_odp->map->pfn_list);
   280		else
   281			hmm_dma_map_free(dev->dma_device, &umem_odp->map);
   282	}
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
