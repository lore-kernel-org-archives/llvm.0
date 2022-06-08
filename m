Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3918E
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 10:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654684530; x=1686220530;
  h=date:from:cc:subject:message-id:mime-version;
  bh=NL/0e059En0AWeFv2uARR/Ab1zKl68mxTY2uR0iuAU4=;
  b=kV/DNnOMtH9F1xvnQ82YluEsFyD18fuZI5gK7cRIbHHfp0fy6EA5dhnE
   e5tka/7kftlw4OQhrul3JdrxPp56Qx/yfngsntzhTfGDtiAv+DD9f6469
   ugfUkpL3F/0dtwIMyM07uB+2UkJZMWPXEvJk4OEzqm2uck5wAo9tFYYRm
   M7KW0w71O5RA3zLDTPmEbHUP42TfNNir1irlUiE/fLXhfV7pJW1NaNs5K
   kRUlR9ELwRK4MI+QzSPgYcJWwV4DyEM9QvbL3+awlmYWpjzpxHoU+03kn
   xn6xfjZUYHfKMfckmU1F4HLxXk/cvZQUQpdff9el/2lZh4zQljuGAhw6+
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="277690174"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="277690174"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 03:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="648539221"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2022 03:35:29 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyt28-000EXr-Ff;
	Wed, 08 Jun 2022 10:35:28 +0000
Date: Wed, 8 Jun 2022 18:34:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
Message-ID: <202206081810.0egOso3q-lkp@intel.com>
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
TO: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Tiezhu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9886142c7a2226439c1e3f7d9b69f9c7094c3ef6
commit: 048cc2378c2494519d940597629465b3ea44a96f MIPS: SGI-IP22: Remove unnecessary check of GCC option
date:   6 months ago
config: mips-ip28_defconfig (https://download.01.org/0day-ci/archive/20220608/202206081810.0egOso3q-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=048cc2378c2494519d940597629465b3ea44a96f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 048cc2378c2494519d940597629465b3ea44a96f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> clang-15: error: unknown argument: '-mr10k-cache-barrier=store'
   make[2]: *** [scripts/Makefile.build:121: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:415: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
