Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8A4645;
	Thu, 12 Oct 2023 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S65oR5y7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697072032; x=1728608032;
  h=date:from:cc:subject:message-id:mime-version;
  bh=noFNVDut9oocb+BtK+OIA+2NSz+ZfCW8EJsHc6BVtWo=;
  b=S65oR5y7bnkTN7hitqBy2O/d4Es1v3/GuQFaAHokKXtont4oG3qBn8/H
   ZYpnJ8CUqeT9Me9mhNG0ptxAYx4ArM0/i4mBS++kVvHFldNxs0n+IRSO+
   d/EuH9ORoTqVKe7Dc+3CcVXyX4H/mhTY+kkjvOK+fE68yCYVFDpJxkhI3
   iU/JUVeo9/HDMEpWh9zGRurkt/wPnLXpXXTWf7C2MPkKckUgU+1/7jjmc
   M4GQkVIbod1vjqwQrOsYcCEqS0bDVId41SnInV0tH5nN65TITKnjwx0Ql
   WcpK6uSqwc5MMf98SJ25uIx7XO4zjkwib1gPokD15V2OFd3XKOJHFSB4w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415854515"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="415854515"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 17:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897874055"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="897874055"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 17:52:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqjxQ-0002vT-2w;
	Thu, 12 Oct 2023 00:53:44 +0000
Date: Thu, 12 Oct 2023 08:53:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(init/main.o):(function get_cpu_mask:
 .text+0x14): relocation R_RISCV_HI20 out of range: 526872 is not in
 [-524288, 524287]; references cpu_bit_bitmap
Message-ID: <202310120816.KjxCljdd-lkp@intel.com>
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
head:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
commit: 49f965b6fbca63904d7397ce96066fa992f401a3 soc: canaan: Make K210_SYSCTL depend on CLK_K210
date:   7 months ago
config: riscv-randconfig-r033-20230903 (https://download.01.org/0day-ci/archive/20231012/202310120816.KjxCljdd-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120816.KjxCljdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120816.KjxCljdd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function get_cpu_mask: .text+0x14): relocation R_RISCV_HI20 out of range: 526872 is not in [-524288, 524287]; references cpu_bit_bitmap
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/cpu.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x3a): relocation R_RISCV_HI20 out of range: 528475 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by main.c
   >>> defined in vmlinux.a(arch/riscv/kernel/process.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x198): relocation R_RISCV_HI20 out of range: 528475 is not in [-524288, 524287]; references initcall_calltime
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x1ca): relocation R_RISCV_HI20 out of range: 527661 is not in [-524288, 524287]; references .L.str.57
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x70): relocation R_RISCV_HI20 out of range: 528078 is not in [-524288, 524287]; references blacklisted_initcalls
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0xc8): relocation R_RISCV_HI20 out of range: 528475 is not in [-524288, 524287]; references initcall_debug
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
