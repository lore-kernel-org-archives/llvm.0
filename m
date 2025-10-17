Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890CE248891;
	Sat, 18 Oct 2025 03:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760757221; cv=none; b=PAL9PfD2sV7p53dJXGLOE+o/4t6N1xr/Cjq6VObCF3Vlm9dXMw6pti3ZGjo8lg1IFhxRvS8rI0nDXUhKNlgJCByS49ZTgpNp8usC4F13Sf+5DwHLtfpCzuiuT676J3J0BQXcC5ENMbujPmmMjVjWuA7f3cX7OUmbhG7LfxQce8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760757221; c=relaxed/simple;
	bh=/L+7nWGWkNlsl9lUpSsZUra54FUuZ1H3XU/R+yyXpzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ooZIhEczY0wtCA3rvmypKSAa0dtF3It2O1F4e7xus8CkQtWyUonUDKx9jcoN0bAqhq/DiDhuzpHQM7FAJbS3EEkdcGUkB8vUIjkOIC1yXU3CO4+kUPNHROQnxnN5HW9Y8Q7kQNKGO6ZrJ4vMVWOj+xt6/WacgBaoK263w8EE9uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cD2q6Ags; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cD2q6Ags"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760757219; x=1792293219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/L+7nWGWkNlsl9lUpSsZUra54FUuZ1H3XU/R+yyXpzI=;
  b=cD2q6AgsIOiAcYHYZVD/YHFFw4/6S/I68mVdYP6PeZsldG0VSalWR9yj
   9U3tJSCN3w2WeHtLFKX2n0Jdxdgye1G/l0TW34XHUg9uJMgwUIFg1rg7T
   vKbEevBG1B09To3Q8oWdwLhe/KD37Iu7Zq3j+hn3j/rP6Nf9az15G7mfA
   IJ8cczfKp9jVK1hOmU055AqVadIZTTUvr5uB6pM/IbcdL0gNQzxHrim1l
   DGWFaopPzukdgaZ7q87uwRKr7VWDmA5oUbx9riHj/ws3TCWfQfPVkrQCH
   ZT6HzZf16CunHfLNsNbNCpGLoTD67U/7sfkf8ufCwbnM31SM61Lj+aVWK
   g==;
X-CSE-ConnectionGUID: XZn60/o8QFK6heOaRNE2ww==
X-CSE-MsgGUID: qgt3FNUDReuCOX+m3fSYTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62676638"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="62676638"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:13:38 -0700
X-CSE-ConnectionGUID: Ah9/WqR0QZaf4DugTosfDA==
X-CSE-MsgGUID: +HDCTTWETbe4/m87pRt0Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="187061301"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 17 Oct 2025 11:51:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9pYM-0007gv-06;
	Fri, 17 Oct 2025 18:51:50 +0000
Date: Sat, 18 Oct 2025 02:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_dmabuf 20/24] ld.lld: error: duplicate symbol:
 iommufd_test_dma_buf_iommufd_map
Message-ID: <202510180244.QPF0KYzq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_dmabuf
head:   e1e0600b1a5699114df3ae378cd69a7f953e5b3d
commit: 5849b503c1771ec07a34aca7fa51ef3788514f29 [20/24] iommufd/selftest: Add some tests for the dmabuf flow
config: i386-buildonly-randconfig-002-20251017 (https://download.01.org/0day-ci/archive/20251018/202510180244.QPF0KYzq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180244.QPF0KYzq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180244.QPF0KYzq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommufd/driver.c:4:
>> drivers/iommu/iommufd/iommufd_private.h:740:5: warning: no previous prototype for function 'iommufd_test_dma_buf_iommufd_map' [-Wmissing-prototypes]
     740 | int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
         |     ^
   drivers/iommu/iommufd/iommufd_private.h:740:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     740 | int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
         | ^
         | static 
   1 warning generated.
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            drivers/iommu/iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at viommu.c
   >>>            drivers/iommu/iommufd/viommu.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            drivers/iommu/iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at vfio_compat.c
   >>>            drivers/iommu/iommufd/vfio_compat.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            drivers/iommu/iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at pages.c
   >>>            drivers/iommu/iommufd/pages.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            drivers/iommu/iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at main.c
   >>>            drivers/iommu/iommufd/main.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            drivers/iommu/iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at ioas.c
   >>>            drivers/iommu/iommufd/ioas.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            drivers/iommu/iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at io_pagetable.c
   >>>            drivers/iommu/iommufd/io_pagetable.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            drivers/iommu/iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at hw_pagetable.c
   >>>            drivers/iommu/iommufd/hw_pagetable.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            drivers/iommu/iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at eventq.c
   >>>            drivers/iommu/iommufd/eventq.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at viommu.c
   >>>            iommufd/viommu.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: iommufd_test_dma_buf_iommufd_map
   >>> defined at device.c
   >>>            iommufd/device.o:(iommufd_test_dma_buf_iommufd_map)
   >>> defined at vfio_compat.c
   >>>            iommufd/vfio_compat.o:(.text+0x0)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
