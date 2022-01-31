Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BE32CA2
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643617337; x=1675153337;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HvKL1ANkp3O/ofG2q+DcFLRBHxbbWj0sX9yMt6Mqt3Q=;
  b=IwQnB4z6upCCVxy5H8BNZaV4w+ctNa7nzg59TeA9mcnNxdRbDSNWtGXz
   tRjf1CRnS0b7IYnfRH7wQXFE6OO//+svvPgPbYyekfGXrWn+aiXykI2pm
   NLNqJsuq29ZUFCZH9A9LnNwRnMO1Iothuh+VCLkOKZrxpDozhjFFZuSad
   siOFqoeWXFDiEcuwpIPEnC8eXhaRWaJq9ehizYmmsbLAPH5CEB2qrRxD4
   J9N37BU0QpUebKAmR8QteZnJnzZhxbKr5qu1DhU5UNYc9kdgIoGKggSCA
   /zlzB0PGiYIakoRwxtqOfKBEihbHnH6phjFsuXxIahJyeaEj3X7BTgDZh
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247374233"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="247374233"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 00:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="522565661"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 Jan 2022 00:22:15 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nERx1-000Rgs-7q; Mon, 31 Jan 2022 08:22:15 +0000
Date: Mon, 31 Jan 2022 16:22:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [zen:5.16/zen-sauce 14/22] ld.lld: error:
 arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_processor_hartid:
 .text+0xe): relocation R_RISCV_HI20 out of range: 529300 is not in [-524288,
 524287]; references .L.str
Message-ID: <202201311600.S6xTWRLP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 5.16/zen-sauce
head:   157e1814f25ab399070c421a96cdbf657f66a097
commit: 5a57b88b7dd651b2e37febf06b868d60720e8a5f [14/22] ZEN: PCI: Add Intel remapped NVMe device support
config: riscv-buildonly-randconfig-r001-20220131 (https://download.01.org/0day-ci/archive/20220131/202201311600.S6xTWRLP-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/zen-kernel/zen-kernel/commit/5a57b88b7dd651b2e37febf06b868d60720e8a5f
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 5.16/zen-sauce
        git checkout 5a57b88b7dd651b2e37febf06b868d60720e8a5f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_processor_hartid: .text+0xe): relocation R_RISCV_HI20 out of range: 529300 is not in [-524288, 524287]; references .L.str
   >>> referenced by cpu.c
   >>> defined in arch/riscv/built-in.a(kernel/cpu.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
