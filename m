Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEA144C77;
	Fri, 28 Feb 2025 13:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750643; cv=none; b=H9gJP3YR9UxPWIFmDzB7Ls3VYnQy6SrcLqPVDAVXHHbrUOOtKNTQcPSXb5ms76jJ94apCQzUolmTood+xQldqlXIdXMMSNW3n737LbZIHgrfllETbB2z3uWGw8VkGzKfj92E+SNSZU7O4i1nOfn7liwofhgXMyOZZDG1WgTRfxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750643; c=relaxed/simple;
	bh=NGl0Zkwq9VSN1Kmx59JZ8JzRul7rEm+x6m3hNpywht4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A0HaPTzFHNQBoYmqakpYftBQ4VTkvr0ateqaiXKBKKdle0e3T7Ex2zNmHwNkp9FiX2+WnUOTy60StUhEU4tm/CDy7u1CPwyZLMYvYGi1OFSwrvnhG//3brf9vsyovPVGE2OTzZjPqWoNziTprxsgA6+crsCd51Awcmh2QcGiY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiEuhMFW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiEuhMFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740750642; x=1772286642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGl0Zkwq9VSN1Kmx59JZ8JzRul7rEm+x6m3hNpywht4=;
  b=kiEuhMFWyTBhDTzir0R4Qk+LKbc0HB4PzvjBYpKUb2svveLzZkfQuqni
   xDsI7pHBMSBYLhE6eWrL1hxokcYTMeLjcJmxFfA2iGv5e5XuZ97rbUL32
   OC3sxlQCtBVMu9uEjlpSJB9QX3/mInua1JdICoDB+5/YDr0KB2G7AZdzS
   jYZOVJ2VJd4rxygv+e+U6TjLEnys5oQ5U3dC5SmPuIwULRVUcm88HNHrL
   GaiHoJVyC3/STg6LjruYzP56CS8hNZmHHUhVT2T4bTI+HJ0U5obIL4//w
   nH3huzJkhsmi+y0+q4Dcs1QW5jrt4dxKlcxlmRleO7fzsopYC0nblAxoj
   g==;
X-CSE-ConnectionGUID: QbADWgjKQoiKGw/xL7p6Hw==
X-CSE-MsgGUID: e09ucTUUQfmaVSa/Hxwgqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52321665"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="52321665"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 05:50:40 -0800
X-CSE-ConnectionGUID: QyyrJWIWTLiFMuDfrXiigA==
X-CSE-MsgGUID: KfI/LFPeSjOsm1sO+0uufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="122294068"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Feb 2025 05:50:38 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to0lA-000Ey0-0c;
	Fri, 28 Feb 2025 13:50:36 +0000
Date: Fri, 28 Feb 2025 21:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call-constraint-fix 4/5] mm/slub.c:3573:9: error:
 expected ')'
Message-ID: <202502282103.R6IWsNEA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call-constraint-fix
head:   a882d0410fb655d41b5c5158dcd1a720275cf505
commit: 8f0a744bb81e98286456e1f433565240cd66e440 [4/5] x86: Convert ASM_CALL_CONSTRAINT to input constraint
config: i386-buildonly-randconfig-002-20250228 (https://download.01.org/0day-ci/archive/20250228/202502282103.R6IWsNEA-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502282103.R6IWsNEA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502282103.R6IWsNEA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slub.c:49:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/slub.c:3573:9: error: expected ')'
    3573 |         return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid.full,
         |                ^
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   arch/x86/include/asm/percpu.h:368:50: note: expanded from macro 'this_cpu_try_cmpxchg64'
     368 | #define this_cpu_try_cmpxchg64(pcp, ovalp, nval)        percpu_try_cmpxchg64_op(8, volatile, pcp, ovalp, nval)
         |                                                         ^
   arch/x86/include/asm/percpu.h:359:5: note: expanded from macro 'percpu_try_cmpxchg64_op'
     359 |                   COMMA_ASM_CALL_CONSTRAINT)                            \
         |                   ^
>> mm/slub.c:3573:9: error: expected expression
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   arch/x86/include/asm/percpu.h:368:50: note: expanded from macro 'this_cpu_try_cmpxchg64'
     368 | #define this_cpu_try_cmpxchg64(pcp, ovalp, nval)        percpu_try_cmpxchg64_op(8, volatile, pcp, ovalp, nval)
         |                                                         ^
   arch/x86/include/asm/percpu.h:360:3: note: expanded from macro 'percpu_try_cmpxchg64_op'
     360 |                 : "memory");                                            \
         |                 ^
>> mm/slub.c:3573:9: error: expected expression
   mm/slab.h:31:39: note: expanded from macro 'this_cpu_try_cmpxchg_freelist'
      31 | #define this_cpu_try_cmpxchg_freelist   this_cpu_try_cmpxchg64
         |                                         ^
   arch/x86/include/asm/percpu.h:368:50: note: expanded from macro 'this_cpu_try_cmpxchg64'
     368 | #define this_cpu_try_cmpxchg64(pcp, ovalp, nval)        percpu_try_cmpxchg64_op(8, volatile, pcp, ovalp, nval)
         |                                                         ^
   arch/x86/include/asm/percpu.h:360:13: note: expanded from macro 'percpu_try_cmpxchg64_op'
     360 |                 : "memory");                                            \
         |                           ^
   2 warnings and 3 errors generated.


vim +3573 mm/slub.c

0b303fb402862dc Vlastimil Babka 2021-05-08  3563  
0af8489b0216fa1 Vlastimil Babka 2022-11-15  3564  #ifndef CONFIG_SLUB_TINY
6801be4f2653e5f Peter Zijlstra  2023-05-31  3565  static inline bool
6801be4f2653e5f Peter Zijlstra  2023-05-31  3566  __update_cpu_freelist_fast(struct kmem_cache *s,
6801be4f2653e5f Peter Zijlstra  2023-05-31  3567  			   void *freelist_old, void *freelist_new,
6801be4f2653e5f Peter Zijlstra  2023-05-31  3568  			   unsigned long tid)
6801be4f2653e5f Peter Zijlstra  2023-05-31  3569  {
6801be4f2653e5f Peter Zijlstra  2023-05-31  3570  	freelist_aba_t old = { .freelist = freelist_old, .counter = tid };
6801be4f2653e5f Peter Zijlstra  2023-05-31  3571  	freelist_aba_t new = { .freelist = freelist_new, .counter = next_tid(tid) };
6801be4f2653e5f Peter Zijlstra  2023-05-31  3572  
6801be4f2653e5f Peter Zijlstra  2023-05-31 @3573  	return this_cpu_try_cmpxchg_freelist(s->cpu_slab->freelist_tid.full,
6801be4f2653e5f Peter Zijlstra  2023-05-31  3574  					     &old.full, new.full);
6801be4f2653e5f Peter Zijlstra  2023-05-31  3575  }
6801be4f2653e5f Peter Zijlstra  2023-05-31  3576  

:::::: The code at line 3573 was first introduced by commit
:::::: 6801be4f2653e5fdddca73b527cf0728284ba8a3 slub: Replace cmpxchg_double()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
