Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96882CA6;
	Sat,  5 Aug 2023 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691265650; x=1722801650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/uzrtbXHXhqrxxTqvocPj7by47tjIa8lXpB4uuDFQo=;
  b=W85JkMc444ovrpebIfFS+JX9Ea00ZA7GtfXW6CySrrYqInwosS3jafBI
   CcHdKHcybEnRF/mtxRBl4IGr7hnYhKf+kTJAnK0r8q3xY6CFqvL7rD6pD
   2prPpUpFcxopaxS3TL7gMXh17K60gUUlI5Nm8EZIb12m2X3EhCxvHOuNj
   h0g39/X3eJD6mubdlaVwPbuZlB4j0FGJ7eKsR+mStHx86Ha8zujENUdI4
   ji1j2HRBr6Wy+jwFF+KfaJkoG7miYmCzO/Nql7sGPxQIwEeTWkNKShHNn
   PA/45E/s/fvJe61xhBsMRTpSLx9QTO87Db7qIJrqGgP+cPMx3AohPbBTs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="456714392"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="456714392"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 13:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="854171310"
X-IronPort-AV: E=Sophos;i="6.01,258,1684825200"; 
   d="scan'208";a="854171310"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Aug 2023 13:00:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSNSA-0003rj-1j;
	Sat, 05 Aug 2023 20:00:46 +0000
Date: Sun, 6 Aug 2023 04:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 2/5]
 kernel/trace/rethook.c:298:2: error: call to undeclared function
 'ftrace_regs_set_instruction_pointer'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202308060332.Ctrtt6hj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   069e6430a717ff19937b79b565595cc7765791d0
commit: 5d93c6a3e4c0b1911bb29f888466aea92f1fae05 [2/5] fprobe: rethook: Use fprobe_regs in fprobe exit handler and rethook
config: x86_64-buildonly-randconfig-r003-20230806 (https://download.01.org/0day-ci/archive/20230806/202308060332.Ctrtt6hj-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308060332.Ctrtt6hj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308060332.Ctrtt6hj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rethook.c:298:2: error: call to undeclared function 'ftrace_regs_set_instruction_pointer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ftrace_regs_set_instruction_pointer(fregs, correct_ret_addr);
           ^
   1 error generated.
--
>> kernel/kprobes.c:2134:25: error: call to undeclared function 'ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                                  ^
>> kernel/kprobes.c:2134:18: error: incompatible integer to pointer conversion initializing 'struct pt_regs *' with an expression of type 'int' [-Wint-conversion]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> arch/x86/kernel/rethook.c:111:25: error: call to undeclared function 'ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                                  ^
>> arch/x86/kernel/rethook.c:111:18: error: incompatible integer to pointer conversion initializing 'struct pt_regs *' with an expression of type 'int' [-Wint-conversion]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/rethook.c:121:25: error: call to undeclared function 'ftrace_get_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                                  ^
   arch/x86/kernel/rethook.c:121:18: error: incompatible integer to pointer conversion initializing 'struct pt_regs *' with an expression of type 'int' [-Wint-conversion]
           struct pt_regs *regs = ftrace_get_regs(fregs);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/ftrace_regs_set_instruction_pointer +298 kernel/trace/rethook.c

   282	
   283	/* This function will be called from each arch-defined trampoline. */
   284	unsigned long rethook_trampoline_handler(struct ftrace_regs *fregs,
   285						 unsigned long frame)
   286	{
   287		struct llist_node *first, *node = NULL;
   288		unsigned long correct_ret_addr;
   289		rethook_handler_t handler;
   290		struct rethook_node *rhn;
   291	
   292		correct_ret_addr = __rethook_find_ret_addr(current, &node);
   293		if (!correct_ret_addr) {
   294			pr_err("rethook: Return address not found! Maybe there is a bug in the kernel\n");
   295			BUG_ON(1);
   296		}
   297	
 > 298		ftrace_regs_set_instruction_pointer(fregs, correct_ret_addr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
