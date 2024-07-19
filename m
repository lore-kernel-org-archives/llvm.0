Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1C722066;
	Fri, 19 Jul 2024 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721415045; cv=none; b=S1wehQky/iKezN7GkN4P7ixgKiPTXhBv3+1azwkhd3gpWWo3cocKXxy+P3DBk5eJC8dhgtQuONcNGkD1xuThh0RM6AK0T+KXDkq3aFpYUlo/Z90/2hfxqjFh7HX7KgaEukF5Bn6EX7/MEu/CHo0tUKkBvgZlHDlSXO3lJG8PnCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721415045; c=relaxed/simple;
	bh=uYFanMFQbEcOzN9pam5KNLgtLsEStPUAwFW7eruwq3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HzwLtD8XCeohY309HXLAx2VvNugCczUdYksI6qjLrgDYkBZxrvE+rCKJ+GFhxEZWzQibcP/byNJq10sIxPBRwinNTgZRJhxSh8Ia+iib5TJdztiY2sZe1smxPtZj6f0OAABoNbSVsu1Gk7o/2HE5xsI9QgeS7kyeAaenGW91Yw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMLPh/1o; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMLPh/1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721415043; x=1752951043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uYFanMFQbEcOzN9pam5KNLgtLsEStPUAwFW7eruwq3A=;
  b=jMLPh/1oYzvX6OgTWOzxdxCS48xvFzEwC3DWcS+6u5jICH6d4dWh8INN
   u6celBvUC4JFqra2RIdgY4GZZfAGrLdxe5lf/P0X7rQBjVZ3CH0yWDcex
   d/XdWxfaMh0nnynhpijfd2AsoY7emmidPGwUlc4qUP7ZXb+w8D/mEKhdn
   2SwqRSh1bJ3OeH9n6zqU9Sgj85jPzJF3g8MA/1sro+dvBUWvH24AnIxFd
   EenSGHYmpA/yJ8pituGsyfhYoxy3R2yjzzuZZWUtJDGxnhuxZu/6vDOkM
   Ef0R/ekHijeEOsYf8uuJZy7nzZQowIRbUlxKeNPzKaSwTz+byu2Qlg3K0
   Q==;
X-CSE-ConnectionGUID: aW/H+xjfTIWrTHUMqJ1Fmg==
X-CSE-MsgGUID: pYogyftpSJGZmJucmRjMlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22913218"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="22913218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 11:50:42 -0700
X-CSE-ConnectionGUID: q67dR0RlScuFdyCn5ASZPQ==
X-CSE-MsgGUID: WEBzKLy5TIalj4p9hCL8Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="51237118"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jul 2024 11:50:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUsgg-000iUK-1H;
	Fri, 19 Jul 2024 18:50:38 +0000
Date: Sat, 20 Jul 2024 02:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 24/24]
 arch/powerpc/mm/book3s64/radix_pgtable.c:1416:25: error: incompatible
 pointer types assigning to 'struct ptdesc *' from 'pgtable_t' (aka 'pte_t
 *')
Message-ID: <202407200229.lbA1cLAn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   6ae12b6c0eff928170eee036443a5cf8a9337cf2
commit: 097194bcb4751e69a198ff50da9fa73f9c6e9e9f [24/24] mm/pgtable: convert ptdesc.pmd_huge_pte to ptdesc pointer
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240720/202407200229.lbA1cLAn-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200229.lbA1cLAn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200229.lbA1cLAn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/book3s64/radix_pgtable.c:10:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/mm/book3s64/radix_pgtable.c:1416:25: error: incompatible pointer types assigning to 'struct ptdesc *' from 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1416 |         pmd_huge_pte(mm, pmdp) = pgtable;
         |                                ^ ~~~~~~~
>> arch/powerpc/mm/book3s64/radix_pgtable.c:1428:10: error: incompatible pointer types assigning to 'pgtable_t' (aka 'pte_t *') from 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]
    1428 |         pgtable = pmd_huge_pte(mm, pmdp);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/radix_pgtable.c:1433:26: error: incompatible pointer types assigning to 'struct ptdesc *' from 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
    1433 |                 pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
         |                                        ^ ~~~~~~~~~~~~~~~~~~~~
   5 warnings and 3 errors generated.


vim +1416 arch/powerpc/mm/book3s64/radix_pgtable.c

bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1397  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1398  /*
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1399   * For us pgtable_t is pte_t *. Inorder to save the deposisted
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1400   * page table, we consider the allocated page table as a list
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1401   * head. On withdraw we need to make sure we zero out the used
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1402   * list_head memory area.
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1403   */
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1404  void radix__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1405  				 pgtable_t pgtable)
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1406  {
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1407  	struct list_head *lh = (struct list_head *) pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1408  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1409  	assert_spin_locked(pmd_lockptr(mm, pmdp));
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1410  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1411  	/* FIFO */
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1412  	if (!pmd_huge_pte(mm, pmdp))
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1413  		INIT_LIST_HEAD(lh);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1414  	else
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1415  		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29 @1416  	pmd_huge_pte(mm, pmdp) = pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1417  }
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1418  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1419  pgtable_t radix__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1420  {
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1421  	pte_t *ptep;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1422  	pgtable_t pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1423  	struct list_head *lh;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1424  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1425  	assert_spin_locked(pmd_lockptr(mm, pmdp));
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1426  
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1427  	/* FIFO */
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29 @1428  	pgtable = pmd_huge_pte(mm, pmdp);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1429  	lh = (struct list_head *) pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1430  	if (list_empty(lh))
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1431  		pmd_huge_pte(mm, pmdp) = NULL;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1432  	else {
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1433  		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1434  		list_del(lh);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1435  	}
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1436  	ptep = (pte_t *) pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1437  	*ptep = __pte(0);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1438  	ptep++;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1439  	*ptep = __pte(0);
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1440  	return pgtable;
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1441  }
bde3eb6222e496 arch/powerpc/mm/pgtable-radix.c Aneesh Kumar K.V 2016-04-29  1442  

:::::: The code at line 1416 was first introduced by commit
:::::: bde3eb6222e49673d2ee9dfdc6ab6e7b6ff69e91 powerpc/mm/radix: Add radix THP callbacks

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
