Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A901C7B
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645369302; x=1676905302;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1Y/+RfD/+cBA/nT6Ku4k1bd7+Mm5vhDyaHbCTPajP7Y=;
  b=cw5zKhh+eQBtUG1GlTO7sDc8tIVlDZ/NCsp0bWd+RatCHqiJbhqSgC1G
   DZeUtBmduLfh+uJCNE+ytEUVZMcg6sYHmSIj75DKLrbGR/IKHtzzg0tt3
   Kev9FweKj62C5kcZCbtiAZgsSZdcOS8o1/6RlIVcJUOzg09EClxrHPSBC
   no3Wjehrs0h9xClGeYcLgshtCnka/WIxdsLDW6c4qq6MK0gEwtzabCbNN
   DHzZXh43oF8UU3aMY9IXxGwCcEPxkRap7Duqufs5PmMH0r4fV4lDc+v7d
   FSM/Ok3kCwAvcwAE0Bvc+E40xXUSgQjcDzpARri9l6D+usX2yFQnP7GyL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10263"; a="251132625"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="251132625"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 07:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; 
   d="scan'208";a="531536053"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Feb 2022 07:01:41 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLniW-0000PE-Fj; Sun, 20 Feb 2022 15:01:40 +0000
Date: Sun, 20 Feb 2022 23:01:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:x86/wip.ibt 21/31] arch/x86/kernel/head_64.o: warning:
 objtool: .noinstr.text: unexpected end of section
Message-ID: <202202202213.nQ63E20d-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.ibt
head:   fecdb8a84191710ffe01c9492fceb34a15f1576a
commit: e64f444fcfa9d7a29ceb68e505df8871622ea895 [21/31] x86/ibt,xen: Annotate away warnings
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220220/202202202213.nQ63E20d-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=e64f444fcfa9d7a29ceb68e505df8871622ea895
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt
        git checkout e64f444fcfa9d7a29ceb68e505df8871622ea895
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: .noinstr.text: unexpected end of section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
