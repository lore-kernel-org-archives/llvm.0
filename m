Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874362C82
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 19:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642187136; x=1673723136;
  h=date:from:cc:subject:message-id:mime-version;
  bh=TfHqgBMZjW73T/UPqVvQOrJOoCJjetXNE/tgPxYqn34=;
  b=B9pfHnG+S/2o/CHQ41xc52p7xMWu0K4ynXtsmO17SpEgmaz/vHKzgovT
   kh74RnVnlFWD79u/MHpyseApLk0jbWsaNeH1YJRyVyEzgL+0Mv5h9cxRi
   WvLVz1zEzXsLzItkZWNXpMqYVsMqJdV7vg8ihG/7sZpHdywbl55Uld4RR
   /34Aj2hhsID2qSmjCHPtD/Hun3dYgLhPn+Q/aV01IqdTwnplCuyEO2U4X
   HTbbK+1ISnrFBy79eESQhc+SYw12ZuafrW9hY107SH1oxCn89NnmHMsmv
   yR9MwNZc83YsttLpU5QPPqZg7I95hfJ+mA9FBpXmONdyxxmqtDXEC4VOb
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="241872314"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="241872314"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2022 11:05:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; 
   d="scan'208";a="692314346"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Jan 2022 11:05:21 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8Rt3-0008ue-Ar; Fri, 14 Jan 2022 19:05:21 +0000
Date: Sat, 15 Jan 2022 03:04:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter:
 .text+0xa10): relocation R_RISCV_PCREL_HI20 out of range: -524433 is not in
 [-524288, 524287]; references kallsyms_num_syms
Message-ID: <202201150206.PzD5J1a9-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   871bfa02d08d9c0ed981c50082b7afd367d3700b
commit: 7fb593cbd88cf4df01c096d4dc320f027dfa2560 Merge remote-tracking branch 'regulator/for-5.14' into regulator-next
date:   7 months ago
config: riscv-randconfig-r023-20220114 (https://download.01.org/0day-ci/archive/20220115/202201150206.PzD5J1a9-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7fb593cbd88cf4df01c096d4dc320f027dfa2560
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7fb593cbd88cf4df01c096d4dc320f027dfa2560
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xa10): relocation R_RISCV_PCREL_HI20 out of range: -524433 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xa48): relocation R_RISCV_PCREL_HI20 out of range: -524433 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_expand_symbol: .text+0xfc): relocation R_RISCV_PCREL_HI20 out of range: -524432 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_expand_symbol: .text+0x118): relocation R_RISCV_PCREL_HI20 out of range: -524432 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_expand_symbol: .text+0x120): relocation R_RISCV_PCREL_HI20 out of range: -524432 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - LOCK_STAT && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
