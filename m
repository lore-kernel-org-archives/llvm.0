Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AEE2C0303;
	Tue, 19 May 2026 23:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779234028; cv=none; b=rEL+gJyQKLP+goKZOr8WTosI85m9zu6QFyMjh/RElCu+EyUwV6EOrrbi6PqccqquKpKQVAspPUlXtrxcIZEmL4dd0YuWTZbxFOv8GQVTDbmolS6LPwzojEgu6b48W99d9Kg0QwVJ3dN9fnJABUWW1MFGPtZiyevrQYzP8kvcW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779234028; c=relaxed/simple;
	bh=pXRHIAnYsFDl4U45YklvY0YFOrGnm3Zek1PMbbZhsiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KgnStY5/+xgXDzHiZ7o+xYb6FEKUBK//QHtG6xqhKGQAhKP2IWIYld4AFkq0t/UyotVPqzOCXlUhVe3IfVB1w5eYw/oTnHE2Iuv3SiikfcqtIF3b27bqa2BtaBthoKffOWwKuUztNnXJswLqeh9ggg5itlb3digkSFyaoevXiZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW9secaw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW9secaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779234027; x=1810770027;
  h=date:from:to:cc:subject:message-id;
  bh=pXRHIAnYsFDl4U45YklvY0YFOrGnm3Zek1PMbbZhsiA=;
  b=XW9secawVLoijxrZOK/z129Aa4puyp5E6Mzr8j4ldsX5QNkmKe3ZbioJ
   JVTO2wFX7tvvSkczd1jOcTo1Pyr0d58p35RgWGuwKxECwKRG0x0cRBuW+
   APN6KE/6EE3U8sofkY9apzENbzXBTBtQanyEb5PFXS+TQ5NgxWL/DrjkR
   AK1OmuF4Xi2f6/BRhB/NEZCdhFFqDb+QM/nicc8FZs/6nma2xyKg0MRbZ
   /eXGspebwKNyaaJV7Kw+znn4j7mn7qdQPupKDGDJOgRrYHdUhuf11t4F2
   jcyjg1O1KttU8JWWhmWvrQqIRsuUPbJyMQTHCDywM2ON1oMu/Ym1TuPJH
   A==;
X-CSE-ConnectionGUID: GviKxMKyScW+EQEzUYlz0Q==
X-CSE-MsgGUID: f8gYpXepTDm1eGUC23oU7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79851677"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79851677"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 16:40:26 -0700
X-CSE-ConnectionGUID: tVglYbqjTf6t+Zcen4kAUA==
X-CSE-MsgGUID: Xe0NP7NhRimvSZ51KjYf0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239092348"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 May 2026 16:40:24 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPU2I-0000000028v-0QSa;
	Tue, 19 May 2026 23:39:52 +0000
Date: Wed, 20 May 2026 07:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [agd5f:drm-next 4/72]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1833:7: error: incomplete
 definition of type 'struct cpuinfo_x86'
Message-ID: <202605200730.CZLQcLxo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Harry,

First bad commit (maybe != root cause):

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   4cdbba5a16aaf16513b69cc332b1d6f971a44b52
commit: af3f2f5db2659a13c256d2fb096c473eb50412ef [4/72] drm/amdgpu: Remove UML build exclusion from Kconfig
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260520/202605200730.CZLQcLxo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200730.CZLQcLxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200730.CZLQcLxo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:24:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:27: error: call to undeclared function 'cpu_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                                  ^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:26: error: cannot take the address of an rvalue of type 'int'
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                                 ^~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1833:7: error: incomplete definition of type 'struct cpuinfo_x86'
    1833 |         if (c->x86_vendor == X86_VENDOR_AMD)
         |             ~^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:9: note: forward declaration of 'struct cpuinfo_x86'
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1833:23: error: use of undeclared identifier 'X86_VENDOR_AMD'
    1833 |         if (c->x86_vendor == X86_VENDOR_AMD)
         |                              ^
   1 warning and 4 errors generated.


vim +1833 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c

520b8fb755ccfb Felix Kuehling    2017-12-08  1823  
6d3d8065bb14dc Nathan Chancellor 2019-01-21  1824  #ifdef CONFIG_X86_64
520b8fb755ccfb Felix Kuehling    2017-12-08  1825  static int kfd_fill_iolink_info_for_cpu(int numa_node_id, int *avail_size,
520b8fb755ccfb Felix Kuehling    2017-12-08  1826  				uint32_t *num_entries,
520b8fb755ccfb Felix Kuehling    2017-12-08  1827  				struct crat_subtype_iolink *sub_type_hdr)
520b8fb755ccfb Felix Kuehling    2017-12-08  1828  {
520b8fb755ccfb Felix Kuehling    2017-12-08  1829  	int nid;
520b8fb755ccfb Felix Kuehling    2017-12-08 @1830  	struct cpuinfo_x86 *c = &cpu_data(0);
520b8fb755ccfb Felix Kuehling    2017-12-08  1831  	uint8_t link_type;
520b8fb755ccfb Felix Kuehling    2017-12-08  1832  
520b8fb755ccfb Felix Kuehling    2017-12-08 @1833  	if (c->x86_vendor == X86_VENDOR_AMD)
520b8fb755ccfb Felix Kuehling    2017-12-08  1834  		link_type = CRAT_IOLINK_TYPE_HYPERTRANSPORT;
520b8fb755ccfb Felix Kuehling    2017-12-08  1835  	else
520b8fb755ccfb Felix Kuehling    2017-12-08  1836  		link_type = CRAT_IOLINK_TYPE_QPI_1_1;
520b8fb755ccfb Felix Kuehling    2017-12-08  1837  
520b8fb755ccfb Felix Kuehling    2017-12-08  1838  	*num_entries = 0;
520b8fb755ccfb Felix Kuehling    2017-12-08  1839  
520b8fb755ccfb Felix Kuehling    2017-12-08  1840  	/* Create IO links from this node to other CPU nodes */
520b8fb755ccfb Felix Kuehling    2017-12-08  1841  	for_each_online_node(nid) {
520b8fb755ccfb Felix Kuehling    2017-12-08  1842  		if (nid == numa_node_id) /* node itself */
520b8fb755ccfb Felix Kuehling    2017-12-08  1843  			continue;
520b8fb755ccfb Felix Kuehling    2017-12-08  1844  
520b8fb755ccfb Felix Kuehling    2017-12-08  1845  		*avail_size -= sizeof(struct crat_subtype_iolink);
520b8fb755ccfb Felix Kuehling    2017-12-08  1846  		if (*avail_size < 0)
520b8fb755ccfb Felix Kuehling    2017-12-08  1847  			return -ENOMEM;
520b8fb755ccfb Felix Kuehling    2017-12-08  1848  
520b8fb755ccfb Felix Kuehling    2017-12-08  1849  		memset(sub_type_hdr, 0, sizeof(struct crat_subtype_iolink));
520b8fb755ccfb Felix Kuehling    2017-12-08  1850  
520b8fb755ccfb Felix Kuehling    2017-12-08  1851  		/* Fill in subtype header data */
520b8fb755ccfb Felix Kuehling    2017-12-08  1852  		sub_type_hdr->type = CRAT_SUBTYPE_IOLINK_AFFINITY;
520b8fb755ccfb Felix Kuehling    2017-12-08  1853  		sub_type_hdr->length = sizeof(struct crat_subtype_iolink);
520b8fb755ccfb Felix Kuehling    2017-12-08  1854  		sub_type_hdr->flags = CRAT_SUBTYPE_FLAGS_ENABLED;
520b8fb755ccfb Felix Kuehling    2017-12-08  1855  
520b8fb755ccfb Felix Kuehling    2017-12-08  1856  		/* Fill in IO link data */
520b8fb755ccfb Felix Kuehling    2017-12-08  1857  		sub_type_hdr->proximity_domain_from = numa_node_id;
520b8fb755ccfb Felix Kuehling    2017-12-08  1858  		sub_type_hdr->proximity_domain_to = nid;
520b8fb755ccfb Felix Kuehling    2017-12-08  1859  		sub_type_hdr->io_interface_type = link_type;
520b8fb755ccfb Felix Kuehling    2017-12-08  1860  
520b8fb755ccfb Felix Kuehling    2017-12-08  1861  		(*num_entries)++;
520b8fb755ccfb Felix Kuehling    2017-12-08  1862  		sub_type_hdr++;
520b8fb755ccfb Felix Kuehling    2017-12-08  1863  	}
520b8fb755ccfb Felix Kuehling    2017-12-08  1864  
520b8fb755ccfb Felix Kuehling    2017-12-08  1865  	return 0;
520b8fb755ccfb Felix Kuehling    2017-12-08  1866  }
d1c234e2cd1091 Felix Kuehling    2019-01-02  1867  #endif
520b8fb755ccfb Felix Kuehling    2017-12-08  1868  

:::::: The code at line 1833 was first introduced by commit
:::::: 520b8fb755ccfb07d8d743da5753cff1fcb74b9f drm/amdkfd: Add topology support for CPUs

:::::: TO: Felix Kuehling <Felix.Kuehling@amd.com>
:::::: CC: Oded Gabbay <oded.gabbay@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
