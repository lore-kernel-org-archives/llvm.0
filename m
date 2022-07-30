Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3444410
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659217854; x=1690753854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rND8XXV4IHwYTrk9ylOpb5YEXKqPDzYplKhRlcJ1akw=;
  b=n+AesTf5bBskVAQhzpn2UkEaIoHx2xkr3bPfwGlnYmp46Lg9qcby4mgl
   mzHTYKwvzOyp4pZiiSWkydvHHCcGuG2fBI8ORflUXiZQ8CLo7FLiuiWB+
   /2LN6o+2NWGtTgz6I/I4zdmP+t0Rp4snZgxLFxlPTyG5HSTt8it22X4l6
   pSxEKzXK6vd7SL+kXxgS9j+/10sfDTe4qRP3mii6jgzDISDs9dmAisJmn
   Y7AcLt1aXdlAhM/p2ZPjpkhc3OqaPIUlyI1UxWfXErbj0SlvQhfh7T/QK
   Qj0pjN+7K47P/Kt6WXqPJ3aRNoJQWpMBhOZNyBZH+zQFSdxXjMkMRlmU6
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="289719543"
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; 
   d="scan'208";a="289719543"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 14:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,205,1654585200"; 
   d="scan'208";a="704554267"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2022 14:50:49 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHuMC-000DNX-1N;
	Sat, 30 Jul 2022 21:50:48 +0000
Date: Sun, 31 Jul 2022 05:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	andriy.shevchenko@linux.intel.com, vee.khee.wong@intel.com,
	weifeng.voon@intel.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] stmmac: intel: Add a missing clk_disable_unprepare()
 call in intel_eth_pci_remove()
Message-ID: <202207310545.hHU5SagS-lkp@intel.com>
References: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-JAILLET/stmmac-intel-Add-a-missing-clk_disable_unprepare-call-in-intel_eth_pci_remove/20220731-022139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 620725263f4222b3c94d4ee19846835feec0ad69
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220731/202207310545.hHU5SagS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2d1d09034cc62ee19f799b92bb67640ba86ca557
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christophe-JAILLET/stmmac-intel-Add-a-missing-clk_disable_unprepare-call-in-intel_eth_pci_remove/20220731-022139
        git checkout 2d1d09034cc62ee19f799b92bb67640ba86ca557
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c:1107:24: error: use of undeclared identifier 'plat'
           clk_disable_unprepare(plat->stmmac_clk);
                                 ^
   1 error generated.


vim +/plat +1107 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c

  1092	
  1093	/**
  1094	 * intel_eth_pci_remove
  1095	 *
  1096	 * @pdev: pci device pointer
  1097	 * Description: this function calls the main to free the net resources
  1098	 * and releases the PCI resources.
  1099	 */
  1100	static void intel_eth_pci_remove(struct pci_dev *pdev)
  1101	{
  1102		struct net_device *ndev = dev_get_drvdata(&pdev->dev);
  1103		struct stmmac_priv *priv = netdev_priv(ndev);
  1104	
  1105		stmmac_dvr_remove(&pdev->dev);
  1106	
> 1107		clk_disable_unprepare(plat->stmmac_clk);
  1108		clk_unregister_fixed_rate(priv->plat->stmmac_clk);
  1109	
  1110		pcim_iounmap_regions(pdev, BIT(0));
  1111	}
  1112	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
