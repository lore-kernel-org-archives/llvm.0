Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0B615A864;
	Mon,  6 Jul 2026 01:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783301955; cv=none; b=VRs4fGOQCF5EzIF0TElLDr6YpaLK1kky9uR3e9/EramSeqje2b4qhxt+u57DkPJyIIqkEqssrrItwsKhSzuVisOd1BNfshEndj9uKHZVEtmTgulJBZNNwERv111wHcKAis6nbBuiWeo0Om6i1Kiap6mTigBKB18CjKcFYuvVXBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783301955; c=relaxed/simple;
	bh=Op/slMsb5UHOy/HOMqAdSgXqr3CWywrd9wzFnc+0nbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pBazjt137HJulCYEFgtYbUGSgixnnYuaDwaAUvbFK+It2XrXw7tLDL32OHU0TPWaH3cAn7LzGnLLq/SQwAB4BB4DObGy/leuLEC0BY6y0PmQ5VKhVHx3yva4uyWOwUanVya8/Y9nzwjx8RLuOo5DuBBQp/NhlwBqmhGb6SDAq+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqZcAVF1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqZcAVF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783301953; x=1814837953;
  h=date:from:to:cc:subject:message-id;
  bh=Op/slMsb5UHOy/HOMqAdSgXqr3CWywrd9wzFnc+0nbs=;
  b=fqZcAVF14dDBOCpyp/v+Oa6kt2dZD4E34VxeUF2Q5kS1DGo2S1Et2BPh
   60qp7eyVxh2hQNLL9cC6K7OxZVtvHmRJIavW4RNkHuDO01WRcRwBhstaY
   lZDu3T0f8B7nK8eIixuspvO4t7WGv/kOneISwlij3mi74krnGXthc/zwW
   jWFu50L4mKkGapfV07scQq3H/ETDnolgGo6kd7ckpa5Wy1bHIDAaiAgCi
   8FRiVQVrFNJ26dpkZGqe4NOR2isAcdQ0PFiuxA5aAKG5Q1BfneUjB/70g
   lxGDAMUW8EzXUvruivu68Vha8qMrO/NMOABBKfIaal4+BwOJTbZcd0bNA
   Q==;
X-CSE-ConnectionGUID: G6HQrgKiRoOaV+nE5oNxDA==
X-CSE-MsgGUID: 5KOZySFCQkatLzA5igmPzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="106726812"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="106726812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 18:39:12 -0700
X-CSE-ConnectionGUID: hnjZV1+jT1+61gIgUxiBRg==
X-CSE-MsgGUID: AwAErie/TtuwTU+qu9BczA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="250909428"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2026 18:39:10 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgYId-0000000022n-1nhC;
	Mon, 06 Jul 2026 01:39:07 +0000
Date: Mon, 06 Jul 2026 03:38:15 +0200
From: kernel test robot <lkp@intel.com>
To: Dan Williams <djbw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [devsec-tsm:devsec-phase2 13/24]
 include/linux/pci-tsm.h:190:13: error: no member named 'ide_cap' in 'struct
 pci_dev'
Message-ID: <202607060301.XwJgMU3N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm devsec-phase2
head:   fca18645f5a7726a7d2723322a520ecff3e72b45
commit: 21936ae130218b2976ee091c948248c5f84dcb71 [13/24] PCI, device core: Add private memory access for DEVICE_TRUST_TCB
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260706/202607060301.XwJgMU3N-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607060301.XwJgMU3N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607060301.XwJgMU3N-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci-driver.c:22:
>> include/linux/pci-tsm.h:190:13: error: no member named 'ide_cap' in 'struct pci_dev'
     190 |                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
         |                     ~~~~  ^
   1 error generated.


vim +190 include/linux/pci-tsm.h

6aa0f2799e2d90 Dan Williams 2026-03-02  166  
3225f52cde56f4 Dan Williams 2025-10-31  167  /* physical function0 and capable of 'connect' */
3225f52cde56f4 Dan Williams 2025-10-31  168  static inline bool is_pci_tsm_pf0(struct pci_dev *pdev)
3225f52cde56f4 Dan Williams 2025-10-31  169  {
3225f52cde56f4 Dan Williams 2025-10-31  170  	if (!pdev)
3225f52cde56f4 Dan Williams 2025-10-31  171  		return false;
3225f52cde56f4 Dan Williams 2025-10-31  172  
3225f52cde56f4 Dan Williams 2025-10-31  173  	if (!pci_is_pcie(pdev))
3225f52cde56f4 Dan Williams 2025-10-31  174  		return false;
3225f52cde56f4 Dan Williams 2025-10-31  175  
3225f52cde56f4 Dan Williams 2025-10-31  176  	if (pdev->is_virtfn)
3225f52cde56f4 Dan Williams 2025-10-31  177  		return false;
3225f52cde56f4 Dan Williams 2025-10-31  178  
3225f52cde56f4 Dan Williams 2025-10-31  179  	/*
3225f52cde56f4 Dan Williams 2025-10-31  180  	 * Allow for a Device Security Manager (DSM) associated with function0
3225f52cde56f4 Dan Williams 2025-10-31  181  	 * of an Endpoint to coordinate TDISP requests for other functions
3225f52cde56f4 Dan Williams 2025-10-31  182  	 * (physical or virtual) of the device, or allow for an Upstream Port
3225f52cde56f4 Dan Williams 2025-10-31  183  	 * DSM to accept TDISP requests for the Endpoints downstream of the
3225f52cde56f4 Dan Williams 2025-10-31  184  	 * switch.
3225f52cde56f4 Dan Williams 2025-10-31  185  	 */
3225f52cde56f4 Dan Williams 2025-10-31  186  	switch (pci_pcie_type(pdev)) {
3225f52cde56f4 Dan Williams 2025-10-31  187  	case PCI_EXP_TYPE_ENDPOINT:
3225f52cde56f4 Dan Williams 2025-10-31  188  	case PCI_EXP_TYPE_UPSTREAM:
3225f52cde56f4 Dan Williams 2025-10-31  189  	case PCI_EXP_TYPE_RC_END:
3225f52cde56f4 Dan Williams 2025-10-31 @190  		if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
3225f52cde56f4 Dan Williams 2025-10-31  191  			break;
3225f52cde56f4 Dan Williams 2025-10-31  192  		fallthrough;
3225f52cde56f4 Dan Williams 2025-10-31  193  	default:
3225f52cde56f4 Dan Williams 2025-10-31  194  		return false;
3225f52cde56f4 Dan Williams 2025-10-31  195  	}
3225f52cde56f4 Dan Williams 2025-10-31  196  
3225f52cde56f4 Dan Williams 2025-10-31  197  	return PCI_FUNC(pdev->devfn) == 0;
3225f52cde56f4 Dan Williams 2025-10-31  198  }
3225f52cde56f4 Dan Williams 2025-10-31  199  

:::::: The code at line 190 was first introduced by commit
:::::: 3225f52cde56f46789a4972d3c54df8a4d75f022 PCI/TSM: Establish Secure Sessions and Link Encryption

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
