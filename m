Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B62163
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 00:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649289804; x=1680825804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hu/qduD1GZxLWWXHqubllafoqMw931EVunCvJKzuasg=;
  b=KHb/PpYhkxjKuRFfv9hXtT+nyvhR5B5Tfft9bax/22I9dGg76Z3a0Et6
   2/w1Ox5G2thmhgoPHGPAcXmP7OiPv36bHhzuUENYfDIgT0nl1y/6rJmfr
   jnSnGSIc8dkzJUmoUwWytZUdw/ZBs8q9bB3mhqoUMsREbYzocszLyX2Zk
   FKP1pCxqNt2WGqIXO0eG+mS19zcZlLBzj3PbfRWhMcHNV5yMS9rV3EPot
   enIdOsbGeDapEzGXUzpUX/ujoXNKBtYMI7Nhuxfdzd2GMK1FmKggWPD43
   mUR++oIZIHgZD7RKroo2ZE4yQ0CMuAla8fjNv3LX1E0GzONkvoqa+5xSm
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="321882593"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="321882593"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 17:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; 
   d="scan'208";a="549778978"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 06 Apr 2022 17:03:22 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncFcP-0004sE-Et;
	Thu, 07 Apr 2022 00:03:21 +0000
Date: Thu, 7 Apr 2022 08:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 2/55] arch/riscv/lib/string.c:89:7: error:
 expected identifier or '('
Message-ID: <202204070737.6a0DKGta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/esmil/linux visionfive
head:   7ff84520cb688edd6028a4ac3de3ed684eb22794
commit: b058f14336c3f0efc9156b44d9b4f8357e5c7a56 [2/55] riscv: optimized memcpy
config: riscv-randconfig-r003-20220406 (https://download.01.org/0day-ci/archive/20220407/202204070737.6a0DKGta-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/b058f14336c3f0efc9156b44d9b4f8357e5c7a56
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout b058f14336c3f0efc9156b44d9b4f8357e5c7a56
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/lib/string.c:89:7: error: expected identifier or '('
   void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
         ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:358:42: note: expanded from macro '__fortify_memcpy_chk'
                                p_size_field, q_size_field, op) ({         \
                                                                 ^
>> arch/riscv/lib/string.c:89:7: error: expected ')'
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:358:42: note: expanded from macro '__fortify_memcpy_chk'
                                p_size_field, q_size_field, op) ({         \
                                                                 ^
   arch/riscv/lib/string.c:89:7: note: to match this '('
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^
   include/linux/fortify-string.h:358:41: note: expanded from macro '__fortify_memcpy_chk'
                                p_size_field, q_size_field, op) ({         \
                                                                ^
   2 errors generated.


vim +89 arch/riscv/lib/string.c

    88	
  > 89	void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
