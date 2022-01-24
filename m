Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A93168
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643025701; x=1674561701;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/p6lsUN6mhby+eV4L6k9mmNpMlz3ieypl4nmyvRG1VU=;
  b=Ixls4nva5dHJnR+YGNoXkODH0OC/nyHwtzpQ9KLJOcRR2PlVv8+gx+js
   b++r21sCKismiVhXbrHDDbfrepZvPjDqryGEcwGGHJ7Tc/1p/jH5ZiT9H
   Ar+VPTEOukyRqqVlda2C0AeSranb2ydU/b2s/DNyFYKD7/Vb0nVZio7kG
   yoJXJ/X8aNtL2bVp3H1BxMXIoDFt6K4jBYTTfLtUcrIXwYdK3+UtojVlQ
   6VVTRKJRRlVlTJT5TUoW94DIwAd87A0vcIlFG6ckDLWx2xOaHEaUlj5C4
   mv1pmd4LSPQT0dq5kSPrFJmXiBErEGbaaptqs5JWGLw/cPmishS6TKycM
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="309348871"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="309348871"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 04:01:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="479050192"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2022 04:01:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBy2U-000IHG-S3; Mon, 24 Jan 2022 12:01:38 +0000
Date: Mon, 24 Jan 2022 20:01:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:x86/wip.vmx 2/2] ld.lld: error:
 arch/riscv/built-in.a(kernel/reset.o):(function machine_halt: .text+0x28):
 relocation R_RISCV_HI20 out of range: 530843 is not in [-524288, 524287];
 references pm_power_off
Message-ID: <202201242016.t0cBi9d6-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: Josh Poimboeuf <jpoimboe@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.vmx
head:   d443f8b92af9d11702dc42f6064875fae56ff302
commit: d443f8b92af9d11702dc42f6064875fae56ff302 [2/2] x86/vmx: Provide asm-goto-output vmread
config: riscv-randconfig-r035-20220117 (https://download.01.org/0day-ci/archive/20220124/202201242016.t0cBi9d6-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=d443f8b92af9d11702dc42f6064875fae56ff302
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/wip.vmx
        git checkout d443f8b92af9d11702dc42f6064875fae56ff302
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/reset.o):(function machine_halt: .text+0x28): relocation R_RISCV_HI20 out of range: 530843 is not in [-524288, 524287]; references pm_power_off
   >>> referenced by reset.c
   >>> defined in arch/riscv/built-in.a(kernel/reset.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/cpufeature.o):(function riscv_isa_extension_base: .text+0x1c): relocation R_RISCV_HI20 out of range: 530460 is not in [-524288, 524287]; references riscv_isa_extension_base.__if_trace.1
   >>> referenced by cpufeature.c
   >>> defined in arch/riscv/built-in.a(kernel/cpufeature.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/sys_riscv.o):(function __se_sys_mmap: .text+0x40): relocation R_RISCV_HI20 out of range: 530305 is not in [-524288, 524287]; references riscv_sys_mmap.______f.16
   >>> referenced by sys_riscv.c
   >>> defined in arch/riscv/built-in.a(kernel/sys_riscv.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
