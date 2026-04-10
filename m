Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D43A75B6;
	Fri, 10 Apr 2026 22:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775859983; cv=none; b=ClYsvZ7ImNBHgLsEiVEvau42mF9mVTgkCqym15pC+s3tRqBMnTs8fYppVnPbWq4jihukMcnZBqadwoKsCs8q8CCC8SCW6Adb3Znv7Z+sw2A86/V2LFlQvdKhk84RR0AY7am28PnBpEzJ1mPx6/rte2Y/B5hs3oxhoJ2ScKYolek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775859983; c=relaxed/simple;
	bh=BoDc76SEIhdYwb0zppZM7EMdV3nFoUlFTfTWXevcbrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CGDZ545nVbVu5BhTTpO8oq4V8BM144PiErM0wweQnwdtK33JTb2rXqGT/wxx/C3FEEnmINmM68Lu48IAe4ktrz0/1fgYX1CU7TttOjYLF2q8T2yXsvhqe+pExiGFdnh5j1uZXOJmI6SiKgwES4A6/WoQElplW5MbpxWN22gDZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVttQXdY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVttQXdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775859982; x=1807395982;
  h=date:from:to:cc:subject:message-id;
  bh=BoDc76SEIhdYwb0zppZM7EMdV3nFoUlFTfTWXevcbrI=;
  b=LVttQXdYITq/Krfkaym7O9UPW2fsNSX34lsZHdOG3N74qbPbHSLbwtzV
   gaxBK7qTOhxYnUX1EnzmKhSE/+3bg1DyeOMW3kiu2dnU+G3yWBDN/YvD2
   DOzv0DV/1EnfYLAswp68ZUCYCul3SUZzhottKjWYcO9s93uVC/eCBVEd5
   NhOd4vohIWq9DQWyOdrQrnEvgGJPDR4m17sBokWKPI8FZANfYiEvFCSuR
   329Y9wb3zCxZ37lRirSX30xrlytopQDFFYac5sQBX4/N9RtI14ye/5hWr
   lGBSMTdKCLnLeGF/b2VzKX537vLa2y2XW4H4lzR6prXuc88qboSM0qBIf
   g==;
X-CSE-ConnectionGUID: DPKgOshrQhy+RB4Yc0iPaA==
X-CSE-MsgGUID: JrEsVSHhQDSN707PONhrUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75927805"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="75927805"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 15:26:20 -0700
X-CSE-ConnectionGUID: xIwk2t0PSlmoGvxpq+PMhg==
X-CSE-MsgGUID: Msbr1qW4TJeTKphy8aIzXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="252578555"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Apr 2026 15:26:18 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBKIq-000000000In-1Vu9;
	Fri, 10 Apr 2026 22:26:16 +0000
Date: Sat, 11 Apr 2026 06:25:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 2/38]
 arch/x86/include/asm/msr.h:296:26: error: call to undeclared function
 'raw_cpu_ptr'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202604110619.kzZCa62Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: b6f1012e23f9638e6c66029fa3d515ddf1775a80 [2/38] x86: Cleanup include recursion hell
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260411/202604110619.kzZCa62Z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110619.kzZCa62Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110619.kzZCa62Z-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:44:
   In file included from include/linux/syscalls.h:84:
   In file included from include/uapi/linux/aio_abi.h:31:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:5:
   In file included from include/linux/fs_dirent.h:5:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
>> arch/x86/include/asm/msr.h:293:47: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
     293 | static inline void rdmsr_on_cpus(const struct cpumask *m, u32 msr_no,
         |                                               ^
   arch/x86/include/asm/msr.h:298:47: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
     298 | static inline void wrmsr_on_cpus(const struct cpumask *m, u32 msr_no,
         |                                               ^
   2 warnings generated.
--
   In file included from arch/x86/events/probe.c:6:
>> arch/x86/include/asm/msr.h:293:47: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
     293 | static inline void rdmsr_on_cpus(const struct cpumask *m, u32 msr_no,
         |                                               ^
>> arch/x86/include/asm/msr.h:296:26: error: call to undeclared function 'raw_cpu_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     296 |         rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
         |                                 ^
>> arch/x86/include/asm/msr.h:296:26: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'u32 *' (aka 'unsigned int *') [-Wint-conversion]
     296 |         rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:273:67: note: passing argument to parameter 'l' here
     273 | static inline int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h)
         |                                                                   ^
   arch/x86/include/asm/msr.h:296:49: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'u32 *' (aka 'unsigned int *') [-Wint-conversion]
     296 |         rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
         |                                                        ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/msr.h:273:75: note: passing argument to parameter 'h' here
     273 | static inline int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h)
         |                                                                           ^
   arch/x86/include/asm/msr.h:298:47: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
     298 | static inline void wrmsr_on_cpus(const struct cpumask *m, u32 msr_no,
         |                                               ^
>> arch/x86/include/asm/msr.h:301:26: error: call to undeclared function 'raw_cpu_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     301 |         wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
         |                                 ^
   2 warnings and 4 errors generated.


vim +/raw_cpu_ptr +296 arch/x86/include/asm/msr.h

b6f1012e23f963 arch/x86/include/asm/msr.h Thomas Gleixner 2026-04-09  259  
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  260  int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  261  int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
d7484babd2c4dc arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  262  int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
c895ecdab2e4de arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  263  int wrmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  264  void rdmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  265  void wrmsr_on_cpus(const struct cpumask *mask, u32 msr_no, struct msr __percpu *msrs);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  266  int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  267  int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h);
5e404cb7ac4c09 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  268  int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q);
27a23a544a55b5 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  269  int wrmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  270  int rdmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  271  int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8]);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  272  #else  /*  CONFIG_SMP  */
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  273  static inline int rdmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 *l, u32 *h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  274  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  275  	rdmsr(msr_no, *l, *h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  276  	return 0;
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  277  }
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  278  static inline int wrmsr_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  279  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  280  	wrmsr(msr_no, l, h);
c6f31932d0a1d2 include/asm-x86/msr.h      H. Peter Anvin  2008-08-25  281  	return 0;
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  282  }
d7484babd2c4dc arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  283  static inline int rdmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  284  {
c435e608cf59ff arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  285  	rdmsrq(msr_no, *q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  286  	return 0;
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  287  }
c895ecdab2e4de arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  288  static inline int wrmsrq_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  289  {
78255eb2397332 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  290  	wrmsrq(msr_no, q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  291  	return 0;
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  292  }
0d0fbbddcc27c0 arch/x86/include/asm/msr.h Rusty Russell   2009-11-05 @293  static inline void rdmsr_on_cpus(const struct cpumask *m, u32 msr_no,
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  294  				struct msr __percpu *msrs)
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  295  {
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04 @296  	rdmsr_on_cpu(0, msr_no, raw_cpu_ptr(&msrs->l), raw_cpu_ptr(&msrs->h));
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  297  }
0d0fbbddcc27c0 arch/x86/include/asm/msr.h Rusty Russell   2009-11-05  298  static inline void wrmsr_on_cpus(const struct cpumask *m, u32 msr_no,
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04  299  				struct msr __percpu *msrs)
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  300  {
5323922f50ecdf arch/x86/include/asm/msr.h Thomas Gleixner 2024-03-04 @301  	wrmsr_on_cpu(0, msr_no, raw_cpu_read(msrs->l), raw_cpu_read(msrs->h));
b034c19f9f61c8 arch/x86/include/asm/msr.h Borislav Petkov 2009-05-22  302  }
abb0ade013507c include/asm-x86/msr.h      Joe Perches     2008-03-23  303  static inline int rdmsr_safe_on_cpu(unsigned int cpu, u32 msr_no,
abb0ade013507c include/asm-x86/msr.h      Joe Perches     2008-03-23  304  				    u32 *l, u32 *h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  305  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  306  	return rdmsr_safe(msr_no, l, h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  307  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  308  static inline int wrmsr_safe_on_cpu(unsigned int cpu, u32 msr_no, u32 l, u32 h)
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  309  {
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  310  	return wrmsr_safe(msr_no, l, h);
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  311  }
5e404cb7ac4c09 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  312  static inline int rdmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 *q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  313  {
6fe22abacd40e2 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  314  	return rdmsrq_safe(msr_no, q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  315  }
27a23a544a55b5 arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  316  static inline int wrmsrq_safe_on_cpu(unsigned int cpu, u32 msr_no, u64 q)
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  317  {
6fa17efe45440f arch/x86/include/asm/msr.h Ingo Molnar     2025-04-09  318  	return wrmsrq_safe(msr_no, q);
1a6b991a9875a4 arch/x86/include/asm/msr.h Jacob Pan       2013-10-11  319  }
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  320  static inline int rdmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8])
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  321  {
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  322  	return rdmsr_safe_regs(regs);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  323  }
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  324  static inline int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8])
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  325  {
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  326  	return wrmsr_safe_regs(regs);
8b956bf1f0f2b5 arch/x86/include/asm/msr.h H. Peter Anvin  2009-08-31  327  }
be7baf80a69964 include/asm-x86/msr.h      Thomas Gleixner 2007-10-23  328  #endif  /* CONFIG_SMP */
a5447e92e169da arch/x86/include/asm/msr.h Ingo Molnar     2025-04-13  329  

:::::: The code at line 296 was first introduced by commit
:::::: 5323922f50ecdf9d10cdd2fabd06507e5b4f3feb x86/msr: Add missing __percpu annotations

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
