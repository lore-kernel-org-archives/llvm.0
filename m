Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C463AB;
	Fri, 10 Feb 2023 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676047903; x=1707583903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VWoD2Su6Cu0tMWNt8Er3eAnHfk0G5+mq7hzAjC78Jc=;
  b=hhYviI6HYWtCUQoRyoD9cngeu1UpypsBGZoYcOOjQmo3R/tiIixBkxkv
   3/1rXF17ILXe6M8giBrf0NqWsowic4b2pTY48IviYyK75bw3Q+SXSlAJn
   ROI8BmOa08z5VRrKumtAEa1xDozzdzDZr2rTSXCQhOlXeCrNnDAunwA12
   YwDBv+mjQw74GtdbLfs0tMvCWhkpemHmsq9Tdi5+VUI/CBYXHxs3MEbSe
   27EQlVvj5rjI9UGbfl/O0dCp9XC0gS4x6iaSr5iIDshELOg/149T8CckT
   3MBpaQum9iux4c77Iu5YwCCDV7GALMQMNG5svVwWAAhVGtxgItb0cMfyw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310095077"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="310095077"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 08:51:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="645678463"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="645678463"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Feb 2023 08:51:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQWce-0005uj-0P;
	Fri, 10 Feb 2023 16:51:40 +0000
Date: Sat, 11 Feb 2023 00:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:kobject-const-2 93/100]
 drivers/irqchip/irq-mbigen.c:248:30: error: no member named 'dev_root' in
 'struct bus_type'
Message-ID: <202302110025.Hi1M9ULU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git kobject-const-2
head:   edb07d61689645fa19378a7a18451f91c8414b5a
commit: 09840de8fa7d238c6f87a3807fa0d380c4165764 [93/100] driver core: bus: move dev_root out of struct bus_type
config: arm64-randconfig-r016-20230210 (https://download.01.org/0day-ci/archive/20230211/202302110025.Hi1M9ULU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=09840de8fa7d238c6f87a3807fa0d380c4165764
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core kobject-const-2
        git checkout 09840de8fa7d238c6f87a3807fa0d380c4165764
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110025.Hi1M9ULU-lkp@intel.com/

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
