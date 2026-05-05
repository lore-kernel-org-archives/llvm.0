Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BDA330315;
	Tue,  5 May 2026 23:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778022430; cv=none; b=iiEmP5rJO1eShH31fn+I63XpmE6+iYcZss97+/RRrv2pjiX9pT4Kqr3gKDms+QkbqcmKffqm72o4CzQHuvgvA/WLcPqx6gAH4+iybeOFOIq1J+5KgjP2b/NPzO0nWh2JZfoamkiDG4+jSONGpq1S7NphVv1nYHI5fjqZGkCxuWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778022430; c=relaxed/simple;
	bh=riJXBctATI7KYeBNlcLC9E9uJ5Tb+rzeERzmLIl5qMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ma5/fcNmLRWrGwNkaMYZRdhyZ+L6VoavQ51kraIMcHfB8ZHCoXkrKKXfHxWf16wVNXEenbmaiqyJ98ylMiIoirDKyjsCiwMcjk82rp/1Ap1NOToClB+0oU1HguMOnXk7KG6vwHymEDoR+ElbkoeYinOv8QdvvFyeJ6IwOATFkHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDew2xHD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDew2xHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778022428; x=1809558428;
  h=date:from:to:cc:subject:message-id;
  bh=riJXBctATI7KYeBNlcLC9E9uJ5Tb+rzeERzmLIl5qMQ=;
  b=QDew2xHDnEf26dcwtPt9+aJ6sKW+qE95d1laGBEZ3bZFIvwcB4wQ+4FY
   VcLID1D1xqIeWlxJoHrTNyK+zxJ7JonxZBDqiQ5yA8mQ1lJOCAz8oehz3
   abdSJy8w1ak97tDf9f41/l6BPEb3tg4ZChSPDgFcNjSloFCCFuqeoABA5
   NY4akHzUTBFfzlHifbPfiikHGT28YbCgkwIPqo8isHZG0Sq4sy+QUZiTF
   vScFQQZ0MZDOEJq7I1bMF75D7t1JbOE7pp+vNE9wJ3WhzAuS8z0xJ6Fg+
   7h+o/Cq9Cxuudjj+VFOEkNjqv+58dBuEzlrmfuRXCYh4noi1HUSYeOxpd
   w==;
X-CSE-ConnectionGUID: giYju286SqKeOBXoSiIrEg==
X-CSE-MsgGUID: MdXU5I+ZTIyJIxMAZxJSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96475622"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="96475622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 16:07:07 -0700
X-CSE-ConnectionGUID: fNqp+COIRxe+xKN7GyooKw==
X-CSE-MsgGUID: VHxZR6spQxiEeQzxBZxfRA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2026 16:07:05 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKOr0-000000000VN-3v6W;
	Tue, 05 May 2026 23:07:02 +0000
Date: Wed, 06 May 2026 07:06:58 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 9/12]
 arch/x86/include/asm/preempt.h:126:25: error: expected string literal in
 'asm'
Message-ID: <202605060617.RUqPcONX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   082cc4c201e4450ff9456c9bd093fd70d103595a
commit: 40c3e04e2248c0e5d78d23e6767a1c58d5678eac [9/12] preempt: x86: Avoid tracking NMI separately when 64BIT=y
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260506/202605060617.RUqPcONX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060617.RUqPcONX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060617.RUqPcONX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:92:
>> arch/x86/include/asm/preempt.h:126:25: error: expected string literal in 'asm'
     126 |         return GEN_UNARY_RMWcc(IS_ENABLED(CONFIG_PREEMPT_LONG) ? "decq":
         |                                ^
   include/linux/kconfig.h:73:28: note: expanded from macro 'IS_ENABLED'
      73 | #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
         |                            ^
   include/linux/kconfig.h:24:22: note: expanded from macro '__or'
      24 | #define __or(x, y)                      ___or(x, y)
         |                                         ^
   include/linux/kconfig.h:25:23: note: expanded from macro '___or'
      25 | #define ___or(x, y)                     ____or(__ARG_PLACEHOLDER_##x, y)
         |                                         ^
   include/linux/kconfig.h:26:65: note: expanded from macro '____or'
      26 | #define ____or(arg1_or_junk, y)         __take_second_arg(arg1_or_junk 1, y)
         |                                                                        ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:


vim +/asm +126 arch/x86/include/asm/preempt.h

   118	
   119	/*
   120	 * Because we keep PREEMPT_NEED_RESCHED set when we do _not_ need to reschedule
   121	 * a decrement which hits zero means we have no preempt_count and should
   122	 * reschedule.
   123	 */
   124	static __always_inline bool __preempt_count_dec_and_test(void)
   125	{
 > 126		return GEN_UNARY_RMWcc(IS_ENABLED(CONFIG_PREEMPT_LONG) ? "decq":
   127				"decl", __my_cpu_var(__preempt_count), e,
   128				__percpu_arg([var]));
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
