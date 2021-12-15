Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079F29CA
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 17:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639588342; x=1671124342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=edXL2NDH77Vq5+3qPUNxhejC8s6Say3j/M5f/xR81ck=;
  b=lXTzIVKjCZ6nFEXls0D0pyVNXlHMrcj4Fn3BqBFkCA1msikNDbLnSdfn
   y1f45fsdhv7FYMUTLiNbAgLyYRvVDSyq6O2Wwtejor6lp3XCvgsSBM4cl
   NGXiJ74s6CYFDoxdKZG79b16dYwVxY2CC+WmkgeIfaPaCqtx3ozqm6FYX
   /rDEVRktlr9/pwWzSyIUj7n6fwfc8ca2ft4TlRGQVyD7ZTamlyCDPI+Lb
   XZ0HR8odpNHrfEGbdq8J5/mBcC9OBVX1IBaq4H24IHCkVF4JzpOyUgI7k
   Skj6kLAAWAO8wq1lRzc2F1kQQM9UUED7tTA5ZV6iYlg9XJFzwKbb3PhP2
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="236815837"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="236815837"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 09:09:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="482464752"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Dec 2021 09:09:08 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxXm8-00026X-6O; Wed, 15 Dec 2021 17:09:08 +0000
Date: Thu, 16 Dec 2021 01:08:33 +0800
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
Subject: Re: [PATCH v6 1/4] phy: cadence: Add Cadence D-PHY Rx driver
Message-ID: <202112160116.Cc1gKnvK-lkp@intel.com>
References: <20211214180703.3268-2-p.yadav@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214180703.3268-2-p.yadav@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Pratyush,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v5.16-rc5 next-20211214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pratyush-Yadav/Rx-mode-support-for-Cadence-DPHY/20211215-021112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: riscv-randconfig-r035-20211215 (https://download.01.org/0day-ci/archive/20211216/202112160116.Cc1gKnvK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/7422cc73ff300a5eb0e57ff6fe426e01f5dcb2b0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pratyush-Yadav/Rx-mode-support-for-Cadence-DPHY/20211215-021112
        git checkout 7422cc73ff300a5eb0e57ff6fe426e01f5dcb2b0
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
   1 warning generated.


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
   229	
   230		return PTR_ERR_OR_ZERO(provider);
   231	}
   232	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
