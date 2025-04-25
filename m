Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3340322F3BE;
	Fri, 25 Apr 2025 07:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566852; cv=none; b=GutC+5wxLqJsBHBQi33vsL4Y5TeP3X4R5uuW27UC1YJgqljFIGi1YugDTTLNkeY1ZoHt2as9SH5mfXdQt0mSwPaQ7So/KP8QlcxbUi7p9Ysvo4LiWNOVFCLeMcLRuSIY1sJO7eVGJSXu0Lq2/GpzroBQlj04Q8dXyjecb5hjfJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566852; c=relaxed/simple;
	bh=wePL7/8abGOkarkS3KbOObE6BSilQWXu9mz/OOzl7rk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ccSYN9PYB/7Xuj9+4RyGm9ztHC4vTf6+8cwAH8lsTrypJ/q6OqyTy0mk+yHx9X0t3NCxbdqDpjwz9WgGMw5KizkbCTrK3S0WvpUbJfJmJaCl54TyIoOqEzk0r4aFRsR0RNp65UwIgXxe3ziixr11inRHxnDdtNpLb/XmnyC3emA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeXuc6LK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeXuc6LK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745566850; x=1777102850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wePL7/8abGOkarkS3KbOObE6BSilQWXu9mz/OOzl7rk=;
  b=XeXuc6LKd+mm4B8aMFrxkzJr4EzLz9pY9dNNCimQzojqkUxGtet3WURI
   KMKj3EdUQ9Zcm/8ppQ7saydD7JJxxYAV1O0Lj3Mh46Hzy5XM2roKykSz9
   AzfOEK1Q3ndeLwehwqROzfrpE4BIZ4ibBad83710+uc59MDnupZwWfIsw
   ihu3jVrYLNoOUvIjiZ+Ul/p1wkpomLHueQLRIvEP5Yq3L6eCoz0+gjz5H
   +xiI24ODMa1LApm+YAUbAiaC4FPWCyiq7cJOOrj9/4s6ll5h8q26kkmB5
   jD/kl8Idgo9gpes6jeGJa9I26C5JAYUcPwfGurLhZmrDTQdLRRcSrAHO/
   g==;
X-CSE-ConnectionGUID: ZrGa8orkToG84TMgqviFXg==
X-CSE-MsgGUID: sQdbs1bWT9eC7hftpBcXEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46454304"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="46454304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:40:47 -0700
X-CSE-ConnectionGUID: Qjma7dp0SPW1DgcEP98SQQ==
X-CSE-MsgGUID: DoltaK4aTwafPukeLh1X3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137830953"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Apr 2025 00:40:46 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Dfv-0004vH-1z;
	Fri, 25 Apr 2025 07:40:43 +0000
Date: Fri, 25 Apr 2025 15:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.15-rc3+/cb-ptr 3/3] include/uapi/linux/uio.h:20:2:
 error: 'counted_by' cannot be applied to a pointer with pointee of unknown
 size because 'void' is an incomplete type
Message-ID: <202504251556.bG0Qj8lU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.15-rc3+/cb-ptr
head:   342a3b133d248d5a5f71587958eb26bea9901814
commit: 342a3b133d248d5a5f71587958eb26bea9901814 [3/3] [WIP] iov annotation
config: riscv-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251556.bG0Qj8lU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251556.bG0Qj8lU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251556.bG0Qj8lU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:14:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:11:
>> include/uapi/linux/uio.h:20:2: error: 'counted_by' cannot be applied to a pointer with pointee of unknown size because 'void' is an incomplete type
      20 |         void __user *iov_base __counted_by_ptr(iov_len);
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:14:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
>> include/linux/uio.h:20:2: error: 'counted_by' cannot be applied to a pointer with pointee of unknown size because 'void' is an incomplete type
      20 |         void *iov_base __counted_by_ptr(iov_len);
         |         ^~~~~~~~~~~~~~
   7 warnings and 2 errors generated.
   make[3]: *** [scripts/Makefile.build:98: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2938330456
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1286: prepare0] Error 2 shuffle=2938330456
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2938330456
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2938330456
   make: Target 'prepare' not remade because of errors.


vim +20 include/uapi/linux/uio.h

    15	
    16	
    17	struct iovec
    18	{
    19		/* BSD uses caddr_t (1003.1g requires void *) */
  > 20		void __user *iov_base __counted_by_ptr(iov_len);
    21		__kernel_size_t iov_len; /* Must be size_t (1003.1g) */
    22	};
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
