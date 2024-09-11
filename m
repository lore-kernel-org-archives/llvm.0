Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABBA185B6F;
	Wed, 11 Sep 2024 10:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051371; cv=none; b=Rn8ULV7XXAavN8U3mEChmKnDTMvBRgAYjS8pLKNeQcuAjS/+vohC0c0ZMDBEHPapgED1DDEmAOZd2Pr7xuVCXwnGe+6/FK4k5pyvNxi1pMAn0ne8UZsUHqg32is+beTNOWyiyjfLmyWtuzxsFNsVAWpvz9rYcWYOktkkxgHpRxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051371; c=relaxed/simple;
	bh=+ykjokv8sLQ+qsBU3JFek08gdSun4GA/pZVAQZXSuCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1U4ArShfUeCcIKCCDA71ubm1vSMYfQo0qxsUJ07xllakJQucRiz0tBl/K0iviwmayFSMe9VM1i90SOVK6Ub37ZcepObRJ295/o/EPDelfvATJO7LI0t3nUKb0b9XI7tRFqZfJgWlNHfRJ7ExJ/OserZuXCUemef7EsvjV2+zps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBGjvXkH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBGjvXkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726051369; x=1757587369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ykjokv8sLQ+qsBU3JFek08gdSun4GA/pZVAQZXSuCc=;
  b=jBGjvXkHE7cpHge2+yqE92BX8d7GW1D2Z6sNNlrpE3WLR+MxlMeN/et7
   NeCx9t3SKipXRGmU+DaC7w8GCoJf0qPo5C5fOkyFW/VmKKdw+IlCdhY7c
   OvKTo/YKzHnWB33RO6D3Ytti9eM1+W2R/pATlcdHrmI+3MEhXvKdMfdxZ
   hgRTI0CFg1JPck12Pvq0cDjVSkJDSyAFWQOCxKPsoePrkKvBKvetDS7xv
   2/CvBGuWTv5WJlyuIlyB9mNu1dYLyNzNXu0AhH6d2ll0iJY26w5HSPU5V
   XW97UwFis3TfJCJCDpdadLABkYtP3eveNUrDvxh0usxAXWAc1LG1D0+DL
   A==;
X-CSE-ConnectionGUID: cGScU2BxQsOcNd1GRmvMhQ==
X-CSE-MsgGUID: CQDNExI1QDmW1znnAo+Y0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24665920"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24665920"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:42:48 -0700
X-CSE-ConnectionGUID: sKKY+3lfQ6ewjyyLHcl3Jg==
X-CSE-MsgGUID: dVZb4uNqQGWByUuD9wwQ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="71464111"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2024 03:42:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soKo8-0003P6-2y;
	Wed, 11 Sep 2024 10:42:44 +0000
Date: Wed, 11 Sep 2024 18:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build-v1.5 6/33] arch/arm64/kernel/vdso32/note.c:14:1:
 error: a parameter list without types is only allowed in a function
 definition
Message-ID: <202409111829.o0fYCii9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-v1.5
head:   2abe29f4f173c4090c0030c43c30053694b1658a
commit: f1cb9326e751c8ea49d315b984a72384794707a0 [6/33] elfnote: Use __UNIQUE_ID() for note symbols
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240911/202409111829.o0fYCii9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111829.o0fYCii9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111829.o0fYCii9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
>> arch/arm64/kernel/vdso32/note.c:14:1: error: a parameter list without types is only allowed in a function definition
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:76:16: note: expanded from macro 'ELFNOTE'
      76 |         } __UNIQUE_ID(note)                                             \
         |                       ^
>> arch/arm64/kernel/vdso32/note.c:14:1: error: illegal initializer (only variables can be initialized)
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:76:4: note: expanded from macro 'ELFNOTE'
      76 |         } __UNIQUE_ID(note)                                             \
         |           ^
   arch/arm64/kernel/vdso32/note.c:15:1: error: a parameter list without types is only allowed in a function definition
      15 | BUILD_SALT;
         | ^
   include/linux/build-salt.h:16:8: note: expanded from macro 'BUILD_SALT'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:76:16: note: expanded from macro 'ELFNOTE'
      76 |         } __UNIQUE_ID(note)                                             \
         |                       ^
   arch/arm64/kernel/vdso32/note.c:15:1: error: illegal initializer (only variables can be initialized)
   include/linux/build-salt.h:16:8: note: expanded from macro 'BUILD_SALT'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:76:4: note: expanded from macro 'ELFNOTE'
      76 |         } __UNIQUE_ID(note)                                             \
         |           ^
   4 errors generated.
   make[3]: *** [arch/arm64/kernel/vdso32/Makefile:144: arch/arm64/kernel/vdso32/note.o] Error 1
   make[3]: Target 'arch/arm64/kernel/vdso32/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:218: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +14 arch/arm64/kernel/vdso32/note.c

a7f71a2c8903f8 Vincenzo Frascino 2019-06-21  13  
a7f71a2c8903f8 Vincenzo Frascino 2019-06-21 @14  ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);

:::::: The code at line 14 was first introduced by commit
:::::: a7f71a2c8903f8599312f75233946287c558d9f6 arm64: compat: Add vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
