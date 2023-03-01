Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C846BD;
	Wed,  1 Mar 2023 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677684326; x=1709220326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XI9ownShmWREBCu37gez1opwBgbmAEbewxKVoN49Pg=;
  b=Vg0pAI9rcLfOr025+BR+UzlLKoNc+1HiNX07/rYQ8bCRdV/MYfJ3ID5V
   04JwPTs/49eHnd1+JukLILL2eFds0k949nche3CbnAswzKl5fLjRRUTlq
   DWTvO/t80PXdIUGmGC3CEWAThBjROxaGQ+Wfj10H1plATcTr/ees8Wtrn
   aG7uMtuR2HsAINjeOQvxewgQNu3XaLRBXLlGcbl8Dp2Vn+MZM+TXDnTlb
   p6qhyVYMkg55/r0k7LA3LIjcklgb8BBHPWD+kOfrKbu22F9u+MkzTVmQz
   hZHywbrlOlc5yEno/ApVgBWotAklkb8jbtkTyfq9qfVLQ5UZCE/UwN0CN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="399221756"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="399221756"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 07:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="624532303"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="624532303"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Mar 2023 07:25:22 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXOKX-0006F7-2Z;
	Wed, 01 Mar 2023 15:25:21 +0000
Date: Wed, 1 Mar 2023 23:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:bus_cleanup 21/36] drivers/irqchip/irq-mbigen.c:248:30:
 error: no member named 'dev_root' in 'struct bus_type'
Message-ID: <202303012310.3HsNmMM6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git bus_cleanup
head:   3e181816389768d1490b562055db5f9d5b71908f
commit: a71647f9972e21b7cb098c8299a808992cf332bc [21/36] driver core: bus: move dev_root out of struct bus_type
config: arm64-randconfig-r031-20230301 (https://download.01.org/0day-ci/archive/20230301/202303012310.3HsNmMM6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=a71647f9972e21b7cb098c8299a808992cf332bc
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core bus_cleanup
        git checkout a71647f9972e21b7cb098c8299a808992cf332bc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303012310.3HsNmMM6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-mbigen.c:248:30: error: no member named 'dev_root' in 'struct bus_type'
                   parent = platform_bus_type.dev_root;
                            ~~~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +248 drivers/irqchip/irq-mbigen.c

9650c60ebfec05 Ma Jun          2015-12-17  234  
76e1f77f9c26ec Kefeng Wang     2017-03-07  235  static int mbigen_of_create_domain(struct platform_device *pdev,
76e1f77f9c26ec Kefeng Wang     2017-03-07  236  				   struct mbigen_device *mgn_chip)
717c3dbc118ecb Ma Jun          2015-12-17  237  {
76e1f77f9c26ec Kefeng Wang     2017-03-07  238  	struct device *parent;
ed2a1002d25ccd MaJun           2016-03-17  239  	struct platform_device *child;
9650c60ebfec05 Ma Jun          2015-12-17  240  	struct irq_domain *domain;
ed2a1002d25ccd MaJun           2016-03-17  241  	struct device_node *np;
9650c60ebfec05 Ma Jun          2015-12-17  242  	u32 num_pins;
717c3dbc118ecb Ma Jun          2015-12-17  243  
ed2a1002d25ccd MaJun           2016-03-17  244  	for_each_child_of_node(pdev->dev.of_node, np) {
ed2a1002d25ccd MaJun           2016-03-17  245  		if (!of_property_read_bool(np, "interrupt-controller"))
ed2a1002d25ccd MaJun           2016-03-17  246  			continue;
ed2a1002d25ccd MaJun           2016-03-17  247  
ed2a1002d25ccd MaJun           2016-03-17 @248  		parent = platform_bus_type.dev_root;
ed2a1002d25ccd MaJun           2016-03-17  249  		child = of_platform_device_create(np, NULL, parent);
321275f0d8f593 Nishka Dasgupta 2019-07-23  250  		if (!child) {
321275f0d8f593 Nishka Dasgupta 2019-07-23  251  			of_node_put(np);
086eec2de00ef5 Dan Carpenter   2016-04-04  252  			return -ENOMEM;
321275f0d8f593 Nishka Dasgupta 2019-07-23  253  		}
ed2a1002d25ccd MaJun           2016-03-17  254  
ed2a1002d25ccd MaJun           2016-03-17  255  		if (of_property_read_u32(child->dev.of_node, "num-pins",
ed2a1002d25ccd MaJun           2016-03-17  256  					 &num_pins) < 0) {
9650c60ebfec05 Ma Jun          2015-12-17  257  			dev_err(&pdev->dev, "No num-pins property\n");
321275f0d8f593 Nishka Dasgupta 2019-07-23  258  			of_node_put(np);
9650c60ebfec05 Ma Jun          2015-12-17  259  			return -EINVAL;
9650c60ebfec05 Ma Jun          2015-12-17  260  		}
9650c60ebfec05 Ma Jun          2015-12-17  261  
ed2a1002d25ccd MaJun           2016-03-17  262  		domain = platform_msi_create_device_domain(&child->dev, num_pins,
9650c60ebfec05 Ma Jun          2015-12-17  263  							   mbigen_write_msg,
9650c60ebfec05 Ma Jun          2015-12-17  264  							   &mbigen_domain_ops,
9650c60ebfec05 Ma Jun          2015-12-17  265  							   mgn_chip);
321275f0d8f593 Nishka Dasgupta 2019-07-23  266  		if (!domain) {
321275f0d8f593 Nishka Dasgupta 2019-07-23  267  			of_node_put(np);
9650c60ebfec05 Ma Jun          2015-12-17  268  			return -ENOMEM;
ed2a1002d25ccd MaJun           2016-03-17  269  		}
321275f0d8f593 Nishka Dasgupta 2019-07-23  270  	}
9650c60ebfec05 Ma Jun          2015-12-17  271  
76e1f77f9c26ec Kefeng Wang     2017-03-07  272  	return 0;
76e1f77f9c26ec Kefeng Wang     2017-03-07  273  }
76e1f77f9c26ec Kefeng Wang     2017-03-07  274  

:::::: The code at line 248 was first introduced by commit
:::::: ed2a1002d25ccdb6606c8ccb608524118bd30614 irqchip/mbigen: Handle multiple device nodes in a mbigen module

:::::: TO: MaJun <majun258@huawei.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
