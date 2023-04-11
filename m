Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A538F4D;
	Tue, 11 Apr 2023 15:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681228218; x=1712764218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/xR4Z2+vj/MHKnsKv8/M5WTZq4akLnY/oPBIaizEMxQ=;
  b=Ip8pSoCV2y0WpQzCFCp6K0ijqDfK1q3OycUlVXkpKPwawg+LalcXAtdR
   7kqvi2YApao/kM0XzPyzcMP5saUZ8IFTWkqx1DGOfisPLSUOkZCz4CRo9
   uP5UnCxfbrwrw0Ngv0/Qd2+tQXTQs1vHr+VuupjueA4Ph0OKnTYzjJjsi
   qkpjisF5QVBf+RVf0h4wWdeGyfa3M5wxv601efXjiVOp8+CTW9T7085qr
   x/q6E/TJ78WigfID6PVGwvjqFixPYaoG/mkMVdmvBUWHQh5PFTiQ3PHKY
   koWZIaP0Y9R9TP5dyFEUEc/YpkzkSjNDpDF+CcVMooxrOEW61rWzg7WD7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341144255"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="341144255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 08:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="777966844"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="777966844"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2023 08:50:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmGG7-000WRn-0i;
	Tue, 11 Apr 2023 15:50:15 +0000
Date: Tue, 11 Apr 2023 23:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Xiang Gao <xiang@kernel.org>, linux-erofs@lists.ozlabs.org
Subject: [xiang-erofs:dev-test 17/17] ld.lld: error: undefined symbol:
 z_erofs_aops
Message-ID: <202304112351.TOHeKtRR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   64be79d41fc0aefc57b4127f949e9995e739398e
commit: 64be79d41fc0aefc57b4127f949e9995e739398e [17/17] erofs: get rid of z_erofs_fill_inode()
config: hexagon-randconfig-r041-20230409 (https://download.01.org/0day-ci/archive/20230411/202304112351.TOHeKtRR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git/commit/?id=64be79d41fc0aefc57b4127f949e9995e739398e
        git remote add xiang-erofs https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
        git fetch --no-tags xiang-erofs dev-test
        git checkout 64be79d41fc0aefc57b4127f949e9995e739398e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112351.TOHeKtRR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: z_erofs_aops
   >>> referenced by inode.c
   >>>               fs/erofs/inode.o:(erofs_iget) in archive vmlinux.a
   >>> referenced by inode.c
   >>>               fs/erofs/inode.o:(erofs_iget) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
