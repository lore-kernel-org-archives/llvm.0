Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1730DD2A;
	Wed,  8 Jul 2026 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499482; cv=none; b=YjTlQnEBWxfljkKSy+QMT2jrGC4HsHa3se0zBfdR5zEr2i87KmXYg8a3OY8VIayyxiL/tXR9oLEvuBimAF3qKDBJ+324WCZt8dOnSijrQrm3YgXP2FaLJknb5t7+B3RdCMcH+8i3lwIFWKG5p2MeHZnq+rmiMfiDpEntJrcba8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499482; c=relaxed/simple;
	bh=OWrss5WWXztJumyV3kabRSmwpBD9wgs3Y0EdQR9dVLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BRGpLeqJil/a7xMON8PhK7ql6y4IZ7/rjqpVilQdmjdE7mRHGBoJ9cfpjQiXQB46qCR1K8c/CuGjBeD9P1pL541WNTPvU2c7Dkkpjiggxn/xOgDTlJXdWYkrltXGOSLwTvemerx0RgUuS2n//3DBUimUsmLdAGQ/mj+QCVbQIYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwBvYIA6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwBvYIA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783499481; x=1815035481;
  h=date:from:to:cc:subject:message-id;
  bh=OWrss5WWXztJumyV3kabRSmwpBD9wgs3Y0EdQR9dVLo=;
  b=jwBvYIA6I18PFXYeDCNrkJECccOWUB+NW/DU1sYQXfBwfy9zng7ym6e3
   mwR7lMe6E1ojMytg8njIiXKu9l+nuO2dzHnbW9kCeLiboeZthP7gOlqiS
   ahM5lIUbDuq1qwkQkARXYmo2kaN5rYFTrLXQlUz58tGLf5GjqME0t+vly
   UROogbuLNg6D6WEgxEcu+FQDE/V0mrg0DFz5VFBVwVt3Oxqa81PjuP/My
   PtD411VXNqDMXYgHQ7ykz3QH045en+42hkzuDAT6TqhMg/S7tgrL4WXEL
   3CEzLd8COwB2glmc054+FivkYfIbtW5Nt7DRBsdYuydoCpVmO+d17HugW
   w==;
X-CSE-ConnectionGUID: jKJUO4inSZKU7xfzX8ZSFg==
X-CSE-MsgGUID: V1bBWzpNTaas+hFA3soCQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94799387"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94799387"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:31:19 -0700
X-CSE-ConnectionGUID: mCZ1+VRmQ/+gwzdC5onuqQ==
X-CSE-MsgGUID: vlRgX4pTRUiBGcUSTVieqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250239687"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2026 01:31:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whNgX-00000000GAd-3c2N;
	Wed, 08 Jul 2026 08:31:13 +0000
Date: Wed, 08 Jul 2026 16:30:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: [tip:core/entry 2/3]
 arch/x86/include/asm/entry-common.h:43:24: error: call to undeclared function
 'task_stack_page'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607081658.EOFtlqzz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
head:   34ef6308418f138395a664bf9f5d80ace9825ac6
commit: 7fc04d7044aaa5ffe2afe78979fe6ddd5da24f10 [2/3] syscall_user_dispatch: Make it configurable in Kconfig
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260708/202607081658.EOFtlqzz-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081658.EOFtlqzz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081658.EOFtlqzz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/idt.c:9:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:5:
>> arch/x86/include/asm/entry-common.h:43:24: error: call to undeclared function 'task_stack_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      43 |                 WARN_ON_ONCE(regs != task_pt_regs(current));
         |                                      ^
   arch/x86/include/asm/processor.h:650:39: note: expanded from macro 'task_pt_regs'
     650 |         unsigned long __ptr = (unsigned long)task_stack_page(task);     \
         |                                              ^
   In file included from arch/x86/kernel/idt.c:9:
   In file included from arch/x86/include/asm/traps.h:9:
   In file included from arch/x86/include/asm/idtentry.h:11:
   In file included from include/linux/entry-common.h:8:
   In file included from include/linux/irq-entry-common.h:9:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:25:
   In file included from arch/x86/include/asm/perf_event.h:721:
   In file included from arch/x86/include/asm/stacktrace.h:14:
   In file included from arch/x86/include/asm/switch_to.h:5:
>> include/linux/sched/task_stack.h:21:30: error: conflicting types for 'task_stack_page'
      21 | static __always_inline void *task_stack_page(const struct task_struct *task)
         |                              ^
   arch/x86/include/asm/entry-common.h:43:24: note: previous implicit declaration is here
      43 |                 WARN_ON_ONCE(regs != task_pt_regs(current));
         |                                      ^
   arch/x86/include/asm/processor.h:650:39: note: expanded from macro 'task_pt_regs'
     650 |         unsigned long __ptr = (unsigned long)task_stack_page(task);     \
         |                                              ^
   2 errors generated.


vim +/task_stack_page +43 arch/x86/include/asm/entry-common.h

167fd210ec0555 Thomas Gleixner 2020-07-23  12  
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  13  /* Check that the stack and regs on entry from user mode are sane. */
6d97af487dee31 Sven Schnelle   2022-05-04  14  static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  15  {
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  16  	if (IS_ENABLED(CONFIG_DEBUG_ENTRY)) {
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  17  		/*
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  18  		 * Make sure that the entry code gave us a sensible EFLAGS
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  19  		 * register.  Native because we want to check the actual CPU
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  20  		 * state, not the interrupt state as imagined by Xen.
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  21  		 */
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  22  		unsigned long flags = native_save_fl();
662a0221893a3d Peter Zijlstra  2020-09-02  23  		unsigned long mask = X86_EFLAGS_DF | X86_EFLAGS_NT;
662a0221893a3d Peter Zijlstra  2020-09-02  24  
662a0221893a3d Peter Zijlstra  2020-09-02  25  		/*
662a0221893a3d Peter Zijlstra  2020-09-02  26  		 * For !SMAP hardware we patch out CLAC on entry.
662a0221893a3d Peter Zijlstra  2020-09-02  27  		 */
0bafc51babe234 Juergen Gross   2022-11-04  28  		if (cpu_feature_enabled(X86_FEATURE_SMAP) ||
0bafc51babe234 Juergen Gross   2022-11-04  29  		    cpu_feature_enabled(X86_FEATURE_XENPV))
662a0221893a3d Peter Zijlstra  2020-09-02  30  			mask |= X86_EFLAGS_AC;
662a0221893a3d Peter Zijlstra  2020-09-02  31  
662a0221893a3d Peter Zijlstra  2020-09-02  32  		WARN_ON_ONCE(flags & mask);
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  33  
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  34  		/* We think we came from user mode. Make sure pt_regs agrees. */
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  35  		WARN_ON_ONCE(!user_mode(regs));
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  36  
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  37  		/*
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  38  		 * All entries from user mode (except #DF) should be on the
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  39  		 * normal thread stack and should have user pt_regs in the
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  40  		 * correct location.
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  41  		 */
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  42  		WARN_ON_ONCE(!on_thread_stack());
27d6b4d14f5c3a Thomas Gleixner 2020-07-23 @43  		WARN_ON_ONCE(regs != task_pt_regs(current));
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  44  	}
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  45  }
6d97af487dee31 Sven Schnelle   2022-05-04  46  #define arch_enter_from_user_mode arch_enter_from_user_mode
27d6b4d14f5c3a Thomas Gleixner 2020-07-23  47  

:::::: The code at line 43 was first introduced by commit
:::::: 27d6b4d14f5c3ab21c4aef87dd04055a2d7adf14 x86/entry: Use generic syscall entry function

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
