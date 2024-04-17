Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE75613342F;
	Wed, 17 Apr 2024 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713357750; cv=none; b=kjytpMXLDg03YyWJntNXqDZppBWdC0zjPeF1UHxoCe5eSFHcZkYrXjd7Tgit5BTUQ0nbaSYVC6EFm+iG+hFkDz0GvdRAvodYOcYt9USJ/m1I0DRnW2xyuyfO3+N4HAnfPI4EzPyf8BjFZIo52wySO7bMqnbzbFUbnq8d3ZlOfR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713357750; c=relaxed/simple;
	bh=696xG4KSNNR2SoPvitgHN8loEIYlXh03MOTeKKXOZ0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ofm1IWIPjIj9tKv83lP6FiKE/XDEmUuFgESL+bTEuxrNEl9n2kti29WHxKT8blN8RWeArcjXpDk26Lud8gKd8PFmnzmmkp7HUgWuRi/ufMNWkbgqaKpCTWxRgU3OoZGjfBTDV+zBydifSyudwWLZEjXEUc5kXo7D6sUVtEvqQ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShWE+WKf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShWE+WKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713357749; x=1744893749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=696xG4KSNNR2SoPvitgHN8loEIYlXh03MOTeKKXOZ0s=;
  b=ShWE+WKfBak5paFvPhH0lN7OGx4ipYqX7vPWjcMsySTJRo8Lsl3zHyCl
   LUUiWHrmvRC0Nvrf7O6RAIAG/Z1z3Zxu5tlDBPZXGFTjc67ms6y1aR15B
   8nR4mLz35uPW0mbmFovMXZtHLT3OMs3KykDMcX6TiHdi4jV8SvYUAyMHs
   iTUg9JGGnv0A1ZrinXwzcsG4fL2ObJ6oaynQ3XGqUPicnuuC3yuOyYOdl
   Yzw5nJYKA8XeZVzovn6h2WnndURtvdaGd34nJt0lp7iWvDsADtRXrZ+1/
   rV5jl+VNg2KbltterMYEakXOm8Dug8GRC/oQNKv5npD+kV2BZs/dFrFwX
   w==;
X-CSE-ConnectionGUID: HnnNj6ssQ/euuacUPrn/lw==
X-CSE-MsgGUID: OV13ydzVRt2/WYx5oNuA/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9013920"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9013920"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 05:42:28 -0700
X-CSE-ConnectionGUID: h0hXsOLLQD+/+BBMPYzSgw==
X-CSE-MsgGUID: M1wKm8mOQE+ZaIqKQxGTFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22674088"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2024 05:42:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx4c9-0006aC-2G;
	Wed, 17 Apr 2024 12:42:13 +0000
Date: Wed, 17 Apr 2024 20:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6398/6705] mm/page_table_check.c:193:14: error:
 use of undeclared identifier 'SWP_MIGRATION_WRITE'
Message-ID: <202404172024.aBF4Kjuo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eab358930711bbeb85bf5ee267d0d42d3394c2c
commit: 62754e4df9e04c4576e989f5ea2b909e824d8164 [6398/6705] mm/page_table_check: support userfault wr-protect entries
config: arm64-randconfig-004-20240417 (https://download.01.org/0day-ci/archive/20240417/202404172024.aBF4Kjuo-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404172024.aBF4Kjuo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404172024.aBF4Kjuo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_table_check.c:8:
   In file included from include/linux/mm.h:2254:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   mm/page_table_check.c:192:17: error: use of undeclared identifier 'SWP_DEVICE_EXCLUSIVE_WRITE'
     192 |         return type == SWP_DEVICE_EXCLUSIVE_WRITE ||
         |                        ^
>> mm/page_table_check.c:193:14: error: use of undeclared identifier 'SWP_MIGRATION_WRITE'
     193 |             type == SWP_MIGRATION_WRITE;
         |                     ^
   1 warning and 2 errors generated.


vim +/SWP_MIGRATION_WRITE +193 mm/page_table_check.c

   186	
   187	/* Whether the swap entry cached writable information */
   188	static inline bool swap_cached_writable(swp_entry_t entry)
   189	{
   190		unsigned type = swp_type(entry);
   191	
   192		return type == SWP_DEVICE_EXCLUSIVE_WRITE ||
 > 193		    type == SWP_MIGRATION_WRITE;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
