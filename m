Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B321802A3;
	Wed, 17 Jul 2024 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721224898; cv=none; b=PkocE5pNOoL9KopQg16WiUiHX4UPOAeDA+8PL1hPXap8OOcEp1mHly5oVpkoE24utBI8bvGj4AqwoqQ/b8RVNULGVKzLB5F6s6InkIAGIO3LyQRAkZvrEBYsxnWAwnQZbIl+3cd5IMbhY9CMEaZfDArWfibmxVkHWgj8Wdf0qLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721224898; c=relaxed/simple;
	bh=W0lWmBmKMrRlFp3mrdIwgOion1STniC+7aFYEY6ObNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qvdvKUwnE861YP2MfKxg6paxv4RgB4ebgH9rFfT2VviOrCcdCuT8SRW8hvZAdykhqjlWrWoM6DSdq8fTceorxrRONnw1zJHgo6yIwoHcIlc68MTk4e+zVYQN3GzU5+/BdP6BHFgf38Ii0ABcJ3aInWLw8iAgGc6oV2Ty+xoZqu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWLpeRxf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWLpeRxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721224897; x=1752760897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W0lWmBmKMrRlFp3mrdIwgOion1STniC+7aFYEY6ObNo=;
  b=WWLpeRxfu79jmtS7xZiMANmJVBWT9NTN05+8BFu+p8m4jVvZ6XAMsq7F
   xttgi41xF6GDzLYrn8pAtUoIj1WXYuFDmNuACb49/bPGiryqHNO0oAUJ2
   EJ9ipGF3PIZRbuuazx0Wxwimfxgih6+QlqJcMWanX9IkBotbjhYqdfibD
   6U9RMCIdy8hhkdtrRc/QJqWJumAJ5DV8Gfhof8x7REGXaNNeZlnLiTM62
   ZL/tiooshGNkc/Ce5eMGpICsAp/18rReMJnDDLWtPnUvWEnhFLxwuF6wH
   8uoeAch7EMeTmZ9Q9rZeuINeeQB3O8XvRK0nvqow2TXIWc16YiIzJ29C2
   Q==;
X-CSE-ConnectionGUID: NC3dhlTcTSCLS+Of2ECYww==
X-CSE-MsgGUID: i5NFQs0kS/2d/DGFkpqh/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18595018"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="18595018"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 07:01:15 -0700
X-CSE-ConnectionGUID: iMlXgqjGT76NBj1KLsIDzw==
X-CSE-MsgGUID: nmx6ezIkTlSGA+d5y4+y9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50141959"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2024 07:01:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU5DT-000gMe-1A;
	Wed, 17 Jul 2024 14:01:11 +0000
Date: Wed, 17 Jul 2024 22:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 24/24] arch/s390/mm/pgtable.c:577:25: error:
 incompatible pointer types assigning to 'struct ptdesc *' from 'pgtable_t'
 (aka 'pte_t *')
Message-ID: <202407172118.aEQxv67s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   a158e7e787b56bc7f1b4bb582a0e8ec65cacec4b
commit: a158e7e787b56bc7f1b4bb582a0e8ec65cacec4b [24/24] mm/pgtable: convert ptdesc.pmd_huge_pte to ptdesc
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240717/202407172118.aEQxv67s-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172118.aEQxv67s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407172118.aEQxv67s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/mm/pgtable.c:11:
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
>> arch/s390/mm/pgtable.c:577:25: error: incompatible pointer types assigning to 'struct ptdesc *' from 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
     577 |         pmd_huge_pte(mm, pmdp) = pgtable;
         |                                ^ ~~~~~~~
>> arch/s390/mm/pgtable.c:589:10: error: incompatible pointer types assigning to 'pgtable_t' (aka 'pte_t *') from 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]
     589 |         pgtable = pmd_huge_pte(mm, pmdp);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/mm/pgtable.c:594:26: error: incompatible pointer types assigning to 'struct ptdesc *' from 'pgtable_t' (aka 'pte_t *') [-Werror,-Wincompatible-pointer-types]
     594 |                 pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
         |                                        ^ ~~~~~~~~~~~~~~~~~~~~
   5 warnings and 3 errors generated.


vim +577 arch/s390/mm/pgtable.c

d08de8e2d86744f Gerald Schaefer    2016-07-04  563  
75077afbec1ac89 Gerald Schaefer    2012-10-08  564  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
6b0b50b0617fad5 Aneesh Kumar K.V   2013-06-05  565  void pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
6b0b50b0617fad5 Aneesh Kumar K.V   2013-06-05  566  				pgtable_t pgtable)
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  567  {
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  568  	struct list_head *lh = (struct list_head *) pgtable;
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  569  
ec66ad66a0de878 Martin Schwidefsky 2014-02-12  570  	assert_spin_locked(pmd_lockptr(mm, pmdp));
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  571  
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  572  	/* FIFO */
c389a250ab4cfa4 Kirill A. Shutemov 2013-11-14  573  	if (!pmd_huge_pte(mm, pmdp))
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  574  		INIT_LIST_HEAD(lh);
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  575  	else
c389a250ab4cfa4 Kirill A. Shutemov 2013-11-14  576  		list_add(lh, (struct list_head *) pmd_huge_pte(mm, pmdp));
c389a250ab4cfa4 Kirill A. Shutemov 2013-11-14 @577  	pmd_huge_pte(mm, pmdp) = pgtable;
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  578  }
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  579  
6b0b50b0617fad5 Aneesh Kumar K.V   2013-06-05  580  pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  581  {
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  582  	struct list_head *lh;
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  583  	pgtable_t pgtable;
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  584  	pte_t *ptep;
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  585  
ec66ad66a0de878 Martin Schwidefsky 2014-02-12  586  	assert_spin_locked(pmd_lockptr(mm, pmdp));
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  587  
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  588  	/* FIFO */
c389a250ab4cfa4 Kirill A. Shutemov 2013-11-14 @589  	pgtable = pmd_huge_pte(mm, pmdp);
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  590  	lh = (struct list_head *) pgtable;
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  591  	if (list_empty(lh))
c389a250ab4cfa4 Kirill A. Shutemov 2013-11-14  592  		pmd_huge_pte(mm, pmdp) = NULL;
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  593  	else {
c389a250ab4cfa4 Kirill A. Shutemov 2013-11-14  594  		pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  595  		list_del(lh);
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  596  	}
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  597  	ptep = (pte_t *) pgtable;
b8e3b37900a57f9 Heiko Carstens     2022-02-21  598  	set_pte(ptep, __pte(_PAGE_INVALID));
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  599  	ptep++;
b8e3b37900a57f9 Heiko Carstens     2022-02-21  600  	set_pte(ptep, __pte(_PAGE_INVALID));
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  601  	return pgtable;
9501d09fa3c4ca1 Gerald Schaefer    2012-10-08  602  }
75077afbec1ac89 Gerald Schaefer    2012-10-08  603  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
1e133ab296f3ff8 Martin Schwidefsky 2016-03-08  604  

:::::: The code at line 577 was first introduced by commit
:::::: c389a250ab4cfa4a3775d9f2c45271618af6d5b2 mm, thp: do not access mm->pmd_huge_pte directly

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
