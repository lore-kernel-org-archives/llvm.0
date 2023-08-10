Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF681E1CA;
	Thu, 10 Aug 2023 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691675812; x=1723211812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HVRaVu17RjzAxs/OxjUx6KqKbZ+Uup4GCQXGQwIvI0c=;
  b=Ozp6SHz/OZOhelF1PXiJDc9Sb5Ty+ND4UCltqxcQjPxUR9e7X9vzDGgS
   CB15NJnspYJDwRPIdbVwmzLafSOyBWxgpi4RZAvCnv8DV8n4aqOnVofzC
   mwPIFCqeah8fu9PlqLafNtPiTqcdxrYXVyi7e7z9hYHNPINu6rcvHHisC
   pvp9PNfv4tFqqXcK9AoyECA0LNeQPmdqLNeisyw0oO8/3uGB/H7dFT6fG
   Wxz+vU5S6tH8QUgXuPx+v05sAKGqKFpYYhg/Q1zIZgixIldqvPr0mr0o4
   uIlxns48Pg6nP8IeNi9V5uptr44R7m9+F2kwUFI0K9PpeP7ajvfMoZ8LT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="457776868"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="457776868"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 06:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="709164075"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="709164075"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Aug 2023 06:46:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU5zO-00072M-2L;
	Thu, 10 Aug 2023 13:46:10 +0000
Date: Thu, 10 Aug 2023 21:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/5] mm/autonuma: call .numa_protect() when page
 is protected for NUMA migrate
Message-ID: <202308102134.oBT4eoMN-lkp@intel.com>
References: <20230810090048.26184-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810090048.26184-1-yan.y.zhao@intel.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on mst-vhost/linux-next linus/master v6.5-rc5 next-20230809]
[cannot apply to akpm-mm/mm-everything kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhao/mm-mmu_notifier-introduce-a-new-mmu-notifier-flag-MMU_NOTIFIER_RANGE_NUMA/20230810-172955
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230810090048.26184-1-yan.y.zhao%40intel.com
patch subject: [RFC PATCH v2 4/5] mm/autonuma: call .numa_protect() when page is protected for NUMA migrate
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230810/202308102134.oBT4eoMN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308102134.oBT4eoMN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308102134.oBT4eoMN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mprotect.c:13:
   In file included from include/linux/hugetlb.h:10:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/mprotect.c:13:
   In file included from include/linux/hugetlb.h:10:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/mprotect.c:13:
   In file included from include/linux/hugetlb.h:10:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> mm/mprotect.c:167:5: error: call to undeclared function 'mmu_notifier_numa_protect'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     167 |                                 mmu_notifier_numa_protect(vma->vm_mm, addr, addr + PAGE_SIZE);
         |                                 ^
   12 warnings and 1 error generated.


vim +/mmu_notifier_numa_protect +167 mm/mprotect.c

    82	
    83	static long change_pte_range(struct mmu_gather *tlb,
    84			struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
    85			unsigned long end, pgprot_t newprot, unsigned long cp_flags)
    86	{
    87		pte_t *pte, oldpte;
    88		spinlock_t *ptl;
    89		long pages = 0;
    90		int target_node = NUMA_NO_NODE;
    91		bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
    92		bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
    93		bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
    94	
    95		tlb_change_page_size(tlb, PAGE_SIZE);
    96		pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
    97		if (!pte)
    98			return -EAGAIN;
    99	
   100		/* Get target node for single threaded private VMAs */
   101		if (prot_numa && !(vma->vm_flags & VM_SHARED) &&
   102		    atomic_read(&vma->vm_mm->mm_users) == 1)
   103			target_node = numa_node_id();
   104	
   105		flush_tlb_batched_pending(vma->vm_mm);
   106		arch_enter_lazy_mmu_mode();
   107		do {
   108			oldpte = ptep_get(pte);
   109			if (pte_present(oldpte)) {
   110				pte_t ptent;
   111	
   112				/*
   113				 * Avoid trapping faults against the zero or KSM
   114				 * pages. See similar comment in change_huge_pmd.
   115				 */
   116				if (prot_numa) {
   117					struct page *page;
   118					int nid;
   119					bool toptier;
   120	
   121					/* Avoid TLB flush if possible */
   122					if (pte_protnone(oldpte))
   123						continue;
   124	
   125					page = vm_normal_page(vma, addr, oldpte);
   126					if (!page || is_zone_device_page(page) || PageKsm(page))
   127						continue;
   128	
   129					/* Also skip shared copy-on-write pages */
   130					if (is_cow_mapping(vma->vm_flags) &&
   131					    page_count(page) != 1)
   132						continue;
   133	
   134					/*
   135					 * While migration can move some dirty pages,
   136					 * it cannot move them all from MIGRATE_ASYNC
   137					 * context.
   138					 */
   139					if (page_is_file_lru(page) && PageDirty(page))
   140						continue;
   141	
   142					/*
   143					 * Don't mess with PTEs if page is already on the node
   144					 * a single-threaded process is running on.
   145					 */
   146					nid = page_to_nid(page);
   147					if (target_node == nid)
   148						continue;
   149	
   150					if (PageAnon(page) && PageAnonExclusive(page) &&
   151					    page_maybe_dma_pinned(page))
   152						continue;
   153	
   154					toptier = node_is_toptier(nid);
   155	
   156					/*
   157					 * Skip scanning top tier node if normal numa
   158					 * balancing is disabled
   159					 */
   160					if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
   161					    toptier)
   162						continue;
   163					if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING &&
   164					    !toptier)
   165						xchg_page_access_time(page,
   166							jiffies_to_msecs(jiffies));
 > 167					mmu_notifier_numa_protect(vma->vm_mm, addr, addr + PAGE_SIZE);
   168				}
   169	
   170				oldpte = ptep_modify_prot_start(vma, addr, pte);
   171				ptent = pte_modify(oldpte, newprot);
   172	
   173				if (uffd_wp)
   174					ptent = pte_mkuffd_wp(ptent);
   175				else if (uffd_wp_resolve)
   176					ptent = pte_clear_uffd_wp(ptent);
   177	
   178				/*
   179				 * In some writable, shared mappings, we might want
   180				 * to catch actual write access -- see
   181				 * vma_wants_writenotify().
   182				 *
   183				 * In all writable, private mappings, we have to
   184				 * properly handle COW.
   185				 *
   186				 * In both cases, we can sometimes still change PTEs
   187				 * writable and avoid the write-fault handler, for
   188				 * example, if a PTE is already dirty and no other
   189				 * COW or special handling is required.
   190				 */
   191				if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) &&
   192				    !pte_write(ptent) &&
   193				    can_change_pte_writable(vma, addr, ptent))
   194					ptent = pte_mkwrite(ptent);
   195	
   196				ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
   197				if (pte_needs_flush(oldpte, ptent))
   198					tlb_flush_pte_range(tlb, addr, PAGE_SIZE);
   199				pages++;
   200			} else if (is_swap_pte(oldpte)) {
   201				swp_entry_t entry = pte_to_swp_entry(oldpte);
   202				pte_t newpte;
   203	
   204				if (is_writable_migration_entry(entry)) {
   205					struct page *page = pfn_swap_entry_to_page(entry);
   206	
   207					/*
   208					 * A protection check is difficult so
   209					 * just be safe and disable write
   210					 */
   211					if (PageAnon(page))
   212						entry = make_readable_exclusive_migration_entry(
   213								     swp_offset(entry));
   214					else
   215						entry = make_readable_migration_entry(swp_offset(entry));
   216					newpte = swp_entry_to_pte(entry);
   217					if (pte_swp_soft_dirty(oldpte))
   218						newpte = pte_swp_mksoft_dirty(newpte);
   219				} else if (is_writable_device_private_entry(entry)) {
   220					/*
   221					 * We do not preserve soft-dirtiness. See
   222					 * copy_one_pte() for explanation.
   223					 */
   224					entry = make_readable_device_private_entry(
   225								swp_offset(entry));
   226					newpte = swp_entry_to_pte(entry);
   227					if (pte_swp_uffd_wp(oldpte))
   228						newpte = pte_swp_mkuffd_wp(newpte);
   229				} else if (is_writable_device_exclusive_entry(entry)) {
   230					entry = make_readable_device_exclusive_entry(
   231								swp_offset(entry));
   232					newpte = swp_entry_to_pte(entry);
   233					if (pte_swp_soft_dirty(oldpte))
   234						newpte = pte_swp_mksoft_dirty(newpte);
   235					if (pte_swp_uffd_wp(oldpte))
   236						newpte = pte_swp_mkuffd_wp(newpte);
   237				} else if (is_pte_marker_entry(entry)) {
   238					/*
   239					 * Ignore swapin errors unconditionally,
   240					 * because any access should sigbus anyway.
   241					 */
   242					if (is_swapin_error_entry(entry))
   243						continue;
   244					/*
   245					 * If this is uffd-wp pte marker and we'd like
   246					 * to unprotect it, drop it; the next page
   247					 * fault will trigger without uffd trapping.
   248					 */
   249					if (uffd_wp_resolve) {
   250						pte_clear(vma->vm_mm, addr, pte);
   251						pages++;
   252					}
   253					continue;
   254				} else {
   255					newpte = oldpte;
   256				}
   257	
   258				if (uffd_wp)
   259					newpte = pte_swp_mkuffd_wp(newpte);
   260				else if (uffd_wp_resolve)
   261					newpte = pte_swp_clear_uffd_wp(newpte);
   262	
   263				if (!pte_same(oldpte, newpte)) {
   264					set_pte_at(vma->vm_mm, addr, pte, newpte);
   265					pages++;
   266				}
   267			} else {
   268				/* It must be an none page, or what else?.. */
   269				WARN_ON_ONCE(!pte_none(oldpte));
   270	
   271				/*
   272				 * Nobody plays with any none ptes besides
   273				 * userfaultfd when applying the protections.
   274				 */
   275				if (likely(!uffd_wp))
   276					continue;
   277	
   278				if (userfaultfd_wp_use_markers(vma)) {
   279					/*
   280					 * For file-backed mem, we need to be able to
   281					 * wr-protect a none pte, because even if the
   282					 * pte is none, the page/swap cache could
   283					 * exist.  Doing that by install a marker.
   284					 */
   285					set_pte_at(vma->vm_mm, addr, pte,
   286						   make_pte_marker(PTE_MARKER_UFFD_WP));
   287					pages++;
   288				}
   289			}
   290		} while (pte++, addr += PAGE_SIZE, addr != end);
   291		arch_leave_lazy_mmu_mode();
   292		pte_unmap_unlock(pte - 1, ptl);
   293	
   294		return pages;
   295	}
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
