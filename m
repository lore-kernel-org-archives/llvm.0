Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF72D34B1A3;
	Tue,  7 Jul 2026 18:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783449067; cv=none; b=i3lQceHsPob2KkSaz+Npvoub3812yr7NZIzYITjUevOj1OfKnNP1r/RLk6bar2FIBveKriueZVLBWX3bYZDFru7MN53XXy5kue3YztknKQtF2Zx1bv0nzTlqbtDSwKByVnWnmNJqcdn1GiPPR0pTnBnTw2U+oSWdxsZQAZAeWSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783449067; c=relaxed/simple;
	bh=xyLiC1Mxei9/XpWir9Y65Ho+I8GXJyHl2yKOusLk7aE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Hr+KksDCKJx7aHmirOsRPZDRrnB85uSs+M4EwDVu2wV1WdXlWq0Cr0RooH4iuCE9+bj8yjdJEihXM0gJBUTzNuX64Eab0zBCgQtxI2H/RoQMrfz1QDiMj4DSbHVXhLQJqdF9eBqcFiZw+Vx6ySBlgnaP9ndQntpwrE0mweQOXLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8V2kOzl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8V2kOzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783449065; x=1814985065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xyLiC1Mxei9/XpWir9Y65Ho+I8GXJyHl2yKOusLk7aE=;
  b=N8V2kOzlbAfZhyBaPNTFV7lyR+JiYBgDKRs6cgnaYAf3vK+yt5c58cQL
   qxgvg3sQeO6aSV1XKaFPzz2LGTbETQVt5CZK7uPPhHX4ZvoIUEcVxrBWl
   vzftbAhIKBO6yF41O+3kvs7o4Ch8H7uR9T/P3hphBkLHe/IKDSkTWwZBO
   ELMCxha6Q190GWjx31bZHbUbNRt9YOgxuN28hVbF+Ge6kaGD2Q65u+Ivn
   tuEx1vQrkbnn9oZheMzXnA73BQq0dm9lEizLRvWOSSvrhWZELz81XjH/V
   Hcb1aJPhazjj17EebDwdAMJz/SxHlG0YaeFuVNPa/hZrqyC8oUXYjj1nx
   w==;
X-CSE-ConnectionGUID: 8tLiP311RcGUFoOHwYySyg==
X-CSE-MsgGUID: AZUxLALBQKSLqSJ4l2QiJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84161128"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84161128"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 11:31:04 -0700
X-CSE-ConnectionGUID: FhoXgeHTQK+QkePPK4aq7w==
X-CSE-MsgGUID: VhU86E7PSGmQJoaAx920jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250713317"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jul 2026 11:31:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whAZP-00000000FZb-34Pm;
	Tue, 07 Jul 2026 18:30:59 +0000
Date: Wed, 08 Jul 2026 02:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sysfs 2/2]
 arch/x86/include/asm/asm-offsets.h:1:10: fatal error:
 'generated/asm-offsets.h' file not found
Message-ID: <202607080233.LnYBhKdu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-sysfs
head:   8ae6b40fd6f555925afd049732cb12e502f22a4d
commit: 8ae6b40fd6f555925afd049732cb12e502f22a4d [2/2] vDSO, kbuild: Provide debug variants of vDSO at runtime
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607080233.LnYBhKdu-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080233.LnYBhKdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080233.LnYBhKdu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:1:
   In file included from arch/x86/entry/vdso/vdso32/../common/vclock_gettime.c:11:
   In file included from include/linux/time.h:6:
   In file included from include/linux/math64.h:6:
   In file included from include/linux/math.h:6:
   In file included from arch/x86/include/asm/div64.h:8:
   In file included from include/linux/log2.h:12:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/x86/include/asm/barrier.h:5:
   In file included from arch/x86/include/asm/alternative.h:8:
   In file included from arch/x86/include/asm/asm.h:130:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: 'generated/asm-offsets.h' file not found
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/entry/vdso/vdso32/vgetcpu.c:1:
   In file included from arch/x86/entry/vdso/vdso32/../common/vgetcpu.c:8:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/x86/include/asm/barrier.h:5:
   In file included from arch/x86/include/asm/alternative.h:8:
   In file included from arch/x86/include/asm/asm.h:130:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: 'generated/asm-offsets.h' file not found
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/entry/vdso/vdso64/vclock_gettime.c:1:
   In file included from arch/x86/entry/vdso/vdso64/../common/vclock_gettime.c:11:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:5:
   In file included from arch/x86/include/asm/processor.h:5:
   In file included from arch/x86/include/asm/processor-flags.h:6:
   In file included from include/linux/mem_encrypt.h:17:
   In file included from arch/x86/include/asm/mem_encrypt.h:18:
   In file included from arch/x86/include/asm/asm.h:130:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: 'generated/asm-offsets.h' file not found
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:289: arch/x86/entry/vdso/vdso32/vgetcpu.o] Error 1
   In file included from arch/x86/entry/vdso/vdso64/vgetrandom.c:7:
   In file included from lib/vdso/getrandom.c:12:
   In file included from arch/x86/include/asm/barrier.h:5:
   In file included from arch/x86/include/asm/alternative.h:8:
   In file included from arch/x86/include/asm/asm.h:130:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: 'generated/asm-offsets.h' file not found
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/entry/vdso/vdso32/system_call.S:9:
   In file included from arch/x86/include/asm/alternative.h:8:
   In file included from arch/x86/include/asm/asm.h:130:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: 'generated/asm-offsets.h' file not found
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   In file included from arch/x86/entry/vdso/vdso64/vgetrandom-chacha.S:7:
   In file included from arch/x86/include/asm/frame.h:5:
   In file included from arch/x86/include/asm/asm.h:130:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: 'generated/asm-offsets.h' file not found
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/entry/vdso/vdso64/vgetcpu.c:1:
   In file included from arch/x86/entry/vdso/vdso64/../common/vgetcpu.c:8:
   In file included from include/linux/kernel.h:23:
   In file included from include/linux/bitops.h:28:
   In file included from include/asm-generic/bitops/generic-non-atomic.h:7:
   In file included from arch/x86/include/asm/barrier.h:5:
   In file included from arch/x86/include/asm/alternative.h:8:
   In file included from arch/x86/include/asm/asm.h:130:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: 'generated/asm-offsets.h' file not found
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:435: arch/x86/entry/vdso/vdso32/system_call.o] Error 1
   1 error generated.
   make[3]: *** [scripts/Makefile.build:435: arch/x86/entry/vdso/vdso64/vgetrandom-chacha.o] Error 1
   In file included from arch/x86/entry/vdso/vdso32/sigreturn.S:5:
>> arch/x86/include/asm/asm-offsets.h:1:10: fatal error: 'generated/asm-offsets.h' file not found
       1 | #include <generated/asm-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   1 error generated.
   make[3]: *** [scripts/Makefile.build:435: arch/x86/entry/vdso/vdso32/sigreturn.o] Error 1
   make[3]: *** [scripts/Makefile.build:289: arch/x86/entry/vdso/vdso64/vgetrandom.o] Error 1
   1 error generated.
   make[3]: *** [scripts/Makefile.build:289: arch/x86/entry/vdso/vdso64/vgetcpu.o] Error 1
   1 error generated.
   1 error generated.
   make[3]: *** [scripts/Makefile.build:289: arch/x86/entry/vdso/vdso32/vclock_gettime.o] Error 1
   make[3]: Target 'arch/x86/entry/vdso/vdso32/vdso32.so.dbg' not remade because of errors.
   make[2]: *** [Makefile:1551: arch/x86/entry/vdso/vdso32/vdso32.so.dbg] Error 2
   make[3]: *** [scripts/Makefile.build:289: arch/x86/entry/vdso/vdso64/vclock_gettime.o] Error 1
   make[3]: Target 'arch/x86/entry/vdso/vdso64/vdso64.so.dbg' not remade because of errors.
   make[2]: *** [Makefile:1551: arch/x86/entry/vdso/vdso64/vdso64.so.dbg] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1 arch/x86/include/asm/asm-offsets.h

559df2e0210352 Sam Ravnborg 2009-04-19 @1  #include <generated/asm-offsets.h>

:::::: The code at line 1 was first introduced by commit
:::::: 559df2e0210352f83926d178c40c51142292a18c kbuild: move asm-offsets.h to include/generated

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: Michal Marek <mmarek@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
