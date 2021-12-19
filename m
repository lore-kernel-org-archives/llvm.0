Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CF129CA
	for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 12:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639916433; x=1671452433;
  h=date:from:cc:subject:message-id:mime-version;
  bh=n2faEWjlYB8l7M23yEOBqcjKjjk33oTOAXgFSOyz+hI=;
  b=DOSmn0aVk2j6OP0Vv6QqtrOc28Bv7KIwkwWeV+nGX9eHLJNlDVo66Lnq
   flkDkemJXj13yosPPwK2+2xQ9kKujH23kmIt2qrBib4fXBos3fvLL7m88
   024TrJlABHJKfotK+RE0Oe5ln3o9Nqm35o6LaE+alBFSkZzUk5LZIulPt
   aUiFFZjVUmOc0SZ6yWSmD+LDDmtunvoGkdmOsQiL3ReB6HALjOo5vbZ3p
   dYqzc71Tt6jyipcwfdbEVZ9/3MONcN+/nLCDpgxaxxseHVZlEUZdo5cr4
   SiA2d1Vtf2P9J6I+TRQZUmVLaCoVkKih30APh6TgJvPJt6rlj0HhErQ5t
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="239823166"
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; 
   d="scan'208";a="239823166"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2021 04:20:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; 
   d="scan'208";a="683941013"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Dec 2021 04:20:31 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myvB1-0006xW-3f; Sun, 19 Dec 2021 12:20:31 +0000
Date: Sun, 19 Dec 2021 20:20:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: kernel/trace/trace_dynevent.o: warning: objtool:
 trace_event_dyn_put_ref()+0x6c: unreachable instruction
Message-ID: <202112192032.1KG7EPmr-lkp@intel.com>
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
TO: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f667b5d4053ad54aee13dab5c94f04ff75ddfdf
commit: 1d18538e6a09265003a0a94ca779d7a6127cb76c tracing: Have dynamic events have a ref counter
date:   4 months ago
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211219/202112192032.1KG7EPmr-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1d18538e6a09265003a0a94ca779d7a6127cb76c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1d18538e6a09265003a0a94ca779d7a6127cb76c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_dynevent.o: warning: objtool: trace_event_dyn_put_ref()+0x6c: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
