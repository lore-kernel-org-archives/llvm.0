Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ED441757;
	Wed, 20 Dec 2023 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5CzihXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703087811; x=1734623811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRaauSRoiRO9g0uH6E5vV8toImwvDEX2lqb+jX8Q1Co=;
  b=e5CzihXTsYGRMUWCNPKD1/HAfUktElzi+Zpw4Nrjxpzdhiavf1AzkfRF
   iC42q63wqNH5MJKOGqlXrUEdG9Gbq1clFJjvfVjrb5QlPoGx7HY1kabMO
   x/kkJbzYNNdAD3fBkn5ttUhA9WJAdfGSqiRXxcK3lCpG1lVQhMd0Ccb+9
   bd0JPg6P8vmNkO1bu1U7Y5Q9i93Gj9xKEb8oW9MK4WFJy5vpT4OdGooy5
   nQgJrMd4VJWshwUlnLm2C6FBYrkV7gAZKxUUoR//t7Dnaa1NnL8i12Gj/
   681I2luZk4gcrBCTGbDfqvq2vaUah6+IlwXAA9xzv90+S+ElGE81FYiid
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="17387112"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="17387112"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 07:56:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="1023511526"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="1023511526"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 20 Dec 2023 07:56:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFyw8-000783-29;
	Wed, 20 Dec 2023 15:56:45 +0000
Date: Wed, 20 Dec 2023 23:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [linux-next:master 9106/9550] drivers/vfio/pci/virtio/main.c:550:6:
 warning: no previous prototype for function 'virtiovf_pci_aer_reset_done'
Message-ID: <202312202346.wk6hRusj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d857259d7d10cd0d5e8b60608455986167cfad
commit: eb61eca0e8c3efbdd6d3c9d2b7f70bf67e165f7d [9106/9550] vfio/virtio: Introduce a vfio driver over virtio devices
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231220/202312202346.wk6hRusj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312202346.wk6hRusj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312202346.wk6hRusj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/virtio/main.c:550:6: warning: no previous prototype for function 'virtiovf_pci_aer_reset_done' [-Wmissing-prototypes]
   void virtiovf_pci_aer_reset_done(struct pci_dev *pdev)
        ^
   drivers/vfio/pci/virtio/main.c:550:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void virtiovf_pci_aer_reset_done(struct pci_dev *pdev)
   ^
   static 
   1 warning generated.


vim +/virtiovf_pci_aer_reset_done +550 drivers/vfio/pci/virtio/main.c

   549	
 > 550	void virtiovf_pci_aer_reset_done(struct pci_dev *pdev)
   551	{
   552		struct virtiovf_pci_core_device *virtvdev = dev_get_drvdata(&pdev->dev);
   553	
   554		virtvdev->pci_cmd = 0;
   555	}
   556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
