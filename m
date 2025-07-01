Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F001DF73A;
	Tue,  1 Jul 2025 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364730; cv=none; b=TGlU040SIoc0H6fiASzldYaH/uaqFtNVcRue8//6JWTmMg93g0uQF/TZb6S/k/i1SdHox096J7XTj8kXP+BdQUagYdafydWULVPUfDptsifdJhqBSwf0E+zDof3VEatkKNT/81KqyS1Dr2Gz/WsKNyX3pyY0c0caCcW//H82Vco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364730; c=relaxed/simple;
	bh=/L06opar7gEBKcf9luZOR4l7KaWXt5JY5IFgFPqqtuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QRD5PmKgtYZmryqdiFa3tPg9Grca3WUUc1B4nvGwedH2WCSm+CFB+Vh9ZCZLHRizbb5ZmwOwRmudvGC5SIU5hgbdenhbFr6ynO1x+M2kPSu00V8YEcTYha2SxmCFE6P57mUWGpNg0caoHjH67Cemt7tyyE6mWCZ3M1AIPE2xktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/DjfuHC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/DjfuHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751364729; x=1782900729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/L06opar7gEBKcf9luZOR4l7KaWXt5JY5IFgFPqqtuY=;
  b=i/DjfuHCZiJiCFUyENDVaxmBApLkMlwNmGEtcFH3Y7c878RkyTkls8Mv
   2VEcl5KZ/DX/hVnN3vXPv0Eyw0bwUUdfOMgs+OmD6WCGShD/tidz5BxNh
   rkxLWPVREO2oJC+dYDlq6qnzUx0XBbFSifUDzMTcEP6uA0zn4xRKHiby8
   Crwztm6eSjP480yV0EOsN2YKykAF2k+bnEikTXvBphJglNnZy5ZjPyTVy
   cGPMfvoqYx0pCduaIZFjjX24WJZEWGRiDO+tkH7j2BfP4k54JouljGwfz
   fl0pRDG6Ta2yHgUaPX7hzHw3d3kO3o4B1l7QiHnYQsVu9MXub0hUCNmcY
   g==;
X-CSE-ConnectionGUID: CRHrjyAMRWur0bh1ADzeJQ==
X-CSE-MsgGUID: IQNhZJXCQ3uMkJVWsb7L5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53713788"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53713788"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:12:08 -0700
X-CSE-ConnectionGUID: BU/H/MFmTu6zr+F+vmtH4Q==
X-CSE-MsgGUID: MWaB8FRJSsqeE/lSwbfvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153894986"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jul 2025 03:12:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWXy8-000Zzm-2r;
	Tue, 01 Jul 2025 10:12:04 +0000
Date: Tue, 1 Jul 2025 18:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:pcie_switch_groups 2/12] include/linux/pci.h:2067:10:
 error: use of undeclared identifier 'PCI_NON_ISOLATED'; did you mean
 'PCIE_NON_ISOLATED'?
Message-ID: <202507011838.9E2bMQpg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   44fc32b44e9100467bc59704d09b5aca075ccb06
commit: 1ef9f1a958f948a7ed5a60048c5fc668838007d7 [2/12] PCI: Add pci_bus_isolation()
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20250701/202507011838.9E2bMQpg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011838.9E2bMQpg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011838.9E2bMQpg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/dma/direct.c:16:
   In file included from include/linux/pci-p2pdma.h:14:
>> include/linux/pci.h:2067:10: error: use of undeclared identifier 'PCI_NON_ISOLATED'; did you mean 'PCIE_NON_ISOLATED'?
    2067 | { return PCI_NON_ISOLATED; }
         |          ^~~~~~~~~~~~~~~~
         |          PCIE_NON_ISOLATED
   include/linux/pci.h:850:2: note: 'PCIE_NON_ISOLATED' declared here
     850 |         PCIE_NON_ISOLATED,
         |         ^
>> include/linux/pci.h:2066:24: warning: no previous prototype for function 'pci_bus_isolated' [-Wmissing-prototypes]
    2066 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^
   include/linux/pci.h:2066:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2066 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         | ^
         | static 
   kernel/dma/direct.c:148:20: warning: shift count >= width of type [-Wshift-count-overflow]
     148 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                                  ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   2 warnings and 1 error generated.


vim +2067 include/linux/pci.h

  2065	
> 2066	enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
> 2067	{ return PCI_NON_ISOLATED; }
  2068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
