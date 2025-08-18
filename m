Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4535179CF;
	Mon, 18 Aug 2025 00:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755475350; cv=none; b=B313NhQXjCu5jCNiNUrHZ15Qnd5Bf7dLYVe5MTqVpm2MMbW4aUpFxy+CbVZubhrJeRYtjRk3orDrWkww0ZGNPrssuzt5WGYZj6jfV9v0WE+1hu50dO4PYPy8vCKenFz+Qv/mvQUaoEkqeWSniMgBOiXy3mT9LOGz0hQsbuMXs5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755475350; c=relaxed/simple;
	bh=Y/Es8OFfCE/gXYxcxE6JREjB4BeQn7Y/c6ahehdhfts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=redYYt8Bcl/Uvf9+NKp2u3DbvlZ6SnUN7u63q82vwUf9KPyUwoTfOjaEBFH4ZVpPpEwJSgnApspTsFc++wmWAJnOdctWZNciPvzmTSRfij2EaBn/SgjP8PAmLkh0TJKdHUnP3orYS89z8tSiQ/7q9AEn2hut2fXIdre9fr4/jKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iV0MAPUa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iV0MAPUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755475348; x=1787011348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/Es8OFfCE/gXYxcxE6JREjB4BeQn7Y/c6ahehdhfts=;
  b=iV0MAPUapEiFg1N8lgGKx+8kZO19L571oREfrUrAkjTU30kFg3bHhpBl
   8pqtQDlwwvY+rHM0gja7IZ1+3niZFEIWBG1gD760qIGzXYdAkx/ayoNy3
   czX0sQHHWcjeWa/WCd6RFEZyBVQFEQDuC4VT9Y2Y9lskVOLYHVmAF79ri
   RrzcHKSgpdUYT9Uqyo/r2wI5JUC/bRmlDlKhWnZb4Kp4L1br36dBi8HaE
   uIJ6bIw78VERrvITF8FdeW7pCZcoFNapepC0d2mdSrljNhqEn8Fmz1jP2
   SNRyGKB77Tj9T7AzxRwOORV+Ff7gAOnAH6+Bt8R68ROTxUgf2V30OjSkU
   g==;
X-CSE-ConnectionGUID: k4Wwt2xoSzSqPKAjRqZIgw==
X-CSE-MsgGUID: j/OpSCkHRkyFFwpgbpEQkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68298072"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68298072"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 17:02:28 -0700
X-CSE-ConnectionGUID: HSSz/g3WS8O0mwfbJZ9q+g==
X-CSE-MsgGUID: RyYBiT+ySOiicHO0o7N+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167051873"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Aug 2025 17:02:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unnKR-000Dmv-30;
	Mon, 18 Aug 2025 00:02:23 +0000
Date: Mon, 18 Aug 2025 08:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [jfern:rust-spinlock-irq 2/21]
 arch/s390/include/asm/preempt.h:109:15: error: invalid operands to binary
 expression ('int' and 'void')
Message-ID: <202508180731.63jpKYCj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rust-spinlock-irq
head:   5b23adbb23dac965774935c047cc510bfaaa91c5
commit: 0c303a0d1f2100cb288a6ec2bc374c899c9d0cbf [2/21] preempt: Introduce __preempt_count_{sub, add}_return()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250818/202508180731.63jpKYCj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180731.63jpKYCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180731.63jpKYCj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:9:
   In file included from include/linux/sched.h:13:
   In file included from arch/s390/include/asm/processor.h:33:
   In file included from include/linux/irqflags.h:19:
   In file included from arch/s390/include/asm/percpu.h:5:
   In file included from include/linux/preempt.h:85:
>> arch/s390/include/asm/preempt.h:109:15: error: invalid operands to binary expression ('int' and 'void')
     109 |                         return val + __atomic_add_const(val, &get_lowcore()->preempt_count);
         |                                ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:14:
   In file included from arch/s390/include/asm/stacktrace.h:7:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     116 |                         (set1->sig[1] == set2->sig[1]) &&
         |                                          ^         ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here


vim +109 arch/s390/include/asm/preempt.h

   100	
   101	static __always_inline int __preempt_count_add_return(int val)
   102	{
   103		/*
   104		 * With some obscure config options and CONFIG_PROFILE_ALL_BRANCHES
   105		 * enabled, gcc 12 fails to handle __builtin_constant_p().
   106		 */
   107		if (!IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES)) {
   108			if (__builtin_constant_p(val) && (val >= -128) && (val <= 127)) {
 > 109				return val + __atomic_add_const(val, &get_lowcore()->preempt_count);
   110			}
   111		}
   112		return val + __atomic_add(val, &get_lowcore()->preempt_count);
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
