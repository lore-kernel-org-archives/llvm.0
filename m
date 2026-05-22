Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB143DA4C;
	Fri, 22 May 2026 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459739; cv=none; b=R4WijJOzj1tOBCqpFxp9H0k/YU6t5tXoQ8NTV/wUiXYQ19Te2JaV1ou9ZizElfb5zKztjiXq4kE1iUyMqlzLlQrPu459d3NfA4kjumhL7LclSIt219+pGHZGvXk3HanMBty7pM6utGFiWael9UI8APu3ZPg5QphNaqdokOAXq/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459739; c=relaxed/simple;
	bh=y1l6YbqWPp/wHjNZ2HHv8R01CN/dHIIO7KLc8WNQoO4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MXWQCrXFHYz60dbQd7ENbbN5IDtgzAsiMXlprg46MCV4M5mT5i7XK/c1SW3vn45yhC+GT/Z8hWoeCRHqW/C/7tsjxZD7/kVxV9grZ9AbJpgsALXo/thvNr9O15hIB6486OxYVy9dlZauMKmooL8gbFyHlH2z8QIz/7k4Y60WjdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcIdCMC+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcIdCMC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779459734; x=1810995734;
  h=date:from:to:cc:subject:message-id;
  bh=y1l6YbqWPp/wHjNZ2HHv8R01CN/dHIIO7KLc8WNQoO4=;
  b=YcIdCMC+EOyVx1ykLQoRXmxW43R5gYScuss8Hy5bDCz4l35FcCegWxg9
   8MpclAe5NLJH846/7x42v//2tfJBv6ehmy6tiBiIj23RonRuxaU0YqYxy
   /pFxJ0fDAvK2yeqTpcGICZwtGAHyA1dww00WJfxrQ9TC8VloRoob38H0T
   QMgUbsAseri8oPXp37uJKvm+psRMpZGL3mws2ZPB+3JVKEQhC3oWppStd
   8mlqqbyBYrlHA0utQbiIuH6fRcjVs7fLjVNNPHZa29naOGC6Hrx7mCUS7
   SGlyJAkqzYR4vOizjw/Xn0nzZTOzMorrfNe0hH7DLccf+bp99zISOHT8l
   A==;
X-CSE-ConnectionGUID: s6y9e9PHTROLH0Umhl3lrg==
X-CSE-MsgGUID: iPkr2Q2aRv6/GklJCrbxwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84273520"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="84273520"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 07:22:09 -0700
X-CSE-ConnectionGUID: ym1oinUYSYu976HHmO3vRg==
X-CSE-MsgGUID: DUxl4mQORiahjlXuvMO22Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245993057"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 May 2026 07:22:08 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQQlJ-000000002X9-3ap3;
	Fri, 22 May 2026 14:22:05 +0000
Date: Fri, 22 May 2026 22:21:13 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kaiser <martin.kaiser@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1010/1130]
 kernel/trace/trace_syscalls.c:527:31: error: incompatible integer to pointer
 conversion passing 'const unsigned int' to parameter of type 'const volatile
 void *'
Message-ID: <202605222246.o2XgRe9T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: ee9b4c9535db95a122f1d56e03c2a4e23396a051 [1010/1130] trace: fix syscall address cast
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605222246.o2XgRe9T-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605222246.o2XgRe9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605222246.o2XgRe9T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace_syscalls.c:2:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:28:
   In file included from include/linux/bpfptr.h:6:
   include/linux/compat.h:1106:9: warning: 'is_compat32_task' macro redefined [-Wmacro-redefined]
    1106 | #define is_compat32_task() is_compat_task()
         |         ^
   arch/sparc/include/asm/compat.h:151:9: note: previous definition is here
     151 | #define is_compat32_task is_compat_task
         |         ^
>> kernel/trace/trace_syscalls.c:527:31: error: incompatible integer to pointer conversion passing 'const unsigned int' to parameter of type 'const volatile void *' [-Wint-conversion]
     527 |         return (unsigned long)__c_pa(sys_call_table[nr]);
         |                                      ^~~~~~~~~~~~~~~~~~
   include/linux/cheri.h:241:29: note: passing argument to parameter 'ptr' here
     241 | __c_pa(const volatile void *ptr)
         |                             ^
   1 warning and 1 error generated.


vim +527 kernel/trace/trace_syscalls.c

   523	
   524	#ifndef ARCH_HAS_SYSCALL_ADDR
   525	unsigned long __init arch_syscall_addr(int nr)
   526	{
 > 527		return (unsigned long)__c_pa(sys_call_table[nr]);
   528	}
   529	#endif
   530	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
