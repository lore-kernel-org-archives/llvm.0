Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734CC25774;
	Wed,  7 Feb 2024 14:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707315366; cv=none; b=Nk1JaMOB4JrMUz7DjV/0Xt4FMUpU4q7jHk87YmDW1Kb4obT0a5rGmjExDxS79GXQL0uP7Gp9LoSMivBjSw9zPC11tdz8SGzmLg4pqPUzvbMNgx4U0pgacYZjutwpNFGZSHoQAQOqwHiOtNBEwqVbM5d1rnm8Quiqkd5MPfXQL2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707315366; c=relaxed/simple;
	bh=ucc0bv4qSjVJQ4Fk92jBqmvowpPSQ2AYO1ifQjFeHnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F9iegKmsUZxW+xfNpJaL5qDtwSprEZo76JsSNpni9t1CF5UFzwQiX04XWUQ9y3BbgNsl2NJtwSRNtpD9swc1fFzmnqljjBlPxssX0rROiXtdU5zAiDkix5IKqISaKJc1nE3d0gS+yFy1S/P6/zg5afLYYvumHOZk6I2Vzh9cjPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmOm4ITN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmOm4ITN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707315362; x=1738851362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ucc0bv4qSjVJQ4Fk92jBqmvowpPSQ2AYO1ifQjFeHnA=;
  b=gmOm4ITNX/yCNGw1vFJJXaflYGfpEO8L7m0y0dnw8u2KvW1vNjB+vgcr
   cIDWcytsOBgEk2vSKfu+wwOOz7X1c0y0ZHrWevOOofIMimOyw5UAgC3fi
   E1NwxcBAbDSz+CmcVdiAvw/vxKGDAJW90UjJO1LruNBfVpEwVbxbqo10n
   HPI7P2oKUr97RFK0fuCOZix8QLjblnom1Qge7ShDWO51AWFgzpl+smNR8
   vDM5UUvLDsYjx/jF/Xqu/YLgrTIMpsVMdwnbYBF2f9CCXxmjPkWofjMaX
   1MGG+XLcr7Yw9o4Aat4eAbZ0afwJPFubnL2pEj8ly9aDmvzLt4xDbBF1U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="875718"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="875718"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 06:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="910003321"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="910003321"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2024 06:15:57 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXiiR-0002hM-0W;
	Wed, 07 Feb 2024 14:15:55 +0000
Date: Wed, 7 Feb 2024 22:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4182/4898] mm/memory.c:4004:8: error: call to
 undeclared function 'swapcache_prepare'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202402072205.8TguS1fC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ae0a045e6814c8c1d676d6153c605a65746aa29
commit: 1fa5b77af107e20ab4212c32673b2f953b796a63 [4182/4898] mm/swap: fix race condition in direct swapin path
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240207/202402072205.8TguS1fC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402072205.8TguS1fC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402072205.8TguS1fC-lkp@intel.com/

Note: the linux-next/master HEAD 2ae0a045e6814c8c1d676d6153c605a65746aa29 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from mm/memory.c:84:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> mm/memory.c:4004:8: error: call to undeclared function 'swapcache_prepare'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4004 |                         if (swapcache_prepare(entry))
         |                             ^
   mm/memory.c:4004:8: note: did you mean 'swapcache_clear'?
   mm/swap.h:101:20: note: 'swapcache_clear' declared here
     101 | static inline void swapcache_clear(struct swap_info_struct *si, swp_entry_t entry)
         |                    ^
   12 warnings and 1 error generated.


vim +/swapcache_prepare +4004 mm/memory.c

  3909	
  3910	/*
  3911	 * We enter with non-exclusive mmap_lock (to exclude vma changes,
  3912	 * but allow concurrent faults), and pte mapped but not yet locked.
  3913	 * We return with pte unmapped and unlocked.
  3914	 *
  3915	 * We return with the mmap_lock locked or unlocked in the same cases
  3916	 * as does filemap_fault().
  3917	 */
  3918	vm_fault_t do_swap_page(struct vm_fault *vmf)
  3919	{
  3920		struct vm_area_struct *vma = vmf->vma;
  3921		struct folio *swapcache, *folio = NULL;
  3922		struct page *page;
  3923		struct swap_info_struct *si = NULL;
  3924		rmap_t rmap_flags = RMAP_NONE;
  3925		bool exclusive = false;
  3926		swp_entry_t entry;
  3927		pte_t pte;
  3928		vm_fault_t ret = 0;
  3929		void *shadow = NULL;
  3930	
  3931		if (!pte_unmap_same(vmf))
  3932			goto out;
  3933	
  3934		entry = pte_to_swp_entry(vmf->orig_pte);
  3935		if (unlikely(non_swap_entry(entry))) {
  3936			if (is_migration_entry(entry)) {
  3937				migration_entry_wait(vma->vm_mm, vmf->pmd,
  3938						     vmf->address);
  3939			} else if (is_device_exclusive_entry(entry)) {
  3940				vmf->page = pfn_swap_entry_to_page(entry);
  3941				ret = remove_device_exclusive_entry(vmf);
  3942			} else if (is_device_private_entry(entry)) {
  3943				if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
  3944					/*
  3945					 * migrate_to_ram is not yet ready to operate
  3946					 * under VMA lock.
  3947					 */
  3948					vma_end_read(vma);
  3949					ret = VM_FAULT_RETRY;
  3950					goto out;
  3951				}
  3952	
  3953				vmf->page = pfn_swap_entry_to_page(entry);
  3954				vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
  3955						vmf->address, &vmf->ptl);
  3956				if (unlikely(!vmf->pte ||
  3957					     !pte_same(ptep_get(vmf->pte),
  3958								vmf->orig_pte)))
  3959					goto unlock;
  3960	
  3961				/*
  3962				 * Get a page reference while we know the page can't be
  3963				 * freed.
  3964				 */
  3965				get_page(vmf->page);
  3966				pte_unmap_unlock(vmf->pte, vmf->ptl);
  3967				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
  3968				put_page(vmf->page);
  3969			} else if (is_hwpoison_entry(entry)) {
  3970				ret = VM_FAULT_HWPOISON;
  3971			} else if (is_pte_marker_entry(entry)) {
  3972				ret = handle_pte_marker(vmf);
  3973			} else {
  3974				print_bad_pte(vma, vmf->address, vmf->orig_pte, NULL);
  3975				ret = VM_FAULT_SIGBUS;
  3976			}
  3977			goto out;
  3978		}
  3979	
  3980		/* Prevent swapoff from happening to us. */
  3981		si = get_swap_device(entry);
  3982		if (unlikely(!si))
  3983			goto out;
  3984	
  3985		folio = swap_cache_get_folio(entry, vma, vmf->address);
  3986		if (folio)
  3987			page = folio_file_page(folio, swp_offset(entry));
  3988		swapcache = folio;
  3989	
  3990		if (!folio) {
  3991			if (data_race(si->flags & SWP_SYNCHRONOUS_IO) &&
  3992			    __swap_count(entry) == 1) {
  3993				/*
  3994				 * With swap count == 1, after we read the entry,
  3995				 * other threads could finish swapin first, free
  3996				 * the entry, then swapout the modified page using
  3997				 * the same entry. Now the content we just read is
  3998				 * stalled, and it's undetectable as pte_same()
  3999				 * returns true due to entry reuse.
  4000				 *
  4001				 * So pin the swap entry using the cache flag even
  4002				 * cache is not used.
  4003				 */
> 4004				if (swapcache_prepare(entry))
  4005					goto out;
  4006	
  4007				/* skip swapcache */
  4008				folio = vma_alloc_folio(GFP_HIGHUSER_MOVABLE, 0,
  4009							vma, vmf->address, false);
  4010				page = &folio->page;
  4011				if (folio) {
  4012					__folio_set_locked(folio);
  4013					__folio_set_swapbacked(folio);
  4014	
  4015					if (mem_cgroup_swapin_charge_folio(folio,
  4016								vma->vm_mm, GFP_KERNEL,
  4017								entry)) {
  4018						ret = VM_FAULT_OOM;
  4019						goto out_page;
  4020					}
  4021					mem_cgroup_swapin_uncharge_swap(entry);
  4022	
  4023					shadow = get_shadow_from_swap_cache(entry);
  4024					if (shadow)
  4025						workingset_refault(folio, shadow);
  4026	
  4027					folio_add_lru(folio);
  4028	
  4029					/* To provide entry to swap_read_folio() */
  4030					folio->swap = entry;
  4031					swap_read_folio(folio, true, NULL);
  4032					folio->private = NULL;
  4033				}
  4034			} else {
  4035				page = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE,
  4036							vmf);
  4037				if (page)
  4038					folio = page_folio(page);
  4039				swapcache = folio;
  4040			}
  4041	
  4042			if (!folio) {
  4043				/*
  4044				 * Back out if somebody else faulted in this pte
  4045				 * while we released the pte lock.
  4046				 */
  4047				vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
  4048						vmf->address, &vmf->ptl);
  4049				if (likely(vmf->pte &&
  4050					   pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
  4051					ret = VM_FAULT_OOM;
  4052				goto unlock;
  4053			}
  4054	
  4055			/* Had to read the page from swap area: Major fault */
  4056			ret = VM_FAULT_MAJOR;
  4057			count_vm_event(PGMAJFAULT);
  4058			count_memcg_event_mm(vma->vm_mm, PGMAJFAULT);
  4059		} else if (PageHWPoison(page)) {
  4060			/*
  4061			 * hwpoisoned dirty swapcache pages are kept for killing
  4062			 * owner processes (which may be unknown at hwpoison time)
  4063			 */
  4064			ret = VM_FAULT_HWPOISON;
  4065			goto out_release;
  4066		}
  4067	
  4068		ret |= folio_lock_or_retry(folio, vmf);
  4069		if (ret & VM_FAULT_RETRY)
  4070			goto out_release;
  4071	
  4072		if (swapcache) {
  4073			/*
  4074			 * Make sure folio_free_swap() or swapoff did not release the
  4075			 * swapcache from under us.  The page pin, and pte_same test
  4076			 * below, are not enough to exclude that.  Even if it is still
  4077			 * swapcache, we need to check that the page's swap has not
  4078			 * changed.
  4079			 */
  4080			if (unlikely(!folio_test_swapcache(folio) ||
  4081				     page_swap_entry(page).val != entry.val))
  4082				goto out_page;
  4083	
  4084			/*
  4085			 * KSM sometimes has to copy on read faults, for example, if
  4086			 * page->index of !PageKSM() pages would be nonlinear inside the
  4087			 * anon VMA -- PageKSM() is lost on actual swapout.
  4088			 */
  4089			folio = ksm_might_need_to_copy(folio, vma, vmf->address);
  4090			if (unlikely(!folio)) {
  4091				ret = VM_FAULT_OOM;
  4092				folio = swapcache;
  4093				goto out_page;
  4094			} else if (unlikely(folio == ERR_PTR(-EHWPOISON))) {
  4095				ret = VM_FAULT_HWPOISON;
  4096				folio = swapcache;
  4097				goto out_page;
  4098			}
  4099			if (folio != swapcache)
  4100				page = folio_page(folio, 0);
  4101	
  4102			/*
  4103			 * If we want to map a page that's in the swapcache writable, we
  4104			 * have to detect via the refcount if we're really the exclusive
  4105			 * owner. Try removing the extra reference from the local LRU
  4106			 * caches if required.
  4107			 */
  4108			if ((vmf->flags & FAULT_FLAG_WRITE) && folio == swapcache &&
  4109			    !folio_test_ksm(folio) && !folio_test_lru(folio))
  4110				lru_add_drain();
  4111		}
  4112	
  4113		folio_throttle_swaprate(folio, GFP_KERNEL);
  4114	
  4115		/*
  4116		 * Back out if somebody else already faulted in this pte.
  4117		 */
  4118		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
  4119				&vmf->ptl);
  4120		if (unlikely(!vmf->pte || !pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
  4121			goto out_nomap;
  4122	
  4123		if (unlikely(!folio_test_uptodate(folio))) {
  4124			ret = VM_FAULT_SIGBUS;
  4125			goto out_nomap;
  4126		}
  4127	
  4128		/*
  4129		 * PG_anon_exclusive reuses PG_mappedtodisk for anon pages. A swap pte
  4130		 * must never point at an anonymous page in the swapcache that is
  4131		 * PG_anon_exclusive. Sanity check that this holds and especially, that
  4132		 * no filesystem set PG_mappedtodisk on a page in the swapcache. Sanity
  4133		 * check after taking the PT lock and making sure that nobody
  4134		 * concurrently faulted in this page and set PG_anon_exclusive.
  4135		 */
  4136		BUG_ON(!folio_test_anon(folio) && folio_test_mappedtodisk(folio));
  4137		BUG_ON(folio_test_anon(folio) && PageAnonExclusive(page));
  4138	
  4139		/*
  4140		 * Check under PT lock (to protect against concurrent fork() sharing
  4141		 * the swap entry concurrently) for certainly exclusive pages.
  4142		 */
  4143		if (!folio_test_ksm(folio)) {
  4144			exclusive = pte_swp_exclusive(vmf->orig_pte);
  4145			if (folio != swapcache) {
  4146				/*
  4147				 * We have a fresh page that is not exposed to the
  4148				 * swapcache -> certainly exclusive.
  4149				 */
  4150				exclusive = true;
  4151			} else if (exclusive && folio_test_writeback(folio) &&
  4152				  data_race(si->flags & SWP_STABLE_WRITES)) {
  4153				/*
  4154				 * This is tricky: not all swap backends support
  4155				 * concurrent page modifications while under writeback.
  4156				 *
  4157				 * So if we stumble over such a page in the swapcache
  4158				 * we must not set the page exclusive, otherwise we can
  4159				 * map it writable without further checks and modify it
  4160				 * while still under writeback.
  4161				 *
  4162				 * For these problematic swap backends, simply drop the
  4163				 * exclusive marker: this is perfectly fine as we start
  4164				 * writeback only if we fully unmapped the page and
  4165				 * there are no unexpected references on the page after
  4166				 * unmapping succeeded. After fully unmapped, no
  4167				 * further GUP references (FOLL_GET and FOLL_PIN) can
  4168				 * appear, so dropping the exclusive marker and mapping
  4169				 * it only R/O is fine.
  4170				 */
  4171				exclusive = false;
  4172			}
  4173		}
  4174	
  4175		/*
  4176		 * Some architectures may have to restore extra metadata to the page
  4177		 * when reading from swap. This metadata may be indexed by swap entry
  4178		 * so this must be called before swap_free().
  4179		 */
  4180		arch_swap_restore(entry, folio);
  4181	
  4182		/*
  4183		 * Remove the swap entry and conditionally try to free up the swapcache.
  4184		 * We're already holding a reference on the page but haven't mapped it
  4185		 * yet.
  4186		 */
  4187		swap_free(entry);
  4188		if (should_try_to_free_swap(folio, vma, vmf->flags))
  4189			folio_free_swap(folio);
  4190	
  4191		inc_mm_counter(vma->vm_mm, MM_ANONPAGES);
  4192		dec_mm_counter(vma->vm_mm, MM_SWAPENTS);
  4193		pte = mk_pte(page, vma->vm_page_prot);
  4194	
  4195		/*
  4196		 * Same logic as in do_wp_page(); however, optimize for pages that are
  4197		 * certainly not shared either because we just allocated them without
  4198		 * exposing them to the swapcache or because the swap entry indicates
  4199		 * exclusivity.
  4200		 */
  4201		if (!folio_test_ksm(folio) &&
  4202		    (exclusive || folio_ref_count(folio) == 1)) {
  4203			if (vmf->flags & FAULT_FLAG_WRITE) {
  4204				pte = maybe_mkwrite(pte_mkdirty(pte), vma);
  4205				vmf->flags &= ~FAULT_FLAG_WRITE;
  4206			}
  4207			rmap_flags |= RMAP_EXCLUSIVE;
  4208		}
  4209		flush_icache_page(vma, page);
  4210		if (pte_swp_soft_dirty(vmf->orig_pte))
  4211			pte = pte_mksoft_dirty(pte);
  4212		if (pte_swp_uffd_wp(vmf->orig_pte))
  4213			pte = pte_mkuffd_wp(pte);
  4214		vmf->orig_pte = pte;
  4215	
  4216		/* ksm created a completely new copy */
  4217		if (unlikely(folio != swapcache && swapcache)) {
  4218			folio_add_new_anon_rmap(folio, vma, vmf->address);
  4219			folio_add_lru_vma(folio, vma);
  4220		} else {
  4221			folio_add_anon_rmap_pte(folio, page, vma, vmf->address,
  4222						rmap_flags);
  4223		}
  4224	
  4225		VM_BUG_ON(!folio_test_anon(folio) ||
  4226				(pte_write(pte) && !PageAnonExclusive(page)));
  4227		set_pte_at(vma->vm_mm, vmf->address, vmf->pte, pte);
  4228		arch_do_swap_page(vma->vm_mm, vma, vmf->address, pte, vmf->orig_pte);
  4229	
  4230		folio_unlock(folio);
  4231		if (folio != swapcache && swapcache) {
  4232			/*
  4233			 * Hold the lock to avoid the swap entry to be reused
  4234			 * until we take the PT lock for the pte_same() check
  4235			 * (to avoid false positives from pte_same). For
  4236			 * further safety release the lock after the swap_free
  4237			 * so that the swap count won't change under a
  4238			 * parallel locked swapcache.
  4239			 */
  4240			folio_unlock(swapcache);
  4241			folio_put(swapcache);
  4242		}
  4243	
  4244		if (vmf->flags & FAULT_FLAG_WRITE) {
  4245			ret |= do_wp_page(vmf);
  4246			if (ret & VM_FAULT_ERROR)
  4247				ret &= VM_FAULT_ERROR;
  4248			goto out;
  4249		}
  4250	
  4251		/* No need to invalidate - it was non-present before */
  4252		update_mmu_cache_range(vmf, vma, vmf->address, vmf->pte, 1);
  4253	unlock:
  4254		if (vmf->pte)
  4255			pte_unmap_unlock(vmf->pte, vmf->ptl);
  4256		/* Clear the swap cache pin for direct swapin after PTL unlock */
  4257		if (folio && !swapcache)
  4258			swapcache_clear(si, entry);
  4259	out:
  4260		if (si)
  4261			put_swap_device(si);
  4262		return ret;
  4263	out_nomap:
  4264		if (vmf->pte)
  4265			pte_unmap_unlock(vmf->pte, vmf->ptl);
  4266	out_page:
  4267		if (!swapcache)
  4268			swapcache_clear(si, entry);
  4269		folio_unlock(folio);
  4270	out_release:
  4271		folio_put(folio);
  4272		if (folio != swapcache && swapcache) {
  4273			folio_unlock(swapcache);
  4274			folio_put(swapcache);
  4275		}
  4276		if (si)
  4277			put_swap_device(si);
  4278		return ret;
  4279	}
  4280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
