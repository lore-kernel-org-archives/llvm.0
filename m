Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74781173
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642759303; x=1674295303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nh9KA4VVO/F3iczOzm7854p6i/zaiWPkLm9HI4keUQQ=;
  b=AtOLEZNEG9x0EKYZK97p0OXinRh7gTdQD7d4gTji3TzXj4TMrbkYXy1Y
   8NssGiEuthe3YbXPugWFVFjuRZDxj3if7NAWhvx/H1X8QqdkzUubf5IKQ
   fbEjor2OyrV3gasR7nf2WsMbqfZ+OyVF3E61P/qiNocNj8+LnT6H65VzV
   TmkNLdhLP7TmfwY7iJjVHUmcYbYIZ68s37uCDJ9AN73QhX/Bz4MvS/4+Z
   5ru5q1xhwIfN9vCIQJtto/s1sUcmz1vN9nGBl3rsqBdxr1aOKEZZCcYG/
   ksWz49wlyyL3O5aPG+kP6qwyneTx2vOW7xVnyuFBPFO7TG4UBjIQliPE/
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="308947432"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="308947432"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 02:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; 
   d="scan'208";a="694586029"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2022 02:01:41 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nAqjk-000FBK-PN; Fri, 21 Jan 2022 10:01:40 +0000
Date: Fri, 21 Jan 2022 18:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Joseph CHAMG <josright123@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v12, 2/2] net: Add dm9051 driver
Message-ID: <202201211736.UtU0eL2j-lkp@intel.com>
References: <20220121041428.6437-3-josright123@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121041428.6437-3-josright123@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Joseph,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 9d922f5df53844228b9f7c62f2593f4f06c0b69b]

url:    https://github.com/0day-ci/linux/commits/Joseph-CHAMG/ADD-DM9051-ETHERNET-DRIVER/20220121-121713
base:   9d922f5df53844228b9f7c62f2593f4f06c0b69b
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220121/202201211736.UtU0eL2j-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/a6eb8dd02aed17af37a0b38fbcc250fd9ed9492d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Joseph-CHAMG/ADD-DM9051-ETHERNET-DRIVER/20220121-121713
        git checkout a6eb8dd02aed17af37a0b38fbcc250fd9ed9492d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/davicom/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/davicom/dm9051.c:1076:26: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744073709551613 to 4294967293 [-Wconstant-conversion]
           db->mdiobus->phy_mask = ~GENMASK(1, 1);
                                 ~ ^~~~~~~~~~~~~~
   1 warning generated.


vim +1076 drivers/net/ethernet/davicom/dm9051.c

  1062	
  1063	static int dm9051_mdiobus_register(struct board_info *db)
  1064	{
  1065		struct spi_device *spi = db->spidev;
  1066		int ret;
  1067	
  1068		db->mdiobus = devm_mdiobus_alloc(&spi->dev);
  1069		if (!db->mdiobus)
  1070			return -ENOMEM;
  1071	
  1072		db->mdiobus->priv = db;
  1073		db->mdiobus->read = dm9051_mdiobus_read;
  1074		db->mdiobus->write = dm9051_mdiobus_write;
  1075		db->mdiobus->name = "dm9051-mdiobus";
> 1076		db->mdiobus->phy_mask = ~GENMASK(1, 1);
  1077		db->mdiobus->parent = &spi->dev;
  1078		snprintf(db->mdiobus->id, MII_BUS_ID_SIZE,
  1079			 "dm9051-%s.%u", dev_name(&spi->dev), spi->chip_select);
  1080	
  1081		ret = devm_mdiobus_register(&spi->dev, db->mdiobus);
  1082		if (ret) {
  1083			dev_err(&spi->dev, "Could not register MDIO bus\n");
  1084			return ret;
  1085		}
  1086		return 0;
  1087	}
  1088	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
