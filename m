Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43314393DCD;
	Thu, 21 Aug 2025 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755810413; cv=none; b=SrQPWTM2SGpiumw1luWCwLIDlqxbTVP7PwLxb7N6545f6GxJkvNNFvDFOh4AKrQSwaZU8OOzZOBX/e+MlP44ZDYliLvyBOmxiElWjnNlAoTcVng/epYG01lbSZAXVZfshd8G7h98r3goNNLupYnmiBIiT+nGdBTAqSW/2EfZZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755810413; c=relaxed/simple;
	bh=bedfVgu0AHiZRQg1jgmBL0HGHqbb9BNp7v2TpYnM1kM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ek8sMVyIn4u/svPKHFFc8NqieFR6ydEesBbDVC5TqCPvb6u2shmu6ENvv4wOPItKpeBdWdEpHDKc7Ww5TKSFKTxPI+tqYfkyqSvb8WwnCEmMZOkUFhgmdshxmJePHwWSkm+hgIyoAwrDEDEfAf4RtVHX2YbosU88bQy6/No+iHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4yBVSDh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4yBVSDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755810411; x=1787346411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bedfVgu0AHiZRQg1jgmBL0HGHqbb9BNp7v2TpYnM1kM=;
  b=V4yBVSDhSkg6yfa3MgvvTTrl2LshRsucuMm7HdqfJXo0AxMNLb2RoqUj
   IrO8ArkncfHWK7MeRAPFJ2iV/1hMVvViyqJMYIWvbeLrvTNSudrH6MSFC
   BIaOc0gCWWGGc2oCW260cxqLgF+Vq3dsCA+7x+Ad55dTURHgXPeLVq3ga
   8bRGJc6B/Zd1OCWbgrirkUhZ+N543zScrle2eVnjFLyqvRqfZWACDuHGT
   cvqXPZcR2pqVA5w3XB4nWChIfbEZYH27/ze1Jv00Cqv8ZlXBD8gxiV98e
   +5Yf1i+yorr0LGWBRN6aODQYUhBClrk5q+bCa5hA2bPPEkBzOLPJ284mm
   w==;
X-CSE-ConnectionGUID: b90zpYiGRuitsj8AOxUwRQ==
X-CSE-MsgGUID: CXn73GCeT26Y9it+/eZ+1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75698764"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="75698764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 14:06:50 -0700
X-CSE-ConnectionGUID: L1wOvzxgSpKQZ+4cYycWQg==
X-CSE-MsgGUID: AZY2c83+TaCxNMv0MWFb5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168419614"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2025 14:06:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upCUJ-000Kf9-0d;
	Thu, 21 Aug 2025 21:06:40 +0000
Date: Fri, 22 Aug 2025 05:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:ramdax 1/1] drivers/nvdimm/ramdax.c:44:11: error: call to
 undeclared function 'kzalloc'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202508220413.PjQEKKgT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git ramdax
head:   349f76d4596ebf970cfdec905e98534a84251cd8
commit: 349f76d4596ebf970cfdec905e98534a84251cd8 [1/1] nvdimm: allow exposing RAM carveouts as NVDIMM DIMM devices
config: x86_64-buildonly-randconfig-004-20250822 (https://download.01.org/0day-ci/archive/20250822/202508220413.PjQEKKgT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508220413.PjQEKKgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508220413.PjQEKKgT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvdimm/ramdax.c:44:11: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      44 |         nd_set = kzalloc(sizeof(*nd_set), GFP_KERNEL);
         |                  ^
>> drivers/nvdimm/ramdax.c:44:9: error: incompatible integer to pointer conversion assigning to 'struct nd_interleave_set *' from 'int' [-Wint-conversion]
      44 |         nd_set = kzalloc(sizeof(*nd_set), GFP_KERNEL);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvdimm/ramdax.c:71:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      71 |         kfree(nd_set);
         |         ^
   drivers/nvdimm/ramdax.c:84:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      84 |         dimm = kzalloc(sizeof(*dimm), GFP_KERNEL);
         |                ^
>> drivers/nvdimm/ramdax.c:84:7: error: incompatible integer to pointer conversion assigning to 'struct ramdax_dimm *' from 'int' [-Wint-conversion]
      84 |         dimm = kzalloc(sizeof(*dimm), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/ramdax.c:117:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |         kfree(dimm);
         |         ^
   6 errors generated.


vim +/kzalloc +44 drivers/nvdimm/ramdax.c

    34	
    35	static int ramdax_register_region(struct resource *res,
    36					    struct nvdimm *nvdimm,
    37					    struct nvdimm_bus *nvdimm_bus)
    38	{
    39		struct nd_mapping_desc mapping;
    40		struct nd_region_desc ndr_desc;
    41		struct nd_interleave_set *nd_set;
    42		int nid = phys_to_target_node(res->start);
    43	
  > 44		nd_set = kzalloc(sizeof(*nd_set), GFP_KERNEL);
    45		if (!nd_set)
    46			return -ENOMEM;
    47	
    48		nd_set->cookie1 = 0xcafebeefcafebeef;
    49		nd_set->cookie2 = nd_set->cookie1;
    50		nd_set->altcookie = nd_set->cookie1;
    51	
    52		memset(&mapping, 0, sizeof(mapping));
    53		mapping.nvdimm = nvdimm;
    54		mapping.start = 0;
    55		mapping.size = resource_size(res) - LABEL_AREA_SIZE;
    56	
    57		memset(&ndr_desc, 0, sizeof(ndr_desc));
    58		ndr_desc.res = res;
    59		ndr_desc.numa_node = numa_map_to_online_node(nid);
    60		ndr_desc.target_node = nid;
    61		ndr_desc.num_mappings = 1;
    62		ndr_desc.mapping = &mapping;
    63		ndr_desc.nd_set = nd_set;
    64	
    65		if (!nvdimm_pmem_region_create(nvdimm_bus, &ndr_desc))
    66			goto err_free_nd_set;
    67	
    68		return 0;
    69	
    70	err_free_nd_set:
  > 71		kfree(nd_set);
    72		return -ENXIO;
    73	}
    74	
    75	static int ramdax_register_dimm(struct resource *res, void *data)
    76	{
    77		resource_size_t start = res->start;
    78		resource_size_t size = resource_size(res);
    79		unsigned long flags = 0, cmd_mask = 0;
    80		struct nvdimm_bus *nvdimm_bus = data;
    81		struct ramdax_dimm *dimm;
    82		int err;
    83	
  > 84		dimm = kzalloc(sizeof(*dimm), GFP_KERNEL);
    85		if (!dimm)
    86			return -ENOMEM;
    87	
    88		dimm->label_area = memremap(start + size - LABEL_AREA_SIZE,
    89					    LABEL_AREA_SIZE, MEMREMAP_WB);
    90		if (!dimm->label_area)
    91			goto err_free_dimm;
    92	
    93		set_bit(NDD_LABELING, &flags);
    94		set_bit(NDD_REGISTER_SYNC, &flags);
    95		set_bit(ND_CMD_GET_CONFIG_SIZE, &cmd_mask);
    96		set_bit(ND_CMD_GET_CONFIG_DATA, &cmd_mask);
    97		set_bit(ND_CMD_SET_CONFIG_DATA, &cmd_mask);
    98		dimm->nvdimm = nvdimm_create(nvdimm_bus, dimm,
    99					     /* dimm_attribute_groups */ NULL,
   100					     flags, cmd_mask, 0, NULL);
   101		if (!dimm->nvdimm) {
   102			err = -ENOMEM;
   103			goto err_unmap_label;
   104		}
   105	
   106		err = ramdax_register_region(res, dimm->nvdimm, nvdimm_bus);
   107		if (err)
   108			goto err_remove_nvdimm;
   109	
   110		return 0;
   111	
   112	err_remove_nvdimm:
   113		nvdimm_delete(dimm->nvdimm);
   114	err_unmap_label:
   115		memunmap(dimm->label_area);
   116	err_free_dimm:
   117		kfree(dimm);
   118		return err;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
