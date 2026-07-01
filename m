Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA5D38E8B6;
	Wed,  1 Jul 2026 04:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782878932; cv=none; b=WPThOtYbv1znvilD6r95DAVbUtV2QiBNRshLDuO11JxIga2lhDMU1l21Uti4WqYpf/WohbBOPkGSv/9sZD5Y3BEULSuzkxUgR3iz2d7KocSpQgLq1496aBydQBNcNQVgWy0PbR3VyZqV5CARHBvhwzrf7B9e/oFEOfAfxlQohz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782878932; c=relaxed/simple;
	bh=7jWzZWj+b1Tr2UI88xUKvKif9s38pe0Xf5Kmod+a2VI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gHNVbZty0LK5Dyn821Y8kShk4yu30Sz12vV6qOabVV8gl4gbjJdByJAYiuRzrXL7/I7xJZ7eXH53R7cpDnueq8mSRMSVQrlWYWc3FgWpIcrgkIdhPijlJyhFA2wN2IuRJhLzsjU0uJ6Pnwz9BtB4olscT3Yd8//1oaXPjvzKxPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CN5mUPIB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CN5mUPIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782878924; x=1814414924;
  h=date:from:to:cc:subject:message-id;
  bh=7jWzZWj+b1Tr2UI88xUKvKif9s38pe0Xf5Kmod+a2VI=;
  b=CN5mUPIBBY//89+3B2SjnYiV5KdSsW/DQ2ZZOiquE5V+8JHVgHhfbGa/
   4yGH5YCLdtWjVhZvg8hQHd2BGOu744vcU4SVrQ3zbFT/GZGgnKxauV7mL
   vzCnwfdwBtKVezHv7fntajyXSI2FCRD2t7YEU7WPWPiqAyqZF89x6GT12
   JKclt8HOk9nDPro1w2+wS8Cm6NbJwmnV9Q3wizVoyEvA24ET5PbiXDQV4
   pieWjG7wAiEROWw/A9+7t67SidXg555uo1yGqnchOZ2UhLUU06KQcJhi3
   p3sOz127gCTakpDXCvULZbnNq47o+gMJEJc0duTmKz9VAucv9D6H86j7T
   w==;
X-CSE-ConnectionGUID: g90V7C7NTbitSYB1j8Njgw==
X-CSE-MsgGUID: V+99mZD7TyOVXJU+I6vF7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83687621"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83687621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 21:08:43 -0700
X-CSE-ConnectionGUID: XZmxWjGmRv202ECaQksqyg==
X-CSE-MsgGUID: ccSgxX9QQnGCggujYZjo/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="248466788"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jun 2026 21:08:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wemFV-000000008vv-1Wdr;
	Wed, 01 Jul 2026 04:08:34 +0000
Date: Wed, 01 Jul 2026 12:08:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [linux-next:master 1631/2307]
 drivers/remoteproc/remoteproc_internal.h:131:7: error: call to undeclared
 function 'ioremap_prot'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607011210.PI7XDDb1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c93fa674f0fc3c8f359c2143abce6bbb422e6
commit: 50227acbf4e5173db0f05ed95414512e7783889f [1631/2307] remoteproc: Add common wc-ioremap carveout callbacks
config: s390-randconfig-002-20260701 (https://download.01.org/0day-ci/archive/20260701/202607011210.PI7XDDb1-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011210.PI7XDDb1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011210.PI7XDDb1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/remoteproc/remoteproc_debugfs.c:25:
>> drivers/remoteproc/remoteproc_internal.h:131:7: error: call to undeclared function 'ioremap_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |         va = ioremap_wc(mem->dma, mem->len);
         |              ^
   arch/s390/include/asm/io.h:36:2: note: expanded from macro 'ioremap_wc'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^
   arch/s390/include/asm/io.h:30:22: note: expanded from macro 'ioremap_prot'
      30 | #define ioremap_prot ioremap_prot
         |                      ^
   In file included from drivers/remoteproc/remoteproc_debugfs.c:25:
>> drivers/remoteproc/remoteproc_internal.h:131:5: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     131 |         va = ioremap_wc(mem->dma, mem->len);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/remoteproc/remoteproc_internal.h:146:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |         iounmap((__force __iomem void *)mem->va);
         |         ^
   arch/s390/include/asm/io.h:31:17: note: expanded from macro 'iounmap'
      31 | #define iounmap iounmap
         |                 ^
   3 errors generated.
--
   In file included from drivers/remoteproc/remoteproc_coredump.c:13:
>> drivers/remoteproc/remoteproc_internal.h:131:7: error: call to undeclared function 'ioremap_prot'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     131 |         va = ioremap_wc(mem->dma, mem->len);
         |              ^
   arch/s390/include/asm/io.h:36:2: note: expanded from macro 'ioremap_wc'
      36 |         ioremap_prot((addr), (size), pgprot_writecombine(PAGE_KERNEL))
         |         ^
   arch/s390/include/asm/io.h:30:22: note: expanded from macro 'ioremap_prot'
      30 | #define ioremap_prot ioremap_prot
         |                      ^
   In file included from drivers/remoteproc/remoteproc_coredump.c:13:
>> drivers/remoteproc/remoteproc_internal.h:131:5: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     131 |         va = ioremap_wc(mem->dma, mem->len);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/remoteproc/remoteproc_internal.h:146:2: error: call to undeclared function 'iounmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |         iounmap((__force __iomem void *)mem->va);
         |         ^
   arch/s390/include/asm/io.h:31:17: note: expanded from macro 'iounmap'
      31 | #define iounmap iounmap
         |                 ^
   drivers/remoteproc/remoteproc_internal.h:146:2: note: did you mean 'vunmap'?
   arch/s390/include/asm/io.h:31:17: note: expanded from macro 'iounmap'
      31 | #define iounmap iounmap
         |                 ^
   include/linux/vmalloc.h:220:13: note: 'vunmap' declared here
     220 | extern void vunmap(const void *addr);
         |             ^
   3 errors generated.


vim +/ioremap_prot +131 drivers/remoteproc/remoteproc_internal.h

   125	
   126	static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
   127						     struct rproc_mem_entry *mem)
   128	{
   129		void __iomem *va;
   130	
 > 131		va = ioremap_wc(mem->dma, mem->len);
   132		if (!va) {
   133			dev_err(&rproc->dev, "Unable to map memory region: %pa+%zx\n",
   134				&mem->dma, mem->len);
   135			return -ENOMEM;
   136		}
   137	
   138		mem->va = (__force void *)va;
   139	
   140		return 0;
   141	}
   142	
   143	static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
   144						  struct rproc_mem_entry *mem)
   145	{
 > 146		iounmap((__force __iomem void *)mem->va);
   147	
   148		return 0;
   149	}
   150	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
