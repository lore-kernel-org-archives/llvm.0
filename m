Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B0528F4;
	Thu,  7 Nov 2024 01:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730941310; cv=none; b=KT5y4NJem1PSqHiRVRoCd4cc3wyKF9fiRJXaMXz+/Lr+P1qKEcGTzzF5m1q4v7oJlnnoO+AIyucEyP1r7bAhvIxHHCy5yE0EwGzfB7GheYxrcnpaLbDtE/417ROKihzxEPES0OxaEaE6r2QZquJQzFqOSgqAt7uSOEboLAFYuWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730941310; c=relaxed/simple;
	bh=blCQL2vIPmAnC+tdCWBp5Zt3BTIEOE11enihy2eDjjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsQxL2vhjkVYnVsElAuKTDGLHwFdjdx652HpOKoDzBNnOKKSMRVboX1WOPYnRv0T2VHvdWQCwBmI6uec5KgucHlyrpCuGmxOKZJbCEUFiuIMDz3Lpt7vAp1J53lD0VNRuck01yu04zdqj9JWo0hKThZ2zgm2j+d/ty1MDN7YXRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0wN2hnz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0wN2hnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730941308; x=1762477308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blCQL2vIPmAnC+tdCWBp5Zt3BTIEOE11enihy2eDjjU=;
  b=b0wN2hnzxCUMDCcy1VVwLoM1GSc0yuwE1/bMmQMQZRySb2G/g2u0W5NR
   KPCHhxgevN23rXsZcwhcfFwwDhWBpp1mW/1Qy8Kk+yFiaP7VPKyp0bgBX
   VAf308VFCxse6NQDDD1o0uQA+kacsbuu2rNxVQM549uLTrVm1Pwoky4hP
   ZmjGGEzCNqhv7n/jU1tMsjY6mKTZ7rsJrB7pLsI5wKgN3FqNzoDRn4nfn
   tSg1x/haUW3e+xbRQb1vpDxr5RKpNiZETa/V1Ky+OIOztmABng4zLUc+v
   6MDrio7x+WhbOYtE1pRkrlzrxPEpMop7qodOkZPuBPOkbFX4cb2lBX6gj
   w==;
X-CSE-ConnectionGUID: +/bzqsfgRW61kyN0cfYhzQ==
X-CSE-MsgGUID: 35rNheUcTZaX8z/10RuWJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34462969"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34462969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 17:01:45 -0800
X-CSE-ConnectionGUID: fIAGDzFPSP2VmPuB9PHgNg==
X-CSE-MsgGUID: 04Y6j90UTzWvHytbiTpjqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="89637172"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2024 17:01:45 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8qu6-000pb0-0v;
	Thu, 07 Nov 2024 01:01:42 +0000
Date: Thu, 7 Nov 2024 09:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/slub-percpu-sheaves 5/9] kernel/fork.c:532:2: error:
 #endif without #if
Message-ID: <202411070802.Wbvv86Ld-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slub-percpu-sheaves
head:   c9a0c0d9abbb215ecaca59e751140fc4f46652af
commit: 7d84a5e7aa7522ecd72d1aaff0b9ce6421d7c99a [5/9] mm, vma: use sheaves for vm_area_struct cache
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241107/202411070802.Wbvv86Ld-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070802.Wbvv86Ld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070802.Wbvv86Ld-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:35:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from kernel/fork.c:47:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> kernel/fork.c:532:2: error: #endif without #if
     532 | #endif
         |  ^
   3 warnings and 1 error generated.


vim +532 kernel/fork.c

7d84a5e7aa7522 Vlastimil Babka   2024-07-10  527  
7d84a5e7aa7522 Vlastimil Babka   2024-07-10  528  	vma_numab_state_free(vma);
7d84a5e7aa7522 Vlastimil Babka   2024-07-10  529  	free_anon_vma_name(vma);
7d84a5e7aa7522 Vlastimil Babka   2024-07-10  530  	vma_lock_free(vma);
20cce633f4254c Michel Lespinasse 2023-02-27  531  }
20cce633f4254c Michel Lespinasse 2023-02-27 @532  #endif
20cce633f4254c Michel Lespinasse 2023-02-27  533  

:::::: The code at line 532 was first introduced by commit
:::::: 20cce633f4254cc0df39665449726e3172518f6c mm: rcu safe VMA freeing

:::::: TO: Michel Lespinasse <michel@lespinasse.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
