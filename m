Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4192595
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 22:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644705212; x=1676241212;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+vQIk7Zh0itAcy6M5TOwfDdpZ9FNzFL/In8IY61nt8c=;
  b=P89i7WHtWkHHMjLMydWsD5iqvhJ+BBTcbzTRHt1QeUahDen2zsJ0shVX
   F2kLRVk9GemvH/l5ZsEz2fmygFe1UjlJDL4VJvEmNNgd++0E64lraRKCC
   0Ss7wfIdDxKBusecqJQY4+tOjXD1wfdT01YV7SQqDAL0KExJBgG8POvaH
   gyysRiidiofhz8y0qLh/k9GNP51u3m/2AVrORsuEHbd/UYemjjGKkAyBc
   y3CPb8Pp2xoGvhCl2rBbYvLX5TSupYeSYgzZ0dGmIOaORlbQdLysTyo95
   i08aaM3AZIyOpo7q7o4lmdZY/7Eo09OEEwR2lIKUwaYmzM5Ra9BlutOI9
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="313188377"
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="313188377"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2022 14:33:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="484296743"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Feb 2022 14:33:31 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJ0xO-0006hf-G2; Sat, 12 Feb 2022 22:33:30 +0000
Date: Sun, 13 Feb 2022 06:33:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: block/bio.o: warning: objtool: bvec_alloc()+0x77: unreachable
 instruction
Message-ID: <202202130617.yv6T7j1N-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   83e396641110663d3c7bb25b9bc0c6a750359ecf
commit: 7a800a20ae6329e803c5c646b20811a6ae9ca136 block: use bi_max_vecs to find the bvec pool
date:   1 year ago
config: x86_64-buildonly-randconfig-r002-20220207 (https://download.01.org/0day-ci/archive/20220213/202202130617.yv6T7j1N-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7a800a20ae6329e803c5c646b20811a6ae9ca136
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7a800a20ae6329e803c5c646b20811a6ae9ca136
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> block/bio.o: warning: objtool: bvec_alloc()+0x77: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
