Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5351D2100
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652427601; x=1683963601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jTZDizA5sLyv0KPIQpF8N4wyj6bf1/Y7F4xddqWAhxE=;
  b=Dt3m4Xkxq8iWbqYozJjmMVAXdO7/Fk1Y34YCyd26vjMF8rxtjdYDWexf
   q9mEQV/ohH8DbMtOgxq2Bze88PPSVdfVSOBsWBBsVJIHPfhiYFOVk4LyQ
   nSEpk3IaDPyies71vuOgz3D3nD0kvnQQUP66VgsDPwcVxcCSC3sFyDPPB
   X+2eZHgcFsfACLThVoDsKao4b/E+STi4q9ooo75wBI+SnxYvr2oNU0itW
   AhZA7Npqe5zXH33jO2EFPlpVZqyVROY1xJH6BAAaOUixhCxgw/Ntv8lDX
   ExRDnSLVVGJxQc/4P2Ek0dYyU70LJ2FumR/IwzpwuFWKXdUPHqrTPFadw
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="269913322"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="269913322"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 00:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="712296509"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 May 2022 00:38:15 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npPsM-000LUv-MB;
	Fri, 13 May 2022 07:38:14 +0000
Date: Fri, 13 May 2022 15:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7518/11360]
 arch/arm/mach-spear/spear6xx.c:365:13: warning: no previous prototype for
 function 'spear6xx_map_io'
Message-ID: <202205131534.YUrkTw9s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   187b9ac8c348383f7f36c8413d73ad89e9b1e90a
commit: 1a82d85108afbd1d3b5596cf3cadd378900a9ec2 [7518/11360] Merge branch 'omap1-multiplatform-5.18' into arm/multiplatform-late
config: arm-buildonly-randconfig-r004-20220512 (https://download.01.org/0day-ci/archive/20220513/202205131534.YUrkTw9s-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1a82d85108afbd1d3b5596cf3cadd378900a9ec2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1a82d85108afbd1d3b5596cf3cadd378900a9ec2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mach-spear/ drivers/clk/spear/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-spear/spear6xx.c:365:13: warning: no previous prototype for function 'spear6xx_map_io' [-Wmissing-prototypes]
   void __init spear6xx_map_io(void)
               ^
   arch/arm/mach-spear/spear6xx.c:365:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init spear6xx_map_io(void)
   ^
   static 
>> arch/arm/mach-spear/spear6xx.c:370:13: warning: no previous prototype for function 'spear6xx_timer_init' [-Wmissing-prototypes]
   void __init spear6xx_timer_init(void)
               ^
   arch/arm/mach-spear/spear6xx.c:370:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init spear6xx_timer_init(void)
   ^
   static 
   2 warnings generated.
--
>> drivers/clk/spear/spear6xx_clock.c:116:13: warning: no previous prototype for function 'spear6xx_clk_init' [-Wmissing-prototypes]
   void __init spear6xx_clk_init(void __iomem *misc_base)
               ^
   drivers/clk/spear/spear6xx_clock.c:116:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init spear6xx_clk_init(void __iomem *misc_base)
   ^
   static 
   1 warning generated.


vim +/spear6xx_map_io +365 arch/arm/mach-spear/spear6xx.c

8f590d4541fb678 arch/arm/mach-spear6xx/spear6xx.c Viresh Kumar      2010-04-01  363  
8f590d4541fb678 arch/arm/mach-spear6xx/spear6xx.c Viresh Kumar      2010-04-01  364  /* This will create static memory mapping for selected devices */
8f590d4541fb678 arch/arm/mach-spear6xx/spear6xx.c Viresh Kumar      2010-04-01 @365  void __init spear6xx_map_io(void)
8f590d4541fb678 arch/arm/mach-spear6xx/spear6xx.c Viresh Kumar      2010-04-01  366  {
8f590d4541fb678 arch/arm/mach-spear6xx/spear6xx.c Viresh Kumar      2010-04-01  367  	iotable_init(spear6xx_io_desc, ARRAY_SIZE(spear6xx_io_desc));
8f590d4541fb678 arch/arm/mach-spear6xx/spear6xx.c Viresh Kumar      2010-04-01  368  }
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  369  
6bb27d7349db51b arch/arm/mach-spear6xx/spear6xx.c Stephen Warren    2012-11-08 @370  void __init spear6xx_timer_init(void)
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  371  {
a8f4bf0eb4ca7a0 arch/arm/mach-spear6xx/spear6xx.c Vipul Kumar Samar 2012-07-10  372  	char pclk_name[] = "pll3_clk";
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  373  	struct clk *gpt_clk, *pclk;
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  374  
d9909ebe650f028 arch/arm/mach-spear/spear6xx.c    Arnd Bergmann     2012-12-02  375  	spear6xx_clk_init(MISC_BASE);
5df33a62c4a028d arch/arm/mach-spear6xx/spear6xx.c Viresh Kumar      2012-04-10  376  
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  377  	/* get the system timer clock */
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  378  	gpt_clk = clk_get_sys("gpt0", NULL);
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  379  	if (IS_ERR(gpt_clk)) {
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  380  		pr_err("%s:couldn't get clk for gpt\n", __func__);
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  381  		BUG();
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  382  	}
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  383  
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  384  	/* get the suitable parent clock for timer*/
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  385  	pclk = clk_get(NULL, pclk_name);
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  386  	if (IS_ERR(pclk)) {
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  387  		pr_err("%s:couldn't get %s as parent for gpt\n",
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  388  				__func__, pclk_name);
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  389  		BUG();
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  390  	}
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  391  
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  392  	clk_set_parent(gpt_clk, pclk);
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  393  	clk_put(gpt_clk);
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  394  	clk_put(pclk);
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  395  
30551c0108e0d2f arch/arm/mach-spear6xx/spear6xx.c Viresh Kumar      2012-04-21  396  	spear_setup_of_timer();
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  397  }
5c881d9ae948017 arch/arm/mach-spear6xx/spear6xx.c Shiraz Hashim     2011-02-16  398  

:::::: The code at line 365 was first introduced by commit
:::::: 8f590d4541fb678a638777ab987709217cb71365 ARM: 6015/1: ST SPEAr: Added source files for SPEAr6xx machine family

:::::: TO: viresh kumar <viresh.kumar@st.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
