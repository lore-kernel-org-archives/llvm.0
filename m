Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDBF168
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643294429; x=1674830429;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OtMB4Fcs0FgfsexEaKqsyln1q/EkJaGE0SwrI/EZiII=;
  b=dE7T2rK7r5KEYtTDSG0PrlZvZXKpCbX9EvsNbm6GIX8s3tZd61cuxaBE
   9naiilzjSz+qDEqy0fykT3TLzRhXidB8FPIB8xM/PqsATSwcjmmNCb/cn
   A1VOOrt4+fHnE4IqkyKys4HbT6l1Bx8BR9y8BW2pCZFxrKb0SXqQ4iMex
   Orxjk68DMn+aeJoaFwuD5A4ZpbLmoMFUW8IyiFzzWSEutYkMMGaS1XXQo
   siyCK0inFK9nU9qzXbaPJDksF/EBDBBuD1PXuQ3UjQgm59njSh/eWuPRS
   2L8T8zUIyTAZfwE4YGWkVqE7qTwh97MgytrK1QypsNEEfkgvC3uv+Z7lx
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="246647684"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="246647684"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 06:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="480309829"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jan 2022 06:32:00 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nD5od-000MhG-Sb; Thu, 27 Jan 2022 14:31:59 +0000
Date: Thu, 27 Jan 2022 22:31:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range:
 70368455692288 is not in
Message-ID: <202201272206.NM7MPo1N-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 63b3f96e1a989846a5a521d4fbef4bc86406929d kvm: Select SCHED_INFO instead of TASK_DELAY_ACCT
date:   9 months ago
config: arm64-buildonly-randconfig-r003-20220127 (https://download.01.org/0day-ci/archive/20220127/202201272206.NM7MPo1N-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f400a6012c668dfaa73462caf067ceb074e66c47)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=63b3f96e1a989846a5a521d4fbef4bc86406929d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 63b3f96e1a989846a5a521d4fbef4bc86406929d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368455692288 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368455692288 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368455692288 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368455692288 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 70368455692288 is not in [-4294967296, 4294967295]

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
