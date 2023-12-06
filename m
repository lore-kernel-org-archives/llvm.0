Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A3F9E6;
	Wed,  6 Dec 2023 04:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwzqXmjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701836019; x=1733372019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6xaiblBdAxvxqPCoYBuGcz3oNlfDtaGe7ghE5KZwfQ=;
  b=bwzqXmjTggcSRBUXO6UBtk6h3Ra3gdFbX3ip+KooAq62FYiJX20x0ZBR
   Q1HMxhGUVeTC4OUd6GqMGtSSq55kmk6V7Bzr9DiT8SmVm46d2+oAzyshr
   HXfUVIrqBDppmDOCKmyf3S13JdlYchzHK5SMAdXqwxFgzWsDI17DDenxd
   VOqXIFzJSYST+QdVFoMfmbVBef4tzayoQPrg4X+HadPOyynWaTIEwneri
   wkbHwaujlTIrfsYVv2b6btRVwmdLFOOo319YT/qs/5Nn+9MYQrRBeqiR9
   xi1YeIRx8j6pv6hoHtBU/FIN7y8miOzFzvEGg+21vCmlsTpUTkBM3sdGG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1096683"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1096683"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 20:13:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774863529"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="774863529"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2023 20:13:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAjHw-000AEw-2c;
	Wed, 06 Dec 2023 04:13:32 +0000
Date: Wed, 6 Dec 2023 12:13:12 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [oracle-dtrace:devel/v2/6.6/dtrace 8/11]
 arch/arm/vdso/vgettimeofday.c:15:9: error: call to undeclared function
 '__cvdso_clock_gettime32'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202312061248.Me86lIls-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel devel/v2/6.6/dtrace
head:   03ef4d82312b48741fbdafdd2aaebf3f0567f9a6
commit: f9d9484f2e95b50c63c6e6bd96d727f6d7ab1f3e [8/11] ctf: generate CTF information for the kernel
config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20231206/202312061248.Me86lIls-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061248.Me86lIls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061248.Me86lIls-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/vdso/vgettimeofday.c:15:9: error: call to undeclared function '__cvdso_clock_gettime32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      15 |         return __cvdso_clock_gettime32(clock, ts);
         |                ^
   arch/arm/vdso/vgettimeofday.c:15:9: note: did you mean '__cvdso_clock_gettime'?
   lib/vdso/gettimeofday.c:266:1: note: '__cvdso_clock_gettime' declared here
     266 | __cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
         | ^
>> arch/arm/vdso/vgettimeofday.c:33:9: error: call to undeclared function '__cvdso_clock_getres_time32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      33 |         return __cvdso_clock_getres_time32(clock_id, res);
         |                ^
   arch/arm/vdso/vgettimeofday.c:33:9: note: did you mean '__cvdso_clock_getres_common'?
   lib/vdso/gettimeofday.c:357:5: note: '__cvdso_clock_getres_common' declared here
     357 | int __cvdso_clock_getres_common(const struct vdso_data *vd, clockid_t clock,
         |     ^
   2 errors generated.


vim +/__cvdso_clock_gettime32 +15 arch/arm/vdso/vgettimeofday.c

8512287a816559 Nathan Lynch      2015-03-25  11  
20e2fc42312f96 Vincenzo Frascino 2019-11-04  12  int __vdso_clock_gettime(clockid_t clock,
20e2fc42312f96 Vincenzo Frascino 2019-11-04  13  			 struct old_timespec32 *ts)
8512287a816559 Nathan Lynch      2015-03-25  14  {
20e2fc42312f96 Vincenzo Frascino 2019-11-04 @15  	return __cvdso_clock_gettime32(clock, ts);
8512287a816559 Nathan Lynch      2015-03-25  16  }
8512287a816559 Nathan Lynch      2015-03-25  17  
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  18  int __vdso_clock_gettime64(clockid_t clock,
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  19  			   struct __kernel_timespec *ts)
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  20  {
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  21  	return __cvdso_clock_gettime(clock, ts);
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  22  }
74d06efb9c2f99 Vincenzo Frascino 2019-11-04  23  
20e2fc42312f96 Vincenzo Frascino 2019-11-04  24  int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
20e2fc42312f96 Vincenzo Frascino 2019-11-04  25  			struct timezone *tz)
8512287a816559 Nathan Lynch      2015-03-25  26  {
20e2fc42312f96 Vincenzo Frascino 2019-11-04  27  	return __cvdso_gettimeofday(tv, tz);
8512287a816559 Nathan Lynch      2015-03-25  28  }
8512287a816559 Nathan Lynch      2015-03-25  29  
052e76a31b4a64 Vincenzo Frascino 2019-11-04  30  int __vdso_clock_getres(clockid_t clock_id,
052e76a31b4a64 Vincenzo Frascino 2019-11-04  31  			struct old_timespec32 *res)
052e76a31b4a64 Vincenzo Frascino 2019-11-04  32  {
052e76a31b4a64 Vincenzo Frascino 2019-11-04 @33  	return __cvdso_clock_getres_time32(clock_id, res);
052e76a31b4a64 Vincenzo Frascino 2019-11-04  34  }
052e76a31b4a64 Vincenzo Frascino 2019-11-04  35  

:::::: The code at line 15 was first introduced by commit
:::::: 20e2fc42312f960f497ac2d617e3742754e1fa5e ARM: 8930/1: Add support for generic vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
