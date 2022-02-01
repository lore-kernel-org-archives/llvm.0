Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED7D2C9E
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643693361; x=1675229361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhpFpVDfY3afe2MJSRhQ4vc7ruhyxXSmj52nPD8KzHM=;
  b=T1rNbm773jVRTaEVyBY+23K80Iv6JPn6+DmYIyZ2N4TRumzdsTfdYLGx
   QtUTn2kV+ZhyXSkGsCnaoKg1uOS8aNx3DKMdhWMCS2fzjQQ/ONwe3NRMR
   V4FqnLPtJnUdPKEnehUwiYQDp227ij6jGcUmKMio+tW4MiknpQjQeNj5+
   tUaj1Wt+Vjg78P/OU4VxP3ezZImcbMst5FhTzhfn+5/k3Kk02eyzRmtsq
   QYwGOJyQURp+8NX5w0nRmJ/8FDljkAVFTdeYRuKwtlnDWLQ2BMQ02SGze
   QUanowqW1JQtiroziPnxER47dzQxAe/gFP/zuupCbJMKWE2xNoniyFYDX
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="310931259"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="310931259"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 21:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="522931153"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Jan 2022 21:29:19 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEljC-000Soq-Ow; Tue, 01 Feb 2022 05:29:18 +0000
Date: Tue, 1 Feb 2022 13:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [mtd:spi-mem-ecc 30/30] ld.lld: error: undefined symbol:
 nand_ecc_unregister_on_host_hw_engine
Message-ID: <202202011308.a6RlPiGp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc
head:   6d0fadec1de4434fce145b374ef25c665357fa60
commit: 6d0fadec1de4434fce145b374ef25c665357fa60 [30/30] spi: mxic: Add support for pipelined ECC operations
config: hexagon-randconfig-r001-20220130 (https://download.01.org/0day-ci/archive/20220201/202202011308.a6RlPiGp-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?id=6d0fadec1de4434fce145b374ef25c665357fa60
        git remote add mtd https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
        git fetch --no-tags mtd spi-mem-ecc
        git checkout 6d0fadec1de4434fce145b374ef25c665357fa60
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nand_ecc_unregister_on_host_hw_engine
   >>> referenced by spi-mxic.c
   >>>               spi/spi-mxic.o:(mxic_spi_remove) in archive drivers/built-in.a
   >>> referenced by spi-mxic.c
   >>>               spi/spi-mxic.o:(mxic_spi_remove) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
