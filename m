Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A76A20
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 02:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651111226; x=1682647226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/JcJvW3wfTIckLeDxPcud6kbJn60l+xQzGdJji3ixI=;
  b=HlNP1ie2s15MASMszxQ5Bbej6jZWxqQ8fHu3eFPlP6W8UUxWqKKgDdAS
   Xn1aJo77MbkiHt36mp7xU4Ct2VGVfOX/uZx2ZMsFo2pO8PQcj3a/kv5cM
   2IfTb6cKitQZWBfuqxLfOchH3GkV1cGyCEn8Ea9UOrAdnkkL455eGzc2F
   68qdTj3xcLN9G6PLdNzy7CMBWBsC8ufgDnngyiI0uDfyUxEjfDoadTQY7
   AIZULT58qEdygxRWDMKEDoCJcxLw5reqbk7dVGuC1d/2kBio0nlLtNma3
   FuYxuRt6cd3hw7DFAAr9djSTlLvVQsdfQ3G6ir8nnPuaR6B8xp4mNiPt2
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="329074372"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; 
   d="scan'208";a="329074372"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 19:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; 
   d="scan'208";a="661511056"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2022 19:00:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njtSB-0004xn-Kq;
	Thu, 28 Apr 2022 02:00:23 +0000
Date: Thu, 28 Apr 2022 09:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4808/7265] arch/arm/mach-omap1/timer32k.c:215:12:
 warning: no previous prototype for function 'omap_init_clocksource_32k'
Message-ID: <202204280347.ar7Y3m5k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f02ac5c95dfd45d2f50ecc68d79177de326c668c
commit: d379e8899a8da1041c347ae5b792773c48a559a9 [4808/7265] ARM: omap1: move 32k counter from plat-omap to mach-omap1
config: arm-omap1_defconfig (https://download.01.org/0day-ci/archive/20220428/202204280347.ar7Y3m5k-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d379e8899a8da1041c347ae5b792773c48a559a9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d379e8899a8da1041c347ae5b792773c48a559a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
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
