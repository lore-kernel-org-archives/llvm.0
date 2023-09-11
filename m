Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FCA188;
	Mon, 11 Sep 2023 00:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694391038; x=1725927038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ACgnR0YhV3fY3rXZqE76fi6AVcC8mbdtp3ZCPUrIOdw=;
  b=kYnjYsLIL6FI2xXJ/qDRFIa0U6GnGtwJRedvbAqT0CaQtLtALOI467es
   iBf2HoOwaRTb7lsD053U0dSFbQSsoT/xvA73zXJU5r69EJSZ2jyqqYUpc
   irlBYcFgikisrAVDRTAUAAiFASAV11pzstaYUnI3UBM47tTwwb9cfHwvI
   gdrPS+y4X7zB3tkgoZlWPQYZCkXlBt/OwxPEHdvtDZ3zOj81fExmyActn
   1DL/YpFXI1PHOW1KineyvE9781J7iCnfafNJxSLS3UztXqZzL6oM7/P/j
   43v4fwRIT2VsNuCTtxID8N0mfuwogaDEZv3TdPAw/rxsXE4WaDMD98H9M
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="368202278"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="368202278"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 17:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="743133743"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="743133743"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Sep 2023 17:10:34 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfUVc-0005Zk-1q;
	Mon, 11 Sep 2023 00:10:32 +0000
Date: Mon, 11 Sep 2023 08:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:isp/heap-alloc 109/143] ld.lld: error: undefined symbol:
 drm_mm_init
Message-ID: <202309110842.6vzVlTIy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/heap-alloc
head:   fdd4fa0037948a22f3fff6d893e4ccb26cdb2396
commit: 4d8c45047d73f6f6d25ffe8c6abcf58c5d4b97a4 [109/143] media: apple: Add Apple ISP driver
config: hexagon-randconfig-r024-20230911 (https://download.01.org/0day-ci/archive/20230911/202309110842.6vzVlTIy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110842.6vzVlTIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110842.6vzVlTIy-lkp@intel.com/

Note: the asahilinux/isp/heap-alloc HEAD fdd4fa0037948a22f3fff6d893e4ccb26cdb2396 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_mm_init
   >>> referenced by isp-drv.c:176 (drivers/media/platform/apple/isp/isp-drv.c:176)
   >>>               drivers/media/platform/apple/isp/isp-drv.o:(apple_isp_init_iommu) in archive vmlinux.a
   >>> referenced by isp-drv.c:176 (drivers/media/platform/apple/isp/isp-drv.c:176)
   >>>               drivers/media/platform/apple/isp/isp-drv.o:(apple_isp_init_iommu) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_mm_takedown
   >>> referenced by isp-drv.c:181 (drivers/media/platform/apple/isp/isp-drv.c:181)
   >>>               drivers/media/platform/apple/isp/isp-drv.o:(apple_isp_init_iommu) in archive vmlinux.a
   >>> referenced by isp-drv.c:181 (drivers/media/platform/apple/isp/isp-drv.c:181)
   >>>               drivers/media/platform/apple/isp/isp-drv.o:(apple_isp_init_iommu) in archive vmlinux.a
   >>> referenced by isp-drv.c:199 (drivers/media/platform/apple/isp/isp-drv.c:199)
   >>>               drivers/media/platform/apple/isp/isp-drv.o:(apple_isp_free_iommu) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: drm_mm_insert_node_in_range
   >>> referenced by isp-iommu.c:94 (drivers/media/platform/apple/isp/isp-iommu.c:94)
   >>>               drivers/media/platform/apple/isp/isp-iommu.o:(isp_surf_reserve_iova) in archive vmlinux.a
   >>> referenced by isp-iommu.c:94 (drivers/media/platform/apple/isp/isp-iommu.c:94)
   >>>               drivers/media/platform/apple/isp/isp-iommu.o:(isp_surf_reserve_iova) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_mm_remove_node
   >>> referenced by isp-iommu.c:77 (drivers/media/platform/apple/isp/isp-iommu.c:77)
   >>>               drivers/media/platform/apple/isp/isp-iommu.o:(isp_surf_unreserve_iova) in archive vmlinux.a
   >>> referenced by isp-iommu.c:77 (drivers/media/platform/apple/isp/isp-iommu.c:77)
   >>>               drivers/media/platform/apple/isp/isp-iommu.o:(isp_surf_unreserve_iova) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TYPEC
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - PHY_APPLE_ATC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
