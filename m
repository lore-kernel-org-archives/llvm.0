Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2F2C032C;
	Sun,  3 May 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777821480; cv=none; b=h9b2p2PafO+3OF+OL/qqNhZQ8quYOtVNaNhdQDiuNmW62vfGYA2ppidTaF3iuJYi3eVEJcxTwdQCW87nDQ4edtzaCqAsmybIoyExI1KlpgR31kPdosnE+YzNOQqUAkEtTZXUMX6DLxdthpJGkRBDp4yrYTdcLFc4SPwUplsiJFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777821480; c=relaxed/simple;
	bh=LJPFvy0dKeB02KRnor9X0HOU426i8LRacYcLUr64yiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNZXhGKvoJlcttFQUj06gNrMDDcPE+rJSc3h8fSaWJKrt9UEtv3nXm4Ddqu74YUGeklhnNTiC+qVP979tyJf78NZd+cuEhJbE4qaL8b+oeih01sTuODfbNe2+L7oawMu1fsrtDKkZdTQdkOjmWEu9MxWMqBRDs+E9YSjhXpIBko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bzqb/yrD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bzqb/yrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777821477; x=1809357477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LJPFvy0dKeB02KRnor9X0HOU426i8LRacYcLUr64yiw=;
  b=Bzqb/yrDc1ugb74o173BOqNI9AG1XApe0t6uUaqlr2hkOvGav9wk/6xR
   hIjuelgrleDtjL+o7S1ZFlf37pXeOYjlN+/dyuUDR/Rz9bFfsZ7TvPSmD
   9Ue94AOi/Us3Rma9pe64cBHWX0P7AziBR0NW7yT9MWhSiTiT/Le1lP3TD
   Kk+zxiEgzyJn+tp4Mk7G+taUPyq6hODIrCULWxe79ap+/Dfaz4WPQ6D2C
   CO3vxDU2hei/irxgs7ri+eL1KWWegIZHRXPeZ3K1xW7TFxKiUu9P6RC0D
   mXXRmQQAMteruaSX0JB+eOM4SP81hyiJ/ldf6GcpxBZ9TdJ1jYi705qR3
   A==;
X-CSE-ConnectionGUID: lbldvzYxSSihIBLmKWjDbQ==
X-CSE-MsgGUID: zi11QqWJRNaKVHDNSCP+pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77723974"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="77723974"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 08:17:57 -0700
X-CSE-ConnectionGUID: i8LiTyp+T6KG8z44axlcyw==
X-CSE-MsgGUID: 3KoKVcm2RQy84JiN8cBStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="232151937"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2026 08:17:55 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJYZt-000000002ft-04jg;
	Sun, 03 May 2026 15:17:53 +0000
Date: Sun, 3 May 2026 23:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] firmware: ti_sci: simplify resource allocation
Message-ID: <202605032340.fMCE9leQ-lkp@intel.com>
References: <20260430221123.79947-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430221123.79947-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/firmware-ti_sci-simplify-resource-allocation/20260502-175729
base:   linus/master
patch link:    https://lore.kernel.org/r/20260430221123.79947-1-rosenp%40gmail.com
patch subject: [PATCH] firmware: ti_sci: simplify resource allocation
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605032340.fMCE9leQ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032340.fMCE9leQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605032340.fMCE9leQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/dma/ti/k3-udma.c:4689:15: error: array type 'struct ti_sci_resource_desc[]' is not assignable
    4689 |         irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
         |         ~~~~~~~~~~~~ ^
>> drivers/dma/ti/k3-udma.c:4690:15: warning: address of array 'irq_res.desc' will always evaluate to 'true' [-Wpointer-bool-conversion]
    4690 |         if (!irq_res.desc)
         |             ~~~~~~~~~^~~~
   drivers/dma/ti/k3-udma.c:4881:15: error: array type 'struct ti_sci_resource_desc[]' is not assignable
    4881 |         irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
         |         ~~~~~~~~~~~~ ^
   drivers/dma/ti/k3-udma.c:4882:15: warning: address of array 'irq_res.desc' will always evaluate to 'true' [-Wpointer-bool-conversion]
    4882 |         if (!irq_res.desc)
         |             ~~~~~~~~~^~~~
   drivers/dma/ti/k3-udma.c:5083:15: error: array type 'struct ti_sci_resource_desc[]' is not assignable
    5083 |         irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
         |         ~~~~~~~~~~~~ ^
   drivers/dma/ti/k3-udma.c:5084:15: warning: address of array 'irq_res.desc' will always evaluate to 'true' [-Wpointer-bool-conversion]
    5084 |         if (!irq_res.desc)
         |             ~~~~~~~~~^~~~
   3 warnings and 3 errors generated.


vim +4689 drivers/dma/ti/k3-udma.c

017794739702d4 Peter Ujfalusi      2020-12-08  4582  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4583  static int udma_setup_resources(struct udma_dev *ud)
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4584  {
017794739702d4 Peter Ujfalusi      2020-12-08  4585  	int ret, i, j;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4586  	struct device *dev = ud->dev;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4587  	struct ti_sci_resource *rm_res, irq_res;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4588  	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
017794739702d4 Peter Ujfalusi      2020-12-08  4589  	u32 cap3;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4590  
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4591  	/* Set up the throughput level start indexes */
017794739702d4 Peter Ujfalusi      2020-12-08  4592  	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4593  	if (of_device_is_compatible(dev->of_node,
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4594  				    "ti,am654-navss-main-udmap")) {
8844898028d412 Peter Ujfalusi      2020-12-08  4595  		ud->tchan_tpl.levels = 2;
8844898028d412 Peter Ujfalusi      2020-12-08  4596  		ud->tchan_tpl.start_idx[0] = 8;
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4597  	} else if (of_device_is_compatible(dev->of_node,
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4598  					   "ti,am654-navss-mcu-udmap")) {
8844898028d412 Peter Ujfalusi      2020-12-08  4599  		ud->tchan_tpl.levels = 2;
8844898028d412 Peter Ujfalusi      2020-12-08  4600  		ud->tchan_tpl.start_idx[0] = 2;
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4601  	} else if (UDMA_CAP3_UCHAN_CNT(cap3)) {
8844898028d412 Peter Ujfalusi      2020-12-08  4602  		ud->tchan_tpl.levels = 3;
8844898028d412 Peter Ujfalusi      2020-12-08  4603  		ud->tchan_tpl.start_idx[1] = UDMA_CAP3_UCHAN_CNT(cap3);
8844898028d412 Peter Ujfalusi      2020-12-08  4604  		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4605  	} else if (UDMA_CAP3_HCHAN_CNT(cap3)) {
8844898028d412 Peter Ujfalusi      2020-12-08  4606  		ud->tchan_tpl.levels = 2;
8844898028d412 Peter Ujfalusi      2020-12-08  4607  		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4608  	} else {
8844898028d412 Peter Ujfalusi      2020-12-08  4609  		ud->tchan_tpl.levels = 1;
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4610  	}
daf4ad0499aa4f Peter Ujfalusi      2020-07-17  4611  
8844898028d412 Peter Ujfalusi      2020-12-08  4612  	ud->rchan_tpl.levels = ud->tchan_tpl.levels;
8844898028d412 Peter Ujfalusi      2020-12-08  4613  	ud->rchan_tpl.start_idx[0] = ud->tchan_tpl.start_idx[0];
8844898028d412 Peter Ujfalusi      2020-12-08  4614  	ud->rchan_tpl.start_idx[1] = ud->tchan_tpl.start_idx[1];
8844898028d412 Peter Ujfalusi      2020-12-08  4615  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4616  	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4617  					   sizeof(unsigned long), GFP_KERNEL);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4618  	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4619  				  GFP_KERNEL);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4620  	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4621  					   sizeof(unsigned long), GFP_KERNEL);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4622  	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4623  				  GFP_KERNEL);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4624  	ud->rflow_gp_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rflow_cnt),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4625  					      sizeof(unsigned long),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4626  					      GFP_KERNEL);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4627  	ud->rflow_gp_map_allocated = devm_kcalloc(dev,
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4628  						  BITS_TO_LONGS(ud->rflow_cnt),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4629  						  sizeof(unsigned long),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4630  						  GFP_KERNEL);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4631  	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4632  					sizeof(unsigned long),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4633  					GFP_KERNEL);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4634  	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4635  				  GFP_KERNEL);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4636  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4637  	if (!ud->tchan_map || !ud->rchan_map || !ud->rflow_gp_map ||
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4638  	    !ud->rflow_gp_map_allocated || !ud->tchans || !ud->rchans ||
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4639  	    !ud->rflows || !ud->rflow_in_use)
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4640  		return -ENOMEM;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4641  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4642  	/*
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4643  	 * RX flows with the same Ids as RX channels are reserved to be used
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4644  	 * as default flows if remote HW can't generate flow_ids. Those
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4645  	 * RX flows can be requested only explicitly by id.
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4646  	 */
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4647  	bitmap_set(ud->rflow_gp_map_allocated, 0, ud->rchan_cnt);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4648  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4649  	/* by default no GP rflows are assigned to Linux */
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4650  	bitmap_set(ud->rflow_gp_map, 0, ud->rflow_cnt);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4651  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4652  	/* Get resource ranges from tisci */
017794739702d4 Peter Ujfalusi      2020-12-08  4653  	for (i = 0; i < RM_RANGE_LAST; i++) {
d2abc982333c02 Peter Ujfalusi      2020-12-08  4654  		if (i == RM_RANGE_BCHAN || i == RM_RANGE_TFLOW)
017794739702d4 Peter Ujfalusi      2020-12-08  4655  			continue;
017794739702d4 Peter Ujfalusi      2020-12-08  4656  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4657  		tisci_rm->rm_ranges[i] =
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4658  			devm_ti_sci_get_of_resource(tisci_rm->tisci, dev,
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4659  						    tisci_rm->tisci_dev_id,
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4660  						    (char *)range_names[i]);
017794739702d4 Peter Ujfalusi      2020-12-08  4661  	}
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4662  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4663  	/* tchan ranges */
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4664  	rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4665  	if (IS_ERR(rm_res)) {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4666  		bitmap_zero(ud->tchan_map, ud->tchan_cnt);
80936d68665be8 Vignesh Raghavendra 2021-12-09  4667  		irq_res.sets = 1;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4668  	} else {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4669  		bitmap_fill(ud->tchan_map, ud->tchan_cnt);
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4670  		for (i = 0; i < rm_res->sets; i++)
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4671  			udma_mark_resource_ranges(ud, ud->tchan_map,
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4672  						  &rm_res->desc[i], "tchan");
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4673  		irq_res.sets = rm_res->sets;
80936d68665be8 Vignesh Raghavendra 2021-12-09  4674  	}
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4675  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4676  	/* rchan and matching default flow ranges */
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4677  	rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4678  	if (IS_ERR(rm_res)) {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4679  		bitmap_zero(ud->rchan_map, ud->rchan_cnt);
80936d68665be8 Vignesh Raghavendra 2021-12-09  4680  		irq_res.sets++;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4681  	} else {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4682  		bitmap_fill(ud->rchan_map, ud->rchan_cnt);
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4683  		for (i = 0; i < rm_res->sets; i++)
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4684  			udma_mark_resource_ranges(ud, ud->rchan_map,
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4685  						  &rm_res->desc[i], "rchan");
80936d68665be8 Vignesh Raghavendra 2021-12-09  4686  		irq_res.sets += rm_res->sets;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4687  	}
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4688  
bf4afc53b77aea Linus Torvalds      2026-02-21 @4689  	irq_res.desc = kzalloc_objs(*irq_res.desc, irq_res.sets);
80936d68665be8 Vignesh Raghavendra 2021-12-09 @4690  	if (!irq_res.desc)
80936d68665be8 Vignesh Raghavendra 2021-12-09  4691  		return -ENOMEM;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4692  	rm_res = tisci_rm->rm_ranges[RM_RANGE_TCHAN];
80936d68665be8 Vignesh Raghavendra 2021-12-09  4693  	if (IS_ERR(rm_res)) {
80936d68665be8 Vignesh Raghavendra 2021-12-09  4694  		irq_res.desc[0].start = 0;
80936d68665be8 Vignesh Raghavendra 2021-12-09  4695  		irq_res.desc[0].num = ud->tchan_cnt;
80936d68665be8 Vignesh Raghavendra 2021-12-09  4696  		i = 1;
80936d68665be8 Vignesh Raghavendra 2021-12-09  4697  	} else {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4698  		for (i = 0; i < rm_res->sets; i++) {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4699  			irq_res.desc[i].start = rm_res->desc[i].start;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4700  			irq_res.desc[i].num = rm_res->desc[i].num;
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4701  			irq_res.desc[i].start_sec = rm_res->desc[i].start_sec;
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4702  			irq_res.desc[i].num_sec = rm_res->desc[i].num_sec;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4703  		}
80936d68665be8 Vignesh Raghavendra 2021-12-09  4704  	}
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4705  	rm_res = tisci_rm->rm_ranges[RM_RANGE_RCHAN];
80936d68665be8 Vignesh Raghavendra 2021-12-09  4706  	if (IS_ERR(rm_res)) {
80936d68665be8 Vignesh Raghavendra 2021-12-09  4707  		irq_res.desc[i].start = 0;
80936d68665be8 Vignesh Raghavendra 2021-12-09  4708  		irq_res.desc[i].num = ud->rchan_cnt;
80936d68665be8 Vignesh Raghavendra 2021-12-09  4709  	} else {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4710  		for (j = 0; j < rm_res->sets; j++, i++) {
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4711  			if (rm_res->desc[j].num) {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4712  				irq_res.desc[i].start = rm_res->desc[j].start +
017794739702d4 Peter Ujfalusi      2020-12-08  4713  						ud->soc_data->oes.udma_rchan;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4714  				irq_res.desc[i].num = rm_res->desc[j].num;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4715  			}
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4716  			if (rm_res->desc[j].num_sec) {
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4717  				irq_res.desc[i].start_sec = rm_res->desc[j].start_sec +
017794739702d4 Peter Ujfalusi      2020-12-08  4718  						ud->soc_data->oes.udma_rchan;
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4719  				irq_res.desc[i].num_sec = rm_res->desc[j].num_sec;
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4720  			}
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4721  		}
80936d68665be8 Vignesh Raghavendra 2021-12-09  4722  	}
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4723  	ret = ti_sci_inta_msi_domain_alloc_irqs(ud->dev, &irq_res);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4724  	kfree(irq_res.desc);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4725  	if (ret) {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4726  		dev_err(ud->dev, "Failed to allocate MSI interrupts\n");
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4727  		return ret;
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4728  	}
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4729  
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4730  	/* GP rflow ranges */
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4731  	rm_res = tisci_rm->rm_ranges[RM_RANGE_RFLOW];
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4732  	if (IS_ERR(rm_res)) {
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4733  		/* all gp flows are assigned exclusively to Linux */
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4734  		bitmap_clear(ud->rflow_gp_map, ud->rchan_cnt,
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4735  			     ud->rflow_cnt - ud->rchan_cnt);
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4736  	} else {
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4737  		for (i = 0; i < rm_res->sets; i++)
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4738  			udma_mark_resource_ranges(ud, ud->rflow_gp_map,
1609c15a20b8e0 Peter Ujfalusi      2020-12-08  4739  						  &rm_res->desc[i], "gp-rflow");
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4740  	}
25dcb5dd7b7ce5 Peter Ujfalusi      2019-12-23  4741  
017794739702d4 Peter Ujfalusi      2020-12-08  4742  	return 0;
017794739702d4 Peter Ujfalusi      2020-12-08  4743  }
017794739702d4 Peter Ujfalusi      2020-12-08  4744  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
