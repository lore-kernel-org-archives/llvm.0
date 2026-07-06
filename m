Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B962D0C62;
	Mon,  6 Jul 2026 05:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315546; cv=none; b=SAtnGrAdV/38VznUw4J1jdTuX9nuKqLDXpDNl49cEU9X6nU7HYHfwGlSt6jA/zdIe9waPGq6ZQyBoDnyFtHPi1aG/3hZ/R6XEwblLNYiHJ3ywhKFqwUJ3fUHy+yFu062TqGJo81FU+nOE6TQyQ8eRNC5FZYLU21VmG9TnrC2MaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315546; c=relaxed/simple;
	bh=VjpgKAsd8WF1z+sfS9IVUUWQHHjO0kkRrnEGHEBtpSY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C9OjXOoMPksG/Atdso31bjiDBZPPCNpXv5eRhDSHwpSltcCkoYubM7dPI4ZtgbnlbCyH71Q7NZCwQnTxIz66aiUxPHNad2pqbapKr66A0nez+xV8rHqvU1PcxitU+WoEVjvwixZMwyOpXPr8xik5Qnnctt6CE9Fe8z18o2865uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrZdaltU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrZdaltU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783315545; x=1814851545;
  h=date:from:to:cc:subject:message-id;
  bh=VjpgKAsd8WF1z+sfS9IVUUWQHHjO0kkRrnEGHEBtpSY=;
  b=UrZdaltUdmHlbZu5IxV0JpekMOkk5szpzlsH90Bz70P2x1H2iSpKRX4x
   5xaZRk4xzw4PDcgYfCa/sXjj0OAyTHmvkEE271H563TecvXqHKT5MurPJ
   +JbKyuviVkkneWEJJT4IgY583OVGytEZgVuWw6rwDiUf3lgjSmLaRvXBN
   phzhMBwD+pKQv5qpbt2wIP/GJvhmtGxTCrM4H5rt6iZZCnN9tsM0fqalR
   NMvZ3pgtH9vThrxuZFubcYrnqMnKnM9faUMiWdHgDmDpHxUdZSh7uGdoi
   EwIAj4I1P7b602dZbkew7czq7CX/xwOU1csmIHuGpa/D1PoJt7mN1397F
   g==;
X-CSE-ConnectionGUID: iAyhwl4zR1ajBw9OOdaS8w==
X-CSE-MsgGUID: K31p17QTQYew6IU6kkKNng==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95096192"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95096192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:25:44 -0700
X-CSE-ConnectionGUID: p5hrieDPQeqRkoS5ua3flA==
X-CSE-MsgGUID: iJggGaz7Qfy5NWl3BG7JAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="251876389"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Jul 2026 22:25:43 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgbpm-00000000E6R-3pcL;
	Mon, 06 Jul 2026 05:25:36 +0000
Date: Mon, 06 Jul 2026 13:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <djbw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [devsec-tsm:devsec-phase2 13/24]
 include/linux/pci-tsm.h:190:13: error: no member named 'ide_cap' in 'struct
 pci_dev'; did you mean 'devcap'?
Message-ID: <202607061540.myoxX79B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm devsec-phase2
head:   fca18645f5a7726a7d2723322a520ecff3e72b45
commit: a2be27064cb1e7ccb165e331527d1123a4df0fc9 [13/24] PCI, device core: Add private memory access for DEVICE_TRUST_TCB
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260706/202607061540.myoxX79B-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061540.myoxX79B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061540.myoxX79B-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci-driver.c:22:
>> include/linux/pci-tsm.h:190:13: error: no member named 'ide_cap' in 'struct pci_dev'; did you mean 'devcap'?
     190 |                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
         |                           ^~~~~~~
         |                           devcap
   include/linux/pci.h:377:7: note: 'devcap' declared here
     377 |         u32             devcap;         /* PCIe Device Capabilities */
         |                         ^
   1 error generated.


vim +190 include/linux/pci-tsm.h

f224c20c3d76138 Dan Williams 2026-03-02  166  
3225f52cde56f46 Dan Williams 2025-10-31  167  /* physical function0 and capable of 'connect' */
3225f52cde56f46 Dan Williams 2025-10-31  168  static inline bool is_pci_tsm_pf0(struct pci_dev *pdev)
3225f52cde56f46 Dan Williams 2025-10-31  169  {
3225f52cde56f46 Dan Williams 2025-10-31  170  	if (!pdev)
3225f52cde56f46 Dan Williams 2025-10-31  171  		return false;
3225f52cde56f46 Dan Williams 2025-10-31  172  
3225f52cde56f46 Dan Williams 2025-10-31  173  	if (!pci_is_pcie(pdev))
3225f52cde56f46 Dan Williams 2025-10-31  174  		return false;
3225f52cde56f46 Dan Williams 2025-10-31  175  
3225f52cde56f46 Dan Williams 2025-10-31  176  	if (pdev->is_virtfn)
3225f52cde56f46 Dan Williams 2025-10-31  177  		return false;
3225f52cde56f46 Dan Williams 2025-10-31  178  
3225f52cde56f46 Dan Williams 2025-10-31  179  	/*
3225f52cde56f46 Dan Williams 2025-10-31  180  	 * Allow for a Device Security Manager (DSM) associated with function0
3225f52cde56f46 Dan Williams 2025-10-31  181  	 * of an Endpoint to coordinate TDISP requests for other functions
3225f52cde56f46 Dan Williams 2025-10-31  182  	 * (physical or virtual) of the device, or allow for an Upstream Port
3225f52cde56f46 Dan Williams 2025-10-31  183  	 * DSM to accept TDISP requests for the Endpoints downstream of the
3225f52cde56f46 Dan Williams 2025-10-31  184  	 * switch.
3225f52cde56f46 Dan Williams 2025-10-31  185  	 */
3225f52cde56f46 Dan Williams 2025-10-31  186  	switch (pci_pcie_type(pdev)) {
3225f52cde56f46 Dan Williams 2025-10-31  187  	case PCI_EXP_TYPE_ENDPOINT:
3225f52cde56f46 Dan Williams 2025-10-31  188  	case PCI_EXP_TYPE_UPSTREAM:
3225f52cde56f46 Dan Williams 2025-10-31  189  	case PCI_EXP_TYPE_RC_END:
3225f52cde56f46 Dan Williams 2025-10-31 @190  		if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
3225f52cde56f46 Dan Williams 2025-10-31  191  			break;
3225f52cde56f46 Dan Williams 2025-10-31  192  		fallthrough;
3225f52cde56f46 Dan Williams 2025-10-31  193  	default:
3225f52cde56f46 Dan Williams 2025-10-31  194  		return false;
3225f52cde56f46 Dan Williams 2025-10-31  195  	}
3225f52cde56f46 Dan Williams 2025-10-31  196  
3225f52cde56f46 Dan Williams 2025-10-31  197  	return PCI_FUNC(pdev->devfn) == 0;
3225f52cde56f46 Dan Williams 2025-10-31  198  }
3225f52cde56f46 Dan Williams 2025-10-31  199  

:::::: The code at line 190 was first introduced by commit
:::::: 3225f52cde56f46789a4972d3c54df8a4d75f022 PCI/TSM: Establish Secure Sessions and Link Encryption

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
