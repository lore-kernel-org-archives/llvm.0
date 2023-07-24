Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6CBF9F2;
	Mon, 24 Jul 2023 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690222527; x=1721758527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EPfK3BMiEHs+1h7NCNs8B4CryBmd7yjOHfLFr1zxdwc=;
  b=gxC5dRjDwLTmrorlL/ncRwj9a+aSfo+095EsXdMbXlF5p5cxs44cvm0g
   LWu5pn9XSlMT01Riy6TcTosiiDVT4h5kEO5PztQD3XTz378AXt7owDRuV
   0PGsH4H7kvj1dnwvomop5hJ9i13YN6iPfnQJEEWX30x4+jNgFZLnk4hDm
   2iiwPOpQHmMKuaGiF0DTJigytxM1dWif+AmTwOBrSiixINrtojjzbH6y5
   iiY8pEp8XV7tIKIsHotaMhrqyzG8iwOmrKMTjL10FKU7Eo8loGm7ja9Eq
   ATPO4gekQfajy6JkTqDHiRnv8VjpvyCBxqrAiqOrqkP+pVG+IggkAjqF5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352412617"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="352412617"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 11:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="815923965"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="815923965"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2023 11:15:24 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO05b-0009wS-1s;
	Mon, 24 Jul 2023 18:15:23 +0000
Date: Tue, 25 Jul 2023 02:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Shixin <liushixin2@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>
Subject: [stable:linux-6.1.y 1681/7970]
 arch/arm64/include/asm/pgtable.h:871:44: error: implicit declaration of
 function 'pud_user_exec' is invalid in C99
Message-ID: <202307250238.2KZeFOz0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   5302e81aa2091d7dd59803f0727d1ba35ed2f929
commit: a006aaffd78ff70efcffa44e325633c0840b2bf2 [1681/7970] arm64/mm: add pud_user_exec() check in pud_user_accessible_page()
config: arm64-randconfig-r022-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250238.2KZeFOz0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250238.2KZeFOz0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250238.2KZeFOz0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:148:
   In file included from include/linux/kasan.h:33:
   In file included from include/linux/pgtable.h:6:
>> arch/arm64/include/asm/pgtable.h:871:44: error: implicit declaration of function 'pud_user_exec' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
                                                     ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:118: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=3009144726
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1270: prepare0] Error 2 shuffle=3009144726
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:231: __sub-make] Error 2 shuffle=3009144726
   make: Target 'prepare' not remade because of errors.


vim +/pud_user_exec +871 arch/arm64/include/asm/pgtable.h

   868	
   869	static inline bool pud_user_accessible_page(pud_t pud)
   870	{
 > 871		return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
   872	}
   873	#endif
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
