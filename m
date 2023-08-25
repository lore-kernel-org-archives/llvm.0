Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369C4D2F4;
	Fri, 25 Aug 2023 11:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692963884; x=1724499884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yl/J8paohe1TXQLey/dMgesvHrOeLB0GQhKy4ku/He0=;
  b=LdCTuGw+ehsvIGrLWamToEk86YpA64yMc75MhELa8SbSPAPuaw+oUkKv
   f3XCF/L9fkSxyHebk4/qPurmCBe8HGSe9IPUJlVSc23xoecnBhv0yFRn3
   zxXbMhrk0PKbuq2CH7S2fjkBrAi0GM0ITLRV9Ps8pf95l3j3baX/sC+Xa
   MTw9jYlOrKbOtKqrCSZwQtbkEo3CUf2paK95v0z39skSNwPeb2W/6Op9P
   UfekPD64B/rFoNB48IGaFhzHcs+c5Csg6zdH8TtCoxue5lo+jfbMtnde3
   1NyRq26vKqnhFFA/QTCCH+bwo7BLHwpuRo54SLNS6VtwGpdgwQVPX8rBw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="378478433"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="378478433"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 04:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="714326068"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="714326068"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2023 04:44:41 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZVF2-0003X4-24;
	Fri, 25 Aug 2023 11:44:40 +0000
Date: Fri, 25 Aug 2023 19:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Danny Tsen <dtsen@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 1647/12910]
 arch/powerpc/include/asm/switch_to.h:86:2: error: call to
 __compiletime_assert_261 declared with 'error' attribute: BUILD_BUG failed
Message-ID: <202308251906.SYawej6g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6269320850097903b30be8f07a5c61d9f7592393
commit: 161fca7e3e905d5e99dbd79ed55d9212e6d80eb0 [1647/12910] crypto: powerpc - Add chacha20/poly1305-p10 to Kconfig and Makefile
config: powerpc64-randconfig-r024-20230824 (https://download.01.org/0day-ci/archive/20230825/202308251906.SYawej6g-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251906.SYawej6g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251906.SYawej6g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/crypto/poly1305-p10-glue.c:19:
>> arch/powerpc/include/asm/switch_to.h:86:2: error: call to __compiletime_assert_261 declared with 'error' attribute: BUILD_BUG failed
           BUILD_BUG();
           ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:215:1: note: expanded from here
   __compiletime_assert_261
   ^
   In file included from arch/powerpc/crypto/poly1305-p10-glue.c:19:
>> arch/powerpc/include/asm/switch_to.h:86:2: error: call to __compiletime_assert_261 declared with 'error' attribute: BUILD_BUG failed
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:215:1: note: expanded from here
   __compiletime_assert_261
   ^
   In file included from arch/powerpc/crypto/poly1305-p10-glue.c:19:
>> arch/powerpc/include/asm/switch_to.h:86:2: error: call to __compiletime_assert_261 declared with 'error' attribute: BUILD_BUG failed
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:215:1: note: expanded from here
   __compiletime_assert_261
   ^
   In file included from arch/powerpc/crypto/poly1305-p10-glue.c:19:
>> arch/powerpc/include/asm/switch_to.h:86:2: error: call to __compiletime_assert_261 declared with 'error' attribute: BUILD_BUG failed
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:215:1: note: expanded from here
   __compiletime_assert_261
   ^
   4 errors generated.
--
   In file included from arch/powerpc/crypto/chacha-p10-glue.c:18:
>> arch/powerpc/include/asm/switch_to.h:86:2: error: call to __compiletime_assert_261 declared with 'error' attribute: BUILD_BUG failed
           BUILD_BUG();
           ^
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:137:1: note: expanded from here
   __compiletime_assert_261
   ^
   In file included from arch/powerpc/crypto/chacha-p10-glue.c:18:
>> arch/powerpc/include/asm/switch_to.h:86:2: error: call to __compiletime_assert_261 declared with 'error' attribute: BUILD_BUG failed
   include/linux/build_bug.h:59:21: note: expanded from macro 'BUILD_BUG'
   #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                       ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:397:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:385:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:378:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:137:1: note: expanded from here
   __compiletime_assert_261
   ^
   2 errors generated.


vim +/error +86 arch/powerpc/include/asm/switch_to.h

ae3a197e3d0bfe3 David Howells    2012-03-28  75  
ae3a197e3d0bfe3 David Howells    2012-03-28  76  #ifdef CONFIG_VSX
d1e1cf2e38def30 Anton Blanchard  2015-10-29  77  extern void enable_kernel_vsx(void);
ae3a197e3d0bfe3 David Howells    2012-03-28  78  extern void flush_vsx_to_thread(struct task_struct *);
3eb5d5888dc68c9 Anton Blanchard  2015-10-29  79  static inline void disable_kernel_vsx(void)
3eb5d5888dc68c9 Anton Blanchard  2015-10-29  80  {
3eb5d5888dc68c9 Anton Blanchard  2015-10-29  81  	msr_check_and_clear(MSR_FP|MSR_VEC|MSR_VSX);
3eb5d5888dc68c9 Anton Blanchard  2015-10-29  82  }
bd73758803c2eed Christophe Leroy 2021-03-09  83  #else
bd73758803c2eed Christophe Leroy 2021-03-09  84  static inline void enable_kernel_vsx(void)
bd73758803c2eed Christophe Leroy 2021-03-09  85  {
bd73758803c2eed Christophe Leroy 2021-03-09 @86  	BUILD_BUG();
bd73758803c2eed Christophe Leroy 2021-03-09  87  }
bd73758803c2eed Christophe Leroy 2021-03-09  88  

:::::: The code at line 86 was first introduced by commit
:::::: bd73758803c2eedc037c2268b65a19542a832594 powerpc: Fix missing declaration of [en/dis]able_kernel_vsx()

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
