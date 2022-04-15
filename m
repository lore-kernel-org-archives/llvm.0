Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852CD7E
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 13:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650028890; x=1681564890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J5IdjM4bTiGgHDJNdfSgOfYbVJ4mpNxn9qhhWj7kVfU=;
  b=QM4zbcJeTDFsIt/BhhDQT7Dqso5iVaGvNCpx+IZNJpLOQggx3b/EWo4b
   Ua/QNe6fnTfc1QZ/vjLhO8hEoA6MWUmgepjbTRDUBKzfJyknGHcTIeFI/
   USAI99y2V/OWjcE054vM74YiR/FMq6VI0nVrlSGu0eWZF2y4dzVYyogEH
   d2d5uVJd5XeTrxwIdUytOQ5mNR90cWGrEB6dn3glNefL7aF5E+aRoR3+u
   J1npK2d/o+afuVLRovlUhx3zd7WkqDqugT29g04JI6zn21tI8l5l4PgP3
   pSq4ySBTCgrfCFY2JcCbJnNotgQrzK+n0D+epd10z3vEu5P6vzr+7SQvm
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="261996516"
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; 
   d="scan'208";a="261996516"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 06:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; 
   d="scan'208";a="662085064"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2022 06:21:28 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfLt9-0001yL-Gb;
	Fri, 15 Apr 2022 13:21:27 +0000
Date: Fri, 15 Apr 2022 21:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [morimoto:r4-2022-04-15-v2 15/24]
 drivers/i2c/busses/i2c-rcar.c:806:29: error: expected ';' after expression
Message-ID: <202204152116.8xUwPO61-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/morimoto/linux r4-2022-04-15-v2
head:   88d865b299bcaa6c0a206a60dbf20e4e13130568
commit: 680cb6c79b44aacc594165e88b4af5d4acfa9f7c [15/24] i2c: rcar: use flags instead of atomic_xfer
config: arm64-randconfig-r022-20220414 (https://download.01.org/0day-ci/archive/20220415/202204152116.8xUwPO61-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/morimoto/linux/commit/680cb6c79b44aacc594165e88b4af5d4acfa9f7c
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto r4-2022-04-15-v2
        git checkout 680cb6c79b44aacc594165e88b4af5d4acfa9f7c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-rcar.c:806:29: error: expected ';' after expression
           priv->flags &= ~ID_P_ATOMIC
                                      ^
                                      ;
   drivers/i2c/busses/i2c-rcar.c:1041:18: warning: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +806 drivers/i2c/busses/i2c-rcar.c

   796	
   797	static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
   798					struct i2c_msg *msgs,
   799					int num)
   800	{
   801		struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
   802		struct device *dev = rcar_i2c_priv_to_dev(priv);
   803		int i, ret;
   804		long time_left;
   805	
 > 806		priv->flags &= ~ID_P_ATOMIC
   807	
   808		pm_runtime_get_sync(dev);
   809	
   810		/* Check bus state before init otherwise bus busy info will be lost */
   811		ret = rcar_i2c_bus_barrier(priv);
   812		if (ret < 0)
   813			goto out;
   814	
   815		/* Gen3 needs a reset before allowing RXDMA once */
   816		if (priv->devtype == I2C_RCAR_GEN3) {
   817			priv->flags |= ID_P_NO_RXDMA;
   818			if (!IS_ERR(priv->rstc)) {
   819				ret = rcar_i2c_do_reset(priv);
   820				if (ret == 0)
   821					priv->flags &= ~ID_P_NO_RXDMA;
   822			}
   823		}
   824	
   825		rcar_i2c_init(priv);
   826	
   827		for (i = 0; i < num; i++)
   828			rcar_i2c_request_dma(priv, msgs + i);
   829	
   830		/* init first message */
   831		priv->msg = msgs;
   832		priv->msgs_left = num;
   833		priv->flags = (priv->flags & ID_P_MASK) | ID_FIRST_MSG;
   834		rcar_i2c_prepare_msg(priv);
   835	
   836		time_left = wait_event_timeout(priv->wait, priv->flags & ID_DONE,
   837					     num * adap->timeout);
   838	
   839		/* cleanup DMA if it couldn't complete properly due to an error */
   840		if (priv->dma_direction != DMA_NONE)
   841			rcar_i2c_cleanup_dma(priv, true);
   842	
   843		if (!time_left) {
   844			rcar_i2c_init(priv);
   845			ret = -ETIMEDOUT;
   846		} else if (priv->flags & ID_NACK) {
   847			ret = -ENXIO;
   848		} else if (priv->flags & ID_ARBLOST) {
   849			ret = -EAGAIN;
   850		} else {
   851			ret = num - priv->msgs_left; /* The number of transfer */
   852		}
   853	out:
   854		pm_runtime_put(dev);
   855	
   856		if (ret < 0 && ret != -ENXIO)
   857			dev_err(dev, "error %d : %x\n", ret, priv->flags);
   858	
   859		return ret;
   860	}
   861	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
