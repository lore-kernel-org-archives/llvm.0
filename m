Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215C911705;
	Sun,  7 Jan 2024 20:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOop8FJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704659752; x=1736195752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFf0z+5gB4dqyeWd7CRi/32BYMkYpnnFVfkudecylgQ=;
  b=aOop8FJ3ixk3QzkfOf+u9gwMhenD4FIqgptqE7tux9VO2xHpU57HJesj
   SzkvNbtHNFopD2L8vDUFKNa9gtxIz5eggUVfwqMlQMnZ+LaeoMmhpaZrH
   iGSjpbSOwNhr8KsNPI1aLCLHQoQM5Z9OOi+omN5tABVkn9MJlfvn8kW10
   K5d5SIkXD+QpJCliTzZnIQYR1RJsXEqF2oIB6xjiXwLXH9pPFTt23Hw0l
   386wRBQzp/4BY/4C8hwJgiikUyxXt1sE4Nh6WCvtYtXwLIcMIF1ynyyvc
   yyZ6h0OUPXQxBKDU8s5mw7NVR6r0CPsDKNEaSH+T3XbRH2l3wtn2gLQ+O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="462046994"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="462046994"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 12:35:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="954455053"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="954455053"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 07 Jan 2024 12:35:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMZs5-00048Q-0p;
	Sun, 07 Jan 2024 20:35:49 +0000
Date: Mon, 8 Jan 2024 04:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v0 9/14] arch/powerpc/kernel/kprobes.c:133:9: error:
 call to undeclared function 'execmem_alloc'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202401080413.8szVlPo2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v0
head:   7b112b930be7b0627fa65c6f8a2b64cd325c0ea9
commit: ccea3084f3f31f35c92c28ad9000871c94e194d5 [9/14] dev: powerpc: s/module_alloc/execmem_text_alloc/
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240108/202401080413.8szVlPo2-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401080413.8szVlPo2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401080413.8szVlPo2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/kprobes.c:133:9: error: call to undeclared function 'execmem_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     133 |         page = execmem_alloc(PAGE_SIZE);
         |                ^
>> arch/powerpc/kernel/kprobes.c:133:7: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     133 |         page = execmem_alloc(PAGE_SIZE);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/execmem_alloc +133 arch/powerpc/kernel/kprobes.c

   128	
   129	void *alloc_insn_page(void)
   130	{
   131		void *page;
   132	
 > 133		page = execmem_alloc(PAGE_SIZE);
   134		if (!page)
   135			return NULL;
   136	
   137		if (strict_module_rwx_enabled())
   138			set_memory_rox((unsigned long)page, 1);
   139	
   140		return page;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
