Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087587FD;
	Sun, 28 Jan 2024 00:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706401572; cv=none; b=sV05at/malUbCEp/cinqe8Dy3znp9e5vFgZcGbhtJCTdHXayb+ZI589yoSyKxF8WTz/00tMBkkWiPv+r/UITtSuV+JtB/elA+vzcWPTesgyZGIepbyhSkoGqFT4GM1RgA5A6mzzkFPRRt0Az7z3g61U6JyR4vNK7VZpJWtLpxI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706401572; c=relaxed/simple;
	bh=UyKYnPZFfjX041fPKbqHXV3NbFGghKdv884SfwqmT3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qcvs0eOdTt5JGCaRyVSNFha94zvn1yXqKHxGh/LvyGbKwvloLRLlnq1jP1hmJefbJ4k/6dFpzATU6ZACKgyMCKQsAGMtfLDmvd8sVuj89RLtRa5c6/zhocJxohyVTyjmHNbxFflqgUFPH6KYxmo4kIS16JuczvExXn7rjGeiWu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/ndren4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/ndren4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706401571; x=1737937571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UyKYnPZFfjX041fPKbqHXV3NbFGghKdv884SfwqmT3Q=;
  b=P/ndren45n+7ZhdB4G1+EHJj93TKj9uWGJQAHYbSPgZuuEA/o/YDSai0
   UcZ2/rTwRXIsQ+a5DTBMjbwQqNwoisDSsbPDvGwzDTO/o1unCAJbV/eqZ
   fS56LbUwqUP+MH8e8jO5bVYai2vLlnfnNd/RCiDAVP522aa1nfPKgy3fV
   GVOVC3Md3tFyB/nBxr2ludf/QWHRbPG1EdnrGzL5dmNl70hIfmXCt7cjj
   U4w/qFYyKMOhvQhtgHeF+WF2BIRpnBcsmnjE26zSu/FDK36yStXBtObg1
   yxl4TYaOJK6H9Wr2bYt1G+NkchND2x31B/dQVOLHYPm/U9IyWsnkyaR+D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="16250332"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="16250332"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 16:26:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="877717899"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="877717899"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Jan 2024 16:26:08 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTszu-0002u2-0F;
	Sun, 28 Jan 2024 00:26:06 +0000
Date: Sun, 28 Jan 2024 08:25:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: [jmondi:jmondi/rpi5-be-upstream/libcamera 30/131]
 drivers/pci/controller/pcie-brcmstb.c:473:6: warning: variable 'ret' set but
 not used
Message-ID: <202401280836.i4C3FyZ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git jmondi/rpi5-be-upstream/libcamera
head:   a7bec0179c6915e1140ede4bd0ceae507b80112e
commit: e53645fcc7971ea226e563350bea786852e7b572 [30/131] PCI: brcmstb: Add BCM2712 support
config: i386-buildonly-randconfig-001-20240128 (https://download.01.org/0day-ci/archive/20240128/202401280836.i4C3FyZ1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280836.i4C3FyZ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280836.i4C3FyZ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pcie-brcmstb.c:473:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     473 |         int ret, i;
         |             ^
   1 warning generated.


vim +/ret +473 drivers/pci/controller/pcie-brcmstb.c

   463	
   464	static void brcm_pcie_munge_pll(struct brcm_pcie *pcie)
   465	{
   466		//print "MDIO block 0x1600 written per Dannys instruction"
   467		//tmp = pcie_mdio_write(phyad, &h16&, &h50b9&)
   468		//tmp = pcie_mdio_write(phyad, &h17&, &hbd1a&)
   469		//tmp = pcie_mdio_write(phyad, &h1b&, &h5030&)
   470		//tmp = pcie_mdio_write(phyad, &h1e&, &h0007&)
   471	
   472		u32 tmp;
 > 473		int ret, i;
   474		u8 regs[] =  { 0x16,   0x17,   0x18,   0x19,   0x1b,   0x1c,   0x1e };
   475		u16 data[] = { 0x50b9, 0xbda1, 0x0094, 0x97b4, 0x5030, 0x5030, 0x0007 };
   476	
   477		ret = brcm_pcie_mdio_write(pcie->base, MDIO_PORT0, SET_ADDR_OFFSET,
   478					0x1600);
   479		for (i = 0; i < ARRAY_SIZE(regs); i++) {
   480			brcm_pcie_mdio_read(pcie->base, MDIO_PORT0, regs[i], &tmp);
   481			dev_dbg(pcie->dev, "PCIE MDIO pre_refclk 0x%02x = 0x%04x\n",
   482				regs[i], tmp);
   483		}
   484		for (i = 0; i < ARRAY_SIZE(regs); i++) {
   485			brcm_pcie_mdio_write(pcie->base, MDIO_PORT0, regs[i], data[i]);
   486			brcm_pcie_mdio_read(pcie->base, MDIO_PORT0, regs[i], &tmp);
   487			dev_dbg(pcie->dev, "PCIE MDIO post_refclk 0x%02x = 0x%04x\n",
   488				regs[i], tmp);
   489		}
   490		usleep_range(100, 200);
   491	}
   492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
