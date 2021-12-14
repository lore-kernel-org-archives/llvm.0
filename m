Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326568
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639474741; x=1671010741;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OXazqmQ+34Eq6VDHmQYLhTMJSZWQUBSEMlkGV4KSjkE=;
  b=lLnKvGo5kVbcK1lgp9tKrAqteQpLnTnhRqNR632rwKO9i7XFZmWSy9Ar
   7tEmDTGXQuJIWSyBp78WZB6Xl2dXFHZ5vk7uU7lHbe1AFfRhLJjq9n8cX
   5+In0+7izyAoogmiHCXyGzJn3CLAXTRUEWjJrlZDnkwMwzYM9Xq97LI/0
   V+Eye6Focd6p6+/PHYGuKq6wvF/+AzxfhdLBtG0uk6Spntw3ODlnSV4N/
   kEjxHiVf0pt1iJz/DZCmfcZm7zT9F71AsIFpw9xYszgAx2hWESNbI7LbR
   wVZEIwchYAeNwRdrwl8pg9/Od3Oib6Qo4LIRlYvOxshHeRzq6nRjvU17a
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239164577"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="239164577"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 01:39:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="505295802"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2021 01:39:00 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mx4Gx-000094-CX; Tue, 14 Dec 2021 09:38:59 +0000
Date: Tue, 14 Dec 2021 17:38:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [arm64:for-next/xor-neon 1/1] ld.lld: error: relocation
 R_AARCH64_ABS32 cannot be used against symbol '__crc_xor_block_inner_neon';
 recompile with -fPIC
Message-ID: <202112141724.gP6kgkDl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-arm-kernel@lists.infradead.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/xor-neon
head:   ce9ba49a246012f4ed7413c6246b6213c3c00a85
commit: ce9ba49a246012f4ed7413c6246b6213c3c00a85 [1/1] arm64/xor: use EOR3 instructions when available
config: arm64-randconfig-r033-20211213 (https://download.01.org/0day-ci/archive/20211214/202112141724.gP6kgkDl-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=ce9ba49a246012f4ed7413c6246b6213c3c00a85
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 for-next/xor-neon
        git checkout ce9ba49a246012f4ed7413c6246b6213c3c00a85
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_AARCH64_ABS32 cannot be used against symbol '__crc_xor_block_inner_neon'; recompile with -fPIC
   >>> defined in arch/arm64/lib/built-in.a(xor-neon.o)
   >>> referenced by xor-neon.c
   >>>               xor-neon.o:(___kcrctab+xor_block_inner_neon+0x0) in archive arch/arm64/lib/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
