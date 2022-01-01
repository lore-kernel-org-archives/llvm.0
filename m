Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2CB2C82
	for <llvm@lists.linux.dev>; Sat,  1 Jan 2022 22:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641076082; x=1672612082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LSIGpRu6zXiB4msBq0C5cbY9TP4xqvWBtD1T+lS9qz0=;
  b=Mk8pW+GvLU1OQyUXmx8G/vaBGRBzoME4tkWea0cZRPdY2sDkQCCx3amg
   V1yDrZTSLMcAlXwZSdHrq13+ntvoaaIGS98T9mZZmLoMoEyftN8nF+4OU
   YzGp0cHSZGUliYVaj2wXZ6JEytExBUbtWcphkoi5dMb5l3PotVuvievit
   /pmd9SFVt/mnjAONR2eGu/lcQ/pdWJpnH5mzoGQONXYk1l2i2+6YVm7Hm
   hTnNM8kB2LfXO37JNJW4dNhaca0nHKZHc9GT8+mDFnofvEbIeViYOxH+T
   Vtr9+S8Nlzjf3CNYS2Mz/wz8Bpm7cjuPHyuJFHTyzDSatF0sFD38MwHAs
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10214"; a="222600200"
X-IronPort-AV: E=Sophos;i="5.88,254,1635231600"; 
   d="scan'208";a="222600200"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2022 14:28:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,254,1635231600"; 
   d="scan'208";a="573380830"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Jan 2022 14:28:00 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n3mr2-000Cq6-9x; Sat, 01 Jan 2022 22:28:00 +0000
Date: Sun, 2 Jan 2022 06:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/compressed/../../../../lib/ashldi3.c:9:19: warning:
 no previous prototype for function '__ashldi3'
Message-ID: <202201020552.pSlQpO1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: f78b25ee922ef6faf59a258af1b9388ca894cfd9 mips: decompressor: do not copy source files while building
date:   7 weeks ago
config: mips-loongson1c_defconfig (https://download.01.org/0day-ci/archive/20220102/202201020552.pSlQpO1b-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c054402170cd8466683a20385befc0523aba3359)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f78b25ee922ef6faf59a258af1b9388ca894cfd9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f78b25ee922ef6faf59a258af1b9388ca894cfd9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/mips/boot/compressed/ashldi3.c:2:
>> arch/mips/boot/compressed/../../../../lib/ashldi3.c:9:19: warning: no previous prototype for function '__ashldi3' [-Wmissing-prototypes]
   long long notrace __ashldi3(long long u, word_type b)
                     ^
   arch/mips/boot/compressed/../../../../lib/ashldi3.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   long long notrace __ashldi3(long long u, word_type b)
   ^
   static 
   1 warning generated.


vim +/__ashldi3 +9 arch/mips/boot/compressed/../../../../lib/ashldi3.c

b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  8  
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23 @9  long long notrace __ashldi3(long long u, word_type b)

:::::: The code at line 9 was first introduced by commit
:::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of some GCC library routines

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
