Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1D520E1;
	Sun, 23 Apr 2023 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682257272; x=1713793272;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TJTRWfjlKNLzpWY7sYXbXCdO0WDSdYDGo+GHdB4RMqY=;
  b=kcM6Rzr2CA3uYR217+NeOBEfYH2pe/fz+TTChalpozK+NDQFs6KiHFD6
   E53PQrUJ88yC+vsdTc5T/3NOjkdnQx2NHHWUoWevcEtZyomf1hynzLasT
   2D8UeSNFJaz23xSj95zosDdFvMl7ASqQ/oZuGPavS8W5bRrQuzqvz+U3U
   aYp2UCCtNw/RWqB1sentQGpV4t8AhmTJjg8sgZUUsC/VS9j2XBKo8s+X4
   9aMWhEe+H/aovXgM5K+VnB2J3AbdW9wGt0I+U6+aokH8tFrVpOzPBlvEW
   AI0voGJcUtf8+ZVZQw0+E5dufP4s/vYDkQiUD5dxDpCEMYVS1E1gLmgnG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="335167756"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="335167756"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 06:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="686435599"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="686435599"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Apr 2023 06:41:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqZxl-000hul-26;
	Sun, 23 Apr 2023 13:41:09 +0000
Date: Sun, 23 Apr 2023 21:41:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_on_each_match_symbol: .text+0x6a8): relocation R_RISCV_PCREL_HI20
 out of range: -524415 is not in [-524288, 524287]; references
 'kallsyms_relative_base'
Message-ID: <202304232126.5daENNtR-lkp@intel.com>
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
commit: 4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998 kallsyms: Add helper kallsyms_on_each_match_symbol()
date:   5 months ago
config: riscv-randconfig-r025-20230423 (https://download.01.org/0day-ci/archive/20230423/202304232126.5daENNtR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304232126.5daENNtR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x6a8): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_relative_base'
   >>> referenced by kallsyms.c:221 (kernel/kallsyms.c:221)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x6ba): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_seqs_of_names'
   >>> referenced by kallsyms.c:221 (kernel/kallsyms.c:221)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x6c2): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_offsets'
   >>> referenced by kallsyms.c:221 (kernel/kallsyms.c:221)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0xca): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_num_syms'
   >>> referenced by kallsyms.c:209 (kernel/kallsyms.c:209)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0xe8): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_seqs_of_names'
   >>> referenced by kallsyms.c:209 (kernel/kallsyms.c:209)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0xf0): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_markers'
   >>> referenced by kallsyms.c:209 (kernel/kallsyms.c:209)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0xf8): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_names'
   >>> referenced by kallsyms.c:209 (kernel/kallsyms.c:209)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x100): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_token_index'
   >>> referenced by kallsyms.c:209 (kernel/kallsyms.c:209)
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x1ba): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_token_table'
   >>> referenced by kallsyms.c:209 (kernel/kallsyms.c:209)
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
