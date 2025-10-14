Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9EB18C933;
	Tue, 14 Oct 2025 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476566; cv=none; b=t1Ty9I3uCX5enPA+5VYdKf7ZlY/QEViEMyipU5Fg/lCCr5aTdhxbQ2QtU3+AAshkcq3702rbyWiSge3/W8FUKcwqtTSsosXFHfNwL1Co3z3Ag3Dfo567sumwDMJ8Ep9r6O52pAgwT0NOOcyJiA0RhJDoKXCxiJHbNLSTStbJkcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476566; c=relaxed/simple;
	bh=KCYdEk+pZaWxHtmeCea2L86jgXjmfC8bX7ddboZCTbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=moAPaCmASyh8YqEp/SPgU8mKBPT/i7QYtc5dWKNF3lgAsTpwNPCtnwM9lWmLB/cdKdeXLGNRsAMbPpcgXTr1JG3NwdBUCJTUpCWXZhYxzx8dGR6HfO0uj0YC/Iquz/eHJVL1voG7d1iWiaVMCCaSzoc55iTm5koH+k7cTAMuYa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tzzvw/Oy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tzzvw/Oy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760476562; x=1792012562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCYdEk+pZaWxHtmeCea2L86jgXjmfC8bX7ddboZCTbs=;
  b=Tzzvw/OydFjanbMJ5v1t67BZULEqN2yQhdQSUglpUVcz8Vf4fyPL4crD
   6HrY1N2U4EezWuwVG8Gf9ElyI9dMGl7AVIGeeRCrjtHRfU86aTYxQ9aPZ
   B1r9hxvpnl2CSmmNeAruEUu2jv+zfCXMZ5kp6iHRDj/D5r/UkSnme+0xl
   AcQYPnupxfPU9tU2QrJRgTSrm6pMZymhX+YI5gsPbjqcZFc8u3MlocDlt
   Qx14RydMD+wnbOc3Ny6kG7tX043DyXcb0IXSq4U173Iw1dUQmIuKn9kaB
   7DnvZYKvPTP2veEoQ+J51onq1rO0rwGU0Vo6radzUD7wqjWphnwewltFl
   Q==;
X-CSE-ConnectionGUID: KLsW+X3lSziR5dT4ZuVDCQ==
X-CSE-MsgGUID: Gs999MF9QRqDt0K7o2yx3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61679131"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="61679131"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 14:16:00 -0700
X-CSE-ConnectionGUID: a/wzEaJHQPCu1GE8M3V7Aw==
X-CSE-MsgGUID: lLKlvUGHShmP9owA3J61/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="181986673"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Oct 2025 14:15:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8mNA-0003CV-26;
	Tue, 14 Oct 2025 21:15:56 +0000
Date: Wed, 15 Oct 2025 05:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: Finn Thain <fthain@linux-m68k.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to-build 6/9] arch/arm64/include/asm/cache.h:69:9:
 error: call to undeclared function '_test_bit'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202510150524.uUhfjhUU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to-build
head:   b24255b1afbf1c9f6fd6e9baaa5ace64e4d2e94c
commit: 598ee66c1329c7278ca1fc694f112db6d9ec50e2 [6/9] atomic: Add option for weaker alignment check
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251015/202510150524.uUhfjhUU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510150524.uUhfjhUU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510150524.uUhfjhUU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:13:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm64/include/asm/bitops.h:25:
   In file included from include/asm-generic/bitops/atomic.h:5:
   In file included from include/linux/atomic.h:82:
   In file included from include/linux/atomic/atomic-instrumented.h:17:
   In file included from include/linux/instrumented.h:11:
   In file included from include/linux/cache.h:6:
   In file included from include/vdso/cache.h:5:
>> arch/arm64/include/asm/cache.h:69:9: error: call to undeclared function '_test_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      69 |         return test_bit(ICACHEF_ALIASING, &__icache_flags);
         |                ^
   include/linux/bitops.h:60:35: note: expanded from macro 'test_bit'
      60 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                               ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/_test_bit +69 arch/arm64/include/asm/cache.h

02f7760e6e5c3d Will Deacon 2017-03-10  62  
02f7760e6e5c3d Will Deacon 2017-03-10  63  /*
02f7760e6e5c3d Will Deacon 2017-03-10  64   * Whilst the D-side always behaves as PIPT on AArch64, aliasing is
02f7760e6e5c3d Will Deacon 2017-03-10  65   * permitted in the I-cache.
02f7760e6e5c3d Will Deacon 2017-03-10  66   */
02f7760e6e5c3d Will Deacon 2017-03-10  67  static inline int icache_is_aliasing(void)
02f7760e6e5c3d Will Deacon 2017-03-10  68  {
02f7760e6e5c3d Will Deacon 2017-03-10 @69  	return test_bit(ICACHEF_ALIASING, &__icache_flags);
02f7760e6e5c3d Will Deacon 2017-03-10  70  }
02f7760e6e5c3d Will Deacon 2017-03-10  71  

:::::: The code at line 69 was first introduced by commit
:::::: 02f7760e6e5c3d726cd9622749cdae17c571b9a3 arm64: cache: Merge cachetype.h into cache.h

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
