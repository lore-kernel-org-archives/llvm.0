Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33273B8D7C;
	Sat,  6 Dec 2025 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765014595; cv=none; b=n4PvUyqX/SnpKcpaC+qUMDdGXBtncramfmdgXGm5Tr26pWRPYWs34MmpUozp7HC60Ep/gbXJAf8uFqKwwMTKclaez6suP17W74OKXy8jlawe6ZgBXpF9RujAw6M5SaxzsCU3VaCjBceTuhr3TCPTmAT+gPPwbgW55PdlLdfbgUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765014595; c=relaxed/simple;
	bh=+KSjc6xh1M7ucMdvwZzWPRsIJSKrEDN0Ylu3VZasoYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zzr+rEbAWedgp2GciIPePWdNJ43Gf1uKMuFJbspfgWFAN2xqKBCokZnuMzY7I0WTCr5KXu8Kpt4wqaJSQcTBdFDRbetBWTpLfw4oVdv1cNfwfBFsZYXGoWfmWypJf7PgfnCb72XyKiq1zamgkucapH2iTlFXVxgrEXxPmO3d05c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1R1136Q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1R1136Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765014594; x=1796550594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+KSjc6xh1M7ucMdvwZzWPRsIJSKrEDN0Ylu3VZasoYo=;
  b=Y1R1136QUS9hqDGdZXz7xvbN4IY5qzC4rt/QAZdnyfm3RbRvQ7H78D7S
   TnsFjxUIhzaS/R/nbD0YkiCPyr2i7CdAdeoGEvMgxO8i0xlWvPPfPcBNr
   XGJhtRBbK+xs7eQ+adxJyEXGx+O8KKBXcNqUFCvTn7c8zIZKC3VdPExfw
   D9/57N2b11HzHPgZHQvOuSMnVxg7bU41LKgkpUbcElgcQmFtLmSdmqeUS
   vNdgeStY92zzZz2fHOW986Z6onz1IQUrevhmwVbnicxThmAXS0aaVHwge
   wisizjowch9+H557jOqvOsKXTcO9WuAC28Y6lgoLGPJncOXRPOd+39L1V
   g==;
X-CSE-ConnectionGUID: XFw/578jTuKj+8DgWr4ohA==
X-CSE-MsgGUID: MLgzRDrkTVOwqW9LaCM1fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78389327"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78389327"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 01:49:52 -0800
X-CSE-ConnectionGUID: MC/zu5HuSrG892Wxam8DtQ==
X-CSE-MsgGUID: m5POzwDLSBu3o1teUN1N5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="218854535"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Dec 2025 01:49:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRovE-00000000G3J-2KnS;
	Sat, 06 Dec 2025 09:49:48 +0000
Date: Sat, 6 Dec 2025 17:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:lockless-random-v2 4/5] arch/arm/include/asm/cmpxchg.h:260:1:
 error: instruction requires: !armv*m
Message-ID: <202512061708.5jgWJenI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git lockless-random-v2
head:   fb8e9bf37065a1be2dbea93f0325d087d5903226
commit: f9262c3f6085ab01d23f1bff483530df38d9ee42 [4/5] random: Use a lockless fast path for get_random_uXX()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251206/202512061708.5jgWJenI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6d8714b52375b3b7a7f269cd1ec4cc73baece38b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061708.5jgWJenI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061708.5jgWJenI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/random.c:28:
   In file included from include/linux/utsname.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
>> arch/arm/include/asm/cmpxchg.h:260:1: error: instruction requires: !armv*m
     260 | "1:     ldrexd          %1, %H1, [%3]\n"
         | ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         1:      ldrexd          r6, r7, [r1]
         |                 ^
   In file included from drivers/char/random.c:28:
   In file included from include/linux/utsname.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
   arch/arm/include/asm/cmpxchg.h:264:2: error: instruction requires: !armv*m
     264 | "       strexd          %0, %5, %H5, [%3]\n"
         |  ^
   <inline asm>:5:2: note: instantiated into assembly here
       5 |         strexd          r5, r10, r11, [r1]
         |         ^
   In file included from drivers/char/random.c:28:
   In file included from include/linux/utsname.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
>> arch/arm/include/asm/cmpxchg.h:260:1: error: instruction requires: !armv*m
     260 | "1:     ldrexd          %1, %H1, [%3]\n"
         | ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         1:      ldrexd          r6, r7, [r1]
         |                 ^
   In file included from drivers/char/random.c:28:
   In file included from include/linux/utsname.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
   arch/arm/include/asm/cmpxchg.h:264:2: error: instruction requires: !armv*m
     264 | "       strexd          %0, %5, %H5, [%3]\n"
         |  ^
   <inline asm>:5:2: note: instantiated into assembly here
       5 |         strexd          r5, r10, r11, [r1]
         |         ^
   In file included from drivers/char/random.c:28:
   In file included from include/linux/utsname.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
>> arch/arm/include/asm/cmpxchg.h:260:1: error: instruction requires: !armv*m
     260 | "1:     ldrexd          %1, %H1, [%3]\n"
         | ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         1:      ldrexd          r6, r7, [r1]
         |                 ^
   In file included from drivers/char/random.c:28:
   In file included from include/linux/utsname.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
   arch/arm/include/asm/cmpxchg.h:264:2: error: instruction requires: !armv*m
     264 | "       strexd          %0, %5, %H5, [%3]\n"
         |  ^
   <inline asm>:5:2: note: instantiated into assembly here
       5 |         strexd          r5, r10, r11, [r1]
         |         ^
   In file included from drivers/char/random.c:28:
   In file included from include/linux/utsname.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
>> arch/arm/include/asm/cmpxchg.h:260:1: error: instruction requires: !armv*m
     260 | "1:     ldrexd          %1, %H1, [%3]\n"
         | ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         1:      ldrexd          r6, r7, [r5]
         |                 ^
   In file included from drivers/char/random.c:28:
   In file included from include/linux/utsname.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:67:
   In file included from arch/arm/include/asm/bitops.h:245:
   In file included from include/asm-generic/bitops/lock.h:5:
   In file included from include/linux/atomic.h:7:
   In file included from arch/arm/include/asm/atomic.h:16:
   arch/arm/include/asm/cmpxchg.h:264:2: error: instruction requires: !armv*m
     264 | "       strexd          %0, %5, %H5, [%3]\n"
         |  ^
   <inline asm>:5:2: note: instantiated into assembly here
       5 |         strexd          r4, r8, r9, [r5]
         |         ^
   8 errors generated.


vim +260 arch/arm/include/asm/cmpxchg.h

e001bbae7147b1 Russell King 2015-05-26  249  
2523c67bb6962f Will Deacon  2013-10-09  250  static inline unsigned long long __cmpxchg64(unsigned long long *ptr,
2523c67bb6962f Will Deacon  2013-10-09  251  					     unsigned long long old,
2523c67bb6962f Will Deacon  2013-10-09  252  					     unsigned long long new)
2523c67bb6962f Will Deacon  2013-10-09  253  {
2523c67bb6962f Will Deacon  2013-10-09  254  	unsigned long long oldval;
2523c67bb6962f Will Deacon  2013-10-09  255  	unsigned long res;
2523c67bb6962f Will Deacon  2013-10-09  256  
c32ffce0f66e5d Will Deacon  2014-02-21  257  	prefetchw(ptr);
c32ffce0f66e5d Will Deacon  2014-02-21  258  
2523c67bb6962f Will Deacon  2013-10-09  259  	__asm__ __volatile__(
2523c67bb6962f Will Deacon  2013-10-09 @260  "1:	ldrexd		%1, %H1, [%3]\n"
2523c67bb6962f Will Deacon  2013-10-09  261  "	teq		%1, %4\n"
2523c67bb6962f Will Deacon  2013-10-09  262  "	teqeq		%H1, %H4\n"
2523c67bb6962f Will Deacon  2013-10-09  263  "	bne		2f\n"
2523c67bb6962f Will Deacon  2013-10-09  264  "	strexd		%0, %5, %H5, [%3]\n"
2523c67bb6962f Will Deacon  2013-10-09  265  "	teq		%0, #0\n"
2523c67bb6962f Will Deacon  2013-10-09  266  "	bne		1b\n"
2523c67bb6962f Will Deacon  2013-10-09  267  "2:"
2523c67bb6962f Will Deacon  2013-10-09  268  	: "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
2523c67bb6962f Will Deacon  2013-10-09  269  	: "r" (ptr), "r" (old), "r" (new)
2523c67bb6962f Will Deacon  2013-10-09  270  	: "cc");
2523c67bb6962f Will Deacon  2013-10-09  271  
2523c67bb6962f Will Deacon  2013-10-09  272  	return oldval;
2523c67bb6962f Will Deacon  2013-10-09  273  }
2523c67bb6962f Will Deacon  2013-10-09  274  

:::::: The code at line 260 was first introduced by commit
:::::: 2523c67bb6962f98193dce1c73b6efb65a6ea92c ARM: 7852/1: cmpxchg: implement barrier-less cmpxchg64_local

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
