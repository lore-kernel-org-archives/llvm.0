Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C934215AB
	for <llvm@lists.linux.dev>; Mon, 30 May 2022 03:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653880638; x=1685416638;
  h=date:from:cc:subject:message-id:mime-version;
  bh=s+jqgVLfUI4JjkqXl0uCwrKuYxCZcxZ8RLsCOznACaU=;
  b=FGHZHM6QkFEQExd6r/YxLH/ljNaALjujlsS4T/QXW2/ILgG+DNFDXxW/
   LNMbe+AcaQPdnbqVQxKKFRntolJfBdvkIifY6X1PfyhFajzyiOTsFvC5V
   bI+MfAdh2yHI6JN14o0zjUnScO+pzsAxiL9X6Nh7P/q5PqW/4jPMPGBRc
   PS5QMs9pXGlEvThxpocXGV6zT75DxajBmkPw8kMHYY0h6wmoQkPoO0gSl
   yesdioq76vVsuqoHk0sG+Lp8RQ2Jn4rzvtZ1mgEd3VVlEvu2OsyexVXK6
   lzHSxtphTUydWOddWl0o/dE/fMLus69/PeZkssTkyKhgBf4mGNDtQlNYg
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="255367842"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; 
   d="scan'208";a="255367842"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2022 20:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; 
   d="scan'208";a="528988308"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 May 2022 20:17:16 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvVu7-0001Qg-P3;
	Mon, 30 May 2022 03:17:15 +0000
Date: Mon, 30 May 2022 11:17:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: error: unknown target CPU 'loongson2f'
Message-ID: <202205301106.v9oqH05D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b00ed48bb0a7c295facf9036135a573a5cdbe7de
commit: 13ceb48bc19c563e05f407e663aaa4105fdfd408 MIPS: Loongson2ef: Remove unnecessary {as,cc}-option calls
date:   6 months ago
config: mips-buildonly-randconfig-r005-20220529 (https://download.01.org/0day-ci/archive/20220530/202205301106.v9oqH05D-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c48f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=13ceb48bc19c563e05f407e663aaa4105fdfd408
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 13ceb48bc19c563e05f407e663aaa4105fdfd408
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   clang-15: warning: argument unused during compilation: '-mno-branch-likely' [-Wunused-command-line-argument]
>> error: unknown target CPU 'loongson2f'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> error: unknown target CPU 'loongson2f'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:419: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
