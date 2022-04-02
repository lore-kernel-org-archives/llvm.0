Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4587A
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648939870; x=1680475870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y43E/9eBz/i8hIRyX+/vHZFf8X1cypVAyRuz4VlBu1M=;
  b=Gh63vSbpWv2JSi/Rkh+dD/cqsL7bXhyq4s1gtb0kXKUBwIuKILjVx9hA
   Y3h/m07PQiOETcUAeE6pZuamA+2KeBU5X233sqzyMQU3dlerFlCEVzXz0
   LRMv8agYbzkL84sppaT25Z8ZGZPgbokUDmTAyOn7dg55dc92p/UVSuyLj
   bruFPGA7HJ1pxCqucfi/cA1fKUUyvnq7h1r2oMKgaRo0wF0TddJjuu9ka
   yhPjltRcAp8phh7gnbgxefiHCON9ugw/cDfw42whN4X/38eqBJkmRqkh9
   h9wkakrvGKUI4pOAAQUV1a/yIRAuEAv7i+MvNxqUkE4OsXnjNGA0Tt+E0
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="260041124"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="260041124"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2022 15:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="721259948"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Apr 2022 15:51:07 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1namaJ-0000V3-0z;
	Sat, 02 Apr 2022 22:51:07 +0000
Date: Sun, 3 Apr 2022 06:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/compressed/../../../../lib/ashldi3.c:9:19: warning:
 no previous prototype for function '__ashldi3'
Message-ID: <202204030642.RDqRmkF4-lkp@intel.com>
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
head:   6f34f8c3d6178527d4c02aa3a53c370cc70cb91e
commit: f78b25ee922ef6faf59a258af1b9388ca894cfd9 mips: decompressor: do not copy source files while building
date:   5 months ago
config: mips-loongson1c_defconfig (https://download.01.org/0day-ci/archive/20220403/202204030642.RDqRmkF4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
