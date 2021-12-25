Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC38168
	for <llvm@lists.linux.dev>; Sat, 25 Dec 2021 20:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640463229; x=1671999229;
  h=date:from:cc:subject:message-id:mime-version;
  bh=61ODfWfDm1y6GoQCrswJCmAjyIwr0OuIHtoBslSYP0M=;
  b=GPfIx3pW0uip6gK/BH00Sv7llBPQFutZiyru3qHCzP60IidsSQPxXHvS
   RqM5JJcnO7Q7tbQO8Ati/n707jS/KlLdy54l/a+vYaPSjnFAgeqy5FvjF
   EkwheBwxY5vjruq2l4UlnKUhRNHbFRZP+H8+Zh6vJ8fuDAseRHgRJ2nfS
   1miOUmHC3W0A3xgZ+wHayCgJHguhkiL8JtIcijttxM+4IYTxqlIytA103
   /rCoC/MVfWB7UJ6/45l4iTtrEioLKDO6ITJY58pkD9WUP7U7FuTLd5y8m
   D3RiBMPpmapJ22WJFhmfdQqXTnWPce51hzGkhOu7+Lh3z0EOSYSwX0bZz
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10208"; a="238603730"
X-IronPort-AV: E=Sophos;i="5.88,235,1635231600"; 
   d="scan'208";a="238603730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2021 12:13:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,235,1635231600"; 
   d="scan'208";a="469343473"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Dec 2021 12:13:47 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1DQJ-0004ee-0T; Sat, 25 Dec 2021 20:13:47 +0000
Date: Sun, 26 Dec 2021 04:13:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: warning: stack frame size (2344) exceeds limit (2048) in
 function 'dml31_ModeSupportAndSystemConfigurationFull'
Message-ID: <202112260425.J5CHcNUp-lkp@intel.com>
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
TO: Sami Tolvanen <samitolvanen@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alexander Lobakin <alobakin@pm.me>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927dfc67d05a72167ab980c375ed98b2ee9c2c6
commit: 850ded46c64299f04d15e39caaba21963fb966f8 kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
date:   4 months ago
config: x86_64-randconfig-a001-20211225 (https://download.01.org/0day-ci/archive/20211226/202112260425.J5CHcNUp-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=850ded46c64299f04d15e39caaba21963fb966f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 850ded46c64299f04d15e39caaba21963fb966f8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> ld.lld: warning: stack frame size (2344) exceeds limit (2048) in function 'dml31_ModeSupportAndSystemConfigurationFull'
--
>> arch/x86/crypto/chacha-x86_64.lto.o: warning: objtool: chacha_2block_xor_avx512vl() falls through to next function chacha_8block_xor_avx512vl()
>> arch/x86/crypto/chacha-x86_64.lto.o: warning: objtool: chacha_4block_xor_avx512vl() falls through to next function chacha_8block_xor_avx512vl()

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
