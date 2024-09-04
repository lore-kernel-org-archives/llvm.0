Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987671D79B9;
	Wed,  4 Sep 2024 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452600; cv=none; b=IGw2sWeqJHe4Ak4rwf0VDK9OTNddASUwjO2AnF07w9pdBpJ+r+REgugZelBaASjWJakuRSy+9+Z8SUAaw5htBDQ7T4r2GimUpmjTQ8or/azhgRtOGiUoUO3mFgrwT7vjRPvFyGXcY8G1DQQtgWepiOqnelA9+Qrfm839mFmKUBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452600; c=relaxed/simple;
	bh=M0ozf0vKJvzW1V6zA+R28xNbf6MevKQfKnn5b3I10PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qooB4+7h1az7GPuzaaUSn/dT/yfeS1Ei93B10pwjU/KJ9RHM45fU8IWwZ47MQnZyW3WbvJ93i6vsA5la2bT3S8GZESRsesqfHOvqyBkVNnb1LmgZ7aeRpWsgWqNI4SL3acnxY19sfc+Z1DwvcwOqoa9ihEbcpiao1bPnLpLRwkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtxYHtCl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtxYHtCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725452599; x=1756988599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M0ozf0vKJvzW1V6zA+R28xNbf6MevKQfKnn5b3I10PQ=;
  b=QtxYHtClIkIsgACi6ZxXTqLQ3fpVQUaUUgiZjb6DdbFJ/6fEjWcgm12b
   6veA2rtVmqPiECS9s82h3ks+K1H2eNexceL+n8eqRQ2bSLTLIMFz08CGO
   t21CWlvrt7vrNoEuvmDEdxUi/X0PQ/WMZ8/Jsjj92guwZUMf+JJd9l/9H
   /5g/WTwyBQ0H8V66XxNZE9l2pLbUZ107JSJKaPIwIrtZic0QxcA4G8+eN
   0g1b0e6Vob5X7fqrMOXLISAzCi5xpJ+XJfMNaR9dI/5Lqij/QKAgeDE4i
   teadnMBgk8tTMqNt/X2lxn+sQ3AqU3mBzqYfEL2nnFwA91PPnsYH+iqCI
   Q==;
X-CSE-ConnectionGUID: z2ZQFeFLQWq2Bap27iL6Uw==
X-CSE-MsgGUID: CGbQhKNBTKezKRfFKVJkzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27871261"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="27871261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 05:23:16 -0700
X-CSE-ConnectionGUID: SVpZyUpsRjSdVF0JCxSe3A==
X-CSE-MsgGUID: xPXxVzE4TIuTNYjB/7L3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65493951"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Sep 2024 05:23:15 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slp2W-00082B-2r;
	Wed, 04 Sep 2024 12:23:12 +0000
Date: Wed, 4 Sep 2024 20:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v2 3/8]
 arch/powerpc/mm/nohash/tlb_64e.c:27:10: fatal error: 'asm/code-patching.h'
 file not found
Message-ID: <202409042059.ifQeFXpV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v2
head:   8fdab5dd4adef6cc89ea5a5e1c585379cfb8a69c
commit: 1cdd83654dac8e8085ba0a5822a54027fb9fa6de [3/8] asm-generic: introduce text-patching.h
config: powerpc64-randconfig-003-20240904 (https://download.01.org/0day-ci/archive/20240904/202409042059.ifQeFXpV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409042059.ifQeFXpV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409042059.ifQeFXpV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/nohash/tlb_64e.c:19:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/mm/nohash/tlb_64e.c:27:10: fatal error: 'asm/code-patching.h' file not found
      27 | #include <asm/code-patching.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +27 arch/powerpc/mm/nohash/tlb_64e.c

a898530eea3d0b Michael Ellerman 2024-07-02  23  
a898530eea3d0b Michael Ellerman 2024-07-02  24  #include <asm/pgalloc.h>
a898530eea3d0b Michael Ellerman 2024-07-02  25  #include <asm/tlbflush.h>
a898530eea3d0b Michael Ellerman 2024-07-02  26  #include <asm/tlb.h>
a898530eea3d0b Michael Ellerman 2024-07-02 @27  #include <asm/code-patching.h>
a898530eea3d0b Michael Ellerman 2024-07-02  28  #include <asm/cputhreads.h>
a898530eea3d0b Michael Ellerman 2024-07-02  29  

:::::: The code at line 27 was first introduced by commit
:::::: a898530eea3d0ba08c17a60865995a3bb468d1bc powerpc/64e: split out nohash Book3E 64-bit code

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
