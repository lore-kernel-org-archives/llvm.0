Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9438E231A23;
	Thu, 21 May 2026 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372035; cv=none; b=bcPywHhtZE3dKGjJc+IBxTFDKmCEuB24K9HIeg3iBXv6G86tEKaUgLxo4n+kEFQDmhIIE6kWNpGvSuQFhP/zJMDd3SyTWI1AyhKmL65dyR+3c7UyhbQW2NXSgTDm3o05osjAmMTtViLQ/pcPQ2vUkEK6wxIXqkdB0JCB3sqKT6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372035; c=relaxed/simple;
	bh=UGxgQW7Vh4Ms3MUzW38FN/IAB06c5faKaXaJOj6wuoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s8lwijrtOY1WizaaJBX0Me2winn2NVmmV5T35j2r11l7pBWT6BADr1/WhjBNkQVXnNALw4c0LSsZZWNe53efXzV+Pxvulic4VdFTDGlbHYKFrVjCdAXaFRE79ve1xuQ15B9gpbZxjIVt1JUVRfRG2EEpq8DCmJJz6ByEhUpuEIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+Zc3Zsc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+Zc3Zsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779372034; x=1810908034;
  h=date:from:to:cc:subject:message-id;
  bh=UGxgQW7Vh4Ms3MUzW38FN/IAB06c5faKaXaJOj6wuoM=;
  b=c+Zc3ZscyqK0YYkmTmQfTcDNSa+miQwE9cNs3Fi0+9cCdkd1OakQmAFr
   YORqigOJaKSJvXRbOePXitTb7bJnbNgbvfkXno2J3/ref8Hf8xlmdFdhj
   3QClmjz/xUIojKBQMoWguJ7nLtzssXcTf5FFT41BoDcNgqM0gozjo//qs
   Q4sWcT1dr2RbCId9hdNYjMagMXrBV0aftClPx5NhjzcnBxmaS3SLof23L
   IJ9muQBv2Q7hJPs4aK7AFPPfgaqy8L39w122Mqk/vxInpNbsXYfrsJ9QD
   3sseKpd0d6manK+TcyL4EaqIdOm3KGu7haztrjojokZZrlLRjvSMymBy3
   Q==;
X-CSE-ConnectionGUID: a3xpwDZrR8e1cZtTHenypQ==
X-CSE-MsgGUID: TSBrig8JTmiKv3y3lK6Vvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91760846"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="91760846"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 07:00:34 -0700
X-CSE-ConnectionGUID: jtJKT7NCRlSKwAadDOiJSw==
X-CSE-MsgGUID: 9C+3SPWhQmGWI3w2DBwosA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="240555182"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2026 07:00:31 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ3wr-000000000OP-00tL;
	Thu, 21 May 2026 14:00:29 +0000
Date: Thu, 21 May 2026 22:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Markus Schneider-Pargmann (The Capable Hub)" <msp@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 2/3]
 arch/x86/kernel/signal_32.c:433:15: error: static assertion failed due to
 requirement '15 == 14': NSIGSEGV == 14
Message-ID: <202605212157.nCb1dWY2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 8b9ecbe3b33ed26fa45de2f3b928df3f6fd1713c [2/3] riscv/mm: Handle CHERI PTE faults
config: x86_64-randconfig-075-20260521 (https://download.01.org/0day-ci/archive/20260521/202605212157.nCb1dWY2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212157.nCb1dWY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212157.nCb1dWY2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/signal_32.c:433:15: error: static assertion failed due to requirement '15 == 14': NSIGSEGV == 14
     433 | static_assert(NSIGSEGV == 14);
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   include/uapi/asm-generic/siginfo.h:248:18: note: expanded from macro 'NSIGSEGV'
     248 | #define NSIGSEGV        15
         |                         ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +433 arch/x86/kernel/signal_32.c

f6e2a56c2bad10 Brian Gerst        2022-12-19  411  
f6e2a56c2bad10 Brian Gerst        2022-12-19  412  /*
f6e2a56c2bad10 Brian Gerst        2022-12-19  413   * The siginfo_t structure and handing code is very easy
f6e2a56c2bad10 Brian Gerst        2022-12-19  414   * to break in several ways.  It must always be updated when new
f6e2a56c2bad10 Brian Gerst        2022-12-19  415   * updates are made to the main siginfo_t, and
f6e2a56c2bad10 Brian Gerst        2022-12-19  416   * copy_siginfo_to_user32() must be updated when the
f6e2a56c2bad10 Brian Gerst        2022-12-19  417   * (arch-independent) copy_siginfo_to_user() is updated.
f6e2a56c2bad10 Brian Gerst        2022-12-19  418   *
f6e2a56c2bad10 Brian Gerst        2022-12-19  419   * It is also easy to put a new member in the siginfo_t
f6e2a56c2bad10 Brian Gerst        2022-12-19  420   * which has implicit alignment which can move internal structure
f6e2a56c2bad10 Brian Gerst        2022-12-19  421   * alignment around breaking the ABI.  This can happen if you,
f6e2a56c2bad10 Brian Gerst        2022-12-19  422   * for instance, put a plain 64-bit value in there.
f6e2a56c2bad10 Brian Gerst        2022-12-19  423   */
f6e2a56c2bad10 Brian Gerst        2022-12-19  424  
f6e2a56c2bad10 Brian Gerst        2022-12-19  425  /*
f6e2a56c2bad10 Brian Gerst        2022-12-19  426  * If adding a new si_code, there is probably new data in
f6e2a56c2bad10 Brian Gerst        2022-12-19  427  * the siginfo.  Make sure folks bumping the si_code
f6e2a56c2bad10 Brian Gerst        2022-12-19  428  * limits also have to look at this code.  Make sure any
f6e2a56c2bad10 Brian Gerst        2022-12-19  429  * new fields are handled in copy_siginfo_to_user32()!
f6e2a56c2bad10 Brian Gerst        2022-12-19  430  */
f6e2a56c2bad10 Brian Gerst        2022-12-19  431  static_assert(NSIGILL  == 11);
f6e2a56c2bad10 Brian Gerst        2022-12-19  432  static_assert(NSIGFPE  == 15);
cdce7a4bdf68ce Christian Ehrhardt 2025-06-11 @433  static_assert(NSIGSEGV == 14);
f6e2a56c2bad10 Brian Gerst        2022-12-19  434  static_assert(NSIGBUS  == 5);
f6e2a56c2bad10 Brian Gerst        2022-12-19  435  static_assert(NSIGTRAP == 6);
f6e2a56c2bad10 Brian Gerst        2022-12-19  436  static_assert(NSIGCHLD == 6);
f6e2a56c2bad10 Brian Gerst        2022-12-19  437  static_assert(NSIGSYS  == 2);
f6e2a56c2bad10 Brian Gerst        2022-12-19  438  

:::::: The code at line 433 was first introduced by commit
:::::: cdce7a4bdf68ce84ffd97a9b30b7cfc73951a674 [CHERRY-PICK] arm64: morello: Handle capability faults

:::::: TO: Christian Ehrhardt <christian.ehrhardt@codasip.com>
:::::: CC: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
