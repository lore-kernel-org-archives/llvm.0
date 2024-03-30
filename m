Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9082F25;
	Sat, 30 Mar 2024 03:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711770502; cv=none; b=LHGvIrsH5QxmOhnZiYChsCrv/RWgH4ErjjA87JA2TZxDRgkkoVVgn1s/eCC3gCFNPIug9QqZfKxUFGW5XqiwYTv4l1Ax5QqIPd692ywePqnRZQGutpRrtmAP0MbXwvs9V9EGqIGp/aZW+QpxAlacmteRQw28PI5OZvsxn2DPPs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711770502; c=relaxed/simple;
	bh=rMTX8SShabgamjOz+FQevaDHXe0PdhWPgbv7uUaYb/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pndrcy+UcWWSxSZlyi3FRBNGSzdiP0zIqKO7lnF22JMl24cCMEsD6R3PdD9sf1xbuih/Imtq1Y4+rFcb99eF4WGeDGY2dciP4Jel0UWoVPR94d9WruqctU8MhrqWxJSVvOw2AuJaq8qFvIOWCnOwAqS496YbH46NutQizTrxrSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj0UPwxi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj0UPwxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711770500; x=1743306500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rMTX8SShabgamjOz+FQevaDHXe0PdhWPgbv7uUaYb/4=;
  b=Fj0UPwxi+300Dx2yLKJuuZ8ZFAqOUT99FzXN1y3w1c6z0S1Hts5q4G3b
   beiQjFz4bttQJW8PZFAMh+70enPW4IQAJ5WadXFQuiVC93iPdGBE6Yi4r
   pri0ls2z5mPB3qvHtdAoKL4ANAXDqBb/md5e/Wyj6XuXn9mmfDfMoQl1E
   N/EVSMWmLY83cfTJ9B5Q4HSgrpLdUQrb96InYGk++RDkPqPZ5Fz4w7OBJ
   xcJQaSOOe3SLu8ToON20GkjTk8a5LWyM01cx4agAk/Qh8SBTeJXCiWxJy
   pV8G7dGy+SLzkNPMDYpam07Y6NWqyiHR6xfdgfJfSaG/468D35iY3hcLU
   g==;
X-CSE-ConnectionGUID: pMYeMGWnSSGVa27Y+LZKcA==
X-CSE-MsgGUID: 3n8/SAfcT963VM1+6wxx9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="6794323"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="6794323"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 20:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17553313"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Mar 2024 20:48:18 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqPhX-0003uw-1w;
	Sat, 30 Mar 2024 03:48:15 +0000
Date: Sat, 30 Mar 2024 11:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] sched/numa: Fault count based NUMA hint fault
 latency
Message-ID: <202403301111.fNcnRPWz-lkp@intel.com>
References: <20240327160237.2355-2-bharata@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160237.2355-2-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on peterz-queue/sched/core]
[also build test ERROR on linus/master v6.9-rc1 next-20240328]
[cannot apply to akpm-mm/mm-everything tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/sched-numa-Fault-count-based-NUMA-hint-fault-latency/20240328-000607
base:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
patch link:    https://lore.kernel.org/r/20240327160237.2355-2-bharata%40amd.com
patch subject: [RFC PATCH 1/2] sched/numa: Fault count based NUMA hint fault latency
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240330/202403301111.fNcnRPWz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301111.fNcnRPWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301111.fNcnRPWz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:4804:26: error: no member named 'hint_faults' in 'struct mm_struct'
           atomic_inc(&vma->vm_mm->hint_faults);
                       ~~~~~~~~~~  ^
   1 error generated.
--
>> mm/mprotect.c:163:33: error: no member named 'hint_faults' in 'struct mm_struct'
                                                           atomic_read(&vma->vm_mm->hint_faults));
                                                                        ~~~~~~~~~~  ^
   1 error generated.


vim +4804 mm/memory.c

  4792	
  4793	static vm_fault_t do_numa_page(struct vm_fault *vmf)
  4794	{
  4795		struct vm_area_struct *vma = vmf->vma;
  4796		struct folio *folio = NULL;
  4797		int nid = NUMA_NO_NODE;
  4798		bool writable = false;
  4799		int last_cpupid;
  4800		int target_nid;
  4801		pte_t pte, old_pte;
  4802		int flags = 0;
  4803	
> 4804		atomic_inc(&vma->vm_mm->hint_faults);
  4805	
  4806		/*
  4807		 * The "pte" at this point cannot be used safely without
  4808		 * validation through pte_unmap_same(). It's of NUMA type but
  4809		 * the pfn may be screwed if the read is non atomic.
  4810		 */
  4811		spin_lock(vmf->ptl);
  4812		if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
  4813			pte_unmap_unlock(vmf->pte, vmf->ptl);
  4814			goto out;
  4815		}
  4816	
  4817		/* Get the normal PTE  */
  4818		old_pte = ptep_get(vmf->pte);
  4819		pte = pte_modify(old_pte, vma->vm_page_prot);
  4820	
  4821		/*
  4822		 * Detect now whether the PTE could be writable; this information
  4823		 * is only valid while holding the PT lock.
  4824		 */
  4825		writable = pte_write(pte);
  4826		if (!writable && vma_wants_manual_pte_write_upgrade(vma) &&
  4827		    can_change_pte_writable(vma, vmf->address, pte))
  4828			writable = true;
  4829	
  4830		folio = vm_normal_folio(vma, vmf->address, pte);
  4831		if (!folio || folio_is_zone_device(folio))
  4832			goto out_map;
  4833	
  4834		/* TODO: handle PTE-mapped THP */
  4835		if (folio_test_large(folio))
  4836			goto out_map;
  4837	
  4838		/*
  4839		 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
  4840		 * much anyway since they can be in shared cache state. This misses
  4841		 * the case where a mapping is writable but the process never writes
  4842		 * to it but pte_write gets cleared during protection updates and
  4843		 * pte_dirty has unpredictable behaviour between PTE scan updates,
  4844		 * background writeback, dirty balancing and application behaviour.
  4845		 */
  4846		if (!writable)
  4847			flags |= TNF_NO_GROUP;
  4848	
  4849		/*
  4850		 * Flag if the folio is shared between multiple address spaces. This
  4851		 * is later used when determining whether to group tasks together
  4852		 */
  4853		if (folio_estimated_sharers(folio) > 1 && (vma->vm_flags & VM_SHARED))
  4854			flags |= TNF_SHARED;
  4855	
  4856		nid = folio_nid(folio);
  4857		/*
  4858		 * For memory tiering mode, cpupid of slow memory page is used
  4859		 * to record page access time.  So use default value.
  4860		 */
  4861		if ((sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
  4862		    !node_is_toptier(nid))
  4863			last_cpupid = (-1 & LAST_CPUPID_MASK);
  4864		else
  4865			last_cpupid = folio_last_cpupid(folio);
  4866		target_nid = numa_migrate_prep(folio, vma, vmf->address, nid, &flags);
  4867		if (target_nid == NUMA_NO_NODE) {
  4868			folio_put(folio);
  4869			goto out_map;
  4870		}
  4871		pte_unmap_unlock(vmf->pte, vmf->ptl);
  4872		writable = false;
  4873	
  4874		/* Migrate to the requested node */
  4875		if (migrate_misplaced_folio(folio, vma, target_nid)) {
  4876			nid = target_nid;
  4877			flags |= TNF_MIGRATED;
  4878		} else {
  4879			flags |= TNF_MIGRATE_FAIL;
  4880			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
  4881						       vmf->address, &vmf->ptl);
  4882			if (unlikely(!vmf->pte))
  4883				goto out;
  4884			if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
  4885				pte_unmap_unlock(vmf->pte, vmf->ptl);
  4886				goto out;
  4887			}
  4888			goto out_map;
  4889		}
  4890	
  4891	out:
  4892		if (nid != NUMA_NO_NODE)
  4893			task_numa_fault(last_cpupid, nid, 1, flags);
  4894		return 0;
  4895	out_map:
  4896		/*
  4897		 * Make it present again, depending on how arch implements
  4898		 * non-accessible ptes, some can allow access by kernel mode.
  4899		 */
  4900		old_pte = ptep_modify_prot_start(vma, vmf->address, vmf->pte);
  4901		pte = pte_modify(old_pte, vma->vm_page_prot);
  4902		pte = pte_mkyoung(pte);
  4903		if (writable)
  4904			pte = pte_mkwrite(pte, vma);
  4905		ptep_modify_prot_commit(vma, vmf->address, vmf->pte, old_pte, pte);
  4906		update_mmu_cache_range(vmf, vma, vmf->address, vmf->pte, 1);
  4907		pte_unmap_unlock(vmf->pte, vmf->ptl);
  4908		goto out;
  4909	}
  4910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
