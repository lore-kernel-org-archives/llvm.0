Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7E48DE
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646746587; x=1678282587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lTnzKDCiv9/QLJniNg9fgD9HRuvLFymb/UZZg28Wb6Y=;
  b=KbNdooTfKpVmaype51+Y3owdmLClkP+4+d0C8BNVDpDSDHaMZWHgIggi
   ZcNYd3/rKQpBoxwy34HhhEWTL0+S8rJoWoprTfR383nG55C2lzYSntXpd
   pVBhhBmDjitFC28U+6M/fzupnfsJ5113rineW/bHNLznc8b1QBAyJfBCa
   P74mdL5ytRaT9rssy5FEWmAZrUyQcUXyKgTgQKlWH4Zds2bu0d/B6r6Bs
   eoZKVNFGmD2g0j/sGw8dCVomR93ziP6p+zyLbNYXdsMFyV1yseA6dSHFi
   4Nj8ZE2qAIqmLadOSGyAsn5q+Muyp4+0IB6J80QKjV0PPpyhezmRBNVYE
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="253510846"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="253510846"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 05:36:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; 
   d="scan'208";a="537568182"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 08 Mar 2022 05:36:24 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRa0m-0001T3-7d; Tue, 08 Mar 2022 13:36:24 +0000
Date: Tue, 8 Mar 2022 21:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dust Li <dust.li@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:netdev/net-next/master 150/160]
 net/smc/smc_sysctl.h:23:16: warning: no previous prototype for function
 'smc_sysctl_net_init'
Message-ID: <202203082117.G0KHS6qO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block netdev/net-next/master
head:   69adcb988a0675ce001dfc416d56fba2e8a85f48
commit: 7de8eb0d9039f16e1122d7aa524a1502a160c4ff [150/160] net/smc: fix compile warning for smc_sysctl
config: arm-randconfig-r024-20220308 (https://download.01.org/0day-ci/archive/20220308/202203082117.G0KHS6qO-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/7de8eb0d9039f16e1122d7aa524a1502a160c4ff
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block netdev/net-next/master
        git checkout 7de8eb0d9039f16e1122d7aa524a1502a160c4ff
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/smc/af_smc.c:54:
>> net/smc/smc_sysctl.h:23:16: warning: no previous prototype for function 'smc_sysctl_net_init' [-Wmissing-prototypes]
   int __net_init smc_sysctl_net_init(struct net *net)
                  ^
   net/smc/smc_sysctl.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __net_init smc_sysctl_net_init(struct net *net)
   ^
   static 
>> net/smc/smc_sysctl.h:29:17: warning: no previous prototype for function 'smc_sysctl_net_exit' [-Wmissing-prototypes]
   void __net_exit smc_sysctl_net_exit(struct net *net) { }
                   ^
   net/smc/smc_sysctl.h:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __net_exit smc_sysctl_net_exit(struct net *net) { }
   ^
   static 
   2 warnings generated.


vim +/smc_sysctl_net_init +23 net/smc/smc_sysctl.h

    22	
  > 23	int __net_init smc_sysctl_net_init(struct net *net)
    24	{
    25		net->smc.sysctl_autocorking_size = SMC_AUTOCORKING_DEFAULT_SIZE;
    26		return 0;
    27	}
    28	
  > 29	void __net_exit smc_sysctl_net_exit(struct net *net) { }
    30	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
