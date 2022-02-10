Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE6A2F22
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 06:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644475714; x=1676011714;
  h=date:from:cc:subject:message-id:mime-version;
  bh=nr/G/BC6QakbmjCA7/I2E4velW1h7kZS+XKVzzGr6/k=;
  b=F3IkuCcMN9uUfwi0ApEWn5b6VwzTJAnzhYWrVPHUmllf8/lYYypHv9FS
   zKafX+vnLtEo9efN3Wp2kzwdUTLjvzx4uAmBfobn1nz3bfUNpUQRK6DOe
   W0wSikd78X809T3Zpocbulnlp12jW7EN7zWs57uXWq4+CfiVbMik6PIr+
   OPTaR87fh3xTMC+XqokOLF7NC2h1JOKU3yreOtytrgEsSbcTU7ym/w47N
   ZmSHONI1eaGnMziO+G2nNc2Iw3QJ4n4WS27qCJ4TP6ipIUO0ZvmysBzLy
   X7Dp3J6KWQb7zMpofxb+6Shm5S43G3nivBxOcPsdnA15F0oE/tsz9qLMf
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="232987730"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="232987730"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 22:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="568536999"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Feb 2022 22:48:31 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nI3Fm-0002qC-Jz; Thu, 10 Feb 2022 06:48:30 +0000
Date: Thu, 10 Feb 2022 14:48:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: init/built-in.a(do_mounts_rd.o):(function
 ext2_image_size: .text+0x3e): relocation R_RISCV_HI20 out of range: 527059
 is not in [-524288, 524287]; references .L__unnamed_3
Message-ID: <202202101425.397JTyCS-lkp@intel.com>
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
TO: Paul Moore <paul@paul-moore.com>
CC: Richard Guy Briggs <rgb@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: f26d04331360d42dbd6b58448bd98e4edbfbe1c5 audit: improve audit queue handling when "audit=1" on cmdline
date:   2 weeks ago
config: riscv-randconfig-r031-20220210 (https://download.01.org/0day-ci/archive/20220210/202202101425.397JTyCS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d7a245d85c441d0bd44fc7b6c3be8f3de8d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f26d04331360d42dbd6b58448bd98e4edbfbe1c5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f26d04331360d42dbd6b58448bd98e4edbfbe1c5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(do_mounts_rd.o):(function ext2_image_size: .text+0x3e): relocation R_RISCV_HI20 out of range: 527059 is not in [-524288, 524287]; references .L__unnamed_3
   >>> referenced by do_mounts_rd.c
   >>> defined in init/built-in.a(do_mounts_rd.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
