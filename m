Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8423C38E5DE;
	Tue, 26 May 2026 17:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818318; cv=none; b=IF6rZ2dLMivol5d7JRWiQRaI3J3A2EMawWkwnzN+zX2G83DOTxp6ktqGtp1m+4a9uucPJV1DY2ZFMyS7YhcNF3q12V9g3Engxr2gNshw3Qk0Gwaha9a1gXqrQtW0qQb6lgO1KpKqVWAt0hdrZ0SDY6XTJDWYKxXth0ixEjoSYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818318; c=relaxed/simple;
	bh=CVZn4G1LasdNkdCPnkGYaHKpZPCiqmaDtWphxtGWTNI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uuadRZTXt33nCm/Jl00ZhzL7y25PGgm04W5/WdsmHj8JuuobwRiW4GXYY5EksKpcpBLQlOANtwtnCnCYAkS7fbfUPdTX8xVDVaRsvgiRxL2gBaUfmeCejdeTXxLhL+qs0P4qyI+BewpDFAElutT0sOxpMQbxdqotBcetjWF+yQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuGJICUl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuGJICUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779818318; x=1811354318;
  h=date:from:to:cc:subject:message-id;
  bh=CVZn4G1LasdNkdCPnkGYaHKpZPCiqmaDtWphxtGWTNI=;
  b=ZuGJICUl9/3XeCCyXD571xbZrHkOo/5s5EvYIyMwG/80SlhZSuQuaqJa
   vvUu4rzzMlEN/eyJiZubX5kliiq3sFPllLum1pHrXU3HgsTCjCRry6o5h
   XgEbTyxSZyUl2zH2XeJx7szf7vrFQMZYAEZ1eSuWYbckc5Z9T2q/diX2n
   YarYuE7wV2dFPvfSFfAynkO7RX1HNC7jgBXZjnIP+ZQMYzUc9QbOSPewb
   K989APEHlALyoukFJ+cgPUd0mRjsW0iFP+6yBh0o4PiL6KPItFSamdT0r
   RUmchxq1J0xkUGsLFENggXxzAr4JOeGfy0OZwE/3Yip7G5Z6PKiSJO2Z7
   g==;
X-CSE-ConnectionGUID: WaN1wLKhSb6I5HAbMBPvCg==
X-CSE-MsgGUID: qUioa7ZvSMmEv8ZNJ4rOxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="84529844"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="84529844"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:58:38 -0700
X-CSE-ConnectionGUID: VPo+vV02RjmSC8EbQN5LPg==
X-CSE-MsgGUID: 240FNJNhQVaJyzQbLe+9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="272321775"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 May 2026 10:58:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRw2y-00000000CSn-3kky;
	Tue, 26 May 2026 17:58:32 +0000
Date: Tue, 26 May 2026 19:58:03 +0200
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: include/linux/pci-tph.h:48:10: error: use of undeclared
 identifier 'PCI_TPH_LOC_NONE'
Message-ID: <202605261924.yjQ55T8d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/PCI-TPH-Fix-pcie_tph_get_st_table_loc-field-extraction/20260526-121037
head:   aeabc1a28fa5791d80195a8d37acf629a083a486
commit: bdb8ee095dd1a800a81e68da79b4118fa6f970b0 PCI/TPH: Export pcie_tph_get_st_modes() for external use
date:   14 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260526/202605261924.yjQ55T8d-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261924.yjQ55T8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261924.yjQ55T8d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vdpa/mlx5/core/mr.c:8:
   In file included from include/linux/mlx5/qp.h:36:
   In file included from include/linux/mlx5/device.h:37:
   In file included from include/rdma/ib_verbs.h:46:
>> include/linux/pci-tph.h:48:10: error: use of undeclared identifier 'PCI_TPH_LOC_NONE'
      48 | { return PCI_TPH_LOC_NONE; }
         |          ^
   1 error generated.


vim +/PCI_TPH_LOC_NONE +48 include/linux/pci-tph.h

    22	
    23	#ifdef CONFIG_PCIE_TPH
    24	int pcie_tph_set_st_entry(struct pci_dev *pdev,
    25				  unsigned int index, u16 tag);
    26	int pcie_tph_get_cpu_st(struct pci_dev *dev,
    27				enum tph_mem_type mem_type,
    28				unsigned int cpu, u16 *tag);
    29	void pcie_disable_tph(struct pci_dev *pdev);
    30	int pcie_enable_tph(struct pci_dev *pdev, int mode);
    31	u16 pcie_tph_get_st_table_size(struct pci_dev *pdev);
    32	u32 pcie_tph_get_st_table_loc(struct pci_dev *pdev);
    33	u8 pcie_tph_get_st_modes(struct pci_dev *pdev);
    34	#else
    35	static inline int pcie_tph_set_st_entry(struct pci_dev *pdev,
    36						unsigned int index, u16 tag)
    37	{ return -EINVAL; }
    38	static inline int pcie_tph_get_cpu_st(struct pci_dev *dev,
    39					      enum tph_mem_type mem_type,
    40					      unsigned int cpu, u16 *tag)
    41	{ return -EINVAL; }
    42	static inline void pcie_disable_tph(struct pci_dev *pdev) { }
    43	static inline int pcie_enable_tph(struct pci_dev *pdev, int mode)
    44	{ return -EINVAL; }
    45	static inline u16 pcie_tph_get_st_table_size(struct pci_dev *pdev)
    46	{ return 0; }
    47	static inline u32 pcie_tph_get_st_table_loc(struct pci_dev *pdev)
  > 48	{ return PCI_TPH_LOC_NONE; }
    49	static inline u8 pcie_tph_get_st_modes(struct pci_dev *pdev)
    50	{ return 0; }
    51	#endif
    52	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
