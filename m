Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1E2CA6
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 00:42:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="218409280"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="218409280"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 16:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="679677214"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Dec 2021 16:42:18 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mul2I-000N8b-4U; Wed, 08 Dec 2021 00:42:18 +0000
Date: Wed, 8 Dec 2021 08:41:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: arch/x86/kernel/traps.o: warning: objtool: handle_xfd_event()+0xdb:
 unreachable instruction
Message-ID: <202112080834.XFYU8b5Q-lkp@intel.com>
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
TO: "Chang S. Bae" <chang.seok.bae@intel.com>
CC: Borislav Petkov <bp@suse.de>
CC: Thomas Gleixner <tglx@linutronix.de>

Hi Chang,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: 783e87b404956f8958657aed8a6a72aa98d5b7e1 x86/fpu/xstate: Add XFD #NM handler
date:   6 weeks ago
config: x86_64-randconfig-r035-20211128 (https://download.01.org/0day-ci/archive/20211208/202112080834.XFYU8b5Q-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c64d8ef8cc0c0ed3e0f2ae693d99e7f70f20a84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=783e87b404956f8958657aed8a6a72aa98d5b7e1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 783e87b404956f8958657aed8a6a72aa98d5b7e1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ block// crypto// drivers/ fs// kernel// mm// net/ sound/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/traps.o: warning: objtool: handle_xfd_event()+0xdb: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
