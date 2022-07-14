Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8967A
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 06:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657779445; x=1689315445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kXMbwDzdytJFyBADZiAzFuPD/6ct5HLfHQXDT4kh1Rg=;
  b=XZxpPycAd9e61V7Huva+NIF45SSarmJNLohjwwlDMOxcvR/n55F1eXA1
   YN4zRTRA80criVAAKYXWNDXLd7TiZZGHX5EBOeGBEnkyub8WiqJ+Xwplk
   E2m5t3cr9qG3u+qTxFZuAX2I4RIkyeR2MkMT/D4aJQors1+CSLD6oZgTX
   68Zv3152cxi3UxL5II5N/6vqUz66R/yv1QblLOAlnwdvoL1W43H9wsgL3
   qgP/24v07W3jEOS8T9Cv7Yl2TZc6/AMBCh2tYOigDdZlcwf98773jpYv/
   44/Xgf1+SEj/ze9a0WUEns6dh94NTsCqRz8uFa5D1G6HBK7NjPLTRhKeN
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="286566452"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="286566452"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 23:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="595975949"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jul 2022 23:17:01 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBs9l-0000IA-1q;
	Thu, 14 Jul 2022 06:17:01 +0000
Date: Thu, 14 Jul 2022 14:16:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arun Ramadoss <arun.ramadoss@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4365/10347]
 drivers/net/dsa/microchip/ksz_spi.c:132:34: warning: unused variable
 'ksz_dt_ids'
Message-ID: <202207141406.IF2aPRxC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4662b7adea50bb62e993a67f611f3be625d3df0d
commit: 4658f2fe8fbcb12c1db0577ad9c46b67f10d09f1 [4365/10347] net: dsa: microchip: common ksz_spi_probe for ksz switches
config: hexagon-randconfig-r023-20220714 (https://download.01.org/0day-ci/archive/20220714/202207141406.IF2aPRxC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4658f2fe8fbcb12c1db0577ad9c46b67f10d09f1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4658f2fe8fbcb12c1db0577ad9c46b67f10d09f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/dsa/microchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/microchip/ksz_spi.c:132:34: warning: unused variable 'ksz_dt_ids' [-Wunused-const-variable]
   static const struct of_device_id ksz_dt_ids[] = {
                                    ^
   1 warning generated.


vim +/ksz_dt_ids +132 drivers/net/dsa/microchip/ksz_spi.c

   131	
 > 132	static const struct of_device_id ksz_dt_ids[] = {
   133		{
   134			.compatible = "microchip,ksz8765",
   135			.data = &ksz_switch_chips[KSZ8765]
   136		},
   137		{
   138			.compatible = "microchip,ksz8794",
   139			.data = &ksz_switch_chips[KSZ8794]
   140		},
   141		{
   142			.compatible = "microchip,ksz8795",
   143			.data = &ksz_switch_chips[KSZ8795]
   144		},
   145		{
   146			.compatible = "microchip,ksz8863",
   147			.data = &ksz_switch_chips[KSZ8830]
   148		},
   149		{
   150			.compatible = "microchip,ksz8873",
   151			.data = &ksz_switch_chips[KSZ8830]
   152		},
   153		{
   154			.compatible = "microchip,ksz9477",
   155			.data = &ksz_switch_chips[KSZ9477]
   156		},
   157		{
   158			.compatible = "microchip,ksz9897",
   159			.data = &ksz_switch_chips[KSZ9897]
   160		},
   161		{
   162			.compatible = "microchip,ksz9893",
   163			.data = &ksz_switch_chips[KSZ9893]
   164		},
   165		{
   166			.compatible = "microchip,ksz9563",
   167			.data = &ksz_switch_chips[KSZ9893]
   168		},
   169		{
   170			.compatible = "microchip,ksz8563",
   171			.data = &ksz_switch_chips[KSZ9893]
   172		},
   173		{
   174			.compatible = "microchip,ksz9567",
   175			.data = &ksz_switch_chips[KSZ9567]
   176		},
   177		{},
   178	};
   179	MODULE_DEVICE_TABLE(of, ksz_dt_ids);
   180	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
