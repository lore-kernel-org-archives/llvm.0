Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591312;
	b=smjkuWQT/0IYN3+BOFl+hbACO/C2sY3/u5M/H7iBVsENTQO83Y9bauYDMA9i3TQFYvzP
	 eJVeJq9GxBnN0cNmIVcWVzUA7Gf/296V5xl1Yc2I5f+RDbwf98X9pWLwo+EUPeh1WTWC5
	 8f1O0FupvhOaTmbf9qLueWM4qUazhDRTZGVv3GNobBIoPzLBjrBryThuIlX6eMgHUysN0
	 3Q0huy8+uEc0biXqJWxYs3My6Fnqv2GPQ/x2316iHz4exoAHa4EV2pc+dxAVmT1PA/qDk
	 DT/Xk/UO1tkfueBI8cs1q/97e0a0wXaBD5vW3wtBXeUSSgzBTETdoBDzQ4pCmwTO54g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591312;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dE4izVdjy6KL2PsiytzQ3z6gVsmfGjx4RYNJxcHwyDc=;
	b=MmHeknseL84o70f1V0ldltg6YyZABOHitHX9T+Exk9ivYWZLcmTFGDmkpOj8tr+exHF6
	 orsCtQMKd+16pNUWG4sgLvHZ4m/6LT62sU87CwwCKe9rbsIfPmBXVpnKd9aETg788xNbt
	 doW0eLnbDe88wHTdkFsI9TAmbfhiq7O3D22j/pNd3qdphbax9voNYyyd6GJ8dWHruV/q+
	 6z1QIUc1ZhI2NwanzGiHft0VGR3RoJS+sdiSC95qBs0p+rX/MZc0LtWaAurUrfrAo/WqI
	 FKuXaAtahl+HSQq3rIxWO34gglq6lI7HEIEsJldndx+qXSRPn6evmhAIlG6JK37G96g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hsjwgp6w;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21613606A324;
	Mon,  2 Nov 2026 03:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21613606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hsjwgp6w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793591310; x=1825127310;
  h=date:from:to:cc:subject:message-id;
  bh=Pre/as/0173OOZ1ttiAf5NnprEDRWzrQdS6bpbQgNkA=;
  b=hsjwgp6wv8ou8B3pe9lhoeeoXNCsxcA5a6zoib7lQamIm7N/yHF2mZ7S
   p3DhjgDjwB2+1yM7bQwMYFEBgO8JKJ7BN9KmZBa46W3NKSLE+58R+uLd+
   oGkM3AFP8JmtwHUI/yPvi3/ssPnvGTP/TflWMG4aDdIrMn6ev8KxCVXJb
   LmI1SSNzFHTVZAFI78xfSM4ZOxnNqPdlRCJJZppSTCdUUMRVDzQYACaSE
   ULIiKgbBm+F+6NZkTUUef5QGUMHrb8kNidBfmNEAZhyiotfG1BLYU5AEf
   32U5dhKQ5pfk52j9yTHapmbZ2KK9RL6V67dZK52id9QiI2TdcNJi53yH9
   g==;
X-CSE-ConnectionGUID: ZEz5LwZARoS/zVJ/u9EB+w==
X-CSE-MsgGUID: Z7vAvqeYS0Obr/kxiWxBLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2278257"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2278257"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 19:48:30 -0800
X-CSE-ConnectionGUID: 8apjnZluSPqKsFsJB9KK7g==
X-CSE-MsgGUID: flQxXlELRsC/pQbDjFWhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5853024"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 01 Nov 2026 19:48:28 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNj22-000000008F5-04Jk;
	Mon, 02 Nov 2026 03:48:26 +0000
Date: Mon, 02 Nov 2026 04:47:56 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 25/25] ld.lld: error: relocation
 R_X86_64_32S cannot be used against symbol
 'kernel::module_param::set_param::ONCE'; recompile with -fPIC
Message-ID: <202611020415.N9TL79Gy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   39ce2e7cf56af29147a3a3e23013d147afaa3ebc
commit: 70604084d1e8fe0325f4d86cb7c43df4ce31fe2a [25/25] x86/kernel: Switch to PIE linking for the relocatable kernel
config: x86_64-randconfig-2001-20261101 (https://download.01.org/0day-ci/archive/20261102/202611020415.N9TL79Gy-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020415.N9TL79Gy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611020415.N9TL79Gy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_X86_64_32S cannot be used against symbol 'kernel::module_param::set_param::ONCE'; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by print.rs:506 (rust/kernel/print.rs:506)
   >>>               vmlinux.o:(kernel::module_param::set_param::<i8>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by ub_checks.rs:73 (/opt/cross/rustc-1.96.0-bindgen-0.72.1/rustup/toolchains/1.96.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ub_checks.rs:73)
   >>>               vmlinux.o:(kernel::module_param::set_param::<i8>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by ub_checks.rs:73 (/opt/cross/rustc-1.96.0-bindgen-0.72.1/rustup/toolchains/1.96.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ub_checks.rs:73)
   >>>               vmlinux.o:(kernel::module_param::set_param::<u8>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by mod.rs:289 (/opt/cross/rustc-1.96.0-bindgen-0.72.1/rustup/toolchains/1.96.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/macros/mod.rs:289)
   >>>               vmlinux.o:(kernel::module_param::set_param::<u8>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by module_param.rs:78 (rust/kernel/module_param.rs:78)
>> >>>               vmlinux.o:(kernel::error::from_result::<i32, kernel::module_param::set_param<u8>::{closure#0}>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by mod.rs:289 (/opt/cross/rustc-1.96.0-bindgen-0.72.1/rustup/toolchains/1.96.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/macros/mod.rs:289)
   >>>               vmlinux.o:(kernel::module_param::set_param::<i8>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by module_param.rs:78 (rust/kernel/module_param.rs:78)
>> >>>               vmlinux.o:(kernel::error::from_result::<i32, kernel::module_param::set_param<i8>::{closure#0}>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by module_param.rs:82 (rust/kernel/module_param.rs:82)
>> >>>               vmlinux.o:(kernel::error::from_result::<i32, kernel::module_param::set_param<i8>::{closure#0}>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by print.rs:0 (rust/kernel/print.rs:0)
   >>>               vmlinux.o:(<kernel::print::OnceLite>::call_once::<kernel::module_param::set_param<i8>::{closure#1}>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against symbol 'kernel::print::format_strings::WARNING'; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by print.rs:114 (rust/kernel/print.rs:114)
   >>>               vmlinux.o:(<kernel::print::OnceLite>::call_once::<kernel::module_param::set_param<i8>::{closure#1}>)
--
>> ld.lld: error: relocation R_X86_64_32S cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.o
   >>> referenced by print.rs:114 (rust/kernel/print.rs:114)
   >>>               vmlinux.o:(<kernel::print::OnceLite>::call_once::<kernel::module_param::set_param<i8>::{closure#1}>)
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
