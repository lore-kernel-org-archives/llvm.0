Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32821DA53;
	Wed, 26 Jul 2023 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690383765; x=1721919765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PLDTXZYwGqY+UrPoYMP8FQvPAu09wKPxF09f6nX6nPc=;
  b=VqhIcXKjro/aszJVAItXCgpXeK7JUYqXIMQQRbauMK1wqZ8edHUELZBs
   q2e3zxQgxhSXlGoCP/Tan/dqkW2PeyKg70qgoNzFUkwCjMEuApdV8QhMA
   g7kLbd7ec8HKOs1tQnvMz80wLEj0v8veJKYaBkhUQoy6FoN7FBpdwYlt9
   ns0oj04oGwHApR27pBE4ZYvNx6HzSET6Fg8liEM1kQOYYhsKqQA4vWQ3G
   jeYJ6ye7eaQAy6jHkFDUckmQnC2GjdKVXB+nJrXZvWqrl7REXhzBgCRH8
   ZzNCQ9mCo3RDJbLND/quZlcBSh5q/6D3fc6Tp4yCT+fJ0COEjBnWtjI61
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398972423"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="398972423"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 08:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="729889004"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="729889004"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jul 2023 08:01:26 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOg0z-00012T-2f;
	Wed, 26 Jul 2023 15:01:25 +0000
Date: Wed, 26 Jul 2023 23:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/core 3/6] arch/x86/include/asm/paravirt.h:55:2:
 error: call to undeclared function 'PVOP_VCALL0'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202307262231.Ev7lVENp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   1e68adb59894117251d942316d32514d45bd23ef
commit: 5d78ed0959d293a570ef61dd9a6336aee75a483c [3/6] x86/speculation: Add __update_spec_ctrl() helper
config: x86_64-randconfig-x005-20230726 (https://download.01.org/0day-ci/archive/20230726/202307262231.Ev7lVENp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307262231.Ev7lVENp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307262231.Ev7lVENp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:9:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:53:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:13:
   In file included from arch/x86/include/asm/math_emu.h:5:
   In file included from arch/x86/include/asm/ptrace.h:97:
   In file included from arch/x86/include/asm/paravirt_types.h:27:
   In file included from arch/x86/include/asm/nospec-branch.h:12:
   In file included from arch/x86/include/asm/msr.h:236:
>> arch/x86/include/asm/paravirt.h:55:2: error: call to undeclared function 'PVOP_VCALL0'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL0(cpu.io_delay);
           ^
>> arch/x86/include/asm/paravirt.h:55:14: error: use of undeclared identifier 'cpu'
           PVOP_VCALL0(cpu.io_delay);
                       ^
>> arch/x86/include/asm/paravirt.h:67:22: warning: declaration of 'struct flush_tlb_info' will not be visible outside of this function [-Wvisibility]
                                const struct flush_tlb_info *info);
                                             ^
   arch/x86/include/asm/paravirt.h:71:2: error: call to undeclared function 'PVOP_VCALL0'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL0(mmu.flush_tlb_user);
           ^
>> arch/x86/include/asm/paravirt.h:71:14: error: use of undeclared identifier 'mmu'
           PVOP_VCALL0(mmu.flush_tlb_user);
                       ^
   arch/x86/include/asm/paravirt.h:76:2: error: call to undeclared function 'PVOP_VCALL0'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL0(mmu.flush_tlb_kernel);
           ^
   arch/x86/include/asm/paravirt.h:76:14: error: use of undeclared identifier 'mmu'
           PVOP_VCALL0(mmu.flush_tlb_kernel);
                       ^
>> arch/x86/include/asm/paravirt.h:81:2: error: call to undeclared function 'PVOP_VCALL1'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
           ^
   arch/x86/include/asm/paravirt.h:81:14: error: use of undeclared identifier 'mmu'
           PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
                       ^
   arch/x86/include/asm/paravirt.h:85:24: warning: declaration of 'struct flush_tlb_info' will not be visible outside of this function [-Wvisibility]
                                         const struct flush_tlb_info *info)
                                                      ^
>> arch/x86/include/asm/paravirt.h:87:2: error: call to undeclared function 'PVOP_VCALL2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
           ^
   arch/x86/include/asm/paravirt.h:87:14: error: use of undeclared identifier 'mmu'
           PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
                       ^
>> arch/x86/include/asm/paravirt.h:90:53: warning: declaration of 'struct mmu_gather' will not be visible outside of this function [-Wvisibility]
   static inline void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
                                                       ^
   arch/x86/include/asm/paravirt.h:92:2: error: call to undeclared function 'PVOP_VCALL2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL2(mmu.tlb_remove_table, tlb, table);
           ^
   arch/x86/include/asm/paravirt.h:92:14: error: use of undeclared identifier 'mmu'
           PVOP_VCALL2(mmu.tlb_remove_table, tlb, table);
                       ^
   arch/x86/include/asm/paravirt.h:97:2: error: call to undeclared function 'PVOP_VCALL1'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL1(mmu.exit_mmap, mm);
           ^
   arch/x86/include/asm/paravirt.h:97:14: error: use of undeclared identifier 'mmu'
           PVOP_VCALL1(mmu.exit_mmap, mm);
                       ^
>> arch/x86/include/asm/paravirt.h:103:2: error: call to undeclared function 'PVOP_VCALL3'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL3(mmu.notify_page_enc_status_changed, pfn, npages, enc);
           ^
   arch/x86/include/asm/paravirt.h:103:14: error: use of undeclared identifier 'mmu'
           PVOP_VCALL3(mmu.notify_page_enc_status_changed, pfn, npages, enc);
                       ^
   arch/x86/include/asm/paravirt.h:109:2: error: call to undeclared function 'PVOP_VCALL1'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL1(cpu.load_sp0, sp0);
           ^
   arch/x86/include/asm/paravirt.h:109:14: error: use of undeclared identifier 'cpu'
           PVOP_VCALL1(cpu.load_sp0, sp0);
                       ^
>> arch/x86/include/asm/paravirt.h:116:2: error: call to undeclared function 'PVOP_VCALL4'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           PVOP_VCALL4(cpu.cpuid, eax, ebx, ecx, edx);
           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   3 warnings and 20 errors generated.
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2188329804
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=2188329804
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2188329804
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2188329804
   make: Target 'prepare' not remade because of errors.


vim +/PVOP_VCALL0 +55 arch/x86/include/asm/paravirt.h

4e6292114c74122 arch/x86/include/asm/paravirt.h Juergen Gross   2021-03-11   51  
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   52  /* The paravirtualized I/O functions */
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   53  static inline void slow_down_io(void)
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   54  {
eac46b323b28215 arch/x86/include/asm/paravirt.h Peter Zijlstra  2021-06-24  @55  	PVOP_VCALL0(cpu.io_delay);
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   56  #ifdef REALLY_SLOW_IO
eac46b323b28215 arch/x86/include/asm/paravirt.h Peter Zijlstra  2021-06-24   57  	PVOP_VCALL0(cpu.io_delay);
eac46b323b28215 arch/x86/include/asm/paravirt.h Peter Zijlstra  2021-06-24   58  	PVOP_VCALL0(cpu.io_delay);
eac46b323b28215 arch/x86/include/asm/paravirt.h Peter Zijlstra  2021-06-24   59  	PVOP_VCALL0(cpu.io_delay);
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   60  #endif
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   61  }
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   62  
2faf153bb7346b7 arch/x86/include/asm/paravirt.h Thomas Gleixner 2020-04-21   63  void native_flush_tlb_local(void);
cd30d26cf307b45 arch/x86/include/asm/paravirt.h Thomas Gleixner 2020-04-21   64  void native_flush_tlb_global(void);
127ac915c8e1c11 arch/x86/include/asm/paravirt.h Thomas Gleixner 2020-04-21   65  void native_flush_tlb_one_user(unsigned long addr);
4ce94eabac16b1d arch/x86/include/asm/paravirt.h Nadav Amit      2021-02-20   66  void native_flush_tlb_multi(const struct cpumask *cpumask,
29def599b38bb8a arch/x86/include/asm/paravirt.h Thomas Gleixner 2020-04-21  @67  			     const struct flush_tlb_info *info);
2faf153bb7346b7 arch/x86/include/asm/paravirt.h Thomas Gleixner 2020-04-21   68  
2faf153bb7346b7 arch/x86/include/asm/paravirt.h Thomas Gleixner 2020-04-21   69  static inline void __flush_tlb_local(void)
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   70  {
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28  @71  	PVOP_VCALL0(mmu.flush_tlb_user);
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   72  }
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   73  
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   74  static inline void __flush_tlb_global(void)
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   75  {
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   76  	PVOP_VCALL0(mmu.flush_tlb_kernel);
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   77  }
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   78  
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   79  static inline void __flush_tlb_one_user(unsigned long addr)
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   80  {
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28  @81  	PVOP_VCALL1(mmu.flush_tlb_one_user, addr);
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   82  }
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   83  
4ce94eabac16b1d arch/x86/include/asm/paravirt.h Nadav Amit      2021-02-20   84  static inline void __flush_tlb_multi(const struct cpumask *cpumask,
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   85  				      const struct flush_tlb_info *info)
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   86  {
4ce94eabac16b1d arch/x86/include/asm/paravirt.h Nadav Amit      2021-02-20  @87  	PVOP_VCALL2(mmu.flush_tlb_multi, cpumask, info);
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   88  }
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   89  
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28  @90  static inline void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   91  {
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   92  	PVOP_VCALL2(mmu.tlb_remove_table, tlb, table);
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   93  }
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   94  
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   95  static inline void paravirt_arch_exit_mmap(struct mm_struct *mm)
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   96  {
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   97  	PVOP_VCALL1(mmu.exit_mmap, mm);
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   98  }
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28   99  
064ce6c550a0630 arch/x86/include/asm/paravirt.h Brijesh Singh   2021-08-24  100  static inline void notify_page_enc_status_changed(unsigned long pfn,
064ce6c550a0630 arch/x86/include/asm/paravirt.h Brijesh Singh   2021-08-24  101  						  int npages, bool enc)
064ce6c550a0630 arch/x86/include/asm/paravirt.h Brijesh Singh   2021-08-24  102  {
064ce6c550a0630 arch/x86/include/asm/paravirt.h Brijesh Singh   2021-08-24 @103  	PVOP_VCALL3(mmu.notify_page_enc_status_changed, pfn, npages, enc);
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28  104  }
fdc0269e8958a1e arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28  105  
9bad5658ea710f4 arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28  106  #ifdef CONFIG_PARAVIRT_XXL
da51da189a24bb9 arch/x86/include/asm/paravirt.h Andy Lutomirski 2017-11-02  107  static inline void load_sp0(unsigned long sp0)
d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  108  {
5c83511bdb9832c arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28  109  	PVOP_VCALL1(cpu.load_sp0, sp0);
d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  110  }
d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  111  
d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  112  /* The paravirtualized CPUID instruction. */
d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  113  static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  114  			   unsigned int *ecx, unsigned int *edx)
d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  115  {
5c83511bdb9832c arch/x86/include/asm/paravirt.h Juergen Gross   2018-08-28 @116  	PVOP_VCALL4(cpu.cpuid, eax, ebx, ecx, edx);
d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  117  }
d3561b7fa0fb0fc include/asm-i386/paravirt.h     Rusty Russell   2006-12-07  118  

:::::: The code at line 55 was first introduced by commit
:::::: eac46b323b28215ad19d53390737df4aa336ac14 x86/paravirt: Use PVOP_* for paravirt calls

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
