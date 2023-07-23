Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63731A29;
	Sun, 23 Jul 2023 05:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690089653; x=1721625653;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bZQ2NgUlnzjocLBN3XvnmTisl4OeaVFrd20+3fiZLdA=;
  b=RjLvCXordM9vZPv3B6/mM9v3SIhOkMZd00ozw7XlXYktTIGe86IzfcQH
   kICSymYKALVw1vYNkFTFjLy8QChWr5DPKWavRZXcoUiVsc6mR39gSCkdl
   X2zAdMi6RKMOtjP7RyFSJc9h47PxuMvYIYYC5nYSkL1nTtyY7OFmYMor5
   5HwZpffVAmiU3lK6y1+Zq+pIwzmdeHjk5KKGqiXs6xgq6VeNONK45PUC5
   eIC414EX2EwGsLAICSEpMueXy7tyxszlLWiR8OB+KuA0HqZC8qAH1rwQk
   v42jskSm2zeWzOpvrjGByqfxtOMtzp+UNohON8pEpTI6+A2E5lRBZ1VQc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="453626217"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="453626217"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 22:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="839030732"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="839030732"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2023 22:20:51 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNRWU-0008rH-2s;
	Sun, 23 Jul 2023 05:20:50 +0000
Date: Sun, 23 Jul 2023 13:20:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: clang: error: unsupported option '-fsanitize=thread' for target
 'powerpc-unknown-linux-gnu'
Message-ID: <202307231326.12RhOWrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Rohan McLure <rmclure@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi Rohan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2782531397f5cb19ca3f8f9c17727f1cdf5bee8
commit: 95567f46b4d20c047750a5e3029461afcdc67697 powerpc/{32,book3e}: kcsan: Extend KCSAN Support
date:   6 weeks ago
config: powerpc-randconfig-r006-20230723 (https://download.01.org/0day-ci/archive/20230723/202307231326.12RhOWrQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307231326.12RhOWrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307231326.12RhOWrQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
>> clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1 shuffle=2662931784
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1 shuffle=2662931784
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2 shuffle=2662931784
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=2662931784
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
