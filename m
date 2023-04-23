Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01697F8;
	Sun, 23 Apr 2023 07:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682233865; x=1713769865;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GwP4mLTrhDK/hcw3yHwUp8ae1dK4eaFyls7mMGDOIsU=;
  b=VpfSia7+bgL4uhWCksvsxbGob+ULLuADskQgtj4u5bTyA2RNAdFdqBRk
   PFddbsnkm7RCLh1XdQsUryH8zJ0+Jy9AjVzOHkzg5Ys7Cv+jRLyky4JKG
   GvMbVqCaehg0iTiMwrtZ8blnlMMskkDodVZFSCAtZIaEn+vdCzJaznrWe
   DzyArgMLqPhcAXnnVNuOve56MgDDWuCZk9+xljtwizFOJVnGUsUerTrfh
   4+3E9xHGSXi+Fqgv4VCJmRNAoN0vahPEzeIh5vtjye0Hvim/mO6ePcouC
   n20e+BF+ynKN81Lp23aGWquIlbpsnQrT3NrkozKg2xAIGlvWLizazeGNd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="343740605"
X-IronPort-AV: E=Sophos;i="5.99,219,1677571200"; 
   d="scan'208";a="343740605"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 00:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="762029999"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="762029999"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Apr 2023 00:11:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqTsF-000hlg-1f;
	Sun, 23 Apr 2023 07:11:03 +0000
Date: Sun, 23 Apr 2023 15:11:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_lookup_name: .text+0x68): relocation R_RISCV_PCREL_HI20 out of
 range: -524415 is not in [-524288, 524287]; references
 'kallsyms_seqs_of_names'
Message-ID: <202304231541.eR66dhqG-lkp@intel.com>
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
commit: 60443c88f3a89fd303a9e8c0e84895910675c316 kallsyms: Improve the performance of kallsyms_lookup_name()
date:   5 months ago
config: riscv-randconfig-r025-20230423 (https://download.01.org/0day-ci/archive/20230423/202304231541.eR66dhqG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60443c88f3a89fd303a9e8c0e84895910675c316
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 60443c88f3a89fd303a9e8c0e84895910675c316
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304231541.eR66dhqG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_name: .text+0x68): relocation R_RISCV_PCREL_HI20 out of range: -524415 is not in [-524288, 524287]; references 'kallsyms_seqs_of_names'
   >>> referenced by kallsyms.c:267 (kernel/kallsyms.c:267)
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
