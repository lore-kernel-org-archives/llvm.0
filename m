Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0DA1A598;
	Mon,  6 Nov 2023 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT8qbL22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699271524; x=1730807524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pmjuqnkh3+PSMRGyfn86YOZJEzWyw1divDh69UpwiXM=;
  b=BT8qbL22xTF9leVwDtGZ0ThM9APkv2oZzjSTe8kXrLAXuWdteOpFxMDM
   5alcrsUZq7deNQb6yyEC9YoN0e2n9521A3i4BHhCk3R6J1l5gQBbvmwQ0
   UUtEybjrPupRFFPfPJzIMDDlKykxuajQa4HKrTO0k4BgF+wE3k1KOWLEC
   3XulkyJeQPuBTMxHhcHdGzHyLV8wElKBzf6m89y79NFSf1fBM3mVZJs2z
   gBhgF5lo7xi0abXylbh+FSGzHm7VXSxzFx68fKMqP6NIvuvyE7aIQGNsf
   GrFdOmE0Rk77PZhHEHBhanMYxyehhNfj7lVdRp4GmiACXj6KdYXSooG/Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="475494033"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="475494033"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:52:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="852981470"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="852981470"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2023 03:51:58 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzy96-0006NA-1d;
	Mon, 06 Nov 2023 11:51:56 +0000
Date: Mon, 6 Nov 2023 19:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/include/asm/page.h:230:9: warning: result of comparison
 of constant 13835058055282163712 with expression of type 'unsigned long' is
 always true
Message-ID: <202311061940.4pBrm44u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 58b6fed89ab0f602de0d143c617c29c3d4c67429 powerpc: Make virt_to_pfn() a static inline
date:   3 months ago
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311061940.4pBrm44u-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061940.4pBrm44u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061940.4pBrm44u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:137:
   In file included from arch/powerpc/include/asm/vdso/gettimeofday.h:7:
>> arch/powerpc/include/asm/page.h:230:9: warning: result of comparison of constant 13835058055282163712 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
     230 |         return __pa(kaddr) >> PAGE_SHIFT;
         |                ^~~~~~~~~~~
   arch/powerpc/include/asm/page.h:217:37: note: expanded from macro '__pa'
     217 |         VIRTUAL_WARN_ON((unsigned long)(x) < PAGE_OFFSET);              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:202:73: note: expanded from macro 'VIRTUAL_WARN_ON'
     202 | #define VIRTUAL_WARN_ON(x)      WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && (x))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
      88 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:137:
   In file included from arch/powerpc/include/asm/vdso/gettimeofday.h:7:
>> arch/powerpc/include/asm/page.h:235:9: warning: result of comparison of constant 13835058055282163712 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
     235 |         return __va(pfn << PAGE_SHIFT);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:211:37: note: expanded from macro '__va'
     211 |         VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:202:73: note: expanded from macro 'VIRTUAL_WARN_ON'
     202 | #define VIRTUAL_WARN_ON(x)      WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && (x))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
      88 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   2 warnings generated.
--
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:137:
   In file included from arch/powerpc/include/asm/vdso/gettimeofday.h:7:
>> arch/powerpc/include/asm/page.h:230:9: warning: result of comparison of constant 13835058055282163712 with expression of type 'unsigned long' is always true [-Wtautological-constant-out-of-range-compare]
     230 |         return __pa(kaddr) >> PAGE_SHIFT;
         |                ^~~~~~~~~~~
   arch/powerpc/include/asm/page.h:217:37: note: expanded from macro '__pa'
     217 |         VIRTUAL_WARN_ON((unsigned long)(x) < PAGE_OFFSET);              \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:202:73: note: expanded from macro 'VIRTUAL_WARN_ON'
     202 | #define VIRTUAL_WARN_ON(x)      WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && (x))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
      88 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:5:
   In file included from include/vdso/datapage.h:137:
   In file included from arch/powerpc/include/asm/vdso/gettimeofday.h:7:
>> arch/powerpc/include/asm/page.h:235:9: warning: result of comparison of constant 13835058055282163712 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
     235 |         return __va(pfn << PAGE_SHIFT);
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:211:37: note: expanded from macro '__va'
     211 |         VIRTUAL_WARN_ON((unsigned long)(x) >= PAGE_OFFSET);             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/page.h:202:73: note: expanded from macro 'VIRTUAL_WARN_ON'
     202 | #define VIRTUAL_WARN_ON(x)      WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && (x))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
      88 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   2 warnings generated.


vim +230 arch/powerpc/include/asm/page.h

   226	
   227	#ifndef __ASSEMBLY__
   228	static inline unsigned long virt_to_pfn(const void *kaddr)
   229	{
 > 230		return __pa(kaddr) >> PAGE_SHIFT;
   231	}
   232	
   233	static inline const void *pfn_to_kaddr(unsigned long pfn)
   234	{
 > 235		return __va(pfn << PAGE_SHIFT);
   236	}
   237	#endif
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
