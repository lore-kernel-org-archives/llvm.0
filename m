Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7986D1FA4;
	Sun, 30 Jul 2023 23:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690760508; x=1722296508;
  h=date:from:cc:subject:message-id:mime-version;
  bh=p1dj5wrow29+4VhGAOG/o4AS+VV44j5lXaB9k9psTzU=;
  b=Y+GfYLAApN7teFdrxbr0Td/VqOeyNoWydYbLMTQ1JoD2xlYkUMxG4gJf
   UbNMuV9WTlwK7SDX03vqunRaywfyW+SSNB7Po5f0WoFcoNl/NiNK7SMAP
   BsuwItTqvsYH2d9DZPmZGVukAI/kgkhFKDGjlhFJg7KfTkvqVyYpb4R+y
   RE70rPlT0tTCfoVDZUo+AKBQg+AwhdSf4ykqQ6c7TJMVYLDJxfGSeICUu
   7YzIvHy3oVID/cqnRDiSeMjJRMS3Kgw/NLgsW0XF2tEJd0kmRHV90YS6F
   747tj51UzS1SvJjLy3GcEEBlf/tHRc6/O0iGkKGsP64ULxr3A2PSUrhhG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="399834751"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="399834751"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 16:41:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871437085"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2023 16:41:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQG2k-0004pP-05;
	Sun, 30 Jul 2023 23:41:46 +0000
Date: Mon, 31 Jul 2023 07:41:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(init/main.o):(function
 __traceiter_initcall_level: .text+0x10): relocation R_RISCV_HI20 out of
 range: 531478 is not in [-524288, 524287]; references
 '__tracepoint_initcall_level'
Message-ID: <202307310758.eoc5edFT-lkp@intel.com>
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
config: riscv-randconfig-r025-20230731 (https://download.01.org/0day-ci/archive/20230731/202307310758.eoc5edFT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310758.eoc5edFT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310758.eoc5edFT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_level: .text+0x10): relocation R_RISCV_HI20 out of range: 531478 is not in [-524288, 524287]; references '__tracepoint_initcall_level'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_start: .text+0x64): relocation R_RISCV_HI20 out of range: 531478 is not in [-524288, 524287]; references '__tracepoint_initcall_start'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(.text+0x40c): relocation R_RISCV_HI20 out of range: 527433 is not in [-524288, 524287]; references '__init_begin'
   >>> referenced by main.c
   >>> defined in ./arch/riscv/kernel/vmlinux.lds:26
--
>> ld.lld: error: vmlinux.a(init/main.o):(.text+0x414): relocation R_RISCV_HI20 out of range: 528110 is not in [-524288, 524287]; references '__init_end'
   >>> referenced by main.c
   >>> defined in ./arch/riscv/kernel/vmlinux.lds:69
--
>> ld.lld: error: vmlinux.a(init/main.o):(.text+0x41c): relocation R_RISCV_HI20 out of range: 530402 is not in [-524288, 524287]; references '.L.str.80'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_raw_output_initcall_level: .text+0x480): relocation R_RISCV_HI20 out of range: 530333 is not in [-524288, 524287]; references '.L.str.23'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_raw_output_initcall_start: .text+0x514): relocation R_RISCV_HI20 out of range: 530368 is not in [-524288, 524287]; references '.L.str.26'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_finish: .text+0xbc): relocation R_RISCV_HI20 out of range: 531478 is not in [-524288, 524287]; references '__tracepoint_initcall_finish'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x1a0): relocation R_RISCV_HI20 out of range: 530238 is not in [-524288, 524287]; references '.L.str.17'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
