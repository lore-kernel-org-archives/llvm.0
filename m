Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69361C3E;
	Thu, 30 Mar 2023 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680175497; x=1711711497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F5r1hQ7cUkUBDcgkzl+YhbbYgvKadrwOMiLaWgNj7YI=;
  b=UpPCj/XBBa9EfIuIG3eMYkXS7XrdaMbHeoZwK3P6ntK+aDRgQtJZBtLv
   VT8gi4Iq7QTXUePnLB8CSKLzkRIJ0g1+5uKsbAuVT+LvAaw4lwRfvvJ0B
   TCFgOACe8WEqzonMJXZy8ZUev8ALzB7Tnloa3ujr74EefyhKUAzUzm6JV
   xF8ZJyPlAZeelamYLF5i2agbVaF1SsD8T2JqaHm532qQWcwepSMRkFM3o
   6+s//uAB6L7ab5VPvN6nQFuwB/lw8rhOuDDIWROQB55Q5oAPccMFA8vTF
   hPAXU8pFmb/1UVjHF9XFshwdm45YY2CdbpCbxpEYf498JNw3tIHLMN605
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338638365"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="338638365"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 04:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717277836"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="717277836"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Mar 2023 04:24:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phqOh-000Kny-0I;
	Thu, 30 Mar 2023 11:24:51 +0000
Date: Thu, 30 Mar 2023 19:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Boon Khai Ng <boon.khai.ng@intel.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mun Yew Tham <mun.yew.tham@intel.com>,
	Tien Sung Ang <tien.sung.ang@intel.com>,
	Boon Khai Ng <boon.khai.ng@intel.com>
Subject: Re: [PATCH v1 2/8] drivers: net: stmmac_main: fix vlan toggle option.
Message-ID: <202303301902.TxsoXxWD-lkp@intel.com>
References: <20230330070305.18808-1-boon.khai.ng@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330070305.18808-1-boon.khai.ng@intel.com>

Hi Boon,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boon-Khai-Ng/drivers-net-stmmac_main-Add-support-for-HW-accelerated-VLAN-Stripping/20230330-150648
patch link:    https://lore.kernel.org/r/20230330070305.18808-1-boon.khai.ng%40intel.com
patch subject: [PATCH v1 2/8] drivers: net: stmmac_main: fix vlan toggle option.
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230330/202303301902.TxsoXxWD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fb80bd4d4331439d42a4c555121e4bc27ddcd16f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Boon-Khai-Ng/drivers-net-stmmac_main-Add-support-for-HW-accelerated-VLAN-Stripping/20230330-150648
        git checkout fb80bd4d4331439d42a4c555121e4bc27ddcd16f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301902.TxsoXxWD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5687:2: error: non-void function does not return a value [-Werror,-Wreturn-type]
           }
           ^
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5689:2: error: expected identifier or '('
           return 0;
           ^
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5690:1: error: extraneous closing brace ('}')
   }
   ^
   3 errors generated.


vim +5687 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

  5656	
  5657	static int stmmac_set_features(struct net_device *netdev,
  5658				       netdev_features_t features)
  5659	{
  5660		struct stmmac_priv *priv = netdev_priv(netdev);
  5661	
  5662		netdev_features_t changed;
  5663	
  5664		changed = netdev->features ^ features;
  5665	
  5666		/* Keep the COE Type in case of csum is supporting */
  5667		if (features & NETIF_F_RXCSUM)
  5668			priv->hw->rx_csum = priv->plat->rx_coe;
  5669		else
  5670			priv->hw->rx_csum = 0;
  5671		/* No check needed because rx_coe has been set before and it will be
  5672		 * fixed in case of issue.
  5673		 */
  5674		stmmac_rx_ipc(priv, priv->hw);
  5675	
  5676		if (priv->sph_cap) {
  5677			bool sph_en = (priv->hw->rx_csum > 0) && priv->sph;
  5678			u32 chan;
  5679	
  5680			for (chan = 0; chan < priv->plat->rx_queues_to_use; chan++)
  5681				stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
  5682		}
  5683	
  5684		if (changed & NETIF_F_HW_VLAN_CTAG_RX)
  5685			stmmac_set_hw_vlan_mode(priv, priv->ioaddr, features);
  5686			priv->plat->use_hw_vlan = features & NETIF_F_HW_VLAN_CTAG_RX;
> 5687		}
  5688	
> 5689		return 0;
> 5690	}
  5691	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
