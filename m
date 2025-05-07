Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D76221287;
	Wed,  7 May 2025 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606227; cv=none; b=dpglYwIyLyRhvnbCxihItD40oaCv6rBG9yf3Mv5XmiLCQY+64CNRIdGMxbMX+CxqVkD6jiXTj8NEE6bpo8USCcGuhrC18XZmg2UBgjZfsjqMH6LRkaxT8UWc8NvQlMyarFo9BaSvQNygRBQ1mqKTACBLeglyITjhyXg8NcDjd5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606227; c=relaxed/simple;
	bh=5N/j1g/WrvsTi5lCKWikAsJa8tQ4KT4POxyAZRbWVv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OnueuQ0bs36+OLbAwWAka+4uKekhOzuUEaffOq7Amhi0EbnxBd5V1FGuFwRjyyuacZzjyTyOvfSjkfIzfRpJgyJXnhhadMNjOpiw4G1/exXAme29CRmBzhp/BszhhPn5y4TMaPam0ST7mw1soZcLio8mcdOfgQmvuTJroEndsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vl8V1bYb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vl8V1bYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746606225; x=1778142225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5N/j1g/WrvsTi5lCKWikAsJa8tQ4KT4POxyAZRbWVv8=;
  b=Vl8V1bYbo6FZG5t1du5C3F4GlDeyXGJY7OSqZWo6NGOAG3QUZkFFMOFa
   xAGu+qU1TqWYfuGJk4HD/70oPX2j0OtTA2SPULL7ruQSfqHajvquTa0Qn
   WK+CVN1FPPQVgJJFSIYXRoVPmfn4tPXITu7EJkXzQJ25VXDlGh0uwiKMs
   r1PsL6DcMKRIcA/nb9NnHcZfKsUqsO1+F01Oi8quoZDlOO25oWdp8e8xk
   iSaEefckSVov1f4FZtDoZQrV6Tepwc6yhl/4GBbrtRdQ1jJpG83jpMvJq
   iLTFQmIfdejjysiJciCAjDVfTMYxGwn285wpl4tD87SwegvNPnUjXHOVu
   g==;
X-CSE-ConnectionGUID: 77O+ucAYSN2LFrLiNQ4Xhg==
X-CSE-MsgGUID: GpnxUVeTQkevg9X/5XyoTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48332598"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48332598"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 01:23:45 -0700
X-CSE-ConnectionGUID: xNlGq6qEQ/muVmKRlbzNyA==
X-CSE-MsgGUID: VKJ+ZY1kTHe0fD5FlgB3Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136407995"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2025 01:23:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCa45-0007PF-0z;
	Wed, 07 May 2025 08:23:41 +0000
Date: Wed, 7 May 2025 16:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 6/18] include/linux/page-flags-layout.h:58:35:
 error: function-like macro 'pgtable_l5_enabled' is not defined
Message-ID: <202505071609.CMJaUaWq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   f309d115ff0674e0ce4fe010e587d40bfb5b6e4e
commit: 497440fc4206a8003c215a891e14c90159270f41 [6/18] x86/boot: Drop global variables keeping track of LA57 state
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250507/202505071609.CMJaUaWq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071609.CMJaUaWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071609.CMJaUaWq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
>> include/linux/page-flags-layout.h:58:35: warning: 'pgtable_l5_enabled' is not defined, evaluates to 0 [-Wundef]
      58 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_SHIFT \
         |                                   ^
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
>> include/linux/page-flags-layout.h:58:35: error: function-like macro 'pgtable_l5_enabled' is not defined
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
   include/linux/page-flags-layout.h:93:35: warning: 'pgtable_l5_enabled' is not defined, evaluates to 0 [-Wundef]
      93 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
         |                                   ^
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
   include/linux/page-flags-layout.h:93:35: error: function-like macro 'pgtable_l5_enabled' is not defined
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
   include/linux/page-flags-layout.h:104:35: warning: 'pgtable_l5_enabled' is not defined, evaluates to 0 [-Wundef]
     104 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
         |                                   ^
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:19:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:20:
   include/linux/page-flags-layout.h:104:35: error: function-like macro 'pgtable_l5_enabled' is not defined
   include/linux/page-flags-layout.h:53:25: note: expanded from macro 'SECTIONS_WIDTH'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^
   include/linux/page-flags-layout.h:31:25: note: expanded from macro 'SECTIONS_SHIFT'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~


vim +/pgtable_l5_enabled +58 include/linux/page-flags-layout.h

bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  57  
ec1c86b25f4bdd Yu Zhao        2022-09-18 @58  #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_SHIFT \
ec1c86b25f4bdd Yu Zhao        2022-09-18  59  	<= BITS_PER_LONG - NR_PAGEFLAGS
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  60  #define NODES_WIDTH		NODES_SHIFT
1587db62d8c0db Yu Zhao        2021-04-29  61  #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  62  #error "Vmemmap: No space for nodes field in page flags"
1587db62d8c0db Yu Zhao        2021-04-29  63  #else
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  64  #define NODES_WIDTH		0
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  65  #endif
bbeae5b05ef6e4 Peter Zijlstra 2013-02-22  66  

:::::: The code at line 58 was first introduced by commit
:::::: ec1c86b25f4bdd9dce6436c0539d2a6ae676e1c4 mm: multi-gen LRU: groundwork

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
