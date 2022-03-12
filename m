Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514052F26
	for <llvm@lists.linux.dev>; Sat, 12 Mar 2022 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647105759; x=1678641759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZM0gVtb7PI87L9rILciXCy/mrwMfDecRtaiITZvUlfc=;
  b=e4wB5D+apNa8Lr1PGmFO5Z80Pvm21GD/HDBUShvl+mEfXHMLJCG9GCgM
   +Tt4GXVsDQubMQfWbJk/mnLzkXmbFbzJWexY6+qfv/2WxsNHtn5p9Ul4/
   H5OD4y8ChZamrA+1oUD5tBsZEJu1/ISHd/8Uz1t6nEMsAAD+KpYrwohNa
   NOYhvp72/od2IDCur81/aKK49XJDQePhpDhr+j9Ty1EK3oPNsg5rP2vfE
   Ehzbi4BdsqIsXV7h8FyGBXOyj8PNjl5mP5DoMcRrihpmOhS+XoRVf6nDm
   DQolItTDPPd02pT4FWa+1affu+9AAZdo8uutN9uEmucR+xLQhaMFADfFz
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10284"; a="280557798"
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="280557798"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2022 09:22:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="555788498"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Mar 2022 09:22:37 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nT5Rs-000875-Mk; Sat, 12 Mar 2022 17:22:36 +0000
Date: Sun, 13 Mar 2022 01:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [rmk-arm:zii 183/199]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:378:1: error: non-void function
 does not return a value
Message-ID: <202203130106.mIhChrsp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.armlinux.org.uk/~rmk/linux-arm zii
head:   22f6fd6865d54d3632278e7f17bad52308e50311
commit: b36d94695f6930a807fb5a6ed3dff972b9ea8c71 [183/199] net: mtk_eth_soc: move MAC_MCR setting to mac_finish()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220313/202203130106.mIhChrsp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 43f668b98e8d87290fc6bbf5ed13c3ab542e3497)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm zii
        git checkout b36d94695f6930a807fb5a6ed3dff972b9ea8c71
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/mediatek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:378:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +378 drivers/net/ethernet/mediatek/mtk_eth_soc.c

   361	
   362	static int mtk_mac_finish(struct phylink_config *config, unsigned int mode,
   363				  phy_interface_t interface)
   364	{
   365		struct mtk_mac *mac = container_of(config, struct mtk_mac,
   366						   phylink_config);
   367		u32 mcr_cur, mcr_new;
   368	
   369		/* Setup gmac */
   370		mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
   371		mcr_new = mcr_cur;
   372		mcr_new |= MAC_MCR_IPG_CFG | MAC_MCR_FORCE_MODE |
   373			   MAC_MCR_BACKOFF_EN | MAC_MCR_BACKPR_EN | MAC_MCR_FORCE_LINK;
   374	
   375		/* Only update control register when needed! */
   376		if (mcr_new != mcr_cur)
   377			mtk_w32(mac->hw, mcr_new, MTK_MAC_MCR(mac->id));
 > 378	}
   379	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
