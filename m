Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E819C553;
	Wed, 13 May 2026 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692752; cv=none; b=iKfGG/5jbduibaDj+mOamx64vP2n2h1NMBXkjZJJOm6nQWR036S/V3QByNVHAS6NZ+scI1SQ2a+CN1IyYAGFY8+Fb+ljAJxXU5+tRYjpUwBniUhjIcPVDewJSiyFEmPQ2qgPZdE7jQ15ulC7ySpHkMAp8+BFhJdSYKwdvYoQusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692752; c=relaxed/simple;
	bh=OOxhacNuYWZrkMW4rs5admzePv3lY64uoOJPKRC39Sc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WLDxlWPdiLCj4ebApg2DS2T0hBrDbPJ3NqjmxumBPAbPzCaecIEHpxJjd4avzpuSokBVF52G1cmf0EoXsS45kIc2YBzq4FjSCp1A5n0FMjNRnO5wB0Fv5plPKD50iaAIYhYfauO+H//M+FVkcujXTmWB9sP7HiVMvjIF2kaKXL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5wEVaHH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5wEVaHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778692747; x=1810228747;
  h=date:from:to:cc:subject:message-id;
  bh=OOxhacNuYWZrkMW4rs5admzePv3lY64uoOJPKRC39Sc=;
  b=M5wEVaHHTIdAd4sM0UhPX9LfI+1KkNmLLflg8TG4CwUy0iJCHV8z+ZRj
   fcrV6VwkLDHuFRWTy5n1QsprGdqsHSOybLoI6eGFwByt8UsLuQzDKBMZP
   sMHQIibNka6TfDTn/499Mk+9WpoXO/I20Z57HbZKpzWE3rDbwI/SLdGP3
   yyWq8EEU9gv8GRqNNBMeWe6PuQUCOw4PfIuWlOy2VTfBvmLVtA6gWCShE
   V1Dtj9Q99PJw2mmIpLTeJZLbHWHdJBYhj3yEotRHacz+Ma/tiZFZI0nS7
   7KFM5GAYR2GGkif3lqKsG2f7WGyb4UIcHkDNccFpXgkYRvZheGpA3tT6w
   Q==;
X-CSE-ConnectionGUID: 2sHvMfi/SsCqWOHzl3d2wA==
X-CSE-MsgGUID: t6UTLBE+S/m4m+8QZiSpog==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91090223"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="91090223"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 10:19:04 -0700
X-CSE-ConnectionGUID: RIDjoOBVSxu7EpsEZyHKiA==
X-CSE-MsgGUID: y16ILieaQkOP++abQcRjaA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2026 10:19:03 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNDEa-000000004fb-2tQA;
	Wed, 13 May 2026 17:19:00 +0000
Date: Thu, 14 May 2026 01:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 60/60]
 include/acpi/processor.h:224:2: error: unknown type name 'phys_cpuid_t'
Message-ID: <202605140151.5X5VUqqn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   893faf8dbff9fe0958fb1f32b778914af0fa1b45
commit: 893faf8dbff9fe0958fb1f32b778914af0fa1b45 [60/60] rvtrace: Add ACPI support
config: riscv-randconfig-001-20260513 (https://download.01.org/0day-ci/archive/20260514/202605140151.5X5VUqqn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140151.5X5VUqqn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140151.5X5VUqqn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwtracing/rvtrace/rvtrace-platform.c:15:
>> include/acpi/processor.h:224:2: error: unknown type name 'phys_cpuid_t'
     224 |         phys_cpuid_t phys_id;   /* CPU hardware ID such as APIC ID for x86 */
         |         ^
   include/acpi/processor.h:358:1: error: unknown type name 'phys_cpuid_t'
     358 | phys_cpuid_t acpi_get_phys_id(acpi_handle, int type, u32 acpi_id);
         | ^
   include/acpi/processor.h:359:1: error: unknown type name 'phys_cpuid_t'
     359 | phys_cpuid_t acpi_map_madt_entry(u32 acpi_id);
         | ^
   include/acpi/processor.h:360:20: error: unknown type name 'phys_cpuid_t'
     360 | int acpi_map_cpuid(phys_cpuid_t phys_id, u32 acpi_id);
         |                    ^
   4 errors generated.


vim +/phys_cpuid_t +224 include/acpi/processor.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  220  
^1da177e4c3f41 Linus Torvalds    2005-04-16  221  struct acpi_processor {
^1da177e4c3f41 Linus Torvalds    2005-04-16  222  	acpi_handle handle;
^1da177e4c3f41 Linus Torvalds    2005-04-16  223  	u32 acpi_id;
828aef376d7a12 Catalin Marinas   2015-03-24 @224  	phys_cpuid_t phys_id;	/* CPU hardware ID such as APIC ID for x86 */
af8f3f514d193e Hanjun Guo        2015-01-04  225  	u32 id;		/* CPU logical ID allocated by OS */
^1da177e4c3f41 Linus Torvalds    2005-04-16  226  	u32 pblk;
^1da177e4c3f41 Linus Torvalds    2005-04-16  227  	int performance_platform_limit;
01854e697a77a4 Luming Yu         2007-05-26  228  	int throttling_platform_limit;
ff55a9cebab024 Len Brown         2007-06-02  229  	/* 0 - states 0..n-th state available */
01854e697a77a4 Luming Yu         2007-05-26  230  
^1da177e4c3f41 Linus Torvalds    2005-04-16  231  	struct acpi_processor_flags flags;
^1da177e4c3f41 Linus Torvalds    2005-04-16  232  	struct acpi_processor_power power;
^1da177e4c3f41 Linus Torvalds    2005-04-16  233  	struct acpi_processor_performance *performance;
^1da177e4c3f41 Linus Torvalds    2005-04-16  234  	struct acpi_processor_throttling throttling;
^1da177e4c3f41 Linus Torvalds    2005-04-16  235  	struct acpi_processor_limit limit;
d9460fd227ed2c Zhang Rui         2008-01-17  236  	struct thermal_cooling_device *cdev;
ac212b6980d8d5 Rafael J. Wysocki 2013-05-03  237  	struct device *dev; /* Processor device. */
3000ce3c52f8b8 Rafael J. Wysocki 2019-10-16  238  	struct freq_qos_request perflib_req;
3000ce3c52f8b8 Rafael J. Wysocki 2019-10-16  239  	struct freq_qos_request thermal_req;
^1da177e4c3f41 Linus Torvalds    2005-04-16  240  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  241  

:::::: The code at line 224 was first introduced by commit
:::::: 828aef376d7a129547bc4ebb949965040177e3da ACPI / processor: Introduce phys_cpuid_t for CPU hardware ID

:::::: TO: Catalin Marinas <catalin.marinas@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
