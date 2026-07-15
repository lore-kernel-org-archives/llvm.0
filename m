Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1DC3D3CF7;
	Wed, 15 Jul 2026 23:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784156864; cv=none; b=OS9SqNKdNr2kzLipLn1H2GzfyaIt/duK3V8K+S9frkPYXK7KSKhyWlWsNvmu8hwevlzLvYSWKgscbUuQywsF4y/gJywxyJHmXaiujS2KmR562Cbfk92fUNuoq314d0MfYhi+4zZZm799t3CRzama5LWoPIAl2voB+g5eQP6sY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784156864; c=relaxed/simple;
	bh=MlLspv/V7iq4P4s0pLpRXzLE5GbdlU8M7LUOp1tAWG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=As6bTUSWz0Srdh5yRxTFP7vqsp6qqvSvMjhwshvMxKZtvHy7NOg07ZESRvsGteGnXCk3bWfQjx/SBwwO0ymKmYsvdIkLJcU7RjlF3NdQ195lwn2wba/jXftPfpaSUlzpQM0f/j738YxWolkBIPdXW0qqHl+VMuJdDlekC3fCexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktsxNAsn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktsxNAsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784156862; x=1815692862;
  h=date:from:to:cc:subject:message-id;
  bh=MlLspv/V7iq4P4s0pLpRXzLE5GbdlU8M7LUOp1tAWG0=;
  b=ktsxNAsniSsBUIibk9MIDCfhcxFx9MkT519us8twBYMInxayJ6MqSItB
   Rmk4nL02kSMtH/26dqIml5gBSM/+bDtrULy6pfL+gpdhDms+k/OvocX3o
   X+WdeEwM03QTIXYjSO4uNjKHqZRf5AItXnOr8kgh8yssOaokhNLJ/bsgI
   vTXmhac76hlUE/SS8U7PirlF4kN2r5bAbtd/aJ3kOQTCtjPPaE2uNQ5iq
   kV9r8p+QcHaWemSVsLmF7e3QaU1iW2PxtM3xCVOxnkVpvU22QTDzVEkTq
   reokIyOvdmNgEbXcnlCB+ORyjYO9uJProsF2L8x6kcShCvankZw7QzJCt
   w==;
X-CSE-ConnectionGUID: UOBEa1AJQA6hhlDso2+CdA==
X-CSE-MsgGUID: hhLFrPBpSeSzgHKXSTcEew==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84693362"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84693362"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 16:07:42 -0700
X-CSE-ConnectionGUID: 8LlzoTe6SGuYDKHP/L98iA==
X-CSE-MsgGUID: VBv41epxQCiaIJzDvZ+kAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="261235179"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2026 16:07:40 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk8hV-000000004ML-48By;
	Wed, 15 Jul 2026 23:07:37 +0000
Date: Thu, 16 Jul 2026 01:07:27 +0200
From: kernel test robot <lkp@intel.com>
To: deepakraog <gaikwad.dcg@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/vmalloc.c:4442:57: error: use of undeclared identifier
 'gfp'
Message-ID: <202607160153.yE2uZTbP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/deepakraog/selftests-proc-expand-smaps-field-coverage-and-require-TMPFS/20260715-235653
head:   d9d0f9a9456e0c39c577578411fdf41e0e54deff
commit: 9d4dde17d9bbfd6739f223d0dcd79a76b445abcc mm: vrealloc: grow vm_area mappings in place
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260716/202607160153.yE2uZTbP-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160153.yE2uZTbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160153.yE2uZTbP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmalloc.c:4442:57: error: use of undeclared identifier 'gfp'
    4442 |                         pages = kvmalloc_array(extra, sizeof(struct page *), gfp);
         |                                                                              ^~~
>> mm/vmalloc.c:4442:57: error: use of undeclared identifier 'gfp'
    4442 |                         pages = kvmalloc_array(extra, sizeof(struct page *), gfp);
         |                                                                              ^~~
>> mm/vmalloc.c:4442:57: error: use of undeclared identifier 'gfp'
    4442 |                         pages = kvmalloc_array(extra, sizeof(struct page *), gfp);
         |                                                                              ^~~
   mm/vmalloc.c:4446:47: error: use of undeclared identifier 'gfp'
    4446 |                         if (vm_area_alloc_pages(vmalloc_gfp_adjust(gfp, 0), nid,
         |                                                                    ^~~
   4 errors generated.


vim +/gfp +4442 mm/vmalloc.c

  4281	
  4282	/**
  4283	 * vrealloc_node_align - reallocate virtually contiguous memory; contents
  4284	 * remain unchanged
  4285	 * @p: object to reallocate memory for
  4286	 * @size: the size to reallocate
  4287	 * @align: requested alignment
  4288	 * @flags: the flags for the page level allocator
  4289	 * @nid: node number of the target node
  4290	 *
  4291	 * If @p is %NULL, vrealloc_XXX() behaves exactly like vmalloc_XXX(). If @size
  4292	 * is 0 and @p is not a %NULL pointer, the object pointed to is freed.
  4293	 *
  4294	 * If the caller wants the new memory to be on specific node *only*,
  4295	 * __GFP_THISNODE flag should be set, otherwise the function will try to avoid
  4296	 * reallocation and possibly disregard the specified @nid.
  4297	 *
  4298	 * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
  4299	 * initial memory allocation, every subsequent call to this API for the same
  4300	 * memory allocation is flagged with __GFP_ZERO. Otherwise, it is possible that
  4301	 * __GFP_ZERO is not fully honored by this API.
  4302	 *
  4303	 * Requesting an alignment that is bigger than the alignment of the existing
  4304	 * allocation will fail.
  4305	 *
  4306	 * In any case, the contents of the object pointed to are preserved up to the
  4307	 * lesser of the new and old sizes.
  4308	 *
  4309	 * This function must not be called concurrently with itself or vfree() for the
  4310	 * same memory allocation.
  4311	 *
  4312	 * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
  4313	 *         failure
  4314	 */
  4315	void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
  4316					 gfp_t flags, int nid)
  4317	{
  4318		struct vm_struct *vm = NULL;
  4319		size_t alloced_size = 0;
  4320		size_t old_size = 0;
  4321		void *n;
  4322	
  4323		if (!size) {
  4324			vfree(p);
  4325			return NULL;
  4326		}
  4327	
  4328		if (p) {
  4329			vm = find_vm_area(p);
  4330			if (unlikely(!vm)) {
  4331				WARN(1, "Trying to vrealloc() nonexistent vm area (%p)\n", p);
  4332				return NULL;
  4333			}
  4334	
  4335			alloced_size = get_vm_area_size(vm);
  4336			old_size = vm->requested_size;
  4337			if (WARN(alloced_size < old_size,
  4338				 "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
  4339				return NULL;
  4340			if (WARN(!IS_ALIGNED((unsigned long)p, align),
  4341				 "will not reallocate with a bigger alignment (0x%lx)\n", align))
  4342				return NULL;
  4343			if (unlikely(flags & __GFP_THISNODE) && nid != NUMA_NO_NODE &&
  4344				     nid != page_to_nid(vmalloc_to_page(p)))
  4345				goto need_realloc;
  4346		} else {
  4347			/*
  4348			 * If p is NULL, vrealloc behaves exactly like vmalloc.
  4349			 * Skip the shrink and in-place grow paths.
  4350			 */
  4351			goto need_realloc;
  4352		}
  4353	
  4354		if (size <= old_size) {
  4355			unsigned int new_nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
  4356	
  4357			/* Zero out "freed" memory, potentially for future realloc. */
  4358			if (want_init_on_free() || want_init_on_alloc(flags))
  4359				memset((void *)p + size, 0, old_size - size);
  4360	
  4361			/*
  4362			 * Free tail pages when shrink crosses a page boundary.
  4363			 *
  4364			 * Skip huge page allocations (page_order > 0) as partial
  4365			 * freeing would require splitting.
  4366			 *
  4367			 * Skip VM_FLUSH_RESET_PERMS, as direct-map permissions must
  4368			 * be reset before pages are returned to the allocator.
  4369			 *
  4370			 * Skip VM_USERMAP, as remap_vmalloc_range_partial() validates
  4371			 * mapping requests against the unchanged vm->size; freeing
  4372			 * tail pages would cause vmalloc_to_page() to return NULL for
  4373			 * the unmapped range.
  4374			 *
  4375			 * Skip if either GFP_NOFS or GFP_NOIO are used.
  4376			 * kmemleak_free_part() internally allocates with
  4377			 * GFP_KERNEL, which could trigger a recursive deadlock
  4378			 * if we are under filesystem or I/O reclaim.
  4379			 */
  4380			if (new_nr_pages < vm->nr_pages && !vm_area_page_order(vm) &&
  4381			    !(vm->flags & (VM_FLUSH_RESET_PERMS | VM_USERMAP)) &&
  4382			    gfp_has_io_fs(flags)) {
  4383				unsigned long addr = (unsigned long)kasan_reset_tag(p);
  4384				unsigned int old_nr_pages = vm->nr_pages;
  4385	
  4386				/*
  4387				 * Use the node lock to synchronize with concurrent
  4388				 * readers (vmalloc_info_show).
  4389				 */
  4390				struct vmap_node *vn = addr_to_node(addr);
  4391	
  4392				spin_lock(&vn->busy.lock);
  4393				vm->nr_pages = new_nr_pages;
  4394				spin_unlock(&vn->busy.lock);
  4395	
  4396				/* Notify kmemleak of the reduced allocation size before unmapping. */
  4397				kmemleak_free_part(
  4398					(void *)addr + ((unsigned long)new_nr_pages
  4399							<< PAGE_SHIFT),
  4400					(unsigned long)(old_nr_pages - new_nr_pages)
  4401						<< PAGE_SHIFT);
  4402	
  4403				vunmap_range(addr + ((unsigned long)new_nr_pages
  4404						     << PAGE_SHIFT),
  4405					     addr + ((unsigned long)old_nr_pages
  4406						     << PAGE_SHIFT));
  4407	
  4408				vm_area_free_pages(vm, new_nr_pages, old_nr_pages);
  4409			}
  4410			vm->requested_size = size;
  4411			kasan_vrealloc(p, old_size, size);
  4412			return (void *)p;
  4413		}
  4414	
  4415		/*
  4416		 * We already have the bytes available in the allocation; use them.
  4417		 */
  4418		if (size <= vm->nr_pages << PAGE_SHIFT) {
  4419			/*
  4420			 * No need to zero memory here, as unused memory will have
  4421			 * already been zeroed at initial allocation time or during
  4422			 * realloc shrink time.
  4423			 */
  4424			vm->requested_size = size;
  4425			kasan_vrealloc(p, old_size, size);
  4426			return (void *)p;
  4427		}
  4428	
  4429		{
  4430			unsigned int new_nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
  4431			unsigned int old_nr_pages = vm->nr_pages;
  4432	
  4433			if (new_nr_pages > old_nr_pages && !vm_area_page_order(vm) &&
  4434			    !(vm->flags & (VM_FLUSH_RESET_PERMS | VM_USERMAP)) &&
  4435			    gfp_has_io_fs(flags)) {
  4436				unsigned int extra = new_nr_pages - old_nr_pages;
  4437				unsigned long addr = (unsigned long)kasan_reset_tag(p);
  4438				struct vmap_node *vn = addr_to_node(addr);
  4439				struct page **pages;
  4440				int ret;
  4441	
> 4442				pages = kvmalloc_array(extra, sizeof(struct page *), gfp);
  4443				if (!pages)
  4444					goto need_realloc;
  4445	
  4446				if (vm_area_alloc_pages(vmalloc_gfp_adjust(gfp, 0), nid,
  4447							0, extra, pages) != extra) {
  4448					kvfree(pages);
  4449					goto need_realloc;
  4450				}
  4451	
  4452				spin_lock(&vn->busy.lock);
  4453				ret = vmap_pages_range(addr + ((unsigned long)old_nr_pages
  4454							       << PAGE_SHIFT),
  4455						       addr + ((unsigned long)new_nr_pages
  4456							       << PAGE_SHIFT),
  4457						       PAGE_KERNEL, pages, PAGE_SHIFT);
  4458				spin_unlock(&vn->busy.lock);
  4459				if (ret < 0) {
  4460					free_pages_bulk(pages, extra);
  4461					kvfree(pages);
  4462					goto need_realloc;
  4463				}
  4464	
  4465				memcpy(&vm->pages[old_nr_pages], pages,
  4466				       extra * sizeof(struct page *));
  4467				kvfree(pages);
  4468				vm->nr_pages = new_nr_pages;
  4469				vm->requested_size = size;
  4470				kasan_vrealloc(p, old_size, size);
  4471				if (want_init_on_alloc(flags))
  4472					memset((void *)p + old_size, 0, size - old_size);
  4473				return (void *)p;
  4474			}
  4475		}
  4476	
  4477	need_realloc:
  4478		/* Fall back to a fresh vm_area when in-place grow is not possible. */
  4479		n = __vmalloc_node_noprof(size, align, flags, nid, __builtin_return_address(0));
  4480	
  4481		if (!n)
  4482			return NULL;
  4483	
  4484		if (p) {
  4485			memcpy(n, p, min(size, old_size));
  4486			vfree(p);
  4487		}
  4488	
  4489		return n;
  4490	}
  4491	EXPORT_SYMBOL(vrealloc_node_align_noprof);
  4492	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
