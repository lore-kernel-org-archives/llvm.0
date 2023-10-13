Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC58110E1;
	Fri, 13 Oct 2023 03:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCziW7EP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697167553; x=1728703553;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yB9zz+VhvC3W/0og84SEaot9k+a/G9WIXtMe3q+SCn0=;
  b=NCziW7EPPS7uLFqM8LAIYSuWW4dWmHs8p6XpWezvGd/MkYN0lLeAtcA1
   BFPiqInT8rqQe8+TcuJc6hpWY6Jmm0UB5jfIccJEUj/OZexb0UX3pOzMu
   rX1O69ZFjdLSQBxKLoNoQSLspixkH3lyMr5S73IHF0Bv8GOZBvK0OKjhS
   gyJ/L16xQAvlanl6WuwZI1lBuy9aPrs4cShy7s7dqPLh9TYl1XrCPj2yB
   ovqia3/FP4GrAoSlwPm5OzSU7FwjzinfqwamW2ZXq1j0LviXijME9PW+Q
   wNFYGnOidXkry29193RtC6QI83X0Qc0evPrAVYOXkvTv7TAAyi5yIBfWN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382323711"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="382323711"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 20:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783976845"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783976845"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 20:25:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr8o8-0004Hn-00;
	Fri, 13 Oct 2023 03:25:48 +0000
Date: Fri, 13 Oct 2023 11:25:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(init/main.o):(function get_cpu_mask:
 .text+0x14): relocation R_RISCV_HI20 out of range: 526888 is not in
 [-524288, 524287]; references cpu_bit_bitmap
Message-ID: <202310131112.QiLkjnhO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Jakob Koschel <jkl820.git@gmail.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   20f4757fa5ed2d9a7746d01b8950cfe04d593a0a
commit: 1e327963cfab0e02eeeb0331178d6c353c959cd6 x86/sgx: Avoid using iterator after loop in sgx_mmu_notifier_release()
date:   4 months ago
config: riscv-randconfig-r033-20230903 (https://download.01.org/0day-ci/archive/20231013/202310131112.QiLkjnhO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131112.QiLkjnhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131112.QiLkjnhO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function get_cpu_mask: .text+0x14): relocation R_RISCV_HI20 out of range: 526888 is not in [-524288, 524287]; references cpu_bit_bitmap
   >>> referenced by main.c
   >>> defined in vmlinux.a(kernel/cpu.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x3a): relocation R_RISCV_HI20 out of range: 528505 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by main.c
   >>> defined in vmlinux.a(arch/riscv/kernel/process.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x198): relocation R_RISCV_HI20 out of range: 528505 is not in [-524288, 524287]; references initcall_calltime
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x1ca): relocation R_RISCV_HI20 out of range: 527688 is not in [-524288, 524287]; references .L.str.53
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0x70): relocation R_RISCV_HI20 out of range: 528108 is not in [-524288, 524287]; references blacklisted_initcalls
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function do_one_initcall: .text+0xc8): relocation R_RISCV_HI20 out of range: 528505 is not in [-524288, 524287]; references initcall_debug
   >>> referenced by main.c
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
