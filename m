Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCF123DC;
	Sat,  4 Feb 2023 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675545298; x=1707081298;
  h=date:from:cc:subject:message-id:mime-version;
  bh=KF56eQlfhWb/TEBS8QZao481qBRijNqud6XR3uxhIMI=;
  b=GVCiYlalcrSy/RbJP7DRj0SPuk3/L3Uot6/X3MOFkAlKZac/sFKkKmZB
   Ql9+C7fKSaM9Cbsl00casMR8IFgk29BQelx1dQEBjR8OFu8vIAWK1cO/o
   9eHuT5fCpdicYgqAcSaej/9b63KhoHTKmNWq6nsBEzMpsv1JB409JMmWN
   TXeEZfg7kVXoe+3G7JpX3QXXqaPcE+DksQ6KGZgvchS/njcsjzqN7qfn5
   /QrCeqRiqqyEVxlrKBXVr/ra1xZ9Si8BGcjW0uzbi5K/nk/m4juAnLicr
   UgLb8K1LE+6gMfXDMyTsoybQKm5WR1kCCqwp/P9vgNaZLYvTJDSwDNZMa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="391386831"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="391386831"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 13:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="994871481"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="994871481"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Feb 2023 13:14:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOPs8-0001X6-1H;
	Sat, 04 Feb 2023 21:14:56 +0000
Date: Sun, 5 Feb 2023 05:14:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_lookup_name: .text+0x7c): relocation R_RISCV_PCREL_HI20 out of
 range: -524541 is not in [-524288, 524287]; references
 kallsyms_seqs_of_names
Message-ID: <202302050507.AGNCqIom-lkp@intel.com>
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
head:   db27c22251e7c8f3a9d5bfb55c9c8c701a70bbb3
commit: 60443c88f3a89fd303a9e8c0e84895910675c316 kallsyms: Improve the performance of kallsyms_lookup_name()
date:   3 months ago
config: riscv-randconfig-r004-20230204 (https://download.01.org/0day-ci/archive/20230205/202302050507.AGNCqIom-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
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

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_name: .text+0x7c): relocation R_RISCV_PCREL_HI20 out of range: -524541 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
