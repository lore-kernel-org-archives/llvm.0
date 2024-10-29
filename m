Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3101FF5F0;
	Tue, 29 Oct 2024 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730227407; cv=none; b=bKmKIygT4baxvFUa2CuBwjRJB2ecLneeAUODZO6hmFttuWgYl7rBhh9q2z4CPpPR+9P11UO+IqbtNuDlrhi6xEZG14MnzqBhli078ENVlaSsevumro4vU53Y3DKdQDZzJnQLNI6kV8AqCivng50KCdcesgDPk0NzyGvpRW4/qr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730227407; c=relaxed/simple;
	bh=Mog5EHZwzJWObHAo/8dGnwOmguGy13F5/ZamcVvxXBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EPj8ba0CYyVY+C2eW0u6Wt5PO1dMwduMIDtzVICN8OSA8hYozb4SKU0U+93KVjb0TGmyKttXHFSruAukbM/kCLw1RBns4q5QvoVGtRuLqFfzdFuctsja4uFZQsUhy60M+hgebS3tG9rSzIehpXf6LsIfM6O3Nr8TagakbTte/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDWtq/fW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDWtq/fW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730227406; x=1761763406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mog5EHZwzJWObHAo/8dGnwOmguGy13F5/ZamcVvxXBw=;
  b=nDWtq/fWYsr30Fl62kaPTlRqCE/bRW+sVlkBYtAPKnV52N+4PSHlu2NV
   HLx/7Y6f2GGHZmO4ycpwT3hxJKmcTUxVwtuwgzcGPwC4D1GyBMeplGSYl
   YIOk9JneaF8/pXLSBWF0D7yS2e4Lwd5lyWsV8DNwcO/ZQ2RDDutVNarIs
   4tj4Fel2XBRQxSL/zRlVxmu2V7hgiP0o7AOcfM6TdDDwmHPTTHPRaF97a
   TwhLbAfLVuOSU51rdO+Z/EcCailOLjQhHwLf3ZLoTyZtAn2ZwRqIE2JiC
   I/v8C0raxguGOiL87t7DyVhleK/c9fhttqU/VGY9yTPGZzXZJsduv5ZXm
   A==;
X-CSE-ConnectionGUID: rRyzBJ8DRC2Su6/wL887rA==
X-CSE-MsgGUID: cNmAAA1yS/SovT8aPNWa5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="30005062"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="30005062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 11:43:23 -0700
X-CSE-ConnectionGUID: hKQ6fF6URmmtMITDZTx54A==
X-CSE-MsgGUID: m3twcks4TUu7HehP/mhXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82206712"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2024 11:43:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5rBW-000e0D-2r;
	Tue, 29 Oct 2024 18:43:18 +0000
Date: Wed, 30 Oct 2024 02:42:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Joerg Roedel <jroedel@suse.de>, Lu Baolu <baolu.lu@linux.intel.com>
Subject: [iommu:core 4/22] drivers/gpu/drm/msm/msm_iommu.c:110:2: error: call
 to undeclared function 'iommu_flush_iotlb_all'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202410300204.aNMc5Ykp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c
commit: 69e5a17511f654db0fe058d22719cef008c9faf1 [4/22] iommu: Remove useless flush from iommu_create_device_direct_mappings()
config: arm64-randconfig-002-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300204.aNMc5Ykp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300204.aNMc5Ykp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300204.aNMc5Ykp-lkp@intel.com/

Note: the iommu/core HEAD a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/msm_iommu.c:7:
   In file included from include/linux/adreno-smmu-priv.h:9:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
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
>> drivers/gpu/drm/msm/msm_iommu.c:110:2: error: call to undeclared function 'iommu_flush_iotlb_all'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |         iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
         |         ^
   drivers/gpu/drm/msm/msm_iommu.c:110:2: note: did you mean 'local_flush_tlb_all'?
   arch/arm64/include/asm/tlbflush.h:257:20: note: 'local_flush_tlb_all' declared here
     257 | static inline void local_flush_tlb_all(void)
         |                    ^
   4 warnings and 1 error generated.


vim +/iommu_flush_iotlb_all +110 drivers/gpu/drm/msm/msm_iommu.c

70bccecfcaf6c5 Rob Clark      2022-08-23   90  
b145c6e65eb05e Jordan Crouse  2020-08-17   91  static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
b145c6e65eb05e Jordan Crouse  2020-08-17   92  		size_t size)
b145c6e65eb05e Jordan Crouse  2020-08-17   93  {
b145c6e65eb05e Jordan Crouse  2020-08-17   94  	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
b145c6e65eb05e Jordan Crouse  2020-08-17   95  	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
b145c6e65eb05e Jordan Crouse  2020-08-17   96  
b145c6e65eb05e Jordan Crouse  2020-08-17   97  	while (size) {
70bccecfcaf6c5 Rob Clark      2022-08-23   98  		size_t unmapped, pgsize, count;
70bccecfcaf6c5 Rob Clark      2022-08-23   99  
70bccecfcaf6c5 Rob Clark      2022-08-23  100  		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
70bccecfcaf6c5 Rob Clark      2022-08-23  101  
70bccecfcaf6c5 Rob Clark      2022-08-23  102  		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
70bccecfcaf6c5 Rob Clark      2022-08-23  103  		if (!unmapped)
70bccecfcaf6c5 Rob Clark      2022-08-23  104  			break;
70bccecfcaf6c5 Rob Clark      2022-08-23  105  
70bccecfcaf6c5 Rob Clark      2022-08-23  106  		iova += unmapped;
70bccecfcaf6c5 Rob Clark      2022-08-23  107  		size -= unmapped;
b145c6e65eb05e Jordan Crouse  2020-08-17  108  	}
b145c6e65eb05e Jordan Crouse  2020-08-17  109  
93b694d096cc10 Linus Torvalds 2020-10-15 @110  	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
b145c6e65eb05e Jordan Crouse  2020-08-17  111  
70bccecfcaf6c5 Rob Clark      2022-08-23  112  	return (size == 0) ? 0 : -EINVAL;
b145c6e65eb05e Jordan Crouse  2020-08-17  113  }
b145c6e65eb05e Jordan Crouse  2020-08-17  114  

:::::: The code at line 110 was first introduced by commit
:::::: 93b694d096cc10994c817730d4d50288f9ae3d66 Merge tag 'drm-next-2020-10-15' of git://anongit.freedesktop.org/drm/drm

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
