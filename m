Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72417332B;
	Wed,  9 Oct 2024 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728474473; cv=none; b=l8riD+DovQVNNPwgZQz7FMBPnGdogV0gL3ggHO9ispZPHxvbEYVU0wfIWnDjCadthYQ87TyC5a5fwEmpZhGUOBgPcG1zRRiCFlZgCN0XwM9+/TRDf7HGSB2pwkUarTJFtQcX3dC0E9+36onpOcVkIYahAwux7nnxfe4LfS6BIFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728474473; c=relaxed/simple;
	bh=dGMKppMPNjRqpAjBHlDgnez5AOGQr/mxaKH7aoo5YNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TdZy3xMbd2Oqty08++BxbCQ218h8bXTjKFTGjezS4qOz/juWP5qMFWxYK/yshbX3f4vHIo32ffs9v+DRRirdDtEPUJMYoN6dWWcRJl55ljKx5/aaAe4qbTZuol5PUMTN7+cbXQ6G97zffjr3OHCBVDXWr8cUs9iNjPirU+Ftlgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNM9g2NX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNM9g2NX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728474472; x=1760010472;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dGMKppMPNjRqpAjBHlDgnez5AOGQr/mxaKH7aoo5YNY=;
  b=ZNM9g2NXhHC/7Etgd1NEecPIRzLTMkuWRBh7FSyB6fyhxiN5bxD1NfiJ
   lmTXORzoOz4RT67PrSknLJ3uaMJVAQCXYDwXF8jfvVuPqblE8DWFqFdPj
   vPv8rNO4F5ExxBpHkNnzElGYz9NnWCHnMY33Pqml+ZvDq2r5NqC3uCHwF
   KdyYcuIqgjEQrNEsXK87neIoF5HFsuHc2edu1oIWopeovIZPc8yC22TsE
   CDUjxRpIZtL+ooSn7EhBLU/nfpwLlvwdT5maXPghoVGxW82lPxQHPmuOb
   eBL8yFPs21Fw/8tiHMLLqIybl5YxngD6vR4Rc187uEVYQFd2EilotjWuj
   g==;
X-CSE-ConnectionGUID: 9bFnV3h1SHuGoj/rLQ/GCA==
X-CSE-MsgGUID: zudFJ1aKQaue+HdQzLhnjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27854665"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27854665"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 04:47:51 -0700
X-CSE-ConnectionGUID: Y6Ohn1zORdS77n3Tw5qhhQ==
X-CSE-MsgGUID: zF57iGbGTZqv4G62zvVHPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="75821958"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2024 04:47:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syVAR-0009AT-2C;
	Wed, 09 Oct 2024 11:47:47 +0000
Date: Wed, 9 Oct 2024 19:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/const 1/7] drivers/of/address.c:244:31: error: passing
 'const struct fwnode_handle *' to parameter of type 'struct fwnode_handle *'
 discards qualifiers
Message-ID: <202410091933.LJWegYK9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/const
head:   0c30153b6de7566ccbcf7c5c8857d33bc7fd3f29
commit: e54d6b14c85698083dc77dabcd7eb82cd5e30303 [1/7] of: Constify struct device_node
config: arm-at91_dt_defconfig (https://download.01.org/0day-ci/archive/20241009/202410091933.LJWegYK9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091933.LJWegYK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091933.LJWegYK9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/of/address.c:12:
   In file included from include/linux/pci.h:2676:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/of/address.c:244:31: error: passing 'const struct fwnode_handle *' to parameter of type 'struct fwnode_handle *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     244 |                 err = pci_register_io_range(&np->fwnode, range->cpu_addr,
         |                                             ^~~~~~~~~~~
   include/linux/pci.h:2022:63: note: passing argument to parameter 'fwnode' here
    2022 | static inline int pci_register_io_range(struct fwnode_handle *fwnode,
         |                                                               ^
   1 warning and 1 error generated.


vim +244 drivers/of/address.c

1a52a094c2f082 Thomas Weißschuh     2024-09-06  217  
0b0b0893d49b34 Liviu Dudau          2014-09-29  218  /*
0b0b0893d49b34 Liviu Dudau          2014-09-29  219   * of_pci_range_to_resource - Create a resource from an of_pci_range
0b0b0893d49b34 Liviu Dudau          2014-09-29  220   * @range:	the PCI range that describes the resource
0b0b0893d49b34 Liviu Dudau          2014-09-29  221   * @np:		device node where the range belongs to
0b0b0893d49b34 Liviu Dudau          2014-09-29  222   * @res:	pointer to a valid resource that will be updated to
0b0b0893d49b34 Liviu Dudau          2014-09-29  223   *              reflect the values contained in the range.
0b0b0893d49b34 Liviu Dudau          2014-09-29  224   *
65b6b046e2b4ce Geert Uytterhoeven   2023-03-31  225   * Returns -EINVAL if the range cannot be converted to resource.
0b0b0893d49b34 Liviu Dudau          2014-09-29  226   *
0b0b0893d49b34 Liviu Dudau          2014-09-29  227   * Note that if the range is an IO range, the resource will be converted
0b0b0893d49b34 Liviu Dudau          2014-09-29  228   * using pci_address_to_pio() which can fail if it is called too early or
0b0b0893d49b34 Liviu Dudau          2014-09-29  229   * if the range cannot be matched to any host bridge IO space (our case here).
0b0b0893d49b34 Liviu Dudau          2014-09-29  230   * To guard against that we try to register the IO range first.
0b0b0893d49b34 Liviu Dudau          2014-09-29  231   * If that fails we know that pci_address_to_pio() will do too.
0b0b0893d49b34 Liviu Dudau          2014-09-29  232   */
e54d6b14c85698 Rob Herring (Arm     2024-05-31  233) int of_pci_range_to_resource(const struct of_pci_range *range,
e54d6b14c85698 Rob Herring (Arm     2024-05-31  234) 			     const struct device_node *np, struct resource *res)
83bbde1cc0ec9d Liviu Dudau          2014-09-29  235  {
1a52a094c2f082 Thomas Weißschuh     2024-09-06  236  	u64 start;
0b0b0893d49b34 Liviu Dudau          2014-09-29  237  	int err;
83bbde1cc0ec9d Liviu Dudau          2014-09-29  238  	res->flags = range->flags;
83bbde1cc0ec9d Liviu Dudau          2014-09-29  239  	res->parent = res->child = res->sibling = NULL;
83bbde1cc0ec9d Liviu Dudau          2014-09-29  240  	res->name = np->full_name;
0b0b0893d49b34 Liviu Dudau          2014-09-29  241  
0b0b0893d49b34 Liviu Dudau          2014-09-29  242  	if (res->flags & IORESOURCE_IO) {
0b0b0893d49b34 Liviu Dudau          2014-09-29  243  		unsigned long port;
fcfaab30933bd1 Gabriele Paoloni     2018-03-15 @244  		err = pci_register_io_range(&np->fwnode, range->cpu_addr,
fcfaab30933bd1 Gabriele Paoloni     2018-03-15  245  				range->size);
0b0b0893d49b34 Liviu Dudau          2014-09-29  246  		if (err)
0b0b0893d49b34 Liviu Dudau          2014-09-29  247  			goto invalid_range;
0b0b0893d49b34 Liviu Dudau          2014-09-29  248  		port = pci_address_to_pio(range->cpu_addr);
0b0b0893d49b34 Liviu Dudau          2014-09-29  249  		if (port == (unsigned long)-1) {
0b0b0893d49b34 Liviu Dudau          2014-09-29  250  			err = -EINVAL;
0b0b0893d49b34 Liviu Dudau          2014-09-29  251  			goto invalid_range;
0b0b0893d49b34 Liviu Dudau          2014-09-29  252  		}
1a52a094c2f082 Thomas Weißschuh     2024-09-06  253  		start = port;
0b0b0893d49b34 Liviu Dudau          2014-09-29  254  	} else {
1a52a094c2f082 Thomas Weißschuh     2024-09-06  255  		start = range->cpu_addr;
4af971064977b0 Pavel Fedin          2015-10-08  256  	}
1a52a094c2f082 Thomas Weißschuh     2024-09-06  257  	return __of_address_resource_bounds(res, start, range->size);
0b0b0893d49b34 Liviu Dudau          2014-09-29  258  
0b0b0893d49b34 Liviu Dudau          2014-09-29  259  invalid_range:
0b0b0893d49b34 Liviu Dudau          2014-09-29  260  	res->start = (resource_size_t)OF_BAD_ADDR;
0b0b0893d49b34 Liviu Dudau          2014-09-29  261  	res->end = (resource_size_t)OF_BAD_ADDR;
0b0b0893d49b34 Liviu Dudau          2014-09-29  262  	return err;
83bbde1cc0ec9d Liviu Dudau          2014-09-29  263  }
bf6681ea533538 Manikanta Maddireddy 2018-01-11  264  EXPORT_SYMBOL(of_pci_range_to_resource);
dbbdee94734bf6 Grant Likely         2010-06-08  265  

:::::: The code at line 244 was first introduced by commit
:::::: fcfaab30933bd151bd8cb4dd07b3f11d885bb611 PCI: Add fwnode handler as input param of pci_register_io_range()

:::::: TO: Gabriele Paoloni <gabriele.paoloni@huawei.com>
:::::: CC: Bjorn Helgaas <helgaas@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
