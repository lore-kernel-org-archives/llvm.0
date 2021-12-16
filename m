Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71BA2C9C
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639662905; x=1671198905;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Sv/e5v020HBbb6BrzwhcJ6KK3Xm4TniN5p/0e53WUh4=;
  b=LkarfNIObFWzuNZlPBgxZTzMPDe2Rrrxje8bWgG3dxF3dFwJygUHQdks
   R3FE21+H2EBd9gWzE+JZK4CUsGcirQ8//k1mUC9VhS+rjsJltsJ73RrcA
   81FkCv26CQ654PIXdDZHK3jJiZFRdGZ+jjRUTVmQA5L5h5drV5T/ESWGP
   Gu48nrPjFftDxC/MUh9in227GMtQ6BDUVcrh3VAoeVTQi8tifoO0WuHg2
   XjX3aHLG3f7FLehuEFHtTUYMgm1+uI6d8t6wEhY+Tiv8Wh/3tg7VsL9Qy
   hlLPGQyKGlEYfT9ZxYihSYAgc01rGaSdMYmWp9XOcyLfzvGCiKq7dKetS
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="300271382"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="300271382"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 05:55:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; 
   d="scan'208";a="466074514"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2021 05:55:04 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxrDr-0003FS-MW; Thu, 16 Dec 2021 13:55:03 +0000
Date: Thu, 16 Dec 2021 21:54:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: kernel/sched/deadline.o: warning: objtool: enqueue_task_dl()+0x15ec:
 unreachable instruction
Message-ID: <202112162124.NgjglZjY-lkp@intel.com>
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
TO: Yafang Shao <laoar.shao@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b14864acbaaf03d9c01982e243a84632524c3ac
commit: b5eb4a5f6521d58d5564b8746701bd67a92a2b11 sched/dl: Support schedstats for deadline sched class
date:   2 months ago
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211216/202112162124.NgjglZjY-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b5eb4a5f6521d58d5564b8746701bd67a92a2b11
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b5eb4a5f6521d58d5564b8746701bd67a92a2b11
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/ kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/sched/deadline.o: warning: objtool: enqueue_task_dl()+0x15ec: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
