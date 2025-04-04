Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F29715C15F;
	Fri,  4 Apr 2025 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753963; cv=none; b=ZlTpSpawDP7B2QX3rN3W+SzaZOsTjKpnZZfuM/Yel0AQePuE8rYP1Kofmm51HpIxaKgbwRS6aZbWYIPl69CawHGf5REc3aWoINukU05TZ4tlZIcIuvdpEs6VZX2rzrBnbJAmXUf4Qh2QLmo0N7cK49dSpopGnBwPNc71l7tvdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753963; c=relaxed/simple;
	bh=Tfa/yybm5CsqfeEOMUp9kIWHth41E2TgjvduwZq36R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyxblP4DKbllHAPT02MERZl2DK8dQ9RMcsN+eD+FHVNZFBA85u9mQ1M5gbWihf4YXcjWp+iab98lV7lEg4Sf3F1F9nQAlGcfrte923k1uP/rsdZy3wTvp1eFEd3m7E7DG8eTI5bLLsojv827g1A/RHFCqbaLV+w2RKljyX6HFCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWS6TFpR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWS6TFpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743753961; x=1775289961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tfa/yybm5CsqfeEOMUp9kIWHth41E2TgjvduwZq36R8=;
  b=mWS6TFpRaGLPOolEjQxKjw6eJ46un4975dwwDaD/H+E5nxWxTMpUuQ+C
   zQShQLNgalRrt6Gvr7rq0/fFBZVk0WzAr5HnqDyywyyRXgzOgOGTzd/HE
   JYIsNebn8IKMdFKsdLIKvOeKRtR5wvI2kQFlk+k0VWOQN1m9Gi1GqEQ8e
   DOpyP0rr2aQmCIm863E7u26KL+Jqg64WdaIqPTjEfMntrJPrSM4Oyi+0p
   /aTMozW1zjk+Yds8MNo0z8i76nsTSxMGJa+vqZoYvt70Jq+qU1r4N64tG
   sjS1d1UFpQm4b5/AzoYLKmJ8RjCVrRhBpB+an9dS3/2/OWu+Ze0Y26+Sb
   Q==;
X-CSE-ConnectionGUID: C8PRV6PvTgCNJ0JE/n/E4w==
X-CSE-MsgGUID: 3w/tuehBQwaaP+dIyNCVIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45071901"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="45071901"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:06:00 -0700
X-CSE-ConnectionGUID: UsxmuIBoSTG5iI2LOfkssQ==
X-CSE-MsgGUID: 1IMoFxbxTOCJW4BpgdX77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158233880"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 01:05:59 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0c3o-00014x-2k;
	Fri, 04 Apr 2025 08:05:56 +0000
Date: Fri, 4 Apr 2025 16:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2]  mm/swap.c: Enable promotion of unmapped MGLRU
 page cache pages
Message-ID: <202504041529.Z00E8TJC-lkp@intel.com>
References: <20250403141032.22743-1-donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403141032.22743-1-donettom@linux.ibm.com>

Hi Donet,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.14 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/mm-swap-c-Enable-promotion-of-unmapped-MGLRU-page-cache-pages/20250403-221222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250403141032.22743-1-donettom%40linux.ibm.com
patch subject: [RFC PATCH v2]  mm/swap.c: Enable promotion of unmapped MGLRU page cache pages
config: hexagon-randconfig-002-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041529.Z00E8TJC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041529.Z00E8TJC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041529.Z00E8TJC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/swap.c:401:8: error: use of undeclared identifier 'sysctl_numa_balancing_mode'
     401 |                                   (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
         |                                    ^
>> mm/swap.c:401:37: error: use of undeclared identifier 'NUMA_BALANCING_MEMORY_TIERING'
     401 |                                   (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
         |                                                                 ^
>> mm/swap.c:402:8: error: use of undeclared identifier 'numa_pagecache_promotion_enabled'
     402 |                                    numa_pagecache_promotion_enabled) {
         |                                    ^
>> mm/swap.c:403:5: error: call to undeclared function 'promotion_candidate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     403 |                                 promotion_candidate(folio);
         |                                 ^
   4 errors generated.


vim +/sysctl_numa_balancing_mode +401 mm/swap.c

   382	
   383	static void lru_gen_inc_refs(struct folio *folio)
   384	{
   385		unsigned long new_flags, old_flags = READ_ONCE(folio->flags);
   386	
   387		if (folio_test_unevictable(folio))
   388			return;
   389	
   390		/* see the comment on LRU_REFS_FLAGS */
   391		if (!folio_test_referenced(folio)) {
   392			set_mask_bits(&folio->flags, LRU_REFS_MASK, BIT(PG_referenced));
   393			return;
   394		}
   395	
   396		do {
   397			if ((old_flags & LRU_REFS_MASK) == LRU_REFS_MASK) {
   398				if (!folio_test_workingset(folio)) {
   399					folio_set_workingset(folio);
   400				} else if (!folio_test_isolated(folio) &&
 > 401					  (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
 > 402					   numa_pagecache_promotion_enabled) {
 > 403					promotion_candidate(folio);
   404				}
   405				return;
   406			}
   407	
   408			new_flags = old_flags + BIT(LRU_REFS_PGOFF);
   409		} while (!try_cmpxchg(&folio->flags, &old_flags, new_flags));
   410	}
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
