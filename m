Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9476814A8F;
	Tue,  9 May 2023 19:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683660453; x=1715196453;
  h=date:from:cc:subject:message-id:mime-version;
  bh=f4VZrRR1GJpn7geIXgXdxlJDI0G6QLkEByAco+z3UUg=;
  b=ibG3Z2aTpr6I569TCaXBNZ8JoIqNuJASVTEHyGHGyfJKSW01jbEl77Tu
   A5rkCbhQUQV1mAwgCiDoYuMgHOQBuIpuKCRfuPlAJd4NMI+1IvmKeKV6Z
   10SWQ4XwNs0gc7iCZC2djw1RX97Pl0fKxmMhQeqfqcCkm94V1kZFpf1NG
   8vHhHOjUBWeSloBSyKgdDu4GocI8vR0DHeze/JcFwLiwH2nKYcAc/vY3v
   jpNvgILwDfz5qkN5HEHZiBHrTj6ABHZ5Apg5toxrSm4Xq3Gzcm0bi1JLt
   2BOKk8o7sQl4B/ooEh052N161tWSz6qq0orZKVUG2ngn/nhGrdQPp0GO1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="415603045"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="415603045"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 12:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="693105300"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="693105300"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 May 2023 12:27:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwSzj-0002Qq-1e;
	Tue, 09 May 2023 19:27:31 +0000
Date: Wed, 10 May 2023 03:27:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpirko-mlxsw:combined_queue 36/65] ld.lld: error:
 vmlinux.a(init/main.o):(function __traceiter_initcall_finish: .text+0x1c4):
 relocation R_RISCV_HI20 out of range: 534529 is not in [-524288, 524287];
 references '__traceiter_initcall_finish.__if_trace.0'
Message-ID: <202305100317.c37V2gyf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Petr Machata <petrm@nvidia.com>
CC: Amit Cohen <amcohen@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   2b7757d2270e0accf3e809fcff68aae5af73a124
commit: 6a751113b03684272f52e979ead46d6dcf1db3b5 [36/65] mlxsw: spectrum_router: Move IPIP init up
config: riscv-buildonly-randconfig-r006-20230509 (https://download.01.org/0day-ci/archive/20230510/202305100317.c37V2gyf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/jpirko/linux_mlxsw/commit/6a751113b03684272f52e979ead46d6dcf1db3b5
        git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
        git fetch --no-tags jpirko-mlxsw combined_queue
        git checkout 6a751113b03684272f52e979ead46d6dcf1db3b5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100317.c37V2gyf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_finish: .text+0x1c4): relocation R_RISCV_HI20 out of range: 534529 is not in [-524288, 524287]; references '__traceiter_initcall_finish.__if_trace.0'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x220): relocation R_RISCV_HI20 out of range: 535166 is not in [-524288, 524287]; references '__stack_chk_guard'
   >>> referenced by main.c
   >>> defined in vmlinux.a(arch/riscv/kernel/process.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x240): relocation R_RISCV_HI20 out of range: 534226 is not in [-524288, 524287]; references 'trace_trigger_soft_disabled.______f.55'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x25c): relocation R_RISCV_HI20 out of range: 534529 is not in [-524288, 524287]; references 'trace_trigger_soft_disabled.__if_trace.0'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x2a8): relocation R_RISCV_HI20 out of range: 534529 is not in [-524288, 524287]; references 'trace_trigger_soft_disabled.__if_trace.57.0'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function trace_event_raw_event_initcall_level: .text+0x2e0): relocation R_RISCV_HI20 out of range: 534529 is not in [-524288, 524287]; references 'trace_event_raw_event_initcall_level.__if_trace.1'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function __traceiter_initcall_finish: .text+0x164): relocation R_RISCV_HI20 out of range: 534214 is not in [-524288, 524287]; references '__tracepoint_initcall_finish'
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
