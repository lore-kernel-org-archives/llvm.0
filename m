Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA02EAB64;
	Tue, 17 Jun 2025 18:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186579; cv=none; b=O7BQ9BPUvfjFUc7Q0R7gGnQ3rIX1L+8e1njznQrFwTH8OHMhMYC9TH3uJohBR5xbgAQWaAuqWaDJWZ7BmCVDmlITFeYjTNb21VQvwI6RSozB6fxWvPVErBShLLsPM5meC/QjQKnX9x7Iav3aX0ofgRnjjLYiw1L1g41Cqduo2Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186579; c=relaxed/simple;
	bh=MdOsC0kf5tXQEl0VIPDn2pozaRXh/XVMeWKG9jd6Gic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JIvjYofxRWLUvwq4qK074cqMIvHTm0+Q7+3nrmvKcX3pN+5RHGvsazGBIWh/ZGDWdBwktj0EBFGizU6LcpXf9lXrnap9fkgzxtkAOoe0yWQ459SbRkWwq9W5G8BC9zWtJuxnEqqtc1W/6P2fJpzt+DOqRgUS3+G2TK5GUV7K6B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDycYRXy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDycYRXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750186577; x=1781722577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MdOsC0kf5tXQEl0VIPDn2pozaRXh/XVMeWKG9jd6Gic=;
  b=NDycYRXyxl00ae1l1YWxictbkWF5nuYMH/URBmQAEUz5nOmvfiLE02oT
   b+T+a8NOfUIe5+T73tzdbA2jEQhTd2zsJnR/BDFX6MzndDfaXpljpw0qG
   nqA8g3xq6UIAPg3a06VG2hv9m2MVkALTmlO9XSBvA19fdrBWOh9LeudGp
   xsNYhS3+0Vhslc0XEnxK9HDkls35VFqVpRHJ/G6sISJkcYHf9L0JuO1vv
   FaxEvVwGvuvat8xRVnaj/RiBaMNV1c5EfWZxDjFvNb8EXdWYK/1492sTL
   33up4Di7lg8vkCALX3BHKvXtHqEm53XbfZhZEprxy84H216aUVtkIVqUj
   w==;
X-CSE-ConnectionGUID: j+/ebG9nQ1OaFq8E6VZwhg==
X-CSE-MsgGUID: 7lFdsBfnQ5aLgprCFO8Ryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52084618"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52084618"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 11:56:16 -0700
X-CSE-ConnectionGUID: b2bAfWtRQ2qzEQRxGHPUBg==
X-CSE-MsgGUID: nNY9BVGMTJWFGQ7aolZ+6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="148778108"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jun 2025 11:56:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRbTh-000I0G-1z;
	Tue, 17 Jun 2025 18:56:13 +0000
Date: Wed, 18 Jun 2025 02:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-ptp 41/41]
 kernel/time/../../tools/testing/selftests/timers/auxclock.c:156:9: error:
 variable '_rval' is uninitialized when used here
Message-ID: <202506180223.BOOk5jDK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-ptp
head:   2af36b301dbd31b23e13ee0d9d6cf65a475caba6
commit: 2af36b301dbd31b23e13ee0d9d6cf65a475caba6 [41/41] selftests/timers/auxclock: Test vDSO functionality
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250618/202506180223.BOOk5jDK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180223.BOOk5jDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180223.BOOk5jDK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/time/test_auxclock.c:1:
>> kernel/time/../../tools/testing/selftests/timers/auxclock.c:156:9: error: variable '_rval' is uninitialized when used here [-Werror,-Wuninitialized]
     156 |                 ret = VDSO_CALL(self->vdso_clock_gettime, 2, clockid, &_ts);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/../../tools/testing/selftests/timers/../vDSO/vdso_call.h:59:10: note: expanded from macro 'VDSO_CALL'
      59 |                 : "r" (_rval)                                           \
         |                        ^~~~~
   kernel/time/../../tools/testing/selftests/timers/auxclock.c:156:9: note: variable '_rval' is declared here
   kernel/time/../../tools/testing/selftests/timers/../vDSO/vdso_call.h:47:2: note: expanded from macro 'VDSO_CALL'
      47 |         register long _rval asm ("r3");                                 \
         |         ^
   In file included from kernel/time/test_auxclock.c:1:
   kernel/time/../../tools/testing/selftests/timers/auxclock.c:154:10: error: variable '_rval' is uninitialized when used here [-Werror,-Wuninitialized]
     154 |                 return VDSO_CALL(self->vdso_clock_gettime64, 2, clockid, ts);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/../../tools/testing/selftests/timers/../vDSO/vdso_call.h:59:10: note: expanded from macro 'VDSO_CALL'
      59 |                 : "r" (_rval)                                           \
         |                        ^~~~~
   kernel/time/../../tools/testing/selftests/timers/auxclock.c:154:10: note: variable '_rval' is declared here
   kernel/time/../../tools/testing/selftests/timers/../vDSO/vdso_call.h:47:2: note: expanded from macro 'VDSO_CALL'
      47 |         register long _rval asm ("r3");                                 \
         |         ^
   In file included from kernel/time/test_auxclock.c:1:
   kernel/time/../../tools/testing/selftests/timers/auxclock.c:172:9: error: variable '_rval' is uninitialized when used here [-Werror,-Wuninitialized]
     172 |                 ret = VDSO_CALL(self->vdso_clock_getres, 2, clockid, &_ts);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/time/../../tools/testing/selftests/timers/../vDSO/vdso_call.h:59:10: note: expanded from macro 'VDSO_CALL'
      59 |                 : "r" (_rval)                                           \
         |                        ^~~~~
   kernel/time/../../tools/testing/selftests/timers/auxclock.c:172:9: note: variable '_rval' is declared here
   kernel/time/../../tools/testing/selftests/timers/../vDSO/vdso_call.h:47:2: note: expanded from macro 'VDSO_CALL'
      47 |         register long _rval asm ("r3");                                 \
         |         ^
   3 errors generated.


vim +/_rval +156 kernel/time/../../tools/testing/selftests/timers/auxclock.c

   146	
   147	static int vdso_clock_gettime64(FIXTURE_DATA(auxclock) *self, __kernel_clockid_t clockid,
   148					struct __kernel_timespec *ts)
   149	{
   150		struct timespec _ts;
   151		int ret;
   152	
   153		if (self->vdso_clock_gettime64) {
   154			return VDSO_CALL(self->vdso_clock_gettime64, 2, clockid, ts);
   155		} else if (self->vdso_clock_gettime) {
 > 156			ret = VDSO_CALL(self->vdso_clock_gettime, 2, clockid, &_ts);
   157			if (!ret)
   158				timespec_to_kernel_timespec(&_ts, ts);
   159			return ret;
   160		} else {
   161			return -ENOSYS;
   162		}
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
