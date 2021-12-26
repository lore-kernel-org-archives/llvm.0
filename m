Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDABA29CA
	for <llvm@lists.linux.dev>; Sun, 26 Dec 2021 04:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640491232; x=1672027232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JPdf7UENxyA+2Mt5XQEsSykzeOvkq45WH2qpxtn22QI=;
  b=G15NxyHmF3SqRxxJgfe1fkzotEVvvo/OuchwN8/jBLXN5v8+M4BkM+uh
   FrKxUuh+JFf3v0dWW1er50qefRCflePrVrQiniFRGcsFlBkli0CO8heKA
   uASxvONtuov+rGY45bw6he7b3/DznGA1m2QQZeELgpd8eDvM8eM00TKEz
   cg8M7CamcZkbfhLRVJqiwWj3e/RvFCNzqLyG1mbkruUM+4Mbu+i5rDV5a
   u+sq/M4dmNRH9LoU8bFPj4SPyq9If4G3ZARBM/FQiyJUKzXSF2Zu/WKu3
   Xab1n9t6bh3rkAujt/3MsEYVKwJxL+WWyFAzBpX26Ewnih7531Ud+WZ1L
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10208"; a="327408574"
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="327408574"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2021 20:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="485720751"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Dec 2021 20:00:30 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1Khx-00050f-EW; Sun, 26 Dec 2021 04:00:29 +0000
Date: Sun, 26 Dec 2021 12:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/compressed/../../lib/bswapsi.c:5:22: warning: no
 previous prototype for function '__bswapsi2'
Message-ID: <202112261150.2zpinfBb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e2ae0d4a6b0ba461542f0fd0ba0b828658013e9f
commit: f78b25ee922ef6faf59a258af1b9388ca894cfd9 mips: decompressor: do not copy source files while building
date:   6 weeks ago
config: mips-buildonly-randconfig-r003-20211226 (https://download.01.org/0day-ci/archive/20211226/202112261150.2zpinfBb-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 0c553cc1af2e4c14100df6cf4a6fc91987e778e6)
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

   In file included from arch/mips/boot/compressed/bswapsi.c:2:
>> arch/mips/boot/compressed/../../lib/bswapsi.c:5:22: warning: no previous prototype for function '__bswapsi2' [-Wmissing-prototypes]
   unsigned int notrace __bswapsi2(unsigned int u)
                        ^
   arch/mips/boot/compressed/../../lib/bswapsi.c:5:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned int notrace __bswapsi2(unsigned int u)
   ^
   static 
   1 warning generated.


vim +/__bswapsi2 +5 arch/mips/boot/compressed/../../lib/bswapsi.c

1ee3630a3e57f3 Ralf Baechle 2015-09-29   4  
aedcfbe06558a9 Harvey Hunt  2016-05-25  @5  unsigned int notrace __bswapsi2(unsigned int u)
1ee3630a3e57f3 Ralf Baechle 2015-09-29   6  {
1ee3630a3e57f3 Ralf Baechle 2015-09-29   7  	return (((u) & 0xff000000) >> 24) |
1ee3630a3e57f3 Ralf Baechle 2015-09-29   8  	       (((u) & 0x00ff0000) >>  8) |
1ee3630a3e57f3 Ralf Baechle 2015-09-29   9  	       (((u) & 0x0000ff00) <<  8) |
1ee3630a3e57f3 Ralf Baechle 2015-09-29  10  	       (((u) & 0x000000ff) << 24);
1ee3630a3e57f3 Ralf Baechle 2015-09-29  11  }
1ee3630a3e57f3 Ralf Baechle 2015-09-29  12  

:::::: The code at line 5 was first introduced by commit
:::::: aedcfbe06558a9f53002e82d5be64c6c94687726 MIPS: lib: Mark intrinsics notrace

:::::: TO: Harvey Hunt <harvey.hunt@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
