Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611017;
	b=SD3ilcDsVt7oRM4TDiVsZ++OGgaCAdeqsVp7YlGnMKq6Aaq18vtEbHMe/dsELgNHrJI+
	 0EvsCepCNSrkubv0L9tl8Y5sPAupfDex6DqYE36vsLeu0sjid8bcclmFmaRc+DbWVwaJz
	 3sqCC7k0wVt4vAKmAN2hxyhu91bp9DdaJe98qhqj+GXC0N5/SEKxZR94kyufuWT4HuBdu
	 hCwY+1PjgTikIsj2OrAgv60rbq7HlLfioEmmAnSsGwd3PgmIRbzaCzenr5kb3mOqxGNyi
	 EGaAuGNFHtD3VkwyXNVniDyDck7zJdGbhkHmTfIx9a5Gy8rArRGV6H4aNl66wDFfbhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611017;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Yym3QEjt3jxkWofEvUChQGupgKslrAhXvv28AePR+sk=;
	b=Chxiu/ZK2ufX81qd56Jqml6aHHrkVVq9RV8TYF04GgX+SktNJXt5wmt77yyvGOKmHtWm
	 AOJO/+BSIHZlEgvwAcGq7b3NMQft2lMH0nXNP1Ztq8r3EHJeqCg0yjXJZQcCisoimQezg
	 8BTNs1j56QRb5puieMT8MP2/PMbQRp4YRrloK5aCJ9c9vRi27GGMuDjdVIVtlT0Y5TFZN
	 28RvSTRHhacwonbfWHwoSeEdSVmP0kgr8XfxiBEM3nKKG2kaX9Cp20nDFwe33V290+JMF
	 y0JVAdhOF3gU3r26VWCnvIprVv23uM63Z9PXShmmTshla4XgDDW3tHiE2BxlkZKVE2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GyjaEwlA;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D1606A334;
	Fri, 13 Nov 2026 23:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947D1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GyjaEwlA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794611014; x=1826147014;
  h=date:from:to:cc:subject:message-id;
  bh=BlaYcxCvpBKwv0ouakc25tqfmVbPl2M3VrYa5qekbdw=;
  b=GyjaEwlAERhEwSr8isBo9j8CAMhO3eg5qeOieIxOqbCEqhoAORbhpk1N
   /00nxivekuC2LVAnkvo1rEmdlB6FkKs99aCPyHJkeI/BePMYN9+W7rT3/
   4lwnuzbEzCENJ8sJSUm4e0YVRfmMw2FehjpoGzWev9bgGsRpF7dvhTNzP
   wrLQgiC1Tyw7wT9ks6kTNyjzFMIJgLYV36nm6CAJuWWE7kkSa0g4cqmcq
   y1A/2hdyqu9hBk5wjOUgwdD5DI1VKI0IFvXhEek2qOYRkMLcasjS3uqGy
   74rNdf5AgkC5xwu/t/1q9Z3d1c6o27UOrLk+bz9fqIwACOHUmNMeiCATl
   A==;
X-CSE-ConnectionGUID: ljumcpWaRYi5TwIzG5eg8Q==
X-CSE-MsgGUID: +KKit3agSKSpwy7stSEuMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3417501"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3417501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 15:03:34 -0800
X-CSE-ConnectionGUID: uiFc+IjPQx+bOoRgjbcdvw==
X-CSE-MsgGUID: eob9fvbwRHaW7wWDNZmpxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9569731"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2026 15:03:32 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS0Ir-000000014KU-18v7;
	Fri, 13 Nov 2026 23:03:29 +0000
Date: Sat, 14 Nov 2026 07:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 416/438]
 arch/arm/mach-mvebu/cpu-reset.c:101:1: error: expected ';' after top level
 declarator
Message-ID: <202611140612.OYIpyuMW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   8ea0e62cf4d68a895e3152c92a5f6ead6d5c9554
commit: 0efee98d1b3338e5fb967e0805d802cdb7953d42 [416/438] fs: Annotate kill_sb() callbacks with __releases(&sb->s_umount)
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261114/202611140612.OYIpyuMW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1b1fed44d3dcca649a9877915d57c3357a98124e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140612.OYIpyuMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140612.OYIpyuMW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-mvebu/cpu-reset.c:101:1: error: expected ';' after top level declarator
     101 | early_initcall(mvebu_cpu_reset_init);
         | ^
   include/linux/init.h:284:29: note: expanded from macro 'early_initcall'
     284 | #define early_initcall(fn)              __define_initcall(fn, early)
         |                                         ^
   include/linux/init.h:277:35: note: expanded from macro '__define_initcall'
     277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^
   include/linux/init.h:275:35: note: expanded from macro '___define_initcall'
     275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |                                          ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <command line>:8:26: note: expanded from macro '__KBUILD_MODNAME'
       8 | #define __KBUILD_MODNAME cpu_reset
         |                          ^
   arch/arm/include/asm/proc-fns.h:137:21: note: expanded from macro 'cpu_reset'
     137 | #define cpu_reset                       PROC_VTABLE(reset)
         |                                         ^
   arch/arm/include/asm/proc-fns.h:126:35: note: expanded from macro 'PROC_VTABLE'
     126 | #define PROC_VTABLE(f)                  processor.f
         |                                                  ^
   1 error generated.


vim +101 arch/arm/mach-mvebu/cpu-reset.c

3f20fb1153b374 Thomas Petazzoni 2014-04-14  100  
3f20fb1153b374 Thomas Petazzoni 2014-04-14 @101  early_initcall(mvebu_cpu_reset_init);

:::::: The code at line 101 was first introduced by commit
:::::: 3f20fb1153b374737acd40d42cb3cab2ae5dae35 ARM: mvebu: introduce CPU reset code

:::::: TO: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
:::::: CC: Jason Cooper <jason@lakedaemon.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
