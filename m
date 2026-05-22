Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5E32D8379;
	Fri, 22 May 2026 03:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779421334; cv=none; b=NWK3zeOmALbG19LsU6oxuGCKpxjgmmJ5zsEqjYzeYyxatlpuMBSe17VdgdYVJMUzWAJCAllh+cE+7OHsFH6ulOyMBwUmoLo488E2jaeaeaAAX9pBpJkFzpPDWhrxma+hJeJdkUPFOYHwuUgjHgPhcda8WbdFtXIBzKN3J7BOnmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779421334; c=relaxed/simple;
	bh=u2KLox+voJWGQ1F3rmFdHWF4Rxr9+MGRC9XykveOx7s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k/Yq0Lbxx6hmIJ23oW06vEmu6oovEKToqgJa5/7BdJbmVTT4wFnIZDQ9i5tQhDeglGkBuxmSUXMw+1ij93eGrgvk3nYe37873/0xwuaqcf6dkkVhKVvvaEngXQ/Dmq8yJ7evdPwTHrPLU5YX5TPd1dmBeaH+MPj35M9qwUMeZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avo+VaEl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avo+VaEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779421332; x=1810957332;
  h=date:from:to:cc:subject:message-id;
  bh=u2KLox+voJWGQ1F3rmFdHWF4Rxr9+MGRC9XykveOx7s=;
  b=avo+VaEl8SK7N49VAT4rsCEvZhlNjeS1zh/CFQEpmY24Jo49kIXyyfon
   GaL58N6/Ae5MUtOA9/TTJWXPHSGOCu5N9D8yedyCrqdnpfHJAUn694ki0
   H4mBin/vSddGqYA8mB9znAUryq4S+xVVNm4o60KPyoFHDINlrbHm1qO4s
   +SKT0lm3SoUbuRiI3GZmfuDq7h2F4/EPLoz5jbnBlULNQANEE88Ex9/za
   bhgRl3v6HMYXuFlpogwE6nhHrMMzoXgl3lmiiF5J/o4cWJQ5RxOEo5J98
   RHz7t2OlhsIf9EXaYAV6Z7MccXi/HjsRYrl2vw5JZfvYIQyl/skgnA2xP
   g==;
X-CSE-ConnectionGUID: z5I/ksqLRNewWdKbWUOuCw==
X-CSE-MsgGUID: SCCrB+ldQcyjIvZay+Xo1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="82928101"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="82928101"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 20:42:11 -0700
X-CSE-ConnectionGUID: ril4dLV8Rqqrj97aKUaOtg==
X-CSE-MsgGUID: Fx8idb85Q5iULGSCvFgU/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="245053274"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2026 20:42:09 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQGlz-000000001eN-0hQE;
	Fri, 22 May 2026 03:42:07 +0000
Date: Fri, 22 May 2026 11:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Markus Schneider-Pargmann (The Capable Hub)" <msp@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 2/3]
 arch/arm/kernel/signal.c:686:15: error: static assertion failed due to
 requirement '15 == 14': NSIGSEGV == 14
Message-ID: <202605221148.JmnyEEfk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: ca19e2e72e8fbd0b87fde805dcf8ffd98137be57 [2/3] riscv/mm: Handle CHERI PTE faults
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260522/202605221148.JmnyEEfk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221148.JmnyEEfk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221148.JmnyEEfk-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/signal.c:143:15: warning: variable 'aux' set but not used [-Wunused-but-set-variable]
     143 |         char __user *aux;
         |                      ^
>> arch/arm/kernel/signal.c:686:15: error: static assertion failed due to requirement '15 == 14': NSIGSEGV == 14
     686 | static_assert(NSIGSEGV  == 14);
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/uapi/asm-generic/siginfo.h:248:18: note: expanded from macro 'NSIGSEGV'
     248 | #define NSIGSEGV        15
         |                         ^
   include/linux/build_bug.h:79:50: note: expanded from macro 'static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: expanded from macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/arm/kernel/signal.c:27:22: warning: variable 'signal_return_offset' set but not used [-Wunused-but-set-global]
      27 | static unsigned long signal_return_offset;
         |                      ^
   2 warnings and 1 error generated.


vim +686 arch/arm/kernel/signal.c

56516a42f2f1af Marco Elver           2021-04-29  679  
56516a42f2f1af Marco Elver           2021-04-29  680  /*
56516a42f2f1af Marco Elver           2021-04-29  681   * Compile-time assertions for siginfo_t offsets. Check NSIG* as well, as
56516a42f2f1af Marco Elver           2021-04-29  682   * changes likely come with new fields that should be added below.
56516a42f2f1af Marco Elver           2021-04-29  683   */
56516a42f2f1af Marco Elver           2021-04-29  684  static_assert(NSIGILL	== 11);
56516a42f2f1af Marco Elver           2021-04-29  685  static_assert(NSIGFPE	== 15);
c983e4d4366b0d Christian A. Ehrhardt 2026-04-28 @686  static_assert(NSIGSEGV	== 14);

:::::: The code at line 686 was first introduced by commit
:::::: c983e4d4366b0de24bcdcbb56ccb519146f364c7 [CHERRY-PICK] arm64: morello: Handle capability faults

:::::: TO: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>
:::::: CC: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
