Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759E27A
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 05:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659072569; x=1690608569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKuMALVxva2Uqy0kcBA5fyBScndyplbEssthNOa8VdQ=;
  b=SrPIp1mccQl36x2q63eXH/mmW7yGP7z26FARNlocj9G+Xb9xDyTMOkJi
   sOceNMLmr+FNW/iDW6wKNgjqTCL/sdhdWmYCf/aqZU39uvv5e3/qcGb+5
   SrfNYjAcxIO0D2wwEYRjpU3e6hu0O8GFp8kYRAwWbb2THOOF9wUtcAyDy
   Kn9Puja/MjWQiY5T79BoSAeXngAfS9+C6I0yVfRppg7zfO+MDAMbw3dBu
   BIqi4RfSJcJvSmKL2G9df23CclVPXM8FoGyICbu+Mf5jy8lSDdIi/esig
   33owI8xOdJ+NjdFgvzR9fmd6t/kNRekgA+E6hxW7o36X5pAwMh5CFLSjJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="289464125"
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="289464125"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 22:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="576815045"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2022 22:29:24 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHIYt-000B98-1h;
	Fri, 29 Jul 2022 05:29:23 +0000
Date: Fri, 29 Jul 2022 13:28:51 +0800
From: kernel test robot <lkp@intel.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joerg Roedel <jroedel@suse.de>, Hanjun Guo <guohanjun@huawei.com>
Subject: [linux-next:master 6932/13542] drivers/acpi/arm64/iort.c:1406:2:
 error: call to undeclared function 'iort_iommu_rmr_get_resv_regions'; ISO
 C99 and later do not support implicit function declarations
Message-ID: <202207291335.1sImjcbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
commit: e302eea8f49717253ac64fd45b7cc719e87fa010 [6932/13542] ACPI/IORT: Add a helper to retrieve RMR info directly
config: arm64-buildonly-randconfig-r005-20220728 (https://download.01.org/0day-ci/archive/20220729/202207291335.1sImjcbY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e302eea8f49717253ac64fd45b7cc719e87fa010
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e302eea8f49717253ac64fd45b7cc719e87fa010
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/acpi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/acpi/arm64/iort.c:1406:2: error: call to undeclared function 'iort_iommu_rmr_get_resv_regions'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           iort_iommu_rmr_get_resv_regions(iommu_fwnode, NULL, head);
           ^
   drivers/acpi/arm64/iort.c:1406:2: note: did you mean 'iort_iommu_get_resv_regions'?
   drivers/acpi/arm64/iort.c:1329:6: note: 'iort_iommu_get_resv_regions' declared here
   void iort_iommu_get_resv_regions(struct device *dev, struct list_head *head)
        ^
   1 error generated.


vim +/iort_iommu_rmr_get_resv_regions +1406 drivers/acpi/arm64/iort.c

  1396	
  1397	/**
  1398	 * iort_get_rmr_sids - Retrieve IORT RMR node reserved regions with
  1399	 *                     associated StreamIDs information.
  1400	 * @iommu_fwnode: fwnode associated with IOMMU
  1401	 * @head: Resereved region list
  1402	 */
  1403	void iort_get_rmr_sids(struct fwnode_handle *iommu_fwnode,
  1404			       struct list_head *head)
  1405	{
> 1406		iort_iommu_rmr_get_resv_regions(iommu_fwnode, NULL, head);
  1407	}
  1408	EXPORT_SYMBOL_GPL(iort_get_rmr_sids);
  1409	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
