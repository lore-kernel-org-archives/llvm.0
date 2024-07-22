Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2676214B95E;
	Mon, 22 Jul 2024 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721643392; cv=none; b=mOkON4LD1V53XlAlbkfGIbo2tCmtOdaOx/LPtB/ZM+AspSCmXL1bobvGxG/WbkGImXJryBN5hz3ZGFqqW0jacm6j1kZcB1izo+GaMI1oBbxvfBvcH/xuWsfQgntWc8vEOau6rpWnmKHn26IEZ2SswjF82xDXkguDefi15Wm5c68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721643392; c=relaxed/simple;
	bh=5B9Dbt/7uxZi6nqb6SuAYP+jy9Fh7GyfdZIe2pEKP9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TkZ+lCaMQtxnigNoaazneTzemVTLqA5yqb4wvrd9R9vf+5zePe2Qr2Y8Foo6t9vHOhH+vkvncMgHglXY+FYLa+qMEoK31q4FrqLXoEeVI5KDkxyOIF+HWx5mJjLLtXPbmMHfbsph4u6dDl1nWmuYFj7EMJvC3kKewAnu06+uSiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3haEESP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3haEESP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721643390; x=1753179390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5B9Dbt/7uxZi6nqb6SuAYP+jy9Fh7GyfdZIe2pEKP9I=;
  b=Y3haEESPzTFWMoOaYjcbPVTKueVbSIim17zDQROtvrjHF8HyMiK8O6Dt
   NfkW3wTyQ/aYtOdQxXEQ3tuj5iy8ulpwNHkGw52gJqKLYUJotszI63iwz
   JVAPPxsGambfPqTsCcn+sc4wnSDniPTZ1wh8Zp4RF9U0PblbwzGJpK1lo
   xQh0HAKPE8kWgPFZbjtoI0t11PVWm56kcsyoHWDZDI80AKoi2O5wE7EQc
   hxmuwXkA6QWVlajC06wz9vOppweppPTgZ2n8L5QJztyESY8FkpSzMic1x
   5b7Fd0k1Si0QWAh4xjTTO9Wwh50eM7SRSFPRCWWinTvXg6ogxlKiPJcOl
   w==;
X-CSE-ConnectionGUID: iVEIa9KhSCeWqacEz0lpjQ==
X-CSE-MsgGUID: Od3SVwl8Tqi0EIYJ8DHvuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="29862868"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="29862868"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 03:16:28 -0700
X-CSE-ConnectionGUID: TMKdGiwwT3Csc4iTmQ+W4g==
X-CSE-MsgGUID: UIl8otteT/OFuTHskBQYTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="51563777"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jul 2024 03:16:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVq5g-000l4a-0y;
	Mon, 22 Jul 2024 10:16:24 +0000
Date: Mon, 22 Jul 2024 18:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 32/42]
 arch/powerpc/mm/book3s64/radix_pgtable.c:1039:33: error: incompatible
 pointer types passing 'pte_t *' to parameter of type 'struct ptdesc *'
Message-ID: <202407221810.LiFUCWbC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   0dc6582fabc5dcd9239957e6e6501344fd99714a
commit: 2ebcd5d8095bd27829436469978d476b4d0a35fc [32/42] mm/pgtable: return ptdesc in pte_free
config: powerpc64-randconfig-003-20240722 (https://download.01.org/0day-ci/archive/20240722/202407221810.LiFUCWbC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221810.LiFUCWbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407221810.LiFUCWbC-lkp@intel.com/

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
>> arch/powerpc/mm/book3s64/radix_pgtable.c:1039:33: error: incompatible pointer types passing 'pte_t *' to parameter of type 'struct ptdesc *' [-Werror,-Wincompatible-pointer-types]
    1039 |                         pmd_populate(&init_mm, pmdp, pte);
         |                                                      ^~~
   arch/powerpc/include/asm/book3s/64/pgalloc.h:165:20: note: passing argument to parameter 'pte_page' here
     165 |                                 struct ptdesc *pte_page)
         |                                                ^
   5 warnings and 1 error generated.


vim +1039 arch/powerpc/mm/book3s64/radix_pgtable.c

368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1029  
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1030  static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1031  				       unsigned long address)
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1032  {
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1033  	pte_t *pte;
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1034  
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1035  	/* All early vmemmap mapping to keep simple do it at PAGE_SIZE */
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1036  	if (unlikely(pmd_none(*pmdp))) {
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1037  		if (unlikely(!slab_is_available())) {
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1038  			pte = early_alloc_pgtable(PAGE_SIZE, node, 0, 0);
368a0590d954a6 Aneesh Kumar K.V 2023-07-25 @1039  			pmd_populate(&init_mm, pmdp, pte);
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1040  		} else
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1041  			return pte_alloc_kernel(pmdp, address);
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1042  	}
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1043  	return pte_offset_kernel(pmdp, address);
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1044  }
368a0590d954a6 Aneesh Kumar K.V 2023-07-25  1045  

:::::: The code at line 1039 was first introduced by commit
:::::: 368a0590d954a659b16ab945328ada0cc10f93a0 powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
