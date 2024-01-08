Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9FF8F44;
	Mon,  8 Jan 2024 06:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlwDYz6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704694670; x=1736230670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WEMDbbL2sdjM8fjquOPsBqcImEjbvEABysW3psgo/sE=;
  b=QlwDYz6a9OQtrdvl98tJhFAxZT9GGc2+mu4RlmPqRkr69h68av+Okqqb
   pLp1QOzGUMUEnOE+wDFKsx7CSXLPlUasGas/QwtO5GnaLNa5kshDSmB+h
   7oFZuQZvNVJid0LDC9hskYFAgFplGFnIuomQiePgG/Wnz5oLyOLGhMNEd
   drCr5AnLRzLCy+G4KlRQvATL0eRN92/DDjAVIYmMIVJsbXkyzHof6HVL4
   ORaBZiRRhKhY07Fxxl+lH0GSxIr2ZT9gS/Q7zuIPJ14SD0ff1ZTYRh3TI
   eujIXPfezMn7aghaTIILd1d5TU8WY2VbKgFrgSZiOnSsUT9+4rOmURYa5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="11293147"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="11293147"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 22:17:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="847118268"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="847118268"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 07 Jan 2024 22:17:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMixF-0004US-23;
	Mon, 08 Jan 2024 06:17:45 +0000
Date: Mon, 8 Jan 2024 14:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.7-rc6-net-next-mv88e6xxx-leds-v3 8/8]
 drivers/net/dsa/qca/qca8k-8xxx.c:1817:7: error: use of undeclared identifier
 'qca8k_netdev_leds_ops'
Message-ID: <202401081431.IC35u2BR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.7-rc6-net-next-mv88e6xxx-leds-v3
head:   9a48ae1a616c32799d10fcde6a9eea1bbade8496
commit: 9a48ae1a616c32799d10fcde6a9eea1bbade8496 [8/8] dsa: qca8k: Use netdev_leds common code for LEDs
config: x86_64-randconfig-001-20240108 (https://download.01.org/0day-ci/archive/20240108/202401081431.IC35u2BR-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401081431.IC35u2BR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401081431.IC35u2BR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/qca/qca8k-8xxx.c:1817:7: error: use of undeclared identifier 'qca8k_netdev_leds_ops'
    1817 |                                  &qca8k_netdev_leds_ops);
         |                                   ^
   1 error generated.


vim +/qca8k_netdev_leds_ops +1817 drivers/net/dsa/qca/qca8k-8xxx.c

  1810	
  1811	static int qca8k_port_setup(struct dsa_switch *ds, int port)
  1812	{
  1813		struct dsa_port *dp = dsa_to_port(ds, port);
  1814		struct qca8k_priv *priv = ds->priv;
  1815	
  1816		return netdev_leds_setup(dp->user, dp->dn, &priv->leds,
> 1817					 &qca8k_netdev_leds_ops);
  1818	}
  1819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
