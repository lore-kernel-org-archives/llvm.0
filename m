Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110782C9C
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 05:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641360450; x=1672896450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nIbb8TMyF1G9j/NrPgVjZUjcHjDuriLNVwefDhA4YJc=;
  b=gTqUQhooRQ++DPWO9SgaBGBkVQ0xT/61/eA3h7xEkRVv1g6MnxZM1yqQ
   jRQfWiCZNdxaxR191omDG5kS45L6ayukv38r3eQMFo5xegTnlYHwszPKK
   RkHqsDl8NNdjsSpqbrZSsOgkKQE/UB9EG/qIHiy9Y43ap7iCci+8jpXjX
   61EHd+ApCwKa4vN8hG5fOnRcfeWZIL5+bp61z11wGl2p1Tzbn6v00w71g
   xWZNN6kXq6uHdiqhTMqhi5hAc2mQZlDJqmrAEqpmDtHkpEFCedaEChH6P
   sNZK9dKXwA/jAMSHa9w2w373cEubrCLYqxy0KQxvTNnaiqwSD/f4L6n4T
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="303124239"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; 
   d="scan'208";a="303124239"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 21:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; 
   d="scan'208";a="488454664"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Jan 2022 21:27:26 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n4ypZ-000GHg-U3; Wed, 05 Jan 2022 05:27:25 +0000
Date: Wed, 5 Jan 2022 13:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>, Vinod Koul <vkoul@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Pratyush Yadav <p.yadav@ti.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Swapnil Jakhade <sjakhade@cadence.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/4] phy: cadence: Add Cadence D-PHY Rx driver
Message-ID: <202201051328.31W7Semj-lkp@intel.com>
References: <20211227105545.4852-2-p.yadav@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227105545.4852-2-p.yadav@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Pratyush,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v5.16-rc8 next-20220104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pratyush-Yadav/Rx-mode-support-for-Cadence-DPHY/20211227-185749
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: riscv-randconfig-r013-20220105 (https://download.01.org/0day-ci/archive/20220105/202201051328.31W7Semj-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/266027120669b8824f07fa9c2f7a59b7bc12648c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pratyush-Yadav/Rx-mode-support-for-Cadence-DPHY/20211227-185749
        git checkout 266027120669b8824f07fa9c2f7a59b7bc12648c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/phy/cadence/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/phy/cadence/cdns-dphy-rx.c:223:46: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
                   dev_err(dev, "Failed to create PHY: %d\n", PTR_ERR(dphy->phy));
                                                       ~~     ^~~~~~~~~~~~~~~~~~
                                                       %ld
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/phy/cadence/cdns-dphy-rx.c:231:4: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
                           PTR_ERR(provider));
                           ^~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +223 drivers/phy/cadence/cdns-dphy-rx.c

   203	
   204	static int cdns_dphy_rx_probe(struct platform_device *pdev)
   205	{
   206		struct device *dev = &pdev->dev;
   207		struct phy_provider *provider;
   208		struct cdns_dphy_rx *dphy;
   209	
   210		dphy = devm_kzalloc(dev, sizeof(*dphy), GFP_KERNEL);
   211		if (!dphy)
   212			return -ENOMEM;
   213	
   214		dev_set_drvdata(dev, dphy);
   215		dphy->dev = dev;
   216	
   217		dphy->regs = devm_platform_ioremap_resource(pdev, 0);
   218		if (IS_ERR(dphy->regs))
   219			return PTR_ERR(dphy->regs);
   220	
   221		dphy->phy = devm_phy_create(dev, NULL, &cdns_dphy_rx_ops);
   222		if (IS_ERR(dphy->phy)) {
 > 223			dev_err(dev, "Failed to create PHY: %d\n", PTR_ERR(dphy->phy));
   224			return PTR_ERR(dphy->phy);
   225		}
   226	
   227		phy_set_drvdata(dphy->phy, dphy);
   228		provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
   229		if (IS_ERR(provider)) {
   230			dev_err(dev, "Failed to register PHY provider: %d\n",
   231				PTR_ERR(provider));
   232			return PTR_ERR(provider);
   233		}
   234	
   235		return 0;
   236	}
   237	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
