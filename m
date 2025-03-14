Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C320012A;
	Fri, 14 Mar 2025 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961996; cv=none; b=jTpPsOndsDUlgi1ZBcXLykmzaW0l1z2rRTrGSyBNPKCuMvAVJIg/uF55hC9T1RLnFBqPT+b0xwMnDAi4e9t21uAfBFp7wYJpcEljDmNSkrhlbcUSHMn7jkIsvQZW/FKT45nWzi/g4R/knqphfdZk8JqYoVmbbFHdvnKlicYQRpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961996; c=relaxed/simple;
	bh=SV40QSPJiQlccxHG18llzLEn2lrSwbOd5YHTjaimy0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdl+EJ5rK/GlW+0F5XShaB86wfjMyWnbSFqaRkD2yVpzyl87gsp/FGtgT9hr9i8mBqwhvG+9w0lQd9NrZK35gqio5T7586QZIM/VaLuSAzVUW1bo3LMbwLl0L/fleY1ubHqoJg5g9dRU3pEOJXsy2Xl6rRv4XvjefaXkYFKkPMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ScPKrwQ1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ScPKrwQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741961995; x=1773497995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SV40QSPJiQlccxHG18llzLEn2lrSwbOd5YHTjaimy0c=;
  b=ScPKrwQ1J2rXhQket+5GfPw5/Bq7YkWKsz8xht8hMrASx4jlz1TJ1ktq
   ZTP9T67xcN+urVU7kjPv3E4M1OtOWrLbaY4ZGus3+QbEKusrzr3gNY10C
   gMii4PURnXGMSyQZNPZYHrdOtRDH+BH3B7HQe7VyQ+QGwZDJ/8VFYmyQH
   4MiuhzGQj/p0/fSwPe6vy7b6D6IJSA17wSgsZWLllMYPKaioCbsQvUaBZ
   fxAZR/WMPcBWvzgr3PalpD1bddmFciBD406DxNAepzJYSaW8yX8p8kEVH
   T5TPqa/4IgHikOJEyXHyJfi3j4apjoiuGwtynl9p2Tj3e2QLB5oSrTaek
   Q==;
X-CSE-ConnectionGUID: WH/R/Ci6QuWPqrR8YM21Gw==
X-CSE-MsgGUID: XpEiwpSfSPK20Ocknm70CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="53321771"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="53321771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 07:19:52 -0700
X-CSE-ConnectionGUID: LFdvir1aRTenOmcZTLB6xw==
X-CSE-MsgGUID: 2lVKRUZ1RS6W9yBY0kUg8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="122238839"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Mar 2025 07:19:51 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt5t6-000AXc-15;
	Fri, 14 Mar 2025 14:19:48 +0000
Date: Fri, 14 Mar 2025 22:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:locking-bench 2/2] lib/locking-benchmark.c:6:10: fatal
 error: 'asm/tsc.h' file not found
Message-ID: <202503142224.24EyebC4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git locking-bench
head:   df4891c13ee02fedadd66a990dd65c911f6b7ada
commit: df4891c13ee02fedadd66a990dd65c911f6b7ada [2/2] lib/test: add locking-benchmark module
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250314/202503142224.24EyebC4-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142224.24EyebC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142224.24EyebC4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/locking-benchmark.c:2:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> lib/locking-benchmark.c:6:10: fatal error: 'asm/tsc.h' file not found
       6 | #include <asm/tsc.h>
         |          ^~~~~~~~~~~
   3 warnings and 1 error generated.


vim +6 lib/locking-benchmark.c

   > 6	#include <asm/tsc.h>
     7	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
