Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE93D7C
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 22:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655762410; x=1687298410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LqAuLSMvGp3ahTOlaHWFwKqPXuPNeEzypwRrsV79edg=;
  b=coxz+tqy+1ruHQggbrRJo2kAWIsQs7EXkKrHNubjGjokSeLWyAblrq42
   /v42NGcI87j92ySiBfrZdj/J+DR8cvPDAVU3t0hbK0EktgiivHGdoYmy0
   FuxcgsWPBLJ/IVaxRHQato25f/IMJkhzFJ3mfyRG884sFnddpbAqhb6d2
   hpTiZguiUDDWwyOiL1LXn+YJkHNlPGDnCirP0Y5amGffsr4FMYq5uoo7h
   NmH3sIXL2P9AZNPEIp0lc71hpGgKBeX36chcuN3ywoxq3vF3FadHTr8LP
   F5fTUNOyVOUiwzegYoFzd/tCyGOUFDNCNVvDuIVGPsaGQRtupA/peW/Vd
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="259799140"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="259799140"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 15:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="764242118"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jun 2022 15:00:07 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3PRG-000Wb6-9L;
	Mon, 20 Jun 2022 22:00:06 +0000
Date: Tue, 21 Jun 2022 06:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com,
	Jakub Kicinski <kuba@kernel.org>, kernel test robot <lkp@intel.com>,
	andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
	boon.leong.ong@intel.com, rmk+kernel@armlinux.org.uk
Subject: Re: [PATCH net-next] net: pcs: xpcs: select PHYLINK in Kconfig
Message-ID: <202206210501.V2CuxMRy-lkp@intel.com>
References: <20220620201915.1195280-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620201915.1195280-1-kuba@kernel.org>

Hi Jakub,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/net-pcs-xpcs-select-PHYLINK-in-Kconfig/20220621-042123
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git dbca1596bbb08318f5e3b3b99f8ca0a0d3830a65
config: x86_64-randconfig-a013-20220620
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a3120516f7ee66896bb0d3c90fe653ce0cb3a09f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jakub-Kicinski/net-pcs-xpcs-select-PHYLINK-in-Kconfig/20220621-042123
        git checkout a3120516f7ee66896bb0d3c90fe653ce0cb3a09f
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64  randconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/phy/Kconfig:16:error: recursive dependency detected!
   drivers/net/phy/Kconfig:16: symbol PHYLIB is selected by PHYLINK
   drivers/net/phy/Kconfig:6: symbol PHYLINK is selected by PCS_XPCS
   drivers/net/pcs/Kconfig:8: symbol PCS_XPCS depends on MDIO_DEVICE
   drivers/net/mdio/Kconfig:6: symbol MDIO_DEVICE is selected by PHYLIB
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +16 drivers/net/phy/Kconfig

00db8189d984d6 Andy Fleming        2005-07-30   5  
9525ae83959b60 Russell King        2017-07-25   6  config PHYLINK
9525ae83959b60 Russell King        2017-07-25   7  	tristate
9525ae83959b60 Russell King        2017-07-25   8  	depends on NETDEVICES
9525ae83959b60 Russell King        2017-07-25   9  	select PHYLIB
9525ae83959b60 Russell King        2017-07-25  10  	select SWPHY
9525ae83959b60 Russell King        2017-07-25  11  	help
9525ae83959b60 Russell King        2017-07-25  12  	  PHYlink models the link between the PHY and MAC, allowing fixed
9525ae83959b60 Russell King        2017-07-25  13  	  configuration links, PHYs, and Serdes links with MAC level
9525ae83959b60 Russell King        2017-07-25  14  	  autonegotiation modes.
9525ae83959b60 Russell King        2017-07-25  15  
6073512cc8e2c4 Jerome Brunet       2017-09-18 @16  menuconfig PHYLIB
9e8d438e8ba43a Florian Fainelli    2018-04-27  17  	tristate "PHY Device support and infrastructure"
6073512cc8e2c4 Jerome Brunet       2017-09-18  18  	depends on NETDEVICES
6073512cc8e2c4 Jerome Brunet       2017-09-18  19  	select MDIO_DEVICE
1814cff26739de Bartosz Golaszewski 2020-07-05  20  	select MDIO_DEVRES
6073512cc8e2c4 Jerome Brunet       2017-09-18  21  	help
6073512cc8e2c4 Jerome Brunet       2017-09-18  22  	  Ethernet controllers are usually attached to PHY
6073512cc8e2c4 Jerome Brunet       2017-09-18  23  	  devices.  This option provides infrastructure for
6073512cc8e2c4 Jerome Brunet       2017-09-18  24  	  managing PHY devices.
6073512cc8e2c4 Jerome Brunet       2017-09-18  25  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
