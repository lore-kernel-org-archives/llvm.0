Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6882749D6;
	Tue, 15 Jul 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579964; cv=none; b=f/JXQ0XP7SON1ACoLi+7YKLUabbrRrezIhmTLMzJoFvswMWT5Sh9FbcjXDEdJz6/LQkpjSUqSMrivBYqm3YsiZ9fZfghMZMTORlckb8pGVvV3Rz51dGUWRZbjsfhEmVd2C1/IIMDfPsOP1l8P96zWf/+vCyXE2zwJoBCVZpCXDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579964; c=relaxed/simple;
	bh=Bl8ubUcX6Wqz2eRa57smRLBv/RX6F0j6kSapZWAB62I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtKwtFa3LaWpgrtBydBgPSgYmtthOR/ASnWMpgUYD7CXHbNNzwictPQfNxMwqQ/OiuYkAEwSn2WPHdwNYKF/aa8tMZirixAVTtewtRvcKOt+klIC7PgnvCbtyqL0eJDCABEvTrhCTPnryMJiNKjP35p8/cg6Fp6kMQ+vIb1StxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGASFfIC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGASFfIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752579963; x=1784115963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bl8ubUcX6Wqz2eRa57smRLBv/RX6F0j6kSapZWAB62I=;
  b=TGASFfICyP13dZXc027/tWmR0cu9zOtKXjZEzaGq8IipIviGLEHPLG3b
   HNWfu5Cuw887Kbnr6hYI+GDobLZ5rBkEayYaPpJ0lXqczcyWgwKr8I0OF
   Q+NusaqDhlaZlfOZP/4h/oaRrmc1CH2a7yExJUuG8rJGtra+9gUyLOynS
   C8SIpBSrFcsH6Z3amOad68DTgQCB3/84qNygtY/LYAsa2rISiIqsU3Zsq
   PrM6/0g7EShqLQNFTxCfWKoWW++xs+CfiW7wYJRGUFy/vjYEwtVA/crXM
   3M0e7/PRTO53e8FZtJX4rmJ9aGeSE8K0ciUobmgN+av7PIXe13ydZSqVh
   w==;
X-CSE-ConnectionGUID: wCk74iiSSwSnypAR11VMQw==
X-CSE-MsgGUID: YGBm8jLbRgO8Z26b2au3Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77331281"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="77331281"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 04:46:03 -0700
X-CSE-ConnectionGUID: RhL/4HMhQCC2HmXSC8t4zQ==
X-CSE-MsgGUID: Zx67pv9FSZuEOtncrx4TVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="156611040"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jul 2025 04:46:01 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ube6g-000A11-1w;
	Tue, 15 Jul 2025 11:45:58 +0000
Date: Tue, 15 Jul 2025 19:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 89/111] include/linux/pci.h:2067:10: error: use
 of undeclared identifier 'PCI_NON_ISOLATED'; did you mean
 'PCIE_NON_ISOLATED'?
Message-ID: <202507151912.onVtH7Ez-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   e000b8ef9dfd9937d5f4ede1f01acc25aa68146d
commit: b5ea9e13dfa7409c2029e765c38161280d103135 [89/111] PCI: Add pci_bus_isolation()
config: arm-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151912.onVtH7Ez-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507151912.onVtH7Ez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151912.onVtH7Ez-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu.c:24:
>> include/linux/pci.h:2067:10: error: use of undeclared identifier 'PCI_NON_ISOLATED'; did you mean 'PCIE_NON_ISOLATED'?
    2067 | { return PCI_NON_ISOLATED; }
         |          ^~~~~~~~~~~~~~~~
         |          PCIE_NON_ISOLATED
   include/linux/pci.h:850:2: note: 'PCIE_NON_ISOLATED' declared here
     850 |         PCIE_NON_ISOLATED,
         |         ^
   include/linux/pci.h:2066:24: warning: no previous prototype for function 'pci_bus_isolated' [-Wmissing-prototypes]
    2066 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^
   include/linux/pci.h:2066:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2066 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         | ^
         | static 
   1 warning and 1 error generated.


vim +2067 include/linux/pci.h

  2065	
  2066	enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
> 2067	{ return PCI_NON_ISOLATED; }
  2068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
