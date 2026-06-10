Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A019405C47;
	Wed, 10 Jun 2026 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092538; cv=none; b=q978oPOTwXHNcUPdTprTp+kQEk2Lq2X5CK820LykAQQ0LwZcC3kPAZjwTL9TXpTCeR4E/W3PtoEiO8/yXjpXrqzsLbo8kl5HyB+bGLhJY3zQU4t/UUXYHAkOXl82vncs7KECLpssk9OExVpEtethXVVFFYhVhoKb8HV7C5igqKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092538; c=relaxed/simple;
	bh=h0rdhSZo4G0+zJHHN2NcdXNQcjlyE6AFbql3bjCUFIc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hAK470OMlVsCk0OndfztAAvzDDXtwHswxWKzUtRFfpY07TKvU5frM2YIwe/FWV4uFnyrAPFitdr+3MkNoWN/ABOJ8XwS/T4lwKefAZkQPhFs3AOmkYL17EA+8T1Z8DP385dD4GB+7aF1U30VTnNGuj0gsCzuse+RQ8emBBQYpJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLBC6BT/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLBC6BT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781092537; x=1812628537;
  h=date:from:to:cc:subject:message-id;
  bh=h0rdhSZo4G0+zJHHN2NcdXNQcjlyE6AFbql3bjCUFIc=;
  b=kLBC6BT/5C0Eo3Nc8wguDON6NhOJ2pCm5dGsz5dxL7Ef2EotcQ1fSGu+
   tOzgKz50XhratE2VqbIV2yEFWZfEad6MJS7kJvi+cWj89bLTT+NnNSMgP
   pt2HZ0pkMSYRyih+p7HD0eQFBQV39faUTEi2jGWnOv5qECXojCq95BBYu
   wVUVdTs6O/LL04hD4RQ59t4iOz3XS3UFlu6o+ffTELMsd7bC8e9chSMD2
   zpWdpRmVahjV5pvOwhyjZUiIQh4+9fN9svS85gZDOfqZSJ9kw48KT6BKg
   mphLuYX/fzwJDIYF46kO9lzo+9G5kf4APIUxMaQID2bXEbrrhWONRwrfL
   Q==;
X-CSE-ConnectionGUID: FScOlDQrSQC5UtcGf2o0xw==
X-CSE-MsgGUID: HwMYZUOdSmGCfMSVIDA6Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99459747"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="99459747"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:55:35 -0700
X-CSE-ConnectionGUID: 1dJ3Kc9vRTaTYtaXOwf+9w==
X-CSE-MsgGUID: +dA4Rr74SfK/bK+ZNT8e3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="269829433"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jun 2026 04:55:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXHWt-000000003fv-10Zk;
	Wed, 10 Jun 2026 11:55:31 +0000
Date: Wed, 10 Jun 2026 13:55:04 +0200
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/memory.c:526:8: warning: variable 'pmd' set but not used
Message-ID: <202606101305.g9K7xxXx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/lib-vsprintf-Add-support-for-pgtable-entries/20260610-123818
head:   421f2f321815f6c587e6b455ff0667c00e41beb5
commit: 421f2f321815f6c587e6b455ff0667c00e41beb5 mm: Replace pgtable entry prints with new format
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260610/202606101305.g9K7xxXx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101305.g9K7xxXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101305.g9K7xxXx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:526:8: warning: variable 'pmd' set but not used [-Wunused-but-set-variable]
     526 |         pmd_t pmd, *pmdp;
         |               ^
   1 warning generated.


vim +/pmd +526 mm/memory.c

ec63a44011dcce David Hildenbrand 2025-08-11  521  
ec63a44011dcce David Hildenbrand 2025-08-11  522  static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
ec63a44011dcce David Hildenbrand 2025-08-11  523  {
ec63a44011dcce David Hildenbrand 2025-08-11  524  	p4d_t p4d, *p4dp;
ec63a44011dcce David Hildenbrand 2025-08-11  525  	pud_t pud, *pudp;
ec63a44011dcce David Hildenbrand 2025-08-11 @526  	pmd_t pmd, *pmdp;
ec63a44011dcce David Hildenbrand 2025-08-11  527  	pgd_t *pgdp;
ec63a44011dcce David Hildenbrand 2025-08-11  528  
ec63a44011dcce David Hildenbrand 2025-08-11  529  	/*
ec63a44011dcce David Hildenbrand 2025-08-11  530  	 * Although this looks like a fully lockless pgtable walk, it is not:
ec63a44011dcce David Hildenbrand 2025-08-11  531  	 * see locking requirements for print_bad_page_map().
ec63a44011dcce David Hildenbrand 2025-08-11  532  	 */
ec63a44011dcce David Hildenbrand 2025-08-11  533  	pgdp = pgd_offset(mm, addr);
ec63a44011dcce David Hildenbrand 2025-08-11  534  
ec63a44011dcce David Hildenbrand 2025-08-11  535  	if (!pgd_present(*pgdp) || pgd_leaf(*pgdp)) {
421f2f321815f6 Anshuman Khandual 2026-06-10  536  		pr_alert("pgd:%ppgd\n", pgdp);
ec63a44011dcce David Hildenbrand 2025-08-11  537  		return;
ec63a44011dcce David Hildenbrand 2025-08-11  538  	}
ec63a44011dcce David Hildenbrand 2025-08-11  539  
ec63a44011dcce David Hildenbrand 2025-08-11  540  	p4dp = p4d_offset(pgdp, addr);
ec63a44011dcce David Hildenbrand 2025-08-11  541  	p4d = p4dp_get(p4dp);
ec63a44011dcce David Hildenbrand 2025-08-11  542  
ec63a44011dcce David Hildenbrand 2025-08-11  543  	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
421f2f321815f6 Anshuman Khandual 2026-06-10  544  		pr_alert("pgd:%ppgd p4d:%pp4d\n", pgdp, p4dp);
ec63a44011dcce David Hildenbrand 2025-08-11  545  		return;
ec63a44011dcce David Hildenbrand 2025-08-11  546  	}
ec63a44011dcce David Hildenbrand 2025-08-11  547  
ec63a44011dcce David Hildenbrand 2025-08-11  548  	pudp = pud_offset(p4dp, addr);
ec63a44011dcce David Hildenbrand 2025-08-11  549  	pud = pudp_get(pudp);
ec63a44011dcce David Hildenbrand 2025-08-11  550  
ec63a44011dcce David Hildenbrand 2025-08-11  551  	if (!pud_present(pud) || pud_leaf(pud)) {
421f2f321815f6 Anshuman Khandual 2026-06-10  552  		pr_alert("pgd:%ppgd p4d:%pp4d pud:%ppud\n", pgdp, p4dp, pudp);
ec63a44011dcce David Hildenbrand 2025-08-11  553  		return;
ec63a44011dcce David Hildenbrand 2025-08-11  554  	}
ec63a44011dcce David Hildenbrand 2025-08-11  555  
ec63a44011dcce David Hildenbrand 2025-08-11  556  	pmdp = pmd_offset(pudp, addr);
ec63a44011dcce David Hildenbrand 2025-08-11  557  	pmd = pmdp_get(pmdp);
ec63a44011dcce David Hildenbrand 2025-08-11  558  
ec63a44011dcce David Hildenbrand 2025-08-11  559  	/*
ec63a44011dcce David Hildenbrand 2025-08-11  560  	 * Dumping the PTE would be nice, but it's tricky with CONFIG_HIGHPTE,
ec63a44011dcce David Hildenbrand 2025-08-11  561  	 * because the table should already be mapped by the caller and
ec63a44011dcce David Hildenbrand 2025-08-11  562  	 * doing another map would be bad. print_bad_page_map() should
ec63a44011dcce David Hildenbrand 2025-08-11  563  	 * already take care of printing the PTE.
ec63a44011dcce David Hildenbrand 2025-08-11  564  	 */
421f2f321815f6 Anshuman Khandual 2026-06-10  565  	pr_alert("pgd:%ppgd p4d:%pp4d pud:%ppud pmd:%ppmd\n", pgdp,
421f2f321815f6 Anshuman Khandual 2026-06-10  566  		 p4dp, pudp, pmdp);
ec63a44011dcce David Hildenbrand 2025-08-11  567  }
ec63a44011dcce David Hildenbrand 2025-08-11  568  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
