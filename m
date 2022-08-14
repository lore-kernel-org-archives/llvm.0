Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBE0EDA
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660482120; x=1692018120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIQ1ZT9pOnDjlLygFn4YLE+Msxyu9MQbwhwxZukyOUg=;
  b=N+2MP+M30BADWJ173oBN8T6SjHzywDyQPNYLzLbY2wGTu7jGt8ClhLcI
   zpwXTsbSbFReQZmmtLqMOro+TdP75MrjsBN6XmPa01x3NfqYaLkmddwH3
   iVacT7IfV1qc+r1WrKVEQ84wGXR0641Wv1b5Bj1Trgrcp027k89NlHx/Z
   y2Ry1DhJ2UTCTxmXRWH8BUuV9/frX8/IKHOJt+BnfW796yGfIDGf9V3ug
   cmTqsW/4QWyS9qYxUCDglZySwjgOInmFmsSENmU5ikpEfaxkiaWN7W8YD
   Gu0CIak88+Z0OUg6ekb9B78efTjej/vpxeZTHaIVI/Xs6R1fCisKZP9OB
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="289392712"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="289392712"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2022 06:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="639375320"
Received: from lkp-server02.sh.intel.com (HELO 3d2a4d02a2a9) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Aug 2022 06:01:57 -0700
Received: from kbuild by 3d2a4d02a2a9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oNDFd-00006Y-0p;
	Sun, 14 Aug 2022 13:01:57 +0000
Date: Sun, 14 Aug 2022 21:01:34 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/clk/loongson1/clk-loongson1b.c:40:13: warning: no previous
 prototype for function 'ls1x_clk_init'
Message-ID: <202208142045.g3U91bp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   1 year, 11 months ago
config: mips-randconfig-r023-20220731 (https://download.01.org/0day-ci/archive/20220814/202208142045.g3U91bp3-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c434b9f80b0923e6460031b0fd964f8b0bf3c6a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/ drivers/clk/loongson1/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/loongson1/clk-loongson1b.c:40:13: warning: no previous prototype for function 'ls1x_clk_init' [-Wmissing-prototypes]
   void __init ls1x_clk_init(void)
               ^
   drivers/clk/loongson1/clk-loongson1b.c:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init ls1x_clk_init(void)
   ^
   static 
   1 warning generated.


vim +/ls1x_clk_init +40 drivers/clk/loongson1/clk-loongson1b.c

3526f74fa925e4 drivers/clk/clk-ls1x.c Kelvin Cheung 2014-10-10  39  
5175cb5894d606 drivers/clk/clk-ls1x.c Kelvin Cheung 2012-08-20 @40  void __init ls1x_clk_init(void)

:::::: The code at line 40 was first introduced by commit
:::::: 5175cb5894d606f1756c07a685e6dcabd2d8745a clk: add Loongson1B clock support

:::::: TO: Kelvin Cheung <keguang.zhang@gmail.com>
:::::: CC: Mike Turquette <mturquette@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
