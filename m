Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EEF2C99
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 07:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639379321; x=1670915321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vA5t5KyQbPbx3iGFvK1xUB6rC2cV1pH7nqupl7wfEQ=;
  b=QygJ87iN5zte0poBZnQft9f31Dw4ltImpCdp5Z5D+xGttgbPZyF96jOw
   cI8mFJf2mEUS1L4AY6qzHQKKyak6yDPocZkNwZt2rkSW/A4TgexI+DVAF
   +Rsgu0ObIgeWZHOyxyixJQBcIFEoUsEeGPU72Gl4CGdBhF3AfdTWNmMV8
   G8Qn/vZWNCX0vTSA++ZEmBxJUFZMKj3gCmbVUYEZEuk/hSqT98qOsKsqE
   3ONqL6EvyXc6CpF7Z+vG+dQZF7uizfAv+6kP7oW3WgADbnt/8xUkJLV2+
   5rzfKIAlavZvvjugGp+xVneI84Xe7ltAfBOPXfDzwu9fWckvu2oCDWS1u
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="225536257"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="225536257"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2021 23:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="754167065"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2021 23:08:39 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwfRv-0006Pu-01; Mon, 13 Dec 2021 07:08:39 +0000
Date: Mon, 13 Dec 2021 15:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 168/186] drivers/net/phy/phylink.c:2707:33: error: no
 member named 'sfp_link_an_mode' in 'struct phylink'; did you mean
 'cfg_link_an_mode'?
Message-ID: <202112131514.7ATEatIp-lkp@intel.com>
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
head:   bc8489278c9545054f74b2226d3e2c09ec4e05fe
commit: efbf0d75c44bb5fb993fd90f03121a045abf2b77 [168/186] net: phylink: pass mode into phylink_validate()
config: i386-randconfig-a012-20211212 (https://download.01.org/0day-ci/archive/20211213/202112131514.7ATEatIp-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm zii
        git checkout efbf0d75c44bb5fb993fd90f03121a045abf2b77
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:2707:33: error: no member named 'sfp_link_an_mode' in 'struct phylink'; did you mean 'cfg_link_an_mode'?
           ret = phylink_validate(pl, pl->sfp_link_an_mode, support, &config);
                                          ^~~~~~~~~~~~~~~~
                                          cfg_link_an_mode
   drivers/net/phy/phylink.c:55:5: note: 'cfg_link_an_mode' declared here
           u8 cfg_link_an_mode;            /* MLO_AN_xxx */
              ^
   drivers/net/phy/phylink.c:2724:33: error: no member named 'sfp_link_an_mode' in 'struct phylink'; did you mean 'cfg_link_an_mode'?
           ret = phylink_validate(pl, pl->sfp_link_an_mode, support1, &config);
                                          ^~~~~~~~~~~~~~~~
                                          cfg_link_an_mode
   drivers/net/phy/phylink.c:55:5: note: 'cfg_link_an_mode' declared here
           u8 cfg_link_an_mode;            /* MLO_AN_xxx */
              ^
   2 errors generated.


vim +2707 drivers/net/phy/phylink.c

  2684	
  2685	static int phylink_sfp_config(struct phylink *pl, u8 mode,
  2686				      const unsigned long *supported,
  2687				      const unsigned long *advertising)
  2688	{
  2689		__ETHTOOL_DECLARE_LINK_MODE_MASK(support1);
  2690		__ETHTOOL_DECLARE_LINK_MODE_MASK(support);
  2691		struct phylink_link_state config;
  2692		phy_interface_t iface;
  2693		bool changed;
  2694		int ret;
  2695	
  2696		linkmode_copy(support, supported);
  2697	
  2698		memset(&config, 0, sizeof(config));
  2699		linkmode_copy(config.advertising, advertising);
  2700		config.interface = PHY_INTERFACE_MODE_NA;
  2701		config.speed = SPEED_UNKNOWN;
  2702		config.duplex = DUPLEX_UNKNOWN;
  2703		config.pause = MLO_PAUSE_AN;
  2704		config.an_enabled = pl->link_config.an_enabled;
  2705	
  2706		/* Ignore errors if we're expecting a PHY to attach later */
> 2707		ret = phylink_validate(pl, pl->sfp_link_an_mode, support, &config);
  2708		if (ret) {
  2709			phylink_err(pl, "validation with support %*pb failed: %d\n",
  2710				    __ETHTOOL_LINK_MODE_MASK_NBITS, support, ret);
  2711			return ret;
  2712		}
  2713	
  2714		iface = sfp_select_interface(pl->sfp_bus, config.advertising);
  2715		if (iface == PHY_INTERFACE_MODE_NA) {
  2716			phylink_err(pl,
  2717				    "selection of interface failed, advertisement %*pb\n",
  2718				    __ETHTOOL_LINK_MODE_MASK_NBITS, config.advertising);
  2719			return -EINVAL;
  2720		}
  2721	
  2722		config.interface = iface;
  2723		linkmode_copy(support1, support);
  2724		ret = phylink_validate(pl, pl->sfp_link_an_mode, support1, &config);
  2725		if (ret) {
  2726			phylink_err(pl, "validation of %s/%s with support %*pb failed: %d\n",
  2727				    phylink_an_mode_str(mode),
  2728				    phy_modes(config.interface),
  2729				    __ETHTOOL_LINK_MODE_MASK_NBITS, support, ret);
  2730			return ret;
  2731		}
  2732	
  2733		phylink_dbg(pl, "requesting link mode %s/%s with support %*pb\n",
  2734			    phylink_an_mode_str(mode), phy_modes(config.interface),
  2735			    __ETHTOOL_LINK_MODE_MASK_NBITS, support);
  2736	
  2737		if (phy_interface_mode_is_8023z(iface) && pl->phydev)
  2738			return -EINVAL;
  2739	
  2740		changed = !linkmode_equal(pl->supported, support) ||
  2741			  !linkmode_equal(pl->link_config.advertising,
  2742					  config.advertising);
  2743		if (changed) {
  2744			linkmode_copy(pl->supported, support);
  2745			linkmode_copy(pl->link_config.advertising, config.advertising);
  2746		}
  2747	
  2748		if (pl->cur_link_an_mode != mode ||
  2749		    pl->link_config.interface != config.interface) {
  2750			pl->link_config.interface = config.interface;
  2751			pl->cur_link_an_mode = mode;
  2752	
  2753			changed = true;
  2754	
  2755			phylink_info(pl, "switched to %s/%s link mode\n",
  2756				     phylink_an_mode_str(mode),
  2757				     phy_modes(config.interface));
  2758		}
  2759	
  2760		pl->link_port = pl->sfp_port;
  2761	
  2762		if (changed && !test_bit(PHYLINK_DISABLE_STOPPED,
  2763					 &pl->phylink_disable_state))
  2764			phylink_mac_initial_config(pl, false);
  2765	
  2766		return ret;
  2767	}
  2768	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
