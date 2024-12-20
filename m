Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3404A05;
	Fri, 20 Dec 2024 01:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734657138; cv=none; b=Uzc9JI8CijkjLSS8EBB2BTT5QNfXJnfWkqd76VtI4kzdkgsWNeOEWWow/QdLi3Td60pvm77/zPJSccbqHK18oGt3+O9Y7YuAb7ahiz4qQ4xFeC+mmhY2UAeIPRUREgAYGgEIN6qOb5azS0LISK0R9p84udbDB8nB2XntWyCMusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734657138; c=relaxed/simple;
	bh=T4i2es0J3OYYaLkNj8l6d4rH+5QIMEclLA8vkeOp7os=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ww+0cAm0Adqrc8pP1c+V3zjn/cRiEHbt/uAugCdZmk5S+XFg+KSZ/L7Dk74/ya7GxcyQlKGASWEtyTG3tIFVUmeMY/oPMh94yjHTK/ZoiXOpg63+f/8YYRTj0Lq2QoMEjwQcIi8bL20BwzueOScJtW50dLujrEkdtimp9WwTPJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhbSlfU0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhbSlfU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734657136; x=1766193136;
  h=date:from:cc:subject:message-id:mime-version;
  bh=T4i2es0J3OYYaLkNj8l6d4rH+5QIMEclLA8vkeOp7os=;
  b=VhbSlfU0OxSOPDgZ7ZrGQpQLldU7LFXFGKIZHXPfAZq1RbQIbRflIGFC
   lRH/zIsdjZY0TT9VC266Y44pOofeG1NkYZ7ZgScwxOqpPdSmHU87OWYdp
   sW2NratCsm6DXoY4N/1o9q5ammrz7+jXSL7ob8LAwhlK2f7w60nKhUpKE
   QgR5IHN8hrNjmLJpelfDW+adazQJsQ1RgFUb9wvEVV4WOnnV2MIFjFWgj
   N4zAK1YZ2jC53sahOYALp19J/+p/hDihlU3txOXkA+t3NdWc0tV7qKmbE
   zZXWjvrONwgLu4EYFFV10awMErsUQPvvDS4j2sjcR1AKnPQII2sAIFQ2b
   w==;
X-CSE-ConnectionGUID: vmO10wBPRNeoZ2AjqHaAaw==
X-CSE-MsgGUID: LIRA2vj7SY6csv80cXZjkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34482249"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="34482249"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 17:12:15 -0800
X-CSE-ConnectionGUID: OXWsIRzWQUmGHr4NxiH3rg==
X-CSE-MsgGUID: pJtzlTAHTG66v02vjTdkbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102985171"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Dec 2024 17:12:14 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tORYp-0000eN-2w;
	Fri, 20 Dec 2024 01:12:11 +0000
Date: Fri, 20 Dec 2024 09:11:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: arch/x86/kernel/dumpstack_64.c:80:2: warning: arithmetic between
 different enumeration types ('enum stack_type' and 'enum
 exception_stack_ordering')
Message-ID: <202412200930.m4QinYWG-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: c450c8f532b63475b30e29bc600c25ab0a4ab282 x86/dumpstack/64: Speedup in_exception_stack()
date:   6 years ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241220/202412200930.m4QinYWG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412200930.m4QinYWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412200930.m4QinYWG-lkp@intel.com/

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
