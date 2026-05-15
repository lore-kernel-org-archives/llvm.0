Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809D30568E;
	Fri, 15 May 2026 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859514; cv=none; b=ldx5wWnXraMEtVhc3p1Fua7cTt6zhzWSj46jHJ250CzMkbw9SyBD7hdJIrDaVw9T7G3M2OMf5vx+KzftppsWHzrZLIMaG2ebYbmCNTQpoO0q0ivv3JpTztzaPxkD0x0844bVUD/xdv4Gclf/d18XjVYVm4cNLcY7Yfezg4cMgL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859514; c=relaxed/simple;
	bh=cz/ON/e5sP/FtRGD1p8Be83qpDbYR20MrWF7kTeMTcs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bOT5+PnyiSYa+72vUHjUl5O6F9JGP1ykh1u5Qi7ro5Pay/YU5r1cnlabbV9QgcfPvKO/DDlmAnq1GJTZYpXw2sUvWJtlNcVf8xKlHJjTI9pO+nrgjEdZRwVWFB58QkAE65ZbPOhCN6vZh7IaUyTbRikeoddJ0YlUTrYuPrk+Mx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Llc9ziWA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Llc9ziWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778859513; x=1810395513;
  h=date:from:to:cc:subject:message-id;
  bh=cz/ON/e5sP/FtRGD1p8Be83qpDbYR20MrWF7kTeMTcs=;
  b=Llc9ziWA7hGNt/UFPbnutemOjncVCAPrlE6NdVa6SQNpKsCg4WrD2Z6O
   w+s8tIm28bAIsL9M9NsJMLh4xjWNjxEdG4YEUaXnwtQxLoo5pVKyFoca6
   SB8r9pefvv+d/3S5TQv0UFnbA8Ip1dYLzLXjWaIX7GFaKHHiymWOUxD1c
   k3QNoUeEsKfnYUhmynyco9kv6+hsj4xnyCeF7wfTQJEBMPgmtYngjcbRU
   vxHQuJht/JLPVVQZNJCrm2XVUh6ju32SuaYSLymwaiX9tbb3ctHc0WNIm
   mfD+Bj/00UYADUGFNh4WpCc9D6kAYruh0or0o0yOkvFN6y3wQ9nYIAX8H
   g==;
X-CSE-ConnectionGUID: jmwVKNiLQ6e8k/AP/NWYSA==
X-CSE-MsgGUID: OcXolILnRuScfhGJa7ZFjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="78953769"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="78953769"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 08:38:32 -0700
X-CSE-ConnectionGUID: KxkxvuxAQbuZmFy+R3+ioQ==
X-CSE-MsgGUID: o7pVe0wBQC6d6NRIYm072g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238604649"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 15 May 2026 08:38:29 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNucM-0000000026s-05eO;
	Fri, 15 May 2026 15:38:26 +0000
Date: Fri, 15 May 2026 23:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18 741/871]
 drivers/phy/xilinx/phy-amd-versal2-usbdp.c:47:9: error: call to undeclared
 function 'readl'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605152313.HpRl0O6K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18
head:   8ad23fcb26beeb807a7f0f3341137ec98e93f390
commit: 2a8218bbeaa31c54ebe59ee89e4187c48f1cde9c [741/871] phy: xilinx: add AMD Versal Gen 2 USB3.1 SSP+/DP Alt Combo PHY driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605152313.HpRl0O6K-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152313.HpRl0O6K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152313.HpRl0O6K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/xilinx/phy-amd-versal2-usbdp.c:47:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      47 |         return readl(udphy->base_crpara + reg);
         |                ^
   drivers/phy/xilinx/phy-amd-versal2-usbdp.c:52:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      52 |         return readl(udphy->base_tca + reg);
         |                ^
>> drivers/phy/xilinx/phy-amd-versal2-usbdp.c:57:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |         writel(val, udphy->base_tca + reg);
         |         ^
   3 errors generated.


vim +/readl +47 drivers/phy/xilinx/phy-amd-versal2-usbdp.c

    44	
    45	static inline u32 amd_versal2_udphy_crpara_read(struct amd_versal2_udphy *udphy, u32 reg)
    46	{
  > 47		return readl(udphy->base_crpara + reg);
    48	}
    49	
    50	static inline u32 amd_versal2_udphy_tca_read(struct amd_versal2_udphy *udphy, u32 reg)
    51	{
    52		return readl(udphy->base_tca + reg);
    53	}
    54	
    55	static inline void amd_versal2_udphy_tca_write(struct amd_versal2_udphy *udphy, u32 reg, u32 val)
    56	{
  > 57		writel(val, udphy->base_tca + reg);
    58	}
    59	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
