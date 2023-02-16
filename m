Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655BCD308;
	Thu, 16 Feb 2023 23:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676590672; x=1708126672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7AMgvilRNLwf3K9kaQaCH6HZOzEM1WbNyNQ7YFBlje4=;
  b=b2b4X579on7a4H1D6NDf2lY2lkoj12EtIMObrXkiskzBNioo9/vgIi5A
   PXFrJJvkayVKd2BUCmFmbTWDk6Zs2yowkdHUQbSnNQpGnYWK9nS5xbBzB
   CcVk0gRHE3sVRnsg6EOaBm3/iaV3NnJJo/FrUfCyzD+QQxiGSoKe0Mcwh
   rG8J/THputce86IrcosW6PKEVaZzGsCd/TuJQj0/frbuDwJFR1elGGUNo
   DsTvyj4FYlCx3Pz19nG+gMot6IJcD8qCo5k2Ogbye/KDzak8Z3EzLbsHk
   qGESsCSpGWDUCir4gRxZJR16K/zM6CjqdcH2CAQbsXnw8H2fY98gspP4X
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333224471"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="333224471"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 15:37:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813173909"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="813173909"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2023 15:37:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSnoz-000Awz-38;
	Thu, 16 Feb 2023 23:37:49 +0000
Date: Fri, 17 Feb 2023 07:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommufd_hwpt 24/24]
 drivers/iommu/iommufd/device.c:556:5: warning: no previous prototype for
 function 'iommufd_device_replace'
Message-ID: <202302170723.ACFbZ9Ui-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommufd_hwpt
head:   466f0769b1793dd6185fe793dd5baf29acbdead9
commit: 466f0769b1793dd6185fe793dd5baf29acbdead9 [24/24] iommufd: Add iommufd_device_replace()
config: x86_64-randconfig-a002-20230213 (https://download.01.org/0day-ci/archive/20230217/202302170723.ACFbZ9Ui-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jgunthorpe/linux/commit/466f0769b1793dd6185fe793dd5baf29acbdead9
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd_hwpt
        git checkout 466f0769b1793dd6185fe793dd5baf29acbdead9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iommu/iommufd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170723.ACFbZ9Ui-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/device.c:556:5: warning: no previous prototype for function 'iommufd_device_replace' [-Wmissing-prototypes]
   int iommufd_device_replace(struct iommufd_device *idev, u32 *pt_id)
       ^
   drivers/iommu/iommufd/device.c:556:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iommufd_device_replace(struct iommufd_device *idev, u32 *pt_id)
   ^
   static 
   1 warning generated.


vim +/iommufd_device_replace +556 drivers/iommu/iommufd/device.c

   554	
   555	// FIXME kdoc
 > 556	int iommufd_device_replace(struct iommufd_device *idev, u32 *pt_id)
   557	{
   558		return iommufd_device_change_pt(idev, pt_id,
   559						&iommufd_device_do_replace);
   560	}
   561	EXPORT_SYMBOL_NS_GPL(iommufd_device_replace, IOMMUFD);
   562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
