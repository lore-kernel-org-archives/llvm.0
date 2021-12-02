Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B782868
	for <llvm@lists.linux.dev>; Thu,  2 Dec 2021 01:57:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="236543307"
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; 
   d="scan'208";a="236543307"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 17:57:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; 
   d="scan'208";a="677485478"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2021 17:56:59 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1msbLG-000Feo-IH; Thu, 02 Dec 2021 01:56:58 +0000
Date: Thu, 2 Dec 2021 09:56:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: block/blk-ia-ranges.o: warning: objtool:
 disk_set_independent_access_ranges()+0x9c: unreachable instruction
Message-ID: <202112020925.OqKs1Qa3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Damien Le Moal <damien.lemoal@wdc.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Hannes Reinecke <hare@suse.de>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: a2247f19ee1c5ad75ef095cdfb909a3244b88aa8 block: Add independent access ranges support
date:   5 weeks ago
config: x86_64-randconfig-r035-20211128 (https://download.01.org/0day-ci/archive/20211202/202112020925.OqKs1Qa3-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c64d8ef8cc0c0ed3e0f2ae693d99e7f70f20a84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a2247f19ee1c5ad75ef095cdfb909a3244b88aa8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a2247f19ee1c5ad75ef095cdfb909a3244b88aa8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> block/blk-ia-ranges.o: warning: objtool: disk_set_independent_access_ranges()+0x9c: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
