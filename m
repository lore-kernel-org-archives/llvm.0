Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5503C2BDC28;
	Mon,  2 Feb 2026 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770018634; cv=none; b=T2VIIJ38wqTY/39gUBx5Bsoa5KgXiKV4/vpoNivXbeNJxdZSuTDoLTpDCYSSEKJXD0UvbLMuCcx/A+z9kIqhN4HHuxIGTrjMDlrgjQ0aGai0AQ4eGefmA7dl57PfzVGBo7L6FVRQXdcYb65606KekR27WUpkWBmw1gasMHGil9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770018634; c=relaxed/simple;
	bh=Z3n5Gi2A/iPVsiadPEXNchZAOyOtOUsI0gy0kljvGl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6gjYb81HYQKZjabeHJeoyKSGLq7JhzoATKsZapNp/Bu/29PgvDzdL+jAyUYfpfj2isWJ8I9aa39pql1VNJp80LHHcY9h02QFp1CPQsKesoJyWkM5eRz2UNFUy2BkSMKnld8/yfvPlXeojLTTn8bhL/6UyDcgxNmJh23HIr2AMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0p2uwg1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0p2uwg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770018631; x=1801554631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z3n5Gi2A/iPVsiadPEXNchZAOyOtOUsI0gy0kljvGl8=;
  b=A0p2uwg1bmTNHoH7RxExN9DPAV/ZdjEFvMfFUoi2vJhdWYW9QuPEFEOs
   kCwI51JVyrRxJn/X3KyMX+5w8+YlMwqPhwz9T7Z+f66Ch3tQeS1HCDvly
   kORKIZolUxn3OnJiZdgOAX0DBz57S8eQe7ErMTOXNiJz7gPPP8qcphq8y
   0cw/gvqk1cqPbUzScgL/WKj3qt+LNMKlLW3QFvWtv54W31/+X6uDy8ztS
   +fR1iFpfjw7pDA2TeN7Ew3UUb82fCtalrXRJC8n/zBT4+DznqiIDREM1a
   qGLpnFXaQeujXo/e3nLfrFqcP4uqIZFvOMKynu8F0L+ll9t0gBggkj/yi
   Q==;
X-CSE-ConnectionGUID: Bmas/j05RBSE7iYeIZyWDQ==
X-CSE-MsgGUID: Pk6nbib3REmYl8BzlJILkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="96630835"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="96630835"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 23:50:30 -0800
X-CSE-ConnectionGUID: WUf4cPhfRpOi8O+lwSOg5A==
X-CSE-MsgGUID: RlMFFGmTSpuF4tdxaB04jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="209240619"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2026 23:50:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmohW-00000000fKM-2hjG;
	Mon, 02 Feb 2026 07:50:26 +0000
Date: Mon, 2 Feb 2026 15:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Youngjun Park <youngjun.park@lge.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 1/5] mm: swap: introduce swap tier infrastructure
Message-ID: <202602021529.0NRBWccf-lkp@intel.com>
References: <20260131125454.3187546-2-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131125454.3187546-2-youngjun.park@lge.com>

Hi Youngjun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 5a3704ed2dce0b54a7f038b765bb752b87ee8cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Youngjun-Park/mm-swap-introduce-swap-tier-infrastructure/20260201-005914
base:   5a3704ed2dce0b54a7f038b765bb752b87ee8cc2
patch link:    https://lore.kernel.org/r/20260131125454.3187546-2-youngjun.park%40lge.com
patch subject: [RFC PATCH v3 1/5] mm: swap: introduce swap tier infrastructure
config: i386-buildonly-randconfig-003-20260202 (https://download.01.org/0day-ci/archive/20260202/202602021529.0NRBWccf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021529.0NRBWccf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021529.0NRBWccf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_tier.c:95:10: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
      93 |                 len += sysfs_emit_at(buf, len, "%-16s %-5ld %-11d %-11d\n",
         |                                                       ~~~~~
         |                                                       %-5d
      94 |                                      tier->name,
      95 |                                      TIER_IDX(tier),
         |                                      ^~~~~~~~~~~~~~
   mm/swap_tier.c:30:24: note: expanded from macro 'TIER_IDX'
      30 | #define TIER_IDX(tier)  ((tier) - swap_tiers)
         |                         ^~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +95 mm/swap_tier.c

    82	
    83	ssize_t swap_tiers_sysfs_show(char *buf)
    84	{
    85		struct swap_tier *tier;
    86		ssize_t len = 0;
    87	
    88		len += sysfs_emit_at(buf, len, "%-16s %-5s %-11s %-11s\n",
    89				 "Name", "Idx", "PrioStart", "PrioEnd");
    90	
    91		spin_lock(&swap_tier_lock);
    92		for_each_active_tier(tier) {
    93			len += sysfs_emit_at(buf, len, "%-16s %-5ld %-11d %-11d\n",
    94					     tier->name,
  > 95					     TIER_IDX(tier),
    96					     tier->prio,
    97					     TIER_END_PRIO(tier));
    98			if (len >= PAGE_SIZE)
    99				break;
   100		}
   101		spin_unlock(&swap_tier_lock);
   102	
   103		return len;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
