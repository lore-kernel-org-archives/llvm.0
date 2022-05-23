Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CEF629;
	Mon, 23 May 2022 09:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653297297; x=1684833297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rSp8OAS9Z+rAmZ/IeViGc7ucpC+E1jdk1BjrMYZI1Yo=;
  b=WEO30zEuaBbPt8pwN7beuFrHROhcIUQYUS8GBVHnbfFFJB9C36DhK2B+
   afqCv0Jo1IcUvKkYtNCkVvlI265gpUGNE+g/IpoQ/iLwMTMQDlOvCJDsh
   AIAGvlgPaW1vuGa2lbWhiLt93loedZvpU3iTH8nwJpCQ1IVkEK5VhXRCU
   Za0dgfxld037mff2ccseLzVOvTHqDkReh22DtJrk4+tX7Q9p2Gwrwyius
   rIKbx08Ado3VKStMfdqKEcKMzR3uazM44RxxZTLQ6YbCAUuspWwFIHUaM
   ajOpPPU1i/fHEZLVsFfVJMZWKPejkwYvBkhmNCIWRCLpHUjkC6QhNQ58n
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="270730360"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="270730360"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 02:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="558557154"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 May 2022 02:14:50 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nt49K-00011I-1K;
	Mon, 23 May 2022 09:14:50 +0000
Date: Mon, 23 May 2022 17:13:55 +0800
From: kernel test robot <lkp@intel.com>
To: Corentin Labbe <clabbe@baylibre.com>, andrew@lunn.ch,
	broonie@kernel.org, calvin.johnson@oss.nxp.com, davem@davemloft.net,
	edumazet@google.com, hkallweit1@gmail.com, jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
	lgirdwood@gmail.com, linux@armlinux.org.uk, pabeni@redhat.com,
	robh+dt@kernel.org, samuel@sholland.org, wens@csie.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: Re: [PATCH v3 2/3] phy: handle optional regulator for PHY
Message-ID: <202205231735.QGDB1Mcy-lkp@intel.com>
References: <20220523052807.4044800-3-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523052807.4044800-3-clabbe@baylibre.com>

Hi Corentin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on sunxi/sunxi/for-next linus/master v5.18 next-20220520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Corentin-Labbe/arm64-add-ethernet-to-orange-pi-3/20220523-133344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
config: mips-cu1830-neo_defconfig (https://download.01.org/0day-ci/archive/20220523/202205231735.QGDB1Mcy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 768a1ca5eccb678947f4155e38a5f5744dcefb56)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7ae2ab7d1efe8091f6b7ea048a7ac495afba9e46
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Corentin-Labbe/arm64-add-ethernet-to-orange-pi-3/20220523-133344
        git checkout 7ae2ab7d1efe8091f6b7ea048a7ac495afba9e46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/net/mdio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/mdio/of_mdio.c:13:
>> include/linux/fwnode_mdio.h:20:5: warning: no previous prototype for function 'fwnode_mdiobus_phy_device_register' [-Wmissing-prototypes]
   int fwnode_mdiobus_phy_device_register(struct mii_bus *mdio,
       ^
   include/linux/fwnode_mdio.h:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int fwnode_mdiobus_phy_device_register(struct mii_bus *mdio,
   ^
   static 
   1 warning generated.


vim +/fwnode_mdiobus_phy_device_register +20 include/linux/fwnode_mdio.h

bc1bee3b87ee48b Calvin Johnson 2021-06-11  10  
bc1bee3b87ee48b Calvin Johnson 2021-06-11  11  #if IS_ENABLED(CONFIG_FWNODE_MDIO)
bc1bee3b87ee48b Calvin Johnson 2021-06-11  12  int fwnode_mdiobus_phy_device_register(struct mii_bus *mdio,
bc1bee3b87ee48b Calvin Johnson 2021-06-11  13  				       struct phy_device *phy,
bc1bee3b87ee48b Calvin Johnson 2021-06-11  14  				       struct fwnode_handle *child, u32 addr);
bc1bee3b87ee48b Calvin Johnson 2021-06-11  15  
bc1bee3b87ee48b Calvin Johnson 2021-06-11  16  int fwnode_mdiobus_register_phy(struct mii_bus *bus,
bc1bee3b87ee48b Calvin Johnson 2021-06-11  17  				struct fwnode_handle *child, u32 addr);
bc1bee3b87ee48b Calvin Johnson 2021-06-11  18  
bc1bee3b87ee48b Calvin Johnson 2021-06-11  19  #else /* CONFIG_FWNODE_MDIO */
bc1bee3b87ee48b Calvin Johnson 2021-06-11 @20  int fwnode_mdiobus_phy_device_register(struct mii_bus *mdio,
bc1bee3b87ee48b Calvin Johnson 2021-06-11  21  				       struct phy_device *phy,
bc1bee3b87ee48b Calvin Johnson 2021-06-11  22  				       struct fwnode_handle *child, u32 addr)
bc1bee3b87ee48b Calvin Johnson 2021-06-11  23  {
bc1bee3b87ee48b Calvin Johnson 2021-06-11  24  	return -EINVAL;
bc1bee3b87ee48b Calvin Johnson 2021-06-11  25  }
bc1bee3b87ee48b Calvin Johnson 2021-06-11  26  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
