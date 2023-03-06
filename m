Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8566F7E;
	Mon,  6 Mar 2023 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678092837; x=1709628837;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Tn18FpwIlPFLrG8E4tkHsPjQDXkBXPmbKP6H0/t/XRQ=;
  b=b6gPI3YanLj+OH+5268O0Rp9WjXO6AIvyY0GoG1LUAXRSfnLDhA7MeUf
   sPjU3+jKKC0gh+UNCDYGTk8026HhjZYwAAD4fDYHeJD2OMMONFn9vsuoS
   76YXRAzbWlUKdYSMWBHsgyxxL/0CjGqJ5yCUjsh8OXLNlW2be36Rq126l
   nasNc598z3L94nwypUw/cyv5KDL3KuJvlJnN1hkRR1ZhluCnTDnQqYNuA
   8e/W7OZETv0U0MZmu76KWCw5vevncr65uOv8HdFiWcwnNA1nDUN3a3Tcl
   DMuoJKQw+HdggKtSbwasvFeWvWgyIUspm1GJCERWx3ti144oXyD9JzydA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="421779126"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="421779126"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 00:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="706366473"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="706366473"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Mar 2023 00:53:55 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ6bT-0000Al-0I;
	Mon, 06 Mar 2023 08:53:55 +0000
Date: Mon, 6 Mar 2023 16:53:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_lookup_name: .text+0x80): relocation R_RISCV_PCREL_HI20 out of
 range: -524399 is not in [-524288, 524287]; references
 kallsyms_seqs_of_names
Message-ID: <202303061657.oPTl4tiz-lkp@intel.com>
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
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: 60443c88f3a89fd303a9e8c0e84895910675c316 kallsyms: Improve the performance of kallsyms_lookup_name()
date:   4 months ago
config: riscv-buildonly-randconfig-r006-20230306 (https://download.01.org/0day-ci/archive/20230306/202303061657.oPTl4tiz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303061657.oPTl4tiz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_name: .text+0x80): relocation R_RISCV_PCREL_HI20 out of range: -524399 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
