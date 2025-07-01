Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E0D22DFA3;
	Tue,  1 Jul 2025 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370325; cv=none; b=Op1BITlO0sDlxGg9At0fqRMhvsYMlso5LKZ68W63eSP+Hs7x+Dvw6/SoBQ5aLWaplRZgA5wvdcj84rXnv5qmcxn9iaRZ2UY/pI2ZfOI+Aymq1yXcheVq0dnTxIxvzoi1k/yGDtnkU8KiDclWORFA+5Lb7Fripz10rR8hPyFKZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370325; c=relaxed/simple;
	bh=aNPrlNO0LEQO9yhlQ7FyAqWQwiyb0Haxmp76a4+P4kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vF9nbueYk5Y6Y6x8Gy76y/Nj45pfFu/j57ehh8KJkbV9DqSBfJCoQJUBhnazHipGWEv5L7Qo5Pbbt6GleZfBDvdGA/rdIp7phu/1q4koEXgS1BZmlhQ9wg86fcMxk+TR4rYgo7G97ViLryIuP8Zwzi4IK8RV+PF+nQbfDm+klMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFKr+LrF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFKr+LrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751370324; x=1782906324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNPrlNO0LEQO9yhlQ7FyAqWQwiyb0Haxmp76a4+P4kQ=;
  b=bFKr+LrFFt3B+y4cQN5Rz36G/jC9HQRDXACpogy6eJ08F7i0kk6jmGyg
   guodMsP0FWJAtssUN68VMUXSyY2+SkHpT3bYDmge3sNUU0joNnLBiBba/
   wwIPK9EPPERMz1Ey+JLhhICw/VlR755ODgkWuk2U0+zL5DeDyvn+yprq2
   rJX0Dw4y2kGXfaDm0TBy/r3I1886r9UdFahikhDdKd/+Q+anG3vQVB2rw
   qFdwBpS7OEEK2musy9NpoDDrMKQDgr8kkhrB0MNJy2brtrHvRxitPxz9a
   r2XZN3l5oNtzC4NIaBvqsN91LiSS9nqRJ8CPjf/WEDPXXCZxLFH7Buy2t
   A==;
X-CSE-ConnectionGUID: 4wENHOcpSWSH2ZoyDdN3qg==
X-CSE-MsgGUID: kKRym84FQpazppuBKWK1YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53736472"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53736472"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 04:45:23 -0700
X-CSE-ConnectionGUID: y7Trj0I1QAi7xqqYwslJ+Q==
X-CSE-MsgGUID: T2fpWbg0QEmDR+xV/WXlXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="177417566"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2025 04:45:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWZQO-000a5w-0A;
	Tue, 01 Jul 2025 11:45:20 +0000
Date: Tue, 1 Jul 2025 19:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:pcie_switch_groups 5/12] include/linux/pci.h:2073:6:
 warning: no previous prototype for function 'pci_reachable_set'
Message-ID: <202507011916.pteA6lcS-lkp@intel.com>
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
commit: 49f0c1b95856536e454bf3a1ef7fc8409f1b587f [5/12] PCI: Add pci_reachable_set()
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20250701/202507011916.pteA6lcS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011916.pteA6lcS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011916.pteA6lcS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/dma/direct.c:16:
   In file included from include/linux/pci-p2pdma.h:14:
>> include/linux/pci.h:2073:6: warning: no previous prototype for function 'pci_reachable_set' [-Wmissing-prototypes]
    2073 | void pci_reachable_set(struct pci_dev *start, struct pci_alias_set *devfns,
         |      ^
   include/linux/pci.h:2073:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2073 | void pci_reachable_set(struct pci_dev *start, struct pci_alias_set *devfns,
         | ^
         | static 
   include/linux/pci.h:2079:10: error: use of undeclared identifier 'PCI_NON_ISOLATED'; did you mean 'PCIE_NON_ISOLATED'?
    2079 | { return PCI_NON_ISOLATED; }
         |          ^~~~~~~~~~~~~~~~
         |          PCIE_NON_ISOLATED
   include/linux/pci.h:854:2: note: 'PCIE_NON_ISOLATED' declared here
     854 |         PCIE_NON_ISOLATED,
         |         ^
   include/linux/pci.h:2078:24: warning: no previous prototype for function 'pci_bus_isolated' [-Wmissing-prototypes]
    2078 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^
   include/linux/pci.h:2078:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2078 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         | ^
         | static 
   kernel/dma/direct.c:148:20: warning: shift count >= width of type [-Wshift-count-overflow]
     148 |                     phys_limit < DMA_BIT_MASK(64) &&
         |                                  ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   3 warnings and 1 error generated.


vim +/pci_reachable_set +2073 include/linux/pci.h

  2072	
> 2073	void pci_reachable_set(struct pci_dev *start, struct pci_alias_set *devfns,
  2074			       bool (*reachable)(struct pci_dev *deva,
  2075						 struct pci_dev *devb))
  2076	{ }
  2077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
