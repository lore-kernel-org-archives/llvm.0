Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3925759B52;
	Mon, 25 Mar 2024 21:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711403143; cv=none; b=HkJwzlDBR60euxdV3QpRY9j43JEdEOh27m5B5KQOrYu9CfiF7zGtyqohfP/1THlFSqPtz9CgN1j/HcFD764R9nFEA4QTrXnEdynMhok6prI/gWS41kyMcZgTRo1lIvhQnYhfpaXu2JsKTqf5BpRMUTGmatzGTD/SEPCZzMMqrHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711403143; c=relaxed/simple;
	bh=lxi+s4jtiPZZzF8cw7c031dIvmeO1UVardrvA2N5rt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KgmV2RTxh/0Zj1NAgkORxdXCA8a5QoaOlJZVmSHFDp3fNhq88Xw7X88lm/IjTo2seP28xxv+RgtNEdGoTc8giPRdZ8abBTUU6WxSOLsyTOaLfAeFuIKsL4nWc38VUgAvFrqv6mciIURLrb0NwIqwYI96X4e6/iazGOH+ei4OgmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vu21CpNI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vu21CpNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711403141; x=1742939141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lxi+s4jtiPZZzF8cw7c031dIvmeO1UVardrvA2N5rt8=;
  b=Vu21CpNI9DH8davR1BJh60w7KgRurLx8blHNW/MVTjWjJQsoMzJja9KY
   Hdrg5WV7uWoerSStsJWyBA4klql2V3DZbfzEDu73Y6lZw/KGbtRzApbsH
   jNstk7Ok6rk3R+lylrmHKbvi9HpEqp2mq6/X0OiFZWYSXWA4X3u3KNwnZ
   kEYsw/bUwtkMJI3Licf8kXTIfpngnt7bAZ4RVe5+lY5aoK246+izkJVzm
   Lf77ogJ0jxcfP4HeO/UGfc7f5Bo4FnqQdhmh+6zsdKD7+GLlKL2SiXTcM
   YxYkXH/MrhTbS0tCKj/ySii9VX8lC0lWuhJILljeG/FDQ/W4VRZ2r9UHK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17162902"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="17162902"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 14:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15709147"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Mar 2024 14:45:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ros8C-000Mqk-1C;
	Mon, 25 Mar 2024 21:45:24 +0000
Date: Tue, 26 Mar 2024 05:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm32-cfi 4/10] arch/arm/mm/cache.c:14:13: error:
 redefinition of 'nop_flush_icache_all'
Message-ID: <202403260553.rOca8VwH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm32-cfi
head:   2fd3a7956b8a603c5d59b5851265a693536d9c35
commit: 4c65b5257d3f8b2264b4b1c22d12f43127da740d [4/10] ARM: mm: Rewrite cacheflush vtables in CFI safe C
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240326/202403260553.rOca8VwH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403260553.rOca8VwH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403260553.rOca8VwH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/mm/cache.c:10:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm/mm/cache.c:14:13: error: redefinition of 'nop_flush_icache_all'
      14 | static void nop_flush_icache_all(void)
         |             ^
   arch/arm/include/asm/glue-cache.h:130:20: note: previous definition is here
     130 | static inline void nop_flush_icache_all(void) { }
         |                    ^
>> arch/arm/mm/cache.c:18:13: error: redefinition of 'nop_flush_user_cache_range'
      18 | static void nop_flush_user_cache_range(unsigned long start, unsigned long end, unsigned int flags)
         |             ^
   arch/arm/include/asm/glue-cache.h:134:20: note: previous definition is here
     134 | static inline void nop_flush_user_cache_range(unsigned long a,
         |                    ^
>> arch/arm/mm/cache.c:22:13: error: redefinition of 'nop_coherent_kern_range'
      22 | static void nop_coherent_kern_range(unsigned long start, unsigned long end)
         |             ^
   arch/arm/include/asm/glue-cache.h:137:20: note: previous definition is here
     137 | static inline void nop_coherent_kern_range(unsigned long a, unsigned long b) { }
         |                    ^
>> arch/arm/mm/cache.c:26:12: error: redefinition of 'nop_coherent_user_range'
      26 | static int nop_coherent_user_range(unsigned long, unsigned long)
         |            ^
   arch/arm/include/asm/glue-cache.h:138:19: note: previous definition is here
     138 | static inline int nop_coherent_user_range(unsigned long a,
         |                   ^
>> arch/arm/mm/cache.c:26:49: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      26 | static int nop_coherent_user_range(unsigned long, unsigned long)
         |                                                 ^
   arch/arm/mm/cache.c:26:64: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      26 | static int nop_coherent_user_range(unsigned long, unsigned long)
         |                                                                ^
>> arch/arm/mm/cache.c:31:13: error: redefinition of 'nop_flush_kern_dcache_area'
      31 | static void nop_flush_kern_dcache_area(void *kaddr, size_t size)
         |             ^
   arch/arm/include/asm/glue-cache.h:140:20: note: previous definition is here
     140 | static inline void nop_flush_kern_dcache_area(void *a, size_t s) { }
         |                    ^
>> arch/arm/mm/cache.c:35:13: error: redefinition of 'nop_dma_map_area'
      35 | static void nop_dma_map_area(const void *start, size_t size, int flags)
         |             ^
   arch/arm/include/asm/glue-cache.h:144:20: note: previous definition is here
     144 | static inline void nop_dma_map_area(const void *s, size_t l, int f) { }
         |                    ^
>> arch/arm/mm/cache.c:39:13: error: redefinition of 'nop_dma_unmap_area'
      39 | static void nop_dma_unmap_area(const void *start, size_t size, int flags)
         |             ^
   arch/arm/include/asm/glue-cache.h:145:20: note: previous definition is here
     145 | static inline void nop_dma_unmap_area(const void *s, size_t l, int f) { }
         |                    ^
>> arch/arm/mm/cache.c:43:13: error: redefinition of 'nop_dma_flush_range'
      43 | static void nop_dma_flush_range(const void *start, const void *end)
         |             ^
   arch/arm/include/asm/glue-cache.h:142:20: note: previous definition is here
     142 | static inline void nop_dma_flush_range(const void *a, const void *b) { }
         |                    ^
   3 warnings and 8 errors generated.


vim +/nop_flush_icache_all +14 arch/arm/mm/cache.c

    11	
    12	/* The NOP cache is just a set of dummy stubs that by definition does nothing */
    13	#ifdef CONFIG_CPU_CACHE_NOP
  > 14	static void nop_flush_icache_all(void)
    15	{
    16	}
    17	
  > 18	static void nop_flush_user_cache_range(unsigned long start, unsigned long end, unsigned int flags)
    19	{
    20	}
    21	
  > 22	static void nop_coherent_kern_range(unsigned long start, unsigned long end)
    23	{
    24	}
    25	
  > 26	static int nop_coherent_user_range(unsigned long, unsigned long)
    27	{
    28		return 0;
    29	}
    30	
  > 31	static void nop_flush_kern_dcache_area(void *kaddr, size_t size)
    32	{
    33	}
    34	
  > 35	static void nop_dma_map_area(const void *start, size_t size, int flags)
    36	{
    37	}
    38	
  > 39	static void nop_dma_unmap_area(const void *start, size_t size, int flags)
    40	{
    41	}
    42	
  > 43	static void nop_dma_flush_range(const void *start, const void *end)
    44	{
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
