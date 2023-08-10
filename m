Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2511E53C;
	Thu, 10 Aug 2023 09:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691660956; x=1723196956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NpuVfNK2yhiqFV/s9kz/Q2ooeV2aUMfeboBqSY0+rBo=;
  b=Z8d74rDTCUrys9UHdbd1uL/gz1KpLW3P+7LrV4UO9ejGD/0TgyPeYAEq
   jod+SyZTrp29tP2j5kqlYv9LBMwz03N0D2O/3Uz2aGKt0HtUeOqQfYFXk
   GxzVwvgnP+2/yUF62KqQ1qh0yTfexx4O8WIGjETU4m3H7FfMqdla5Hhr9
   ydzIWe043MTxPxFSwW2HGR4IRluAbFtZYSHNoaI+QYRGb1Vh2N+zA7MlV
   xV2HCXJNyWcDC7i8y84PGP7AbXRibXWyePJpso+24q41e3yU4T4Sr6dCX
   BcmvcwnqlIRaoKvenxOGRG9dmhlslhVRD+Vx77ubcI0lF6+MBGyK3ipMO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="457714940"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="457714940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 02:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="797545816"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="797545816"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Aug 2023 02:49:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU2Hy-0006uO-06;
	Thu, 10 Aug 2023 09:49:06 +0000
Date: Thu, 10 Aug 2023 17:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-kfence 2/2]
 include/linux/kfence.h:58:47: error: 'char *' and 'void *' are not pointers
 to compatible types
Message-ID: <202308101758.4SiUa8Ee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-kfence
head:   709c5a98b878015dc4f8838fca1c0194b42dee86
commit: 709c5a98b878015dc4f8838fca1c0194b42dee86 [2/2] kfence: Use a void * for page pool
config: riscv-randconfig-r042-20230809 (https://download.01.org/0day-ci/archive/20230810/202308101758.4SiUa8Ee-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308101758.4SiUa8Ee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308101758.4SiUa8Ee-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slub.c:21:
   In file included from mm/slab.h:236:
   In file included from include/linux/slub_def.h:10:
>> include/linux/kfence.h:58:47: error: 'char *' and 'void *' are not pointers to compatible types
           return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
                                           ~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   1 error generated.


vim +58 include/linux/kfence.h

0ce20dd840897b Alexander Potapenko 2021-02-25  32  
0ce20dd840897b Alexander Potapenko 2021-02-25  33  /**
0ce20dd840897b Alexander Potapenko 2021-02-25  34   * is_kfence_address() - check if an address belongs to KFENCE pool
0ce20dd840897b Alexander Potapenko 2021-02-25  35   * @addr: address to check
0ce20dd840897b Alexander Potapenko 2021-02-25  36   *
0ce20dd840897b Alexander Potapenko 2021-02-25  37   * Return: true or false depending on whether the address is within the KFENCE
0ce20dd840897b Alexander Potapenko 2021-02-25  38   * object range.
0ce20dd840897b Alexander Potapenko 2021-02-25  39   *
0ce20dd840897b Alexander Potapenko 2021-02-25  40   * KFENCE objects live in a separate page range and are not to be intermixed
0ce20dd840897b Alexander Potapenko 2021-02-25  41   * with regular heap objects (e.g. KFENCE objects must never be added to the
0ce20dd840897b Alexander Potapenko 2021-02-25  42   * allocator freelists). Failing to do so may and will result in heap
0ce20dd840897b Alexander Potapenko 2021-02-25  43   * corruptions, therefore is_kfence_address() must be used to check whether
0ce20dd840897b Alexander Potapenko 2021-02-25  44   * an object requires specific handling.
0ce20dd840897b Alexander Potapenko 2021-02-25  45   *
0ce20dd840897b Alexander Potapenko 2021-02-25  46   * Note: This function may be used in fast-paths, and is performance critical.
0ce20dd840897b Alexander Potapenko 2021-02-25  47   * Future changes should take this into account; for instance, we want to avoid
0ce20dd840897b Alexander Potapenko 2021-02-25  48   * introducing another load and therefore need to keep KFENCE_POOL_SIZE a
0ce20dd840897b Alexander Potapenko 2021-02-25  49   * constant (until immediate patching support is added to the kernel).
0ce20dd840897b Alexander Potapenko 2021-02-25  50   */
0ce20dd840897b Alexander Potapenko 2021-02-25  51  static __always_inline bool is_kfence_address(const void *addr)
0ce20dd840897b Alexander Potapenko 2021-02-25  52  {
0ce20dd840897b Alexander Potapenko 2021-02-25  53  	/*
a7cb5d23eaea14 Marco Elver         2021-08-19  54  	 * The __kfence_pool != NULL check is required to deal with the case
a7cb5d23eaea14 Marco Elver         2021-08-19  55  	 * where __kfence_pool == NULL && addr < KFENCE_POOL_SIZE. Keep it in
a7cb5d23eaea14 Marco Elver         2021-08-19  56  	 * the slow-path after the range-check!
0ce20dd840897b Alexander Potapenko 2021-02-25  57  	 */
a7cb5d23eaea14 Marco Elver         2021-08-19 @58  	return unlikely((unsigned long)((char *)addr - __kfence_pool) < KFENCE_POOL_SIZE && __kfence_pool);
0ce20dd840897b Alexander Potapenko 2021-02-25  59  }
0ce20dd840897b Alexander Potapenko 2021-02-25  60  

:::::: The code at line 58 was first introduced by commit
:::::: a7cb5d23eaea148f8582229846f8dfff192f05c3 kfence: fix is_kfence_address() for addresses below KFENCE_POOL_SIZE

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
