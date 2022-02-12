Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189687D
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644662383; x=1676198383;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Rqc8J5eQU4lBxtOGIrF7ieabk2WVNWhi8Mm8rL1wNoQ=;
  b=Iz5RtmO/Frfv65iNvhtq6UJ+IqYlR3n5r1Y/3Rr2ZElgT7gR2FuXCXaa
   hZkAdSZ/Na0RkWig99SYbHWLgX4EObx+++wNdvq6FRVWcgSQd/AxuGLTj
   V9WW8gvAL2nMPKM1u16kTV89xezBJW+Ve6RZFFVNjAugIB+dAuNjndvEP
   n2jxVj7Zmwg/QjbmV/nX5eT5SIyuX6Ilc4UBKhfvjslPi+1X4LQ5qs7dx
   rlwsleBfuJKF8EcyEaUi92DfAsC/Kuy2cQjas/cuA5LNxGEDVY0FN6IYg
   EGswKS9oUaYgUDnUsmyKGT+KPBeEykc2UfKIkJcCmoW3DT8CgHrE9U716
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="310608976"
X-IronPort-AV: E=Sophos;i="5.88,363,1635231600"; 
   d="scan'208";a="310608976"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2022 02:39:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,363,1635231600"; 
   d="scan'208";a="702385197"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Feb 2022 02:39:41 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIpob-00061e-5H; Sat, 12 Feb 2022 10:39:41 +0000
Date: Sat, 12 Feb 2022 18:39:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ojeda-linux:rust-next 18/20] ld.lld: error:
 drivers/built-in.a(gpio/gpio_pl061_rust.o) is incompatible with aarch64elfb
Message-ID: <202202121743.YbGELjcY-lkp@intel.com>
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
TO: Wedson Almeida Filho <wedsonaf@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>

Hi Wedson,

First bad commit (maybe != root cause):

tree:   https://github.com/ojeda/linux.git rust-next
head:   ced9f62ec4355bbb92226ac3f019da468a5c996b
commit: 5c1fec092f967b9b4722f6d91c9bcbe8222098fd [18/20] [RFC] drivers: gpio: PrimeCell PL061 in Rust
config: arm64-randconfig-r033-20220212 (https://download.01.org/0day-ci/archive/20220212/202202121743.YbGELjcY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ojeda/linux/commit/5c1fec092f967b9b4722f6d91c9bcbe8222098fd
        git remote add ojeda-linux https://github.com/ojeda/linux.git
        git fetch --no-tags ojeda-linux rust-next
        git checkout 5c1fec092f967b9b4722f6d91c9bcbe8222098fd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: error: rust/built-in.a(core.o) is incompatible with aarch64elfb
   ld.lld: error: rust/built-in.a(compiler_builtins.o) is incompatible with aarch64elfb
   ld.lld: error: rust/built-in.a(alloc.o) is incompatible with aarch64elfb
   ld.lld: error: rust/built-in.a(kernel.o) is incompatible with aarch64elfb
>> ld.lld: error: drivers/built-in.a(gpio/gpio_pl061_rust.o) is incompatible with aarch64elfb

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
