Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4E807;
	Thu,  9 Mar 2023 06:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678343656; x=1709879656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DFur0ADkrDQu5z47A56cwxkrUqueuqQBgYWp7cDhzEk=;
  b=flWznKTNe4ag9Jj8B8mye+03VXfq1WWqu/LXwQQ2h4FVD0qh9Z4K2fKG
   lbsQvxExXFx1UusEZ7ZiIJnkGo2ZTojjsXNSZnfArMvgzkk+XfQxRSlJ5
   sb5G2o25UIxJQGbwliXp0otpJAgl1nNcPLZpxFFJJ6Z/m7zzwul6oRJF2
   6x/7urWHiWhlYhFg9FwDyufF5qQkB8xNWIfzt+g1XnVfp34isPkzTDFZ4
   jEwAkZnlNreeWN2ujJK0/BoFE3p8T4HGGLgtNob/5/IhnLCH4JEnhtsuX
   6jqkZ0rxQoJCNJ+AKeIRF+bOfjNnmM+tOfcABYL1Fd1b3utES7+xRetM4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316024907"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316024907"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 22:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741429960"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="741429960"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 22:34:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa9qu-0002i7-1C;
	Thu, 09 Mar 2023 06:34:12 +0000
Date: Thu, 9 Mar 2023 14:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 1298/2428] drivers/clk/mvebu/kirkwood.c:358:1:
 error: expected identifier or '('
Message-ID: <202303091435.ae36t8f6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2c6433e9294b6d0f4d8f08c3c70a3eac434d3ec8
commit: c28cd1f3433c7e339315d1ddacaeacf0fdfbe252 [1298/2428] clk: Mark a fwnode as initialized when using CLK_OF_DECLARE() macro
config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20230309/202303091435.ae36t8f6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c28cd1f3433c7e339315d1ddacaeacf0fdfbe252
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c28cd1f3433c7e339315d1ddacaeacf0fdfbe252
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091435.ae36t8f6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/mvebu/kirkwood.c:358:1: error: expected identifier or '('
   CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",
   ^
   include/linux/clk-provider.h:1367:21: note: expanded from macro 'CLK_OF_DECLARE'
           static void __init name##_of_clk_init_declare(struct device_node *np) \
                              ^
   <scratch space>:133:1: note: expanded from here
   98dx1135_clk_of_clk_init_declare
   ^
>> drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal constant
   include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF_DECLARE'
           OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
                                           ^
   <scratch space>:134:3: note: expanded from here
   98dx1135_clk_of_clk_init_declare
     ^
>> drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal constant
   include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF_DECLARE'
           OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
                                           ^
   <scratch space>:134:3: note: expanded from here
   98dx1135_clk_of_clk_init_declare
     ^
>> drivers/clk/mvebu/kirkwood.c:358:1: error: invalid digit 'd' in decimal constant
   include/linux/clk-provider.h:1372:34: note: expanded from macro 'CLK_OF_DECLARE'
           OF_DECLARE_1(clk, name, compat, name##_of_clk_init_declare)
                                           ^
   <scratch space>:134:3: note: expanded from here
   98dx1135_clk_of_clk_init_declare
     ^
   4 errors generated.


vim +358 drivers/clk/mvebu/kirkwood.c

e8e8a9b0d86c09 Mike Turquette        2014-08-27  333  
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  334  static void __init kirkwood_clk_init(struct device_node *np)
e89406c957459a Sebastian Hesselbarth 2013-05-11  335  {
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  336  	struct device_node *cgnp =
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  337  		of_find_compatible_node(NULL, NULL, "marvell,kirkwood-gating-clock");
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  338  
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  339  
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  340  	if (of_device_is_compatible(np, "marvell,mv88f6180-core-clock"))
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  341  		mvebu_coreclk_setup(np, &mv88f6180_coreclks);
88aa7af9c18038 Chris Packham         2019-06-18  342  	else if (of_device_is_compatible(np, "marvell,mv98dx1135-core-clock"))
88aa7af9c18038 Chris Packham         2019-06-18  343  		mvebu_coreclk_setup(np, &mv98dx1135_coreclks);
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  344  	else
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  345  		mvebu_coreclk_setup(np, &kirkwood_coreclks);
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  346  
105299381d8720 Mike Turquette        2014-08-18  347  	if (cgnp) {
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  348  		mvebu_clk_gating_setup(cgnp, kirkwood_gating_desc);
105299381d8720 Mike Turquette        2014-08-18  349  		kirkwood_clk_muxing_setup(cgnp, kirkwood_mux_desc);
e7beeab9c61591 Yangtao Li            2018-12-26  350  
e7beeab9c61591 Yangtao Li            2018-12-26  351  		of_node_put(cgnp);
105299381d8720 Mike Turquette        2014-08-18  352  	}
e89406c957459a Sebastian Hesselbarth 2013-05-11  353  }
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  354  CLK_OF_DECLARE(kirkwood_clk, "marvell,kirkwood-core-clock",
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  355  	       kirkwood_clk_init);
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  356  CLK_OF_DECLARE(mv88f6180_clk, "marvell,mv88f6180-core-clock",
58d516ae95cbf7 Sebastian Hesselbarth 2014-01-25  357  	       kirkwood_clk_init);
88aa7af9c18038 Chris Packham         2019-06-18 @358  CLK_OF_DECLARE(98dx1135_clk, "marvell,mv98dx1135-core-clock",

:::::: The code at line 358 was first introduced by commit
:::::: 88aa7af9c180381d9612ebbb5c8b0b3f96514373 clk: kirkwood: Add support for MV98DX1135

:::::: TO: Chris Packham <chris.packham@alliedtelesis.co.nz>
:::::: CC: Stephen Boyd <sboyd@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
