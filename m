Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97B17C9
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 01:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650071804; x=1681607804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ees7IPH/fyK16FrtXahx0Ir31jrszHICg9rnHdHeWO0=;
  b=enVHVCHGmHR78DCwbMQgXv4VdfD33uzyWCewEVbAjPpXYhcEjuOdonUC
   Hf7OSDbuIpFDYAPRHUXGnQKhFgXmvpY3RtjmbxGkgkBhLMm8NuCpE26eC
   Noj03fRlmOpMcpU7MnwGthL2ClUmKFB0cx6jPK7SPW/KzZotuE7ZS/uAQ
   tccEgxd1cq02oy9nJG2TMPiZBIV8hzZmnocHEURflYMyN9UnP/QGltWAk
   tmdkOsC5lw3u4FFlKcx2X8cAU0AvbU5XYouA2zc8mKFXKx1JLd2imuzSf
   OcAopH889hl/C46pLQg7tLd3oMWWTBuKh1QPJwVCxgOv9fqSvcl6clMAx
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="243187571"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="243187571"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 18:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="624704073"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2022 18:16:42 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfX3J-0002cP-GT;
	Sat, 16 Apr 2022 01:16:41 +0000
Date: Sat, 16 Apr 2022 09:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:omap1-multiplatform-5.18 18/33]
 arch/arm/mach-omap1/timer32k.c:215:12: warning: no previous prototype for
 function 'omap_init_clocksource_32k'
Message-ID: <202204160929.WuBwkKEz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap1-multiplatform-5.18
head:   fab2b1f2488cb81853e5e8c7d37d58963b8462bc
commit: 2f4dfef6e4950959786c965fefbb6aee6e4f0c67 [18/33] ARM: omap1: move 32k counter from plat-omap to mach-omap1
config: arm-omap1_defconfig (https://download.01.org/0day-ci/archive/20220416/202204160929.WuBwkKEz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=2f4dfef6e4950959786c965fefbb6aee6e4f0c67
        git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
        git fetch --no-tags soc omap1-multiplatform-5.18
        git checkout 2f4dfef6e4950959786c965fefbb6aee6e4f0c67
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-omap1/timer32k.c:215:12: warning: no previous prototype for function 'omap_init_clocksource_32k' [-Wmissing-prototypes]
   int __init omap_init_clocksource_32k(void __iomem *vbase)
              ^
   arch/arm/mach-omap1/timer32k.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init omap_init_clocksource_32k(void __iomem *vbase)
   ^
   static 
   1 warning generated.


vim +/omap_init_clocksource_32k +215 arch/arm/mach-omap1/timer32k.c

   205	
   206	/**
   207	 * omap_init_clocksource_32k - setup and register counter 32k as a
   208	 * kernel clocksource
   209	 * @pbase: base addr of counter_32k module
   210	 * @size: size of counter_32k to map
   211	 *
   212	 * Returns 0 upon success or negative error code upon failure.
   213	 *
   214	 */
 > 215	int __init omap_init_clocksource_32k(void __iomem *vbase)
   216	{
   217		int ret;
   218	
   219		/*
   220		 * 32k sync Counter IP register offsets vary between the
   221		 * highlander version and the legacy ones.
   222		 * The 'SCHEME' bits(30-31) of the revision register is used
   223		 * to identify the version.
   224		 */
   225		if (readl_relaxed(vbase + OMAP2_32KSYNCNT_REV_OFF) &
   226							OMAP2_32KSYNCNT_REV_SCHEME)
   227			sync32k_cnt_reg = vbase + OMAP2_32KSYNCNT_CR_OFF_HIGH;
   228		else
   229			sync32k_cnt_reg = vbase + OMAP2_32KSYNCNT_CR_OFF_LOW;
   230	
   231		/*
   232		 * 120000 rough estimate from the calculations in
   233		 * __clocksource_update_freq_scale.
   234		 */
   235		clocks_calc_mult_shift(&persistent_mult, &persistent_shift,
   236				32768, NSEC_PER_SEC, 120000);
   237	
   238		ret = clocksource_mmio_init(sync32k_cnt_reg, "32k_counter", 32768,
   239					250, 32, clocksource_mmio_readl_up);
   240		if (ret) {
   241			pr_err("32k_counter: can't register clocksource\n");
   242			return ret;
   243		}
   244	
   245		sched_clock_register(omap_32k_read_sched_clock, 32, 32768);
   246		register_persistent_clock(omap_read_persistent_clock64);
   247		pr_info("OMAP clocksource: 32k_counter at 32768 Hz\n");
   248	
   249		return 0;
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
