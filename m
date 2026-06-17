Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA82F0661;
	Wed, 17 Jun 2026 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781659989; cv=none; b=LOA+ppilbrCDnlu0pNyZCnhVQPHaO59umF6UJ3HFy5bwC9I77fJ6Q+Yrmsl++7e8e1MlQ8Yf56OyxP5Z4y/imaa0pnZmtFBp62ekI5KHY5ygAjlnjgj1DztaDBLe6gKJKJeGt78lv5Eq2rUs88h1KR5OMtu3EjWweKjyUpqWrBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781659989; c=relaxed/simple;
	bh=aPDaQaRCoWJMw+1uk+OZcZSPzr+XjKagiG/tHmHqq6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PTXXAe3B/DBxK9NNiOa2yFa1ML+47/gSdMST7JhAuCju1yXNH77eEdBIE0YPlEj9P4cYnUa1mRetE+5zJjKwI9rQIB0nvd9925BhzRsIpBABhiquUgdbM+AOmw9pcA0wNoydRCU6+2fmbQY3u7e0+HD7OWjNmEdZ8hKUJs+VKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7+G1nin; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7+G1nin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781659985; x=1813195985;
  h=date:from:to:cc:subject:message-id;
  bh=aPDaQaRCoWJMw+1uk+OZcZSPzr+XjKagiG/tHmHqq6A=;
  b=U7+G1nin7a6RcTV3CZjCD1+y6h9+/ABddE4oZD2d9cc/DoKXSQfAZWsK
   ZtU/Wrr0vVT6IyyOegFm/zMcdH4u+gNmsU/X80OXH0pn8W6uNwRjt19Qn
   Fln09RWKxWml+4KPEitCqPzUAWpDZqWUPSWZe9mMO4g0x6RWuWS7QR8lB
   8q6DVVmOcLtrSAneAnkNAZBmRATa19CFvb8FRDG+S56JDJaPpvNrjj/ap
   8iwvNCOolBfhFE4RjFgs7AvTRGJD81p2EunYG91EOmiNuhIfZTeAUjvx7
   OlJi9Gl+4neB4BgTarA+ABnxcbR+UmsVk2nKj5bWm761/GqdGTby2I/By
   g==;
X-CSE-ConnectionGUID: NXv4Cfz/QleRKZMRj+v2Pw==
X-CSE-MsgGUID: XeIOxSrMQm2pPa9pWf74QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82213327"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82213327"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 18:33:04 -0700
X-CSE-ConnectionGUID: YKYaM7+ITLm+Yx3eH/E2Dw==
X-CSE-MsgGUID: dlk6mX6wTsuMoSSY40WAfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247040947"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2026 18:33:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZf9G-00000000Tz4-0toY;
	Wed, 17 Jun 2026 01:32:58 +0000
Date: Wed, 17 Jun 2026 09:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/scsi 5/5]
 drivers/scsi/sym53c8xx_2/sym_malloc.c:182:12: error: use of undeclared
 identifier 'M_MEM_PAGE_ORDER'
Message-ID: <202606170940.e6qkOkKv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/scsi
head:   8434cdcf311874c86620e4dbacbe17f63b33eca4
commit: 8434cdcf311874c86620e4dbacbe17f63b33eca4 [5/5] scsi: sym53c8xx_2: replace __get_free_pages() with kmalloc()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260617/202606170940.e6qkOkKv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170940.e6qkOkKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170940.e6qkOkKv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/sym53c8xx_2/sym_malloc.c:182:12: error: use of undeclared identifier 'M_MEM_PAGE_ORDER'
     182 |         void *m = sym_get_mem_cluster();
         |                   ^
   drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:23: note: expanded from macro 'sym_get_mem_cluster'
    1114 |         kmalloc(PAGE_SIZE << M_MEM_PAGE_ORDER, GFP_ATOMIC)
         |                              ^
>> drivers/scsi/sym53c8xx_2/sym_malloc.c:182:12: error: use of undeclared identifier 'M_MEM_PAGE_ORDER'
   drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:23: note: expanded from macro 'sym_get_mem_cluster'
    1114 |         kmalloc(PAGE_SIZE << M_MEM_PAGE_ORDER, GFP_ATOMIC)
         |                              ^
>> drivers/scsi/sym53c8xx_2/sym_malloc.c:182:12: error: use of undeclared identifier 'M_MEM_PAGE_ORDER'
   drivers/scsi/sym53c8xx_2/sym_hipd.h:1114:23: note: expanded from macro 'sym_get_mem_cluster'
    1114 |         kmalloc(PAGE_SIZE << M_MEM_PAGE_ORDER, GFP_ATOMIC)
         |                              ^
   3 errors generated.


vim +/M_MEM_PAGE_ORDER +182 drivers/scsi/sym53c8xx_2/sym_malloc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  173  
^1da177e4c3f41 Linus Torvalds 2005-04-16  174  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  175   *  Default memory pool we donnot need to involve in DMA.
^1da177e4c3f41 Linus Torvalds 2005-04-16  176   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  177   *  With DMA abstraction, we use functions (methods), to 
^1da177e4c3f41 Linus Torvalds 2005-04-16  178   *  distinguish between non DMAable memory and DMAable memory.
^1da177e4c3f41 Linus Torvalds 2005-04-16  179   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  180  static void *___mp0_get_mem_cluster(m_pool_p mp)
^1da177e4c3f41 Linus Torvalds 2005-04-16  181  {
^1da177e4c3f41 Linus Torvalds 2005-04-16 @182  	void *m = sym_get_mem_cluster();
^1da177e4c3f41 Linus Torvalds 2005-04-16  183  	if (m)
^1da177e4c3f41 Linus Torvalds 2005-04-16  184  		++mp->nump;
^1da177e4c3f41 Linus Torvalds 2005-04-16  185  	return m;
^1da177e4c3f41 Linus Torvalds 2005-04-16  186  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  187  

:::::: The code at line 182 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
