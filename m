Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AF82A1AA;
	Sun, 22 Dec 2024 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734886828; cv=none; b=u1frDZTXqrFR89fEzv5zFL9xwoIW92OWhlsfLlCts/xYZnz/eKFCVJ60ZPPov3wE86Mt7Jv9T2GnCo0SpPZ5QeajVOa6vSd4AbdCFZr0rvqyydZnA3EHxVVhApnyMmUxxwdT+ZN8vnLMiLR0WJLveRUS4WGUeCcsWA7QQB1U7S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734886828; c=relaxed/simple;
	bh=WG0YhvbH4drLyIkvqgWPZERq/LhDTLtZrZZr0vpjzHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3+AAXZnd6eoqOjn3kTwTKhCQGd/o7xocEj+XSmuvUVbqCOLFH5zlu/YTtDBzFTgqBd8vk1y+egRRTNQJmj4Re96T1iEKlHsY6B9HwJU4pUPNYVcl9KOdXV/R/Nf4PU8/L5qfoapUlGel9Ea3WksktnIGkKjbsPd9P7N+0fzRbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvCPCtCy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvCPCtCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734886826; x=1766422826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WG0YhvbH4drLyIkvqgWPZERq/LhDTLtZrZZr0vpjzHg=;
  b=WvCPCtCyllJxbihzt4PaSiVzHwJgQfinjnTm/HfGnoshg3msHvV4IIMn
   Qh9tTgENbTJFOixAIMldpRPQvtDJFZquAhjv89mmkFvsqDaD1qZdeoHYI
   nn6B4Y4qHgm8dTdA+pLXM61VoifbNTcTyRkoh4EA8OKBKMFwag82lv0A5
   iDVFQPwVHhn6wDE3rFoNiU8JDM2p7RtjSdx0sUUm6BXjwW2oUAWrZWIrJ
   3Oxgg0MQmnl9klEwQvw33RbweupYTOme6jJAaigtaQQwIdqBXTCiPckgW
   /RdK44vdPA6aJQefPM0uHK8pHsq9yVDVjrivCgOcAC1XkKZV6Zx2t5BBc
   w==;
X-CSE-ConnectionGUID: 2OMhgsrMQxmZkLNy+Q/OXQ==
X-CSE-MsgGUID: hXKSq/MPRI2VOpikSdC/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="39302530"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="39302530"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 09:00:25 -0800
X-CSE-ConnectionGUID: zREmB0vMTY24u1Ec1qua/Q==
X-CSE-MsgGUID: Zy6xTekyRNmCclgij8hZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="104057533"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Dec 2024 09:00:24 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPPJW-00034F-01;
	Sun, 22 Dec 2024 17:00:22 +0000
Date: Mon, 23 Dec 2024 01:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v8 3/6] arch/x86/mm/pat/set_memory.c:1314:3:
 error: call to undeclared function 'collapse_page_count'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202412230033.RG988JjP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v8
head:   6c4eb6e17cdd71fe4df151523bb69db507c52b8c
commit: 84b77b5e5004c02f0f731ca69c66a8d8f4bcbc6c [3/6] x86/mm/pat: Restore large pages after fragmentation
config: i386-buildonly-randconfig-005-20241222 (https://download.01.org/0day-ci/archive/20241223/202412230033.RG988JjP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230033.RG988JjP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230033.RG988JjP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/mm/pat/set_memory.c:6:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/mm/pat/set_memory.c:1314:3: error: call to undeclared function 'collapse_page_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1314 |                 collapse_page_count(PG_LEVEL_2M);
         |                 ^
   arch/x86/mm/pat/set_memory.c:1314:3: note: did you mean 'update_page_count'?
   arch/x86/include/asm/pgtable_types.h:563:20: note: 'update_page_count' declared here
     563 | static inline void update_page_count(int level, unsigned long pages) { }
         |                    ^
   arch/x86/mm/pat/set_memory.c:1361:3: error: call to undeclared function 'collapse_page_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1361 |                 collapse_page_count(PG_LEVEL_1G);
         |                 ^
   1 warning and 2 errors generated.


vim +/collapse_page_count +1314 arch/x86/mm/pat/set_memory.c

  1251	
  1252	static int collapse_pmd_page(pmd_t *pmd, unsigned long addr,
  1253				     struct list_head *pgtables)
  1254	{
  1255		pmd_t _pmd, old_pmd;
  1256		pte_t *pte, first;
  1257		unsigned long pfn;
  1258		pgprot_t pgprot;
  1259		int i = 0;
  1260	
  1261		addr &= PMD_MASK;
  1262		pte = pte_offset_kernel(pmd, addr);
  1263		first = *pte;
  1264		pfn = pte_pfn(first);
  1265	
  1266		/* Make sure alignment is suitable */
  1267		if (PFN_PHYS(pfn) & ~PMD_MASK)
  1268			return 0;
  1269	
  1270		/* The page is 4k intentionally */
  1271		if (pte_flags(first) & _PAGE_KERNEL_4K)
  1272			return 0;
  1273	
  1274		/* Check that the rest of PTEs are compatible with the first one */
  1275		for (i = 1, pte++; i < PTRS_PER_PTE; i++, pte++) {
  1276			pte_t entry = *pte;
  1277	
  1278			if (!pte_present(entry))
  1279				return 0;
  1280			if (pte_flags(entry) != pte_flags(first))
  1281				return 0;
  1282			if (pte_pfn(entry) != pte_pfn(first) + i)
  1283				return 0;
  1284		}
  1285	
  1286		old_pmd = *pmd;
  1287	
  1288		/* Success: set up a large page */
  1289		pgprot = pgprot_4k_2_large(pte_pgprot(first));
  1290		pgprot_val(pgprot) |= _PAGE_PSE;
  1291		_pmd = pfn_pmd(pfn, pgprot);
  1292		set_pmd(pmd, _pmd);
  1293	
  1294		/* Queue the page table to be freed after TLB flush */
  1295		list_add(&page_ptdesc(pmd_page(old_pmd))->pt_list, pgtables);
  1296	
  1297		if (IS_ENABLED(CONFIG_X86_32) && !SHARED_KERNEL_PMD) {
  1298			struct page *page;
  1299	
  1300			/* Update all PGD tables to use the same large page */
  1301			list_for_each_entry(page, &pgd_list, lru) {
  1302				pgd_t *pgd = (pgd_t *)page_address(page) + pgd_index(addr);
  1303				p4d_t *p4d = p4d_offset(pgd, addr);
  1304				pud_t *pud = pud_offset(p4d, addr);
  1305				pmd_t *pmd = pmd_offset(pud, addr);
  1306				/* Something is wrong if entries doesn't match */
  1307				if (WARN_ON(pmd_val(old_pmd) != pmd_val(*pmd)))
  1308					continue;
  1309				set_pmd(pmd, _pmd);
  1310			}
  1311		}
  1312	
  1313		if (pfn_range_is_mapped(pfn, pfn + 1))
> 1314			collapse_page_count(PG_LEVEL_2M);
  1315	
  1316		return 1;
  1317	}
  1318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
