Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B7D6AAC
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 21:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657660715; x=1689196715;
  h=date:from:cc:subject:message-id:mime-version;
  bh=m0P1iMeeG5NlB1s2l25XkUPFYonMIM49J2R1G57IVXo=;
  b=Bjw3WscEWMcIrcJynj3zYZd4R58uyxUwQhywHgnI4a4QOP3p7SCvUVMf
   BVzF+oZPqwlAYoezCp9HxDc6cHFge12ChH+SxQa75iiNPPuVPYd7rB83k
   V6u7HjK65s29JGwJTScHl968Sxq5iJSgiqEGk0tQ9d3F9wTQ7M77Nlaui
   YY8J6snnA1D9WxFsvnzltwveiLSAytg7DgNy/4ythGf6adVbSPUdGeJ+c
   1zl+O1lf0lSjvI4xLbADWvFdDG6ur9AdNJIWZs1sBFKqpic/V2ubuRJs4
   dGG/I0fvMvt1+vmxvigmjrxuacwC4ImfX6RkLISr7JyTOSot9h6IR3KB7
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285071435"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="285071435"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 14:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="622665346"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Jul 2022 14:18:34 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBNH7-0002hd-GZ;
	Tue, 12 Jul 2022 21:18:33 +0000
Date: Wed, 13 Jul 2022 05:18:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function
 riscv_of_processor_hartid: .text+0x14): relocation R_RISCV_HI20 out of
 range: 529058 is not in [-524288, 524287]; references __stack_chk_guard
Message-ID: <202207130516.Yk6LEctT-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72a8e05d4f66b5af7854df4490e3135168694b6b
commit: 606b102876e3741851dfb09d53f3ee57f650a52c drm: fb_helper: fix CONFIG_FB dependency
date:   10 months ago
config: riscv-randconfig-r036-20220710 (https://download.01.org/0day-ci/archive/20220713/202207130516.Yk6LEctT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project badda4ac3c489a8c8cccdad1f74b9308c350a9e0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=606b102876e3741851dfb09d53f3ee57f650a52c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 606b102876e3741851dfb09d53f3ee57f650a52c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_processor_hartid: .text+0x14): relocation R_RISCV_HI20 out of range: 529058 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by cpu.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)
--
>> ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/kgdb.o):(function dbg_get_reg: .text+0x28): relocation R_RISCV_HI20 out of range: 528195 is not in [-524288, 524287]; references dbg_reg_def
   >>> referenced by kgdb.c
   >>> defined in arch/riscv/built-in.a(kernel/kgdb.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
