Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC60168
	for <llvm@lists.linux.dev>; Thu, 30 Dec 2021 01:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640827709; x=1672363709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T1BRpgtTzTMGUhrkDuKAO2kJs/QvxfkdFHstWKsnIQk=;
  b=n/BOu5RX4oSll/pN5bda6s+8rIFpuSK5A6jpcq/dI2CshlfDoZOYEmXQ
   9SFJi2/C9b1phKFpCyKLO02mC9gKJ2C2Wbrv+PDxC+LRbWAHDAGF/lxlU
   dT5kN5aLjcvW0SwzlY6rrFbQJP85eCJ1Roy6Nxnz3d5NdjhTuecXA5vHR
   gxjgRmewKXVKV4Rd2wT9ZNX7qjidEyIgF5cG4wTscAAIqTIk2vU+c+g9u
   GP7EGC/4zzr1dJm8h7AxtYXtAZox2IkA3kd7nQ1S5Towi5KhTjCkZMkBy
   brjkNpfgEM+uRVf6357IJJ7cglR7y15QoxXcD+jc406AsJC6mz+Bed8S4
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10212"; a="239140457"
X-IronPort-AV: E=Sophos;i="5.88,247,1635231600"; 
   d="scan'208";a="239140457"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 17:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,247,1635231600"; 
   d="scan'208";a="510719762"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Dec 2021 17:28:27 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n2kF0-0009Xc-GL; Thu, 30 Dec 2021 01:28:26 +0000
Date: Thu, 30 Dec 2021 09:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: drivers/net/dsa/ocelot/seville_vsc9953.c:1107:34: warning: unused
 variable 'seville_of_match'
Message-ID: <202112300929.wXa5Kh1J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Vladimir,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eec4df26e24e978e49ccf9bcf49ca0f2ccdaeffe
commit: d60bc62de4ae068ed4b215c24cdfdd5035aa986e net: dsa: seville: build as separate module
date:   1 year, 3 months ago
config: x86_64-randconfig-r005-20211230 (https://download.01.org/0day-ci/archive/20211230/202112300929.wXa5Kh1J-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d60bc62de4ae068ed4b215c24cdfdd5035aa986e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d60bc62de4ae068ed4b215c24cdfdd5035aa986e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/dsa/ocelot/

If you fix the issue, kindly add following tag as appropriate
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
