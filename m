Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C8B3B2A0;
	Fri,  9 May 2025 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796880; cv=none; b=PvHgRxN+DRftlhKSC8M9zG0Llinnn1RhSDMjtQjLvaEnNddKCwgGFxWJ8STTYvCpgZrxOcF+afd7ISNBPdovvEDZn61aSClGYRXkV2q79+/9S30cIULzuSa4B1dnUKysBMVOlU8wTFxw8h7oC/5kVFSwRaEB7L7HpxS9TwCrvVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796880; c=relaxed/simple;
	bh=ySoUqgUBXXcdexz9NmsUsooZJR/o8E4vDlWHSW7lY14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y+ExcjeBYCiJ0a0E+nQrWfIwRi9/IX7HdMm9ENHeT69g957olePsVckJY5Eb7TOuUqm3wbs5e5+2miUNG+vk2AtnW+U18GYldRaJWSpFFxDDNr+He0ULuKT8sKzG/NrmaqfHQx0pZjwdii8nFY+VpJE1My8wDfeLKeyqNM4Zu2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9nEesH/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9nEesH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746796879; x=1778332879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ySoUqgUBXXcdexz9NmsUsooZJR/o8E4vDlWHSW7lY14=;
  b=D9nEesH/hMhTs1UM+rnR58k0ajb68BOMo4e3u6f6MBn8tljuJm/leeyQ
   qeSM5moi1zT/vvOv/TV1IVnLkIsRlC0R52G7i4WWxi+LIPvQkRJsUAq9S
   AfcgdhZP3/uu++HiKnajq1JI0PjykZf+/fmKpZmufVQ9cxFnqZJFnrbZY
   +mIdFxtIMDm7zVc4NPRs8d+E5A36v9PCWheFPtgbDq8rc0mLHj1kvKNM2
   cSaAEYDq45cNUQsx/kQgM94Or1wWPw5eoMHdrRk8LYBqnFvhGsU//jq7Q
   ytN0+3O6OUUayF2kjsJBEBRljdGjw5YjPz8V9kvWRnrVwnjxRSnnMvwQB
   A==;
X-CSE-ConnectionGUID: BOjbCC3oRvSmQR7uSA1JKg==
X-CSE-MsgGUID: EBGjMiPvQx+Fu6qoRIYiRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59967586"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="59967586"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 06:21:17 -0700
X-CSE-ConnectionGUID: m53ss1peTJyLY8Z+rRBiSA==
X-CSE-MsgGUID: HK/OJG+LT72v6h1pkZfBmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137546146"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 May 2025 06:21:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDNf7-000C6l-0j;
	Fri, 09 May 2025 13:21:13 +0000
Date: Fri, 9 May 2025 21:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 337/348] mm/page_isolation.c:18:20: warning:
 function 'get_pageblock_isolate' is not needed and will not be emitted
Message-ID: <202505092126.yRGhLhg1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   9fe9c5a30f2f2d799c0e2df192df6622969b23b7
commit: ca2f45163b701e1632c452022b2aadeb52841ec6 [337/348] mm/page_isolation: remove migratetype parameter from more functions
config: i386-buildonly-randconfig-004-20250509 (https://download.01.org/0day-ci/archive/20250509/202505092126.yRGhLhg1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505092126.yRGhLhg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505092126.yRGhLhg1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_isolation.c:18:20: warning: function 'get_pageblock_isolate' is not needed and will not be emitted [-Wunneeded-internal-declaration]
      18 | static inline bool get_pageblock_isolate(struct page *page)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   mm/page_isolation.c:28:20: warning: unused function 'set_pageblock_isolate' [-Wunused-function]
      28 | static inline void set_pageblock_isolate(struct page *page)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/get_pageblock_isolate +18 mm/page_isolation.c

0f0848e5118a4c Joonsoo Kim 2016-01-14  17  
075a73e5db9ad9 Zi Yan      2025-05-08 @18  static inline bool get_pageblock_isolate(struct page *page)
075a73e5db9ad9 Zi Yan      2025-05-08  19  {
075a73e5db9ad9 Zi Yan      2025-05-08  20  	return get_pfnblock_flags_mask(page, page_to_pfn(page),
075a73e5db9ad9 Zi Yan      2025-05-08  21  			PB_migrate_isolate_bit);
075a73e5db9ad9 Zi Yan      2025-05-08  22  }
075a73e5db9ad9 Zi Yan      2025-05-08  23  static inline void clear_pageblock_isolate(struct page *page)
075a73e5db9ad9 Zi Yan      2025-05-08  24  {
075a73e5db9ad9 Zi Yan      2025-05-08  25  	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
075a73e5db9ad9 Zi Yan      2025-05-08  26  			PB_migrate_isolate_bit);
075a73e5db9ad9 Zi Yan      2025-05-08  27  }
075a73e5db9ad9 Zi Yan      2025-05-08  28  static inline void set_pageblock_isolate(struct page *page)
075a73e5db9ad9 Zi Yan      2025-05-08  29  {
075a73e5db9ad9 Zi Yan      2025-05-08  30  	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
075a73e5db9ad9 Zi Yan      2025-05-08  31  			page_to_pfn(page),
075a73e5db9ad9 Zi Yan      2025-05-08  32  			PB_migrate_isolate_bit);
075a73e5db9ad9 Zi Yan      2025-05-08  33  }
075a73e5db9ad9 Zi Yan      2025-05-08  34  

:::::: The code at line 18 was first introduced by commit
:::::: 075a73e5db9ad940e38c8bca786b7d9ab0d36a37 mm-page_isolation-make-page-isolation-a-standalone-bit-fix

:::::: TO: Zi Yan <ziy@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
