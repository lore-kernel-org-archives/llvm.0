Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD38493;
	Sat,  2 Nov 2024 01:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730511914; cv=none; b=NC/jpaCNCNbARK3ee8luCQLqNUF9HH5YJ4FHq6lOoZClTwsRAHPguBy+6bTvbHtp/h6IU5hKcDD1DO0JIlxv4NV9vKB31pyFLwMqA3EZ4xWvep/5D5j1wWc0Qf8SqGMH85gXxt7wyf5nkxJLlnQbUxsxUOvak/rH5Bkp5Ile/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730511914; c=relaxed/simple;
	bh=nUMllTxK0UgmH0SJUAbRJFz6VOomGNn5DvsK6bxb+6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7YOqr/ukCohvd99Q/UaUp1Z+lsGv8Egeur83w9tRKQFhsoJJFHGiQURK0UdaDIcICLu1utPhvkgJCxeaO2hT7I6ca6i/eI1MBU5qbikNu8X1vr6tRVJC/T85hnO1qM+GcnMcN3mnjzlHb3o3OKaqP46JgTGr2CeLCWMWzvGfbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfFhmGhh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfFhmGhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730511912; x=1762047912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nUMllTxK0UgmH0SJUAbRJFz6VOomGNn5DvsK6bxb+6c=;
  b=DfFhmGhhkdbxZsHiYTkD9dlNjUh/ZV2E++h6dqXlfTXDzi97GlZEUkC7
   JJFFXVWIk8QKnW8FjC2DAMS1T41hZF9HyFkf64n4sqcbMjT6T8IYGkUfY
   cl+cAonE/PcgaWKRcSrQaTeeh4pOmo6Oz7eZ0Wl+0FV25lX0XPTmvns4j
   qc3Ctk7Gljm2dyJK99N6EPO4nnXHkKkSkIKuT8KDQS3OnZgVtZHVCViSJ
   EDFNtgKUl4VWTGIHnkMpK10uFNvwAAG0b3gWpmM+RGiQAy22uD9N9wIU2
   lXzoWHbNelS2PaYKsVzvGpm7kftDUq7Q/56q5QXgGtcGB2rcVzlcryJ7y
   w==;
X-CSE-ConnectionGUID: ATYJ6lCMRFSKkWezqJ0X2w==
X-CSE-MsgGUID: GkJrFw4RR1igOqJKCxdMKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="29702879"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="29702879"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 18:45:11 -0700
X-CSE-ConnectionGUID: GEUrA6tQS5GtHH+hFaIvvQ==
X-CSE-MsgGUID: M+rrvovpQ+e5SfDKVEEZHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="82801861"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Nov 2024 18:45:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t73CN-000iI1-22;
	Sat, 02 Nov 2024 01:45:07 +0000
Date: Sat, 2 Nov 2024 09:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Gary Guo <gary@garyguo.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: clang diag: arch/riscv/include/asm/io.h:104:53: warning: performing
 pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202411020900.QxTldlkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Miguel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c426456857fa0957d4ef62cb1410b5e91a08aca4
commit: 70a57b247251aabadd67795c3097c0fcc616e533 RISC-V: enable building 64-bit kernels with rust support
date:   6 months ago
config: riscv-randconfig-002-20241102 (https://download.01.org/0day-ci/archive/20241102/202411020900.QxTldlkI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020900.QxTldlkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020900.QxTldlkI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   759 |         insl(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
   |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   768 |         outsb(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
   |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   777 |         outsw(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
   |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   786 |         outsl(addr, buffer, count);
   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
   |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:12:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1115 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   14 warnings generated.
   clang diag: include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> clang diag: arch/riscv/include/asm/io.h:104:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:105:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:106:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:118:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:119:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:120:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> clang diag: arch/riscv/include/asm/io.h:104:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:105:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:106:53: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:118:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:119:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: arch/riscv/include/asm/io.h:120:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   error[E0428]: the name `ARCH_SLAB_MINALIGN` is defined multiple times
   --> rust/bindings/bindings_generated.rs:65466:1
   |
   2768  | pub const ARCH_SLAB_MINALIGN: u32 = 16;
   | --------------------------------------- previous definition of the value `ARCH_SLAB_MINALIGN` here
   ...
   65466 | pub const ARCH_SLAB_MINALIGN: usize = 16;
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `ARCH_SLAB_MINALIGN` redefined here
   |
   = note: `ARCH_SLAB_MINALIGN` must be defined only once in the value namespace of this module

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
