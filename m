Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE45B15B8;
	Wed, 22 Mar 2023 02:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679451326; x=1710987326;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+KEfIZQmwAtM4JqJE6u1DeqRB2AKRliqMCSc+y/7Gbw=;
  b=DZCgSDDIX4CNctrPtJheXZNhg79sHmS0mOurimDJZgLi8Z5i437dtxRX
   tiCDFvZanr0hg7L32bDvRVIywGjxzTv3Q819lBOdECm11GkyLFL7P4Qb0
   N8cJvUmMURxjd+Dt61bdu2ceKvmO5ZJ3xXlWs0UPjasWYFmP9xGvxlovA
   U5nkf8a1XzaojPBuuvjJnfeLXJeQ6RHOzS+aILJV7KqcqGVTi2+oc2RZM
   qZ+wpy1hLY5a0sbDXfWIhoz/PXSUirxStAaLPk6QvNBhC+eNpkCFPp3Ij
   ndEbCuBJOjxIQzD/SsQs0G1r2i3EWy1wUSbA8oM155gzr4j3uRHBsnaCe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327487469"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="327487469"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 19:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792354525"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="792354525"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 19:15:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peo0K-000ChA-0r;
	Wed, 22 Mar 2023 02:15:08 +0000
Date: Wed, 22 Mar 2023 10:14:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_sym_address: .text+0x1c): relocation R_RISCV_PCREL_HI20 out of
 range: -524489 is not in [-524288, 524287]; references
 kallsyms_relative_base
Message-ID: <202303221058.BzWdKI7F-lkp@intel.com>
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
head:   a1effab7a3a35a837dd9d2b974a1bc4939df1ad5
commit: 30f3bb09778de64ef9f23fb4bb5f868c4728a071 kallsyms: Add self-test facility
date:   4 months ago
config: riscv-randconfig-r025-20230321 (https://download.01.org/0day-ci/archive/20230322/202303221058.BzWdKI7F-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303221058.BzWdKI7F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0x1c): relocation R_RISCV_PCREL_HI20 out of range: -524489 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0x28): relocation R_RISCV_PCREL_HI20 out of range: -524489 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
