Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8601757E;
	Wed, 24 Jul 2024 03:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721792227; cv=none; b=IgRIRTCuhpcEQES+NKaPkrlugoyyBBXmXhb667kYo4aIh3JBuQ2+bHq1VUL9fkK6eYI7lDIyMmRU0Abn2yjMx318z+WmUdEclX+nrPTfsXyhp2lLNHEbOBf6GR4qB+aRwy6N6eF00a0OjrvGuSr6NEt0Mm3c7F71hcK5uVpwYu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721792227; c=relaxed/simple;
	bh=1nEtY+raE3irh8r9+ZINFhG4J08qoRBKhQPkjHEIJpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oeGC5pN70WULSLCNJUiHfMN71kG84YGaRqV60XmQN2SeMQUfk+ip2ef2hftN5242vNpEh0QnlPLym5D85C6orpJIVIBWhbP/M6cJOWaDzQ1GZQdUdXsD3qUNdjmU61gR80fhUv9FR9BBGpRgPrbznc8rDAa9rv+akgRMiedBxtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMLP9Jte; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMLP9Jte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721792225; x=1753328225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1nEtY+raE3irh8r9+ZINFhG4J08qoRBKhQPkjHEIJpM=;
  b=bMLP9Jtel7ogJ2p9X2sPrvi9Uk0fZTYPZqp0w2/aRTz8AHPR6HV+fXZI
   whkxXGZqQ+utU88Lyf4aWXI206yJChoDZoym2Q85Y7UyXfZ+jMsarIDWy
   JJ3O47N016hqpw8Zq9fg1UkKEDapAcumx5Sx8qCZWBCj+NdOkT3BMFi9s
   kul1unuBqzW2v8ltDKKWqcdm/53J8aCYMb+JSDh+Rsa/eCLfO/Z/U4nEp
   eEt4m7G89ZCGtkXSpxt40XLvPeTYP4u9fYYshc0ttVVptnjE+5M5Ui3R+
   okA/r/I+IrGbtroXqIcZyh0B7xI3IIW1vjHmChRV8ehoP8A1OCsbJbQo5
   g==;
X-CSE-ConnectionGUID: Oluh/ZrRQiGlx6mwLSHJYw==
X-CSE-MsgGUID: 7CjMacmHQKOZDh/dmHN+oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23207605"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="23207605"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 20:37:05 -0700
X-CSE-ConnectionGUID: VzN1tquHRNW0m7u/UpfVzw==
X-CSE-MsgGUID: uF35GMhdRti0E+MkZyHZ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="89905714"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jul 2024 20:37:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWSoH-000mcO-1A;
	Wed, 24 Jul 2024 03:37:01 +0000
Date: Wed, 24 Jul 2024 11:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:kfence-fix-wip6 10/10]
 arch/powerpc/mm/book3s64/hash_utils.c:1077:37: error: use of undeclared
 identifier 'kfence_early_init'; did you mean 'udbg_early_init'?
Message-ID: <202407241107.DMQfuo0p-lkp@intel.com>
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
config: powerpc64-randconfig-001-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241107.DMQfuo0p-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241107.DMQfuo0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241107.DMQfuo0p-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/mm/book3s64/hash_utils.c:32:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/powerpc/mm/book3s64/hash_utils.c:1077:37: error: use of undeclared identifier 'kfence_early_init'; did you mean 'udbg_early_init'?
    1077 |             !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
         |                                            ^~~~~~~~~~~~~~~~~
         |                                            udbg_early_init
   arch/powerpc/include/asm/udbg.h:37:13: note: 'udbg_early_init' declared here
      37 | void __init udbg_early_init(void);
         |             ^
>> arch/powerpc/mm/book3s64/hash_utils.c:1077:37: warning: address of function 'udbg_early_init' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1077 |             !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
         |                                         ~~ ^~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/hash_utils.c:1077:37: note: prefix with the address-of operator to silence this warning
    1077 |             !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
         |                                            ^
         |                                            &
   2 warnings and 1 error generated.


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
