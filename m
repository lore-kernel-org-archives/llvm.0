Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6F0375AD0;
	Thu, 30 Apr 2026 07:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535557; cv=none; b=Ue1f+Msk55X8sVt9+QyQN3NMcxoluoWO1ZACodPmS3DUMOgjEE7+Fp+bhyOraA1XPBs8yFQaRidYiI4ESFy+J7QJdDT5aHr+srQZxdWUYj2oB3iZoq/jNtq7IBGX0nXbAOn62lDTbAkKsxA0XlhHOOo+hNzgXW30WSJ+m49zln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535557; c=relaxed/simple;
	bh=3kk2c/qcV1sq+rmF32W9cD4AnPCW6X2pe4Ze5owEsM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WAcBgRHopAjimBQDS8bonWK1GLJ7KApjafy3xuefFH//df8XebMn1ZproUfyarsCfptYd1aH27PbkWs0iZGQUTLCJ+6EhW/x94xVNtNpTVO0DqwElTnmZNzyUhTiSJwyuGZx/Iut2z/v3JAiu73uaIN2FJ+4JS8o6Uxr2Pb8hOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtV/DaoM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtV/DaoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777535556; x=1809071556;
  h=date:from:to:cc:subject:message-id;
  bh=3kk2c/qcV1sq+rmF32W9cD4AnPCW6X2pe4Ze5owEsM0=;
  b=WtV/DaoM8myYGSDD8dNaOq9YReY8Q+8618tXNOF+XgxInwWKzaJSxzeG
   cCLOTqLAZaPUad0OHXYFlPoyl8cSHjEtJuZXzZtOKUYVhq0gU8RcKFgX7
   CH0YppSrFEyZrdu3muvoWWtAUR6PsstIUQMrwIBmk5ddNUE86c7gTRVOZ
   NB7iAfX4GicbGmUkRm60YmzDiBDwpZxhcgDQABzgGCbRAqARbajaCedH3
   jXWCrgStpUaJthn0MFsKAzhW/qVIb0Xufr6aW2dZLZqMQssBQ2zaOF2kH
   o8t4KmO/otRd5JgNncihwQ/ZKmr/hG2LOc2PK2rOLDKOyYag7rcxux2SQ
   g==;
X-CSE-ConnectionGUID: gHL9ij9fSQybPguhJMpYwg==
X-CSE-MsgGUID: WahHmFl5Q0WL9FK+8y63Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78466886"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78466886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 00:52:35 -0700
X-CSE-ConnectionGUID: 05UlSHXwSBKRQ62gq0oz9Q==
X-CSE-MsgGUID: LEKo4pYgTva1Y9ISqfmxbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="231865073"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 00:52:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIMCF-000000004m5-1lje;
	Thu, 30 Apr 2026 07:52:31 +0000
Date: Thu, 30 Apr 2026 09:51:53 +0200
From: kernel test robot <lkp@intel.com>
To: "Pratyush Yadav (Google)" <pratyush@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: mm/mm_init.c:2691:2: error: call to undeclared function
 'kho_extend_scratch'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202604300954.lysOjEtq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-generalize-radix-tree-APIs/20260430-095605
head:   a586b345757dd389b6a3981b387cc4b39c538fab
commit: a29db33861c799b78a6469b22301aace345ad455 kho: extended scratch
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260430/202604300954.lysOjEtq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300954.lysOjEtq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300954.lysOjEtq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mm_init.c:2691:2: error: call to undeclared function 'kho_extend_scratch'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2691 |         kho_extend_scratch();
         |         ^
   1 error generated.


vim +/kho_extend_scratch +2691 mm/mm_init.c

  2688	
  2689	void __init mm_core_init_early(void)
  2690	{
> 2691		kho_extend_scratch();
  2692		hugetlb_cma_reserve();
  2693		hugetlb_bootmem_alloc();
  2694	
  2695		free_area_init();
  2696	}
  2697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
