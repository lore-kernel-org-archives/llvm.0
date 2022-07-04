Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E315D2
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656960529; x=1688496529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RdMa4rIj8dO2qzepSkY2HhppLf6yZXL+PmNJQTQlrUU=;
  b=e2SAoTwBl7O1SW5cQ4B49prXk2olbkvww/hDnLxDc5hrWeOPXVamjnzf
   KhWhZy4YMH7hbzCD3HiajYZ77/+9b1jzWwitrQivw8mdSKEsLBzHWZJCO
   /LY4M+nu9cmgJ/2yciNxywpsgZ9glb7lEkQJq7SnVsUiQP1uoDwv7En52
   eFhGbORQj9S3BbDvKYhaOi4yVD+L1xz/OGh0wSJM70+CDHfnmFK0D/WYh
   Fgweu/4N/sJGuWLvdHoPvKQ+41zyOHX/8rrs6U7Gk9eC7bQJwJvRB9j02
   ZmWK69Ev11eDG6QGtMqP+poe9YJObfJoOQ+U2RlNg6qq4RzhWpvLMw/6K
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="263606044"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="263606044"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2022 11:48:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="734908840"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2022 11:48:47 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8R7m-000I63-Lo;
	Mon, 04 Jul 2022 18:48:46 +0000
Date: Tue, 5 Jul 2022 02:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: drivers/net/dsa/ocelot/seville_vsc9953.c:1107:34: warning: unused
 variable 'seville_of_match'
Message-ID: <202207050249.pCWnye1d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vladimir,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1084b6c5620a743f86947caca66d90f24060f56
commit: d60bc62de4ae068ed4b215c24cdfdd5035aa986e net: dsa: seville: build as separate module
date:   1 year, 10 months ago
config: x86_64-randconfig-a012-20220704 (https://download.01.org/0day-ci/archive/20220705/202207050249.pCWnye1d-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f7a80c3d08d4821e621fc88d6a2e435291f82dff)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d60bc62de4ae068ed4b215c24cdfdd5035aa986e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d60bc62de4ae068ed4b215c24cdfdd5035aa986e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/infiniband/hw/vmw_pvrdma/ drivers/net/dsa/ocelot/ fs/xfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/ocelot/seville_vsc9953.c:1107:34: warning: unused variable 'seville_of_match' [-Wunused-const-variable]
   static const struct of_device_id seville_of_match[] = {
                                    ^
   1 warning generated.


vim +/seville_of_match +1107 drivers/net/dsa/ocelot/seville_vsc9953.c

84705fc165526e Maxim Kochetkov 2020-07-13  1106  
84705fc165526e Maxim Kochetkov 2020-07-13 @1107  static const struct of_device_id seville_of_match[] = {
84705fc165526e Maxim Kochetkov 2020-07-13  1108  	{ .compatible = "mscc,vsc9953-switch" },
84705fc165526e Maxim Kochetkov 2020-07-13  1109  	{ },
84705fc165526e Maxim Kochetkov 2020-07-13  1110  };
84705fc165526e Maxim Kochetkov 2020-07-13  1111  MODULE_DEVICE_TABLE(of, seville_of_match);
84705fc165526e Maxim Kochetkov 2020-07-13  1112  

:::::: The code at line 1107 was first introduced by commit
:::::: 84705fc165526e8e55d208b2b10a48cc720a106a net: dsa: felix: introduce support for Seville VSC9953 switch

:::::: TO: Maxim Kochetkov <fido_max@inbox.ru>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
