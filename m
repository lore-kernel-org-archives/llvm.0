Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792895125;
	b=JQmDk0V5gy3TWk8lD+oeMNH//Q85a+f43KM0QFBuHIYYBWH2LIDxkPkvwgYV/LVCsXyg
	 YGkIWWfQ/GcykGZvl9arlljbNeTh6i21WYlopPeolJkBijsXmW3diJQ/IogpS4Cm5VaP4
	 3b7S+7RyNO3PV/z/IDqGvRuZ/KDFMWE6s9agVWEP6pvzhq/MzhqMaKjvh6T3IjmS1rVy1
	 MNcNSbmxSXF+46hvESBn3GivDIbblVioTI8yYZfI2tNUd1SiiN0Tm6qcTtCeMg607Btp7
	 PeqjGziyT59ldNemv3+ljARefpr4+DYIsCpuaKdc03IvVcIlEvsCaQ0aCRe46GM9g5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792895125;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8i965xZwYzs7YXjblzDPktk6Fcta9PFAvX/WyI3pKgI=;
	b=d4Q3W3I5jq18u5mNLMorMQk0F09n3fQpdSy65x+9R2DqQv+bDWGloGO++nmzPGb8HSrc
	 slNL6Bz/8NgdXBQTrBO9sV0KlT7pWh6mxXQQHlY5hUQdRn3sMfCMNwJESxhnXag1ulqak
	 QieCInk04IOe79nLvVjxD/GsdtcIztROPZ0g7JlNR3t2CAHKld4LOSL/xi3i4Sxf0kr56
	 Z7Otqrx3YtvZEQNeuE4RY7wiYZSUiWybJMqWP515RnqrrBqRnN2XIwKyO10NtSo7U/Ki9
	 AiNUwbvxbCkLoZsmNrpbYh0dsNc9SgQeV54GGUsk7kKTATe+1V538RUWKFJcI3lxtmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RoH5hHwC;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA169606A31A;
	Sun, 25 Oct 2026 02:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA169606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RoH5hHwC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792895123; x=1824431123;
  h=date:from:to:cc:subject:message-id;
  bh=Dy3An4LrOyvJOQQLAmZUZ7r/lVoqqmaOGtyW7ZZq5J8=;
  b=RoH5hHwCVzXOdFuNsuatZRM7iztFYvSw5/QSUM8Yi/1bRjUT1NCUZI9B
   Xk9MOJO/cbnCQq3UpVqf32TvIRXdXJjVyOob8/jR3MjQXM0sZv5o+wKyI
   MG3E2A+T8SwFMHRy7BlaUxExpuInLkP60WIZhWaMEW6jFrKv98e/SrTGy
   xMUeUFYg04DZafPlJwEiUT11s2x53uL/1jrxjjjqTNvYQDFNr4O6a+9m3
   dpHbkT8H/9mdDY+zqAjwkL9SkiTuEg/aeNWOPM7hKv9i1ddV5YPyc4DQf
   4kZnrbGery0F3c0bkVTYayB5gooKVUVJq9bQTt1sGcrXr8mCVnGt7NhnN
   g==;
X-CSE-ConnectionGUID: mvLmfHRkRF6ijQO1cmS5Cw==
X-CSE-MsgGUID: LwA8vJUySzitW7nE2t8q4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1603603"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1603603"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 19:25:23 -0700
X-CSE-ConnectionGUID: EGMZZ53BRzazvw6kCy+UNw==
X-CSE-MsgGUID: Oit7Ny8tSCS0wr/Tc19uMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4025599"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2026 19:25:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKnvA-00000000UTO-2mcG;
	Sun, 25 Oct 2026 02:25:16 +0000
Date: Sun, 25 Oct 2026 10:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss-2026-10-23 25/25]
 arch/x86/kernel/cet.c:330:6: error: redefinition of
 'arch_kernel_stack_lock_current'
Message-ID: <202610251021.TiL9FTBK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss-2026-10-23
head:   b6fa923e47fcecf329844fd91ed615de35478ea3
commit: b6fa923e47fcecf329844fd91ed615de35478ea3 [25/25] x86/boot: Add CPU shadow stack bootstrapping
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261025/202610251021.TiL9FTBK-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251021.TiL9FTBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251021.TiL9FTBK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cet.c:277:17: warning: no previous prototype for function 'kshstk_build' [-Wmissing-prototypes]
     277 | asmlinkage void kshstk_build(unsigned long *root_sp)
         |                 ^
   arch/x86/kernel/cet.c:277:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
     277 | asmlinkage void kshstk_build(unsigned long *root_sp)
         |            ^
         |            static 
>> arch/x86/kernel/cet.c:330:6: error: redefinition of 'arch_kernel_stack_lock_current'
     330 | void arch_kernel_stack_lock_current(void)
         |      ^
   arch/x86/include/asm/shstk.h:49:20: note: previous definition is here
      49 | static inline void arch_kernel_stack_lock_current(void) {}
         |                    ^
>> arch/x86/kernel/cet.c:351:18: error: no member named 'kshstk_ssp' in 'struct thread_struct'
     351 |         current->thread.kshstk_ssp = kshstk_enable_current();
         |         ~~~~~~~~~~~~~~~ ^
>> arch/x86/kernel/cet.c:351:31: error: call to undeclared function 'kshstk_enable_current'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     351 |         current->thread.kshstk_ssp = kshstk_enable_current();
         |                                      ^
   1 warning and 3 errors generated.


vim +/arch_kernel_stack_lock_current +330 arch/x86/kernel/cet.c

   320	
   321	/*
   322	 * This "locks" the stack in place and does not allow any control
   323	 * flow manipulation to occur because of changes to the stack.
   324	 *
   325	 * CPU enters with shadow stacks disabled and leaves with them
   326	 * enabled.
   327	 *
   328	 * Must be called before the CPU does its first context switch.
   329	 */
 > 330	void arch_kernel_stack_lock_current(void)
   331	{
   332		unsigned long flags;
   333	
   334		if (!cpu_feature_enabled(X86_FEATURE_KERN_SHSTK))
   335			return;
   336	
   337		kshstk_prepare_pages();
   338	
   339		/*
   340		 * Regular interrupts are delivered on stack level 0. There
   341		 * is a window within the enabling where CET_SHSTK_EN=1 but
   342		 * SSP is not yet set. If an interrupt is delivered in that
   343		 * window, it would try to push on to this stack. Disable
   344		 * regular interrupts over this window.
   345		 *
   346		 * Interrupts that use other stack levels (like NMI) are OK
   347		 * because FRED switches stacks for them and does not push
   348		 * on stack level 0.
   349		 */
   350		local_irq_save(flags);
 > 351		current->thread.kshstk_ssp = kshstk_enable_current();

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
