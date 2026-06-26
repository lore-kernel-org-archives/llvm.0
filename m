Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7322928E0F;
	Fri, 26 Jun 2026 23:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782514877; cv=none; b=NGM+UKmT/lt4hRHq/Ezx/RivAqkhViAhfcEjX2DVoqH2o5nYq6tr1Sg6Ckkiy4dKJlIDBseo7mLCdoPtXKvnNwoP/EgaPsSFVJSeohbxyqNNAZeBCVB79REHdCBd8lxe4DbJYF5eloFdlR1ko4xhxD0ULdnS2G8qHkwCtJcYXPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782514877; c=relaxed/simple;
	bh=N+EwZq1Lg5b8iAYZQgF/LJbBzt1ydUNWPtcQ/Klg4zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ExWQzZr5TfTyLdTGIlbxmyOUS/+rKMJsKAmU0eVVVmNV77p2iVygQIZa8uPZxIplDR9/1QFoBaNBeuJPx/OQRoS6PVjPuuHgw0gPF7ZfGflOUxnG4wncKXTlWsH3UnVlLhIUwxKOvzNLlPLNSVVnTxRK8BQPnUT7KBgU9sCPbF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBg0Ketw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBg0Ketw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782514876; x=1814050876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N+EwZq1Lg5b8iAYZQgF/LJbBzt1ydUNWPtcQ/Klg4zs=;
  b=LBg0KetwxhjH4diaAvSAYINBr8qLXHZuunxJOdMOf7a2M7DaqbbVM0pF
   VLlYG0NMWx+XPPyQXxcltZ3BUu3LCRgTjzyS0jphe5vuIYnDNRO0eWIVR
   +C4dtKGKphqJ+9V+qB/vLbssc8Vg12dlCWL14VPsJWACzOHdeCJk3ioG+
   bfvQl9H4/PItL0hxpkRf6nVbHuLmSq4sKH+7OclpIdWp0N2LuRrJp5o7V
   72XgvnN2cVsRZSyN3XKEL4Ab+dBSTZjUef+aXUExC6Vg0yJJR9BdzAHL+
   sSERBw9L0kTXmaGYRCvpSySKo9f56Av9FabuFEx/WcKPbB4ppHou0HwV+
   g==;
X-CSE-ConnectionGUID: jOahnA2lTnO0CbN+T3D/OQ==
X-CSE-MsgGUID: WZOPWcSDS2G/jffH6+yxiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83184408"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="83184408"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 16:01:15 -0700
X-CSE-ConnectionGUID: vQ3lTWudSHm6udhEIctcJg==
X-CSE-MsgGUID: dWldI4SaTgmywcMdfg1rsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="246973875"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2026 16:01:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdFXp-000000005UJ-0A4b;
	Fri, 26 Jun 2026 23:01:09 +0000
Date: Sat, 27 Jun 2026 07:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Subject: [thomas-weissschuh:b4/riscv-vdso32-alternative 5/9]
 llvm-readelf: warning: 'arch/riscv/kernel/vdso/vdso.so.dbg': invalid
 PT_DYNAMIC size (0xf8)
Message-ID: <202606270658.zYkKDlzo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/riscv-vdso32-alternative
head:   2da3ee80e25443812a6751c8bd11788f9dcd133d
commit: c511a3c512bdfdf1e3bf4b5f71072e4b8a45c876 [5/9] riscv: vdso: Implement __vdso_futex_robust_try_unlock()
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260627/202606270658.zYkKDlzo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270658.zYkKDlzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270658.zYkKDlzo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
>> llvm-readelf: warning: 'arch/riscv/kernel/vdso/vdso.so.dbg': invalid PT_DYNAMIC size (0xf8)
>> llvm-readelf: warning: 'arch/riscv/kernel/vdso/vdso.so.dbg': PT_DYNAMIC dynamic table is invalid: SHT_DYNAMIC will be used
   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/riscv/kernel/vdso/Makefile:93: arch/riscv/kernel/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:162: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
