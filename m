Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C167D
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644832793; x=1676368793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkE7ZB+HG58Bb8iZcYin4WAJ58blIEp7ZEadKNZd9f0=;
  b=bYnGcDSF8Fy4gAgh9dOxZ2UXF1G88fri3knmyxwSpY70nR9TwJA6zzQQ
   6bYX8voPhjMTHF6IQsTSBWmDpDsBjbQRkx32z+QFV2DjnNV3RXl31j1B/
   xypdMqROOfGCECouy/jqbAdIEjFbRMgyvV2wfBNKneLW46CoFsS+D6xhj
   hBFxu7EvStjx/EflhvjxOSrN3EsX49cPcRbDiH/XgbSwoEhm/URTRdH/f
   IUMDnmqLBoeGjJBV8RxuH8LMAGvtNxOZzKQO4E2Vqx0nnFy8UJLr/BE/n
   aB+MO8Wvitj0WeyawZJX6qLayGmBzJ7SZ6z0KWOreaohO16Tzy3F35bFQ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="233605045"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="233605045"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 01:59:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="501680245"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Feb 2022 01:59:51 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJY98-0008N3-PV; Mon, 14 Feb 2022 09:59:50 +0000
Date: Mon, 14 Feb 2022 17:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Bakker <xc-racer2@live.ca>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/samsung/aries_wm8994.c:525:34: warning: unused variable
 'samsung_wm8994_of_match'
Message-ID: <202202141756.kbtxAPyD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   754e0b0e35608ed5206d6a67a791563c631cec07
commit: 7a3a7671fa6c7e90aff5f4242add2a40587b85ef ASoC: samsung: Add driver for Aries boards
date:   1 year, 8 months ago
config: hexagon-randconfig-r035-20220213 (https://download.01.org/0day-ci/archive/20220214/202202141756.kbtxAPyD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a3a7671fa6c7e90aff5f4242add2a40587b85ef
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7a3a7671fa6c7e90aff5f4242add2a40587b85ef
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash sound/soc/samsung/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/samsung/aries_wm8994.c:525:34: warning: unused variable 'samsung_wm8994_of_match' [-Wunused-const-variable]
   static const struct of_device_id samsung_wm8994_of_match[] = {
                                    ^
   1 warning generated.


vim +/samsung_wm8994_of_match +525 sound/soc/samsung/aries_wm8994.c

   524	
 > 525	static const struct of_device_id samsung_wm8994_of_match[] = {
   526		{
   527			.compatible = "samsung,fascinate4g-wm8994",
   528			.data = &fascinate4g_variant,
   529		},
   530		{
   531			.compatible = "samsung,aries-wm8994",
   532			.data = &aries_variant,
   533		},
   534		{ /* sentinel */ },
   535	};
   536	MODULE_DEVICE_TABLE(of, samsung_wm8994_of_match);
   537	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
