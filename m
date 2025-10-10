Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD164DDC5;
	Fri, 10 Oct 2025 01:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760058206; cv=none; b=ZIBRVAC1DsZhY5B3qTPsWg0KJPl1Sl5YKJ7TuCwJvlfp7Kr10a96dESGxP91rrKtIzlkrqE6oxZFUVZA1KcGvkd9AtilNA9x9L2DzwOAsKEe7VjEY+ofRrf33CES4FzHIqtBUOq5eSCHuISXHIS+HKjxs0+9qE6Jzy/P9q1xrd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760058206; c=relaxed/simple;
	bh=FCJyNirfM8Ni+nDUQuuMMCZQcuqNEj1HAiulBJ0zCUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bod2qMLMP4Arvs4X3XMUiQ2tOHV0zDRTsiYjHPz2zoJzzdh8eMJAkWI86DNo85Jv6bO2woVPn5ZJl9ZJLmim+FdhnRxa5Y/oIxTwWNbGkDnowJRU3aIyjqqzBc1EreMjg7b0QixDJkjNDA0Ngg1PdDuRoc2WWyi800ZaQjHCXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsQlJaNv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsQlJaNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760058205; x=1791594205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FCJyNirfM8Ni+nDUQuuMMCZQcuqNEj1HAiulBJ0zCUw=;
  b=dsQlJaNvZ3U4iNgtqX0pkf7UX0/+NRccjszR4bT00UqOmw+xhQMbIHPV
   il2FoWYd8ysOj/fvpu73KK7pI/F4uRS1fu2RXcOmcaHomh6MuXJnIrSDv
   FFWr8Q7BmuerUltzGMs19tQqKZxSD3s/6PQ4NN3xjD+qm/UYhuEfKKa8e
   jIyWPjUVDZobNoDdfkbZDctrIRIlS9hef4UuaWhY89W2I9UX5BruHSnIr
   ApxlLV3kvB5SDFHaJQtDX2hdoUHhBIUJg8pLKUqOiOQIO7rjhg4zmJ9fF
   rEe+6jgVvtMwYKjGJ3g9hFBw9RilB+w2aOZJ3SO/55SSDTw5xx/VXRCRm
   A==;
X-CSE-ConnectionGUID: /J8Ebdz9SveyQi0jnRpgiA==
X-CSE-MsgGUID: A7EqMp8DTSa7s1o64yCeoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62435336"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="62435336"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 18:03:24 -0700
X-CSE-ConnectionGUID: gCvWDVWtTumkHsQfTLog3A==
X-CSE-MsgGUID: WQrSnCpZSwSdUQ8O0lWvVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="185227622"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2025 18:03:23 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v71XU-0001jB-2V;
	Fri, 10 Oct 2025 01:03:20 +0000
Date: Fri, 10 Oct 2025 09:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.18-rc1-separate-dabt-codepath
 13/13] arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier
 'sync_stack_ptr'
Message-ID: <202510100931.EqJEELAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.18-rc1-separate-dabt-codepath
head:   472ab81a994df0203a9a26838be93ec226d7070d
commit: 472ab81a994df0203a9a26838be93ec226d7070d [13/13] Print stack whereabouts info on kernel paging fault
config: arm64-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100931.EqJEELAi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100931.EqJEELAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100931.EqJEELAi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                                ^
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:44: error: indirection requires pointer operand ('void' invalid)
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:412:28: note: expanded from macro 'raw_cpu_read'
     412 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:325:23: note: expanded from macro '__pcpu_size_call_return'
     325 |         case 1: pscr_ret__ = stem##1(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:10:1: note: expanded from here
      10 | raw_cpu_read_1
         | ^
   include/asm-generic/percpu.h:215:30: note: expanded from macro 'raw_cpu_read_1'
     215 | #define raw_cpu_read_1(pcp)             raw_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:80:2: note: expanded from macro 'raw_cpu_generic_read'
      80 |         *raw_cpu_ptr(&(pcp));                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                                ^
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:44: error: indirection requires pointer operand ('void' invalid)
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:412:28: note: expanded from macro 'raw_cpu_read'
     412 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:326:23: note: expanded from macro '__pcpu_size_call_return'
     326 |         case 2: pscr_ret__ = stem##2(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:11:1: note: expanded from here
      11 | raw_cpu_read_2
         | ^
   include/asm-generic/percpu.h:218:30: note: expanded from macro 'raw_cpu_read_2'
     218 | #define raw_cpu_read_2(pcp)             raw_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:80:2: note: expanded from macro 'raw_cpu_generic_read'
      80 |         *raw_cpu_ptr(&(pcp));                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                                ^
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:44: error: indirection requires pointer operand ('void' invalid)
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:412:28: note: expanded from macro 'raw_cpu_read'
     412 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:327:23: note: expanded from macro '__pcpu_size_call_return'
     327 |         case 4: pscr_ret__ = stem##4(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:12:1: note: expanded from here
      12 | raw_cpu_read_4
         | ^
   include/asm-generic/percpu.h:221:30: note: expanded from macro 'raw_cpu_read_4'
     221 | #define raw_cpu_read_4(pcp)             raw_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:80:2: note: expanded from macro 'raw_cpu_generic_read'
      80 |         *raw_cpu_ptr(&(pcp));                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                                ^
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:57: error: use of undeclared identifier 'sync_stack_ptr'
>> arch/arm64/mm/fault.c:305:44: error: indirection requires pointer operand ('void' invalid)
     305 |         unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:412:28: note: expanded from macro 'raw_cpu_read'
     412 | #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:328:23: note: expanded from macro '__pcpu_size_call_return'
     328 |         case 8: pscr_ret__ = stem##8(variable); break;                  \
         |                              ^~~~~~~~~~~~~~~~~
   <scratch space>:13:1: note: expanded from here
      13 | raw_cpu_read_8
         | ^
   include/asm-generic/percpu.h:224:30: note: expanded from macro 'raw_cpu_read_8'
     224 | #define raw_cpu_read_8(pcp)             raw_cpu_generic_read(pcp)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:80:2: note: expanded from macro 'raw_cpu_generic_read'
      80 |         *raw_cpu_ptr(&(pcp));                                           \
         |         ^~~~~~~~~~~~~~~~~~~~
   19 errors generated.


vim +/sync_stack_ptr +305 arch/arm64/mm/fault.c

   299	
   300	static void die_kernel_fault(const char *msg, unsigned long addr,
   301				     unsigned long esr, struct pt_regs *regs)
   302	{
   303		unsigned long stack = (unsigned long)current->stack;
   304		unsigned long irq_stack = (unsigned long)raw_cpu_read(irq_stack_ptr);
 > 305		unsigned long sync_stack = (unsigned long)raw_cpu_read(sync_stack_ptr);
   306		bust_spinlocks(1);
   307	
   308		tracing_off();
   309		pr_alert("Unable to handle kernel %s at virtual address %016lx\n", msg,
   310			 addr);
   311	
   312		pr_alert("TASK STACK: 0x%08lx-0x%08lx\n",
   313			 stack, stack + THREAD_SIZE - 1);
   314		pr_alert("IRQ STACK: 0x%08lx-0x%08lx\n",
   315			 irq_stack, irq_stack + IRQ_STACK_SIZE - 1);
   316		pr_alert("SYNC STACK: 0x%08lx-0x%08lx\n",
   317			 sync_stack, sync_stack + SYNC_STACK_SIZE - 1);
   318	
   319		kasan_non_canonical_hook(addr);
   320	
   321		mem_abort_decode(esr);
   322	
   323		show_pte(addr);
   324		die("Oops", regs, esr);
   325		bust_spinlocks(0);
   326		make_task_dead(SIGKILL);
   327	}
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
