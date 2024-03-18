Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5D57E5;
	Mon, 18 Mar 2024 00:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710720780; cv=none; b=HeVwOR5StUljQ8zJchg291ScaEN0apUSyjFrUMfK9YWA4O7jv8pSPRu7OLYk/2LYD/VGWZ8apoiyEomoZMdqHzu8i3df1MpNkZvX2nlAHG7X49lzw6fqr38VKhUJ5GBfWCtdGQ7n6Z6DksLG3nBHhNYo+JaUsLcFOl0Jm4KUPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710720780; c=relaxed/simple;
	bh=Cs0OKod9yH/HM6P8pMomhUKUlQ3g5N4neRzvIUY9Un8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3DV6tDlXwGEJdeILYgg29/jifaQOIPZ6VAZHtcNZFsUj6MIpRJg5d0mAoI7fwsUqyvel0q8iP7+dba5P/Y1fFZeORKNp0HLHvqS/jyPmBoAMUNtNQHTqQzG9lpe668lmpTW6KgFeCtQnPAjiqNvyPVKXOYrJiOHRI1pm3+TAco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqA5Ga57; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqA5Ga57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710720778; x=1742256778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cs0OKod9yH/HM6P8pMomhUKUlQ3g5N4neRzvIUY9Un8=;
  b=aqA5Ga57DkZZKj5Uzqt25UH6Agnn/asfAxUhjaqvN+4jpzoHhYNIFwmg
   /ICgE0/UREV++A/BdgKxkcfPpnl3GtSh/UrV+xKmEaAr5lHgIR3jZWFqd
   uM33+1zSenTAZtluGgCN6vPjre+IYOBAtkWgx3BPLH2UjNK4NBYIz3MJP
   upnipciBzvOJOW6/9FLoYaqxIru0u2Opy7cxHsewkWPKQLtlqUdNmkdVm
   NGYEWddesOXYu9q3kEwEFAtJDdAIc7C6l4OCNblXkq2y30nCBQ/AeDbM5
   Qepva+tQVLv7MQtCUDt9PE39DJOhcBJtDiuF/lBUjxBOhYhkOlG5NzhvL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="27999270"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="27999270"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 17:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="17775568"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2024 17:12:55 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rm0cX-000GXT-0m;
	Mon, 18 Mar 2024 00:12:53 +0000
Date: Mon, 18 Mar 2024 08:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:pr/279 461/930]
 drivers/pci/controller/pcie-apple.c:468:19: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202403180821.wFeXhgVk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/279
head:   15d2163ed4a2934b567a1cb2c59678ba1190b35c
commit: 14e757895aac48640f68ee98fd5f198a2251442c [461/930] PCIE: apple: Add T602x PCIe support
config: powerpc-randconfig-001-20240317 (https://download.01.org/0day-ci/archive/20240318/202403180821.wFeXhgVk-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403180821.wFeXhgVk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180821.wFeXhgVk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pcie-apple.c:468:19: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
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
