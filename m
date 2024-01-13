Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9834A32;
	Sat, 13 Jan 2024 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dh09Ofg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705164333; x=1736700333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bm/SfBNiMr+aBPw8PwkAWvb31LwV1RgCPvzwVvGOVxA=;
  b=dh09Ofg8DH3YT2CXrvm8n5mvK98MJyMuIn0qGdINlhe46wHDwSjnBWYx
   Zgpm57aP8c0J0DwVMBRbAxLoNT4PevjIaW9k2AP0pl2k0IwKTtlt7S7eH
   zSCfeRaHmksrOjmEuXn7f15o65vl0aUOx3kPG6yNs+WyUeWbtVG9VxvFU
   XYhtLL/gKWsj1boomchuCcavDhaJLN6qglSOafnz6Ymv2BvqZhHY4im6Q
   0a4riZp3la9O+l0ipmTQqfPJlU+tuU+LdEt7Lj9joDVoLh4JmItaAySPR
   NMxzDYAtSDLF4JIsmYnXzCpBEZyNJaPYOgwliRaSGsNQntnl3oszNntmR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="485556161"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="485556161"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 08:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="25335145"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2024 08:45:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOh8S-000Ahk-33;
	Sat, 13 Jan 2024 16:45:28 +0000
Date: Sun, 14 Jan 2024 00:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [morimoto:renesas-bsp/v6.1.71-2024-01-10 381/551]
 drivers/pci/controller/dwc/pcie-rcar-gen4.c:286:9: error: use of undeclared
 identifier 'PCIE_T_PVPERL_MS'
Message-ID: <202401140012.za4bCpGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.71-2024-01-10
head:   7942223d600b4cbaffeb04e8a3d6695f7a46e49d
commit: 06b40d191034800f8ddb02522843b3d6ed7b190f [381/551] PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240114/202401140012.za4bCpGl-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140012.za4bCpGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140012.za4bCpGl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-rcar-gen4.c:286:9: error: use of undeclared identifier 'PCIE_T_PVPERL_MS'
     286 |         msleep(PCIE_T_PVPERL_MS);       /* pe_rst requires 100msec delay */
         |                ^
   1 error generated.


vim +/PCIE_T_PVPERL_MS +286 drivers/pci/controller/dwc/pcie-rcar-gen4.c

   257	
   258	/* Host mode */
   259	static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
   260	{
   261		struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
   262		struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
   263		int ret;
   264		u32 val;
   265	
   266		gpiod_set_value_cansleep(dw->pe_rst, 1);
   267	
   268		ret = rcar_gen4_pcie_common_init(rcar);
   269		if (ret)
   270			return ret;
   271	
   272		/*
   273		 * According to the section 3.5.7.2 "RC Mode" in DWC PCIe Dual Mode
   274		 * Rev.5.20a and 3.5.6.1 "RC mode" in DWC PCIe RC databook v5.20a, we
   275		 * should disable two BARs to avoid unnecessary memory assignment
   276		 * during device enumeration.
   277		 */
   278		dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_0, 0x0);
   279		dw_pcie_writel_dbi2(dw, PCI_BASE_ADDRESS_1, 0x0);
   280	
   281		/* Enable MSI interrupt signal */
   282		val = readl(rcar->base + PCIEINTSTS0EN);
   283		val |= MSI_CTRL_INT;
   284		writel(val, rcar->base + PCIEINTSTS0EN);
   285	
 > 286		msleep(PCIE_T_PVPERL_MS);	/* pe_rst requires 100msec delay */
   287	
   288		gpiod_set_value_cansleep(dw->pe_rst, 0);
   289	
   290		return 0;
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
