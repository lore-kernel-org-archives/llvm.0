Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F21E3806BD;
	Fri, 30 Jan 2026 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769798439; cv=none; b=XDB6m31fKFmpEgVczwMfneMfa7UhROXd75RZ/Ftv1DFb3Jh6ykBkzgBZG18vpf4o1EzE+dP4OTpBbh01Kl/TMUs8JX8MXTPt621V67Cc1xhwD4ifIilqRbDvVu2xxrerLq7v3EhY/UYZ6E8iOhCma5sxx3FmVabm3GXvWL/Bk54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769798439; c=relaxed/simple;
	bh=pTzY3pqKQxb+aZ0edQQc0lDTSUa7XikNWWEWjeorMo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUVsDShBqTxOdsovmGe4tQB9RSi4qExZWWC/70qIx7xQsVWdndYWTLGrystCeaXrXX2PxVIlCgLx5o2f85stAxfJF3tRMY3hdnOMZMQXQ+90aYYYRo0JbYzmj1RjdFQRJxRAFFgb54f8VMwfW/daFkMl/eV79BXjGiqTqrENnh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6xrKFx/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6xrKFx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769798438; x=1801334438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pTzY3pqKQxb+aZ0edQQc0lDTSUa7XikNWWEWjeorMo0=;
  b=S6xrKFx/9qtwpmRzPzvRVVKIjZylax2b9KpEYpZc8eFhyUfg0d/8F3Yy
   8+c794uNrZsNL77yCCPExvgSo/KYjoeo/apjPSbjMrCdhltZwhmgjeU94
   pSHVQjpC71wm0DmCSccyifXNdT9WFkgJopdRna66honltgb0A4KZGZkah
   MJp5Te9hnV7AWIHuHmQW9YMIknydKxirnv0RXwyu5VjoVCFbckXOvUhp2
   sxPa9ggo5xg9na0Sv4l4D+jaNLT1OTOycPkdp/qnPu/gjB2Lhw6/lOAV2
   IVNREdl2Me5bZ+f+6j0Lij44sc+mDdmwIgTPOIXSaorgqvLcpvQkIuxFd
   w==;
X-CSE-ConnectionGUID: cEm9OCvHSEWwOCNwG8qHYQ==
X-CSE-MsgGUID: U0jx6pt4SK6P5HpF9Vqv4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="74906569"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="74906569"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 10:40:32 -0800
X-CSE-ConnectionGUID: Df/BIlV4QGu3l/SNdbt/1A==
X-CSE-MsgGUID: ENSQz7T/TbK4fNHvDWy15A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="213448805"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2026 10:40:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vltPp-00000000dEG-46DP;
	Fri, 30 Jan 2026 18:40:21 +0000
Date: Sat, 31 Jan 2026 02:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, peter.ujfalusi@gmail.com,
	vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	vigneshr@ti.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, r-sharma3@ti.com,
	gehariprasath@ti.com
Subject: Re: [PATCH v4 11/19] drivers: soc: ti: k3-ringacc: handle absence of
 tisci
Message-ID: <202601310206.DLRWFXou-lkp@intel.com>
References: <20260130110159.359501-12-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130110159.359501-12-s-adivi@ti.com>

Hi Sai,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on next-20260129]
[cannot apply to linus/master v6.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sai-Sree-Kartheek-Adivi/dmaengine-ti-k3-udma-move-macros-to-header-file/20260130-191306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260130110159.359501-12-s-adivi%40ti.com
patch subject: [PATCH v4 11/19] drivers: soc: ti: k3-ringacc: handle absence of tisci
config: arm-randconfig-001-20260131 (https://download.01.org/0day-ci/archive/20260131/202601310206.DLRWFXou-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310206.DLRWFXou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310206.DLRWFXou-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/soc/ti/k3-ringacc.c:17:
>> include/linux/soc/ti/ti_sci_inta_msi.h:17:15: warning: declaration of 'struct msi_domain_info' will not be visible outside of this function [-Wvisibility]
      17 |                                    struct msi_domain_info *info,
         |                                           ^
>> drivers/soc/ti/k3-ringacc.c:1506:11: error: no member named 'domain' in 'struct dev_msi_info'
    1506 |         dev->msi.domain = of_msi_get_domain(dev, dev->of_node,
         |         ~~~~~~~~ ^
   drivers/soc/ti/k3-ringacc.c:1508:16: error: no member named 'domain' in 'struct dev_msi_info'
    1508 |         if (!dev->msi.domain)
         |              ~~~~~~~~ ^
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]


vim +1506 drivers/soc/ti/k3-ringacc.c

95e7be062aea6d2 Grygorii Strashko  2020-09-11  1497  
40a2a7c395cf5d9 Grygorii Strashko  2020-07-24  1498  static int k3_ringacc_init(struct platform_device *pdev,
40a2a7c395cf5d9 Grygorii Strashko  2020-07-24  1499  			   struct k3_ringacc *ringacc)
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1500  {
95e7be062aea6d2 Grygorii Strashko  2020-09-11  1501  	const struct soc_device_attribute *soc;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1502  	void __iomem *base_fifo, *base_rt;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1503  	struct device *dev = &pdev->dev;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1504  	int ret, i;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1505  
34fff62827b254f Thomas Gleixner    2021-12-10 @1506  	dev->msi.domain = of_msi_get_domain(dev, dev->of_node,
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1507  					    DOMAIN_BUS_TI_SCI_INTA_MSI);
e50a76355c1d858 Jayesh Choudhary   2023-07-28  1508  	if (!dev->msi.domain)
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1509  		return -EPROBE_DEFER;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1510  
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1511  	ret = k3_ringacc_probe_dt(ringacc);
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1512  	if (ret)
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1513  		return ret;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1514  
95e7be062aea6d2 Grygorii Strashko  2020-09-11  1515  	soc = soc_device_match(k3_ringacc_socinfo);
95e7be062aea6d2 Grygorii Strashko  2020-09-11  1516  	if (soc && soc->data) {
95e7be062aea6d2 Grygorii Strashko  2020-09-11  1517  		const struct k3_ringacc_soc_data *soc_data = soc->data;
95e7be062aea6d2 Grygorii Strashko  2020-09-11  1518  
95e7be062aea6d2 Grygorii Strashko  2020-09-11  1519  		ringacc->dma_ring_reset_quirk = soc_data->dma_ring_reset_quirk;
95e7be062aea6d2 Grygorii Strashko  2020-09-11  1520  	}
95e7be062aea6d2 Grygorii Strashko  2020-09-11  1521  
f9dbb99748bab00 Zhang Zekun        2023-08-09  1522  	base_rt = devm_platform_ioremap_resource_byname(pdev, "rt");
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1523  	if (IS_ERR(base_rt))
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1524  		return PTR_ERR(base_rt);
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1525  
f9dbb99748bab00 Zhang Zekun        2023-08-09  1526  	base_fifo = devm_platform_ioremap_resource_byname(pdev, "fifos");
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1527  	if (IS_ERR(base_fifo))
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1528  		return PTR_ERR(base_fifo);
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1529  
f9dbb99748bab00 Zhang Zekun        2023-08-09  1530  	ringacc->proxy_gcfg = devm_platform_ioremap_resource_byname(pdev, "proxy_gcfg");
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1531  	if (IS_ERR(ringacc->proxy_gcfg))
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1532  		return PTR_ERR(ringacc->proxy_gcfg);
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1533  
f9dbb99748bab00 Zhang Zekun        2023-08-09  1534  	ringacc->proxy_target_base = devm_platform_ioremap_resource_byname(pdev,
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1535  									   "proxy_target");
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1536  	if (IS_ERR(ringacc->proxy_target_base))
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1537  		return PTR_ERR(ringacc->proxy_target_base);
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1538  
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1539  	ringacc->num_proxies = readl(&ringacc->proxy_gcfg->config) &
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1540  				     K3_RINGACC_PROXY_CFG_THREADS_MASK;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1541  
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1542  	ringacc->rings = devm_kzalloc(dev,
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1543  				      sizeof(*ringacc->rings) *
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1544  				      ringacc->num_rings,
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1545  				      GFP_KERNEL);
a8eba8dde5fbf0b Christophe JAILLET 2021-12-23  1546  	ringacc->rings_inuse = devm_bitmap_zalloc(dev, ringacc->num_rings,
a8eba8dde5fbf0b Christophe JAILLET 2021-12-23  1547  						  GFP_KERNEL);
a8eba8dde5fbf0b Christophe JAILLET 2021-12-23  1548  	ringacc->proxy_inuse = devm_bitmap_zalloc(dev, ringacc->num_proxies,
a8eba8dde5fbf0b Christophe JAILLET 2021-12-23  1549  						  GFP_KERNEL);
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1550  
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1551  	if (!ringacc->rings || !ringacc->rings_inuse || !ringacc->proxy_inuse)
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1552  		return -ENOMEM;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1553  
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1554  	for (i = 0; i < ringacc->num_rings; i++) {
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1555  		ringacc->rings[i].rt = base_rt +
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1556  				       K3_RINGACC_RT_REGS_STEP * i;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1557  		ringacc->rings[i].fifos = base_fifo +
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1558  					  K3_RINGACC_FIFO_REGS_STEP * i;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1559  		ringacc->rings[i].parent = ringacc;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1560  		ringacc->rings[i].ring_id = i;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1561  		ringacc->rings[i].proxy_id = K3_RINGACC_PROXY_NOT_USED;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1562  	}
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1563  
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1564  	ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1565  
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1566  	dev_info(dev, "Ring Accelerator probed rings:%u, gp-rings[%u,%u] sci-dev-id:%u\n",
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1567  		 ringacc->num_rings,
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1568  		 ringacc->rm_gp_range->desc[0].start,
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1569  		 ringacc->rm_gp_range->desc[0].num,
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1570  		 ringacc->tisci_dev_id);
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1571  	dev_info(dev, "dma-ring-reset-quirk: %s\n",
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1572  		 ringacc->dma_ring_reset_quirk ? "enabled" : "disabled");
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1573  	dev_info(dev, "RA Proxy rev. %08x, num_proxies:%u\n",
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1574  		 readl(&ringacc->proxy_gcfg->revision), ringacc->num_proxies);
40a2a7c395cf5d9 Grygorii Strashko  2020-07-24  1575  
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1576  	return 0;
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1577  }
3277e8aa2504d97 Grygorii Strashko  2020-01-15  1578  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
