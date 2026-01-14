Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F9279908;
	Wed, 14 Jan 2026 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768410669; cv=none; b=Kt+lKSArSrN7NOYi2ioEUnhpghehHLRN56Or1mA5j1Uxkvq0086syvZ878NzPFuv7cJjuEjfpfE98zXmsPG3ZQQ2e7bRbOuM46mqVjGTi3sWJQLnkda7fsXV8nrtLH0FBo+jRaiVnzUY8gpONJYyqvInfTMyVGNkBCtwFIz0sVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768410669; c=relaxed/simple;
	bh=vcC8o+NswIQs6Mfa7Gz46ZPjHeWFtexV351gbpdSEhM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gAEVd3ISqmxdqxM0ynbtR+BiN6tAnOcpVVl6b82ZPrp5oUbcQPHOVkVj5Hvx0Fjjye04JVn5vpF7IbeGoNN5uHC+quqlKwRwe5IQJG14N95YTXIvV0ulT8my4VndEj02bQDb7Mwi2eTOioHkPy6hWaaJKDYqG/k8NLmiMJJXRIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CNjdnizV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CNjdnizV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768410668; x=1799946668;
  h=date:from:to:cc:subject:message-id;
  bh=vcC8o+NswIQs6Mfa7Gz46ZPjHeWFtexV351gbpdSEhM=;
  b=CNjdnizVTATmGL3m43rj3fJ4hJReeMr4eHo3oQeH2T9GcLBdWbkdTSrm
   f7iZ0pU6BaYR/JLLRnMVs9G2y1BpAiOUHBUOhBtIifkNnFpCzX7KEemxO
   tO64tiJO8+TVYNAh77FwzxXUSi8by/5m40fiEy/BB0LTB3UXJKgJYEyKI
   FrsZR9/veJ/Fc/C9kc9ipTyfvTsSSTHKgpAvuN9AE5FbIZnStMt9Dgona
   gCIViEfiT7llwlJ3IFyGLbHEymHHSfI4b/laY9QWqaMj8sOEi8QfN4F8A
   ikhB9ZgIohuh+Gz69xltnFiSBPrHFx9YPUWosmKXQDsCIiIbKxlZek8Yp
   g==;
X-CSE-ConnectionGUID: 9GIyXK+gQWeNLRqBQVhXDA==
X-CSE-MsgGUID: jljkzt1oSIqCh8sr/nZbHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69624617"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69624617"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 09:11:07 -0800
X-CSE-ConnectionGUID: WbcuvRWPQY2TdfCMT1/j1Q==
X-CSE-MsgGUID: aP8TVhKMSXOZXPFRXr0edA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204351173"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jan 2026 09:11:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg4Od-00000000Gie-1dPN;
	Wed, 14 Jan 2026 17:11:03 +0000
Date: Thu, 15 Jan 2026 01:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/dax_hotplug/v1 6/8]
 drivers/dax/kmem.c:239:3: error: call to undeclared function
 'offline_memory'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601150150.S6pGsB2e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/dax_hotplug/v1
head:   22fae3f95d9ba4a7851533f500d7609e34bab29b
commit: 56dd024c0a3d9ce32b5ea8fd6d4dc52ab80093b7 [6/8] dax/kmem: add online/offline helper functions
config: x86_64-randconfig-074-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150150.S6pGsB2e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150150.S6pGsB2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150150.S6pGsB2e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dax/kmem.c:239:3: error: call to undeclared function 'offline_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     239 |                 offline_memory(range.start, range_len(&range));
         |                 ^
   drivers/dax/kmem.c:269:8: error: call to undeclared function 'offline_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     269 |                 rc = offline_memory(range.start, range_len(&range));
         |                      ^
   2 errors generated.


vim +/offline_memory +239 drivers/dax/kmem.c

   192	
   193	/**
   194	 * dax_kmem_do_online - online memory blocks for dax kmem device
   195	 * @dev_dax: the dev_dax instance
   196	 * @data: the dax_kmem_data structure with resource tracking
   197	 * @online_type: MMOP_ONLINE or MMOP_ONLINE_MOVABLE
   198	 *
   199	 * Onlines all ranges in the dev_dax region with the specified online type.
   200	 * On partial failure, previously onlined ranges are rolled back to offline.
   201	 *
   202	 * Returns 0 on success, negative error code on failure.
   203	 */
   204	static int dax_kmem_do_online(struct dev_dax *dev_dax,
   205				      struct dax_kmem_data *data, int online_type)
   206	{
   207		int i, j, rc;
   208	
   209		for (i = 0; i < dev_dax->nr_range; i++) {
   210			struct range range;
   211	
   212			rc = dax_kmem_range(dev_dax, i, &range);
   213			if (rc)
   214				continue;
   215	
   216			if (!data->res[i])
   217				continue;
   218	
   219			rc = online_memory_range(range.start, range_len(&range),
   220						 online_type);
   221			if (rc)
   222				goto rollback;
   223		}
   224	
   225		return 0;
   226	
   227	rollback:
   228		/* Rollback previously onlined ranges */
   229		for (j = 0; j < i; j++) {
   230			struct range range;
   231	
   232			if (dax_kmem_range(dev_dax, j, &range))
   233				continue;
   234	
   235			if (!data->res[j])
   236				continue;
   237	
   238			/* Best effort rollback - ignore failures */
 > 239			offline_memory(range.start, range_len(&range));
   240		}
   241		return rc;
   242	}
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
