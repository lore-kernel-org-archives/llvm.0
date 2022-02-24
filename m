Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E31386
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 08:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645690278; x=1677226278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GFwgXOGJpALs3zlAijjfYNw0pudkBtjVqmWxF3fSdRg=;
  b=MCaMAtN9lyyzDy7Y12PEwH14h1s6b0HZf8WG7z2g+nqFumjiqxZZb/u/
   ugLMy/1gda7dtzLAKnRK2LozcZ4M97oXrkoXnIq1qaYNs3EfUIkpwFn6F
   iiMrrKljFnyUZz8lrcgLf5aHg4xzZ0MrMKlOFohXL7O7EZS1vx2uWCwOj
   Q86BcsXuQ+clVDOaLoOd5En/R1HihWkgsqF7U331zQp3hcg2b0JR7Z8DR
   xVmOVQsmYUIn8sZ1tkUeN1gM3jrOLU+zs9YVI37vCmyLO7Xl4Y4JIaVYs
   NnLiwYS9WKSUu598pvcz4+HxT46zdYtVyZt3KpNc3PwhieZoQYe5ElAi7
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="312894092"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="312894092"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 00:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; 
   d="scan'208";a="707367251"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Feb 2022 00:11:16 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN9DX-0002tf-Gj; Thu, 24 Feb 2022 08:11:15 +0000
Date: Thu, 24 Feb 2022 16:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:x86/wip.ibt 27/42] arch/x86/lib/retpoline.S:15:2:
 error: invalid instruction mnemonic 'annotate_noendbr'
Message-ID: <202202241631.ROFL064p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.ibt
head:   27b6438f414b6a37b60dcd90c8980397586d49db
commit: 894eca106331b66d8f1c261d40386c043da75ee2 [27/42] x86/ibt: Annotate text references
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220224/202202241631.ROFL064p-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=894eca106331b66d8f1c261d40386c043da75ee2
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.ibt
        git checkout 894eca106331b66d8f1c261d40386c043da75ee2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/lib/retpoline.S:15:2: error: invalid instruction mnemonic 'annotate_noendbr'
    ANNOTATE_NOENDBR
    ^~~~~~~~~~~~~~~~


vim +/annotate_noendbr +15 arch/x86/lib/retpoline.S

    12	
    13		.section .text.__x86.indirect_thunk
    14	
  > 15		ANNOTATE_NOENDBR // apply_retpolines
    16	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
