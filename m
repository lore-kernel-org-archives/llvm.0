Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFFDA2A
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 01:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650331992; x=1681867992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hoMj3UjH0T+82jSYD+xlE5pPs568f7YF1XmJsBKbDJ0=;
  b=YBSg/TdxeioeGQ0QCshLz0z7BRjZoH8fJVyEbdISUyA+b+3UEP9ZGWYV
   zAmo+wfpMqLA0l0AFFt56IPsUfU0t4oweoIlhAIEivlfb3hc3KpaeP1z9
   pi/EGfCC9s3rty9innVoiTVzpG+2Yw5NMu7+3zKVExj9NUC2+Uq894lLk
   teQElI7cefNs6werIGfNuJprUuKHTm6K0OrMG+2p6ObQuQ9WDWQAb11Cm
   0r46V93uVwdKhK0VSeoLjeYF7YzgczQqwXwcRuNYmWxIJBMsJHYqgzgIS
   VvZClzs3urUGYoTvVqNKnD2PAbwaAX3AXv/l2fOKOvyO7s8lot/hIJtEa
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="350097634"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="350097634"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 18:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="592595956"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Apr 2022 18:33:10 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngcjt-0005AS-Nu;
	Tue, 19 Apr 2022 01:33:09 +0000
Date: Tue, 19 Apr 2022 09:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 627/2356]
 include/asm-generic/barrier.h:16:10: fatal error: 'asm/vdso/processor.h'
 file not found
Message-ID: <202204190905.l6YtOTKW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   af93551cf39027d176f30b9beafc60a4c130998a
commit: 8f4012659d7f54036074d08da273cb686c819191 [627/2356] headers/deps: Add header dependencies to .h files: <asm/vdso/processor.h>
config: hexagon-randconfig-r026-20220417 (https://download.01.org/0day-ci/archive/20220419/202204190905.l6YtOTKW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=8f4012659d7f54036074d08da273cb686c819191
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 8f4012659d7f54036074d08da273cb686c819191
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:28:
   In file included from arch/hexagon/include/asm/bitops.h:13:
   In file included from arch/hexagon/include/asm/atomic.h:13:
   In file included from ./arch/hexagon/include/generated/asm/barrier.h:1:
>> include/asm-generic/barrier.h:16:10: fatal error: 'asm/vdso/processor.h' file not found
   #include <asm/vdso/processor.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[2]: *** [scripts/Makefile.build:120: kernel/bounds.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1194: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +16 include/asm-generic/barrier.h

    15	
  > 16	#include <asm/vdso/processor.h>
    17	#include <linux/compiler.h>
    18	#include <linux/kcsan-checks.h>
    19	#include <asm/rwonce.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
