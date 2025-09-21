Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2B274B3B;
	Sun, 21 Sep 2025 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758484253; cv=none; b=EjyeLiKnB5fuDQTfWreneClkJppluR3os5LEU5sri1CoXauUl6tbFwGkEYVF7zyjQ1sFbRDEWWROgv0n6dV9g1YyIybohzV9oue3rYQjAqXXYXh2ZAe2WPkfst/uLJz+oSu01R+0vDBLP8SaMubxcr55jPIMsC0xl1WIVfODYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758484253; c=relaxed/simple;
	bh=l7vsqneKPVvAHfr6dNptj8BvhWQcY1j8WvBKu6w044Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLMiVIcB8phIIW/UKvHcXaS6ycHoa8HEExdukajsyb4Q8ktZmq+kyUxnkERYwvF1FYrvEh3kDB4Tz7Y2yTIu8vKWZWmm2D+KZk7ymrClI4F750mzlpoE4gF1PZ8ol+KAcKf6ho8Dz5xCWgNgpcVFTGx3hKXfsRpnmBbtCLKil/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX1fjRtj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX1fjRtj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758484252; x=1790020252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l7vsqneKPVvAHfr6dNptj8BvhWQcY1j8WvBKu6w044Y=;
  b=VX1fjRtjZPy5vvs/4ECyI3FWu5FTh2YncXat5EuKJfQ8vE2ZYnWAqWD9
   O8GBvGciOAA51OV8RJheUF78GbzOhTtMKGJKeijCUrLJNmY/Sd0ItBr2i
   tpe0muM8IA4uLRLpXwZP0I2CQ4J7QxP1Eemup4LDwV2wqSB3lV+ZtmjMV
   4gOSLYKEVgZCng4V1N6a1dXSSkY4Y3PMVJzwau6BKTaRZGBsoOraj1DQV
   WtPeCUCqI3ea8BKTxSTzOr6ARwQmU+PDg4NmaPTvKpZ3RSWHxEULzfzW0
   on2mScVmSXopOywPVlLQ+UdPTuj/TQb4OCdRtSO7poMD/AKhhBbxtiRhq
   A==;
X-CSE-ConnectionGUID: /6BaNqM1SwiUexlv9te6Dw==
X-CSE-MsgGUID: /PHxrcaOTbGhh38dpspzzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60808525"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60808525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 12:50:51 -0700
X-CSE-ConnectionGUID: LcvX9iEMSSSKx5c+pmOkSw==
X-CSE-MsgGUID: 0xgjFUwjT+uelmatb+W6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="180729622"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Sep 2025 12:50:49 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0Q57-0000yb-13;
	Sun, 21 Sep 2025 19:50:45 +0000
Date: Mon, 22 Sep 2025 03:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] PCI: Convert devm_pci_alloc_host_bridge() users to
 error-pointer returns
Message-ID: <202509220322.JzCVMkDb-lkp@intel.com>
References: <20250921161434.1561770-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921161434.1561770-1-alok.a.tiwari@oracle.com>

Hi Alok,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/for-linus]
[also build test ERROR on linus/master v6.17-rc6]
[cannot apply to pci/next next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alok-Tiwari/PCI-Convert-devm_pci_alloc_host_bridge-users-to-error-pointer-returns/20250922-001734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/20250921161434.1561770-1-alok.a.tiwari%40oracle.com
patch subject: [PATCH RFC] PCI: Convert devm_pci_alloc_host_bridge() users to error-pointer returns
config: um-randconfig-002-20250922 (https://download.01.org/0day-ci/archive/20250922/202509220322.JzCVMkDb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project efd96afedf2c0f6f2cc34cf5a9a7e3e78f592255)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220322.JzCVMkDb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509220322.JzCVMkDb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/pcie-mediatek-gen3.c:13:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/pci/controller/pcie-mediatek-gen3.c:1178:21: error: use of undeclared identifier 'bridge'
    1178 |         if (IS_ERR_OR_NULL(bridge))
         |                            ^~~~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:1179:18: error: use of undeclared identifier 'bridge'
    1179 |                 return PTR_ERR(bridge);
         |                                ^~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/pci/controller/pci-tegra.c:21:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/pci/controller/pci-tegra.c:2571:21: error: use of undeclared identifier 'bridge'
    2571 |         if (IS_ERR_OR_NULL(bridge))
         |                            ^~~~~~
   drivers/pci/controller/pci-tegra.c:2572:18: error: use of undeclared identifier 'bridge'
    2572 |                 return PTR_ERR(bridge);
         |                                ^~~~~~
   1 warning and 2 errors generated.


vim +/bridge +1178 drivers/pci/controller/pcie-mediatek-gen3.c

  1169	
  1170	static int mtk_pcie_probe(struct platform_device *pdev)
  1171	{
  1172		struct device *dev = &pdev->dev;
  1173		struct mtk_gen3_pcie *pcie;
  1174		struct pci_host_bridge *host;
  1175		int err;
  1176	
  1177		host = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> 1178		if (IS_ERR_OR_NULL(bridge))
  1179			return PTR_ERR(bridge);
  1180	
  1181		pcie = pci_host_bridge_priv(host);
  1182	
  1183		pcie->dev = dev;
  1184		pcie->soc = device_get_match_data(dev);
  1185		platform_set_drvdata(pdev, pcie);
  1186	
  1187		err = mtk_pcie_setup(pcie);
  1188		if (err)
  1189			return err;
  1190	
  1191		host->ops = &mtk_pcie_ops;
  1192		host->sysdata = pcie;
  1193	
  1194		err = pci_host_probe(host);
  1195		if (err) {
  1196			mtk_pcie_irq_teardown(pcie);
  1197			mtk_pcie_power_down(pcie);
  1198			return err;
  1199		}
  1200	
  1201		return 0;
  1202	}
  1203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
