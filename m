Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AB9231C91;
	Fri, 22 May 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448319; cv=none; b=H/kG9AlR+xzh7X8VGzEr2SAYqGEMmKYoUVEH2XR7Bj0KX0JGdPtceq10J2wLGQ74ZcgTC2374ixZUsnnRhN6pX45DlxMS1nvUBRGSXiWVc3nJ8Z5OIWHxCeOvKgXrZ5tR4D/wjHsFJWGgMSbCqm+GsbFJ+UyZtUDwwWVS4tpHWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448319; c=relaxed/simple;
	bh=ahSVhKuT4Idv2eFzLcr+39LTDwUS8mkT32nTdP+ZUJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=atZkAQZBlFmBz5ZEz6eONqv6Rv9yF05pvZ+bbfXix7cmWcKnhD0HvSC3vDn592jMRaFzkEyfrWAy+oHP8jaZ34BdH6otR7O1vbHBoT1RE1t4D87MM0kuh0WEhV2GSf8pNB3orPC4TJO+GVl1DuPHdZAOAkFZ1+CpLVwhAAGvsUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPxJJvQe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPxJJvQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779448318; x=1810984318;
  h=date:from:to:cc:subject:message-id;
  bh=ahSVhKuT4Idv2eFzLcr+39LTDwUS8mkT32nTdP+ZUJ0=;
  b=bPxJJvQebjMlUHgATcceFyoqpqMW43/oZzud2X2u3HXg3KAJ6909HbXp
   kb0WV1d38buPYjQh8+zYk+qcIvpXzr6g7edkHG4GQu3oF7bPhEKmSKtj1
   cLho4tp5ek7VB9PZsqT5H4hfrlBHD2lY6OCDckDCOQ7X9gd6gwmDdgQS7
   vqkauqW2woxgO8RWOQMjXHGd+B6sP9Lmu8aeL0eRIjzeLQrPNvLcH1Q2a
   lI7FxxR+V22VgueiaqhKBVY2PQ/RD/pOSbCXLF8wYBhHnyPGQFhtnd5qc
   6AuL96VYki1RkoVM3BVLQXtnqtNxusPIbTZ9KfQJwPIBtY8IeTSiGJCEv
   g==;
X-CSE-ConnectionGUID: kqVLWq1VQKyKlJSs0cQYuA==
X-CSE-MsgGUID: rxolZleMQDOMru70oiLA3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90675553"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="90675553"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:11:57 -0700
X-CSE-ConnectionGUID: CGeQNZbLQcWik13gjB1WDg==
X-CSE-MsgGUID: 9TkvZTs7SFm0SgrazmruOQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 May 2026 04:11:54 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQNnE-000000002H7-2YAw;
	Fri, 22 May 2026 11:11:52 +0000
Date: Fri, 22 May 2026 19:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Markus Schneider-Pargmann (The Capable Hub)" <msp@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 2/3]
 arch/arm64/kernel/signal.c:1889:15: error: static assertion failed due to
 requirement '15 == 14': NSIGSEGV == 14
Message-ID: <202605221939.Hwr5MeAT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: ca19e2e72e8fbd0b87fde805dcf8ffd98137be57 [2/3] riscv/mm: Handle CHERI PTE faults
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605221939.Hwr5MeAT-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221939.Hwr5MeAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221939.Hwr5MeAT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/signal.c:1889:15: error: static assertion failed due to requirement '15 == 14': NSIGSEGV == 14
    1889 | static_assert(NSIGSEGV  == 14);
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
   1 error generated.
--
>> arch/arm64/kernel/signal32.c:466:15: error: static assertion failed due to requirement '15 == 14': NSIGSEGV == 14
     466 | static_assert(NSIGSEGV  == 14);
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
   1 error generated.


vim +1889 arch/arm64/kernel/signal.c

726e337b645478 Marco Elver           2021-04-29  1882  
726e337b645478 Marco Elver           2021-04-29  1883  /*
726e337b645478 Marco Elver           2021-04-29  1884   * Compile-time assertions for siginfo_t offsets. Check NSIG* as well, as
726e337b645478 Marco Elver           2021-04-29  1885   * changes likely come with new fields that should be added below.
726e337b645478 Marco Elver           2021-04-29  1886   */
726e337b645478 Marco Elver           2021-04-29  1887  static_assert(NSIGILL	== 11);
726e337b645478 Marco Elver           2021-04-29  1888  static_assert(NSIGFPE	== 15);
c983e4d4366b0d Christian A. Ehrhardt 2026-04-28 @1889  static_assert(NSIGSEGV	== 14);
726e337b645478 Marco Elver           2021-04-29  1890  static_assert(NSIGBUS	== 5);
726e337b645478 Marco Elver           2021-04-29  1891  static_assert(NSIGTRAP	== 6);
726e337b645478 Marco Elver           2021-04-29  1892  static_assert(NSIGCHLD	== 6);
726e337b645478 Marco Elver           2021-04-29  1893  static_assert(NSIGSYS	== 2);
50ae81305c7a3e Eric W. Biederman     2021-05-04  1894  static_assert(sizeof(siginfo_t) == 128);
d7027ccdac7596 Christian A. Ehrhardt 2026-04-28  1895  

:::::: The code at line 1889 was first introduced by commit
:::::: c983e4d4366b0de24bcdcbb56ccb519146f364c7 [CHERRY-PICK] arm64: morello: Handle capability faults

:::::: TO: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>
:::::: CC: Christian A. Ehrhardt <christian.ehrhardt@codasip.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
