Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0465317E7
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 00:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648512216; x=1680048216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jvxH+LmXdr1Kst3BsT8MJwi4xGsrInOrjW2iYPDHDrI=;
  b=Ip1Extueri5nxGZbR6qeY7XALbDg0Y12fAPsRoQR+J7uiJ1T2g7MiG7h
   vXfoQgj4FydAlbjFWxwyhlV9NSNjiAsYL85Vql7hPv1Gr4NlMa5EABHQu
   1Xwxad0HhaBKC+fmrnOwVVgg1e60f6fF4wzFYxDZBmeagHUDVYDuEhS4C
   2vMzLaZ9K3UyA4bK87ZPIWlD+K6NGPzMlygmNcVBIXhSGsovLtrhquxI0
   QZfSYfhqG2Nvkp9m+ctMx+V4Q3Oe5XZ6BIQHEuXC3jFPm7exDd2Xd/0/F
   AIgBkxeSqWJfCAPogBhyMTvFPkKq9YgnVW7HyZkZl31x3ktOZCxjGwLUC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="322314019"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="322314019"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 17:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="585377683"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Mar 2022 17:03:32 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYzKd-0002RE-Ig; Tue, 29 Mar 2022 00:03:31 +0000
Date: Tue, 29 Mar 2022 08:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	Rob Herring <robh+dt@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 05/21] ata: libahci_platform: Convert to using devm bulk
 clocks API
Message-ID: <202203290752.NKWGfglB-lkp@intel.com>
References: <20220324001628.13028-6-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324001628.13028-6-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Serge,

I love your patch! Yet something to improve:

[auto build test ERROR on v5.17]
[also build test ERROR on next-20220328]
[cannot apply to axboe-block/for-next robh/for-next linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/ata-ahci-Add-DWC-Baikal-T1-AHCI-SATA-support/20220328-234809
base:    f443e374ae131c168a065ea1748feac6b2e76613
config: arm-randconfig-r015-20220327 (https://download.01.org/0day-ci/archive/20220329/202203290752.NKWGfglB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/28cf1dcfb31bfca35af403a8774d0d880923fab3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Serge-Semin/ata-ahci-Add-DWC-Baikal-T1-AHCI-SATA-support/20220328-234809
        git checkout 28cf1dcfb31bfca35af403a8774d0d880923fab3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/ata/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/ata/ahci_da850.c:181:6: error: invalid argument type 'struct clk_bulk_data' to unary expression
           if (!hpriv->clks[0]) {
               ^~~~~~~~~~~~~~~
>> drivers/ata/ahci_da850.c:186:18: error: assigning to 'struct clk_bulk_data' from incompatible type 'struct clk *'
                   hpriv->clks[0] = clk;
                                  ^ ~~~
   drivers/ata/ahci_da850.c:194:6: error: invalid argument type 'struct clk_bulk_data' to unary expression
           if (!hpriv->clks[1]) {
               ^~~~~~~~~~~~~~~
   drivers/ata/ahci_da850.c:201:18: error: assigning to 'struct clk_bulk_data' from incompatible type 'struct clk *'
                   hpriv->clks[1] = clk;
                                  ^ ~~~
>> drivers/ata/ahci_da850.c:204:46: error: passing 'struct clk_bulk_data' to parameter of incompatible type 'struct clk *'
           mpy = ahci_da850_calculate_mpy(clk_get_rate(hpriv->clks[1]));
                                                       ^~~~~~~~~~~~~~
   include/linux/clk.h:880:54: note: passing argument to parameter 'clk' here
   static inline unsigned long clk_get_rate(struct clk *clk)
                                                        ^
   5 errors generated.


vim +181 drivers/ata/ahci_da850.c

018d5ef2048fca Akinobu Mita              2015-01-29  159  
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  160  static int ahci_da850_probe(struct platform_device *pdev)
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  161  {
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  162  	struct device *dev = &pdev->dev;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  163  	struct ahci_host_priv *hpriv;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  164  	void __iomem *pwrdn_reg;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  165  	struct resource *res;
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  166  	struct clk *clk;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  167  	u32 mpy;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  168  	int rc;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  169  
16af2d65842d34 Kunihiko Hayashi          2018-08-22  170  	hpriv = ahci_platform_get_resources(pdev, 0);
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  171  	if (IS_ERR(hpriv))
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  172  		return PTR_ERR(hpriv);
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  173  
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  174  	/*
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  175  	 * Internally ahci_platform_get_resources() calls clk_get(dev, NULL)
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  176  	 * when trying to obtain the functional clock. This SATA controller
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  177  	 * uses two clocks for which we specify two connection ids. If we don't
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  178  	 * have the functional clock at this point - call clk_get() again with
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  179  	 * con_id = "fck".
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  180  	 */
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30 @181  	if (!hpriv->clks[0]) {
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  182  		clk = clk_get(dev, "fck");
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  183  		if (IS_ERR(clk))
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  184  			return PTR_ERR(clk);
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  185  
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30 @186  		hpriv->clks[0] = clk;
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  187  	}
82dbe1a68fd65a Bartosz Golaszewski       2017-01-30  188  
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  189  	/*
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  190  	 * The second clock used by ahci-da850 is the external REFCLK. If we
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  191  	 * didn't get it from ahci_platform_get_resources(), let's try to
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  192  	 * specify the con_id in clk_get().
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  193  	 */
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  194  	if (!hpriv->clks[1]) {
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  195  		clk = clk_get(dev, "refclk");
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  196  		if (IS_ERR(clk)) {
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  197  			dev_err(dev, "unable to obtain the reference clock");
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  198  			return -ENODEV;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  199  		}
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  200  
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  201  		hpriv->clks[1] = clk;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  202  	}
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  203  
cdf0ead3747200 Bartosz Golaszewski       2017-01-30 @204  	mpy = ahci_da850_calculate_mpy(clk_get_rate(hpriv->clks[1]));
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  205  	if (mpy == 0) {
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  206  		dev_err(dev, "invalid REFCLK multiplier value: 0x%x", mpy);
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  207  		return -EINVAL;
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  208  	}
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  209  
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  210  	rc = ahci_platform_enable_resources(hpriv);
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  211  	if (rc)
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  212  		return rc;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  213  
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  214  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
c88c094985ad38 Christophe JAILLET        2017-08-16  215  	if (!res) {
c88c094985ad38 Christophe JAILLET        2017-08-16  216  		rc = -ENODEV;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  217  		goto disable_resources;
c88c094985ad38 Christophe JAILLET        2017-08-16  218  	}
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  219  
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  220  	pwrdn_reg = devm_ioremap(dev, res->start, resource_size(res));
c88c094985ad38 Christophe JAILLET        2017-08-16  221  	if (!pwrdn_reg) {
c88c094985ad38 Christophe JAILLET        2017-08-16  222  		rc = -ENOMEM;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  223  		goto disable_resources;
c88c094985ad38 Christophe JAILLET        2017-08-16  224  	}
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  225  
cdf0ead3747200 Bartosz Golaszewski       2017-01-30  226  	da850_sata_init(dev, pwrdn_reg, hpriv->mmio, mpy);
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  227  
018d5ef2048fca Akinobu Mita              2015-01-29  228  	rc = ahci_platform_init_host(pdev, hpriv, &ahci_da850_port_info,
018d5ef2048fca Akinobu Mita              2015-01-29  229  				     &ahci_platform_sht);
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  230  	if (rc)
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  231  		goto disable_resources;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  232  
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  233  	return 0;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  234  disable_resources:
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  235  	ahci_platform_disable_resources(hpriv);
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  236  	return rc;
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  237  }
ae8723f8a9c8e8 Bartlomiej Zolnierkiewicz 2014-03-25  238  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
