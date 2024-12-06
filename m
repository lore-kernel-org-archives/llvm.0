Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672351BC063;
	Fri,  6 Dec 2024 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733491212; cv=none; b=OloRM6Guz5rIKdZOsloORug+fioGA43VxpaX3n5Eg5Yg+UFDvESNZUPlbIgaTJNiRTgE107YopsH2pExbLbeDYKs2dhotm1jC776MvOxvKqKMaG88U/stwoOO3hV/OWTj9Qrv6pFWI1kTinBgYMxgiQa3ezNtJIOtGBw8oasR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733491212; c=relaxed/simple;
	bh=8FPdEEWk+5z8nip8p5gL3/gDx0IOYQm4Se1TogO+Zsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8KVjsa0+bOIVhcoYhal629utzQIAx3adcknsQNv5d6UoJV6qNsk8w8VOt7PuKDaSaFz7Q0jr6iiYxUBXaxJCqgmmxrKzyNT26aAKrfQn2C/ONBxy9caRwoTwN0Jjqckjwmk8YQBT68SHFwcjKFSZ+gcOC0L1bH11V9opo3uBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i67f8UCw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i67f8UCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733491211; x=1765027211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8FPdEEWk+5z8nip8p5gL3/gDx0IOYQm4Se1TogO+Zsc=;
  b=i67f8UCwWcmYhSkeYWvHaLUFsBNH6qBjNYLwsuI1qgumRbiqrSvLKKRe
   UvXMzTj9p+HvfbnznmPok59ZxbJZhOxW9vu5pUXVo9F23IgBJGV4Lhf/G
   cq12BS/WP3a/b8Pjnl5iqliVUkTStRmkRCDDnHp+XrycHIDpbZvZ2mTPX
   NYN7ORdZ4FVrlWtKFGoDlujG4Tq+gza0i5//V4Hvrhs2J0JKylP7b1EJr
   gykG/ojaVxWy/rrndu4QlngrjxFa1Eg4arzoMoPiaT8dtWnQkiaD1b5Xj
   vyVm/yePU8jesWHpChu+pONmMybRzsLyjTkNS5HuPYNHoKVLPlRm6YFkl
   Q==;
X-CSE-ConnectionGUID: noyCrGD3QfeHafgRHIHQ9w==
X-CSE-MsgGUID: oIXTRVr2QWuZf7ey9oW8oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="56335254"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="56335254"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 05:20:10 -0800
X-CSE-ConnectionGUID: CieZU+81RMGBE2nEKP4vgA==
X-CSE-MsgGUID: jx5SOyNmRRqUOn11Exb10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="99358670"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Dec 2024 05:20:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJYFa-00015L-01;
	Fri, 06 Dec 2024 13:20:06 +0000
Date: Fri, 6 Dec 2024 21:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 10/16] mm: Map page tables with privileged pkey
Message-ID: <202412062148.fQlAVl6y-lkp@intel.com>
References: <20241206101110.1646108-11-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101110.1646108-11-kevin.brodsky@arm.com>

Hi Kevin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc1]
[cannot apply to arm64/for-next/core akpm-mm/mm-everything kees/for-next/hardening next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Brodsky/mm-Introduce-kpkeys/20241206-181928
base:   linus/master
patch link:    https://lore.kernel.org/r/20241206101110.1646108-11-kevin.brodsky%40arm.com
patch subject: [RFC PATCH 10/16] mm: Map page tables with privileged pkey
config: i386-buildonly-randconfig-002 (https://download.01.org/0day-ci/archive/20241206/202412062148.fQlAVl6y-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412062148.fQlAVl6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412062148.fQlAVl6y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/idt.c:8:
   In file included from arch/x86/include/asm/set_memory.h:5:
   In file included from include/linux/mm.h:34:
   In file included from include/linux/kpkeys.h:8:
>> include/linux/set_memory.h:20:12: error: call to undeclared function 'set_memory_ro'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      20 |         int ret = set_memory_ro(addr, numpages);
         |                   ^
   include/linux/set_memory.h:20:12: note: did you mean 'set_memory_rox'?
   include/linux/set_memory.h:18:19: note: 'set_memory_rox' declared here
      18 | static inline int set_memory_rox(unsigned long addr, int numpages)
         |                   ^
      19 | {
      20 |         int ret = set_memory_ro(addr, numpages);
         |                   ~~~~~~~~~~~~~
         |                   set_memory_rox
>> include/linux/set_memory.h:23:9: error: call to undeclared function 'set_memory_x'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      23 |         return set_memory_x(addr, numpages);
         |                ^
   In file included from arch/x86/kernel/idt.c:8:
   In file included from arch/x86/include/asm/set_memory.h:5:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/idt.c:8:
   In file included from arch/x86/include/asm/set_memory.h:5:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/idt.c:8:
   In file included from arch/x86/include/asm/set_memory.h:5:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/idt.c:8:
   In file included from arch/x86/include/asm/set_memory.h:5:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/idt.c:8:
   In file included from arch/x86/include/asm/set_memory.h:5:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/idt.c:8:
   In file included from arch/x86/include/asm/set_memory.h:5:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/idt.c:8:
   In file included from arch/x86/include/asm/set_memory.h:5:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~


vim +/set_memory_ro +20 include/linux/set_memory.h

938f846492d6682 Michael Ellerman 2017-07-06  16  
60463628c9e0a80 Peter Zijlstra   2022-10-29  17  #ifndef set_memory_rox
d48567c9a0d1e60 Peter Zijlstra   2022-10-26  18  static inline int set_memory_rox(unsigned long addr, int numpages)
d48567c9a0d1e60 Peter Zijlstra   2022-10-26  19  {
d48567c9a0d1e60 Peter Zijlstra   2022-10-26 @20  	int ret = set_memory_ro(addr, numpages);
d48567c9a0d1e60 Peter Zijlstra   2022-10-26  21  	if (ret)
d48567c9a0d1e60 Peter Zijlstra   2022-10-26  22  		return ret;
d48567c9a0d1e60 Peter Zijlstra   2022-10-26 @23  	return set_memory_x(addr, numpages);
d48567c9a0d1e60 Peter Zijlstra   2022-10-26  24  }
60463628c9e0a80 Peter Zijlstra   2022-10-29  25  #endif
d48567c9a0d1e60 Peter Zijlstra   2022-10-26  26  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
