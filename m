Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64FA2CA5
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 11:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639393905; x=1670929905;
  h=date:from:cc:subject:message-id:mime-version;
  bh=l3PKKft1VfW4eR6nFPp3YR8ErEUNNEUqVyLLkfcG9HA=;
  b=QjRG/vuvjAxWLtOy6hkql15VpL5eKY2FD1RaOUxxGjSBAp83Axqoqmdg
   wbS+xLVTjA1CPQEdoE5V/I3z5A8UcCuaVNVSVhjUTrJgTlrpTtOHwtqfb
   X2OseDqzCZP3xjF39SQ6+iSqNeRXNousopbsn3dQ7nHsFHvSRh79wbTYc
   L1K3AaUKN5wl6CdqNiv5baO22sPk8Q8vbNcXCFeZpI/+Ol7P098X7t6rw
   74uG/RAd1L6xsZ3IhHJdDgxl35DCBXfz1zBAAeuqgojcDE6nZJMvYL03L
   K8L7zSHfaj1cHUvWpTuI9sKH3zfaW7mj/YD5FueqFuyy4D5w35HiRHbWx
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="218725825"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="218725825"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 03:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="660829977"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2021 03:11:44 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwjF9-0006bG-Gm; Mon, 13 Dec 2021 11:11:43 +0000
Date: Mon, 13 Dec 2021 19:11:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: block/blk-ia-ranges.o: warning: objtool:
 disk_set_independent_access_ranges()+0x9c: unreachable instruction
Message-ID: <202112131933.TL1Ad5bo-lkp@intel.com>
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

Hi Damien,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2585cf9dfaaddf00b069673f27bb3f8530e2039c
commit: a2247f19ee1c5ad75ef095cdfb909a3244b88aa8 block: Add independent access ranges support
date:   7 weeks ago
config: x86_64-randconfig-r035-20211128 (https://download.01.org/0day-ci/archive/20211213/202112131933.TL1Ad5bo-lkp@intel.com/config)
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
