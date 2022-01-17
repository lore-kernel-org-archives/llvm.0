Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E50929CA
	for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 05:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642398818; x=1673934818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpT5VmVxWjbvY4z2KyJN0ZNH+4f1u3S7Bwh/lcv5a0M=;
  b=DXG1WoRrYcRo+9rwU5LVdt7fzg37yEFJm2Oit75c8Q+333ZRGD4m/h96
   6pEWtlKDtW4XY2xWslg0gWtGDoO4Dd6xzAoWoUY3j/5351bJlX54T8TBY
   0uSYlooXzmiCnneB0MpoW6uRjKxSscy9dYTU6JtzUP8j39Iy0riKOcTNI
   Mhd+5HZyAo7ZopfQ4MvFBDGOSSISsAjYCxIUAdH0BdEBSbI8gKfQhNvga
   gbRkyYhO6+poYY5HnvD1hW5LFcXtlzsxULlvJs6NZbZoapmXPGoSKfhCd
   tw8IStKLMCUVMH7VbpPlE19HHHvKWZrPTGWVFEfpgXgH226qx+hDZX/Iu
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="305290843"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600"; 
   d="scan'208";a="305290843"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2022 21:53:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600"; 
   d="scan'208";a="517286464"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Jan 2022 21:53:25 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9KxI-000BI6-Pp; Mon, 17 Jan 2022 05:53:24 +0000
Date: Mon, 17 Jan 2022 13:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: drivers/mtd/nand/raw/renesas-nand-controller.c:1405:34: warning:
 unused variable 'rnandc_id_table'
Message-ID: <202201171330.2qRTJyxi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   35ce8ae9ae2e471f92759f9d6880eab42cc1c3b6
commit: d8701fe890ecbab239086e7053d62d0f08587d7c mtd: rawnand: renesas: Add new NAND controller driver
date:   4 weeks ago
config: hexagon-randconfig-r014-20220117 (https://download.01.org/0day-ci/archive/20220117/202201171330.2qRTJyxi-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f782d25a742302d25ef3c8b84b54f7483c2deb9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d8701fe890ecbab239086e7053d62d0f08587d7c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d8701fe890ecbab239086e7053d62d0f08587d7c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/renesas-nand-controller.c:1405:34: warning: unused variable 'rnandc_id_table' [-Wunused-const-variable]
   static const struct of_device_id rnandc_id_table[] = {
                                    ^
   1 warning generated.


vim +/rnandc_id_table +1405 drivers/mtd/nand/raw/renesas-nand-controller.c

  1404	
> 1405	static const struct of_device_id rnandc_id_table[] = {
  1406		{ .compatible = "renesas,rcar-gen3-nandc" },
  1407		{ .compatible = "renesas,rzn1-nandc" },
  1408		{} /* sentinel */
  1409	};
  1410	MODULE_DEVICE_TABLE(of, rnandc_id_table);
  1411	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
