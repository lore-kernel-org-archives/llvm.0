Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BDFD505;
	Tue, 21 Mar 2023 18:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679424291; x=1710960291;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IeKCwpYdTHeues9Nu1bL1vGYR4sMAo1AHIYouEIqXvM=;
  b=NGLhByruNF9tF1Jp7bRBcRZ/RwGVQ9r14WJMqBWMwnq+TKME4zgyGdX9
   sB1PH6XgYDiGeTfqYqErhfI1t98bFQ3qY+7Dq7EZELKC0sN5un82P5Y7y
   3oAaBv+LoIbaIJBknI/DhZDnXkjWl9oP0yrhtikt3UCP/R9K4gFzjWrx9
   gO69gCdS7r/3rzJRAIgVT1HcMn7GzDFYHAmCJRbTrFmCJy4b4ExGZeTbn
   twoLAABMAk3pAKz6NcvfnMEwNq4MGJc746NvBxxbzVNA9DEdW3O8PX9UL
   4uNglh8Tu9GboflqnOFY76Lz7Z7G4OJfhkrYD+qUPNg6XozM/k35G6Z5y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339068995"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="339068995"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 11:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750716887"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="750716887"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2023 11:44:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pegyW-000CIG-2r;
	Tue, 21 Mar 2023 18:44:48 +0000
Date: Wed, 22 Mar 2023 02:44:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_on_each_match_symbol: .text+0xd24): relocation R_RISCV_PCREL_HI20
 out of range: -524490 is not in [-524288, 524287]; references
 kallsyms_relative_base
Message-ID: <202303220209.TfJHhu63-lkp@intel.com>
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
head:   17214b70a159c6547df9ae204a6275d983146f6b
commit: 4dc533e0f2c04174e1ae4aa98e7cffc1c04b9998 kallsyms: Add helper kallsyms_on_each_match_symbol()
date:   4 months ago
config: riscv-randconfig-r025-20230321 (https://download.01.org/0day-ci/archive/20230322/202303220209.TfJHhu63-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303220209.TfJHhu63-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0xd24): relocation R_RISCV_PCREL_HI20 out of range: -524490 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0xd38): relocation R_RISCV_PCREL_HI20 out of range: -524490 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0xd40): relocation R_RISCV_PCREL_HI20 out of range: -524490 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x180): relocation R_RISCV_PCREL_HI20 out of range: -524489 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x1ac): relocation R_RISCV_PCREL_HI20 out of range: -524489 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
