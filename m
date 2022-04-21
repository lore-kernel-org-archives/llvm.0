Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A22C23A0
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 19:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650570339; x=1682106339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qUbnApxe0ifMuycVX45OPy6G9l25JluiNKetU6KZUyg=;
  b=KaOxZfuwl1DZ9U1bNf+d0Lk/PZNbnRDG3QtY5czLqfQXvt9iL9TrlbQV
   F/YT8QubioC7n6SWnuewBIlgKcEkzFvrckHM9lpPgVf+3Zgjwmfg7xx0b
   msMWlb3A9RNX/UXAGWdhsEZtNPpJJ2As5HFfURicvGMiQXJvjDKr8+kJO
   DfR7+gvkfbhHKgPSsJk0fj3AmNuU2o+oZ4HwSV80dGl1OoKnEpOW2Z0jX
   MhXcyFFcio2lMQ1SWdxm+6QlgUn+OIVQc2MlwoWaqJuOcIHIXleldg71D
   rKW3Q3NMsylisDvLYp8bi1Go5cL1Vk5vxX01Lp63bb0uAWkdNSRdIcyCw
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="244385552"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="244385552"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 12:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="533569869"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Apr 2022 12:45:36 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhckB-0008j5-RU;
	Thu, 21 Apr 2022 19:45:35 +0000
Date: Fri, 22 Apr 2022 03:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: drivers/i2c/busses/i2c-mxs.c:802:18: warning: cast to smaller
 integer type 'enum mxs_i2c_devtype' from 'const void *'
Message-ID: <202204220355.TdCb2zsz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fabio,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: c32abd8b569144b20c9c9b6dd7232828c612452f i2c: mxs: Remove unneeded platform_device_id
date:   1 year, 5 months ago
config: arm64-randconfig-r034-20220421 (https://download.01.org/0day-ci/archive/20220422/202204220355.TdCb2zsz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c32abd8b569144b20c9c9b6dd7232828c612452f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c32abd8b569144b20c9c9b6dd7232828c612452f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-mxs.c:802:18: warning: cast to smaller integer type 'enum mxs_i2c_devtype' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           i2c->dev_type = (enum mxs_i2c_devtype)of_device_get_match_data(&pdev->dev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +802 drivers/i2c/busses/i2c-mxs.c

   790	
   791	static int mxs_i2c_probe(struct platform_device *pdev)
   792	{
   793		struct device *dev = &pdev->dev;
   794		struct mxs_i2c_dev *i2c;
   795		struct i2c_adapter *adap;
   796		int err, irq;
   797	
   798		i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
   799		if (!i2c)
   800			return -ENOMEM;
   801	
 > 802		i2c->dev_type = (enum mxs_i2c_devtype)of_device_get_match_data(&pdev->dev);
   803	
   804		i2c->regs = devm_platform_ioremap_resource(pdev, 0);
   805		if (IS_ERR(i2c->regs))
   806			return PTR_ERR(i2c->regs);
   807	
   808		irq = platform_get_irq(pdev, 0);
   809		if (irq < 0)
   810			return irq;
   811	
   812		err = devm_request_irq(dev, irq, mxs_i2c_isr, 0, dev_name(dev), i2c);
   813		if (err)
   814			return err;
   815	
   816		i2c->dev = dev;
   817	
   818		init_completion(&i2c->cmd_complete);
   819	
   820		if (dev->of_node) {
   821			err = mxs_i2c_get_ofdata(i2c);
   822			if (err)
   823				return err;
   824		}
   825	
   826		/* Setup the DMA */
   827		i2c->dmach = dma_request_chan(dev, "rx-tx");
   828		if (IS_ERR(i2c->dmach)) {
   829			dev_err(dev, "Failed to request dma\n");
   830			return PTR_ERR(i2c->dmach);
   831		}
   832	
   833		platform_set_drvdata(pdev, i2c);
   834	
   835		/* Do reset to enforce correct startup after pinmuxing */
   836		err = mxs_i2c_reset(i2c);
   837		if (err)
   838			return err;
   839	
   840		adap = &i2c->adapter;
   841		strlcpy(adap->name, "MXS I2C adapter", sizeof(adap->name));
   842		adap->owner = THIS_MODULE;
   843		adap->algo = &mxs_i2c_algo;
   844		adap->quirks = &mxs_i2c_quirks;
   845		adap->dev.parent = dev;
   846		adap->nr = pdev->id;
   847		adap->dev.of_node = pdev->dev.of_node;
   848		i2c_set_adapdata(adap, i2c);
   849		err = i2c_add_numbered_adapter(adap);
   850		if (err) {
   851			writel(MXS_I2C_CTRL0_SFTRST,
   852					i2c->regs + MXS_I2C_CTRL0_SET);
   853			return err;
   854		}
   855	
   856		return 0;
   857	}
   858	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
