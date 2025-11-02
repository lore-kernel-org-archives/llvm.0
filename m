Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41171219A71;
	Sun,  2 Nov 2025 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762115474; cv=none; b=kcj+B78WGk/egQr6/WjT5cl+s/oocZsoO77bt24ZlpSEK2Sh43hT6quc/KS7HFiNvmgPlBLYtDGFCtqNtAISOMYc+THdNLo7Mt2Ug2E9CCAcFpl3qBKiI5K7jXJJo2fj9UYuSnCDkoDCgEal6NYTEJA0jYQyavHZ3OHErLWdD+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762115474; c=relaxed/simple;
	bh=JW/4MbaqyJ4zuMwgRet+mesRRV/zhA7Xz0T6T6tbzPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u4ggD838dLZe/m5ug40YK3JjJZZB19BScLMZMZfk4F1rhxw5BShkIJ5YMzKVZe0xk/2q9F/teT8RvO9sWWIzKmS/lbyog2F9cMBrMNruj/2OUiTDPTAEDlJ1muO+IwSja0eKDWMude8XHiUgoYc3M+RF6opouC38Pf8tvqbwNXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgxJ8wqb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgxJ8wqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762115472; x=1793651472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JW/4MbaqyJ4zuMwgRet+mesRRV/zhA7Xz0T6T6tbzPY=;
  b=MgxJ8wqbfRFw7dVQkSXbGcJcJFy02RbcqJ9pL8xtu9zZXXQXrWKyolb1
   SK1wzFd6D20idBQ1T0pnlHcPKpKAOuWgLa97rGkjiM9ZaZF1mpnxQVaE9
   UzvnEOIx//b1BJijScouT4LUbYZ39R0L3kuVCt9MWIZzmLGZ3ncZr7UL7
   BlgyNg3SRgf8FsZ+h4BmIUxuGvijdqbNDwJNqmQNmEzWWFEQGU+206AOR
   XbVakE2M7k4sBhpQHMkVnbnYwOWCwh0Q+B/zdoz8OrqTrrz14/getElxt
   dFt1YnMiHnPoCESfYSywBHNjK4znBa6qzd9pujTy9ASMOTd4dFsQDYWTl
   w==;
X-CSE-ConnectionGUID: ogENDpIRS9eHGcw0+nQR2g==
X-CSE-MsgGUID: 1w7Hyyu0QsKvyxolgYA4fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="89660959"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="89660959"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 12:31:11 -0800
X-CSE-ConnectionGUID: r/V4yTuNQNGDki0cheljLg==
X-CSE-MsgGUID: 1+EH5Ek4SP6BJaSCtIoF1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="185940461"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 02 Nov 2025 12:31:10 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFejE-000PY8-0b;
	Sun, 02 Nov 2025 20:31:08 +0000
Date: Mon, 3 Nov 2025 04:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [devsec-tsm:staging 22/27] include/linux/pci-tsm.h:170:13: error: no
 member named 'ide_cap' in 'struct pci_dev'
Message-ID: <202511030412.Me2CaUE1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm staging
head:   eba5ca799114a6493e64a31dc8724a51d0bd6cf2
commit: 0e16ce0b9c64ed7ac06c9434853595ae98cb6499 [22/27] samples/devsec: Introduce a PCI device-security bus + endpoint sample
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251103/202511030412.Me2CaUE1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030412.Me2CaUE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030412.Me2CaUE1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from samples/devsec/link_tsm.c:6:
>> include/linux/pci-tsm.h:170:13: error: no member named 'ide_cap' in 'struct pci_dev'
     170 |                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
         |                     ~~~~  ^
   1 error generated.
--
   In file included from drivers/pci/tsm.c:15:
>> include/linux/pci-tsm.h:170:13: error: no member named 'ide_cap' in 'struct pci_dev'
     170 |                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
         |                     ~~~~  ^
>> drivers/pci/tsm.c:187:9: error: no member named 'ide_cap' in 'struct pci_dev'
     187 |                 pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
         |                 ~~~~  ^
   drivers/pci/tsm.c:187:37: error: no member named 'ide_cap' in 'struct pci_dev'
     187 |                 pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
         |                                             ~~~~  ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_TSM
   Depends on [n]: PCI [=y] && ARCH_HAS_CC_PLATFORM [=n]
   Selected by [m]:
   - SAMPLE_DEVSEC [=m] && SAMPLES [=y] && m [=m] && MODULES [=y] && PCI [=y] && VIRT_DRIVERS [=y] && (PCI_DOMAINS_GENERIC [=y] || X86)


vim +170 include/linux/pci-tsm.h

888b936770188b Dan Williams 2025-10-09  146  
722f1b0155cfba Dan Williams 2025-10-15  147  /* physical function0 and capable of 'connect' */
722f1b0155cfba Dan Williams 2025-10-15  148  static inline bool is_pci_tsm_pf0(struct pci_dev *pdev)
722f1b0155cfba Dan Williams 2025-10-15  149  {
722f1b0155cfba Dan Williams 2025-10-15  150  	if (!pdev)
722f1b0155cfba Dan Williams 2025-10-15  151  		return false;
722f1b0155cfba Dan Williams 2025-10-15  152  
722f1b0155cfba Dan Williams 2025-10-15  153  	if (!pci_is_pcie(pdev))
722f1b0155cfba Dan Williams 2025-10-15  154  		return false;
722f1b0155cfba Dan Williams 2025-10-15  155  
722f1b0155cfba Dan Williams 2025-10-15  156  	if (pdev->is_virtfn)
722f1b0155cfba Dan Williams 2025-10-15  157  		return false;
722f1b0155cfba Dan Williams 2025-10-15  158  
722f1b0155cfba Dan Williams 2025-10-15  159  	/*
722f1b0155cfba Dan Williams 2025-10-15  160  	 * Allow for a Device Security Manager (DSM) associated with function0
722f1b0155cfba Dan Williams 2025-10-15  161  	 * of an Endpoint to coordinate TDISP requests for other functions
722f1b0155cfba Dan Williams 2025-10-15  162  	 * (physical or virtual) of the device, or allow for an Upstream Port
722f1b0155cfba Dan Williams 2025-10-15  163  	 * DSM to accept TDISP requests for the Endpoints downstream of the
722f1b0155cfba Dan Williams 2025-10-15  164  	 * switch.
722f1b0155cfba Dan Williams 2025-10-15  165  	 */
722f1b0155cfba Dan Williams 2025-10-15  166  	switch (pci_pcie_type(pdev)) {
722f1b0155cfba Dan Williams 2025-10-15  167  	case PCI_EXP_TYPE_ENDPOINT:
722f1b0155cfba Dan Williams 2025-10-15  168  	case PCI_EXP_TYPE_UPSTREAM:
722f1b0155cfba Dan Williams 2025-10-15  169  	case PCI_EXP_TYPE_RC_END:
722f1b0155cfba Dan Williams 2025-10-15 @170  		if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
722f1b0155cfba Dan Williams 2025-10-15  171  			break;
722f1b0155cfba Dan Williams 2025-10-15  172  		fallthrough;
722f1b0155cfba Dan Williams 2025-10-15  173  	default:
722f1b0155cfba Dan Williams 2025-10-15  174  		return false;
722f1b0155cfba Dan Williams 2025-10-15  175  	}
722f1b0155cfba Dan Williams 2025-10-15  176  
722f1b0155cfba Dan Williams 2025-10-15  177  	return PCI_FUNC(pdev->devfn) == 0;
722f1b0155cfba Dan Williams 2025-10-15  178  }
722f1b0155cfba Dan Williams 2025-10-15  179  

:::::: The code at line 170 was first introduced by commit
:::::: 722f1b0155cfba90fd41d0bf884b0b5752c55fec PCI/TSM: Establish Secure Sessions and Link Encryption

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
