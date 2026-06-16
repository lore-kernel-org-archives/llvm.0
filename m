Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1D1351C14;
	Tue, 16 Jun 2026 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608877; cv=none; b=tGr0IUESi7Bn6gJ20f7r0APuh+L5ky63NZS/CyqRZ7PhMKCCK99GcN1HdPm+WMAWYByyHEEILCVmvPdWJzKSpI+//O5RyhFSNa56ifes1bBNH28D+OQvvoAxclZv462Iw7UTQowiIcGBrN7Q/nSaIVTreAAF1IO7TgX1ls4pkJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608877; c=relaxed/simple;
	bh=d2QDAOopWS58mTE54t+KCOOqKveS2omG/dH5TrcN9Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoGjLaOmHcNLWDjtFnZQ3drrIZpWkKBQRd/NjOhn5e9ndMXVPJHYZVtUEGM/HJbRrj5cUJbJ3O3W0CeMIGt+BFWcph6rV7wTOhI/xP5bxIZk5lYesRifeZdg1qfSvKAvt6P9+sPDref2vCMa/TJNpg6nJWZ5USl4D8pWBc3SLEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBllKQGU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBllKQGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781608875; x=1813144875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d2QDAOopWS58mTE54t+KCOOqKveS2omG/dH5TrcN9Iw=;
  b=MBllKQGUNvOaeMNQSjBBOVdIFOWzS/eonc9BMKXrv488haBvy90cgqam
   GTDEJCt7hxkBtQGtAufc/1aCGzkMXqqqqaHB4z6VjL8N8ieKMpFMwNquW
   pXgOA11fqUTft0ul4iAwWVsQWYLQ3vj5p4XwbIybVriqkhbORYKfOHX+4
   qwFBY5y5j4t47Y56W2ZvhD1pTSgXMSkX+ir6KQNDS8JVEVwAVRlgwfE2p
   4SOCRhj5rMcaDqapVyPWt8zvOaRGoewjsO1k00EqOyPcVD22vQhDuqU5x
   OLJVn1JYlC7A0sR0vijspbrWouECdvApn7/xBTacD/UjFFOrEaLXxuRqo
   g==;
X-CSE-ConnectionGUID: Hbne2uDCQhSArjYaUJIRrA==
X-CSE-MsgGUID: 2GBCwQQnQWOCs6MMkbTjEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82567701"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82567701"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:21:15 -0700
X-CSE-ConnectionGUID: +hq2RhAMR7qHEDaSLChseA==
X-CSE-MsgGUID: jQAooTXuRzyhwWS+akm6vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="251664042"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jun 2026 04:21:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZRqx-00000000T5q-1OvR;
	Tue, 16 Jun 2026 11:21:11 +0000
Date: Tue, 16 Jun 2026 19:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Farhan Ali <alifm@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1] PCI: Remove pcie_flr() and convert all callers to
 use pcie_reset_flr()
Message-ID: <202606161907.f6NOdUr4-lkp@intel.com>
References: <20260615192200.3489-1-alifm@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615192200.3489-1-alifm@linux.ibm.com>

Hi Farhan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[also build test ERROR on tnguy-net-queue/dev-queue linus/master v7.1 next-20260615]
[cannot apply to pci/next pci/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Farhan-Ali/PCI-Remove-pcie_flr-and-convert-all-callers-to-use-pcie_reset_flr/20260616-034658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20260615192200.3489-1-alifm%40linux.ibm.com
patch subject: [RFC PATCH v1] PCI: Remove pcie_flr() and convert all callers to use pcie_reset_flr()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260616/202606161907.f6NOdUr4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161907.f6NOdUr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161907.f6NOdUr4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/netc/netc_main.c:890:2: error: call to undeclared function 'pcie_flr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     890 |         pcie_flr(pdev);
         |         ^
   1 error generated.
--
>> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:12281:4: error: call to undeclared function 'pcie_flr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    12281 |                         pcie_flr(vfdev);
          |                         ^
   1 error generated.


vim +/pcie_flr +890 drivers/net/dsa/netc/netc_main.c

187fbae024c843 Wei Fang 2026-05-18  881  
187fbae024c843 Wei Fang 2026-05-18  882  static int netc_switch_pci_init(struct pci_dev *pdev)
187fbae024c843 Wei Fang 2026-05-18  883  {
187fbae024c843 Wei Fang 2026-05-18  884  	struct device *dev = &pdev->dev;
187fbae024c843 Wei Fang 2026-05-18  885  	struct netc_switch_regs *regs;
187fbae024c843 Wei Fang 2026-05-18  886  	struct netc_switch *priv;
187fbae024c843 Wei Fang 2026-05-18  887  	void __iomem *base;
187fbae024c843 Wei Fang 2026-05-18  888  	int err;
187fbae024c843 Wei Fang 2026-05-18  889  
187fbae024c843 Wei Fang 2026-05-18 @890  	pcie_flr(pdev);
187fbae024c843 Wei Fang 2026-05-18  891  	err = pcim_enable_device(pdev);
187fbae024c843 Wei Fang 2026-05-18  892  	if (err)
187fbae024c843 Wei Fang 2026-05-18  893  		return dev_err_probe(dev, err, "Failed to enable device\n");
187fbae024c843 Wei Fang 2026-05-18  894  
187fbae024c843 Wei Fang 2026-05-18  895  	err = pcim_request_all_regions(pdev, KBUILD_MODNAME);
187fbae024c843 Wei Fang 2026-05-18  896  	if (err)
187fbae024c843 Wei Fang 2026-05-18  897  		return dev_err_probe(dev, err, "Failed to request regions\n");
187fbae024c843 Wei Fang 2026-05-18  898  
187fbae024c843 Wei Fang 2026-05-18  899  	/* The command BD rings and NTMP tables need DMA. No need to check
187fbae024c843 Wei Fang 2026-05-18  900  	 * the return value, because it never returns fail when the mask is
187fbae024c843 Wei Fang 2026-05-18  901  	 * DMA_BIT_MASK(64), see dma-api-howto.rst.
187fbae024c843 Wei Fang 2026-05-18  902  	 */
187fbae024c843 Wei Fang 2026-05-18  903  	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
187fbae024c843 Wei Fang 2026-05-18  904  
187fbae024c843 Wei Fang 2026-05-18  905  	if (pci_resource_len(pdev, NETC_REGS_BAR) < NETC_REGS_SIZE) {
187fbae024c843 Wei Fang 2026-05-18  906  		return dev_err_probe(dev, -EINVAL,
187fbae024c843 Wei Fang 2026-05-18  907  				     "Invalid register space size\n");
187fbae024c843 Wei Fang 2026-05-18  908  	}
187fbae024c843 Wei Fang 2026-05-18  909  
187fbae024c843 Wei Fang 2026-05-18  910  	base = pcim_iomap(pdev, NETC_REGS_BAR, 0);
187fbae024c843 Wei Fang 2026-05-18  911  	if (!base)
187fbae024c843 Wei Fang 2026-05-18  912  		return dev_err_probe(dev, -ENXIO, "pcim_iomap() failed\n");
187fbae024c843 Wei Fang 2026-05-18  913  
187fbae024c843 Wei Fang 2026-05-18  914  	pci_set_master(pdev);
187fbae024c843 Wei Fang 2026-05-18  915  
187fbae024c843 Wei Fang 2026-05-18  916  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
187fbae024c843 Wei Fang 2026-05-18  917  	if (!priv)
187fbae024c843 Wei Fang 2026-05-18  918  		return -ENOMEM;
187fbae024c843 Wei Fang 2026-05-18  919  
187fbae024c843 Wei Fang 2026-05-18  920  	priv->pdev = pdev;
187fbae024c843 Wei Fang 2026-05-18  921  	priv->dev = dev;
187fbae024c843 Wei Fang 2026-05-18  922  
187fbae024c843 Wei Fang 2026-05-18  923  	regs = &priv->regs;
187fbae024c843 Wei Fang 2026-05-18  924  	regs->base = base;
187fbae024c843 Wei Fang 2026-05-18  925  	regs->port = regs->base + NETC_REGS_PORT_BASE;
187fbae024c843 Wei Fang 2026-05-18  926  	regs->global = regs->base + NETC_REGS_GLOBAL_BASE;
187fbae024c843 Wei Fang 2026-05-18  927  	pci_set_drvdata(pdev, priv);
187fbae024c843 Wei Fang 2026-05-18  928  
187fbae024c843 Wei Fang 2026-05-18  929  	return 0;
187fbae024c843 Wei Fang 2026-05-18  930  }
187fbae024c843 Wei Fang 2026-05-18  931  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
