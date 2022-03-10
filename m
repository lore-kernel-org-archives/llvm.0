Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24487A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646904433; x=1678440433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=72L4ehMp6FZhWswWWlpVdAywCocM3srYiCHwUoPWtCQ=;
  b=hy5Y8D9zQMP5jsOBlU9IAMHrCAFYW7TTFym9pnvaYawuR3CljY6+18n5
   ilSisfQTU2Uyq4dBdPAEHXgCa36OxPCYrzVBcFomocumBl72fJYV/7CWz
   Cgk6SoDJRjC7Uj+m4oKXyagRWpB92dsmK4E1nSfn+YXHkugvdqt/+bQz9
   /53R5/B5LAWSBnFok/u4miqk0OVism/xpocWDvdrd2iHiKGdF4qZfBjMQ
   hy4BJ23hrwnjBIvtRXb3cIpJfZka2A+LiZLJZzDQnUWrK9jtizfTwXCO0
   IJ4hZyx0G/YezJfl+uPHA8Qu6v9rRXCMcfOBWLbkAESNnyltorrYdk4bM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="254033609"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; 
   d="scan'208";a="254033609"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 01:26:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; 
   d="scan'208";a="547955817"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 10 Mar 2022 01:26:48 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSF4J-0004jk-L9; Thu, 10 Mar 2022 09:26:47 +0000
Date: Thu, 10 Mar 2022 17:26:08 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/compressed/../../../../lib/ashldi3.c:9:19: warning:
 no previous prototype for function '__ashldi3'
Message-ID: <202203101712.9ZWwXz8a-lkp@intel.com>
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
head:   3bf7edc84a9eb4007dd9a0cb8878a7e1d5ec6a3b
commit: f78b25ee922ef6faf59a258af1b9388ca894cfd9 mips: decompressor: do not copy source files while building
date:   4 months ago
config: mips-loongson1c_defconfig (https://download.01.org/0day-ci/archive/20220310/202203101712.9ZWwXz8a-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
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

b35cd9884fa5d81 Palmer Dabbelt 2017-05-23  8  
b35cd9884fa5d81 Palmer Dabbelt 2017-05-23 @9  long long notrace __ashldi3(long long u, word_type b)

:::::: The code at line 9 was first introduced by commit
:::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of some GCC library routines

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
