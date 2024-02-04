Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B618AF8;
	Sun,  4 Feb 2024 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707038423; cv=none; b=gUHUsdFtR1bhiK0l73GzpSs2KNaQAGzRJA/9+/SJR3VjCbqXfQqSt1XAPNSNsKjaq2cEAW6IaaHcIZAD1i3a11RHaMK4Z7OpvuSK4PoQQOLPWkPoDs2XFILS3gJCAq3MeTnu4m8iMrZd4J3YKCzJ9yY4mBog7opp+UdBwMvPGeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707038423; c=relaxed/simple;
	bh=7TIGgvPEyM1V+YuQrhRDKJIgCf2bFVMbHuUiITpiLO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mVu/74jKeSYrKmriGqpWXyTeUH0SJJlxuRjKjePrAr0n6HEqqe0sCiD4MOXGfSjZubrq02fKO9I7DYGWZG4r7dguhRYK8AC+pvD3uyew3sohGotPmBg/IJnBZeCJOorg5APU745XBGg4v0ZH5k4Sjmpcaoq+IymKuiwE3gl9lpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVTJBQEU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVTJBQEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707038421; x=1738574421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7TIGgvPEyM1V+YuQrhRDKJIgCf2bFVMbHuUiITpiLO4=;
  b=aVTJBQEUb/4zEMwemOhKu6mG0UOe2r01UhWg/S8bNH/QymXYxWTAjlWy
   hBm4t9C6fqruzgC5zLkGQkOwx+wOYjLOaobD4xg9xTQntWxgw+7AHXNlU
   AjVcVdOpLTVfEO5H3xnHdZjaGLU+oHAw2twHDSa0pNrwIt9xiITl/J0FK
   3HPf02R31BQqHa7rcm1HKJn+3XyLASKXcGOc8zeFEJuxewL/35jhIMOqN
   AqyBBhUGgvQMMON4GpnAZQgV8xhBmt+OwYojpYGEyfvdB7krnEw4COaVM
   v2G3oMNreK+hcM+6cq1SIs1wrKFuYXi2srxf47OOCkVRKngfjQoJY8y+y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="3342665"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="3342665"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 01:20:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="779587"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Feb 2024 01:20:19 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWYfg-0006CG-2l;
	Sun, 04 Feb 2024 09:20:16 +0000
Date: Sun, 4 Feb 2024 17:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/140-pci 9/14]
 drivers/pci/controller/pcie-apple.c:468:19: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202402041718.1Onw5Vz4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/140-pci
head:   58cab72f915e70990f9e2c9836b7cb6e79a9db35
commit: 92dbf7fc980de7b1736db46f5a7a3b45330aae72 [9/14] PCIE: apple: Add T602x PCIe support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240204/202402041718.1Onw5Vz4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041718.1Onw5Vz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041718.1Onw5Vz4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pcie-apple.c:468:19: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     468 |                         writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
         |                                        ^
   1 error generated.


vim +/FIELD_PREP +468 drivers/pci/controller/pcie-apple.c

   430	
   431	static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
   432	{
   433		struct fwnode_handle *fwnode = &port->np->fwnode;
   434		struct apple_pcie *pcie = port->pcie;
   435		unsigned int irq;
   436	
   437		/* FIXME: consider moving each interrupt under each port */
   438		irq = irq_of_parse_and_map(to_of_node(dev_fwnode(port->pcie->dev)),
   439					   port->idx);
   440		if (!irq)
   441			return -ENXIO;
   442	
   443		port->domain = irq_domain_create_linear(fwnode, 32,
   444							&apple_port_irq_domain_ops,
   445							port);
   446		if (!port->domain)
   447			return -ENOMEM;
   448	
   449		/* Disable all interrupts */
   450		writel_relaxed(~0, port->base + PORT_INTMSK);
   451		writel_relaxed(~0, port->base + PORT_INTSTAT);
   452		writel_relaxed(~0, port->base + PORT_LINKCMDSTS);
   453	
   454		irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
   455	
   456		/* Configure MSI base address */
   457		BUG_ON(upper_32_bits(DOORBELL_ADDR));
   458		writel_relaxed(lower_32_bits(DOORBELL_ADDR),
   459			       port->base + pcie->hw->port_msiaddr);
   460		if (pcie->hw->port_msiaddr_hi)
   461			writel_relaxed(0, port->base + pcie->hw->port_msiaddr_hi);
   462	
   463		/* Enable MSIs, shared between all ports */
   464		if (pcie->hw->port_msimap) {
   465			int i;
   466	
   467			for (i = 0; i < pcie->nvecs; i++) {
 > 468				writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
   469					       PORT_MSIMAP_ENABLE,
   470					       port->base + pcie->hw->port_msimap + 4 * i);
   471			}
   472	
   473			writel_relaxed(PORT_MSICFG_EN, port->base + PORT_MSICFG);
   474		} else {
   475			writel_relaxed(0, port->base + PORT_MSIBASE);
   476			writel_relaxed((ilog2(pcie->nvecs) << PORT_MSICFG_L2MSINUM_SHIFT) |
   477				PORT_MSICFG_EN, port->base + PORT_MSICFG);
   478		}
   479	
   480		return 0;
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
