Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E654173
	for <llvm@lists.linux.dev>; Fri, 10 Dec 2021 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639178423; x=1670714423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1RtvOPO5+DIS8Tgbu5czGCC3D3b2Ks7SPiZaM11Q20=;
  b=kb0hoATOW8sKmOVTDiPYIapI+QPOCw0XLC14TCuLNerkdqqPedxiszqy
   YMjTHtQKsC0BqCm+BudVlMjzOUgTTc4QAkXfvj2hsAkzsZUVBdJuOdb0m
   mAUlCNDwZtZmA9l0bJoxk37+rfaX1wyKaIH3m2cjeoRnjoF4l8wQzyxNr
   HBncptp6TCkmanO2Pf73gb5LIn3y//WZN6xzKRb8uhIBOz3FtuJ4iMm1Z
   R/2ud/QRSEbtUstAsyS+zDDNcEWzLpI0g5E77XGrUAockuL5QWhS8F8+e
   4doIjpqiqlgwNOV2Og5WK/99u7LWPs/8xdPdJX4U94yPvTG/zyJJvYvuX
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="235991539"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="235991539"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 15:20:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; 
   d="scan'208";a="504135333"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Dec 2021 15:20:21 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvpBc-0003nD-Jm; Fri, 10 Dec 2021 23:20:20 +0000
Date: Sat, 11 Dec 2021 07:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Yi L <yi.l.liu@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [luxis1999-iommufd:iommufd-v5.16-rc3 31/33] ld.lld: error: undefined
 symbol: interval_tree_span_iter_first
Message-ID: <202112110730.YDz5VfLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/luxis1999/iommufd iommufd-v5.16-rc3
head:   44f89b130eec28760e6b655facd4be49c5bcc3f9
commit: 74814fdbefe2fb370111a0ce00641c64376447cb [31/33] vfio/pci: Add bind_iommufd() support
config: arm64-randconfig-r014-20211210 (https://download.01.org/0day-ci/archive/20211211/202112110730.YDz5VfLg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/luxis1999/iommufd/commit/74814fdbefe2fb370111a0ce00641c64376447cb
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommufd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.16-rc3
        git checkout 74814fdbefe2fb370111a0ce00641c64376447cb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: interval_tree_span_iter_first
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_alloc_iova) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_alloc_iova) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_access_pages) in archive drivers/built-in.a
   >>> referenced 7 more times
--
>> ld.lld: error: undefined symbol: interval_tree_span_iter_next
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_alloc_iova) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_alloc_iova) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_access_pages) in archive drivers/built-in.a
   >>> referenced 7 more times
--
>> ld.lld: error: undefined symbol: interval_tree_iter_first
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_alloc_area) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_alloc_area) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_area_find_exact) in archive drivers/built-in.a
   >>> referenced 12 more times
--
>> ld.lld: error: undefined symbol: interval_tree_insert
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_area_finalize) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_access_pages) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_reserve_iova) in archive drivers/built-in.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: interval_tree_remove
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(__iopt_unmap_iova) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_remove_reserved_iova) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: interval_tree_iter_next
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_access_pages) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_unaccess_pages) in archive drivers/built-in.a
   >>> referenced by io_pagetable.c
   >>> iommu/iommufd/io_pagetable.o:(iopt_remove_reserved_iova) in archive drivers/built-in.a
   >>> referenced 5 more times

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMUFD
   Depends on IOMMU_SUPPORT
   Selected by
   - VFIO_PCI_CORE && VFIO && PCI && MMU

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
