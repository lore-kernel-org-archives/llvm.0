Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8E29CA
	for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639850875; x=1671386875;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SDPFk93NjxAyC5uGFkKsQZjdwNdszzxjTV8Qc0A4FxE=;
  b=lhTBxR+ahXnAa9JPvOhTb0nLtQInzZlgN9cHJVuqKglLuM2QpVJj4RO5
   K3gOP2KAFjvD9qF2nqF2cJgJ9yx36KISWgFSMTyVsH/hliQ4/HFSYZB4v
   auJLH8L4ZNYaxjmdky1OjQ448AULAxYaZ2+Q8jtcSgJxQuGPFte8SnoDm
   cFjqTFX6K5l4QbPC1yTJ15rlMT6b6FQuw+ebnOweiMeRO7ycT1rI7TfR8
   gdkqqxId4amtI924WlXBE9pzsF5mcdERn69gLkm9NJGjPBN0ZBPkAuUsU
   6z7gWs0mKqZ3pB0RVcSTDrFG9BGQeLtRUuvGk197ukBeXY68hT8S/FofS
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="226797566"
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="226797566"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2021 10:07:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="615911894"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Dec 2021 10:07:54 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mye7c-0006Gr-U6; Sat, 18 Dec 2021 18:07:52 +0000
Date: Sun, 19 Dec 2021 02:07:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 7598/8462] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_open: .text+0xec4):
 relocation R_RISCV_PCREL_HI20 out of range: -524470 is not in [-524288,
 524287]; references kallsyms_markers
Message-ID: <202112190243.VR0tfUjI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c122052c3cb861b3e61a01d2c2ab9069e470663e
commit: 70a691bde53c0f7b8e2ff04e1a59f710ae355b69 [7598/8462] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: riscv-randconfig-r026-20211218 (https://download.01.org/0day-ci/archive/20211219/202112190243.VR0tfUjI-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31a4814592bbda7153833e46728dc7b21100)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=70a691bde53c0f7b8e2ff04e1a59f710ae355b69
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 70a691bde53c0f7b8e2ff04e1a59f710ae355b69
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_open: .text+0xec4): relocation R_RISCV_PCREL_HI20 out of range: -524470 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
