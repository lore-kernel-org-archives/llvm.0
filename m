Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770CE3EB0F5;
	Wed,  8 Jul 2026 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493869; cv=none; b=dzRgFi0Y5rAh2EoidWQdxbn06GtpGdEOmgIja/qG6V1G8navQUn828OHe2mD45HDu71FXbTBGsAgb56VKHIft84U6ct2t5PBAZmDZLvyBVy4BPnaDLlxECxfRwgW/UghnRXhYMU9023+wuRAyvu6Hc1BPpZY5r0dv9HS+m409kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493869; c=relaxed/simple;
	bh=VvkDpftkUJ1HREDk+hyhMG9lfgT1OcV6l6L1/x3LIdo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DkqAuUzFNMOo1tgRM9HFpChFotTn8n2OKnS3gIQEzKyK9BMlJUn1U0AgtJvaEQUa9frhh8pBnti1+kf2BjQC2vBRFmrSrsrIozqIfdsPSgi9HkDGoStbhYOQaUvFJKJs+kOqip1EsUlrCSPTNj7uFKksPjvZfm9Ec14dsPE3kho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJutqkVH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJutqkVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783493860; x=1815029860;
  h=date:from:to:cc:subject:message-id;
  bh=VvkDpftkUJ1HREDk+hyhMG9lfgT1OcV6l6L1/x3LIdo=;
  b=OJutqkVHoZ8kJwheRk9mz6BaGtrGmaytlVQgO4fh5YeBFmxim32888sJ
   1X7jKXwsVh5Q0e5XxArX2UTkVvReho/KRj8Vjl/2gFpS4inliSFyHj39t
   D1jIy9EzgryTpTv/aceotXZNstZHRIS7FblzEqmwRCUOSuKvkAAbr9apj
   Bwkxjxw3N0NpFHUQgfnEubw1lFvw6K5hgj7PNZmGxWcaiiYpWBA7T4Z9C
   pQ4k0FjcAq5Ia97VeX4EYvJN6B0XriwfK35nMAhVvINBgZBYJeSsqJbFo
   Bw9W4scddp/exPhAtdPOX30+f041CK6+ArkzqRgDMim/Ia/zylZc4DPsy
   Q==;
X-CSE-ConnectionGUID: 4ZfxNnWsR/65r44KqfivMw==
X-CSE-MsgGUID: MXsp6/3LRLOwltorFt/llg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94790864"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94790864"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 23:57:34 -0700
X-CSE-ConnectionGUID: 9SpGoN4UQCC/++RMh1zsjA==
X-CSE-MsgGUID: QUi2kpCrT4WdnannraArjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258084292"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Jul 2026 23:57:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whMDn-00000000G6x-0DW8;
	Wed, 08 Jul 2026 06:57:27 +0000
Date: Wed, 08 Jul 2026 14:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: [tip:core/entry 2/3]
 arch/s390/include/asm/entry-common.h:49:18: error: call to undeclared
 function 'task_stack_page'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202607081402.DO1ePla3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
head:   34ef6308418f138395a664bf9f5d80ace9825ac6
commit: 7fc04d7044aaa5ffe2afe78979fe6ddd5da24f10 [2/3] syscall_user_dispatch: Make it configurable in Kconfig
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260708/202607081402.DO1ePla3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081402.DO1ePla3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081402.DO1ePla3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/traps.c:24:
   In file included from include/linux/entry-common.h:5:
>> arch/s390/include/asm/entry-common.h:49:18: error: call to undeclared function 'task_stack_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      49 |         pai_kernel_exit(current_pt_regs());
         |                         ^
   include/linux/ptrace.h:389:27: note: expanded from macro 'current_pt_regs'
     389 | #define current_pt_regs() task_pt_regs(current)
         |                           ^
   arch/s390/include/asm/processor.h:252:10: note: expanded from macro 'task_pt_regs'
     252 |         (task_stack_page(tsk) + THREAD_SIZE) - 1)
         |          ^
   In file included from arch/s390/kernel/traps.c:24:
   In file included from include/linux/entry-common.h:8:
   In file included from include/linux/irq-entry-common.h:9:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:50:
   In file included from include/linux/perf_regs.h:5:
   include/linux/sched/task_stack.h:21:30: error: conflicting types for 'task_stack_page'
      21 | static __always_inline void *task_stack_page(const struct task_struct *task)
         |                              ^
   arch/s390/include/asm/entry-common.h:49:18: note: previous implicit declaration is here
      49 |         pai_kernel_exit(current_pt_regs());
         |                         ^
   include/linux/ptrace.h:389:27: note: expanded from macro 'current_pt_regs'
     389 | #define current_pt_regs() task_pt_regs(current)
         |                           ^
   arch/s390/include/asm/processor.h:252:10: note: expanded from macro 'task_pt_regs'
     252 |         (task_stack_page(tsk) + THREAD_SIZE) - 1)
         |          ^
   2 errors generated.


vim +/task_stack_page +49 arch/s390/include/asm/entry-common.h

56e62a737028360 Sven Schnelle  2020-11-21  41  
56e62a737028360 Sven Schnelle  2020-11-21  42  static __always_inline void arch_exit_to_user_mode(void)
56e62a737028360 Sven Schnelle  2020-11-21  43  {
8c09871a950a3fe Heiko Carstens 2024-02-03  44  	load_user_fpu_regs();
56e62a737028360 Sven Schnelle  2020-11-21  45  
56e62a737028360 Sven Schnelle  2020-11-21  46  	if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
56e62a737028360 Sven Schnelle  2020-11-21  47  		debug_user_asce(1);
39d62336f5c126a Thomas Richter 2022-05-04  48  
39d62336f5c126a Thomas Richter 2022-05-04 @49  	pai_kernel_exit(current_pt_regs());
56e62a737028360 Sven Schnelle  2020-11-21  50  }
56e62a737028360 Sven Schnelle  2020-11-21  51  

:::::: The code at line 49 was first introduced by commit
:::::: 39d62336f5c126ad6dccdf66cd249f2d0e86d3c9 s390/pai: add support for cryptography counters

:::::: TO: Thomas Richter <tmricht@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
