Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74FE1C7008;
	Sat, 12 Apr 2025 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744473153; cv=none; b=S2A4IguAOU6ZF4+5+LWKVAsnATaoPydlUISRWc8uxr7aDiJT5xlgflOrY9PHW/ASkSWLrBBexkGzYHZJqJG18M3PRiSprrEsDM9mmqHOwLeeO32i/VkQyiqsSrWw9+Z0zkLxz6eJoIPQDZnniOqab+kftV6ORbc8igInlY07o+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744473153; c=relaxed/simple;
	bh=B8qAbUBaPBK6fc5OVdIES0Iw+G/Goh+7IwlDwmb0lXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JLHcGFQOEB/DVmKkfRQajkHt1yaIJZgKHoomqLVPvadomDQfBEh+CsWusBJ3QPvQTX1MjsnexRahxN0Ocws7C8gA0TRGsOYqUELPiAG9ykcSAqRsY3ecF8PyvLM7U4hHLLQFyvLNOyjBIdETIeL7WDdLr7n9UeHOTBDydaLIPbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAsxGClY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAsxGClY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744473152; x=1776009152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B8qAbUBaPBK6fc5OVdIES0Iw+G/Goh+7IwlDwmb0lXI=;
  b=WAsxGClYxPjvOla027doQ2pIe32jyRc++mHlA7SZ6YcAmRKDy6Pie2Ne
   O/90lB3DDGEFRdUnTQJli44I3geXUVnTmVOqXVVW4byU3y+F/fMC04Ffu
   kCnaPpPsvXGa8fedeL4DIJCUegmWZlMPGzNkcbiJ1TWytrJx/GpJsHdq7
   urnveKE7KonisSc0blBbmCB8q3/C+xkHKilmyRVYSuFtdCZ7C8QnWUElq
   fvovbvzEGft4HvZLeNH2/fSXyTVZDp4wDsM8vh7AvkDJo5UsATcDKX1e1
   azqckCZ/PGHZgYLQVMcAs5IYq5iy2poDS5Ih/BMu7VAhY6N5W2qjz/WYq
   g==;
X-CSE-ConnectionGUID: RzwPqSIITlauXLAJn10cPw==
X-CSE-MsgGUID: MaGm6H3BS1y2MNP8f0fULw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57369385"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="57369385"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 08:52:32 -0700
X-CSE-ConnectionGUID: DtgfkAciTHaUpluKpjAmOw==
X-CSE-MsgGUID: C/pxKSwWQxikmCJDScLmxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134534054"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Apr 2025 08:52:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3d9f-000Bts-2E;
	Sat, 12 Apr 2025 15:52:27 +0000
Date: Sat, 12 Apr 2025 23:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/unfudge_irq_bypass 69/72]
 arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:895:3: error:
 unknown type name 'u128'
Message-ID: <202504122327.ML6cln49-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/unfudge_irq_bypass
head:   eb313cd2befb6b7fdcab08d5c7d41ad3cb8f3ec2
commit: 90742a7369ff07f4d093b61b7205c5d4f77b81a1 [69/72] *** DO NOT MERGE *** iommu/amd: Hack to fake IRQ posting support
config: i386-buildonly-randconfig-003-20250412 (https://download.01.org/0day-ci/archive/20250412/202504122327.ML6cln49-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504122327.ML6cln49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504122327.ML6cln49-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/avic.c:31:
>> arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:895:3: error: unknown type name 'u128'
     895 |                 u128 data128[2];
         |                 ^
   arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h:1053:3: error: unknown type name 'u128'
    1053 |                 u128 irte;
         |                 ^
   2 errors generated.


vim +/u128 +895 arch/x86/include/../../../drivers/iommu/amd/amd_iommu_types.h

8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  888  
5694703f14b1f6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-07-11  889  /*
5694703f14b1f6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-07-11  890   * Structure defining one entry in the device table
5694703f14b1f6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-07-11  891   */
8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  892  struct dev_table_entry {
8b3f78733814b1 drivers/iommu/amd/amd_iommu_types.h Suravee Suthikulpanit 2024-11-18  893  	union {
ee6c28684585a6 drivers/iommu/amd_iommu_types.h     Joerg Roedel          2011-11-09  894  		u64 data[4];
8b3f78733814b1 drivers/iommu/amd/amd_iommu_types.h Suravee Suthikulpanit 2024-11-18 @895  		u128 data128[2];
8b3f78733814b1 drivers/iommu/amd/amd_iommu_types.h Suravee Suthikulpanit 2024-11-18  896  	};
8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  897  };
8d283c35a293e6 include/asm-x86/amd_iommu_types.h   Joerg Roedel          2008-06-26  898  

:::::: The code at line 895 was first introduced by commit
:::::: 8b3f78733814b180089a400743b6f19d118aec62 iommu/amd: Introduce helper function to update 256-bit DTE

:::::: TO: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
