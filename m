Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74227F2;
	Sun, 23 Apr 2023 18:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682275708; x=1713811708;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0I9ZZp/AN7VXzYVowNkw/ZIRSvzBdeQW+QgJKfPAFLs=;
  b=HsXi6OTZAdHgNB0OYZI4HGmlG4NgxTp085uD4izs001BmxpexH5eV7UU
   bwMyJ1mxROCtxrEOd9ey83U1If7eO8mnLVWxiZrV6jgHOEAspR033UGl8
   Q+Knd4vvFFWBnoKLKZGAhegQtm0w02VzqadUH/3dLBzB56RXqiGZueHTB
   Rd8n/kaS9j2MPgQGEVDFp4gitMKYf6hZAX4i2aEOuNnFZzslhz2ikAXKb
   sgjXEYUaWXTyHD3peEdW9RDW8R3dWXaVbOdDhg/qA11HgFEJGw8l2UsD2
   8jYV278IxkoWXMUH2ffpQuspQtA3tUJhk6j5yTLT/q0cogO38XvUkFK2z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="409236161"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="409236161"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 11:48:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="725454346"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="725454346"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Apr 2023 11:48:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqel8-000i36-27;
	Sun, 23 Apr 2023 18:48:26 +0000
Date: Mon, 24 Apr 2023 02:48:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_sym_address: .text+0x0): relocation R_RISCV_PCREL_HI20 out of
 range: -524414 is not in [-524288, 524287]; references
 'kallsyms_relative_base'
Message-ID: <202304240257.kM8p6D3R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Zhen Lei <thunder.leizhen@huawei.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

Hi Zhen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   622322f53c6d9ddd3c2a4aad852b3e1adbd56da7
commit: 30f3bb09778de64ef9f23fb4bb5f868c4728a071 kallsyms: Add self-test facility
date:   5 months ago
config: riscv-randconfig-r025-20230423 (https://download.01.org/0day-ci/archive/20230424/202304240257.kM8p6D3R-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=30f3bb09778de64ef9f23fb4bb5f868c4728a071
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 30f3bb09778de64ef9f23fb4bb5f868c4728a071
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304240257.kM8p6D3R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0x0): relocation R_RISCV_PCREL_HI20 out of range: -524414 is not in [-524288, 524287]; references 'kallsyms_relative_base'
   >>> referenced by kallsyms.c:156 (kernel/kallsyms.c:156)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0xa): relocation R_RISCV_PCREL_HI20 out of range: -524414 is not in [-524288, 524287]; references 'kallsyms_offsets'
   >>> referenced by kallsyms.c:156 (kernel/kallsyms.c:156)
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
