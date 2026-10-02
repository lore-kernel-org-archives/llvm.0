Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45F1343D75;
	Fri,  2 Oct 2026 04:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914050; cv=none; b=dzWe5cxh6QDQw4Z6o56UWnv1WUo495XmJ9EymKSGk8K3iKWnMuACsTtmmNF/Pv48NCD2SQFG31u9RrC1skOAZWMZeP8kfQQ+/WYUcUJc1NwRlfvZLxgpkRTXSZ6ZZin45vaB8UzW1n8uBa91vPOWo7Xyhd/yMVNY1PhsfOyf07I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914050; c=relaxed/simple;
	bh=ucZTb9GuLK3oAVs7aFnJpL3rUKTYC/7v5OwGN6v2DOw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dtW2RECm9JhsxWV/2icphj0wGc45RvkFU3UZ/6XLplH4vvJEa29Ftm/vhRSwatDZ6Ve2LhNRIUb+5pm8HT4hrezQwU3DH2d0uRuRrCdob4rups+NoShDk3BjYlek2LQa3UMKy4vb1QXGmj2JTGwBZn3U7M1BnObLxATkvH4MOEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kv/Q+Uab; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kv/Q+Uab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790914049; x=1822450049;
  h=date:from:to:cc:subject:message-id;
  bh=ucZTb9GuLK3oAVs7aFnJpL3rUKTYC/7v5OwGN6v2DOw=;
  b=kv/Q+UabTLzGqKUDzBqjTJbandN+0gfwDUAjfVDR/kYJZjLanaE1NZuz
   /TrPLOxudvNfrbRwAozLho6O7nVkqwyCX22iJ7EEcI1DxIITVuHySgQn1
   JyyYr0v+8ZkV85RRiocDlwE4QYb9wx5XCVLA2Ja+3wP8kjZUoLpV44yYy
   7pNf4VKKoNxjKf1xnbqC/O9zp9PAYw9KMZvu6QriHexZEN/0b7K/5g5qV
   +BIlvAUReAtK+El6zCTkdAgXklvBw7t+oJH0LYVIIXfVT9i9Et2Ihz5V8
   OGBpqDzIjtD3eDmuzjQ33aNzTJPZglYutTDl6bzxeJxcVpzOlHtl0YOPD
   g==;
X-CSE-ConnectionGUID: O+A9KD7ZSy6l/o9MZ6TuJA==
X-CSE-MsgGUID: XAa7zD3cTtGYbOX/eby59Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90714116"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90714116"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:07:28 -0700
X-CSE-ConnectionGUID: Fg1OVQ+XR3WKa/+/OW1SHg==
X-CSE-MsgGUID: OnUAmEJyQD6sVQQ0pVf+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275697146"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Oct 2026 21:07:26 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCUYN-00000000Scv-1C8Y;
	Fri, 02 Oct 2026 04:07:23 +0000
Date: Fri, 02 Oct 2026 12:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Daniel Thompson <daniel@riscstar.com>
Subject: [char-misc:char-misc-testing 19/37] drivers/pci/of.c:783:5:
 error: incompatible integer to pointer conversion assigning to 'struct
 device_node *' from 'int'
Message-ID: <202610021249.J94Hg1xo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   04434a1d0f311d76b1f15fa987918b471a0b8c6a
commit: 1304b0c47ef81cbd21e51ea0645a98104393ba49 [19/37] misc: tc9564: introduce base PCI driver
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021249.J94Hg1xo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021249.J94Hg1xo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021249.J94Hg1xo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/of.c:740:2: error: call to undeclared function 'of_changeset_revert'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     740 |         of_changeset_revert(np->data);
         |         ^
>> drivers/pci/of.c:741:2: error: call to undeclared function 'of_changeset_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     741 |         of_changeset_destroy(np->data);
         |         ^
>> drivers/pci/of.c:781:2: error: call to undeclared function 'of_changeset_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     781 |         of_changeset_init(cset);
         |         ^
>> drivers/pci/of.c:783:7: error: call to undeclared function 'of_changeset_create_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     783 |         np = of_changeset_create_node(cset, ppnode, name);
         |              ^
>> drivers/pci/of.c:783:5: error: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
     783 |         np = of_changeset_create_node(cset, ppnode, name);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/of.c:791:8: error: call to undeclared function 'of_changeset_apply'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     791 |         ret = of_changeset_apply(cset);
         |               ^
   drivers/pci/of.c:807:2: error: call to undeclared function 'of_changeset_revert'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     807 |         of_changeset_revert(cset);
         |         ^
   drivers/pci/of.c:811:2: error: call to undeclared function 'of_changeset_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     811 |         of_changeset_destroy(cset);
         |         ^
   drivers/pci/of.c:827:2: error: call to undeclared function 'of_changeset_revert'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     827 |         of_changeset_revert(np->data);
         |         ^
   drivers/pci/of.c:828:2: error: call to undeclared function 'of_changeset_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     828 |         of_changeset_destroy(np->data);
         |         ^
   drivers/pci/of.c:869:2: error: call to undeclared function 'of_changeset_init'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     869 |         of_changeset_init(cset);
         |         ^
   drivers/pci/of.c:871:7: error: call to undeclared function 'of_changeset_create_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     871 |         np = of_changeset_create_node(cset, of_root, name);
         |              ^
   drivers/pci/of.c:871:5: error: incompatible integer to pointer conversion assigning to 'struct device_node *' from 'int' [-Wint-conversion]
     871 |         np = of_changeset_create_node(cset, of_root, name);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/of.c:888:8: error: call to undeclared function 'of_changeset_apply'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     888 |         ret = of_changeset_apply(cset);
         |               ^
   drivers/pci/of.c:911:2: error: call to undeclared function 'of_changeset_revert'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     911 |         of_changeset_revert(cset);
         |         ^
   drivers/pci/of.c:915:2: error: call to undeclared function 'of_changeset_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     915 |         of_changeset_destroy(cset);
         |         ^
   16 errors generated.
--
>> drivers/pci/of_property.c:105:9: error: call to undeclared function 'of_changeset_add_prop_u32_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     105 |         return of_changeset_add_prop_u32_array(ocs, np, "bus-range", bus_range,
         |                ^
   drivers/pci/of_property.c:158:8: error: call to undeclared function 'of_changeset_add_prop_u32_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     158 |         ret = of_changeset_add_prop_u32_array(ocs, np, "ranges", (u32 *)rp,
         |               ^
   drivers/pci/of_property.c:173:9: error: call to undeclared function 'of_changeset_add_prop_u32_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |         return of_changeset_add_prop_u32_array(ocs, np, "reg", (u32 *)&reg,
         |                ^
>> drivers/pci/of_property.c:191:9: error: call to undeclared function 'of_changeset_add_prop_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     191 |         return of_changeset_add_prop_u32(ocs, np, "interrupts", (u32)pin);
         |                ^
   drivers/pci/of_property.c:207:8: error: call to undeclared function 'of_changeset_add_prop_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         ret = of_changeset_add_prop_u32(ocs, np, "#interrupt-cells", 1);
         |               ^
>> drivers/pci/of_property.c:211:9: error: call to undeclared function 'of_changeset_add_prop_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     211 |         return of_changeset_add_prop_bool(ocs, np, "interrupt-controller");
         |                ^
   drivers/pci/of_property.c:311:8: error: call to undeclared function 'of_changeset_add_prop_u32_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     311 |         ret = of_changeset_add_prop_u32_array(ocs, np, "interrupt-map", int_map,
         |               ^
   drivers/pci/of_property.c:316:8: error: call to undeclared function 'of_changeset_add_prop_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     316 |         ret = of_changeset_add_prop_u32(ocs, np, "#interrupt-cells", 1);
         |               ^
>> drivers/pci/of_property.c:348:8: error: call to undeclared function 'of_changeset_add_prop_string_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     348 |         ret = of_changeset_add_prop_string_array(ocs, np, "compatible",
         |               ^
>> drivers/pci/of_property.c:366:9: error: call to undeclared function 'of_changeset_add_prop_string'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     366 |                 ret = of_changeset_add_prop_string(ocs, np, "device_type",
         |                       ^
   drivers/pci/of_property.c:388:8: error: call to undeclared function 'of_changeset_add_prop_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     388 |         ret = of_changeset_add_prop_u32(ocs, np, "#address-cells",
         |               ^
   drivers/pci/of_property.c:483:8: error: call to undeclared function 'of_changeset_add_prop_u32_array'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     483 |         ret = of_changeset_add_prop_u32_array(ocs, np, "ranges", ranges,
         |               ^
   drivers/pci/of_property.c:495:8: error: call to undeclared function 'of_changeset_add_prop_string'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     495 |         ret = of_changeset_add_prop_string(ocs, np, "device_type", "pci");
         |               ^
   drivers/pci/of_property.c:499:8: error: call to undeclared function 'of_changeset_add_prop_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     499 |         ret = of_changeset_add_prop_u32(ocs, np, "#address-cells",
         |               ^
   14 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_DYNAMIC_OF_NODES
   Depends on [n]: PCI [=y] && OF_IRQ [=n]
   Selected by [m]:
   - TC9564_PCI [=m] && OF [=y] && PCI [=y]


vim +783 drivers/pci/of.c

407d1a51921e9f2 Lizhi Hou      2023-08-15  730  
407d1a51921e9f2 Lizhi Hou      2023-08-15  731  void of_pci_remove_node(struct pci_dev *pdev)
407d1a51921e9f2 Lizhi Hou      2023-08-15  732  {
407d1a51921e9f2 Lizhi Hou      2023-08-15  733  	struct device_node *np;
407d1a51921e9f2 Lizhi Hou      2023-08-15  734  
407d1a51921e9f2 Lizhi Hou      2023-08-15  735  	np = pci_device_to_OF_node(pdev);
407d1a51921e9f2 Lizhi Hou      2023-08-15  736  	if (!np || !of_node_check_flag(np, OF_DYNAMIC))
407d1a51921e9f2 Lizhi Hou      2023-08-15  737  		return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  738  
e2267841fe26d45 Herve Codina   2025-02-24  739  	device_remove_of_node(&pdev->dev);
407d1a51921e9f2 Lizhi Hou      2023-08-15 @740  	of_changeset_revert(np->data);
407d1a51921e9f2 Lizhi Hou      2023-08-15 @741  	of_changeset_destroy(np->data);
407d1a51921e9f2 Lizhi Hou      2023-08-15  742  	of_node_put(np);
407d1a51921e9f2 Lizhi Hou      2023-08-15  743  }
407d1a51921e9f2 Lizhi Hou      2023-08-15  744  
407d1a51921e9f2 Lizhi Hou      2023-08-15  745  void of_pci_make_dev_node(struct pci_dev *pdev)
407d1a51921e9f2 Lizhi Hou      2023-08-15  746  {
407d1a51921e9f2 Lizhi Hou      2023-08-15  747  	struct device_node *ppnode, *np = NULL;
407d1a51921e9f2 Lizhi Hou      2023-08-15  748  	const char *pci_type;
407d1a51921e9f2 Lizhi Hou      2023-08-15  749  	struct of_changeset *cset;
407d1a51921e9f2 Lizhi Hou      2023-08-15  750  	const char *name;
407d1a51921e9f2 Lizhi Hou      2023-08-15  751  	int ret;
407d1a51921e9f2 Lizhi Hou      2023-08-15  752  
407d1a51921e9f2 Lizhi Hou      2023-08-15  753  	/*
407d1a51921e9f2 Lizhi Hou      2023-08-15  754  	 * If there is already a device tree node linked to this device,
407d1a51921e9f2 Lizhi Hou      2023-08-15  755  	 * return immediately.
407d1a51921e9f2 Lizhi Hou      2023-08-15  756  	 */
407d1a51921e9f2 Lizhi Hou      2023-08-15  757  	if (pci_device_to_OF_node(pdev))
407d1a51921e9f2 Lizhi Hou      2023-08-15  758  		return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  759  
407d1a51921e9f2 Lizhi Hou      2023-08-15  760  	/* Check if there is device tree node for parent device */
407d1a51921e9f2 Lizhi Hou      2023-08-15  761  	if (!pdev->bus->self)
407d1a51921e9f2 Lizhi Hou      2023-08-15  762  		ppnode = pdev->bus->dev.of_node;
407d1a51921e9f2 Lizhi Hou      2023-08-15  763  	else
407d1a51921e9f2 Lizhi Hou      2023-08-15  764  		ppnode = pdev->bus->self->dev.of_node;
407d1a51921e9f2 Lizhi Hou      2023-08-15  765  	if (!ppnode)
407d1a51921e9f2 Lizhi Hou      2023-08-15  766  		return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  767  
407d1a51921e9f2 Lizhi Hou      2023-08-15  768  	if (pci_is_bridge(pdev))
407d1a51921e9f2 Lizhi Hou      2023-08-15  769  		pci_type = "pci";
407d1a51921e9f2 Lizhi Hou      2023-08-15  770  	else
407d1a51921e9f2 Lizhi Hou      2023-08-15  771  		pci_type = "dev";
407d1a51921e9f2 Lizhi Hou      2023-08-15  772  
407d1a51921e9f2 Lizhi Hou      2023-08-15  773  	name = kasprintf(GFP_KERNEL, "%s@%x,%x", pci_type,
407d1a51921e9f2 Lizhi Hou      2023-08-15  774  			 PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
407d1a51921e9f2 Lizhi Hou      2023-08-15  775  	if (!name)
407d1a51921e9f2 Lizhi Hou      2023-08-15  776  		return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  777  
bf4afc53b77aeaa Linus Torvalds 2026-02-21  778  	cset = kmalloc_obj(*cset);
407d1a51921e9f2 Lizhi Hou      2023-08-15  779  	if (!cset)
f69977404700a3d Lizhi Hou      2023-09-29  780  		goto out_free_name;
407d1a51921e9f2 Lizhi Hou      2023-08-15 @781  	of_changeset_init(cset);
407d1a51921e9f2 Lizhi Hou      2023-08-15  782  
407d1a51921e9f2 Lizhi Hou      2023-08-15 @783  	np = of_changeset_create_node(cset, ppnode, name);
407d1a51921e9f2 Lizhi Hou      2023-08-15  784  	if (!np)
f69977404700a3d Lizhi Hou      2023-09-29  785  		goto out_destroy_cset;
407d1a51921e9f2 Lizhi Hou      2023-08-15  786  
407d1a51921e9f2 Lizhi Hou      2023-08-15  787  	ret = of_pci_add_properties(pdev, cset, np);
407d1a51921e9f2 Lizhi Hou      2023-08-15  788  	if (ret)
f69977404700a3d Lizhi Hou      2023-09-29  789  		goto out_free_node;
407d1a51921e9f2 Lizhi Hou      2023-08-15  790  
407d1a51921e9f2 Lizhi Hou      2023-08-15 @791  	ret = of_changeset_apply(cset);
407d1a51921e9f2 Lizhi Hou      2023-08-15  792  	if (ret)
f69977404700a3d Lizhi Hou      2023-09-29  793  		goto out_free_node;
407d1a51921e9f2 Lizhi Hou      2023-08-15  794  
f69977404700a3d Lizhi Hou      2023-09-29  795  	np->data = cset;
e2267841fe26d45 Herve Codina   2025-02-24  796  
e2267841fe26d45 Herve Codina   2025-02-24  797  	ret = device_add_of_node(&pdev->dev, np);
e2267841fe26d45 Herve Codina   2025-02-24  798  	if (ret)
e2267841fe26d45 Herve Codina   2025-02-24  799  		goto out_revert_cset;
e2267841fe26d45 Herve Codina   2025-02-24  800  
407d1a51921e9f2 Lizhi Hou      2023-08-15  801  	kfree(name);
407d1a51921e9f2 Lizhi Hou      2023-08-15  802  
407d1a51921e9f2 Lizhi Hou      2023-08-15  803  	return;
407d1a51921e9f2 Lizhi Hou      2023-08-15  804  
e2267841fe26d45 Herve Codina   2025-02-24  805  out_revert_cset:
e2267841fe26d45 Herve Codina   2025-02-24  806  	np->data = NULL;
e2267841fe26d45 Herve Codina   2025-02-24  807  	of_changeset_revert(cset);
f69977404700a3d Lizhi Hou      2023-09-29  808  out_free_node:
407d1a51921e9f2 Lizhi Hou      2023-08-15  809  	of_node_put(np);
f69977404700a3d Lizhi Hou      2023-09-29  810  out_destroy_cset:
f69977404700a3d Lizhi Hou      2023-09-29  811  	of_changeset_destroy(cset);
f69977404700a3d Lizhi Hou      2023-09-29  812  	kfree(cset);
f69977404700a3d Lizhi Hou      2023-09-29  813  out_free_name:
407d1a51921e9f2 Lizhi Hou      2023-08-15  814  	kfree(name);
407d1a51921e9f2 Lizhi Hou      2023-08-15  815  }
1f340724419eda8 Herve Codina   2025-02-24  816  

:::::: The code at line 783 was first introduced by commit
:::::: 407d1a51921e9f28c1bcec647c2205925bd1fdab PCI: Create device tree node for bridge

:::::: TO: Lizhi Hou <lizhi.hou@amd.com>
:::::: CC: Rob Herring <robh@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
