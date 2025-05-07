Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F31F956;
	Wed,  7 May 2025 04:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746593758; cv=none; b=W7HP8aGPd/aJE4NYxEXYvcVEWZS0PE2FjHExHc5QA4P7VRcqdJiM/6BVtm5M0sMVeIqy1GbLSgdT9zFFDo44hfarjvkJl7uRhZM5fVUhIXVJFr7u2TAt/Z+RI1RWYAJ7g8MLVdQnnRFKJ0nrldrpi6KipL31hVUmRKD+zMb8bB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746593758; c=relaxed/simple;
	bh=d58/zdP813WLPxrF/pg3hYknvy1UjyYMKlSNArI651k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6iZxl6Vg9bXjEgR9l+7APzlr3VcpBu3qbrhhkFI1JzsRKTE3htOF7+K2JzBXaj4MdWxwFsTtwK8WgKk6pf4TYjw25j/xBT8x4uTQzuR+h2R2wKbmWOcqloGdLEOk3iqSzj+3bylzDywTG0TACJyyZSLULIAkh+u8ly7/AEHYBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7TARCbk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7TARCbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746593755; x=1778129755;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=d58/zdP813WLPxrF/pg3hYknvy1UjyYMKlSNArI651k=;
  b=O7TARCbk3Ayrr//hqHzH03XAGV/WA1BCzcNVLqffZHKPo4a8l4CRdDtf
   ZV+DWENgQtjDoaU0KQnw+Hg+Tp5BLM3Iirvc6x1FrTpqg9oaByqjV5RXE
   8A1XItIYe8b6NmR9zfZBjRsoWO1Z/PIPk/yoQB0s7qPzm32g5vvWDIo8A
   ZKiIZRISDorpPWLpOnAc7p4ixCTJMltURjQoP1aPF+bDmlCV4AhASCCWy
   zO+nzbVezROuGwMIYAczBiHN38oQUgEQ4lrjPFECLV2Gxj1N58a2mDDCq
   d4l81z6+IW66JxlQIOmoJiQTSyjGty8phyaDdyGVZZQd6miwnDrimebej
   w==;
X-CSE-ConnectionGUID: 0L33ET8eRDCK1RKTGZ6jlw==
X-CSE-MsgGUID: fPvTUgIAROa+u4opUKc0Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48447385"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48447385"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 21:55:55 -0700
X-CSE-ConnectionGUID: MTwNfB0uT8ynf5N+uQlARQ==
X-CSE-MsgGUID: xUymefvYQUiDVH9RzXm+JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140948736"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2025 21:55:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCWox-00073V-09;
	Wed, 07 May 2025 04:55:51 +0000
Date: Wed, 7 May 2025 12:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 07/12] khugepaged: add mTHP support
Message-ID: <202505071214.33YoO6WE-lkp@intel.com>
References: <20250428181218.85925-8-npache@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428181218.85925-8-npache@redhat.com>

Hi Nico,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250428]
[cannot apply to akpm-mm/mm-everything trace/for-next lwn/docs-next linus/master v6.15-rc4 v6.15-rc3 v6.15-rc2 v6.15-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nico-Pache/khugepaged-rename-hpage_collapse_-to-khugepaged_/20250429-021548
base:   next-20250428
patch link:    https://lore.kernel.org/r/20250428181218.85925-8-npache%40redhat.com
patch subject: [PATCH v5 07/12] khugepaged: add mTHP support
config: x86_64-buildonly-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250507/202505071214.33YoO6WE-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071214.33YoO6WE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071214.33YoO6WE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/khugepaged.c:1208:6: warning: variable 'pte' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1208 |         if (result != SCAN_SUCCEED)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1308:6: note: uninitialized use occurs here
    1308 |         if (pte)
         |             ^~~
   mm/khugepaged.c:1208:2: note: remove the 'if' if its condition is always false
    1208 |         if (result != SCAN_SUCCEED)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    1209 |                 goto out_up_write;
         |                 ~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1204:6: warning: variable 'pte' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1204 |         if (result != SCAN_SUCCEED)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1308:6: note: uninitialized use occurs here
    1308 |         if (pte)
         |             ^~~
   mm/khugepaged.c:1204:2: note: remove the 'if' if its condition is always false
    1204 |         if (result != SCAN_SUCCEED)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    1205 |                 goto out_up_write;
         |                 ~~~~~~~~~~~~~~~~~
   mm/khugepaged.c:1139:12: note: initialize the variable 'pte' to silence this warning
    1139 |         pte_t *pte, mthp_pte;
         |                   ^
         |                    = NULL
   2 warnings generated.


vim +1208 mm/khugepaged.c

9710a78ab2aed09 Zach O'Keefe            2022-07-06  1131  
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1132  static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1133  			      int referenced, int unmapped,
2e6c970ed974576 Nico Pache              2025-04-28  1134  			      struct collapse_control *cc, bool *mmap_locked,
2e6c970ed974576 Nico Pache              2025-04-28  1135  				  u8 order, u16 offset)
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1136  {
5503fbf2b0b80c1 Kirill A. Shutemov      2020-06-03  1137  	LIST_HEAD(compound_pagelist);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1138  	pmd_t *pmd, _pmd;
d857f1e14edec88 Nico Pache              2025-04-28  1139  	pte_t *pte, mthp_pte;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1140  	pgtable_t pgtable;
5432726848bb27a Matthew Wilcox (Oracle  2023-12-11  1141) 	struct folio *folio;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1142  	spinlock_t *pmd_ptl, *pte_ptl;
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1143  	int result = SCAN_FAIL;
c131f751ab1a852 Kirill A. Shutemov      2016-09-19  1144  	struct vm_area_struct *vma;
ac46d4f3c43241f Jérôme Glisse           2018-12-28  1145  	struct mmu_notifier_range range;
d857f1e14edec88 Nico Pache              2025-04-28  1146  	unsigned long _address = address + offset * PAGE_SIZE;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1147  
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1148  	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1149  
988ddb710bb5be2 Kirill A. Shutemov      2016-07-26  1150  	/*
c1e8d7c6a7a682e Michel Lespinasse       2020-06-08  1151  	 * Before allocating the hugepage, release the mmap_lock read lock.
988ddb710bb5be2 Kirill A. Shutemov      2016-07-26  1152  	 * The allocation can take potentially a long time if it involves
c1e8d7c6a7a682e Michel Lespinasse       2020-06-08  1153  	 * sync compaction, and we do not need to hold the mmap_lock during
988ddb710bb5be2 Kirill A. Shutemov      2016-07-26  1154  	 * that. We will recheck the vma after taking it again in write mode.
2e6c970ed974576 Nico Pache              2025-04-28  1155  	 * If collapsing mTHPs we may have already released the read_lock.
988ddb710bb5be2 Kirill A. Shutemov      2016-07-26  1156  	 */
2e6c970ed974576 Nico Pache              2025-04-28  1157  	if (*mmap_locked) {
d8ed45c5dcd455f Michel Lespinasse       2020-06-08  1158  		mmap_read_unlock(mm);
2e6c970ed974576 Nico Pache              2025-04-28  1159  		*mmap_locked = false;
2e6c970ed974576 Nico Pache              2025-04-28  1160  	}
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1161  
d857f1e14edec88 Nico Pache              2025-04-28  1162  	result = alloc_charge_folio(&folio, mm, cc, order);
9710a78ab2aed09 Zach O'Keefe            2022-07-06  1163  	if (result != SCAN_SUCCEED)
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1164  		goto out_nolock;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1165  
d8ed45c5dcd455f Michel Lespinasse       2020-06-08  1166  	mmap_read_lock(mm);
d857f1e14edec88 Nico Pache              2025-04-28  1167  	*mmap_locked = true;
d857f1e14edec88 Nico Pache              2025-04-28  1168  	result = hugepage_vma_revalidate(mm, address, true, &vma, cc, order);
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1169  	if (result != SCAN_SUCCEED) {
d8ed45c5dcd455f Michel Lespinasse       2020-06-08  1170  		mmap_read_unlock(mm);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1171  		goto out_nolock;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1172  	}
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1173  
507228044236804 Zach O'Keefe            2022-07-06  1174  	result = find_pmd_or_thp_or_none(mm, address, &pmd);
507228044236804 Zach O'Keefe            2022-07-06  1175  	if (result != SCAN_SUCCEED) {
d8ed45c5dcd455f Michel Lespinasse       2020-06-08  1176  		mmap_read_unlock(mm);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1177  		goto out_nolock;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1178  	}
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1179  
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1180  	if (unmapped) {
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1181  		/*
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1182  		 * __collapse_huge_page_swapin will return with mmap_lock
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1183  		 * released when it fails. So we jump out_nolock directly in
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1184  		 * that case.  Continuing to collapse causes inconsistency.
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1185  		 */
d857f1e14edec88 Nico Pache              2025-04-28  1186  		result = __collapse_huge_page_swapin(mm, vma, _address, pmd,
d857f1e14edec88 Nico Pache              2025-04-28  1187  				referenced, order);
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1188  		if (result != SCAN_SUCCEED)
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1189  			goto out_nolock;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1190  	}
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1191  
d8ed45c5dcd455f Michel Lespinasse       2020-06-08  1192  	mmap_read_unlock(mm);
d857f1e14edec88 Nico Pache              2025-04-28  1193  	*mmap_locked = false;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1194  	/*
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1195  	 * Prevent all access to pagetables with the exception of
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1196  	 * gup_fast later handled by the ptep_clear_flush and the VM
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1197  	 * handled by the anon_vma lock + PG_lock.
adef440691bab82 Andrea Arcangeli        2023-12-06  1198  	 *
adef440691bab82 Andrea Arcangeli        2023-12-06  1199  	 * UFFDIO_MOVE is prevented to race as well thanks to the
adef440691bab82 Andrea Arcangeli        2023-12-06  1200  	 * mmap_lock.
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1201  	 */
d8ed45c5dcd455f Michel Lespinasse       2020-06-08  1202  	mmap_write_lock(mm);
d857f1e14edec88 Nico Pache              2025-04-28  1203  	result = hugepage_vma_revalidate(mm, address, true, &vma, cc, order);
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1204  	if (result != SCAN_SUCCEED)
18d24a7cd9d3f35 Miaohe Lin              2021-05-04  1205  		goto out_up_write;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1206  	/* check if the pmd is still valid */
507228044236804 Zach O'Keefe            2022-07-06  1207  	result = check_pmd_still_valid(mm, address, pmd);
507228044236804 Zach O'Keefe            2022-07-06 @1208  	if (result != SCAN_SUCCEED)
18d24a7cd9d3f35 Miaohe Lin              2021-05-04  1209  		goto out_up_write;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1210  
55fd6fccad3172c Suren Baghdasaryan      2023-02-27  1211  	vma_start_write(vma);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1212  	anon_vma_lock_write(vma->anon_vma);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1213  
d857f1e14edec88 Nico Pache              2025-04-28  1214  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, _address,
d857f1e14edec88 Nico Pache              2025-04-28  1215  				_address + (PAGE_SIZE << order));
ac46d4f3c43241f Jérôme Glisse           2018-12-28  1216  	mmu_notifier_invalidate_range_start(&range);
ec649c9d454ea37 Ville Syrjälä           2019-11-05  1217  
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1218  	pmd_ptl = pmd_lock(mm, pmd); /* probably unnecessary */
d857f1e14edec88 Nico Pache              2025-04-28  1219  
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1220  	/*
70cbc3cc78a997d Yang Shi                2022-09-07  1221  	 * This removes any huge TLB entry from the CPU so we won't allow
70cbc3cc78a997d Yang Shi                2022-09-07  1222  	 * huge and small TLB entries for the same virtual address to
70cbc3cc78a997d Yang Shi                2022-09-07  1223  	 * avoid the risk of CPU bugs in that area.
70cbc3cc78a997d Yang Shi                2022-09-07  1224  	 *
0ae0b2b32553398 David Hildenbrand       2024-04-02  1225  	 * Parallel GUP-fast is fine since GUP-fast will back off when
70cbc3cc78a997d Yang Shi                2022-09-07  1226  	 * it detects PMD is changed.
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1227  	 */
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1228  	_pmd = pmdp_collapse_flush(vma, address, pmd);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1229  	spin_unlock(pmd_ptl);
ac46d4f3c43241f Jérôme Glisse           2018-12-28  1230  	mmu_notifier_invalidate_range_end(&range);
2ba99c5e0881249 Jann Horn               2022-11-25  1231  	tlb_remove_table_sync_one();
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1232  
d857f1e14edec88 Nico Pache              2025-04-28  1233  	pte = pte_offset_map_lock(mm, &_pmd, _address, &pte_ptl);
895f5ee464cc90a Hugh Dickins            2023-06-08  1234  	if (pte) {
d857f1e14edec88 Nico Pache              2025-04-28  1235  		result = __collapse_huge_page_isolate(vma, _address, pte, cc,
d857f1e14edec88 Nico Pache              2025-04-28  1236  					&compound_pagelist, order);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1237  		spin_unlock(pte_ptl);
895f5ee464cc90a Hugh Dickins            2023-06-08  1238  	} else {
895f5ee464cc90a Hugh Dickins            2023-06-08  1239  		result = SCAN_PMD_NULL;
895f5ee464cc90a Hugh Dickins            2023-06-08  1240  	}
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1241  
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1242  	if (unlikely(result != SCAN_SUCCEED)) {
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1243  		spin_lock(pmd_ptl);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1244  		BUG_ON(!pmd_none(*pmd));
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1245  		/*
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1246  		 * We can only use set_pmd_at when establishing
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1247  		 * hugepmds and never for establishing regular pmds that
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1248  		 * points to regular pagetables. Use pmd_populate for that
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1249  		 */
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1250  		pmd_populate(mm, pmd, pmd_pgtable(_pmd));
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1251  		spin_unlock(pmd_ptl);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1252  		anon_vma_unlock_write(vma->anon_vma);
18d24a7cd9d3f35 Miaohe Lin              2021-05-04  1253  		goto out_up_write;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1254  	}
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1255  
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1256  	/*
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1257  	 * All pages are isolated and locked so anon_vma rmap
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1258  	 * can't run anymore.
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1259  	 */
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1260  	anon_vma_unlock_write(vma->anon_vma);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1261  
8eca68e2cfdf863 Matthew Wilcox (Oracle  2024-04-03  1262) 	result = __collapse_huge_page_copy(pte, folio, pmd, _pmd,
d857f1e14edec88 Nico Pache              2025-04-28  1263  					   vma, _address, pte_ptl,
d857f1e14edec88 Nico Pache              2025-04-28  1264  					   &compound_pagelist, order);
98c76c9f1ef7599 Jiaqi Yan               2023-03-29  1265  	if (unlikely(result != SCAN_SUCCEED))
98c76c9f1ef7599 Jiaqi Yan               2023-03-29  1266  		goto out_up_write;
98c76c9f1ef7599 Jiaqi Yan               2023-03-29  1267  
588d01f918d42d2 Miaohe Lin              2021-05-04  1268  	/*
5432726848bb27a Matthew Wilcox (Oracle  2023-12-11  1269) 	 * The smp_wmb() inside __folio_mark_uptodate() ensures the
5432726848bb27a Matthew Wilcox (Oracle  2023-12-11  1270) 	 * copy_huge_page writes become visible before the set_pmd_at()
5432726848bb27a Matthew Wilcox (Oracle  2023-12-11  1271) 	 * write.
588d01f918d42d2 Miaohe Lin              2021-05-04  1272  	 */
5432726848bb27a Matthew Wilcox (Oracle  2023-12-11  1273) 	__folio_mark_uptodate(folio);
d857f1e14edec88 Nico Pache              2025-04-28  1274  	if (order == HPAGE_PMD_ORDER) {
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1275  		pgtable = pmd_pgtable(_pmd);
8c19e28d02d0517 Matthew Wilcox (Oracle  2025-04-02  1276) 		_pmd = folio_mk_pmd(folio, vma->vm_page_prot);
f55e1014f9e567d Linus Torvalds          2017-11-29  1277  		_pmd = maybe_pmd_mkwrite(pmd_mkdirty(_pmd), vma);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1278  
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1279  		spin_lock(pmd_ptl);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1280  		BUG_ON(!pmd_none(*pmd));
d857f1e14edec88 Nico Pache              2025-04-28  1281  		folio_add_new_anon_rmap(folio, vma, _address, RMAP_EXCLUSIVE);
5432726848bb27a Matthew Wilcox (Oracle  2023-12-11  1282) 		folio_add_lru_vma(folio, vma);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1283  		pgtable_trans_huge_deposit(mm, pmd, pgtable);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1284  		set_pmd_at(mm, address, pmd, _pmd);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1285  		update_mmu_cache_pmd(vma, address, pmd);
dafff3f4c850c98 Usama Arif              2024-08-30  1286  		deferred_split_folio(folio, false);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1287  		spin_unlock(pmd_ptl);
d857f1e14edec88 Nico Pache              2025-04-28  1288  	} else { /* mTHP collapse */
d857f1e14edec88 Nico Pache              2025-04-28  1289  		mthp_pte = mk_pte(&folio->page, vma->vm_page_prot);
d857f1e14edec88 Nico Pache              2025-04-28  1290  		mthp_pte = maybe_mkwrite(pte_mkdirty(mthp_pte), vma);
d857f1e14edec88 Nico Pache              2025-04-28  1291  
d857f1e14edec88 Nico Pache              2025-04-28  1292  		spin_lock(pmd_ptl);
d857f1e14edec88 Nico Pache              2025-04-28  1293  		folio_ref_add(folio, (1 << order) - 1);
d857f1e14edec88 Nico Pache              2025-04-28  1294  		folio_add_new_anon_rmap(folio, vma, _address, RMAP_EXCLUSIVE);
d857f1e14edec88 Nico Pache              2025-04-28  1295  		folio_add_lru_vma(folio, vma);
d857f1e14edec88 Nico Pache              2025-04-28  1296  		set_ptes(vma->vm_mm, _address, pte, mthp_pte, (1 << order));
d857f1e14edec88 Nico Pache              2025-04-28  1297  		update_mmu_cache_range(NULL, vma, _address, pte, (1 << order));
d857f1e14edec88 Nico Pache              2025-04-28  1298  
d857f1e14edec88 Nico Pache              2025-04-28  1299  		smp_wmb(); /* make pte visible before pmd */
d857f1e14edec88 Nico Pache              2025-04-28  1300  		pmd_populate(mm, pmd, pmd_pgtable(_pmd));
d857f1e14edec88 Nico Pache              2025-04-28  1301  		spin_unlock(pmd_ptl);
d857f1e14edec88 Nico Pache              2025-04-28  1302  	}
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1303  
0234779276e56fb Matthew Wilcox (Oracle  2024-04-03  1304) 	folio = NULL;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1305  
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1306  	result = SCAN_SUCCEED;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1307  out_up_write:
d857f1e14edec88 Nico Pache              2025-04-28  1308  	if (pte)
d857f1e14edec88 Nico Pache              2025-04-28  1309  		pte_unmap(pte);
d8ed45c5dcd455f Michel Lespinasse       2020-06-08  1310  	mmap_write_unlock(mm);
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1311  out_nolock:
2e6c970ed974576 Nico Pache              2025-04-28  1312  	*mmap_locked = false;
0234779276e56fb Matthew Wilcox (Oracle  2024-04-03  1313) 	if (folio)
0234779276e56fb Matthew Wilcox (Oracle  2024-04-03  1314) 		folio_put(folio);
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1315  	trace_mm_collapse_huge_page(mm, result == SCAN_SUCCEED, result);
50ad2f24b3b48c7 Zach O'Keefe            2022-07-06  1316  	return result;
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1317  }
b46e756f5e47031 Kirill A. Shutemov      2016-07-26  1318  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
