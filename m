Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063F57C
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 02:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648436123; x=1679972123;
  h=date:from:cc:subject:message-id:mime-version;
  bh=MSExRa7Fjbcaglak18aTSVqLmWct1AYCzM6FfW/YTwE=;
  b=QFksKJnHv+Ece3lV74n5I7GLoWhM7OyybtY/QXmDr+d5Cpzt+eWwNm/b
   CushZ1DfOr9/nmp0ZXDP3/rikUSglvHI+CtgPTm6JOyRFToALUieqOHoP
   B1XI2yIkFnvVXDtWE2NNMB6SEuP/dZx+uK0SrpfQTPTe9ZJvofsRjg5o7
   cqvaR2nF9OR5ty+L1dQGr9Uzq9imAGScOomZ/cpm+V/u0wf09xxQgDohy
   NpfuQz04GoxE5rSxJXNyf8qYamLpwvR8FCSn6nuErmSMpKkKqmut4exWd
   +yBNnZMuEhKnIbglDd/42+Rgal7QO0EiywYpWKwbGCQpUJBFDgzt9Ktog
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="239496271"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="239496271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2022 19:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="545779056"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Mar 2022 19:55:21 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYfXM-0001fG-Id; Mon, 28 Mar 2022 02:55:20 +0000
Date: Mon, 28 Mar 2022 10:54:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: ibt_selftest()+0xf: sibling call from
 callable instruction with modified stack frame
Message-ID: <202203281030.xX5aTgcR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f82da161ea75dc4db21b2499e4b1facd36dab275
commit: ed53a0d971926e484d86cce617ec02a7ee85c3fe x86/alternative: Use .ibt_endbr_seal to seal indirect calls
date:   13 days ago
config: x86_64-randconfig-r016-20220328 (https://download.01.org/0day-ci/archive/20220328/202203281030.xX5aTgcR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ed53a0d971926e484d86cce617ec02a7ee85c3fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ed53a0d971926e484d86cce617ec02a7ee85c3fe
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ibt_selftest()+0xf: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: ibt_selftest()+0x19: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
