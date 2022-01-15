Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9892CA2
	for <llvm@lists.linux.dev>; Sat, 15 Jan 2022 21:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642283505; x=1673819505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQjgmX+6U3TQQip0A1tuwriE8Vl38rW2a49NCxQ71fA=;
  b=IWIPL/7Zles/ObKe9SsoY78zULNCP2k56L7zc1cqFNQIP+bQEIxYM2rQ
   VS89+hQ9sfEm3ZsxBsREA84tI19KGKV16DYFwv/NqLF3YyESylnwZNcWk
   R+6SIFpa7hgKaeYlOlbKfx24QH2RvP4v16h+vCJr1r/sulAL1eFY/ard7
   6xzQSXozqPM3b6VfQyS1+1n6gGGfjj8WuDyB4E6iYDe5RrTWdZ8rhRD7L
   cYHss1WOycgofCQhr1AwV2i13Fz7oEOAbSltLx7/iQcd22yzZ6l1tRfob
   QG1GaMOlATk0UWAJyXbSWu+AjQejLvtmM75ambxbyVoEO1aGB59GJDOig
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10228"; a="225124783"
X-IronPort-AV: E=Sophos;i="5.88,292,1635231600"; 
   d="scan'208";a="225124783"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2022 13:51:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,292,1635231600"; 
   d="scan'208";a="614677458"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jan 2022 13:51:43 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8qxa-000AJY-Qw; Sat, 15 Jan 2022 21:51:42 +0000
Date: Sun, 16 Jan 2022 05:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1597/2384]
 ./usr/include/linux/netlink.h:5:10: fatal error: 'uapi/linux/types.h' file
 not found
Message-ID: <202201160519.Yztp2bjA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   4c707c1c0de83967079b4e385012fa5b00e2cd11
commit: 394a7895e7b5aeef5c98d7fbe21f09107b515d19 [1597/2384] headers/deps: net: Optimize <uapi/linux/netlink.h>
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220116/202201160519.Yztp2bjA-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=394a7895e7b5aeef5c98d7fbe21f09107b515d19
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 394a7895e7b5aeef5c98d7fbe21f09107b515d19
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/fib_rules.h:6:
   In file included from ./usr/include/linux/rtnetlink.h:6:
>> ./usr/include/linux/netlink.h:5:10: fatal error: 'uapi/linux/types.h' file not found
   #include <uapi/linux/types.h>
            ^~~~~~~~~~~~~~~~~~~~
   1 error generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
