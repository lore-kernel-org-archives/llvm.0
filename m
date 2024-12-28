Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D535958;
	Sat, 28 Dec 2024 08:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735374696; cv=none; b=mivUmcExZqsV2ZF5WFuAIt10I8imuw/6jlw1uJFS4ETK9omBaJo62iyr75cesOZTjPtv65vyb3TWuh9xxnX5MG0+VnDwS052P2wa2vs7D5TE2Nf8A8ttdlfC50zEWDpcxbgT+Dtd/RA+qjCs/RxXGsdNB+e5IuXTiJYJoPboieA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735374696; c=relaxed/simple;
	bh=WOgXyhRcve87ZikSysWRh2zQU5E2cmLj/EnZQiV2hmU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u+faU4I5Fa+QgSrp283yuE6qWPLyR4GGLNb3FATz4mOWEPQuu49ZHKgj89XNNqvKCXOamkNobORbb1dYctafglcb4RMx7ZeUJ0oSXWTd3f1paubEbUgVJRrBHDeWLU0kLv8Fsz5pxcf5xkl0rB90xm2PgJDWdazt8lmDjpRtC7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnGvnZtf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnGvnZtf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735374695; x=1766910695;
  h=date:from:cc:subject:message-id:mime-version;
  bh=WOgXyhRcve87ZikSysWRh2zQU5E2cmLj/EnZQiV2hmU=;
  b=EnGvnZtfc93cM7UvaxnFj6YDyEH7/pkyeihi9ThFDQv1u0r4rPC6aHb3
   dYop3n1WMKY4MjW3G/QpTEESCLveg6R3ZUXT5EADItuZn8+zhMYIEsUyo
   TLlujQir3lmZS9jUPyLuKEgzwMKUI/wGWByoUlSOFhW85LTqkva/rKVPT
   mqx8g4Mnt0jUemi68ChXPG90JTiCRKkv1Y9quq1nW/syXPQlEeKM+yCh3
   AL33RE8g2BQb0ivUzA5S90UmvR5Fjvbv2jH/ux4JiXTPbfS79KpM9IttH
   Zmyjc9y+4YLyfmp2mmdSX3IyXZ88GLmKLHVDwG4i+qVxFTykJWDnQOLBV
   Q==;
X-CSE-ConnectionGUID: LABJZF1qQWuVb9w3FEbOFw==
X-CSE-MsgGUID: hDbwKvBBQ2GQ7symeNW9cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35057873"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35057873"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 00:31:34 -0800
X-CSE-ConnectionGUID: L91xDqgBSb+3ESevBhLpcw==
X-CSE-MsgGUID: duQgFrBoRaGRdq4SScaulw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105410574"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Dec 2024 00:31:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRSEM-0003xG-0U;
	Sat, 28 Dec 2024 08:31:30 +0000
Date: Sat, 28 Dec 2024 16:30:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: arch/x86/kernel/dumpstack_64.c:80:2: warning: arithmetic between
 different enumeration types ('enum stack_type' and 'enum
 exception_stack_ordering')
Message-ID: <202412281626.QrGK7zqy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Borislav Petkov <bp@suse.de>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: c450c8f532b63475b30e29bc600c25ab0a4ab282 x86/dumpstack/64: Speedup in_exception_stack()
date:   6 years ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241228/202412281626.QrGK7zqy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281626.QrGK7zqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281626.QrGK7zqy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/dumpstack_64.c:80:2: warning: arithmetic between different enumeration types ('enum stack_type' and 'enum exception_stack_ordering') [-Wenum-enum-conversion]
      80 |         EPAGERANGE(DF),
         |         ^~~~~~~~~~~~~~
   arch/x86/kernel/dumpstack_64.c:70:32: note: expanded from macro 'EPAGERANGE'
      70 |                 .type   = STACK_TYPE_EXCEPTION + ESTACK_ ##st, }
         |                           ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   arch/x86/kernel/dumpstack_64.c:81:2: warning: arithmetic between different enumeration types ('enum stack_type' and 'enum exception_stack_ordering') [-Wenum-enum-conversion]
      81 |         EPAGERANGE(NMI),
         |         ^~~~~~~~~~~~~~~
   arch/x86/kernel/dumpstack_64.c:70:32: note: expanded from macro 'EPAGERANGE'
      70 |                 .type   = STACK_TYPE_EXCEPTION + ESTACK_ ##st, }
         |                           ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   arch/x86/kernel/dumpstack_64.c:82:2: warning: arithmetic between different enumeration types ('enum stack_type' and 'enum exception_stack_ordering') [-Wenum-enum-conversion]
      82 |         EPAGERANGE(DB1),
         |         ^~~~~~~~~~~~~~~
   arch/x86/kernel/dumpstack_64.c:70:32: note: expanded from macro 'EPAGERANGE'
      70 |                 .type   = STACK_TYPE_EXCEPTION + ESTACK_ ##st, }
         |                           ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   arch/x86/kernel/dumpstack_64.c:83:2: warning: arithmetic between different enumeration types ('enum stack_type' and 'enum exception_stack_ordering') [-Wenum-enum-conversion]
      83 |         EPAGERANGE(DB),
         |         ^~~~~~~~~~~~~~
   arch/x86/kernel/dumpstack_64.c:70:32: note: expanded from macro 'EPAGERANGE'
      70 |                 .type   = STACK_TYPE_EXCEPTION + ESTACK_ ##st, }
         |                           ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   arch/x86/kernel/dumpstack_64.c:84:2: warning: arithmetic between different enumeration types ('enum stack_type' and 'enum exception_stack_ordering') [-Wenum-enum-conversion]
      84 |         EPAGERANGE(MCE),
         |         ^~~~~~~~~~~~~~~
   arch/x86/kernel/dumpstack_64.c:70:32: note: expanded from macro 'EPAGERANGE'
      70 |                 .type   = STACK_TYPE_EXCEPTION + ESTACK_ ##st, }
         |                           ~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   5 warnings generated.


vim +80 arch/x86/kernel/dumpstack_64.c

    64	
    65	#define EPAGERANGE(st)							\
    66		[PFN_DOWN(CEA_ESTACK_OFFS(st)) ...				\
    67		 PFN_DOWN(CEA_ESTACK_OFFS(st) + CEA_ESTACK_SIZE(st) - 1)] = {	\
    68			.offs	= CEA_ESTACK_OFFS(st),				\
    69			.size	= CEA_ESTACK_SIZE(st),				\
    70			.type	= STACK_TYPE_EXCEPTION + ESTACK_ ##st, }
    71	
    72	/*
    73	 * Array of exception stack page descriptors. If the stack is larger than
    74	 * PAGE_SIZE, all pages covering a particular stack will have the same
    75	 * info. The guard pages including the not mapped DB2 stack are zeroed
    76	 * out.
    77	 */
    78	static const
    79	struct estack_pages estack_pages[CEA_ESTACK_PAGES] ____cacheline_aligned = {
  > 80		EPAGERANGE(DF),
    81		EPAGERANGE(NMI),
    82		EPAGERANGE(DB1),
    83		EPAGERANGE(DB),
    84		EPAGERANGE(MCE),
    85	};
    86	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
