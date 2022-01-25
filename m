Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C572CA7
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 21:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643145023; x=1674681023;
  h=date:from:cc:subject:message-id:mime-version;
  bh=n1oq/ENan4pfpBQFSeQqfrDeX5ym48UUoEtwR1p4mPM=;
  b=P9lgYrXW+sDFFecCUPaEzeQNRHA7NSHHUCYSTPOXPHIGRuanhEYX4NQf
   mtYSJrqtB1gWM1UWUYjNbJuM06YpzmEEVkeDfow4XFNofXQQONWSwOMwA
   4JfKlz7mnn2ujb9gMi+OSKZ8pnxP3Do6RqpMq9DQCTqmUc9D1ChY+lkeB
   Ws3sJ20KkILsZF6cqe4ap1QdXRTSV+vY9dEovWKlmOlIwRxZTlCY44Rno
   CQRHhGYjFidVHRgOIFW2+3vSYECg8CQp69OXyaZH01eCDyy36WCBw3Hfk
   u6gXIWTQIXsjCpok4G7laowAYpfnu/ZwfNM9chm7HfaXR2lW5kRaCO8RB
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="245251509"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="245251509"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 13:10:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="695989582"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Jan 2022 13:10:21 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCT52-000KRP-Qa; Tue, 25 Jan 2022 21:10:20 +0000
Date: Wed, 26 Jan 2022 05:09:43 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] Kconfig.debug: Make DEBUG_INFO selectable from a
 choice
Message-ID: <202201260410.RSiRayDu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

In-Reply-To: <20220125075126.891825-1-keescook@chromium.org>
References: <20220125075126.891825-1-keescook@chromium.org>
TO: Kees Cook <keescook@chromium.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Isabella Basso <isabbasso@riseup.net>

Hi Kees,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc1 next-20220125]
[cannot apply to kees/for-next/pstore soc/for-next hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/Kconfig-debug-Make-DEBUG_INFO-selectable-from-a-choice/20220125-170038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
config: riscv-buildonly-randconfig-r001-20220124 (https://download.01.org/0day-ci/archive/20220126/202201260410.RSiRayDu-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/1046f1c82b089b9cde35f6fcb0b3f34f53a90fa4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Kees-Cook/Kconfig-debug-Make-DEBUG_INFO-selectable-from-a-choice/20220125-170038
        git checkout 1046f1c82b089b9cde35f6fcb0b3f34f53a90fa4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)
   pahole: .tmp_vmlinux.btf: No such file or directory
>> ld.lld: error: .btf.vmlinux.bin.o: unknown file type

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
