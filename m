Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7807158524;
	Mon,  9 Dec 2024 04:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718194; cv=none; b=eoeNspApfPMTUTSteI+LOvvqfkeizLAVR5LXi6AGW0oFPlCkD0y+dlBLDTjSvrzGcOl5ioXZ8YKTE2z2OS/+12fsEzGww7P2abzRZ0nuAqIXoHTNAPxKD9xhQbC3L2/N4Oi+MUQOUMI45YRTx2E5OqHbYoGb2SbooH5O0JdrAlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718194; c=relaxed/simple;
	bh=aSSPpFW0o1THRgKVaiP8Acb2Gjor5AQGTxKJ48Tm/Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hu7EUOxQikCwSO2gYI3yI4BqPv6kwIz8e/s8ht6JlLGKplRBCRiV1SjPWGxmF1jvcNxWh2Uz04J7EkemKab95W5HudHoSp9Rb+smsbW2Tjjwja6XsNZ7cJSHTiPL4NxaAvvizVb2xZ9x6mYBDCFb0TkaHi2/qyHjf7GuTlj2WuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nabJU8X+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nabJU8X+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718193; x=1765254193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aSSPpFW0o1THRgKVaiP8Acb2Gjor5AQGTxKJ48Tm/Jc=;
  b=nabJU8X+WbrhPuFaz50HZsPuaz1GQl3DWoH90wzvjFXy8RfY1uMxuNEa
   y3KMFWgaMPpgH9dv1GEUZIpVWbT3KEaOOGxnQZAtL3BGQGNI6Ju/WGGmQ
   /8PbIhHjcjTFaPr8+XrNbSgRq/KUR2AgBXjqJUdVFVNNeiDMs4KUSjv3y
   i/LcaqmNQq35d8rEimpqBW91n49b+mFWb00yinQSXVKYcStU8wVuKJvYB
   JX0A8DkXc0ouUeu6om88GGR3H5Ty8ZXjkxeIwPsCTYgdmg8Rg8Q0DH3RL
   7CA2rvnEfrwALUFuAOeMcOdqeZKXJAvdqiNC3xELVgubCwA7D03/aCtp3
   w==;
X-CSE-ConnectionGUID: ksFIYjCLSE6bBAsNKBi9zw==
X-CSE-MsgGUID: B7/GP0fMQiKIAV4MvMyTlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51414887"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51414887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:23:12 -0800
X-CSE-ConnectionGUID: gVKXB/QITd2oEM0VsJB8Yg==
X-CSE-MsgGUID: AEYV9327Tx60+luvljJmPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95400958"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Dec 2024 20:23:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVIZ-0003qH-0n;
	Mon, 09 Dec 2024 04:23:07 +0000
Date: Mon, 9 Dec 2024 12:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Junjie Fu <fujunjie1@qq.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 170/172] mm/z3fold.c:353:3: error: call to
 undeclared function 'lock_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202412072238.EJIJEJfz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6e165f54437931f329d09dca6c19d99af08a36e1
commit: 98a9217fdcb8c8a64670a57180fdfc2f468e4ff0 [170/172] mempolicy.h: remove unnecessary header file inclusions
config: x86_64-buildonly-randconfig-005-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072238.EJIJEJfz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072238.EJIJEJfz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072238.EJIJEJfz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/z3fold.c:30:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> mm/z3fold.c:353:3: error: call to undeclared function 'lock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     353 |                 lock_page(page);
         |                 ^
   mm/z3fold.c:353:3: note: did you mean 'copy_page'?
   arch/x86/include/asm/page_64.h:62:6: note: 'copy_page' declared here
      62 | void copy_page(void *to, void *from);
         |      ^
>> mm/z3fold.c:355:3: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     355 |                 unlock_page(page);
         |                 ^
   mm/z3fold.c:1052:3: error: call to undeclared function 'lock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1052 |                 lock_page(page);
         |                 ^
   mm/z3fold.c:1054:3: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1054 |                 unlock_page(page);
         |                 ^
>> mm/z3fold.c:1056:12: error: call to undeclared function 'trylock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1056 |                 WARN_ON(!trylock_page(page));
         |                          ^
   mm/z3fold.c:1056:12: note: did you mean 'try_get_page'?
   include/linux/mm.h:1527:33: note: 'try_get_page' declared here
    1527 | static inline __must_check bool try_get_page(struct page *page)
         |                                 ^
   mm/z3fold.c:1058:3: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1058 |                 unlock_page(page);
         |                 ^
   4 warnings and 6 errors generated.


vim +/lock_page +353 mm/z3fold.c

9a001fc19cccde Vitaly Wool 2016-05-20  348  
9a001fc19cccde Vitaly Wool 2016-05-20  349  /* Resets the struct page fields and frees the page */
1f862989b04ade Vitaly Wool 2019-05-13  350  static void free_z3fold_page(struct page *page, bool headless)
9a001fc19cccde Vitaly Wool 2016-05-20  351  {
1f862989b04ade Vitaly Wool 2019-05-13  352  	if (!headless) {
1f862989b04ade Vitaly Wool 2019-05-13 @353  		lock_page(page);
1f862989b04ade Vitaly Wool 2019-05-13  354  		__ClearPageMovable(page);
1f862989b04ade Vitaly Wool 2019-05-13 @355  		unlock_page(page);
1f862989b04ade Vitaly Wool 2019-05-13  356  	}
5a27aa8220290b Vitaly Wool 2017-02-24  357  	__free_page(page);
5a27aa8220290b Vitaly Wool 2017-02-24  358  }
5a27aa8220290b Vitaly Wool 2017-02-24  359  

:::::: The code at line 353 was first introduced by commit
:::::: 1f862989b04ade61d3aab49184c50e9957f84c7d mm/z3fold.c: support page migration

:::::: TO: Vitaly Wool <vitalywool@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
