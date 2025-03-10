Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4829230BF9;
	Mon, 10 Mar 2025 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741629749; cv=none; b=aub3qeXRBocVrFxgDdXXsg4keUA/bDVdO022jxj64qXJJGoBWQvV8JFXPaGIpbOh283RLqGh9yDdR20M0fAgpIX99y+glHFQR+LXL69xZ2FUlFWtMy6KidbPOxX8LeIulEXEFiwviH/tsEJxmdZ1JiUxb9Cks2GRA6XL3I5cz0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741629749; c=relaxed/simple;
	bh=q79+mOokGgEvGJnA5NXQFtUyN8kLJysRvbxewzau2/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBOfQ7Pc81DWTLg0rTIZl+kYTIaGNMv8+q2kLrmQWt0r5YJEXBeB9EYKzv1LKeqBs4rbhJoN7rDsskMUlMrNPbyXZrKaJNAosRkPr58LUKOsy9FNsyIC5/AQ/ODo9JV63/hI0qJQitPFDV3Uf0rR7YPsL0x8jPubYhlP+CPFaPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBzU1oX2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBzU1oX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741629747; x=1773165747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q79+mOokGgEvGJnA5NXQFtUyN8kLJysRvbxewzau2/0=;
  b=IBzU1oX2X3C8JhnMhATK/sqPzmBQXQlZCnY+HUQmEwTFMbmF2mQuDuZV
   NEDCQ9lqWuncPSTL2Sb5br4ktmsqjfvbxkVzwqd2ozolc5xOw2v5cGgzh
   OudwRa+m6l4oEGt1hZpg3OLO6RWrwudXDzeFLoQWdZazHK8789lx6oiZG
   iDRdqU+cslMPalF0tg0PwzxXhcpL/+ofHYkcqtO9a4hRjpH/0O/bSeT/A
   Qj2JMo8QQ6rA4ZkNvr3MJdyWWZgu6eNFY+f02+SVujXBEdDbOzfS4/AzS
   Oua7Tj7fNZWFMP9Mh+XjfbdaextHkT2DSEidL3rNSPBndGx0chWFHCXqs
   g==;
X-CSE-ConnectionGUID: 8IJfMhjZSkyfAH9+vxqOwA==
X-CSE-MsgGUID: 3Cp/TCB+RtiLpU3Q0ur6mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="46551115"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="46551115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 11:02:26 -0700
X-CSE-ConnectionGUID: vKOnUVXNRaW7hTok9oxIKA==
X-CSE-MsgGUID: tFYs7FXDQxyucSMP95ypFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="120957656"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Mar 2025 11:02:24 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trhSI-0005eg-0t;
	Mon, 10 Mar 2025 18:02:22 +0000
Date: Tue, 11 Mar 2025 02:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [pci:endpoint-test 16/18]
 drivers/pci/controller/dwc/pcie-dw-rockchip.c:316:3: error: field designator
 'intx_capable' does not refer to any field in type 'const struct
 dw_pcie_ep_ops'
Message-ID: <202503110151.vQXf5yof-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Niklas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git endpoint-test
head:   d87a0e7ac55245a3f75ca5c646ffdf0cfa36e749
commit: da8628c06a7f08cb3402d02040d7a6195949772c [16/18] PCI: dw-rockchip: Endpoint mode cannot raise INTx interrupts
config: s390-randconfig-001-20250311 (https://download.01.org/0day-ci/archive/20250311/202503110151.vQXf5yof-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503110151.vQXf5yof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503110151.vQXf5yof-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-dw-rockchip.c:316:3: error: field designator 'intx_capable' does not refer to any field in type 'const struct dw_pcie_ep_ops'
           .intx_capable = false,
            ^
   drivers/pci/controller/dwc/pcie-dw-rockchip.c:530:33: warning: shift count >= width of type [-Wshift-count-overflow]
           dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
                                          ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.


vim +316 drivers/pci/controller/dwc/pcie-dw-rockchip.c

   313	
   314	static const struct dw_pcie_ep_ops rockchip_pcie_ep_ops = {
   315		.init = rockchip_pcie_ep_init,
 > 316		.intx_capable = false,
   317		.raise_irq = rockchip_pcie_raise_irq,
   318		.get_features = rockchip_pcie_get_features,
   319	};
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
