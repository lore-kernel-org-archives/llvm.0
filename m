Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB729CA
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639077758; x=1670613758;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PqdriOk677QIZBfzjDLfblMYn4S5txSnNapsAsL/e3w=;
  b=bETKz8ZiFkthAfdlIbSxozMalKntzDXC8KjCta5WtZNSR7IzUUMxb5w6
   x40bU/bKb3YHtihhLHsiAcdNd6fluNiB2CRyPPHOr1uonCGGK6I3XiABq
   vc6Riz8jU667hgkVyBqmeRomhR5lMtnITyozdcvZbyRTcm0xkrjJkbUL3
   lQf3qvD7svpPtLXfXWaUlpFZxadiiN6ctG1wU7+xNTHkPt3+7ziUc0OSi
   YmAIU8A6sPEWs0e9T7MyObGvjQIhYkPw0QTuYYbrMLSuSCQxAKyI73OFM
   5a7h0PZSnyXi+b8auAKuvZOUXi8Z4vM1BSXNw4kZAfMbTdZOU0dEzUjzv
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238132612"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; 
   d="scan'208";a="238132612"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 11:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; 
   d="scan'208";a="516448498"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2021 11:22:37 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvP00-0002IA-AV; Thu, 09 Dec 2021 19:22:36 +0000
Date: Fri, 10 Dec 2021 03:21:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: block/blk-mq.o: warning: objtool: blk_mq_unquiesce_queue()+0xce:
 unreachable instruction
Message-ID: <202112100334.H6RmnaAp-lkp@intel.com>
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
TO: Ming Lei <ming.lei@redhat.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>

Hi Ming,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: e70feb8b3e6886c525c88943b5f1508d02f5a683 blk-mq: support concurrent queue quiesce/unquiesce
date:   7 weeks ago
config: x86_64-randconfig-r035-20211128 (https://download.01.org/0day-ci/archive/20211210/202112100334.H6RmnaAp-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c64d8ef8cc0c0ed3e0f2ae693d99e7f70f20a84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e70feb8b3e6886c525c88943b5f1508d02f5a683
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e70feb8b3e6886c525c88943b5f1508d02f5a683
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> block/blk-mq.o: warning: objtool: blk_mq_unquiesce_queue()+0xce: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
