Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE4C10791;
	Thu, 19 Jan 2023 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674166316; x=1705702316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=720hzqJkKOEBUCg2o1FGiDnS5HJvDvJcXAm9KyKHMAo=;
  b=lYfzlzAAmLZl1/WqAUgEeyyEEYOU17FJIHpSdLyCNvyRi8BEfl9i2y86
   oTJZSJQ+98LEBh6zysQiV+yHMp669gcqVaGbLUz/ph9tJNih14HLPQjGv
   i/xegmfTEe/TxjaUBVTSb2eQoZuCikELSwOCa86WiHCrJIeng1PFvQrjT
   41K3lgDFn3DeKfToiLpLfv92ni8HEB4b8uS2/JpIXudOadM1DP9aDODMd
   qFxJQIzq4j1byoorFNMqgZQQT13+uj4GFfVctfXPtJ91rfqZ1IgcY2vQJ
   5l2O+CT3jICXoi38cqvXDIN80bbGYYqy40JVFcLkL0aqFQ7zctcCfHv8Y
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325480227"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="325480227"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 14:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690797664"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="690797664"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 14:11:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pId81-0001uG-0W;
	Thu, 19 Jan 2023 22:11:25 +0000
Date: Fri, 20 Jan 2023 06:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/200-dcp 48/81] drivers/iommu/dma-iommu.c:500:23:
 error: use of undeclared identifier 'IOMMU_RESV_TRANSLATED'; did you mean
 'IOMMU_RESV_RESERVED'?
Message-ID: <202301200632.Ax36n7Aa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   be63771800177191d2c5f7f31024cdb70671f710
commit: a0139ccbde88c52998b4268e14e01c68cdf49a49 [48/81] fixup! iommu: Parse translated reserved regions
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230120/202301200632.Ax36n7Aa-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/a0139ccbde88c52998b4268e14e01c68cdf49a49
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/200-dcp
        git checkout a0139ccbde88c52998b4268e14e01c68cdf49a49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iommu/dma-iommu.c:500:23: error: use of undeclared identifier 'IOMMU_RESV_TRANSLATED'; did you mean 'IOMMU_RESV_RESERVED'?
                   if (region->type == IOMMU_RESV_TRANSLATED) {
                                       ^~~~~~~~~~~~~~~~~~~~~
                                       IOMMU_RESV_RESERVED
   include/linux/iommu.h:145:2: note: 'IOMMU_RESV_RESERVED' declared here
           IOMMU_RESV_RESERVED,
           ^
>> drivers/iommu/dma-iommu.c:501:33: error: no member named 'dva' in 'struct iommu_resv_region'
                           lo = iova_pfn(iovad, region->dva);
                                                ~~~~~~  ^
   drivers/iommu/dma-iommu.c:502:33: error: no member named 'dva' in 'struct iommu_resv_region'
                           hi = iova_pfn(iovad, region->dva + region->length - 1);
                                                ~~~~~~  ^
   3 errors generated.


vim +500 drivers/iommu/dma-iommu.c

   476	
   477	static int iova_reserve_iommu_regions(struct device *dev,
   478			struct iommu_domain *domain)
   479	{
   480		struct iommu_dma_cookie *cookie = domain->iova_cookie;
   481		struct iova_domain *iovad = &cookie->iovad;
   482		struct iommu_resv_region *region;
   483		LIST_HEAD(resv_regions);
   484		int ret = 0;
   485	
   486		if (dev_is_pci(dev)) {
   487			ret = iova_reserve_pci_windows(to_pci_dev(dev), iovad);
   488			if (ret)
   489				return ret;
   490		}
   491	
   492		iommu_get_resv_regions(dev, &resv_regions);
   493		list_for_each_entry(region, &resv_regions, list) {
   494			unsigned long lo, hi;
   495	
   496			/* We ARE the software that manages these! */
   497			if (region->type == IOMMU_RESV_SW_MSI)
   498				continue;
   499	
 > 500			if (region->type == IOMMU_RESV_TRANSLATED) {
 > 501				lo = iova_pfn(iovad, region->dva);
   502				hi = iova_pfn(iovad, region->dva + region->length - 1);
   503			} else {
   504				lo = iova_pfn(iovad, region->start);
   505				hi = iova_pfn(iovad, region->start + region->length - 1);
   506			}
   507			reserve_iova(iovad, lo, hi);
   508	
   509			if (region->type == IOMMU_RESV_MSI)
   510				ret = cookie_init_hw_msi_region(cookie, region->start,
   511						region->start + region->length);
   512			if (ret)
   513				break;
   514		}
   515		iommu_put_resv_regions(dev, &resv_regions);
   516	
   517		return ret;
   518	}
   519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
