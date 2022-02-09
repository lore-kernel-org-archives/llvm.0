Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0205B2F39
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 23:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644447617; x=1675983617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8wnH7gXflaukTC+eikkhfXa3RlpvTrrktoxe/0Q3gw=;
  b=HxXFbkVYkkOllVb4AJkW3lK8eeCM6LaQjF2M/1dBj0iLqayoYhiRpwt7
   ECixnDwvgZP9MbLUXnLR4OJ0Ook0kkH21nsSaHByz1fr+AzdsInvYf/Ci
   z+LhUqQW94sCg+Xy/AM6jIST3ZqqGv31vb7ZjKqwMzaJ010LxiXuZisB3
   gsTQ8RwT+8/C2O+XYKkhZ6EFbTBu9Q32DiuNTa6i1iCUWpMNTnUQeidWE
   kHveY00NEaWyoOzkJwpMRZZBBipDoGNtaW3aa3ieqPTBIIxVgruj0sYTR
   TpnXLjSJc1IuccU6vaheOv2dIdP/m77o/YLtBlGQOBVWNZd3YgO16VT43
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="229333454"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="229333454"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 15:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; 
   d="scan'208";a="500171320"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2022 15:00:14 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHvwc-0002Nf-4A; Wed, 09 Feb 2022 23:00:14 +0000
Date: Thu, 10 Feb 2022 06:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2746/4656] ld.lld: error: undefined symbol:
 ptp_clock_register
Message-ID: <202202100619.F4k1tPKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   10207e3a840b47b5eae573486a88fb6e29884f77
commit: d096459494a88791312c6f4da4641eb887188e70 [2746/4656] net: lan966x: Add support for ptp clocks
config: arm64-buildonly-randconfig-r005-20220209 (https://download.01.org/0day-ci/archive/20220210/202202100619.F4k1tPKf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d096459494a88791312c6f4da4641eb887188e70
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d096459494a88791312c6f4da4641eb887188e70
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ptp_clock_register
   >>> referenced by lan966x_ptp.c
   >>> net/ethernet/microchip/lan966x/lan966x_ptp.o:(lan966x_ptp_init) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: ptp_clock_unregister
   >>> referenced by lan966x_ptp.c
   >>> net/ethernet/microchip/lan966x/lan966x_ptp.o:(lan966x_ptp_deinit) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
