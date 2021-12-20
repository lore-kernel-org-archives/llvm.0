Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F72CA0
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640011812; x=1671547812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6aY8R+FrA8xXoG4kyznqdj/eYcyxadWwCoczLCY+IlM=;
  b=adWVhrYKrvxG89Kot5UFB8YkXGJYqkJ2EOHrISLdFOwWOUOPC9BZw3A0
   q0eUDvlZLgbtFX9RqDnRSaESzecIyIvQfXgDZPn6BTJ5M0uPM2gia/K5e
   FOhS2CFxibmMHwHbTK7EaBKLXjme4RzK3eRnxn9BAWYhCqUqJ8EtEVEk4
   0AaSYFhFqukEJDuakqHAEyNq63Tx1T+dNOBwseMf8+IQZHw3VVVbb0Chy
   5VfMIKqXyGQJ0t5MIWWUrmo9QgGkHiGQ6hAtBkAaNGa9hPsmd12QUxySj
   B712HZEyTfcgf+4C25bNrCk8N0u7Z+bf15GkDjXxq1SNJczCOUVS5zrMn
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="303552345"
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="303552345"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 06:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; 
   d="scan'208";a="616419441"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Dec 2021 06:50:09 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzJzN-0007t2-0e; Mon, 20 Dec 2021 14:50:09 +0000
Date: Mon, 20 Dec 2021 22:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next v2 07/13] net: dsa: realtek: add new mdio
 interface for drivers
Message-ID: <202112202212.PeXrGA7n-lkp@intel.com>
References: <20211218081425.18722-8-luizluca@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211218081425.18722-8-luizluca@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Luiz,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Luiz-Angelo-Daros-de-Luca/dt-bindings-net-dsa-realtek-smi-mark-unsupported-switches/20211218-171506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 7e1c5d7b6926f63d3750a273486a143e50d216ad
config: arm-randconfig-c002-20211219 (https://download.01.org/0day-ci/archive/20211220/202112202212.PeXrGA7n-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31a4814592bbda7153833e46728dc7b21100)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/4098c967b9f6635090798d9eb031f57ae26ed422
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Luiz-Angelo-Daros-de-Luca/dt-bindings-net-dsa-realtek-smi-mark-unsupported-switches/20211218-171506
        git checkout 4098c967b9f6635090798d9eb031f57ae26ed422
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/dsa/realtek/ kernel/trace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/realtek/realtek-mdio.c:53:5: warning: no previous prototype for function 'realtek_mdio_read_reg' [-Wmissing-prototypes]
   int realtek_mdio_read_reg(struct realtek_priv *priv, u32 addr, u32 *data)
       ^
   drivers/net/dsa/realtek/realtek-mdio.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int realtek_mdio_read_reg(struct realtek_priv *priv, u32 addr, u32 *data)
   ^
   static 
   1 warning generated.


vim +/realtek_mdio_read_reg +53 drivers/net/dsa/realtek/realtek-mdio.c

    52	
  > 53	int realtek_mdio_read_reg(struct realtek_priv *priv, u32 addr, u32 *data)
    54	{
    55		u32 phy_id = priv->phy_id;
    56		struct mii_bus *bus = priv->bus;
    57	
    58		BUG_ON(in_interrupt());
    59	
    60		mutex_lock(&bus->mdio_lock);
    61		/* Write Start command to register 29 */
    62		bus->write(bus, phy_id, MDC_MDIO_START_REG, MDC_MDIO_START_OP);
    63	
    64		/* Write address control code to register 31 */
    65		bus->write(bus, phy_id, MDC_MDIO_CTRL0_REG, MDC_MDIO_ADDR_OP);
    66	
    67		/* Write Start command to register 29 */
    68		bus->write(bus, phy_id, MDC_MDIO_START_REG, MDC_MDIO_START_OP);
    69	
    70		/* Write address to register 23 */
    71		bus->write(bus, phy_id, MDC_MDIO_ADDRESS_REG, addr);
    72	
    73		/* Write Start command to register 29 */
    74		bus->write(bus, phy_id, MDC_MDIO_START_REG, MDC_MDIO_START_OP);
    75	
    76		/* Write read control code to register 21 */
    77		bus->write(bus, phy_id, MDC_MDIO_CTRL1_REG, MDC_MDIO_READ_OP);
    78	
    79		/* Write Start command to register 29 */
    80		bus->write(bus, phy_id, MDC_MDIO_START_REG, MDC_MDIO_START_OP);
    81	
    82		/* Read data from register 25 */
    83		*data = bus->read(bus, phy_id, MDC_MDIO_DATA_READ_REG);
    84	
    85		mutex_unlock(&bus->mdio_lock);
    86	
    87		return 0;
    88	}
    89	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
