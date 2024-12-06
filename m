Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975E91F9AA0;
	Fri,  6 Dec 2024 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477693; cv=none; b=sE9r4hRD1/I0ZTdrg/qYwRTr0rITkX6hm13tRymn6AS62eQho7Jf1EIkRZvTGTzOScC0u69prkmgSkFxJk/clHD6EWJcrd7IrQVeHB2XpV1xlLRxNTTvhcTrrUiy7K0PJAhV1OXUu2wDV0+G1z59oNfaKUoh/PUQTc/dKz+J4k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477693; c=relaxed/simple;
	bh=OJ93jc/8CZFppiW918L6py9OvpQK5u6KGpuiynWLkNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JF9NBfxbJjK4ONbN/S7USAr23YOElx9wHuFZmOmRylPTi4BFmfGhy4eaGWUAq61yvAQ7np6GiOIYzd4cskm1mpmB9cG+tCsquolw2+ZLAyUOh+nRXPahjSEorsaYTmFlX1oz7v76jy24E1DHg39AfIKyavUlI8jyQyLixpYksfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixpjQq3C; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixpjQq3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733477691; x=1765013691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OJ93jc/8CZFppiW918L6py9OvpQK5u6KGpuiynWLkNw=;
  b=ixpjQq3C40hhjfbV9FTzGnyR0lcaA5ZDu4htNd/loqZj0UWmFZ4Ug9YZ
   qmqCmpQ1ybRsVmFFNIhztb+mwq9JSdHUIE1EfF9rF75k5ro374/fb4Vvy
   LOKtwrBt/lU7k6IZHcv8iUtcnvOBZFDHOYHqsdoNu0otWOFMfXomEyC16
   bQ/hrsQtNY0d4FUzGH+JqOPau3QCEFRZK/0JEOQ1dv/YEt6J0MNN/NH70
   Xm4roOpSHHUT1TomSZo1JErcvG4JdOXQyVUzxwSi2C5hjNG/cPMpsc8Hi
   JxaKV6vPzNx5OgCFgSSit5hF2S5jcAE/wwgKFMwV0MY0wh5i2eERuOtmD
   g==;
X-CSE-ConnectionGUID: MdLXS8HCR02E27gJiLuFsg==
X-CSE-MsgGUID: peQ35EvZSUuUlvURbs4rSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51239648"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="51239648"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 01:34:48 -0800
X-CSE-ConnectionGUID: QF6IMCYJSiq07fjoGsKgHQ==
X-CSE-MsgGUID: nmcOZkqGRXitfBLanw/sHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="98426320"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Dec 2024 01:34:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJUjV-0000tv-0M;
	Fri, 06 Dec 2024 09:34:45 +0000
Date: Fri, 6 Dec 2024 17:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] ata: Allocate PCI iomap table statically
Message-ID: <202412061718.1SLkj1kZ-lkp@intel.com>
References: <20241204171033.86804-3-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204171033.86804-3-pstanner@redhat.com>

Hi Philipp,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/ata-Allocate-PCI-iomap-table-statically/20241205-014059
base:   linus/master
patch link:    https://lore.kernel.org/r/20241204171033.86804-3-pstanner%40redhat.com
patch subject: [RFC PATCH 1/3] ata: Allocate PCI iomap table statically
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241206/202412061718.1SLkj1kZ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061718.1SLkj1kZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061718.1SLkj1kZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ata/pata_macio.c:18:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/pata_macio.c:1089:20: error: array type 'void *[6]' is not assignable
    1089 |         priv->host->iomap = &priv->tfregs;
         |         ~~~~~~~~~~~~~~~~~ ^
   4 warnings and 1 error generated.


vim +1089 drivers/ata/pata_macio.c

88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1048  
0ec24914675c482 Greg Kroah-Hartman     2012-12-21  1049  static int pata_macio_common_init(struct pata_macio_priv *priv,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1050  				  resource_size_t tfregs,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1051  				  resource_size_t dmaregs,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1052  				  resource_size_t fcregs,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1053  				  unsigned long irq)
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1054  {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1055  	struct ata_port_info		pinfo;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1056  	const struct ata_port_info	*ppi[] = { &pinfo, NULL };
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1057  	void __iomem			*dma_regs = NULL;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1058  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1059  	/* Fill up privates with various invariants collected from the
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1060  	 * device-tree
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1061  	 */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1062  	pata_macio_invariants(priv);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1063  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1064  	/* Make sure we have sane initial timings in the cache */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1065  	pata_macio_default_timings(priv);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1066  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1067  	/* Allocate libata host for 1 port */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1068  	memset(&pinfo, 0, sizeof(struct ata_port_info));
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1069  	pmac_macio_calc_timing_masks(priv, &pinfo);
9cbe056f6c467e7 Sergei Shtylyov        2011-02-04  1070  	pinfo.flags		= ATA_FLAG_SLAVE_POSS;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1071  	pinfo.port_ops		= &pata_macio_ops;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1072  	pinfo.private_data	= priv;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1073  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1074  	priv->host = ata_host_alloc_pinfo(priv->dev, ppi, 1);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1075  	if (priv->host == NULL) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1076  		dev_err(priv->dev, "Failed to allocate ATA port structure\n");
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1077  		return -ENOMEM;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1078  	}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1079  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1080  	/* Setup the private data in host too */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1081  	priv->host->private_data = priv;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1082  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1083  	/* Map base registers */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1084  	priv->tfregs = devm_ioremap(priv->dev, tfregs, 0x100);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1085  	if (priv->tfregs == NULL) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1086  		dev_err(priv->dev, "Failed to map ATA ports\n");
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1087  		return -ENOMEM;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1088  	}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01 @1089  	priv->host->iomap = &priv->tfregs;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1090  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1091  	/* Map DMA regs */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1092  	if (dmaregs != 0) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1093  		dma_regs = devm_ioremap(priv->dev, dmaregs,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1094  					sizeof(struct dbdma_regs));
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1095  		if (dma_regs == NULL)
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1096  			dev_warn(priv->dev, "Failed to map ATA DMA registers\n");
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1097  	}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1098  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1099  	/* If chip has local feature control, map those regs too */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1100  	if (fcregs != 0) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1101  		priv->kauai_fcr = devm_ioremap(priv->dev, fcregs, 4);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1102  		if (priv->kauai_fcr == NULL) {
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1103  			dev_err(priv->dev, "Failed to map ATA FCR register\n");
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1104  			return -ENOMEM;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1105  		}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1106  	}
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1107  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1108  	/* Setup port data structure */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1109  	pata_macio_setup_ios(&priv->host->ports[0]->ioaddr,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1110  			     priv->tfregs, dma_regs);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1111  	priv->host->ports[0]->private_data = priv;
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1112  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1113  	/* hard-reset the controller */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1114  	pata_macio_reset_hw(priv, 0);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1115  	pata_macio_apply_timings(priv->host->ports[0], 0);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1116  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1117  	/* Enable bus master if necessary */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1118  	if (priv->pdev && dma_regs)
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1119  		pci_set_master(priv->pdev);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1120  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1121  	dev_info(priv->dev, "Activating pata-macio chipset %s, Apple bus ID %d\n",
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1122  		 macio_ata_names[priv->kind], priv->aapl_bus_id);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1123  
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1124  	/* Start it up */
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1125  	priv->irq = irq;
c3b2889424c26f3 Tejun Heo              2010-05-19  1126  	return ata_host_activate(priv->host, irq, ata_bmdma_interrupt, 0,
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1127  				 &pata_macio_sht);
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1128  }
88358ab08944da7 Benjamin Herrenschmidt 2009-12-01  1129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
