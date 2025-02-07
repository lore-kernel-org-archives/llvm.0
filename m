Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0651DE3C8;
	Fri,  7 Feb 2025 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922869; cv=none; b=r8i0RtqxHOWEZEcNIebPnTJrJMWabIRLzdxJMsCiK5kS9UsefyhyYti0JG1RVSnPPblMJXr4NbKMvDEWV4PxPwwT1yvpwKfIXu4navX/KGaSKG2fBXqOUOk8liaXQj1kb2TyyDgy5I7etbQrGACHdwlAEHHi2Wd8vUNcy+zQ2tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922869; c=relaxed/simple;
	bh=XL0IJW5a4y1LzhEgC38elGMlUF7t/oaBOUq7liVSjpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cS5G67t8pL6Q81553g4jB1scy18OoBEISVdeEmvv3G1uHSr+OpFN1AOeGbnCQd+m73KEB5UqzI4hNBx57Bf7yReh/Wxo5X6OP0HLntaUQhYc1Ho/Z4VLK9PpPmTU7pJUaecL/8VoK74BRoFGC6Qq8dStUEH4hqDdDwrxlfby8kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEd1Utbk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEd1Utbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738922867; x=1770458867;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XL0IJW5a4y1LzhEgC38elGMlUF7t/oaBOUq7liVSjpg=;
  b=GEd1Utbk48LOPwQatcQsYZCqDG9jVFR2lISgK/UlsszYBVzkxGoBMDnj
   fkhasXelQ9EMx/wp02nk8l9cW43Q937chXJggZSLHBTq49i5Ram1J+rPD
   ITy0QHtIRJ2L9+CxJpOh7ct0wxEATinvfUoJKDcJ/u+cXtfjSZhtSqW4e
   YtJ0L/xL6YX0rOfPltMQgoijclGhxySNfrbsriMvb9p02ZHenR/92HwUs
   JBXsniJJMSJ7iUA4TCvsyrRA9/qIe6L8KZ4gm4RHoKNy/V7klhuHNzKDy
   Gs+onmTbNXu1hsVytZerrMhUqF1u/fONzPDI7kWHP5jfp7CnetcDTt5xq
   Q==;
X-CSE-ConnectionGUID: Ur8H2O91QXK8Bwsn/LpCtA==
X-CSE-MsgGUID: 2TO5Bn0TSM+Ue28NnrZF8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50949545"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="50949545"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 02:07:46 -0800
X-CSE-ConnectionGUID: YyKKCJV8Q/Ox7Oea/Q1S1g==
X-CSE-MsgGUID: INUb7QUYTUCrMHHSNFTkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142361515"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Feb 2025 02:07:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgLGw-000y8d-17;
	Fri, 07 Feb 2025 10:07:42 +0000
Date: Fri, 7 Feb 2025 18:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_misc_fixes_v1 64/68] include/linux/riscv_sse.h:40:9:
 error: call to undeclared function 'ERR_PTR'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202502071805.TxL0wcDb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_misc_fixes_v1
head:   f0b453b30038af57df379934d55e6b73af29f50f
commit: cd9c923a931cd68bb0ca73ccfca94d88d51b35e6 [64/68] riscv: Introduce HEST SSE notification handlers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250207/202502071805.TxL0wcDb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071805.TxL0wcDb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071805.TxL0wcDb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
>> include/linux/riscv_sse.h:40:9: error: call to undeclared function 'ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^
>> include/linux/riscv_sse.h:40:18: error: use of undeclared identifier 'EOPNOTSUPP'
      40 |         return ERR_PTR(-EOPNOTSUPP);
         |                         ^
   include/linux/riscv_sse.h:48:10: error: use of undeclared identifier 'EOPNOTSUPP'
      48 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sse.h:53:10: error: use of undeclared identifier 'EOPNOTSUPP'
      53 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sse.h:61:10: error: use of undeclared identifier 'EOPNOTSUPP'
      61 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sse.h:66:10: error: use of undeclared identifier 'EOPNOTSUPP'
      66 |         return -EOPNOTSUPP;
         |                 ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:60:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/x86/include/asm/thread_info.h:59:
   In file included from arch/x86/include/asm/cpufeature.h:5:
   In file included from arch/x86/include/asm/processor.h:36:
>> include/linux/err.h:39:35: error: static declaration of 'ERR_PTR' follows non-static declaration
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                   ^
   include/linux/riscv_sse.h:40:9: note: previous implicit declaration is here
      40 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:


vim +/ERR_PTR +40 include/linux/riscv_sse.h

d32a860341afc8 Clément Léger    2024-12-06  31  
27dc1f134b3612 Himanshu Chauhan 2023-10-26  32  int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
27dc1f134b3612 Himanshu Chauhan 2023-10-26  33  		      sse_event_handler *hi_cb);
27dc1f134b3612 Himanshu Chauhan 2023-10-26  34  int sse_unregister_ghes(struct ghes *ghes);
d32a860341afc8 Clément Léger    2024-12-06  35  #else
d32a860341afc8 Clément Léger    2024-12-06  36  static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
d32a860341afc8 Clément Léger    2024-12-06  37  						   sse_event_handler *handler,
d32a860341afc8 Clément Léger    2024-12-06  38  						   void *arg)
d32a860341afc8 Clément Léger    2024-12-06  39  {
d32a860341afc8 Clément Léger    2024-12-06 @40  	return ERR_PTR(-EOPNOTSUPP);
d32a860341afc8 Clément Léger    2024-12-06  41  }
d32a860341afc8 Clément Léger    2024-12-06  42  

:::::: The code at line 40 was first introduced by commit
:::::: d32a860341afc8f2002e3df3c3135d6a337b28b8 drivers: firmware: add riscv SSE support

:::::: TO: Clément Léger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
