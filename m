Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B364249E6;
	Fri, 24 Nov 2023 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAqirF8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700836810; x=1732372810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGj03cQ9srKnBwY21GrlD81qXzpfbPWEtilPFQEIO1I=;
  b=kAqirF8GIlNBzAiQLQyBAPjk7UU9F0zT6LtsOi+nwLNGpfiBsm2tY5KD
   bk0KRwqA8nf6QOPncicOZwiwI4B7OqmSeNaumfi/6KelTO1qCaaxK4pSy
   E1er/m9m09at0kJi5DfrINVan6WMLpW8jtBTytRMavKblQ3xAvJ65ZqWo
   dN7KTw7mS6Wjqmu+ZtjsYPB/vPedMk1bdVjHPmUKZi+nQZBQchUDyBzJT
   00uVmoxq/3G0WvtVMOPxhYawAF66v1+c4Pgn9xLDaIcXzt0JzM0gv9RQn
   NvgaTT2ywOtzJhaBNvfTlru/9Rq+8Re59PI5X8U+RvoyW1S6JlYYq9dbe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="11110358"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="11110358"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911464607"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911464607"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 06:40:07 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6XLh-0002td-2e;
	Fri, 24 Nov 2023 14:40:05 +0000
Date: Fri, 24 Nov 2023 22:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [linux-next:master 2562/2998]
 arch/arm64/kernel/vdso32/vgettimeofday.c:10:5: error: conflicting types for
 '__vdso_clock_gettime'
Message-ID: <202311241540.XRrLFEKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8c9660f6515396aba78d1168d2e17951d653ebf2
commit: 42874e4eb35bdfc54f8514685e50434098ba4f6c [2562/2998] arch: vdso: consolidate gettime prototypes
config: arm64-randconfig-003-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241540.XRrLFEKc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241540.XRrLFEKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241540.XRrLFEKc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/vdso32/vgettimeofday.c:10:5: error: conflicting types for '__vdso_clock_gettime'
      10 | int __vdso_clock_gettime(clockid_t clock,
         |     ^
   include/vdso/gettime.h:16:5: note: previous declaration is here
      16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
         |     ^
>> arch/arm64/kernel/vdso32/vgettimeofday.c:28:5: error: conflicting types for '__vdso_clock_getres'
      28 | int __vdso_clock_getres(clockid_t clock_id,
         |     ^
   include/vdso/gettime.h:15:5: note: previous declaration is here
      15 | int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *res);
         |     ^
   2 errors generated.
   make[3]: *** [arch/arm64/kernel/vdso32/Makefile:149: arch/arm64/kernel/vdso32/vgettimeofday.o] Error 1 shuffle=1846655798
   make[3]: Target 'arch/arm64/kernel/vdso32/vdso.so' not remade because of errors.
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:195: vdso_prepare] Error 2 shuffle=1846655798
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1846655798
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1846655798
   make: Target 'prepare' not remade because of errors.


vim +/__vdso_clock_gettime +10 arch/arm64/kernel/vdso32/vgettimeofday.c

a7f71a2c8903f8 Vincenzo Frascino 2019-06-21   9  
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21 @10  int __vdso_clock_gettime(clockid_t clock,
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  11  			 struct old_timespec32 *ts)
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  12  {
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  13  	return __cvdso_clock_gettime32(clock, ts);
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  14  }
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  15  
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  16  int __vdso_clock_gettime64(clockid_t clock,
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  17  			   struct __kernel_timespec *ts)
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  18  {
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  19  	return __cvdso_clock_gettime(clock, ts);
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  20  }
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  21  
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  22  int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  23  			struct timezone *tz)
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  24  {
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  25  	return __cvdso_gettimeofday(tv, tz);
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  26  }
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  27  
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21 @28  int __vdso_clock_getres(clockid_t clock_id,
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  29  			struct old_timespec32 *res)
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  30  {
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  31  	return __cvdso_clock_getres_time32(clock_id, res);
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  32  }
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  33  

:::::: The code at line 10 was first introduced by commit
:::::: a7f71a2c8903f8599312f75233946287c558d9f6 arm64: compat: Add vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
