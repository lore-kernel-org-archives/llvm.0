Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B807C;
	Sat,  1 Apr 2023 01:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680310874; x=1711846874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BfmhBbfucC9V/NAjrzo2pm/fv/xnEmcrBY8Dn7vEJgY=;
  b=kbC8SiVFXGAMqqJNUDvF8zh5isOxM8YwggKRxH6tWzfWjktIWg54j+fW
   UmuT3frrE1SIgb346JGCUPiccnUUV3ret4GWeoZY6fbEPn/DfN9z2omCQ
   9lO71VeB5jt/ykikYSTTE1JIaogiOBxLqykuXqmzkpfGlxkOE+wnZWEiz
   JrIDlnh6e46YpW9dhINgp3k9qYkPp81hYng+kqJCuU9Pw9gxiZFBGJPtP
   CVM77jT2SJxdottPnrGO4fTjOs6JHiO+I5Z4zwCMl1iSt2EYEpkvw70QQ
   Yyiv+mp2hJZio2rL6eQN8tDob709IByxUAC7SurSQy6aBovcDFT92Gwni
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321985681"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="321985681"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 18:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="1015030592"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="1015030592"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Mar 2023 18:01:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piPc7-000MJx-2S;
	Sat, 01 Apr 2023 01:01:03 +0000
Date: Sat, 1 Apr 2023 09:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 net-next 1/2] net: ethernet: mtk_eth_soc: add code for
 offloading flows from wlan devices
Message-ID: <202304010827.5VVfe7rX-lkp@intel.com>
References: <20230331124707.40296-1-nbd@nbd.name>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331124707.40296-1-nbd@nbd.name>

Hi Felix,

I love your patch! Yet something to improve:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/net-ethernet-mtk_eth_soc-mtk_ppe-prefer-newly-added-l2-flows/20230331-204831
patch link:    https://lore.kernel.org/r/20230331124707.40296-1-nbd%40nbd.name
patch subject: [PATCH v3 net-next 1/2] net: ethernet: mtk_eth_soc: add code for offloading flows from wlan devices
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230401/202304010827.5VVfe7rX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6b34c03bc2f53e9370621f04e2925d2ccb41ce7b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Felix-Fietkau/net-ethernet-mtk_eth_soc-mtk_ppe-prefer-newly-added-l2-flows/20230331-204831
        git checkout 6b34c03bc2f53e9370621f04e2925d2ccb41ce7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010827.5VVfe7rX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_ppe_offload.c:554:36: error: use of undeclared identifier 'dev'
           struct mtk_mac *mac = netdev_priv(dev);
                                             ^
   1 error generated.


vim +/dev +554 drivers/net/ethernet/mediatek/mtk_ppe_offload.c

   549	
   550	static int
   551	mtk_eth_setup_tc_block_cb(enum tc_setup_type type, void *type_data, void *cb_priv)
   552	{
   553		struct flow_cls_offload *cls = type_data;
 > 554		struct mtk_mac *mac = netdev_priv(dev);
   555		struct net_device *dev = cb_priv;
   556		struct mtk_eth *eth = mac->hw;
   557	
   558		if (!tc_can_offload(dev))
   559			return -EOPNOTSUPP;
   560	
   561		if (type != TC_SETUP_CLSFLOWER)
   562			return -EOPNOTSUPP;
   563	
   564		return mtk_flow_offload_cmd(eth, cls, 0);
   565	}
   566	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
