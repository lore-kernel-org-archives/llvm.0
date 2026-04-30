Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2417D6;
	Thu, 30 Apr 2026 01:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777513406; cv=none; b=ZlrU8//FTlr7wsSwRnwsQn/7bkVZCbjtDTGkshUZ8NheIUHXFiN4307Cuf1LvxrCoBYu/upvtzXtQcchlZQVsL081RPnRlgrkiDR+k/WTgIZRFTMhLcqQroXCnSFFeycJarpMqQEWqlzBPrCl/lVWfOSEVYLppZd7jvPqOz5DJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777513406; c=relaxed/simple;
	bh=FuYooD5rkWtLJ6onefhx3iWmBcZ6MuYlNeD+edtdF3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sp9w9rhq1/W16/LwL8MOFURMPo/0W0cWIKaRSmtx2CwAgxS5kJEQGgvVmk0mJyFi1tbXK8SFzjxhKKJ89uyeBQ1t2MhQfwVCWfZE/RHWpqshU5sjhTTbe/EdvA6xXKNL49GfJOB89KGgXENhcOSMIRXTgaQw8tOgnpUmyaoRaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQdRSSij; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQdRSSij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777513404; x=1809049404;
  h=date:from:to:cc:subject:message-id;
  bh=FuYooD5rkWtLJ6onefhx3iWmBcZ6MuYlNeD+edtdF3M=;
  b=cQdRSSijCKVHjpm+02m7eNIXbdFMi/1blmMxMPhfAQg2/c7wb//Bunx+
   Nfkx9QZjP6vTuTqypOBce+DoIEn6E0KygPvslWSCpX8pLsVvEQm7jljrt
   1Iy8yh1SKMpg+TCoPKY1h1ii6SeSppTrELRLW7zS6aJPv6+ozpX492Ern
   +gDKYz0UKvUsHFRGOjgSn6oBLFCC7pgEpvh8QJHakpSQ7gTzobjkibp1z
   4gztlGGVhWXxzcAy/C6fPM5QHETOIZRd1ANiasbn+BCfDo7QJ/MTeWJ7R
   IME2rcvn65nFyDbsO88m1Ie3XDCha0KAxdit0wD8LFMXv/kNHcgiZo3k4
   Q==;
X-CSE-ConnectionGUID: 9q4ihyU2T5ShctMVCuXCBA==
X-CSE-MsgGUID: dPI/gF0hTFiw/J1kU4ilSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78559401"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78559401"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 18:43:24 -0700
X-CSE-ConnectionGUID: 7YX+su29R/iwAGE/ruOMwg==
X-CSE-MsgGUID: znHGKK4zRhef+6V+RWOtRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="227939682"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Apr 2026 18:43:22 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIGQx-00000000Bmc-3qNk;
	Thu, 30 Apr 2026 01:43:19 +0000
Date: Thu, 30 Apr 2026 09:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:b4/bootmem_info 2/11]
 arch/x86/mm/init_64.c:1132:39: error: use of undeclared identifier 'altmap'
Message-ID: <202604300949.kKgTppRd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux b4/bootmem_info
head:   80cd9eaf52f7ea07b36881a937059d7075ac110a
commit: fe143d8e7106022f9b66e9c6db02af801fd277f4 [2/11] x86/mm: fix freeing of PMD-sized vmemmap pages
config: x86_64-randconfig-073-20260430 (https://download.01.org/0day-ci/archive/20260430/202604300949.kKgTppRd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300949.kKgTppRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300949.kKgTppRd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/mm/init_64.c:1132:39: error: use of undeclared identifier 'altmap'
    1132 |                         free_vmemmap_pages(pte_page(*pte), altmap, 0);
         |                                                            ^
>> arch/x86/mm/init_64.c:1168:11: error: incompatible pointer to integer conversion passing 'struct vmem_altmap *' to parameter of type 'unsigned int' [-Wint-conversion]
    1168 |                                                            altmap, PMD_ORDER);
         |                                                            ^~~~~~
   arch/x86/mm/init_64.c:1031:74: note: passing argument to parameter 'order' here
    1031 | static void __meminit free_vmemmap_pages(struct page *page, unsigned int order,
         |                                                                          ^
>> arch/x86/mm/init_64.c:1168:19: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct vmem_altmap *' [-Wint-conversion]
    1168 |                                                            altmap, PMD_ORDER);
         |                                                                    ^~~~~~~~~
   include/linux/pgtable.h:8:19: note: expanded from macro 'PMD_ORDER'
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:1032:23: note: passing argument to parameter 'altmap' here
    1032 |                 struct vmem_altmap *altmap)
         |                                     ^
   arch/x86/mm/init_64.c:1176:11: error: incompatible pointer to integer conversion passing 'struct vmem_altmap *' to parameter of type 'unsigned int' [-Wint-conversion]
    1176 |                                                            altmap, PMD_ORDER);
         |                                                            ^~~~~~
   arch/x86/mm/init_64.c:1031:74: note: passing argument to parameter 'order' here
    1031 | static void __meminit free_vmemmap_pages(struct page *page, unsigned int order,
         |                                                                          ^
   arch/x86/mm/init_64.c:1176:19: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct vmem_altmap *' [-Wint-conversion]
    1176 |                                                            altmap, PMD_ORDER);
         |                                                                    ^~~~~~~~~
   include/linux/pgtable.h:8:19: note: expanded from macro 'PMD_ORDER'
       8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/init_64.c:1032:23: note: passing argument to parameter 'altmap' here
    1032 |                 struct vmem_altmap *altmap)
         |                                     ^
>> arch/x86/mm/init_64.c:1185:50: error: too many arguments to function call, expected 4, have 5
    1185 |                 remove_pte_table(pte_base, addr, next, direct, altmap);
         |                 ~~~~~~~~~~~~~~~~                               ^~~~~~
   arch/x86/mm/init_64.c:1106:1: note: 'remove_pte_table' declared here
    1106 | remove_pte_table(pte_t *pte_start, unsigned long addr, unsigned long end,
         | ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1107 |                  bool direct)
         |                  ~~~~~~~~~~~
   6 errors generated.


vim +/altmap +1132 arch/x86/mm/init_64.c

  1104	
  1105	static void __meminit
  1106	remove_pte_table(pte_t *pte_start, unsigned long addr, unsigned long end,
  1107			 bool direct)
  1108	{
  1109		unsigned long next, pages = 0;
  1110		pte_t *pte;
  1111		phys_addr_t phys_addr;
  1112	
  1113		pte = pte_start + pte_index(addr);
  1114		for (; addr < end; addr = next, pte++) {
  1115			next = (addr + PAGE_SIZE) & PAGE_MASK;
  1116			if (next > end)
  1117				next = end;
  1118	
  1119			if (!pte_present(*pte))
  1120				continue;
  1121	
  1122			/*
  1123			 * We mapped [0,1G) memory as identity mapping when
  1124			 * initializing, in arch/x86/kernel/head_64.S. These
  1125			 * pagetables cannot be removed.
  1126			 */
  1127			phys_addr = pte_val(*pte) + (addr & PAGE_MASK);
  1128			if (phys_addr < (phys_addr_t)0x40000000)
  1129				return;
  1130	
  1131			if (!direct)
> 1132				free_vmemmap_pages(pte_page(*pte), altmap, 0);
  1133	
  1134			spin_lock(&init_mm.page_table_lock);
  1135			pte_clear(&init_mm, addr, pte);
  1136			spin_unlock(&init_mm.page_table_lock);
  1137	
  1138			/* For non-direct mapping, pages means nothing. */
  1139			pages++;
  1140		}
  1141	
  1142		/* Call free_pte_table() in remove_pmd_table(). */
  1143		flush_tlb_all();
  1144		if (direct)
  1145			update_page_count(PG_LEVEL_4K, -pages);
  1146	}
  1147	
  1148	static void __meminit
  1149	remove_pmd_table(pmd_t *pmd_start, unsigned long addr, unsigned long end,
  1150			 bool direct, struct vmem_altmap *altmap)
  1151	{
  1152		unsigned long next, pages = 0;
  1153		pte_t *pte_base;
  1154		pmd_t *pmd;
  1155	
  1156		pmd = pmd_start + pmd_index(addr);
  1157		for (; addr < end; addr = next, pmd++) {
  1158			next = pmd_addr_end(addr, end);
  1159	
  1160			if (!pmd_present(*pmd))
  1161				continue;
  1162	
  1163			if (pmd_leaf(*pmd)) {
  1164				if (IS_ALIGNED(addr, PMD_SIZE) &&
  1165				    IS_ALIGNED(next, PMD_SIZE)) {
  1166					if (!direct)
  1167						free_vmemmap_pages(pmd_page(*pmd),
> 1168								   altmap, PMD_ORDER);
  1169	
  1170					spin_lock(&init_mm.page_table_lock);
  1171					pmd_clear(pmd);
  1172					spin_unlock(&init_mm.page_table_lock);
  1173					pages++;
  1174				} else if (vmemmap_pmd_is_unused(addr, next)) {
  1175						free_vmemmap_pages(pmd_page(*pmd),
  1176								   altmap, PMD_ORDER);
  1177						spin_lock(&init_mm.page_table_lock);
  1178						pmd_clear(pmd);
  1179						spin_unlock(&init_mm.page_table_lock);
  1180				}
  1181				continue;
  1182			}
  1183	
  1184			pte_base = (pte_t *)pmd_page_vaddr(*pmd);
> 1185			remove_pte_table(pte_base, addr, next, direct, altmap);
  1186			free_pte_table(pte_base, pmd);
  1187		}
  1188	
  1189		/* Call free_pmd_table() in remove_pud_table(). */
  1190		if (direct)
  1191			update_page_count(PG_LEVEL_2M, -pages);
  1192	}
  1193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
