Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A8145B26;
	Sat, 20 Jul 2024 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721490514; cv=none; b=AaX7xm+oGF7uVaYxkJJUrr0Qt3v4i85Zp9dCSF+/ObYmYy0BNse+rz1HVAcigIpmM723E3ZM6Agr4TAcGBrXve13yWLNe7WHfUE1mvGdNWBEndGClTBdIxGL7uOpErIUKIixh6u9pOQKMNs/auS0lmXyjy1ka5M5t9vr96ntSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721490514; c=relaxed/simple;
	bh=KBJw2l8a+SNDVgV1b2eG0AC8iaSiLiPUVHTPDjqFLS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvJkCTelTgyhrV/8ZL+DJtZ8Hm1dTzWI9qRI1Cv98a+ZX+tlllSMe3PjjpR/02KTB8ygpxdGM0tfW/iHu2KYS/kk0bDJb5A025/mW+UZ//3EEe6rKxueN3/qabXWFPuv3B8pk9XPknNMoPiYI10UDRE2s19j+bQbsMghtbqoJoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0WCR+NB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0WCR+NB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721490513; x=1753026513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KBJw2l8a+SNDVgV1b2eG0AC8iaSiLiPUVHTPDjqFLS0=;
  b=c0WCR+NBCTODQl+81Ee9ZFT8dTCu+LcfmD/LsqaPVOhL9wFSA4tFmYEX
   adu6ocpHpPszjjUG35mRUs9TwZY5oxjYlcyWF3goqMZvoEm11qKIQVTI1
   XB41QdXqZOOtXkGxO6Q/osLmecT6uYNV35RS6Nr6gzDIV5ipoNow85IiU
   7Lnt/b7xLfhol5lsZn+PYZ4DM81HktBTrfXPuYHxoL29pkdsH3w0VBsb4
   mw/QqcPtRC/1+jyDP2Iz2rq4N/ltDQcgEpnfvf22XVloxWEv1fC9OcNPa
   k9X9LU6F9MriqVp+lz08mlOgXvY4hccZf4xJT/5zYFMR/D1zth31NS0r/
   g==;
X-CSE-ConnectionGUID: yNpwsfL/TfaSL35xIUDGdQ==
X-CSE-MsgGUID: 2TI0b3MASJ6ON1oWuVdE2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="22001645"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="22001645"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:48:30 -0700
X-CSE-ConnectionGUID: KNn5Ca87RmOwvn3wT57kAg==
X-CSE-MsgGUID: XP+F6IBKSrmu9vnqSCsiNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="51427957"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Jul 2024 08:48:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVCJt-000jLt-1N;
	Sat, 20 Jul 2024 15:48:25 +0000
Date: Sat, 20 Jul 2024 23:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 42/42] mm/khugepaged.c:1226:9: error:
 incompatible integer to pointer conversion assigning to 'struct ptdesc *'
 from 'int'
Message-ID: <202407202314.xrh1Uj1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: 17ce8ec8001d3efaa81c659d6ec565025c3f42b0 [42/42] mm/pgtable: use ptdesc in collapse_huge_page
config: i386-buildonly-randconfig-004-20240720 (https://download.01.org/0day-ci/archive/20240720/202407202314.xrh1Uj1Z-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202314.xrh1Uj1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202314.xrh1Uj1Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/khugepaged.c:772:32: error: call to undeclared function 'pmd_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     772 |         pmd_populate(vma->vm_mm, pmd, pmd_ptdesc(&orig_pmd));
         |                                       ^
   mm/khugepaged.c:772:32: note: did you mean 'pfn_ptdesc'?
   include/linux/mm.h:2863:30: note: 'pfn_ptdesc' declared here
    2863 | static inline struct ptdesc *pfn_ptdesc(unsigned long pfn)
         |                              ^
   mm/khugepaged.c:772:32: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct ptdesc *' [-Wint-conversion]
     772 |         pmd_populate(vma->vm_mm, pmd, pmd_ptdesc(&orig_pmd));
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgalloc.h:79:20: note: passing argument to parameter 'pte' here
      79 |                                 struct ptdesc *pte)
         |                                                ^
   mm/khugepaged.c:1226:11: error: call to undeclared function 'pmd_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1226 |         ptdesc = pmd_ptdesc(&_pmd);
         |                  ^
>> mm/khugepaged.c:1226:9: error: incompatible integer to pointer conversion assigning to 'struct ptdesc *' from 'int' [-Wint-conversion]
    1226 |         ptdesc = pmd_ptdesc(&_pmd);
         |                ^ ~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1667:21: error: call to undeclared function 'pmd_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1667 |         pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
         |                            ^
   mm/khugepaged.c:1667:21: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct ptdesc *' [-Wint-conversion]
    1667 |         pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:119:58: note: passing argument to parameter 'ptdesc' here
     119 | void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc);
         |                                                          ^
   mm/khugepaged.c:1771:23: error: call to undeclared function 'pmd_ptdesc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1771 |                         pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
         |                                            ^
   mm/khugepaged.c:1771:23: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct ptdesc *' [-Wint-conversion]
    1771 |                         pte_free_defer(mm, pmd_ptdesc(&pgt_pmd));
         |                                            ^~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:119:58: note: passing argument to parameter 'ptdesc' here
     119 | void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc);
         |                                                          ^
   8 errors generated.


vim +1226 mm/khugepaged.c

  1089	
  1090	static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
  1091				      int referenced, int unmapped,
  1092				      struct collapse_control *cc)
  1093	{
  1094		LIST_HEAD(compound_pagelist);
  1095		pmd_t *pmd, _pmd;
  1096		pte_t *pte;
  1097		struct ptdesc *ptdesc;
  1098		struct folio *folio;
  1099		spinlock_t *pmd_ptl, *pte_ptl;
  1100		int result = SCAN_FAIL;
  1101		struct vm_area_struct *vma;
  1102		struct mmu_notifier_range range;
  1103	
  1104		VM_BUG_ON(address & ~HPAGE_PMD_MASK);
  1105	
  1106		/*
  1107		 * Before allocating the hugepage, release the mmap_lock read lock.
  1108		 * The allocation can take potentially a long time if it involves
  1109		 * sync compaction, and we do not need to hold the mmap_lock during
  1110		 * that. We will recheck the vma after taking it again in write mode.
  1111		 */
  1112		mmap_read_unlock(mm);
  1113	
  1114		result = alloc_charge_folio(&folio, mm, cc);
  1115		if (result != SCAN_SUCCEED)
  1116			goto out_nolock;
  1117	
  1118		mmap_read_lock(mm);
  1119		result = hugepage_vma_revalidate(mm, address, true, &vma, cc);
  1120		if (result != SCAN_SUCCEED) {
  1121			mmap_read_unlock(mm);
  1122			goto out_nolock;
  1123		}
  1124	
  1125		result = find_pmd_or_thp_or_none(mm, address, &pmd);
  1126		if (result != SCAN_SUCCEED) {
  1127			mmap_read_unlock(mm);
  1128			goto out_nolock;
  1129		}
  1130	
  1131		if (unmapped) {
  1132			/*
  1133			 * __collapse_huge_page_swapin will return with mmap_lock
  1134			 * released when it fails. So we jump out_nolock directly in
  1135			 * that case.  Continuing to collapse causes inconsistency.
  1136			 */
  1137			result = __collapse_huge_page_swapin(mm, vma, address, pmd,
  1138							     referenced);
  1139			if (result != SCAN_SUCCEED)
  1140				goto out_nolock;
  1141		}
  1142	
  1143		mmap_read_unlock(mm);
  1144		/*
  1145		 * Prevent all access to pagetables with the exception of
  1146		 * gup_fast later handled by the ptep_clear_flush and the VM
  1147		 * handled by the anon_vma lock + PG_lock.
  1148		 *
  1149		 * UFFDIO_MOVE is prevented to race as well thanks to the
  1150		 * mmap_lock.
  1151		 */
  1152		mmap_write_lock(mm);
  1153		result = hugepage_vma_revalidate(mm, address, true, &vma, cc);
  1154		if (result != SCAN_SUCCEED)
  1155			goto out_up_write;
  1156		/* check if the pmd is still valid */
  1157		result = check_pmd_still_valid(mm, address, pmd);
  1158		if (result != SCAN_SUCCEED)
  1159			goto out_up_write;
  1160	
  1161		vma_start_write(vma);
  1162		anon_vma_lock_write(vma->anon_vma);
  1163	
  1164		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
  1165					address + HPAGE_PMD_SIZE);
  1166		mmu_notifier_invalidate_range_start(&range);
  1167	
  1168		pmd_ptl = pmd_lock(mm, pmd); /* probably unnecessary */
  1169		/*
  1170		 * This removes any huge TLB entry from the CPU so we won't allow
  1171		 * huge and small TLB entries for the same virtual address to
  1172		 * avoid the risk of CPU bugs in that area.
  1173		 *
  1174		 * Parallel GUP-fast is fine since GUP-fast will back off when
  1175		 * it detects PMD is changed.
  1176		 */
  1177		_pmd = pmdp_collapse_flush(vma, address, pmd);
  1178		spin_unlock(pmd_ptl);
  1179		mmu_notifier_invalidate_range_end(&range);
  1180		tlb_remove_table_sync_one();
  1181	
  1182		pte = pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
  1183		if (pte) {
  1184			result = __collapse_huge_page_isolate(vma, address, pte, cc,
  1185							      &compound_pagelist);
  1186			spin_unlock(pte_ptl);
  1187		} else {
  1188			result = SCAN_PMD_NULL;
  1189		}
  1190	
  1191		if (unlikely(result != SCAN_SUCCEED)) {
  1192			if (pte)
  1193				pte_unmap(pte);
  1194			spin_lock(pmd_ptl);
  1195			BUG_ON(!pmd_none(*pmd));
  1196			/*
  1197			 * We can only use set_pmd_at when establishing
  1198			 * hugepmds and never for establishing regular pmds that
  1199			 * points to regular pagetables. Use pmd_populate for that
  1200			 */
  1201			pmd_populate(mm, pmd, page_ptdesc(pmd_pgtable(_pmd)));
  1202			spin_unlock(pmd_ptl);
  1203			anon_vma_unlock_write(vma->anon_vma);
  1204			goto out_up_write;
  1205		}
  1206	
  1207		/*
  1208		 * All pages are isolated and locked so anon_vma rmap
  1209		 * can't run anymore.
  1210		 */
  1211		anon_vma_unlock_write(vma->anon_vma);
  1212	
  1213		result = __collapse_huge_page_copy(pte, folio, pmd, _pmd,
  1214						   vma, address, pte_ptl,
  1215						   &compound_pagelist);
  1216		pte_unmap(pte);
  1217		if (unlikely(result != SCAN_SUCCEED))
  1218			goto out_up_write;
  1219	
  1220		/*
  1221		 * The smp_wmb() inside __folio_mark_uptodate() ensures the
  1222		 * copy_huge_page writes become visible before the set_pmd_at()
  1223		 * write.
  1224		 */
  1225		__folio_mark_uptodate(folio);
> 1226		ptdesc = pmd_ptdesc(&_pmd);
  1227	
  1228		_pmd = mk_huge_pmd(&folio->page, vma->vm_page_prot);
  1229		_pmd = maybe_pmd_mkwrite(pmd_mkdirty(_pmd), vma);
  1230	
  1231		spin_lock(pmd_ptl);
  1232		BUG_ON(!pmd_none(*pmd));
  1233		folio_add_new_anon_rmap(folio, vma, address, RMAP_EXCLUSIVE);
  1234		folio_add_lru_vma(folio, vma);
  1235		pgtable_trans_huge_deposit(mm, pmd, ptdesc);
  1236		set_pmd_at(mm, address, pmd, _pmd);
  1237		update_mmu_cache_pmd(vma, address, pmd);
  1238		spin_unlock(pmd_ptl);
  1239	
  1240		folio = NULL;
  1241	
  1242		result = SCAN_SUCCEED;
  1243	out_up_write:
  1244		mmap_write_unlock(mm);
  1245	out_nolock:
  1246		if (folio)
  1247			folio_put(folio);
  1248		trace_mm_collapse_huge_page(mm, result == SCAN_SUCCEED, result);
  1249		return result;
  1250	}
  1251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
