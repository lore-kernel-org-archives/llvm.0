Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0E84A00;
	Wed, 24 Jul 2024 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721790246; cv=none; b=RmWqAEz9b4MEuxKQ9tg5zHcrRnXz/vChnpbL+OIxgRo6Mf2ob6q23DChOIq8nWF3rOiaXeaXT1c1FvbY6VlyLR5Dv9S4jzRLn3pKGy6qqGAAorfJ2KXW0PnMvmUER2rSGo8hsIGnZnSAqBc2AfdfdUfCu7gbHBFBiF8NCeEVRbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721790246; c=relaxed/simple;
	bh=n0fUYwW0pUbhDFvzIfOE0i2+QxlLR+5WA7kNhEVlBN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sduFLbrRjfdjU3KvGaobgrAdavQWGnBtCHz5l9EpPzRlvvCNE0MXY9yA4LJLvl20yGx1oz/02Vzd8pxWrOmFMkSzuGzABeqU7agHRQHyJ2/H7DJUs5JBs6g5fLxaZO2b9qQzkMkEYGjKlaVKrs5jTLhIZUx5xBGdT7+cZUF+DKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmHFE7wU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmHFE7wU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721790244; x=1753326244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0fUYwW0pUbhDFvzIfOE0i2+QxlLR+5WA7kNhEVlBN0=;
  b=PmHFE7wUZmqu/GbN1XnnQ8LfjqwMP0dOp8hFGtgDKsmPJmcTPfmpnLjv
   2Ef+GisI8XMpyh4AVrCSvqP13VKZobohNIvMkQrVant3rEU213ymiALWE
   f9sCru7kVt1pHa8/OLj28shONCRXNq6TXUlvC6+Cd1tEYyrXmewhdwc69
   09ZQNRY2TmamT9F0d7ZAwjhyV/d9+g7ZEAkKh9NK6q1Pc3R/+wPpsRNEJ
   +dZipIU7cyNiYxVuxbnwDSZLNd2Pwj5D66sHdAs+ClIyM4N8k7joD6TDz
   diG13UtjR7KF8Ao66oOOod8AnLHh0ILczVm4W5nt09M+QCy/ZkDjyCGUV
   w==;
X-CSE-ConnectionGUID: 0hCiNEXCQx+bQdBdTptbjA==
X-CSE-MsgGUID: j8RbFL/eQrWWrOuedsFTwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19581366"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="19581366"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 20:04:03 -0700
X-CSE-ConnectionGUID: 7jOr0QYCT9mF1xpMS6fnJg==
X-CSE-MsgGUID: I2kelAezRSC7o+cxR2z9Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="56967413"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jul 2024 20:04:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWSIK-000mbA-1w;
	Wed, 24 Jul 2024 03:04:00 +0000
Date: Wed, 24 Jul 2024 11:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:kfence-fix-wip6 10/10]
 arch/powerpc/mm/book3s64/hash_utils.c:1077:37: warning: address of function
 'kasan_early_init' will always evaluate to 'true'
Message-ID: <202407241025.18f01Xds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux kfence-fix-wip6
head:   28d73773290c65f55d22e038b4f13c5c4941a561
commit: 28d73773290c65f55d22e038b4f13c5c4941a561 [10/10] kfence: disable if not early init
config: powerpc64-randconfig-003-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241025.18f01Xds-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241025.18f01Xds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241025.18f01Xds-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/mm/book3s64/hash_utils.c:32:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/hash_utils.c:1077:37: error: use of undeclared identifier 'kfence_early_init'; did you mean 'kasan_early_init'?
    1077 |             !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
         |                                            ^~~~~~~~~~~~~~~~~
         |                                            kasan_early_init
   arch/powerpc/include/asm/kasan.h:69:6: note: 'kasan_early_init' declared here
      69 | void kasan_early_init(void);
         |      ^
>> arch/powerpc/mm/book3s64/hash_utils.c:1077:37: warning: address of function 'kasan_early_init' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1077 |             !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
         |                                         ~~ ^~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/hash_utils.c:1077:37: note: prefix with the address-of operator to silence this warning
    1077 |             !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
         |                                            ^
         |                                            &
   6 warnings and 1 error generated.


vim +1077 arch/powerpc/mm/book3s64/hash_utils.c

  1070	
  1071	static void __init htab_init_page_sizes(void)
  1072	{
  1073		bool aligned = true;
  1074		init_hpte_page_sizes();
  1075	
  1076		if (!debug_pagealloc_enabled() &&
> 1077		    !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
  1078			/*
  1079			 * Pick a size for the linear mapping. Currently, we only
  1080			 * support 16M, 1M and 4K which is the default
  1081			 */
  1082			if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) &&
  1083			    (unsigned long)_stext % 0x1000000) {
  1084				if (mmu_psize_defs[MMU_PAGE_16M].shift)
  1085					pr_warn("Kernel not 16M aligned, disabling 16M linear map alignment\n");
  1086				aligned = false;
  1087			}
  1088	
  1089			if (mmu_psize_defs[MMU_PAGE_16M].shift && aligned)
  1090				mmu_linear_psize = MMU_PAGE_16M;
  1091			else if (mmu_psize_defs[MMU_PAGE_1M].shift)
  1092				mmu_linear_psize = MMU_PAGE_1M;
  1093		}
  1094	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
