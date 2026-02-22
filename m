Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB2461FCE;
	Sun, 22 Feb 2026 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771765244; cv=none; b=U9IQuBAscWbJiqrkCZxcF+HzERA6+aaDFDGi1JQpmSZcQs2KfBWD21ISlGtZ7Kh2LGH4pXaX9V1hVF/6g+H+RDsqIpjtLhHsGyAtkKFkXHyMexlVIlU+EReZ3bc9raR85swve4KHVkK1iJGX1IUtbeQ/3h6kSDfjwju9l7zfWH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771765244; c=relaxed/simple;
	bh=e+Q1z93kg62hHc+8BDygS0Ic0+kAn4rCcpzedNe6qQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pEjs+SFQRwNMfCtrUPqgRPPro7yuJkpI6LOEcOgNyGqZnamDHULEnHpbSiGEHD5xDSucDlIXA/mXOk2XY+fdpYOtfshPkxxXoTUX9yZbzP7HPq8qHIOD53v2Hpq8bugL8dwJVAMDu1HlgNJprqeCLZn/r0Mi6wogySESvbWFDps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIUKepcp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIUKepcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771765243; x=1803301243;
  h=date:from:to:cc:subject:message-id;
  bh=e+Q1z93kg62hHc+8BDygS0Ic0+kAn4rCcpzedNe6qQQ=;
  b=RIUKepcpNDkr0JkoXAYNLJhN1JUqrjHl7jXeDYIaqQin4gzfNwpDFS7K
   UP5pM5NOi6wCMv0kUrAW8aaRhZ20q0wQGbGPGljkUtLdj9n/Ho1ypaHtN
   K/xqkFTW+F+UWWYq47P2Q+VCiUMO2LCinlKB0B8VK4H4wVOpmXZhBPRzC
   SsNMM1mulDw3sGxdKVyZjMgjZUpMhSS7142C6TQJD/nHaZxs8n8d7M9XH
   b1JJvClwgV75nguyU2ewZ5pXrRPOlnB0gdgNdUp1PyKWbknSqQDl0AUc2
   QzIEZRyhN1FgtmC7S5x3mx9GF3RxF+64p3UCaPlCwQRNFGFSctkXN+NFm
   A==;
X-CSE-ConnectionGUID: AHA1J7N0SVi4bLmUXE5gIg==
X-CSE-MsgGUID: DNSkz/90QMKmoTAQIii8XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72824603"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="72824603"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 05:00:42 -0800
X-CSE-ConnectionGUID: d8L7f19BR4iJBXulgUZ37g==
X-CSE-MsgGUID: eN7BH+6nSTqVFnv6jHI5GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="215317333"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Feb 2026 05:00:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu94g-000000015Tg-0Sog;
	Sun, 22 Feb 2026 13:00:38 +0000
Date: Sun, 22 Feb 2026 21:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 57/60]
 drivers/cxl/core/region_sysram.c:63:2: error: use of undeclared identifier
 'mhp_t'
Message-ID: <202602222019.98YEm5RU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: baec60290631ac5603560724f70e769f8b71de4f [57/60] cxl/core: Add cxl_sysram region type
config: x86_64-buildonly-randconfig-005-20260222 (https://download.01.org/0day-ci/archive/20260222/202602222019.98YEm5RU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602222019.98YEm5RU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602222019.98YEm5RU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/region_sysram.c:63:2: error: use of undeclared identifier 'mhp_t'
      63 |         mhp_t mhp_flags;
         |         ^
>> drivers/cxl/core/region_sysram.c:83:2: error: use of undeclared identifier 'mhp_flags'; did you mean 'pci_flags'?
      83 |         mhp_flags = MHP_NID_IS_MGID;
         |         ^~~~~~~~~
         |         pci_flags
   include/linux/pci.h:1160:21: note: 'pci_flags' declared here
    1160 | extern unsigned int pci_flags;
         |                     ^
>> drivers/cxl/core/region_sysram.c:83:14: error: use of undeclared identifier 'MHP_NID_IS_MGID'
      83 |         mhp_flags = MHP_NID_IS_MGID;
         |                     ^
>> drivers/cxl/core/region_sysram.c:89:7: error: call to undeclared function '__add_memory_driver_managed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      89 |         rc = __add_memory_driver_managed(sysram->mgid,
         |              ^
   drivers/cxl/core/region_sysram.c:92:24: error: use of undeclared identifier 'mhp_flags'
      92 |                                          sysram_res_name, mhp_flags,
         |                                                           ^
>> drivers/cxl/core/region_sysram.c:111:7: error: call to undeclared function 'offline_and_remove_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     111 |         rc = offline_and_remove_memory(sysram->hpa_range.start,
         |              ^
   drivers/cxl/core/region_sysram.c:111:7: note: did you mean 'offline_and_remove_private_memory'?
   include/linux/memory_hotplug.h:314:19: note: 'offline_and_remove_private_memory' declared here
     314 | static inline int offline_and_remove_private_memory(int nid, u64 start,
         |                   ^
>> drivers/cxl/core/region_sysram.c:141:3: error: call to undeclared function 'memory_group_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     141 |                 memory_group_unregister(sysram->mgid);
         |                 ^
>> drivers/cxl/core/region_sysram.c:318:7: error: call to undeclared function 'memory_group_register_static'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     318 |         rc = memory_group_register_static(numa_node,
         |              ^
   8 errors generated.


vim +/mhp_t +63 drivers/cxl/core/region_sysram.c

    59	
    60	static int sysram_hotplug_add(struct cxl_sysram *sysram, enum mmop online_type)
    61	{
    62		struct resource *res;
  > 63		mhp_t mhp_flags;
    64		int rc;
    65	
    66		if (sysram->res)
    67			return -EBUSY;
    68	
    69		res = request_mem_region(sysram->hpa_range.start,
    70					 range_len(&sysram->hpa_range),
    71					 sysram->res_name);
    72		if (!res)
    73			return -EBUSY;
    74	
    75		sysram->res = res;
    76	
    77		/*
    78		 * Set flags appropriate for System RAM. Leave ..._BUSY clear
    79		 * so that add_memory() can add a child resource.
    80		 */
    81		res->flags = IORESOURCE_SYSTEM_RAM;
    82	
  > 83		mhp_flags = MHP_NID_IS_MGID;
    84	
    85		/*
    86		 * Ensure that future kexec'd kernels will not treat
    87		 * this as RAM automatically.
    88		 */
  > 89		rc = __add_memory_driver_managed(sysram->mgid,
    90						 sysram->hpa_range.start,
    91						 range_len(&sysram->hpa_range),
    92						 sysram_res_name, mhp_flags,
    93						 online_type);
    94		if (rc) {
    95			remove_resource(res);
    96			kfree(res);
    97			sysram->res = NULL;
    98			return rc;
    99		}
   100	
   101		return 0;
   102	}
   103	
   104	static int sysram_hotplug_remove(struct cxl_sysram *sysram)
   105	{
   106		int rc;
   107	
   108		if (!sysram->res)
   109			return 0;
   110	
 > 111		rc = offline_and_remove_memory(sysram->hpa_range.start,
   112					       range_len(&sysram->hpa_range));
   113		if (rc)
   114			return rc;
   115	
   116		if (sysram->res) {
   117			remove_resource(sysram->res);
   118			kfree(sysram->res);
   119			sysram->res = NULL;
   120		}
   121	
   122		return 0;
   123	}
   124	
   125	int cxl_sysram_offline_and_remove(struct cxl_sysram *sysram)
   126	{
   127		return sysram_hotplug_remove(sysram);
   128	}
   129	EXPORT_SYMBOL_NS_GPL(cxl_sysram_offline_and_remove, "CXL");
   130	
   131	static void cxl_sysram_release(struct device *dev)
   132	{
   133		struct cxl_sysram *sysram = to_cxl_sysram(dev);
   134	
   135		if (sysram->res)
   136			sysram_hotplug_remove(sysram);
   137	
   138		kfree(sysram->res_name);
   139	
   140		if (sysram->mgid >= 0)
 > 141			memory_group_unregister(sysram->mgid);
   142	
   143		if (sysram->mtype)
   144			clear_node_memory_type(sysram->numa_node, sysram->mtype);
   145	
   146		kfree(sysram);
   147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
