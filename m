Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7E0265623;
	Fri, 16 Jan 2026 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569667; cv=none; b=eFb38a4EMDNHnP4QsosOmudo7uiCt60KT96GIkyd/MaM4dQ9bJxqWat+g03qQ4jsTaQxki9457AoO5Jsx0sP/gvz0NogPtSELY7tyVVOOaMrB67xhMOls3GpqNzHc54wC73gy92yaTQMLEocNypmruwmQFAlhZ6ky+tNcZ/wcbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569667; c=relaxed/simple;
	bh=i32t1y7XODJy/klylqSnaSxh4yladx7T3RFtlv8mVfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ld6jUgVrZdGq6XKYUtZyCdTFLiA20EtJ59aCHB2YIY1AyCce06KEfK0OnQdH6EJWXygJ0i+bqOyaCQ6I67KjpmijRXpt3UvxJ3C40jggF9xpABPg3WUjsJ8D9pgNdARUnioKBcQOS3bFFnbTJJhx+PEvOtE+MTeufdBbt1ePEWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjdJ09lb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjdJ09lb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768569664; x=1800105664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i32t1y7XODJy/klylqSnaSxh4yladx7T3RFtlv8mVfY=;
  b=LjdJ09lbr8LoLomhTlzXBxc9GuLbi633ftSIn4/zJHcMnoZfykKzDt2D
   dN2oaWPHv1a7rhlMt46XsmuBi/dg2RXbkg3yOZ4a/09cXDccGAprJMFAG
   GZqd2+arRHzx1dDknHU9MiZatFIDu8KDCM0QFgf5/beOcJXE1+sJ5/D5c
   o/Z053GZH7IFgq88I6wNQxDl9DdxIHBrcBF04YK4+HPiBePejsKyGKFfj
   b1b8YXGC4YJR6ju+xFhb5BsTcDg9btOtZ8qknsItOtwBYVM438osMdA0v
   2vmTVoBA3Ix3c9oq+vktbq5QmRMZdCinwPlXV8lU6xJPnna/HlWfigjY7
   Q==;
X-CSE-ConnectionGUID: sQu5ArILTFCrhGAK3f9zxQ==
X-CSE-MsgGUID: ueqbsVYXRyabObW7uBktEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73735954"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="73735954"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 05:21:00 -0800
X-CSE-ConnectionGUID: z20xf1QURzeARJmUSF2riA==
X-CSE-MsgGUID: I8LJAjIITWuAZrKb+MhEbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="236502851"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2026 05:20:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgjl3-00000000KrM-1PJj;
	Fri, 16 Jan 2026 13:20:57 +0000
Date: Fri, 16 Jan 2026 21:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202601162110.K1eWGORM-lkp@intel.com>
References: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>

Hi Brian,

kernel test robot noticed the following build errors:

[auto build test ERROR on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/MIPS-copy-pic32-h-header-file-from-asm-mach-pic32-to-include-platform-data/20260110-005057
base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
patch link:    https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-13-99859c55783d%40redhat.com
patch subject: [PATCH 13/13] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601162110.K1eWGORM-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162110.K1eWGORM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601162110.K1eWGORM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/clk/microchip/clk-core.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/clk/microchip/clk-core.c:13:
   In file included from arch/x86/include/asm/traps.h:8:
>> arch/x86/include/asm/debugreg.h:180:20: error: no member named 'x86' in 'struct cpuinfo_um'
     180 |         if (boot_cpu_data.x86 < 6)
         |             ~~~~~~~~~~~~~ ^
   arch/x86/include/asm/debugreg.h:191:20: error: no member named 'x86' in 'struct cpuinfo_um'
     191 |         if (boot_cpu_data.x86 < 6)
         |             ~~~~~~~~~~~~~ ^
   In file included from drivers/clk/microchip/clk-core.c:13:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:5:
   In file included from include/linux/irq-entry-common.h:13:
   In file included from arch/x86/include/asm/entry-common.h:8:
   arch/x86/include/asm/nospec-branch.h:598:24: error: use of undeclared identifier '__KERNEL_DS'
     598 |         static const u16 ds = __KERNEL_DS;
         |                               ^
   In file included from drivers/clk/microchip/clk-core.c:13:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:5:
   In file included from include/linux/irq-entry-common.h:13:
   In file included from arch/x86/include/asm/entry-common.h:9:
>> arch/x86/include/asm/io_bitmap.h:13:23: error: use of undeclared identifier 'IO_BITMAP_LONGS'
      13 |         unsigned long   bitmap[IO_BITMAP_LONGS];
         |                                ^
   In file included from drivers/clk/microchip/clk-core.c:13:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:5:
   In file included from include/linux/irq-entry-common.h:13:
>> arch/x86/include/asm/entry-common.h:22:25: error: call to undeclared function 'native_save_fl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      22 |                 unsigned long flags = native_save_fl();
         |                                       ^
>> arch/x86/include/asm/entry-common.h:23:24: error: use of undeclared identifier 'X86_EFLAGS_DF'
      23 |                 unsigned long mask = X86_EFLAGS_DF | X86_EFLAGS_NT;
         |                                      ^
>> arch/x86/include/asm/entry-common.h:23:40: error: use of undeclared identifier 'X86_EFLAGS_NT'
      23 |                 unsigned long mask = X86_EFLAGS_DF | X86_EFLAGS_NT;
         |                                                      ^
>> arch/x86/include/asm/entry-common.h:28:7: error: call to undeclared function 'DISABLED_MASK_BIT_SET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      28 |                 if (cpu_feature_enabled(X86_FEATURE_SMAP) ||
         |                     ^
   arch/um/include/asm/cpufeature.h:52:32: note: expanded from macro 'cpu_feature_enabled'
      52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |                                       ^
   In file included from drivers/clk/microchip/clk-core.c:13:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:5:
   In file included from include/linux/irq-entry-common.h:13:
>> arch/x86/include/asm/entry-common.h:30:12: error: use of undeclared identifier 'X86_EFLAGS_AC'
      30 |                         mask |= X86_EFLAGS_AC;
         |                                 ^
>> arch/x86/include/asm/entry-common.h:42:17: error: call to undeclared function 'on_thread_stack'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      42 |                 WARN_ON_ONCE(!on_thread_stack());
         |                               ^
>> arch/x86/include/asm/entry-common.h:50:16: error: use of undeclared identifier '_TIF_USER_RETURN_NOTIFY'
      50 |         if (ti_work & _TIF_USER_RETURN_NOTIFY)
         |                       ^
>> arch/x86/include/asm/entry-common.h:53:25: error: use of undeclared identifier '_TIF_IO_BITMAP'
      53 |         if (unlikely(ti_work & _TIF_IO_BITMAP))
         |                                ^
>> arch/x86/include/asm/entry-common.h:56:25: error: use of undeclared identifier '_TIF_NEED_FPU_LOAD'
      56 |         if (unlikely(ti_work & _TIF_NEED_FPU_LOAD))
         |                                ^
>> arch/x86/include/asm/entry-common.h:57:3: error: call to undeclared function 'switch_fpu_return'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      57 |                 switch_fpu_return();
         |                 ^
>> arch/x86/include/asm/entry-common.h:63:2: error: call to undeclared function 'fpregs_assert_state_consistent'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         fpregs_assert_state_consistent();
         |         ^
   arch/x86/include/asm/entry-common.h:98:6: error: call to undeclared function 'DISABLED_MASK_BIT_SET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      98 |         if (cpu_feature_enabled(X86_FEATURE_IBPB_EXIT_TO_USER) &&
         |             ^
   arch/um/include/asm/cpufeature.h:52:32: note: expanded from macro 'cpu_feature_enabled'
      52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : static_cpu_has(bit))
         |                                       ^
   In file included from drivers/clk/microchip/clk-core.c:13:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:5:
   In file included from include/linux/irq-entry-common.h:13:
>> arch/x86/include/asm/entry-common.h:108:2: error: call to undeclared function 'amd_clear_divider'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     108 |         amd_clear_divider();
         |         ^
   In file included from drivers/clk/microchip/clk-core.c:13:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:5:
>> include/linux/irq-entry-common.h:225:25: error: use of undeclared identifier '_TIF_UPROBE'
     225 |         if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
         |                                ^
   include/linux/irq-entry-common.h:31:42: note: expanded from macro 'EXIT_TO_USER_MODE_WORK'
      31 |         (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_UPROBE |           \
         |                                                 ^
   In file included from drivers/clk/microchip/clk-core.c:13:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
>> include/linux/entry-common.h:48:6: error: conflicting types for 'syscall_trace_enter'
      48 | long syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long work);
         |      ^
   arch/um/include/asm/ptrace-generic.h:44:12: note: previous declaration is here
      44 | extern int syscall_trace_enter(struct pt_regs *regs);
         |            ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +180 arch/x86/include/asm/debugreg.h

42181186ad4db9 Steven Rostedt  2011-12-16  174  
154fcf3a788868 Thomas Gleixner 2024-03-04  175  static inline unsigned long get_debugctlmsr(void)
154fcf3a788868 Thomas Gleixner 2024-03-04  176  {
154fcf3a788868 Thomas Gleixner 2024-03-04  177  	unsigned long debugctlmsr = 0;
154fcf3a788868 Thomas Gleixner 2024-03-04  178  
154fcf3a788868 Thomas Gleixner 2024-03-04  179  #ifndef CONFIG_X86_DEBUGCTLMSR
154fcf3a788868 Thomas Gleixner 2024-03-04 @180  	if (boot_cpu_data.x86 < 6)
154fcf3a788868 Thomas Gleixner 2024-03-04  181  		return 0;
154fcf3a788868 Thomas Gleixner 2024-03-04  182  #endif
c435e608cf59ff Ingo Molnar     2025-04-09  183  	rdmsrq(MSR_IA32_DEBUGCTLMSR, debugctlmsr);
154fcf3a788868 Thomas Gleixner 2024-03-04  184  
154fcf3a788868 Thomas Gleixner 2024-03-04  185  	return debugctlmsr;
154fcf3a788868 Thomas Gleixner 2024-03-04  186  }
154fcf3a788868 Thomas Gleixner 2024-03-04  187  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
