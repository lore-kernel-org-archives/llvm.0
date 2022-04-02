Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C721FA2
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 22:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648937349; x=1680473349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GR69wVybUrA6BpZhcqORZcBO2/sOkwsgCc2qxcc+y+k=;
  b=V8ZLuzw2Ro7d61qbjLlRqEWMhk7sXCuxsvcauL82l/Kwb8bGeYAzqos6
   jRF6b+D1qwFkV67X1fpRNkqX728FjaVBKBe4MetxtMZpkD0S0JhKnJTHQ
   YceO9BTxO3aX4q1SdnfM1nocwrrB0ViEZ3ZCWyljsUAAsOZxONf6Wyke/
   927OlwcA7wfCXa4quoRieAymGPINZYWw6zqbwDQQbZyimROoo2lB+lUVa
   qFsLXM1XRF2L3se5xAS5nNsIqtAGgM2w/XhLBUCN7qzPyL9ad4t5x4xFX
   YnXuiAtW0iiJ9eDxfYgccv+VLBPcYFuLQyDbUBq3+YAhQKwYtXYTYSEgF
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10305"; a="323514843"
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="323514843"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2022 15:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,231,1643702400"; 
   d="scan'208";a="504527877"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Apr 2022 15:09:06 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nalvd-0000Sl-QN;
	Sat, 02 Apr 2022 22:09:05 +0000
Date: Sun, 3 Apr 2022 06:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-next:master 14270/15002] ld.lld: error:
 init/built-in.a(initramfs.o):(function wait_for_initramfs: .text+0x24):
 relocation R_RISCV_HI20 out of range: 530109 is not in [-524288, 524287];
 references initramfs_cookie
Message-ID: <202204030606.gML0qvDb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
commit: af41d2866f7d75bbb38d487f6ec7770425d70e45 [14270/15002] powerpc/64: Fix build failure with allyesconfig in book3s_64_entry.S
config: riscv-randconfig-r022-20220403 (https://download.01.org/0day-ci/archive/20220403/202204030606.gML0qvDb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=af41d2866f7d75bbb38d487f6ec7770425d70e45
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout af41d2866f7d75bbb38d487f6ec7770425d70e45
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(initramfs.o):(function wait_for_initramfs: .text+0x24): relocation R_RISCV_HI20 out of range: 530109 is not in [-524288, 524287]; references initramfs_cookie
   >>> referenced by initramfs.c
   >>> defined in init/built-in.a(initramfs.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_processor_hartid: .text+0x2c): relocation R_RISCV_HI20 out of range: 530099 is not in [-524288, 524287]; references .LCPI0_0
   >>> referenced by cpu.c
   >>> defined in arch/riscv/built-in.a(kernel/cpu.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_parent_hartid: .text+0x160): relocation R_RISCV_HI20 out of range: 529283 is not in [-524288, 524287]; references .L.str
   >>> referenced by cpu.c
   >>> defined in arch/riscv/built-in.a(kernel/cpu.o)
--
>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_parent_hartid: .text+0x19c): relocation R_RISCV_HI20 out of range: 530099 is not in [-524288, 524287]; references .LCPI1_0
   >>> referenced by cpu.c
   >>> defined in arch/riscv/built-in.a(kernel/cpu.o)
--
>> ld.lld: error: init/built-in.a(initramfs.o):(function wait_for_initramfs: .text+0x3c): relocation R_RISCV_HI20 out of range: 529437 is not in [-524288, 524287]; references initramfs_domain
   >>> referenced by initramfs.c
   >>> defined in init/built-in.a(initramfs.o)
--
>> ld.lld: error: init/built-in.a(initramfs.o):(function panic_show_mem: .text+0xa8): relocation R_RISCV_HI20 out of range: 530099 is not in [-524288, 524287]; references .LCPI8_0
   >>> referenced by initramfs.c
   >>> defined in init/built-in.a(initramfs.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
