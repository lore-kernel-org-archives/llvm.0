Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D894597A;
	Thu,  4 Apr 2024 05:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712208335; cv=none; b=I2EQDdtP8l2AVR43xolsL0FZQC/eQbi81chfrTGFV0+VSMVJXyTvWCNt7/7iMnFchupBvJC7dkMOirciznIXso3WDIlG3T9/hTdUZmxQvWbIt9GQh16aPR+xTb40POOp9Uy4JXVi6s1y8ITdO99DcoNw3cmvA+cENImSYoqaR9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712208335; c=relaxed/simple;
	bh=FnRf7dW93UoZakdb6icQhXPBm7pCsbKDY4+mzcVhcao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCZh3mUZiNyyaM1G0Jx9OljaSKta5UE8b4Hegm5xt28prT2ToV16CsG/vUw4fJMcrSmnqrSUhVGMcf955vRJGbsmy0K9tjq2ExF0SeHBtj7qbzeoucUg8GLn0ht/SyH5iSADQGR586i04YuuAQDa14Oh2QxdaA1r3zd6qAyMFFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SoSNHvOy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SoSNHvOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712208333; x=1743744333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FnRf7dW93UoZakdb6icQhXPBm7pCsbKDY4+mzcVhcao=;
  b=SoSNHvOyCXe8Xsf9YnNo4FRhtcRb7JEA3KEwBskX449HiwpHmKA6SKLO
   yT948pnU7aXbhQibXSnGNuEjZ3LSSaLDuP6eysUoMwffcsXyHpiGvRMS4
   lT4CxBspvA3isF9mjUlXLKJ3SLLCOihX2+Eiw0wMni2wuON/9gFC4prrx
   gcU53ECOsB15SNHgCQg71OgblNSMTzN1+hFO7/s+Ti5Kaapua/a9Z6TGk
   47XkjVO2xWNVkJwtCff5rCM54F3GCpLKzLAjzKs8rp5rg/dYOhtUrOjJ2
   5/ooodkNUi+fcsnjtKC5mx6NB4/0P39F952vtRdqGP6C9YyqFhFtbZiGr
   g==;
X-CSE-ConnectionGUID: lniy+PDSTmuEuM+LfEiwQA==
X-CSE-MsgGUID: oWzUZpCaSh6E0Lp5KlG7wQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18205010"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18205010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 22:25:31 -0700
X-CSE-ConnectionGUID: uW8xLdPSTVC7Jg43Izjcfw==
X-CSE-MsgGUID: ad3QEsryTayuzIfbGHWwJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18772502"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2024 22:25:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsFbL-0000em-2Y;
	Thu, 04 Apr 2024 05:25:27 +0000
Date: Thu, 4 Apr 2024 13:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-hardening-rebased 36/36]
 arch/x86/include/asm/paravirt.h:131:20: error: static declaration of
 '__cpuid' follows non-static declaration
Message-ID: <202404041357.XsBxbAsp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-hardening-rebased
head:   4d356858e22b5daf59ef3f38b776ed0f63ca70e0
commit: 4d356858e22b5daf59ef3f38b776ed0f63ca70e0 [36/36] x86/paravirt: Explicitly include msr.h
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240404/202404041357.XsBxbAsp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041357.XsBxbAsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041357.XsBxbAsp-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
   In file included from arch/x86/include/asm/paravirt.h:8:
   In file included from arch/x86/include/asm/msr.h:15:
   In file included from include/linux/percpu.h:7:
   In file included from include/linux/smp.h:118:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:19:
>> arch/x86/include/asm/cpuid.h:78:2: error: call to undeclared function '__cpuid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      78 |         __cpuid(eax, ebx, ecx, edx);
         |         ^
   arch/x86/include/asm/cpuid.h:78:2: note: did you mean 'cpuid'?
   arch/x86/include/asm/cpuid.h:72:20: note: 'cpuid' declared here
      72 | static inline void cpuid(unsigned int op,
         |                    ^
      73 |                          unsigned int *eax, unsigned int *ebx,
      74 |                          unsigned int *ecx, unsigned int *edx)
      75 | {
      76 |         *eax = op;
      77 |         *ecx = 0;
      78 |         __cpuid(eax, ebx, ecx, edx);
         |         ~~~~~~~
         |         cpuid
   arch/x86/include/asm/cpuid.h:88:2: error: call to undeclared function '__cpuid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      88 |         __cpuid(eax, ebx, ecx, edx);
         |         ^
   arch/x86/include/asm/cpuid.h:134:2: error: call to undeclared function '__cpuid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |         __cpuid(regs + CPUID_EAX, regs + CPUID_EBX, regs + CPUID_ECX, regs + CPUID_EDX);
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
   In file included from arch/x86/include/asm/paravirt.h:8:
   In file included from arch/x86/include/asm/msr.h:15:
   In file included from include/linux/percpu.h:7:
   In file included from include/linux/smp.h:118:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   In file included from arch/x86/include/asm/cpufeature.h:5:
>> arch/x86/include/asm/processor.h:211:9: error: call to undeclared function '__read_cr3'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     211 |         return __read_cr3() & CR3_ADDR_MASK;
         |                ^
   arch/x86/include/asm/processor.h:211:9: note: did you mean '__read_cr4'?
   arch/x86/include/asm/special_insns.h:123:29: note: '__read_cr4' declared here
     123 | static inline unsigned long __read_cr4(void)
         |                             ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
   In file included from arch/x86/include/asm/paravirt.h:8:
   In file included from arch/x86/include/asm/msr.h:15:
   In file included from include/linux/percpu.h:7:
   In file included from include/linux/smp.h:118:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   In file included from arch/x86/include/asm/cpufeature.h:5:
>> arch/x86/include/asm/processor.h:221:2: error: call to undeclared function 'write_cr3'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     221 |         write_cr3(__sme_pa(pgdir));
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
   In file included from arch/x86/include/asm/paravirt.h:8:
   arch/x86/include/asm/msr.h:320:9: error: call to undeclared function 'wrmsr_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     320 |         return wrmsr_safe(msr, (u32)val,  (u32)(val >> 32));
         |                ^
   arch/x86/include/asm/msr.h:320:9: note: did you mean 'wrmsrl_safe'?
   arch/x86/include/asm/msr.h:318:19: note: 'wrmsrl_safe' declared here
     318 | static inline int wrmsrl_safe(u32 msr, u64 val)
         |                   ^
     319 | {
     320 |         return wrmsr_safe(msr, (u32)val,  (u32)(val >> 32));
         |                ~~~~~~~~~~
         |                wrmsrl_safe
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
>> arch/x86/include/asm/paravirt.h:131:20: error: static declaration of '__cpuid' follows non-static declaration
     131 | static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
         |                    ^
   arch/x86/include/asm/cpuid.h:78:2: note: previous implicit declaration is here
      78 |         __cpuid(eax, ebx, ecx, edx);
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
>> arch/x86/include/asm/paravirt.h:171:29: error: static declaration of '__read_cr3' follows non-static declaration
     171 | static inline unsigned long __read_cr3(void)
         |                             ^
   arch/x86/include/asm/processor.h:211:9: note: previous implicit declaration is here
     211 |         return __read_cr3() & CR3_ADDR_MASK;
         |                ^
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:60:
>> arch/x86/include/asm/paravirt.h:177:20: error: static declaration of 'write_cr3' follows non-static declaration
     177 | static inline void write_cr3(unsigned long x)
         |                    ^
   arch/x86/include/asm/processor.h:221:2: note: previous implicit declaration is here
     221 |         write_cr3(__sme_pa(pgdir));
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:


vim +/__cpuid +131 arch/x86/include/asm/paravirt.h

d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  129  
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  130  /* The paravirtualized CPUID instruction. */
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07 @131  static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  132  			   unsigned int *ecx, unsigned int *edx)
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  133  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  134  	PVOP_VCALL4(cpu.cpuid, eax, ebx, ecx, edx);
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  135  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  136  
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  137  /*
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  138   * These special macros can be used to get or set a debugging register
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  139   */
f4afb713e5c3a4 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24  140  static __always_inline unsigned long paravirt_get_debugreg(int reg)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  141  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  142  	return PVOP_CALL1(unsigned long, cpu.get_debugreg, reg);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  143  }
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  144  #define get_debugreg(var, reg) var = paravirt_get_debugreg(reg)
7361fac0465ba9 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24  145  static __always_inline void set_debugreg(unsigned long val, int reg)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  146  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  147  	PVOP_VCALL2(cpu.set_debugreg, reg, val);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  148  }
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  149  
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  150  static inline unsigned long read_cr0(void)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  151  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  152  	return PVOP_CALL0(unsigned long, cpu.read_cr0);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  153  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  154  
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  155  static inline void write_cr0(unsigned long x)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  156  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  157  	PVOP_VCALL1(cpu.write_cr0, x);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  158  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  159  
0a53c9acf4da51 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24  160  static __always_inline unsigned long read_cr2(void)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  161  {
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11  162  	return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
772ca413537eca arch/x86/include/asm/paravirt.h Juergen Gross       2023-11-29  163  				"mov %%cr2, %%rax;", ALT_NOT_XEN);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  164  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  165  
209cfd0cbb6722 arch/x86/include/asm/paravirt.h Peter Zijlstra      2021-06-24  166  static __always_inline void write_cr2(unsigned long x)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  167  {
5c83511bdb9832 arch/x86/include/asm/paravirt.h Juergen Gross       2018-08-28  168  	PVOP_VCALL1(mmu.write_cr2, x);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  169  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  170  
6c690ee1039b25 arch/x86/include/asm/paravirt.h Andy Lutomirski     2017-06-12 @171  static inline unsigned long __read_cr3(void)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  172  {
fafe5e74229fd3 arch/x86/include/asm/paravirt.h Juergen Gross       2021-03-11  173  	return PVOP_ALT_CALL0(unsigned long, mmu.read_cr3,
772ca413537eca arch/x86/include/asm/paravirt.h Juergen Gross       2023-11-29  174  			      "mov %%cr3, %%rax;", ALT_NOT_XEN);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  175  }
d3561b7fa0fb0f include/asm-i386/paravirt.h     Rusty Russell       2006-12-07  176  
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02 @177  static inline void write_cr3(unsigned long x)
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  178  {
772ca413537eca arch/x86/include/asm/paravirt.h Juergen Gross       2023-11-29  179  	PVOP_ALT_VCALL1(mmu.write_cr3, x, "mov %%rdi, %%cr3", ALT_NOT_XEN);
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  180  }
f8822f42019ece include/asm-i386/paravirt.h     Jeremy Fitzhardinge 2007-05-02  181  

:::::: The code at line 131 was first introduced by commit
:::::: d3561b7fa0fb0fc583bab0eeda32bec9e4c4056d [PATCH] paravirt: header and stubs for paravirtualisation

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
