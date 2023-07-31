Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2517744;
	Mon, 31 Jul 2023 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690798356; x=1722334356;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dT5IIav0dUcp0rDI+sTuQmKVo0RmKVULnvbHffqxu4w=;
  b=YybVhVnOMHPYLgx9wxBJXq6hlSlIewPZFe9KlVzOJZXhPK9J5bYhhYQU
   IUawXsf8UVHwjBHfaUVI32VsO1Lxkan2eEQTLcmTl5Q1FS0FzP19Fby8p
   aZ57DGi30W1HXvg3Epnvl8gQ8ycvzv0ptw6PyYOY1c3w908S+c1uCsJZh
   A6gE4ULtLSMJ60k+wE/96p2d89CbOEpZuKn3fh58Q8BIkKF1cb0KHXpI6
   f/gIB3sw6sowNGYdGVjgbf0Ft3ayrQqOn4oyBL/aUcfhrX0y8ONgMBBtT
   QDcZWgecjlWJ6kG5PQTU05qpOgmy2GkYOl5yGOViVjjhtK31UExpludb6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="359015565"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="359015565"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 03:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="728250334"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="728250334"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 31 Jul 2023 03:12:35 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQPt9-00053f-2o;
	Mon, 31 Jul 2023 10:12:32 +0000
Date: Mon, 31 Jul 2023 18:11:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(init/main.o):(function
 __traceiter_initcall_level: .text+0x10): relocation R_RISCV_HI20 out of
 range: 531482 is not in [-524288, 524287]; references
 '__tracepoint_initcall_level'
Message-ID: <202307311845.TZgGkg4U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Jesse Taube <mr.bossman075@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Hi Jesse,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
commit: 49f965b6fbca63904d7397ce96066fa992f401a3 soc: canaan: Make K210_SYSCTL depend on CLK_K210
date:   5 months ago
config: riscv-randconfig-r025-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311845.TZgGkg4U-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311845.TZgGkg4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311845.TZgGkg4U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_level: .text+0x10): relocation R_RISCV_HI20 out of range: 531482 is not in [-524288, 524287]; references '__tracepoint_initcall_level'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_start: .text+0x64): relocation R_RISCV_HI20 out of range: 531482 is not in [-524288, 524287]; references '__tracepoint_initcall_start'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function get_cpu_mask: .text+0x3d4): relocation R_RISCV_HI20 out of range: 528113 is not in [-524288, 524287]; references 'cpu_bit_bitmap'
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/cpu.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(.text+0x40c): relocation R_RISCV_HI20 out of range: 527434 is not in [-524288, 524287]; references '__init_begin'
   >>> referenced by main.c
   >>> defined in ./arch/riscv/kernel/vmlinux.lds:26
--
>> ld.lld: error: vmlinux.a(init/main.o):(.text+0x414): relocation R_RISCV_HI20 out of range: 528111 is not in [-524288, 524287]; references '__init_end'
   >>> referenced by main.c
   >>> defined in ./arch/riscv/kernel/vmlinux.lds:69
--
>> ld.lld: error: vmlinux.a(init/main.o):(.text+0x41c): relocation R_RISCV_HI20 out of range: 530403 is not in [-524288, 524287]; references '.L.str.80'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_raw_output_initcall_level: .text+0x480): relocation R_RISCV_HI20 out of range: 530334 is not in [-524288, 524287]; references '.L.str.23'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_raw_output_initcall_start: .text+0x514): relocation R_RISCV_HI20 out of range: 530369 is not in [-524288, 524287]; references '.L.str.26'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_raw_output_initcall_finish: .text+0x5a4): relocation R_RISCV_HI20 out of range: 530239 is not in [-524288, 524287]; references '.L.str.29'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function rcu_lock_acquire: .text+0x5e8): relocation R_RISCV_HI20 out of range: 530495 is not in [-524288, 524287]; references 'rcu_lock_map'
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/rcu/update.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function rcu_lock_release: .text+0x610): relocation R_RISCV_HI20 out of range: 530495 is not in [-524288, 524287]; references 'rcu_lock_map'
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/rcu/update.o)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
