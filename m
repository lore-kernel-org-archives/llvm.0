Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726EBEACD;
	Sun, 22 Feb 2026 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771767709; cv=none; b=ujW1wHnECVuw/FAcs9mUGKXbKpq1r7OpCgGypuJcF6PvVbWi8b8EIZTwFvTpVYd2GQSB3y2au2slt6doEOY6MV0fVTNc8MxBjLGj5pH1hyM3GMJczNouefCubzxltkeTgKj5MoYBI1xbu3dLXQXVFvdO/ITlYGOanV8fNJtKmno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771767709; c=relaxed/simple;
	bh=4lFNC3V7qpZ++UfyRc08LiV1424GnFRg+0d/eTAgOHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MCsxw3mwpJq0CdwndwUDqbkT/+4rMbeb5wudpaiv0XjBxo9i5ZOZnP0JJfqsCfCLWkQvL84r1P4KbKKAtsZ83/wFE32BqA/mILvSJuyexQgrkZpKt/rYgQZ9md52KC6Kmm8XXicTPjYuLlY65FVzsdYj7Nz79PcSU9lc/sVAzoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOAqsW6R; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOAqsW6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771767706; x=1803303706;
  h=date:from:to:cc:subject:message-id;
  bh=4lFNC3V7qpZ++UfyRc08LiV1424GnFRg+0d/eTAgOHo=;
  b=JOAqsW6RM9oaRUTREVFs5+nUhGMIR9UUQ1fK7M2K/b8PifWxaP35eCbl
   MtCCI93FHrRcSptyUk+/6Bgog4s+9RMvshtrWDD0n7AmI1PbEMUjKyoGg
   r89fdtxuHfXqA2T2/A1TmXA3UGeQEYC476aipUT93XhzKlTOxEq7vkSoE
   f2xD0TCkkSY0VBzrhwB+jVAEldFdkSkOxfSbyBtUQUibApxF+jb4tSCDz
   mVR/RRwIY01vFtNkTjoxLeD9Sz5qjrmJxfeNNuxhSohJEZ1cw6MUVVp/k
   PIsDUKKCbm7OEjwM1+LQuPir5SxKR//hUdVqag92K4aMOO5CIBhrrw/+D
   g==;
X-CSE-ConnectionGUID: IHsp3Gi0Qy2z5J2KkIbGmQ==
X-CSE-MsgGUID: bmKEGITYRAOJxdnHgyHfiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="84145892"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="84145892"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 05:41:45 -0800
X-CSE-ConnectionGUID: TQMxDTgyTNW/X2rE5HOZOw==
X-CSE-MsgGUID: TG7dt6TNTEqH5YbI7SSqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="213740166"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2026 05:41:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu9iN-000000015UW-23n4;
	Sun, 22 Feb 2026 13:41:39 +0000
Date: Sun, 22 Feb 2026 21:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 58/60]
 drivers/cxl/core/region_sysram.c:94:8: error: call to undeclared function
 'add_private_memory_driver_managed'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202602222112.KU56u6cB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: 6ac185af27a21c6c16bf4a85db934565424703b3 [58/60] cxl/core: Add private node support to cxl_sysram
config: x86_64-buildonly-randconfig-005-20260222 (https://download.01.org/0day-ci/archive/20260222/202602222112.KU56u6cB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602222112.KU56u6cB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602222112.KU56u6cB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/region_sysram.c:63:2: error: use of undeclared identifier 'mhp_t'
      63 |         mhp_t mhp_flags;
         |         ^
   drivers/cxl/core/region_sysram.c:83:2: error: use of undeclared identifier 'mhp_flags'; did you mean 'pci_flags'?
      83 |         mhp_flags = MHP_NID_IS_MGID;
         |         ^~~~~~~~~
         |         pci_flags
   include/linux/pci.h:1160:21: note: 'pci_flags' declared here
    1160 | extern unsigned int pci_flags;
         |                     ^
   drivers/cxl/core/region_sysram.c:83:14: error: use of undeclared identifier 'MHP_NID_IS_MGID'
      83 |         mhp_flags = MHP_NID_IS_MGID;
         |                     ^
>> drivers/cxl/core/region_sysram.c:94:8: error: call to undeclared function 'add_private_memory_driver_managed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |                 rc = add_private_memory_driver_managed(sysram->mgid,
         |                      ^
   drivers/cxl/core/region_sysram.c:97:31: error: use of undeclared identifier 'mhp_flags'
      97 |                                                        sysram_res_name, mhp_flags,
         |                                                                         ^
   drivers/cxl/core/region_sysram.c:100:8: error: call to undeclared function '__add_memory_driver_managed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     100 |                 rc = __add_memory_driver_managed(sysram->mgid,
         |                      ^
   drivers/cxl/core/region_sysram.c:103:25: error: use of undeclared identifier 'mhp_flags'
     103 |                                                  sysram_res_name, mhp_flags,
         |                                                                   ^
   drivers/cxl/core/region_sysram.c:134:8: error: call to undeclared function 'offline_and_remove_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |                 rc = offline_and_remove_memory(sysram->hpa_range.start,
         |                      ^
   drivers/cxl/core/region_sysram.c:134:8: note: did you mean 'offline_and_remove_private_memory'?
   include/linux/memory_hotplug.h:314:19: note: 'offline_and_remove_private_memory' declared here
     314 | static inline int offline_and_remove_private_memory(int nid, u64 start,
         |                   ^
   drivers/cxl/core/region_sysram.c:165:3: error: call to undeclared function 'memory_group_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     165 |                 memory_group_unregister(sysram->mgid);
         |                 ^
   drivers/cxl/core/region_sysram.c:348:7: error: call to undeclared function 'memory_group_register_static'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     348 |         rc = memory_group_register_static(numa_node,
         |              ^
   10 errors generated.


vim +/add_private_memory_driver_managed +94 drivers/cxl/core/region_sysram.c

    59	
    60	static int sysram_hotplug_add(struct cxl_sysram *sysram, enum mmop online_type)
    61	{
    62		struct resource *res;
    63		mhp_t mhp_flags;
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
    83		mhp_flags = MHP_NID_IS_MGID;
    84	
    85		/*
    86		 * Ensure that future kexec'd kernels will not treat
    87		 * this as RAM automatically.
    88		 *
    89		 * For private regions, use add_private_memory_driver_managed()
    90		 * to register as N_MEMORY_PRIVATE which isolates the memory from
    91		 * normal allocations and reclaim.
    92		 */
    93		if (sysram->private)
  > 94			rc = add_private_memory_driver_managed(sysram->mgid,
    95							       sysram->hpa_range.start,
    96							       range_len(&sysram->hpa_range),
    97							       sysram_res_name, mhp_flags,
    98							       online_type, &sysram->np);
    99		else
   100			rc = __add_memory_driver_managed(sysram->mgid,
   101							 sysram->hpa_range.start,
   102							 range_len(&sysram->hpa_range),
   103							 sysram_res_name, mhp_flags,
   104							 online_type);
   105		if (rc) {
   106			remove_resource(res);
   107			kfree(res);
   108			sysram->res = NULL;
   109			return rc;
   110		}
   111	
   112		return 0;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
