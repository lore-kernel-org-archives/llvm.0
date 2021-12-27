Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93802C82
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640606961; x=1672142961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJZZTv/IUdPuDW6eBGrJtLGACruSQkiFODy3pTUkwtw=;
  b=lsqly9UfINeuaIO/jvXP2pRrizgS7DK23QFaZ3Z57c+GFb30+3te7YD4
   tP4niJVr/UGOG/YgyJvcTi7Gs3n9gMixpZNGsdgCzfYW0T35+R1u3Hqol
   hSRiqbMkHGSQjczI7Do76SHKEMMr90vpL4Ay3Hzk+jaAKWg0uGn/c6Jf9
   nByb6+zzL4YtaiFxvZqZCAwtPjuBkKrrqk4UZ5RMiq1HzukmxdnwUCejl
   EwD9NnjpWwJCcAZ8lte3eK3mcjlUMl9fKVRpCVf5tCfCC0f6y9mW70KIg
   7wl2byxHz6jXWMtRNUW0gu2Uv4cvy5ha0OsZOJ/cWVqQTwwTon1RlAobz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="238739702"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="238739702"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 04:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="686258241"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Dec 2021 04:09:19 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1ooY-0006Fj-Kx; Mon, 27 Dec 2021 12:09:18 +0000
Date: Mon, 27 Dec 2021 20:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Yi L <yi.l.liu@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [luxis1999-iommufd:iommufd-v5.16-rc3 24/26]
 include/linux/iommufd.h:30:1: error: expected identifier or '('
Message-ID: <202112272023.qjJGBBbz-lkp@intel.com>
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
head:   9194d1d84235002ef9e0ae8666bc205840e3be74
commit: e4e0ed3d842fc0ce3952d33315f3d4a56b6f91a4 [24/26] vfio/pci: Add VFIO_DEVICE_ATTACH_IOASPT
config: riscv-randconfig-r032-20211227 (https://download.01.org/0day-ci/archive/20211227/202112272023.qjJGBBbz-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/luxis1999/iommufd/commit/e4e0ed3d842fc0ce3952d33315f3d4a56b6f91a4
        git remote add luxis1999-iommufd https://github.com/luxis1999/iommufd
        git fetch --no-tags luxis1999-iommufd iommufd-v5.16-rc3
        git checkout e4e0ed3d842fc0ce3952d33315f3d4a56b6f91a4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/vfio/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/vfio.c:35:
>> include/linux/iommufd.h:30:1: error: expected identifier or '('
   {
   ^
   1 error generated.


vim +30 include/linux/iommufd.h

b72430a4d634e3 Jason Gunthorpe 2021-11-11  26  
b72430a4d634e3 Jason Gunthorpe 2021-11-11  27  #else /* !CONFIG_IOMMUFD */
b72430a4d634e3 Jason Gunthorpe 2021-11-11  28  static inline struct iommufd_device *
b72430a4d634e3 Jason Gunthorpe 2021-11-11  29  iommufd_bind_pci_device(int fd, struct pci_dev *pdev, u32 *id, u64 dev_cookie);
b72430a4d634e3 Jason Gunthorpe 2021-11-11 @30  {
b72430a4d634e3 Jason Gunthorpe 2021-11-11  31  	return ERR_PTR(-EOPNOTSUPP);
b72430a4d634e3 Jason Gunthorpe 2021-11-11  32  }
b72430a4d634e3 Jason Gunthorpe 2021-11-11  33  

:::::: The code at line 30 was first introduced by commit
:::::: b72430a4d634e343ee1bb83e3a9e6bd020f09252 iommufd: Add kAPI toward external drivers

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
