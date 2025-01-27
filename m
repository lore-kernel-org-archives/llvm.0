Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81DB13C809;
	Mon, 27 Jan 2025 20:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738010150; cv=none; b=PXO/OtUg7swbfMNmJQoA1OgbyVcIzRLH64nR4wlVMPlWqBQHBWr68vXsvjzXRAF0VLRBax5kXIcUjqEbnfRvS1pym7q6t0RPsSqZIJtYBUxEmRmyOyj0k5h1+MPA9ddt1tCts7/ON69djUk1Io1FyY6zaTrqQURAsJhVai/OAfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738010150; c=relaxed/simple;
	bh=w/wD3uESN/rV6akSAOPbkfLQV1WXV/RH4R6OaenX90E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+jCMC5iNA6RhO9uogtHQyKbCJGutTmDVjnDSEz4DH9PXziUCPADycDb2QIgHm9lya5ZgzEdtA71bD1pSwHTJ1EPzM2fTVFhZHOlH0Fz14B8DZzCWhOIGq42+jdz69JAWcciqKLAIjGVFi94xHTjL8FSwNdzE7wT7REGT7uqIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuWu9Hqq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuWu9Hqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738010148; x=1769546148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w/wD3uESN/rV6akSAOPbkfLQV1WXV/RH4R6OaenX90E=;
  b=iuWu9HqqGt8sa0MYK4GWlZLtQ23EYvoJ3xSqwNr6/LUK/7NedeeIPdQg
   dGdd9CbxLyb1ZiXivbusNMwvKnl1IewUCVE/LXS12nyTtEIBLUX1lf9OJ
   RVvYQfC1Uy01G6lEDDp7I8J0VtBk1wYigWUVQPUlSVesDEnr2TiVJ5yUx
   T4V87pHytRGVYIixh9TRYXYoLB9+FeT314ElF9kU8nQFymtvYW2c9Y2Mp
   ynop3UUZPLfDCvg80Uu3213tZ+qDrvZc3rnS6PM4zt+yQMGvxvXvfoHBj
   ZagmE/3X4KWQal7CVR5FN8ystaeY5KRgHVxlVIRMsWAbFnfa3EAxDvi2a
   g==;
X-CSE-ConnectionGUID: yr5SVuHmTc+Q7jiGXn3jPA==
X-CSE-MsgGUID: mKpwypbITgatcdAROImhkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63845724"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="63845724"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 12:35:47 -0800
X-CSE-ConnectionGUID: TCgK1d2FQleVCDa1DOUjfQ==
X-CSE-MsgGUID: 2Yk18LAEQn2l97MUvGOaBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113171424"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jan 2025 12:35:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcVpf-000h8b-10;
	Mon, 27 Jan 2025 20:35:43 +0000
Date: Tue, 28 Jan 2025 04:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: completely abstract unnecessary adj_start
 calculation
Message-ID: <202501280408.9NtSz2Lt-lkp@intel.com>
References: <ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-simplify-vma-merge-structure-and-expand-comments/20250127-235322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 5/5] mm: completely abstract unnecessary adj_start calculation
config: hexagon-randconfig-002-20250128 (https://download.01.org/0day-ci/archive/20250128/202501280408.9NtSz2Lt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280408.9NtSz2Lt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280408.9NtSz2Lt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vma.c:518:50: warning: incompatible pointer to integer conversion passing 'void *' to parameter of type 'long' [-Wint-conversion]
           vma_adjust_trans_huge(vma, vma->vm_start, addr, NULL);
                                                           ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   include/linux/huge_mm.h:574:12: note: passing argument to parameter 'adjust_next' here
                                            long adjust_next)
                                                 ^
>> mm/vma.c:704:10: warning: incompatible pointer to integer conversion passing 'struct vm_area_struct *' to parameter of type 'long' [-Wint-conversion]
                                 adj_middle ? vmg->middle : NULL);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:574:12: note: passing argument to parameter 'adjust_next' here
                                            long adjust_next)
                                                 ^
   mm/vma.c:1141:41: warning: incompatible pointer to integer conversion passing 'void *' to parameter of type 'long' [-Wint-conversion]
           vma_adjust_trans_huge(vma, start, end, NULL);
                                                  ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   include/linux/huge_mm.h:574:12: note: passing argument to parameter 'adjust_next' here
                                            long adjust_next)
                                                 ^
   3 warnings generated.


vim +518 mm/vma.c

   459	
   460	/*
   461	 * __split_vma() bypasses sysctl_max_map_count checking.  We use this where it
   462	 * has already been checked or doesn't make sense to fail.
   463	 * VMA Iterator will point to the original VMA.
   464	 */
   465	static __must_check int
   466	__split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
   467		    unsigned long addr, int new_below)
   468	{
   469		struct vma_prepare vp;
   470		struct vm_area_struct *new;
   471		int err;
   472	
   473		WARN_ON(vma->vm_start >= addr);
   474		WARN_ON(vma->vm_end <= addr);
   475	
   476		if (vma->vm_ops && vma->vm_ops->may_split) {
   477			err = vma->vm_ops->may_split(vma, addr);
   478			if (err)
   479				return err;
   480		}
   481	
   482		new = vm_area_dup(vma);
   483		if (!new)
   484			return -ENOMEM;
   485	
   486		if (new_below) {
   487			new->vm_end = addr;
   488		} else {
   489			new->vm_start = addr;
   490			new->vm_pgoff += ((addr - vma->vm_start) >> PAGE_SHIFT);
   491		}
   492	
   493		err = -ENOMEM;
   494		vma_iter_config(vmi, new->vm_start, new->vm_end);
   495		if (vma_iter_prealloc(vmi, new))
   496			goto out_free_vma;
   497	
   498		err = vma_dup_policy(vma, new);
   499		if (err)
   500			goto out_free_vmi;
   501	
   502		err = anon_vma_clone(new, vma);
   503		if (err)
   504			goto out_free_mpol;
   505	
   506		if (new->vm_file)
   507			get_file(new->vm_file);
   508	
   509		if (new->vm_ops && new->vm_ops->open)
   510			new->vm_ops->open(new);
   511	
   512		vma_start_write(vma);
   513		vma_start_write(new);
   514	
   515		init_vma_prep(&vp, vma);
   516		vp.insert = new;
   517		vma_prepare(&vp);
 > 518		vma_adjust_trans_huge(vma, vma->vm_start, addr, NULL);
   519	
   520		if (new_below) {
   521			vma->vm_start = addr;
   522			vma->vm_pgoff += (addr - new->vm_start) >> PAGE_SHIFT;
   523		} else {
   524			vma->vm_end = addr;
   525		}
   526	
   527		/* vma_complete stores the new vma */
   528		vma_complete(&vp, vmi, vma->vm_mm);
   529		validate_mm(vma->vm_mm);
   530	
   531		/* Success. */
   532		if (new_below)
   533			vma_next(vmi);
   534		else
   535			vma_prev(vmi);
   536	
   537		return 0;
   538	
   539	out_free_mpol:
   540		mpol_put(vma_policy(new));
   541	out_free_vmi:
   542		vma_iter_free(vmi);
   543	out_free_vma:
   544		vm_area_free(new);
   545		return err;
   546	}
   547	
   548	/*
   549	 * Split a vma into two pieces at address 'addr', a new vma is allocated
   550	 * either for the first part or the tail.
   551	 */
   552	static int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
   553			     unsigned long addr, int new_below)
   554	{
   555		if (vma->vm_mm->map_count >= sysctl_max_map_count)
   556			return -ENOMEM;
   557	
   558		return __split_vma(vmi, vma, addr, new_below);
   559	}
   560	
   561	/*
   562	 * dup_anon_vma() - Helper function to duplicate anon_vma
   563	 * @dst: The destination VMA
   564	 * @src: The source VMA
   565	 * @dup: Pointer to the destination VMA when successful.
   566	 *
   567	 * Returns: 0 on success.
   568	 */
   569	static int dup_anon_vma(struct vm_area_struct *dst,
   570				struct vm_area_struct *src, struct vm_area_struct **dup)
   571	{
   572		/*
   573		 * Easily overlooked: when mprotect shifts the boundary, make sure the
   574		 * expanding vma has anon_vma set if the shrinking vma had, to cover any
   575		 * anon pages imported.
   576		 */
   577		if (src->anon_vma && !dst->anon_vma) {
   578			int ret;
   579	
   580			vma_assert_write_locked(dst);
   581			dst->anon_vma = src->anon_vma;
   582			ret = anon_vma_clone(dst, src);
   583			if (ret)
   584				return ret;
   585	
   586			*dup = dst;
   587		}
   588	
   589		return 0;
   590	}
   591	
   592	#ifdef CONFIG_DEBUG_VM_MAPLE_TREE
   593	void validate_mm(struct mm_struct *mm)
   594	{
   595		int bug = 0;
   596		int i = 0;
   597		struct vm_area_struct *vma;
   598		VMA_ITERATOR(vmi, mm, 0);
   599	
   600		mt_validate(&mm->mm_mt);
   601		for_each_vma(vmi, vma) {
   602	#ifdef CONFIG_DEBUG_VM_RB
   603			struct anon_vma *anon_vma = vma->anon_vma;
   604			struct anon_vma_chain *avc;
   605	#endif
   606			unsigned long vmi_start, vmi_end;
   607			bool warn = 0;
   608	
   609			vmi_start = vma_iter_addr(&vmi);
   610			vmi_end = vma_iter_end(&vmi);
   611			if (VM_WARN_ON_ONCE_MM(vma->vm_end != vmi_end, mm))
   612				warn = 1;
   613	
   614			if (VM_WARN_ON_ONCE_MM(vma->vm_start != vmi_start, mm))
   615				warn = 1;
   616	
   617			if (warn) {
   618				pr_emerg("issue in %s\n", current->comm);
   619				dump_stack();
   620				dump_vma(vma);
   621				pr_emerg("tree range: %px start %lx end %lx\n", vma,
   622					 vmi_start, vmi_end - 1);
   623				vma_iter_dump_tree(&vmi);
   624			}
   625	
   626	#ifdef CONFIG_DEBUG_VM_RB
   627			if (anon_vma) {
   628				anon_vma_lock_read(anon_vma);
   629				list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
   630					anon_vma_interval_tree_verify(avc);
   631				anon_vma_unlock_read(anon_vma);
   632			}
   633	#endif
   634			/* Check for a infinite loop */
   635			if (++i > mm->map_count + 10) {
   636				i = -1;
   637				break;
   638			}
   639		}
   640		if (i != mm->map_count) {
   641			pr_emerg("map_count %d vma iterator %d\n", mm->map_count, i);
   642			bug = 1;
   643		}
   644		VM_BUG_ON_MM(bug, mm);
   645	}
   646	#endif /* CONFIG_DEBUG_VM_MAPLE_TREE */
   647	
   648	/*
   649	 * Based on the vmg flag indicating whether we need to adjust the vm_start field
   650	 * for the middle or next VMA, we calculate what the range of the newly adjusted
   651	 * VMA ought to be, and set the VMA's range accordingly.
   652	 */
   653	static void vmg_adjust_set_range(struct vma_merge_struct *vmg)
   654	{
   655		unsigned long flags = vmg->merge_flags;
   656		struct vm_area_struct *adjust;
   657		pgoff_t pgoff;
   658	
   659		if (flags & __VMG_FLAG_ADJUST_MIDDLE_START) {
   660			adjust = vmg->middle;
   661			pgoff = adjust->vm_pgoff + PHYS_PFN(vmg->end - adjust->vm_start);
   662		} else if (flags & __VMG_FLAG_ADJUST_NEXT_START) {
   663			adjust = vmg->next;
   664			pgoff = adjust->vm_pgoff - PHYS_PFN(adjust->vm_start - vmg->end);
   665		} else {
   666			return;
   667		}
   668	
   669		vma_set_range(adjust, vmg->end, adjust->vm_end, pgoff);
   670	}
   671	
   672	/*
   673	 * Actually perform the VMA merge operation.
   674	 *
   675	 * On success, returns the merged VMA. Otherwise returns NULL.
   676	 */
   677	static int commit_merge(struct vma_merge_struct *vmg)
   678	{
   679		struct vm_area_struct *vma;
   680		struct vma_prepare vp;
   681		bool adj_middle = vmg->merge_flags & __VMG_FLAG_ADJUST_MIDDLE_START;
   682	
   683		if (vmg->merge_flags & __VMG_FLAG_ADJUST_NEXT_START) {
   684			/* In this case we manipulate middle and return next. */
   685			vma = vmg->middle;
   686			vma_iter_config(vmg->vmi, vmg->end, vmg->next->vm_end);
   687		} else {
   688			vma = vmg->target;
   689			 /* Note: vma iterator must be pointing to 'start'. */
   690			vma_iter_config(vmg->vmi, vmg->start, vmg->end);
   691		}
   692	
   693		init_multi_vma_prep(&vp, vma, vmg);
   694	
   695		if (vma_iter_prealloc(vmg->vmi, vma))
   696			return -ENOMEM;
   697	
   698		vma_prepare(&vp);
   699		/*
   700		 * THP pages may need to do additional splits if we increase
   701		 * middle->vm_start.
   702		 */
   703		vma_adjust_trans_huge(vma, vmg->start, vmg->end,
 > 704				      adj_middle ? vmg->middle : NULL);
   705		vma_set_range(vma, vmg->start, vmg->end, vmg->pgoff);
   706		vmg_adjust_set_range(vmg);
   707		vma_iter_store(vmg->vmi, vmg->target);
   708	
   709		vma_complete(&vp, vmg->vmi, vma->vm_mm);
   710	
   711		return 0;
   712	}
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
