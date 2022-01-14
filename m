Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27702C82
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642143212; x=1673679212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XR0DPoYW/drq7biMjiY+mWsMAbXR7X6sLupRmBeS/Cs=;
  b=LnlvNjmwCH4nYwCYyj2B+UkpnEkXtqybS0l1n0aV+2PzycNvrGBVAnmQ
   WV0PKIJyfiJUc/vbxC6gnRbN65cpZD7esnuehKBI89JwpdSOy/7uqNVj2
   AoXu2hV6WAv2PqGf42SeVHGsrITJepyi7vHBox0tQufDGM/48pwXZc2Yv
   RxTGqnGJ5LgIWt0+NZlmSg/H4Xlv0pQKygduE82qPigm5OSnPC9Md4zRt
   RklEpbMDfasSAIrBCmgtQGFZNKrmD+9bQioI2KzjkvMQp5vhA8OX6HiTK
   mPr4xyQIWl70EtFGSmMGLDwhPx69Ykfw9/BFK1MBeuYFaNA+peJ4uo11y
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="268557795"
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="268557795"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 22:53:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,287,1635231600"; 
   d="scan'208";a="559380376"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Jan 2022 22:53:29 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8GSm-0008DT-G9; Fri, 14 Jan 2022 06:53:28 +0000
Date: Fri, 14 Jan 2022 14:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, joabreu@synopsys.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [PATCH 2/2] stmmac: intel: Honor phy LED set by system firmware
 on a Dell hardware
Message-ID: <202201141429.5HZ7UZB6-lkp@intel.com>
References: <20220114040755.1314349-2-kai.heng.feng@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114040755.1314349-2-kai.heng.feng@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Kai-Heng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16 next-20220113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kai-Heng-Feng/net-phy-marvell-Use-BIT-macro-for-flags/20220114-120936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git fb3b0673b7d5b477ed104949450cd511337ba3c6
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220114/202201141429.5HZ7UZB6-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/83e7c70ef5632f6b94caf8221a20db0881ee6ce2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kai-Heng-Feng/net-phy-marvell-Use-BIT-macro-for-flags/20220114-120936
        git checkout 83e7c70ef5632f6b94caf8221a20db0881ee6ce2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/phy/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/phy/marvell.c:755:27: warning: result of comparison of constant -1 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
           if (priv->led_def_config == -1)
               ~~~~~~~~~~~~~~~~~~~~ ^  ~~
   1 warning generated.


vim +755 drivers/net/phy/marvell.c

   749	
   750	static void marvell_config_led(struct phy_device *phydev)
   751	{
   752		struct marvell_priv *priv = phydev->priv;
   753		int err;
   754	
 > 755		if (priv->led_def_config == -1)
   756			return;
   757	
   758		if (priv->led_def_config)
   759			goto write;
   760	
   761		if (phydev->dev_flags & MARVELL_PHY_USE_PRESET_LED) {
   762			priv->led_def_config = phy_read_paged(phydev, MII_MARVELL_LED_PAGE,
   763							      MII_PHY_LED_CTRL);
   764			if (priv->led_def_config < 0) {
   765				priv->led_def_config = -1;
   766				return;
   767			}
   768		} else {
   769			switch (MARVELL_PHY_FAMILY_ID(phydev->phy_id)) {
   770			/* Default PHY LED config: LED[0] .. Link, LED[1] .. Activity */
   771			case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1121R):
   772			case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1318S):
   773				priv->led_def_config = MII_88E1121_PHY_LED_DEF;
   774				break;
   775			/* Default PHY LED config:
   776			 * LED[0] .. 1000Mbps Link
   777			 * LED[1] .. 100Mbps Link
   778			 * LED[2] .. Blink, Activity
   779			 */
   780			case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1510):
   781				if (phydev->dev_flags & MARVELL_PHY_LED0_LINK_LED1_ACTIVE)
   782					priv->led_def_config = MII_88E1510_PHY_LED0_LINK_LED1_ACTIVE;
   783				else
   784					priv->led_def_config = MII_88E1510_PHY_LED_DEF;
   785				break;
   786			default:
   787				priv->led_def_config = -1;
   788				return;
   789			}
   790		}
   791	
   792	write:
   793		err = phy_write_paged(phydev, MII_MARVELL_LED_PAGE, MII_PHY_LED_CTRL,
   794				      priv->led_def_config);
   795		if (err < 0)
   796			phydev_warn(phydev, "Fail to config marvell phy LED.\n");
   797	}
   798	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
