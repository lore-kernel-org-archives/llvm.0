Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A42E847B;
	Sun, 10 Nov 2024 04:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731211459; cv=none; b=PMEr3NBqrXbl23VIzYa4grfVyw6nCCHvnH5qajdIyIVjpDhRXSXM2OHLvbm8FquQjXUFuWtCF4HwImQ1XkWI5qbMECWvW0DaWpKSb+7DLiiWnXvJlpWis0gVJiHfCHxGNZtZU6JqG76asx+ZiQQA+Ml2OJGHfpSSLe+7CZD6lQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731211459; c=relaxed/simple;
	bh=a/RXaoAOKNrguX/3+P/f79AbkmG80BoWN7LqXh+/7q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XZo5Rp3VYZq6FjkqBjY+7j8RBZAqjyxxlCz2IZRKIaN0yLJV0rGjnXoJHukK/dG4LblkLOv8WuzFDiInI6ohOoRf/2toU1430ah1gUsgo2dmU3jFSYSzBZV1NssAlRzdbvGTpNC79TEfdHAPSdU4pFBq9szm77bmm9Szoq19OSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlabIr/s; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlabIr/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731211458; x=1762747458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/RXaoAOKNrguX/3+P/f79AbkmG80BoWN7LqXh+/7q8=;
  b=WlabIr/sdzb4ZmyWMKV/9GbnijVXYM0IT3wTyNAIfLsZMyUDiGsjg7UL
   6TXU0jnhOw9UTIhQoR+24ZVNdYr7o8VtQkCXOyd32pV4YlcLw1679aGXZ
   GKwIuDvOUvP5q32q/1YirgElF5kbNtrhq4g1abmo+ls1AcIU+Rp+PY4Ij
   1eYa/nhC6Q795iAd9+3akiCoJ1brzQMkBokCdDH49F8EmoGTlsgs33vom
   ykoWrv2/LofAxSeCLkngrb2ZaFgek0iBcKIuPjniqAdPrvw+fUjzXYsO4
   /k+RpBchtkdb4/B01JiYI3fqOdoAC8tq/fPPZPfchfd4XwDFlbTaJx4b8
   A==;
X-CSE-ConnectionGUID: h+EJQVy6T06Aq9bU6xQGag==
X-CSE-MsgGUID: 9cVrCSeEQ66rNrgYqJ6+iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="18672577"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="18672577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 20:04:17 -0800
X-CSE-ConnectionGUID: 5ZQiFFxtSy+KXknX1Jlrdw==
X-CSE-MsgGUID: aar/hyeOQl6hskj3eFbWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86442457"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2024 20:04:16 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9zBN-000syU-2D;
	Sun, 10 Nov 2024 04:04:13 +0000
Date: Sun, 10 Nov 2024 12:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-va-simplify 1/13] mm/zsmalloc.c:224:21: error: fields
 must have a constant size: 'variable length array in structure' extension
 will never be supported
Message-ID: <202411101142.p3okQp2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-va-simplify
head:   b03c9fa1f2d03aeece38f4b8ea8c05edb0e156b2
commit: 955d113b8b4401950ea83647579b79bff73843e0 [1/13] arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411101142.p3okQp2c-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101142.p3okQp2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101142.p3okQp2c-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/zsmalloc.c:47:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> mm/zsmalloc.c:224:32: warning: variable length array used [-Wvla]
     224 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                                       ^~~~~~~~~~~~~~~
   mm/zsmalloc.c:146:59: note: expanded from macro 'ZS_SIZE_CLASSES'
     146 | #define ZS_SIZE_CLASSES (DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_SIZE, \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
     147 |                                       ZS_SIZE_CLASS_DELTA) + 1)
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:128:52: note: expanded from macro 'ZS_MIN_ALLOC_SIZE'
     128 |         MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> OBJ_INDEX_BITS))
         |                                                           ^
   mm/zsmalloc.c:116:41: note: expanded from macro 'OBJ_INDEX_BITS'
     116 | #define OBJ_INDEX_BITS  (BITS_PER_LONG - _PFN_BITS)
         |                                          ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:330:30: note: expanded from macro 'MAX'
     330 | #define MAX(a,b) __cmp(max,a,b)
         |                              ^
   include/linux/minmax.h:90:45: note: expanded from macro '__cmp'
      90 | #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
         |                                             ^
   include/uapi/linux/const.h:51:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
      51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
>> mm/zsmalloc.c:224:21: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
     224 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                            ^
   5 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +224 mm/zsmalloc.c

0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  220  
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  221  struct zs_pool {
6f3526d6db7cbe mm/zsmalloc.c                            Sergey SENOZHATSKY 2015-11-06  222  	const char *name;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  223  
cf8e0fedf0784e mm/zsmalloc.c                            Jerome Marchand    2017-07-10 @224  	struct size_class *size_class[ZS_SIZE_CLASSES];
2e40e163a25af3 mm/zsmalloc.c                            Minchan Kim        2015-04-15  225  	struct kmem_cache *handle_cachep;
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim        2016-07-26  226  	struct kmem_cache *zspage_cachep;
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  227  
13de8933c96b45 mm/zsmalloc.c                            Minchan Kim        2014-10-09  228  	atomic_long_t pages_allocated;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  229  
7d3f3938236b4b mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  230  	struct zs_pool_stats stats;
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  231  
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  232  	/* Compact classes */
c19b548b493455 mm/zsmalloc.c                            Qi Zheng           2023-09-11  233  	struct shrinker *shrinker;
93144ca35041b0 mm/zsmalloc.c                            Aliaksei Karaliou  2018-01-31  234  

:::::: The code at line 224 was first introduced by commit
:::::: cf8e0fedf0784ef4bc1889380b09eda295e3d109 mm/zsmalloc: simplify zs_max_alloc_size handling

:::::: TO: Jerome Marchand <jmarchan@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
