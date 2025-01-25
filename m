Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9113A207E12;
	Sat, 25 Jan 2025 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737794618; cv=none; b=Y3OkVLhZzAaA8CPYYT2FcHgBmmj2+jOCP/g/EXHH88DMPxeEP4D8KQOgKzkOolbET90+CPRkXwjQpiabSd7NbFg0giplB9CFiU2Ja2Heyy6+uPT8wtcJOgvLY1pynZPLAfuTgL0O9YIdRI1KiOyvqjM0oWeyAwGCdJhNIzvwjoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737794618; c=relaxed/simple;
	bh=ssV8UAzqiMZoXTLEJlx6yEGlSCSedwPAcEW0cdJoSNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P1xa2VUYoLh6IzUfpTIREdYf3771dliLiqEQGMqeMptXk8a6RI3V8qBL6qlv14euA69C9f46lCCUUo+ko4WS0Qh7UY4nSccObaNTG/AJSZP7WqD+P0ze3ujthk0mt7h9ptxaMQPy8Nk80nK7fnZBUWF6xpPi5ldFMFqffPPTALs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtdC+z8f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtdC+z8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737794616; x=1769330616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ssV8UAzqiMZoXTLEJlx6yEGlSCSedwPAcEW0cdJoSNk=;
  b=AtdC+z8fv6sm/sT/tpfgaNiBmk4KG6vKyomEcvPBXFYNdi/gl8CXxwYe
   6Cksg1m/ICi2j+P9Us9L5ml2eV+sYqa7Fp43btVg+g1oTW8WRej3ECaBS
   P2SOB0iqvJBvGc+YwhiikdLctc0SAPI/fIlg+VAqY6KHjIeokX5opq81q
   O3ob+dnEe0c9xhdSuvdCk7j6fwSlwdc3aoe2YWG89wmJCwaHyBbwQr1xi
   4WYw6klzEVCbddQqMA7chNJah+8jexJklsOiy1pYneZ8YgVDcSz6b5uZj
   xRyyqilhXX4tCZQG9gr3f9GtNtAdHusYD8xmwXQ3x+bGP04VKp6P0Kou2
   g==;
X-CSE-ConnectionGUID: dPGtpgtmTGCtyR2EUvf++Q==
X-CSE-MsgGUID: +ScWWgAFQ0+IJidaeSfU2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="37584365"
X-IronPort-AV: E=Sophos;i="6.13,233,1732608000"; 
   d="scan'208";a="37584365"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 00:43:35 -0800
X-CSE-ConnectionGUID: fJModYWNT62wW6j0m9yQmQ==
X-CSE-MsgGUID: Jt2wiQj/QISvAWxVcS3a5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113120138"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2025 00:43:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbblM-000ddn-0E;
	Sat, 25 Jan 2025 08:43:32 +0000
Date: Sat, 25 Jan 2025 16:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:device_private 12/12] mm/migrate.c:294:12: error:
 call to undeclared function 'make_device_private_entry'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202501251612.MocJKRGH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux device_private
head:   1693aa537b530ade1b82a54169a772386b4b7af7
commit: 1693aa537b530ade1b82a54169a772386b4b7af7 [12/12] mm: combine readable and writable device exclusive entries into SWP_DEVICE_EXCLUSIVE
config: arm-randconfig-004-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251612.MocJKRGH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251612.MocJKRGH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251612.MocJKRGH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/migrate.c:22:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/migrate.c:294:12: error: call to undeclared function 'make_device_private_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     294 |                         entry = make_device_private_entry(page_to_pfn(new));
         |                                 ^
   mm/migrate.c:294:12: note: did you mean 'is_device_private_entry'?
   include/linux/swapops.h:210:20: note: 'is_device_private_entry' declared here
     210 | static inline bool is_device_private_entry(swp_entry_t entry)
         |                    ^
>> mm/migrate.c:294:10: error: assigning to 'swp_entry_t' from incompatible type 'int'
     294 |                         entry = make_device_private_entry(page_to_pfn(new));
         |                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +/make_device_private_entry +294 mm/migrate.c

   235	
   236	/*
   237	 * Restore a potential migration pte to a working pte entry
   238	 */
   239	static bool remove_migration_pte(struct folio *folio,
   240			struct vm_area_struct *vma, unsigned long addr, void *arg)
   241	{
   242		struct rmap_walk_arg *rmap_walk_arg = arg;
   243		DEFINE_FOLIO_VMA_WALK(pvmw, rmap_walk_arg->folio, vma, addr, PVMW_SYNC | PVMW_MIGRATION);
   244	
   245		while (page_vma_mapped_walk(&pvmw)) {
   246			rmap_t rmap_flags = RMAP_NONE;
   247			pte_t old_pte;
   248			pte_t pte;
   249			swp_entry_t entry;
   250			struct page *new;
   251			unsigned long idx = 0;
   252	
   253			/* pgoff is invalid for ksm pages, but they are never large */
   254			if (folio_test_large(folio) && !folio_test_hugetlb(folio))
   255				idx = linear_page_index(vma, pvmw.address) - pvmw.pgoff;
   256			new = folio_page(folio, idx);
   257	
   258	#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
   259			/* PMD-mapped THP migration entry */
   260			if (!pvmw.pte) {
   261				VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
   262						!folio_test_pmd_mappable(folio), folio);
   263				remove_migration_pmd(&pvmw, new);
   264				continue;
   265			}
   266	#endif
   267			if (rmap_walk_arg->map_unused_to_zeropage &&
   268			    try_to_map_unused_to_zeropage(&pvmw, folio, idx))
   269				continue;
   270	
   271			folio_get(folio);
   272			pte = mk_pte(new, READ_ONCE(vma->vm_page_prot));
   273			old_pte = ptep_get(pvmw.pte);
   274	
   275			entry = pte_to_swp_entry(old_pte);
   276			if (!is_migration_entry_young(entry))
   277				pte = pte_mkold(pte);
   278			if (folio_test_dirty(folio) && is_migration_entry_dirty(entry))
   279				pte = pte_mkdirty(pte);
   280			if (pte_swp_soft_dirty(old_pte))
   281				pte = pte_mksoft_dirty(pte);
   282			else
   283				pte = pte_clear_soft_dirty(pte);
   284	
   285			if (is_writable_migration_entry(entry))
   286				pte = pte_mkwrite(pte, vma);
   287			else if (pte_swp_uffd_wp(old_pte))
   288				pte = pte_mkuffd_wp(pte);
   289	
   290			if (folio_test_anon(folio) && !is_readable_migration_entry(entry))
   291				rmap_flags |= RMAP_EXCLUSIVE;
   292	
   293			if (unlikely(is_device_private_page(new))) {
 > 294				entry = make_device_private_entry(page_to_pfn(new));
   295				pte = swp_entry_to_pte(entry);
   296				if (pte_swp_soft_dirty(old_pte))
   297					pte = pte_swp_mksoft_dirty(pte);
   298				if (pte_swp_uffd_wp(old_pte))
   299					pte = pte_swp_mkuffd_wp(pte);
   300			}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
