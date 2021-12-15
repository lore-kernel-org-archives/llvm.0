Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3D22CA5
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 04:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639544268; x=1671080268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vqc24zCzq1e6DXraeDv6aaFLJ4i79WQWgPq87PYLsvo=;
  b=CWVJipkegDyHWwNCYUOXD5M8ttt44QVoktO4H+reOIKc6RS9sBhV370O
   jISzNeOWh0jc4LlqcI9uZC/eubvoTwPxwg65tSsgXoQd6HRDg1YOZanQ1
   md2HlR15xh0RO0zlkmDeD41V9XgkJWr3H7ViBjiseQ24xE4dWxzFBWW4P
   aByJsqgeOK8c3siL6Fk+atCiagHoNDayF+YIFWpp3rkAmvGydMdId3yce
   w11e3g0Jveawha0sjgwVvnmOiF0jvRzMPHKdUQkw1MjPJGvNIQzGPkk0U
   Ab78XwVjPla3EI5ZJNiRzc7j5PjK/eWRogCQ9nymOwb//g7AedRuqJh6z
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="219831947"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="219831947"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 20:57:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="614574645"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2021 20:57:45 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxMMK-0001He-Gm; Wed, 15 Dec 2021 04:57:44 +0000
Date: Wed, 15 Dec 2021 12:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 111/186] drivers/net/ethernet/cadence/macb_main.c:736:10:
 error: returning 'struct phylink_pcs' from a function with incompatible
 result type 'struct phylink_pcs *'; take the address with &
Message-ID: <202112151224.UQXJMgLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   d3ebd79d7fb6476e2409c147e4dcc304733f7ae6
commit: 4a3afb218aacb819703cf3336e5c7c83b41b10fb [111/186] net: macb: use .mac_select_pcs() interface
config: x86_64-randconfig-r016-20211214 (https://download.01.org/0day-ci/archive/20211215/202112151224.UQXJMgLg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm zii
        git checkout 4a3afb218aacb819703cf3336e5c7c83b41b10fb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:736:10: error: returning 'struct phylink_pcs' from a function with incompatible result type 'struct phylink_pcs *'; take the address with &
                   return bp->phylink_sgmii_pcs;
                          ^~~~~~~~~~~~~~~~~~~~~
                          &
   1 error generated.


vim +736 drivers/net/ethernet/cadence/macb_main.c

   726	
   727	static struct phylink_pcs *macb_mac_select_pcs(struct phylink_config *config,
   728						       phy_interface_t interface)
   729	{
   730		struct net_device *ndev = to_net_dev(config->dev);
   731		struct macb *bp = netdev_priv(ndev);
   732	
   733		if (interface == PHY_INTERFACE_MODE_10GBASER)
   734			return &bp->phylink_usx_pcs;
   735		else if (interface == PHY_INTERFACE_MODE_SGMII)
 > 736			return bp->phylink_sgmii_pcs;
   737		else
   738			return NULL;
   739	}
   740	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
