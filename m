Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466F6ADD;
	Thu, 22 May 2025 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747872093; cv=none; b=oLHVq13sGF2Tvaa63i8a2coXFahqTyhX//ESKUMWgaW1R/C9dZkw+vEgNLVYTOoo+cNhMLzn6duHLpxP0/m4ya8fub2Yz/Mt67gj2iO4YLnT9/sGbGf2oR9LYnk3UwVr/2VV9Z5fia1iZk8y2Ubjs0bELF70eUTCcSZBHHcYFt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747872093; c=relaxed/simple;
	bh=pkLzgou96dx1nlCpgNC3ssuAiZhe3zq/HfydtPXeQuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YK2QoEDd8XhJA99XatrBBJuprO7PalrsaoMylExs0WIz97QfS7fUt3PLyE2FmMokqF0ScQVbIlyLGZxAhxx4zcxSK94taEmzi0i8+yPitxEIirC5HRlrefonC3TzoddwZq1/ZdtCL7T/msEVVqC03loed9hFNopZG9UvFhTnFhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqEXTyeb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqEXTyeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747872092; x=1779408092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pkLzgou96dx1nlCpgNC3ssuAiZhe3zq/HfydtPXeQuc=;
  b=BqEXTyebgm6U1BUP4A1FA5/F+vgvJkxNl+ZH7idbk0ET/Ef986qTDQ7c
   CjxId+UkWXur82G/OlKxaEUkg8f2FmNgqRspNqwgEpknNoLT8LjDQ195O
   ueVWxlzbfTCRXaOoneoAqypY2FDG28A/Vva2VZ+wD3uBy/U2dwqmpFdku
   fn7tIdLiaIpRkuMz+WKn6xjppPTp+5ncgDEBqUzWX2kE87m/mlzzVMn0i
   UCV4/RUXKTPO3kZ0mu5UGVKnMzhWx1VrSBJiaQ80IsUDTUGaM9kr8GcJ0
   NPQ+NN/YwTP+KM96Bn0zSIOqMtjrtqvcnuiVug4yfgpq9+Mx/NYqml4bS
   g==;
X-CSE-ConnectionGUID: Yu5xxhURS/SmMpYrT1Tt/g==
X-CSE-MsgGUID: zluInXabS9uxP2yhwu9EMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50031774"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="50031774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:01:31 -0700
X-CSE-ConnectionGUID: w27fbubwRvKgrj17m4G3kg==
X-CSE-MsgGUID: Ta9nxpdJRLqmlLMR9dH+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140217978"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2025 17:01:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHtNH-000Oki-3C;
	Thu, 22 May 2025 00:01:27 +0000
Date: Thu, 22 May 2025 08:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Message-ID: <202505220703.KaPEFG4k-lkp@intel.com>
References: <20250521080238.209678-3-bharata@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521080238.209678-3-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tip/sched/core peterz-queue/sched/core linus/master v6.15-rc7 next-20250521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/migrate-implement-migrate_misplaced_folio_batch/20250521-160958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250521080238.209678-3-bharata%40amd.com
patch subject: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
config: arm-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505220703.KaPEFG4k-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220703.KaPEFG4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220703.KaPEFG4k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:5930:36: error: no member named 'migrate_list' in 'struct task_struct'
    5930 |         list_add_tail(&folio->lru, &task->migrate_list);
         |                                     ~~~~  ^
>> mm/memory.c:5931:8: error: no member named 'migrate_count' in 'struct task_struct'
    5931 |         task->migrate_count += nr_pages;
         |         ~~~~  ^
   2 errors generated.


vim +5930 mm/memory.c

  5861	
  5862	static vm_fault_t do_numa_page(struct vm_fault *vmf)
  5863	{
  5864		struct task_struct *task = current;
  5865		struct vm_area_struct *vma = vmf->vma;
  5866		struct folio *folio = NULL;
  5867		int nid = NUMA_NO_NODE;
  5868		bool writable = false, ignore_writable = false;
  5869		bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
  5870		int last_cpupid = (-1 & LAST_CPUPID_MASK);
  5871		int target_nid;
  5872		pte_t pte, old_pte;
  5873		int flags = 0, nr_pages;
  5874	
  5875		/*
  5876		 * The pte cannot be used safely until we verify, while holding the page
  5877		 * table lock, that its contents have not changed during fault handling.
  5878		 */
  5879		spin_lock(vmf->ptl);
  5880		/* Read the live PTE from the page tables: */
  5881		old_pte = ptep_get(vmf->pte);
  5882	
  5883		if (unlikely(!pte_same(old_pte, vmf->orig_pte))) {
  5884			pte_unmap_unlock(vmf->pte, vmf->ptl);
  5885			return 0;
  5886		}
  5887	
  5888		pte = pte_modify(old_pte, vma->vm_page_prot);
  5889	
  5890		/*
  5891		 * Detect now whether the PTE could be writable; this information
  5892		 * is only valid while holding the PT lock.
  5893		 */
  5894		writable = pte_write(pte);
  5895		if (!writable && pte_write_upgrade &&
  5896		    can_change_pte_writable(vma, vmf->address, pte))
  5897			writable = true;
  5898	
  5899		folio = vm_normal_folio(vma, vmf->address, pte);
  5900		if (!folio || folio_is_zone_device(folio))
  5901			goto out_map;
  5902	
  5903		nid = folio_nid(folio);
  5904		nr_pages = folio_nr_pages(folio);
  5905	
  5906		/*
  5907		 * If it is a non-LRU folio, it has been already
  5908		 * isolated and is in migration list.
  5909		 */
  5910		if (!folio_test_lru(folio))
  5911			goto out_map;
  5912	
  5913		target_nid = numa_migrate_check(folio, vmf, vmf->address, &flags,
  5914						writable, &last_cpupid);
  5915		if (target_nid == NUMA_NO_NODE)
  5916			goto out_map;
  5917		if (migrate_misplaced_folio_prepare(folio, vma, target_nid)) {
  5918			flags |= TNF_MIGRATE_FAIL;
  5919			goto out_map;
  5920		}
  5921		writable = false;
  5922		ignore_writable = true;
  5923		nid = target_nid;
  5924	
  5925		/*
  5926		 * Store target_nid in last_cpupid field for the isolated
  5927		 * folios.
  5928		 */
  5929		folio_xchg_last_cpupid(folio, target_nid);
> 5930		list_add_tail(&folio->lru, &task->migrate_list);
> 5931		task->migrate_count += nr_pages;
  5932	out_map:
  5933		/*
  5934		 * Make it present again, depending on how arch implements
  5935		 * non-accessible ptes, some can allow access by kernel mode.
  5936		 */
  5937		if (folio && folio_test_large(folio))
  5938			numa_rebuild_large_mapping(vmf, vma, folio, pte, ignore_writable,
  5939						   pte_write_upgrade);
  5940		else
  5941			numa_rebuild_single_mapping(vmf, vma, vmf->address, vmf->pte,
  5942						    writable);
  5943		pte_unmap_unlock(vmf->pte, vmf->ptl);
  5944	
  5945		if (nid != NUMA_NO_NODE)
  5946			task_numa_fault(last_cpupid, nid, nr_pages, flags);
  5947		return 0;
  5948	}
  5949	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
