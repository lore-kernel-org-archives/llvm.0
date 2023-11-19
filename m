Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E20814F70;
	Sun, 19 Nov 2023 21:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJU7KDHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700428410; x=1731964410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=riqWet8HXfDIQZJfEAm0iYiv/8/UpinCTdXsnwJuh3w=;
  b=cJU7KDHXT5g3xIZEzvYMx5qdNSSag9WF8n17eMO8zont+4zBv/ZBSab0
   thawx9DzkAOt7Bi8Zjkn1yqol3OcTLfb3OdKGP7P9BQjbKTkWO0MZq88G
   zNricGupqiaGoTJe7jyxsy1dbOCEIHn9N+RS6mY5gYcxTqIL7oXaNe63w
   sY4zPGDrhKsV/LYq6Qa7d0QU1wIkyXgPq7x83c71MBZk/d8TKMl20Awyj
   zNZzFp1A/mYiIb0g2ZqXWe740Jy8fVb32FAdTSGMbWCg6s8gW1PAZetGs
   1sk/SlPy8Gxw4Y1p0eP0kM81vhJPvDEi6kLRXJyi654/E+ND1CPFbwpAu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4694605"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="4694605"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 13:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="759641616"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="759641616"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Nov 2023 13:13:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4p6a-0005YF-2m;
	Sun, 19 Nov 2023 21:13:24 +0000
Date: Mon, 20 Nov 2023 05:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/140-pci 10/15]
 drivers/pci/controller/pcie-apple.c:468:19: error: implicit declaration of
 function 'FIELD_PREP' is invalid in C99
Message-ID: <202311200511.EremhnPW-lkp@intel.com>
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
commit: bc47733313473d25b60a7f875cf6f806d62a641d [10/15] PCIE: apple: Add T602x PCIe support
config: powerpc-randconfig-001-20231120 (https://download.01.org/0day-ci/archive/20231120/202311200511.EremhnPW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200511.EremhnPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200511.EremhnPW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pcie-apple.c:468:19: error: implicit declaration of function 'FIELD_PREP' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           writel_relaxed(FIELD_PREP(PORT_MSIMAP_TARGET, i) |
                                          ^
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
