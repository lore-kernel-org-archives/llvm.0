Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D775E29CA
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 05:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639026705; x=1670562705;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BNLhNFx0NhUianEEmIieTzw+58NSH/Q6HaNZitgNCPY=;
  b=P13WMGtOvOXc7mIDhHfeVDFhkfswpHCSWXTNwDFtNVc7i4LaOlMMDSum
   zNLuwxiI6bXvhAPGH6TO5lhGYUIpp8aStn90cgxEG+Yugr8SWw5YNSWWH
   p6+rgy64cdPKrkFL7/H/pBvrlCLuW+pqL8UrR23m5AqjX+Rq01rAQZHZs
   8lhHh8wkdgwuw271jxpHicp6g13QCLPspklXEsrc2FBt5FvaIsnQxBcMi
   HCVgnZFHdeXZVLlSbTac0LkuYSNg0DFnATAYmcxYNAIY6P0VQ7a3eYQax
   obwLdbcLvdaJXgfd966a5UmappKcDooTqlxNO4qvaXa0pVdqJOM1lFnHA
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="225279850"
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; 
   d="scan'208";a="225279850"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 21:11:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; 
   d="scan'208";a="612373617"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Dec 2021 21:11:08 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvBi0-0001Vy-5S; Thu, 09 Dec 2021 05:11:08 +0000
Date: Thu, 9 Dec 2021 13:10:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: block/blk-core.o: warning: objtool:
 trace_event_raw_event_block_rq_complete()+0x1e4: unreachable instruction
Message-ID: <202112091355.l7sVx2zd-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 8a7d267b4a2c71a5ff5dd9046abea7117c7d0ac2 block: don't call blk_status_to_errno in blk_update_request
date:   7 weeks ago
config: x86_64-randconfig-r035-20211128 (https://download.01.org/0day-ci/archive/20211209/202112091355.l7sVx2zd-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c64d8ef8cc0c0ed3e0f2ae693d99e7f70f20a84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a7d267b4a2c71a5ff5dd9046abea7117c7d0ac2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8a7d267b4a2c71a5ff5dd9046abea7117c7d0ac2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> block/blk-core.o: warning: objtool: trace_event_raw_event_block_rq_complete()+0x1e4: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
