Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5647168
	for <llvm@lists.linux.dev>; Fri, 31 Dec 2021 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640971145; x=1672507145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZgZj7WrsV28htaLbopbhpk5uh/dtLVbpOEkc116Ihiw=;
  b=mXgG2usqj8tWSIM5UPYdWU5m6h1z8uyF1entd9xYrOQT0yfa0BJS3jB1
   yiDQPHNeGQsYoO1t7A5Gl4BFKUgTQ5RUJmDVOrilGl0ouV/vKH9VAtNzs
   kF9kQ12d//Hwynjr7AkpUhZT0AJlcTeTKw0xJmLJwJz+cvsEHJPh0yz2f
   kIZYJnYLH2uE1qs4rSwz1+9E2tTnquFzWpuN8R1/yLJgHfwfOQCM2rC9C
   7owDbhtS5ptgdKL7syIRTqbEYyCCoJFOGqrDZUgcDovk/2xr/tggHTQfX
   8Qls2qtJGEXBLSoJWVIzC0AzbRgtHpj+lLcVKRaiuyfqnMsTFXsxnxJ5a
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="240632494"
X-IronPort-AV: E=Sophos;i="5.88,252,1635231600"; 
   d="scan'208";a="240632494"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2021 09:19:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,252,1635231600"; 
   d="scan'208";a="470987936"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Dec 2021 09:19:03 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n3LYU-000BRl-Ph; Fri, 31 Dec 2021 17:19:02 +0000
Date: Sat, 1 Jan 2022 01:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next v3 06/11] net: dsa: realtek: add new mdio
 interface for drivers
Message-ID: <202201010143.Ua57feb3-lkp@intel.com>
References: <20211231043306.12322-7-luizluca@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211231043306.12322-7-luizluca@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Luiz,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Luiz-Angelo-Daros-de-Luca/net-dsa-realtek-smi-move-to-subdirectory/20211231-133326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git af30f8eaa8fe4ff1987280f716309711997bd979
config: hexagon-randconfig-r033-20211231 (https://download.01.org/0day-ci/archive/20220101/202201010143.Ua57feb3-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7cd109b92c72855937273a6c8ab19016fbe27d33)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/98bde88720c76b12ab9ed2cfc166f65396e6e5e2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Luiz-Angelo-Daros-de-Luca/net-dsa-realtek-smi-move-to-subdirectory/20211231-133326
        git checkout 98bde88720c76b12ab9ed2cfc166f65396e6e5e2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/dsa/realtek/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/realtek/realtek-mdio.c:41:5: warning: no previous prototype for function 'realtek_mdio_read_reg' [-Wmissing-prototypes]
   int realtek_mdio_read_reg(struct realtek_priv *priv, u32 addr, u32 *data)
       ^
   drivers/net/dsa/realtek/realtek-mdio.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int realtek_mdio_read_reg(struct realtek_priv *priv, u32 addr, u32 *data)
   ^
   static 
   1 warning generated.


vim +/realtek_mdio_read_reg +41 drivers/net/dsa/realtek/realtek-mdio.c

    40	
  > 41	int realtek_mdio_read_reg(struct realtek_priv *priv, u32 addr, u32 *data)
    42	{
    43		u32 phy_id = priv->phy_id;
    44		struct mii_bus *bus = priv->bus;
    45	
    46		mutex_lock(&bus->mdio_lock);
    47	
    48		bus->write(bus, phy_id, REALTEK_MDIO_CTRL0_REG, REALTEK_MDIO_ADDR_OP);
    49		bus->write(bus, phy_id, REALTEK_MDIO_START_REG, REALTEK_MDIO_START_OP);
    50		bus->write(bus, phy_id, REALTEK_MDIO_ADDRESS_REG, addr);
    51		bus->write(bus, phy_id, REALTEK_MDIO_START_REG, REALTEK_MDIO_START_OP);
    52		bus->write(bus, phy_id, REALTEK_MDIO_CTRL1_REG, REALTEK_MDIO_READ_OP);
    53		bus->write(bus, phy_id, REALTEK_MDIO_START_REG, REALTEK_MDIO_START_OP);
    54		*data = bus->read(bus, phy_id, REALTEK_MDIO_DATA_READ_REG);
    55	
    56		mutex_unlock(&bus->mdio_lock);
    57	
    58		return 0;
    59	}
    60	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
