Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C5B23D4E;
	Fri, 12 May 2023 19:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683920998; x=1715456998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iYbNFMgo36jWjmpFaJxu6IEsyQSm/TkZcxoxEjOImnQ=;
  b=RAaqNd+lafLsayE16lmpV5OGmWZaRAImTsEbrV5sutGwdPqKkdXEaMYd
   2+IUu4NYd9G/x4YL6Lmh1zeLzwbiKMP9kB/0VhEvtesXWzkVwcCJP5qM3
   qpsHU+FUdvQ/ouTu8H7NCIh6tWq/XIAKuh7gcWMX3/cR0VCSn9ADEQDnA
   jfkd+l9EEO3DzMgShtz2bOmphxfJefMEwb/g/cswZaW21xYitoLqAfBdb
   YkwExu9eoxKiIi8LemRxSG9f71+r5iwh8j+gJWyScMH9G+WlATlkzXhXH
   prctX44tozPXk4aPmwpRge1AxKhDzaiEznPwzv9UKMC6FV3+TwXyhKv18
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340194045"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="340194045"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 12:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="844540343"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="844540343"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 May 2023 12:49:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxYm2-00054q-2e;
	Fri, 12 May 2023 19:49:54 +0000
Date: Sat, 13 May 2023 03:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 9/9] net: pcs: xpcs: avoid reading STAT1
 more than once
Message-ID: <202305130351.NXLzJBVi-lkp@intel.com>
References: <E1pxWYT-002Qsg-Rg@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1pxWYT-002Qsg-Rg@rmk-PC.armlinux.org.uk>

Hi Russell,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-phylink-remove-duplicated-linkmode-pause-resolution/20230513-013023
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1pxWYT-002Qsg-Rg%40rmk-PC.armlinux.org.uk
patch subject: [PATCH RFC net-next 9/9] net: pcs: xpcs: avoid reading STAT1 more than once
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230513/202305130351.NXLzJBVi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b53ffb41edb525ad6831e2b00b2e06389b8ef97c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Russell-King-Oracle/net-phylink-remove-duplicated-linkmode-pause-resolution/20230513-013023
        git checkout b53ffb41edb525ad6831e2b00b2e06389b8ef97c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/pcs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130351.NXLzJBVi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-xpcs.c:868:10: error: use of undeclared identifier 'stat1'; did you mean 'state'?
                   return stat1;
                          ^~~~~
                          state
   drivers/net/pcs/pcs-xpcs.c:853:37: note: 'state' declared here
                                 struct phylink_link_state *state,
                                                            ^
>> drivers/net/pcs/pcs-xpcs.c:868:10: warning: incompatible pointer to integer conversion returning 'struct phylink_link_state *' from a function with result type 'int' [-Wint-conversion]
                   return stat1;
                          ^~~~~
   drivers/net/pcs/pcs-xpcs.c:872:19: error: use of undeclared identifier 'stat1'
           state->link = !!(stat1 & MDIO_STAT1_LSTATUS);
                            ^
   1 warning and 2 errors generated.


vim +868 drivers/net/pcs/pcs-xpcs.c

   851	
   852	static int xpcs_get_state_c73(struct dw_xpcs *xpcs,
   853				      struct phylink_link_state *state,
   854				      const struct xpcs_compat *compat)
   855	{
   856		bool an_enabled;
   857		int pcs_stat1;
   858		int an_stat1;
   859		int ret;
   860	
   861		/* The link status bit is latching-low, so it is important to
   862		 * avoid unnecessary re-reads of this register to avoid missing
   863		 * a link-down event.
   864		 */
   865		pcs_stat1 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT1);
   866		if (pcs_stat1 < 0) {
   867			state->link = false;
 > 868			return stat1;
   869		}
   870	
   871		/* Link needs to be read first ... */
   872		state->link = !!(stat1 & MDIO_STAT1_LSTATUS);
   873	
   874		/* ... and then we check the faults. */
   875		ret = xpcs_read_fault_c73(xpcs, state, pcs_stat1);
   876		if (ret) {
   877			ret = xpcs_soft_reset(xpcs, compat);
   878			if (ret)
   879				return ret;
   880	
   881			state->link = 0;
   882	
   883			return xpcs_do_config(xpcs, state->interface, MLO_AN_INBAND, NULL);
   884		}
   885	
   886		/* There is no point doing anything else if the link is down. */
   887		if (!state->link)
   888			return 0;
   889	
   890		an_enabled = linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
   891					       state->advertising);
   892		if (an_enabled) {
   893			/* The link status bit is latching-low, so it is important to
   894			 * avoid unnecessary re-reads of this register to avoid missing
   895			 * a link-down event.
   896			 */
   897			an_stat1 = xpcs_read(xpcs, MDIO_MMD_AN, MDIO_STAT1);
   898			if (an_stat1 < 0) {
   899				state->link = false;
   900				return an_stat1;
   901			}
   902	
   903			state->an_complete = xpcs_aneg_done_c73(xpcs, state, compat,
   904								an_stat1);
   905			if (!state->an_complete) {
   906				state->link = false;
   907				return 0;
   908			}
   909	
   910			ret = xpcs_read_lpa_c73(xpcs, state, an_stat1);
   911			if (ret < 0) {
   912				state->link = false;
   913				return ret;
   914			}
   915	
   916			phylink_resolve_c73(state);
   917		} else {
   918			xpcs_resolve_pma(xpcs, state);
   919		}
   920	
   921		return 0;
   922	}
   923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
