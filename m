Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95B910FF;
	Fri,  5 May 2023 22:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683326019; x=1714862019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ymz6cqoGCt0LaAC0a1M4DnYpfLilhwSNLm+YUZGA2nQ=;
  b=nnboiRsT69B/HWcrNe7r5WP+T31r8OVzswubUnzBVyMhdUBv+hwnXz6J
   vSyU+MbGe5BgetnVkE3AT9TEQg5I4eDbkqMzbS2Or+RmXRFWHZnCwWZZ6
   8vVY8VVtfHfOrHwYfbX6HgVBmBlHuYnpthlhZyE3YDEJYUlKpaNzgJN5Q
   kmRSeyAfckL+cQcKsbS/RWxeZby/gSje8yjoBjzcv9ckRkf7nuAyzqxZI
   NdU/ofcCszN/+ZCsAWhbdnZ3uoTwrxcKv24rb8wbbFUmd1R5140wCOSCM
   9q4H9eZ2ZMGpMnXWPRyVjSAvuQyPZ3RGhDdPncTy7PBpGFtgyP5FEPR3w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349348334"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="349348334"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 15:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="697763426"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="697763426"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 May 2023 15:33:29 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv3zU-0000tl-29;
	Fri, 05 May 2023 22:33:28 +0000
Date: Sat, 6 May 2023 06:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:sa1100 36/41] drivers/net/ethernet/3com/3c589_cs.c:224:48:
 error: too many arguments to function call, expected 3, have 4
Message-ID: <202305060618.ioeJlilE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm sa1100
head:   507a1bafed9c27a0080a42f9e66c5af3689eebcf
commit: 859235e53abcef4286a77360d2682ddbfc0574c8 [36/41] net: 3c589_cs: convert to NAPI
config: i386-randconfig-a015-20230501 (https://download.01.org/0day-ci/archive/20230506/202305060618.ioeJlilE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add rmk-arm git://git.armlinux.org.uk/~rmk/linux-arm
        git fetch --no-tags rmk-arm sa1100
        git checkout 859235e53abcef4286a77360d2682ddbfc0574c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060618.ioeJlilE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/3com/3c589_cs.c:224:48: error: too many arguments to function call, expected 3, have 4
           netif_napi_add(dev, &lp->napi, el3_napi_poll, NAPI_POLL_WEIGHT);
           ~~~~~~~~~~~~~~                                ^~~~~~~~~~~~~~~~
   include/linux/netdevice.h:2591:26: note: expanded from macro 'NAPI_POLL_WEIGHT'
   #define NAPI_POLL_WEIGHT 64
                            ^~
   include/linux/netdevice.h:2606:1: note: 'netif_napi_add' declared here
   netif_napi_add(struct net_device *dev, struct napi_struct *napi,
   ^
   1 error generated.


vim +224 drivers/net/ethernet/3com/3c589_cs.c

   196	
   197	static int tc589_probe(struct pcmcia_device *link)
   198	{
   199		struct el3_private *lp;
   200		struct net_device *dev;
   201	
   202		dev_dbg(&link->dev, "3c589_attach()\n");
   203	
   204		/* Create new ethernet device */
   205		dev = alloc_etherdev(sizeof(struct el3_private));
   206		if (!dev)
   207			return -ENOMEM;
   208		lp = netdev_priv(dev);
   209		link->priv = dev;
   210		lp->p_dev = link;
   211	
   212		spin_lock_init(&lp->lock);
   213		link->resource[0]->end = 16;
   214		link->resource[0]->flags |= IO_DATA_PATH_WIDTH_16;
   215	
   216		link->config_flags |= CONF_ENABLE_IRQ;
   217		link->config_index = 1;
   218	
   219		dev->netdev_ops = &el3_netdev_ops;
   220		dev->watchdog_timeo = TX_TIMEOUT;
   221	
   222		dev->ethtool_ops = &netdev_ethtool_ops;
   223	
 > 224		netif_napi_add(dev, &lp->napi, el3_napi_poll, NAPI_POLL_WEIGHT);
   225	
   226		return tc589_config(link);
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
