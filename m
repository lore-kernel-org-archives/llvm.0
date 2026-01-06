Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B191DD9AC;
	Tue,  6 Jan 2026 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709208; cv=none; b=JDX8nBf3rqJyS5cEIY4X6oELMzHydxo3tY+GkMBa31RAD3KJV39fMXkh1aojzpmgq4YkO0JfGmD8XJCpBKj8bgfeyLit1ez9zbEU/sneoqLFV74iksL/yKKxfCJ2UyWY5nsQVJ0EBe2drgX9hzRw2M/VTXAkOGBAoamGrK48T8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709208; c=relaxed/simple;
	bh=NCL2dWniZ4k1N8xR25wMbusyAXxj0GiwKDTKGW/1YRM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uv5zdJiaVk3nKquMD2q+JViHzWaKUQsLD5ud+FQ4kosdTwCUQ/hvQa7fXK4HzfEG8qxnz1W8QMxyT6ElyRjnwQ2qwPCrJTExRNSk4gjXtSdZwK0Kg72+1Bsc9a/MHO1MgPi+NpfQsNO8OMpUoflTFxJwU+GXDlcotl9lp0sjlBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SY4eARzv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SY4eARzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767709207; x=1799245207;
  h=date:from:to:cc:subject:message-id;
  bh=NCL2dWniZ4k1N8xR25wMbusyAXxj0GiwKDTKGW/1YRM=;
  b=SY4eARzvNAed+YMJ0nUW62Gjulghf2N3lyPpwjbOeLI0YUv5jd5PoLzT
   ORobMRSI5RS2TbSe9//LyHyBMp+HZ5oGV2RR64PJt6K1IhhibcibPYYe/
   f6Et7vdshJVlVcPVYlzghiRM8e72x5u8VjLu6sOion7Bh38Vvx+q5EBzW
   okTxEHSBOBIEq/kOCXs4EG+twBsvfAv3FNf5z3GokCa7K7iBn0mP55Ea7
   2mW0Tv3M2eDGAFhiwNHjay//jNpnkc+ha/C3PdaeIRNwigE4Od7tRk4b8
   dRDltON709dDcVC/XldjixdkxgwyF+SGnekq49FiKRQGkeNNvx4V0JWC+
   A==;
X-CSE-ConnectionGUID: Gc6OcmmhQ5yAOAIoxEmc/w==
X-CSE-MsgGUID: D8pBgzqES56/BNstdRanXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="80439853"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="80439853"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 06:20:06 -0800
X-CSE-ConnectionGUID: qP/qwde0Q/OWGNi58SwXcw==
X-CSE-MsgGUID: fyPS1shdTYWbuoSm2H4uOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="203619006"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2026 06:20:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd7uk-00000000211-2ETq;
	Tue, 06 Jan 2026 14:20:02 +0000
Date: Tue, 06 Jan 2026 22:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Terry Bowman <terry.bowman@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [davejiang:cxl-port-err.v14 28/37]
 drivers/cxl/cxlpci.h:96:1: error: expected identifier or '('
Message-ID: <202601062232.MtzWBLRG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/davejiang/linux.git cxl-port-err.v14
head:   a1102a7118289d39c0fdc11e0331763822387705
commit: dfdb8cef4f5c9cd4c6e7e3e151b607a6b9c4234f [28/37] cxl: Introduce CXL Uncorrectable Protocol Error handlers for Endpoints
config: riscv-randconfig-002-20260106 (https://download.01.org/0day-ci/archive/20260106/202601062232.MtzWBLRG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601062232.MtzWBLRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601062232.MtzWBLRG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/cxl/pci.c:16:
>> drivers/cxl/cxlpci.h:95:73: warning: non-void function does not return a value [-Wreturn-type]
      95 | static inline pci_ers_result_t cxl_error_detected(struct device *dev) { }
         |                                                                         ^
>> drivers/cxl/cxlpci.h:96:1: error: expected identifier or '('
      96 | {
         | ^
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
   Depends on [n]: CACHEMAINT_FOR_DMA [=n]
   Selected by [y]:
   - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && !DMA_DIRECT_REMAP [=n] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]


vim +96 drivers/cxl/cxlpci.h

    79	
    80	#ifdef CONFIG_CXL_RAS
    81	void cxl_cor_error_detected(struct pci_dev *pdev);
    82	pci_ers_result_t cxl_error_detected(struct device *dev);
    83	pci_ers_result_t cxl_pci_error_detected(struct pci_dev *pdev,
    84						pci_channel_state_t error);
    85	void devm_cxl_dport_ras_setup(struct cxl_dport *dport);
    86	void devm_cxl_port_ras_setup(struct cxl_port *port);
    87	void __cxl_dport_init_ras_reporting(struct cxl_dport *dport, struct device *host);
    88	void __cxl_uport_init_ras_reporting(struct cxl_port *port,
    89					    struct device *host);
    90	int __cxl_await_media_ready(struct cxl_dev_state *cxlds);
    91	resource_size_t __cxl_rcd_component_reg_phys(struct device *dev,
    92						     struct cxl_dport *dport);
    93	#else
    94	static inline void cxl_cor_error_detected(struct pci_dev *pdev) { }
  > 95	static inline pci_ers_result_t cxl_error_detected(struct device *dev) { }
  > 96	{
    97		return PCI_ERS_RESULT_NONE;
    98	}
    99	static inline pci_ers_result_t cxl_pci_error_detected(struct pci_dev *pdev,
   100							      pci_channel_state_t state)
   101	{
   102		return PCI_ERS_RESULT_NONE;
   103	}
   104	static inline void devm_cxl_dport_ras_setup(struct cxl_dport *dport)
   105	{
   106	}
   107	static inline void devm_cxl_port_ras_setup(struct cxl_port *port)
   108	{
   109	}
   110	#endif
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
