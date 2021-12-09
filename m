Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084F2C9E
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 11:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639051106; x=1670587106;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qcywDYrFhu2X5FbYtbeHdNJekkQZYIxdCBhYEvS6MAI=;
  b=WO3p6dT9/XBCg+WtVvtpeWiTFeZ8pKC0yflGB1V8ZHha0zFVYqY0uXAY
   9QnG+c6eoorR9eA1Ot82BKVeIQa++hFWKXSMLPNR+TyZQfxuddWySQ+OV
   nJqN6ol4cgwFSKzzbBwMPhYLv966Y49WsYkGk2YaGHRV8xbiPdFK1dBXY
   9isJ6sSj115lvs1qfe7isXtxQNXz9hdGaVQl78hJpVUc1hRnD8qVejo8x
   EKODMLroM+FVWJm6l929wP35/RocnwDiotaDZHTfJ6WN4d5fIXjFhM99G
   FZc9fJfG1j1lvsRWljmxqdNWHX6PkUupMVOTQ9GTOi6sDkQ1BA8A62XOU
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="218105446"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; 
   d="scan'208";a="218105446"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 03:58:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; 
   d="scan'208";a="612474466"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 09 Dec 2021 03:58:24 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mvI47-0001ro-VC; Thu, 09 Dec 2021 11:58:23 +0000
Date: Thu, 9 Dec 2021 19:57:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 4716/5842] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x45c):
 relocation R_RISCV_PCREL_HI20 out of range: -524386 is not in [-524288,
 524287]; references kallsyms_names
Message-ID: <202112091953.KSF2cfTQ-lkp@intel.com>
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
TO: Miguel Ojeda <ojeda@kernel.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Wedson Almeida Filho <wedsonaf@google.com>
CC: Gary Guo <gary@garyguo.net>
CC: Boqun Feng <boqun.feng@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eee8d0b64ecc3231040fa68ba750317ffca5c52
commit: 026221a07000d799269199c93d734cb2f4b731a8 [4716/5842] kallsyms: support "big" kernel symbols
config: riscv-buildonly-randconfig-r001-20211207 (https://download.01.org/0day-ci/archive/20211209/202112091953.KSF2cfTQ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=026221a07000d799269199c93d734cb2f4b731a8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 026221a07000d799269199c93d734cb2f4b731a8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x45c): relocation R_RISCV_PCREL_HI20 out of range: -524386 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x44e): relocation R_RISCV_PCREL_HI20 out of range: -524386 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
