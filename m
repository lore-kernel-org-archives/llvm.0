Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B518B1C28D;
	Fri,  6 Oct 2023 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b79RTl8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696588404; x=1728124404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=if2DbiSbXczOLktQKNmjPWjll0iHKhW6IGipZHwsYkw=;
  b=b79RTl8SEcIE5XFmnxeJd7M409ppPMR7SRk5jF7gJfxV4oJ4Yv7dRTmt
   lvzIZquX6Kpe5YKy08puCnajwFCJX+byxC+L7CIeqz2oTCfZM3fmTS5cs
   IrYFaoKWZDaQmV1HcMG1njkOrFFI0NhUsvV/JB+moGTY9tau7Gop4jaeV
   UdXjNcaZj3HMMNdJuhPtsMzAk+ioL19OMAQf8b94FC1XV/FmgZuCrrT6/
   XSmdXnlSDcnel4U575rVHO4iCMQ3M+lHyTKUf62ndGRcTrTYpvZ/lyK5n
   1HZkc8YMu5OWlrw+FJ73qTus8jPXRr1CpwTNYlAvPPIkpfIrNVOPWZ+9K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2328241"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="2328241"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 03:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895836965"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="895836965"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Oct 2023 03:31:49 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoi91-000MVi-0g;
	Fri, 06 Oct 2023 10:33:19 +0000
Date: Fri, 6 Oct 2023 18:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Subject: [pci:pm 2/2] arch/x86/pci/fixup.c:929:6: error: use of undeclared
 identifier 'pm_suspend_target_state'
Message-ID: <202310061830.A7jaXxeG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git pm
head:   624306d2c241c274e498619cabc2ae1dc7112ad1
commit: 624306d2c241c274e498619cabc2ae1dc7112ad1 [2/2] x86/PCI: Avoid PME from D3hot/D3cold for AMD Rembrandt and Phoenix USB4
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231006/202310061830.A7jaXxeG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310061830.A7jaXxeG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061830.A7jaXxeG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/pci/fixup.c:929:6: error: use of undeclared identifier 'pm_suspend_target_state'
           if (pm_suspend_target_state == PM_SUSPEND_ON)
               ^
>> arch/x86/pci/fixup.c:929:33: error: use of undeclared identifier 'PM_SUSPEND_ON'
           if (pm_suspend_target_state == PM_SUSPEND_ON)
                                          ^
>> arch/x86/pci/fixup.c:951:20: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           rp->pme_support = FIELD_GET(PCI_PM_CAP_PME_MASK, pmc);
                             ^
   3 errors generated.


vim +/pm_suspend_target_state +929 arch/x86/pci/fixup.c

   907	
   908	#ifdef CONFIG_SUSPEND
   909	/*
   910	 * Root Ports on some AMD SoCs advertise PME_Support for D3hot and D3cold, but
   911	 * if the SoC is put into a hardware sleep state by the amd-pmc driver, the
   912	 * Root Ports don't generate wakeup interrupts for USB devices.
   913	 *
   914	 * When suspending, remove D3hot and D3cold from the PME_Support advertised
   915	 * by the Root Port so we don't use those states if we're expecting wakeup
   916	 * interrupts.  Restore the advertised PME_Support when resuming.
   917	 */
   918	static void amd_rp_pme_suspend(struct pci_dev *dev)
   919	{
   920		struct pci_dev *rp;
   921	
   922		/*
   923		 * PM_SUSPEND_ON means we're doing runtime suspend, which means
   924		 * amd-pmc will not be involved so PMEs during D3 work as advertised.
   925		 *
   926		 * The PMEs *do* work if amd-pmc doesn't put the SoC in the hardware
   927		 * sleep state, but we assume amd-pmc is always present.
   928		 */
 > 929		if (pm_suspend_target_state == PM_SUSPEND_ON)
   930			return;
   931	
   932		rp = pcie_find_root_port(dev);
   933		if (!rp->pm_cap)
   934			return;
   935	
   936		rp->pme_support &= ~((PCI_PM_CAP_PME_D3hot|PCI_PM_CAP_PME_D3cold) >>
   937					    PCI_PM_CAP_PME_SHIFT);
   938		dev_info_once(&rp->dev, "quirk: disabling D3cold for suspend\n");
   939	}
   940	
   941	static void amd_rp_pme_resume(struct pci_dev *dev)
   942	{
   943		struct pci_dev *rp;
   944		u16 pmc;
   945	
   946		rp = pcie_find_root_port(dev);
   947		if (!rp->pm_cap)
   948			return;
   949	
   950		pci_read_config_word(rp, rp->pm_cap + PCI_PM_PMC, &pmc);
 > 951		rp->pme_support = FIELD_GET(PCI_PM_CAP_PME_MASK, pmc);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
