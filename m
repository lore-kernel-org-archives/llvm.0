Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C34187845;
	Mon, 29 Jul 2024 23:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722294189; cv=none; b=l/wLmKBaVBdSNAQ5L/uRND03VneDaLXez3GFABiAvi2q1IzE0uWvejiagHVKldCvJmFyObGGqKT7UYhoRC9vWL7Pf89tq6FFibSe6U2dDUl1KEuEYTtwP1A0nILT4hblYuwnMwO02RNslyb0l2NNfS45w6titpIRF7mH3MdEWm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722294189; c=relaxed/simple;
	bh=axe6xxboRQoUfNMQpbdGNQvYFrV1wumrp35S2u3DVG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZouYCtbdUUr9zye+PB5FDuVcWQK3tuhUuaNA1tUMrL6oIye0ATpXo1DVveQQZIAuUDSQlHlXN4bCBbhhw4ldRoWiiGBXRUR/xBfT/qSfRpnrptzmwmGHFg7ZWQhTcI5my1ACeCPqP0FvuUKg7KHrZBIhSTX9C2una/W9Qb9mUeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwUrps7v; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwUrps7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722294188; x=1753830188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=axe6xxboRQoUfNMQpbdGNQvYFrV1wumrp35S2u3DVG8=;
  b=EwUrps7v4tHSHVqyUL0cJm4Nx0lVz21qqpITBGSkpc1Lp4nu5XLfZIkn
   c1AVtHMA2B/lqlRpdCfVlEUhEtdyyhFzqWfxM9R2IiBagSoIlwq0hxwsf
   nnMt6CmjoGRjQhrW5jbva+9Ev2Wrhm9m5TVC52OELjo0ZDjzX+yy8PoDm
   98iOH6rHkLz/3FTnflFGyx4Sr89lS6uEAbolWLhrbD2g9KZQzOXjsV4/h
   /nA9RjyhUIktVhtHb5cYzzkFNe+V9Y43pnt5/aepLZszXcKTx6p8aCmEM
   UMwgkQWl+1+IaMPaoy8oVxBVJOjvnVD9n7yhyb9mD5EEl6pKO9lBeAZoT
   Q==;
X-CSE-ConnectionGUID: yTm6YVB1T4KW0sfgS3sPog==
X-CSE-MsgGUID: iigarKVZSz6d1iZxl8KeXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="22996787"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="22996787"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 16:03:07 -0700
X-CSE-ConnectionGUID: qpm3C+TES8eRJVGN/S+2Zg==
X-CSE-MsgGUID: E+TdbjU8T1C7TZt5gpd85A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="53843417"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2024 16:03:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYZOR-000s9w-2r;
	Mon, 29 Jul 2024 23:03:03 +0000
Date: Tue, 30 Jul 2024 07:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:kfence-fix-wip6 9/10]
 arch/powerpc/include/asm/kfence.h:41:13: error: expected parameter
 declarator
Message-ID: <202407300647.62hbTyOX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux kfence-fix-wip6
head:   232bab42e9b7dd1051658608c6ee254ee53cf09e
commit: 72786c184ded2eb5805eb7fa17497ff9e85d6833 [9/10] kfence refactor
config: powerpc64-randconfig-002-20240730 (https://download.01.org/0day-ci/archive/20240730/202407300647.62hbTyOX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300647.62hbTyOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300647.62hbTyOX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kfence/kfence_test.c:17:
   In file included from include/linux/kfence.h:12:
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
   In file included from mm/kfence/kfence_test.c:26:
>> arch/powerpc/include/asm/kfence.h:41:13: error: expected parameter declarator
      41 | early_param("kfence.sample_interval", parse_kfence_early_init);
         |             ^
>> arch/powerpc/include/asm/kfence.h:41:13: error: expected ')'
   arch/powerpc/include/asm/kfence.h:41:12: note: to match this '('
      41 | early_param("kfence.sample_interval", parse_kfence_early_init);
         |            ^
>> arch/powerpc/include/asm/kfence.h:41:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      41 | early_param("kfence.sample_interval", parse_kfence_early_init);
         | ^
         | int
>> arch/powerpc/include/asm/kfence.h:41:12: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
      41 | early_param("kfence.sample_interval", parse_kfence_early_init);
         |            ^                                                 
         |                                                              void
   5 warnings and 4 errors generated.


vim +41 arch/powerpc/include/asm/kfence.h

    32	
    33	static inline int parse_kfence_early_init(char *arg)
    34	{
    35		int val;
    36	
    37		if (get_option(&arg, &val))
    38			kfence_early_init = !!val;
    39		return 0;
    40	}
  > 41	early_param("kfence.sample_interval", parse_kfence_early_init);
    42	#endif
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
