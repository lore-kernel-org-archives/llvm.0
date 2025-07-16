Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A454654;
	Wed, 16 Jul 2025 01:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752628448; cv=none; b=J8MrRQHTydaiLaRxvM7QIEH6XIrZYHfXiIkeABUuOKRZ51kaSDXfdAACgBtz56BfX1eZ8s0q3Wrg8jkG4A9RJXXt0KadNDEa8J0rbOqNZf4P7Nxg+R5XUAI3OW7ZBJu9EyCUVK2bGDSwSIY+Jzhq+Oimq7518gmM/VHASdjllJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752628448; c=relaxed/simple;
	bh=5E4aCZT0JzZaI82KiVYu3vjdE/UNOVHziwz5cWaCR6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZuOzS9W6FIbZdztexQcAtKLfSGfISKXSOqCXi7MW2XHpycW9jWZfWGS2H5uumxyCSd5Bh/8lXj/AUv5PCs58E9lOx1+YGxiJdaPVhlJqm9CFJFUG+UCDXeVVggclWFdSLyWkqQztvqlvlH90K0V/E2a6oz0sj4Bu7NW2UkJQbTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VD7AXGKs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VD7AXGKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752628446; x=1784164446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5E4aCZT0JzZaI82KiVYu3vjdE/UNOVHziwz5cWaCR6c=;
  b=VD7AXGKsgvE41JDGx7bwQ/HkM9xf0iQPVWCdPNlm3U6bpDHxyFLurkr3
   8xqvXiu53/Ai1Uar2b8XSxVmQTiJD/h/4IBVkfn2gumgFs8YBMQjJUUpq
   SSseP2RKN7KFe4RSyp10bw4YH+Z1y0kggf4CKvMZIL+gJivS5jkRiSGYH
   E6hhDmbJjlBmsqU75jsT6nwnoKmfpoM7OptTCXxGCI7eJc8ltV3f7HY0s
   GP4V1HopHYN+ZRWJDAf/HNObsJqCTFWXopaK84lV1iYwose8C5vBcJKVY
   VN289FUuwgjZtAQjwtAO9Yk8Zsl03Izd2zIbI242Zj98Zga391dNRChpm
   Q==;
X-CSE-ConnectionGUID: rWBpe7+oTX65GvOqLDebPw==
X-CSE-MsgGUID: tD9KpFktQli4JvbrA+0QAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54986188"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="54986188"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 18:14:05 -0700
X-CSE-ConnectionGUID: vpcSgStpRrK6deNZONRoNA==
X-CSE-MsgGUID: ejzg7bHWSJGjCG24yzfZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="188373764"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jul 2025 18:14:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubqif-000BkR-1y;
	Wed, 16 Jul 2025 01:14:01 +0000
Date: Wed, 16 Jul 2025 09:13:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:vm_normal_page_pud 6/9] mm/memory.c:525:6: error:
 array type 'pgd_t' (aka 'unsigned int[2]') is not assignable
Message-ID: <202507160956.vS2CVmpM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux vm_normal_page_pud
head:   45efeb8305fe9bbe4e6cfbd2adcf5810254f5828
commit: a9309234598507efc5d14aadf44296d5f9e40ecb [6/9] mm/memory: convert print_bad_pte() to print_bad_page_map()
config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20250716/202507160956.vS2CVmpM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160956.vS2CVmpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160956.vS2CVmpM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:525:6: error: array type 'pgd_t' (aka 'unsigned int[2]') is not assignable
     525 |         pgd = pgdp_get(pgdp);
         |         ~~~ ^
   1 error generated.


vim +525 mm/memory.c

   508	
   509	static void __dump_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
   510	{
   511		unsigned long long pgdv, p4dv, pudv, pmdv;
   512		pgd_t pgd, *pgdp;
   513		p4d_t p4d, *p4dp;
   514		pud_t pud, *pudp;
   515		pmd_t *pmdp;
   516	
   517		/*
   518		 * This looks like a fully lockless walk, however, the caller is
   519		 * expected to hold the leaf page table lock in addition to other
   520		 * rmap/mm/vma locks. So this is just a re-walk to dump page table
   521		 * content while any concurrent modifications should be completely
   522		 * prevented.
   523		 */
   524		pgdp = pgd_offset(mm, addr);
 > 525		pgd = pgdp_get(pgdp);
   526		pgdv = pgd_val(pgd);
   527	
   528		if (!pgd_present(pgd) || pgd_leaf(pgd)) {
   529			pr_alert("pgd:%08llx\n", pgdv);
   530			return;
   531		}
   532	
   533		p4dp = p4d_offset(pgdp, addr);
   534		p4d = p4dp_get(p4dp);
   535		p4dv = p4d_val(p4d);
   536	
   537		if (!p4d_present(p4d) || p4d_leaf(p4d)) {
   538			pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
   539			return;
   540		}
   541	
   542		pudp = pud_offset(p4dp, addr);
   543		pud = pudp_get(pudp);
   544		pudv = pud_val(pud);
   545	
   546		if (!pud_present(pud) || pud_leaf(pud)) {
   547			pr_alert("pgd:%08llx p4d:%08llx pud:%08llx\n", pgdv, p4dv, pudv);
   548			return;
   549		}
   550	
   551		pmdp = pmd_offset(pudp, addr);
   552		pmdv = pmd_val(pmdp_get(pmdp));
   553	
   554		/*
   555		 * Dumping the PTE would be nice, but it's tricky with CONFIG_HIGHPTE,
   556		 * because the table should already be mapped by the caller and
   557		 * doing another map would be bad. print_bad_page_map() should
   558		 * already take care of printing the PTE.
   559		 */
   560		pr_alert("pgd:%08llx p4d:%08llx pud:%08llx pmd:%08llx\n", pgdv,
   561			 p4dv, pudv, pmdv);
   562	}
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
