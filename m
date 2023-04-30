Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A6B37D;
	Sun, 30 Apr 2023 00:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682815878; x=1714351878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LgY12NuLskTUwi8d8w0rNZrhk9BLk3zkhlvSxcF3eGc=;
  b=PCQ/6Woe0tsNY3kFb7kuZiXBtpIUJdCZYo7DC5imv4EcjOT90/pybYiK
   CKnqgls6zCKFR00KS00TQyPdD1fDWeSIxDR/KhUUUyFu78eteaejdhU3u
   B77KVKJUlj2kX8lFUJ3fthInWU8+gtkBZD/aM9GGIbfVDiLW9ka6RQJGF
   qOOSXspWxe/0+f5v0je5KY6WxWFRkt1/heIsQm52qTK5SCGyWTINlej0W
   WzoqWkohkZUIrObuaLBPEZnB536J2efVkFATgxE7avD39WGysGqrBTRHU
   aBX3kn095eB/vSGxLwU43wq9T9BI1SohZ718jefAu14XCEj9KG/XyY/DR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="376005107"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="376005107"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 17:51:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="672727082"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="672727082"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 Apr 2023 17:51:16 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psvHX-0001Qn-2V;
	Sun, 30 Apr 2023 00:51:15 +0000
Date: Sun, 30 Apr 2023 08:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-next 41/43] s390x-linux-ld:
 fops.c:undefined reference to `iomap_file_buffered_write'
Message-ID: <202304300849.qTDIj2y2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-next
head:   a6219c72c4344442bb4226f669944ed2ee23f20d
commit: aa38f1ede3af8a93df140d42dc8df9503845a0da [41/43] block: use iomap for writes to block devices
config: s390-alldefconfig (https://download.01.org/0day-ci/archive/20230430/202304300849.qTDIj2y2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=aa38f1ede3af8a93df140d42dc8df9503845a0da
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next large-block-next
        git checkout aa38f1ede3af8a93df140d42dc8df9503845a0da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304300849.qTDIj2y2-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: block/fops.o: in function `blkdev_write_iter':
   fops.c:(.text+0x3b0): undefined reference to `iomap_file_buffered_write'
>> s390x-linux-ld: fops.c:(.text+0x3e8): undefined reference to `iomap_file_buffered_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
