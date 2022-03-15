Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F121D7A
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 02:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647311855; x=1678847855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4zB0EluaBLUlbrJtFNQECe8zx0RpNQBtFyPNsRfg9xI=;
  b=GbLVoAGWxF/THWIno63hBeMZ5+nDP+XAZQazay63dOKgEqtCQNJ1uFOD
   OAR22BF9eP5eBjgpYm4txz3cpI6ZLtfydvSQc1Sksm3b33WfaY46k/7T5
   1Hcw2ObUFcvaDH7Su3M9Y+LhgQVIbbajSBIO5klL4oZk50oeiADN4ON5K
   PvMsD/p1TUsuE7x3upCnr8qU4K4C77vLo/PKoknU4LEWHVgCetgU0dWOe
   /NymPIoL26O10VZygzFtPPo0qIqNIWsKmM3oPRRWuU2YoqvNs0tr2x8ZU
   VntMlUfz2u0FfPX7NI3PkVUSvJk4fnG7yx30JRZofVro3+NPjmqzfM2JK
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="319417606"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="319417606"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 19:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="497852010"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2022 19:37:34 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTx41-000ATL-8a; Tue, 15 Mar 2022 02:37:33 +0000
Date: Tue, 15 Mar 2022 10:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:netdev/net-next/master 111/126]
 drivers/net/ethernet/mscc/ocelot.c:2920:14: error: use of undeclared
 identifier 'IEEE_8021QAZ_MAX_TCS'
Message-ID: <202203151054.NrsDHU0t-lkp@intel.com>
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
head:   5e7350e8a618ebfea0713b30986976fcbb90b8bb
commit: 978777d0fb06663523281aa50a5040c3aa31fbe7 [111/126] net: dsa: felix: configure default-prio and dscp priorities
config: hexagon-randconfig-r032-20220313 (https://download.01.org/0day-ci/archive/20220315/202203151054.NrsDHU0t-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/978777d0fb06663523281aa50a5040c3aa31fbe7
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block netdev/net-next/master
        git checkout 978777d0fb06663523281aa50a5040c3aa31fbe7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/ethernet/mscc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mscc/ocelot.c:2920:14: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
           if (prio >= IEEE_8021QAZ_MAX_TCS)
                       ^
   drivers/net/ethernet/mscc/ocelot.c:2962:14: error: use of undeclared identifier 'IEEE_8021QAZ_MAX_TCS'
           if (prio >= IEEE_8021QAZ_MAX_TCS)
                       ^
   2 errors generated.


vim +/IEEE_8021QAZ_MAX_TCS +2920 drivers/net/ethernet/mscc/ocelot.c

  2917	
  2918	int ocelot_port_set_default_prio(struct ocelot *ocelot, int port, u8 prio)
  2919	{
> 2920		if (prio >= IEEE_8021QAZ_MAX_TCS)
  2921			return -ERANGE;
  2922	
  2923		ocelot_rmw_gix(ocelot,
  2924			       ANA_PORT_QOS_CFG_QOS_DEFAULT_VAL(prio),
  2925			       ANA_PORT_QOS_CFG_QOS_DEFAULT_VAL_M,
  2926			       ANA_PORT_QOS_CFG,
  2927			       port);
  2928	
  2929		return 0;
  2930	}
  2931	EXPORT_SYMBOL_GPL(ocelot_port_set_default_prio);
  2932	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
