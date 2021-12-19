Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4732C9C
	for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 21:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639951006; x=1671487006;
  h=date:from:cc:subject:message-id:mime-version;
  bh=S5tan0eLL2f+VRs8QqiI9w3+1HaP7Tp9pCDcWTZ7e+4=;
  b=gNY1Pm+qq2OKMctQLvmTyHozyKjEkGyAPAVMJTUdxYEN1wlYxrMslJWk
   5amuDZ0jkobdudHvr8GrqWcdAxKxTakpYOvkuVtSv5UNxJ6dYvhN1zyTN
   p2BH+lgR+S7sekkvxUvGGUeHFslqHEDsoi3RW2cf9wa12axiOieW2Ks0B
   So8qsiwP5AyYknlBw7WKlCQZnjGxgwJcjTBAKZzQ4aq34z8Rm0wHCQnuZ
   BOn8UZ+lLakwTUy0yklNwfwpvP97sC5KPkUWnFmPjNL+8nyf6mmlcciDk
   2pVT4P6Zw4ygB9ACIwEDXJQ7JcnC/7vg6oUmPMI6NQ8b0TYe5PiQM5cK2
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="238803747"
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; 
   d="scan'208";a="238803747"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2021 13:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; 
   d="scan'208";a="507457365"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Dec 2021 13:56:44 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mz4Ae-0007IJ-9r; Sun, 19 Dec 2021 21:56:44 +0000
Date: Mon, 20 Dec 2021 05:56:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: kernel/locking/lockdep.o: warning: objtool:
 lockdep_hardirqs_on_prepare()+0x40f: unreachable instruction
Message-ID: <202112200546.w5fKNXmY-lkp@intel.com>
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
TO: Frederic Weisbecker <frederic@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f667b5d4053ad54aee13dab5c94f04ff75ddfdf
commit: c597bfddc9e9e8a63817252b67c3ca0e544ace26 sched: Provide Kconfig support for default dynamic preempt mode
date:   3 months ago
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211220/202112200546.w5fKNXmY-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c597bfddc9e9e8a63817252b67c3ca0e544ace26
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c597bfddc9e9e8a63817252b67c3ca0e544ace26
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/locking/lockdep.o: warning: objtool: lockdep_hardirqs_on_prepare()+0x40f: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
