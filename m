Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D9B7D
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644831543; x=1676367543;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vmfu5XjeH6Lo9xcYfMDHn+0iLaVOO4yMHFGCPAM7pRQ=;
  b=TNJ8bumiNPPmsjKk1HfG5lEkX6+K3yY9Cmatz2D2AKJ9aCjZvY5LilvW
   2kHR0i22HWqD8lns0fSbb72csu0HkE5oYlOvWAHXaNTIsDmGhU/ZBwmxo
   nQ/mj6Lj8OqIfatkuv+Y8ANYFEw+B8Zt98dRcbdMQtZ+lQLSsNMzt90s1
   S1pi2BsOQLBNGNx+a6hKvEHyLnAb3nXkL90W4pQXFrA7ImghFuGRrMpWm
   0BzOonSVGkif6nqUePloVpgqZzu+U9+qJtZceoDDRxMpBKbTldMTJnuK5
   5n/iWKvO903F1F44qPTt+ZE4QBXqYDuFLv0dTYUTZc+y7P7eV/qZ5SmCL
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="248885912"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="248885912"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 01:38:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="635052311"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 14 Feb 2022 01:38:51 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJXoo-0008M4-Ck; Mon, 14 Feb 2022 09:38:50 +0000
Date: Mon, 14 Feb 2022 17:38:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [rust:rust-next 1/21] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x5dc):
 relocation R_RISCV_PCREL_HI20 out of range: -524452 is not in [-524288,
 524287]; references kallsyms_names
Message-ID: <202202141702.w7w1AX5c-lkp@intel.com>
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
TO: Miguel Ojeda <ojeda@kernel.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Wedson Almeida Filho <wedsonaf@google.com>
CC: Gary Guo <gary@garyguo.net>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Matthew Wilcox <willy@infradead.org>

tree:   https://github.com/Rust-for-Linux/linux rust-next
head:   847245fe812e178d9cdabcec70ebf9d02fb383e1
commit: ae45d5d7dc111be61c577f072fed2d3d55db7112 [1/21] kallsyms: support "big" kernel symbols
config: riscv-randconfig-r016-20220213 (https://download.01.org/0day-ci/archive/20220214/202202141702.w7w1AX5c-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/Rust-for-Linux/linux/commit/ae45d5d7dc111be61c577f072fed2d3d55db7112
        git remote add rust https://github.com/Rust-for-Linux/linux
        git fetch --no-tags rust rust-next
        git checkout ae45d5d7dc111be61c577f072fed2d3d55db7112
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x5dc): relocation R_RISCV_PCREL_HI20 out of range: -524452 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xc5a): relocation R_RISCV_PCREL_HI20 out of range: -524453 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xc76): relocation R_RISCV_PCREL_HI20 out of range: -524453 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x5ce): relocation R_RISCV_PCREL_HI20 out of range: -524452 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
