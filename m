Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BC65D8FD;
	Thu, 14 Dec 2023 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdIBBNtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702570784; x=1734106784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TX3yegq8bAEU67PFkItXfadP/CfasLGOSt5guVXbS5Y=;
  b=WdIBBNtLR6GUGq+xE/NcbBp5orNitrgmCE7mZhVQnwnfM2qgvIP9WJd6
   i/S0pjzTSQ+hlAjQTHgWOLey4UjHqWGxxUwJjQZs0E99yN0dxqN+fSLbD
   FYhEXJTSXGclSG+y9urdPgAav0rs8NHkcEjimDvB76X+Yi58+JLzfKZuf
   3/HmLaQSh6cbpzmB4Dt8Zy9EzRapO2ZW14Dzql6bF+4XNLl3mvxHTzd+n
   F0Ye5NETUPxla5/C+dVTJ55VNrqB3eq6GPt3zVFbLZjNn8FBx9BvUsE4S
   MnTpEQQOUgcyKfAsvjTasseZ76Cjt8+UtEWvzD3112mLELhS/z0LTYAOp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394010617"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="394010617"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 08:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="767655458"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="767655458"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2023 08:19:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDoQy-000MI8-0B;
	Thu, 14 Dec 2023 16:19:38 +0000
Date: Fri, 15 Dec 2023 00:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: Donald Robson <donald.robson@imgtec.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Maxime Ripard <mripard@kernel.org>,
	Matt Coster <matt.coster@imgtec.com>,
	Sarah Walker <sarah.walker@imgtec.com>
Subject: [linux-next:master 1963/7726]
 drivers/gpu/drm/imagination/pvr_mmu.c:170: warning: Excess struct member
 'pvr_dev' description in 'pvr_mmu_backing_page'
Message-ID: <202312150042.9x4AerXV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   11651f8cb2e88372d4ed523d909514dc9a613ea3
commit: ff5f643de0bf27874c4033cd57a0bd034b5c7d11 [1963/7726] drm/imagination: Add GEM and VM related code
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231215/202312150042.9x4AerXV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150042.9x4AerXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150042.9x4AerXV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_mmu.c:170: warning: Excess struct member 'pvr_dev' description in 'pvr_mmu_backing_page'
   drivers/gpu/drm/imagination/pvr_mmu.c:285: warning: Function parameter or member 'flags' not described in 'pvr_mmu_backing_page_sync'
>> drivers/gpu/drm/imagination/pvr_mmu.c:1390: warning: Excess struct member 'sgt' description in 'pvr_mmu_op_context'
>> drivers/gpu/drm/imagination/pvr_mmu.c:1390: warning: Excess struct member 'sgt_offset' description in 'pvr_mmu_op_context'
>> drivers/gpu/drm/imagination/pvr_mmu.c:1390: warning: Excess struct member 'l1_prealloc_tables' description in 'pvr_mmu_op_context'
>> drivers/gpu/drm/imagination/pvr_mmu.c:1390: warning: Excess struct member 'l0_prealloc_tables' description in 'pvr_mmu_op_context'
>> drivers/gpu/drm/imagination/pvr_mmu.c:1390: warning: Excess struct member 'l1_free_tables' description in 'pvr_mmu_op_context'
>> drivers/gpu/drm/imagination/pvr_mmu.c:1390: warning: Excess struct member 'l0_free_tables' description in 'pvr_mmu_op_context'


vim +170 drivers/gpu/drm/imagination/pvr_mmu.c

   155	
   156	/**
   157	 * struct pvr_mmu_backing_page - Represents a single page used to back a page
   158	 *                              table of any level.
   159	 * @dma_addr: DMA address of this page.
   160	 * @host_ptr: CPU address of this page.
   161	 * @pvr_dev: The PowerVR device to which this page is associated. **For
   162	 *           internal use only.**
   163	 */
   164	struct pvr_mmu_backing_page {
   165		dma_addr_t dma_addr;
   166		void *host_ptr;
   167	/* private: internal use only */
   168		struct page *raw_page;
   169		struct pvr_device *pvr_dev;
 > 170	};
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
