Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A2A32182;
	Sun, 17 Dec 2023 11:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OF9HY4m+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702813209; x=1734349209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vzDCRbNoqN1FEp8T3R5Yyan7I/by2xBPZ70SBbHswc0=;
  b=OF9HY4m+zA0R4TR87QXikhxrhdONnUOazQKS0V4YQziOJltou69uUfjv
   9wwvwYn1oSNNgombYcCxEZIWthTMzBNC5QcvJlrM8hi+n4juk5tQsEj7v
   acPGShkLUmysQPPTPoHQIJZDx8Be3/NeIj21zYrCN3TjKFJZpiHPli613
   gHub2qj5CbWU8HRoSHRo+XLFpK8yM2jX1IETNLvEINGju+G7p7lu0W9Bm
   CEcolDkykYgLtCzVoNzB2Pv7z2Q2w2SP+QAIAx8Xk/XEciexWnF+0V2sB
   Okjha3Z76QNH7q9R5CkKg/oOUnrwi9y9u15yqCTThanBAGddMg52iARzZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="461868699"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="461868699"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 03:40:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="898657466"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="898657466"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Dec 2023 03:40:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEpV6-0002z8-35;
	Sun, 17 Dec 2023 11:40:04 +0000
Date: Sun, 17 Dec 2023 19:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 34/50] include/linux/mm_types_task.h:38:30:
 warning: 'PAGE_SIZE' is not defined, evaluates to 0
Message-ID: <202312171907.fn57dyqK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 6a6f9cc57f908d2dfe7f0b26cd618fec2a8d9efc [34/50] mm_types_task.h: Trim dependencies
config: i386-buildonly-randconfig-002-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171907.fn57dyqK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171907.fn57dyqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171907.fn57dyqK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/android/binder_alloc_selftest.c:11:
   In file included from include/linux/mm_types.h:5:
>> include/linux/mm_types_task.h:38:30: warning: 'PAGE_SIZE' is not defined, evaluates to 0 [-Wundef]
   #if (BITS_PER_LONG > 32) || (PAGE_SIZE >= 65536)
                                ^
   1 warning generated.


vim +/PAGE_SIZE +38 include/linux/mm_types_task.h

6a6f9cc57f908d Kent Overstreet 2023-12-11  35  
9e7d2e44dd88ba Ingo Molnar     2017-02-04  36  struct page_frag {
9e7d2e44dd88ba Ingo Molnar     2017-02-04  37  	struct page *page;
9e7d2e44dd88ba Ingo Molnar     2017-02-04 @38  #if (BITS_PER_LONG > 32) || (PAGE_SIZE >= 65536)
9e7d2e44dd88ba Ingo Molnar     2017-02-04  39  	__u32 offset;
9e7d2e44dd88ba Ingo Molnar     2017-02-04  40  	__u32 size;
9e7d2e44dd88ba Ingo Molnar     2017-02-04  41  #else
9e7d2e44dd88ba Ingo Molnar     2017-02-04  42  	__u16 offset;
9e7d2e44dd88ba Ingo Molnar     2017-02-04  43  	__u16 size;
9e7d2e44dd88ba Ingo Molnar     2017-02-04  44  #endif
9e7d2e44dd88ba Ingo Molnar     2017-02-04  45  };
9e7d2e44dd88ba Ingo Molnar     2017-02-04  46  

:::::: The code at line 38 was first introduced by commit
:::::: 9e7d2e44dd88ba7e29c165b6fca428e384afa5a8 mm/headers, sched/headers: Move task related MM types from <linux/mm_types.> to <linux/mm_types_task.h>

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
