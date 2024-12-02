Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91791DDC39;
	Mon,  2 Dec 2024 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733168603; cv=none; b=suoSwVrqeFivXktkmhvDSbHmuzTKpfsYiUX7/R3MBQaFbXahQfOLvNdSNCn9J7EaL4Sg4M9YZeRkPXOqKz/4BPKjqzMtFawZmFJbt2rnML++LJuGRqVegEjo5FgEX5L+HXnrKKGblYHVzzUCZDO1jCT6PUicj6fmL15Kucvac9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733168603; c=relaxed/simple;
	bh=GEQZ+5VP0bAMXs4OdjIffS9/4coWZF1Fol1t8/IgCrE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ka3Hpu46Wrvh8y59Gnsg6xa0sc4uZXAbgVvVh/R6XMe9pty6EBi8PfbKFOTdmCqeGENo8++JY04F+OnBo6V927ZgIjJH8i+CQwwsqbGn2zZrhUWlDk567cKtSTSt0oTvy0X4MvE22+NgRIe+ZRm5USgIJpaEazJs2sGAU1CHVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODzeNDwt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODzeNDwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733168601; x=1764704601;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GEQZ+5VP0bAMXs4OdjIffS9/4coWZF1Fol1t8/IgCrE=;
  b=ODzeNDwt616TQ1euhLjyV80bC1S7hOKbmJs5NZ5p4MxhBacTPi0nqXve
   bUSWaggaeWcBSR805V0Rw65fwl2jx9xYt0S2w24Ln3zrdd1+Ipou7tmq4
   vL2krbciInkNCPXeSSGvK4Ap6nyiAYXWq/Ordr0j8P6yuLPP5ZCoyghGa
   9/TibSHaEjpleEygqrTkqjes1kYJ+6Kv25GoHlts85VMJMl5k7j92fvSB
   64jOyVUrmG4O+TNGx4JgBcDoOTcTUo9TafmhWy6sdLwpZxpxjXpy6eaYz
   vLscE5eFKSjMwy4PkcnIzJIDv596yxJZcRSDpd/EobVla5x/CsJ/KR+UP
   Q==;
X-CSE-ConnectionGUID: bOuXwsoYQjaEXnxSr6KaAA==
X-CSE-MsgGUID: ukBbO+5QTBSbMDlh4osTlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33098667"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33098667"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 11:43:20 -0800
X-CSE-ConnectionGUID: 0eGbb2gPS+GzFb35E7IlQQ==
X-CSE-MsgGUID: 9B2/oYt6T3CXmQKSquCNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="97636239"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2024 11:43:19 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tICJt-0002pV-1q;
	Mon, 02 Dec 2024 19:43:02 +0000
Date: Tue, 3 Dec 2024 03:42:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 46/48] drivers/iommu/amd/iommu.o: warning:
 objtool: amd_iommu_domain_alloc_paging_flags+0x5d: unreachable instruction
Message-ID: <202412030303.5Ho0p8Ps-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   87e70b0c76695339b0163fde25b260773b0720c2
commit: 0667c7244f231f7ef13c6b7cb5a37e47e5303b31 [46/48] iommu/amd: Fully decode all combinations of alloc_paging_flags
config: x86_64-buildonly-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030303.5Ho0p8Ps-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030303.5Ho0p8Ps-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030303.5Ho0p8Ps-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/amd/iommu.c:12:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
>> drivers/iommu/amd/iommu.o: warning: objtool: amd_iommu_domain_alloc_paging_flags+0x5d: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
