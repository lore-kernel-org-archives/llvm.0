Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424B3A31;
	Wed, 29 Mar 2023 04:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680064239; x=1711600239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7SGfi4gYheA+lxRClbB9Jz1hokAePVlZL3G7vb6CnzE=;
  b=nt6q2o4S0s6phjXUDb/Y8Aq4h9p1RQPVtg3UynLzqucTaH6nCTONKJJG
   fJrNUi/3sZYBvyCIvq2hO1HdWjSDo/HV5UxV2ODMZMW6CE+OGavb0kRcW
   FM1CC9fi6UMEjhSO8ihAPwF6gmjN1yxL9y6XcklT5mWqaSBiAWk6/hm3Y
   iiTI62Dlx5vOAa56hhLyqKVCMXm3W8OOIqZ6KpbJiRO6Ql1IDta7Io2q0
   VCMpMvdClYxJJOZSn91Vhb5FtIuZOxh5LMOxaCGYG/cd/1xJVn/lxaYSx
   a+xuwiKBZ2E3uUP7C7t+DsWXSbzNHuKAJOtRh87H5+/v72ot1WymxmNSg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="427049352"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="427049352"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 21:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="930152689"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="930152689"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Mar 2023 21:30:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phNSG-000JEB-2v;
	Wed, 29 Mar 2023 04:30:36 +0000
Date: Wed, 29 Mar 2023 12:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 2/2] net: dsa: mt7530: introduce MMIO driver
 for MT7988 SoC
Message-ID: <202303291204.R8EIxqqD-lkp@intel.com>
References: <ZCIML310vc8/uoM4@makrotopia.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCIML310vc8/uoM4@makrotopia.org>

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-dsa-mt7530-introduce-MMIO-driver-for-MT7988-SoC/20230328-053725
patch link:    https://lore.kernel.org/r/ZCIML310vc8%2FuoM4%40makrotopia.org
patch subject: [RFC PATCH net-next 2/2] net: dsa: mt7530: introduce MMIO driver for MT7988 SoC
config: arm64-randconfig-r014-20230327 (https://download.01.org/0day-ci/archive/20230329/202303291204.R8EIxqqD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/e58502b71250c25c0b71b5adb3c776be06dfb909
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Golle/net-dsa-mt7530-introduce-MMIO-driver-for-MT7988-SoC/20230328-053725
        git checkout e58502b71250c25c0b71b5adb3c776be06dfb909
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/dsa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291204.R8EIxqqD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/mt7530.c:3128:6: warning: variable 'unused_pm' set but not used [-Wunused-but-set-variable]
           u32 unused_pm = 0;
               ^
   1 warning generated.


vim +/unused_pm +3128 drivers/net/dsa/mt7530.c

  3124	
  3125	static int mt7988_setup(struct dsa_switch *ds)
  3126	{
  3127		struct mt7530_priv *priv = ds->priv;
> 3128		u32 unused_pm = 0;
  3129		int i;
  3130	
  3131		/* Reset the switch */
  3132		reset_control_assert(priv->rstc);
  3133		udelay(20);
  3134		reset_control_deassert(priv->rstc);
  3135		udelay(20);
  3136	
  3137		/* Reset the switch PHYs */
  3138		mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_PHY_RST);
  3139	
  3140		/* BPDU to CPU port */
  3141		mt7530_rmw(priv, MT7531_CFC, MT7531_CPU_PMAP_MASK,
  3142			   BIT(MT7988_CPU_PORT));
  3143		mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
  3144			   MT753X_BPDU_CPU_ONLY);
  3145	
  3146		/* Enable and reset MIB counters */
  3147		mt7530_mib_reset(ds);
  3148	
  3149		for (i = 0; i < MT7530_NUM_PORTS; i++) {
  3150			/* Disable forwarding by default on all ports */
  3151			mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
  3152				   PCR_MATRIX_CLR);
  3153	
  3154			mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);
  3155	
  3156			if (dsa_is_unused_port(ds, i))
  3157				unused_pm |= BIT(i);
  3158			else if (dsa_is_cpu_port(ds, i))
  3159				mt753x_cpu_port_enable(ds, i);
  3160			else
  3161				mt7530_port_disable(ds, i);
  3162	
  3163			/* Enable consistent egress tag */
  3164			mt7530_rmw(priv, MT7530_PVC_P(i), PVC_EG_TAG_MASK,
  3165				   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
  3166		}
  3167	
  3168		ds->configure_vlan_while_not_filtering = true;
  3169	
  3170		/* Flush the FDB table */
  3171		return mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
  3172	}
  3173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
