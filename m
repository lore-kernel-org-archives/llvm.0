Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF401FA6
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523433; x=1682059433;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xApRxELnYuo8iQK2p9nNURZ//WTIcMRJot26uzKbzKQ=;
  b=PPVqmGUCP+YGgjaZzdIcjQuJUpVP9j/GOWC/lWc3AvGhmSIXCyoWxiry
   RPKspAbuwYtMr322BBvTeNgsLO0jhr0liIcWhH93AoYkd7LKeSPTmvvCr
   CaS++VvNYWVeU5UiqToDWSzy/QkRTAbTZlXnOEyZb+DK9Vj3mlxV32wAy
   LBzyS2aOCxl7RfzHMug++0PRIc+eBcEXOBHSgouGvcLuOkkaWOkloWs6m
   hmKxD7MFTlE8563y5BYQaknPcWE7upz3DhrUmrBJfnWoUMHwK6j+CPFxZ
   FEFHuURT8I8JvSbNnQZJLqhh8CmLOOOpVBNINVgaQGCDqg6bIRMPVTECC
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261857563"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="261857563"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="555609060"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Apr 2022 23:43:51 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQXf-000814-6U;
	Thu, 21 Apr 2022 06:43:51 +0000
Date: Thu, 21 Apr 2022 14:43:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 2926/4957] ld.lld: error:
 init/built-in.a(main.o):(function __traceiter_initcall_level: .text+0x12):
 relocation R_RISCV_HI20 out of range: 535591 is not in [-524288, 524287];
 references __tracepoint_initcall_level
Message-ID: <202204210555.DNvfHvIb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lv Ruyi <lv.ruyi@zte.com.cn>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f1244c81da13009dbf61cb807f45881501c44789
commit: ac6bef064f716ba67ab81054d53856f285bec307 [2926/4957] sfc: Fix spelling mistake "writting" -> "writing"
config: riscv-randconfig-r026-20220420 (https://download.01.org/0day-ci/archive/20220421/202204210555.DNvfHvIb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ac6bef064f716ba67ab81054d53856f285bec307
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ac6bef064f716ba67ab81054d53856f285bec307
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function __traceiter_initcall_level: .text+0x12): relocation R_RISCV_HI20 out of range: 535591 is not in [-524288, 524287]; references __tracepoint_initcall_level
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function __traceiter_initcall_level: .text+0x1c): relocation R_RISCV_HI20 out of range: 536064 is not in [-524288, 524287]; references __traceiter_initcall_level.__if_trace.1
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x1e0): relocation R_RISCV_HI20 out of range: 536806 is not in [-524288, 524287]; references .LCPI3_0
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x20c): relocation R_RISCV_HI20 out of range: 535663 is not in [-524288, 524287]; references trace_trigger_soft_disabled.______f.56
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x222): relocation R_RISCV_HI20 out of range: 536064 is not in [-524288, 524287]; references trace_trigger_soft_disabled.__if_trace.0
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x26c): relocation R_RISCV_HI20 out of range: 536064 is not in [-524288, 524287]; references trace_trigger_soft_disabled.__if_trace.59.0
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x2a2): relocation R_RISCV_HI20 out of range: 536064 is not in [-524288, 524287]; references trace_event_raw_event_initcall_level.__if_trace.1
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function __traceiter_initcall_start: .text+0xae): relocation R_RISCV_HI20 out of range: 536064 is not in [-524288, 524287]; references __traceiter_initcall_start.__if_trace.1
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function __traceiter_initcall_finish: .text+0x144): relocation R_RISCV_HI20 out of range: 536064 is not in [-524288, 524287]; references __traceiter_initcall_finish.__if_trace.1
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x1ca): relocation R_RISCV_HI20 out of range: 536823 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by main.c
   >>> defined in arch/riscv/built-in.a(kernel/process.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
