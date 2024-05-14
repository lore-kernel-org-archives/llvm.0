Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FFD139D10;
	Tue, 14 May 2024 09:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715680271; cv=none; b=kXF2Ekf5DrPms6DeVOIgjud3X4nxkOYQ1O5KutttFnuPfWSC2yikH83iEuh77wo8iBzgtEUr4vHjXKeQ6agd04laIQRYV0Ou1YTfw7j3dOk6fvGBP1gxRGpwCDxPI4BR2Hk+dfR0GwK4/BFNhwD+2jQins2CqRTv2EIKyUaqPtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715680271; c=relaxed/simple;
	bh=e/7QB0ztLm37S9xPnzwJmq7yHefNqMLEqkgHjv25Txk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fDjO/AfGIs7J8ckoekObvh+QTQHVdrYQg+jsQZyDCuKEm5+OQXs/23dL3JymdBoJM2Ttnr3guoS37tb8LoBJngkmFR4loRjplTFsXKSrvxPmexw4mWb1PqGwnWXSaoTMLxzDqkvExyK8TeBJtQWyC84VULWimIyCFgUuzejk50k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyPg14Mw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyPg14Mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715680270; x=1747216270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/7QB0ztLm37S9xPnzwJmq7yHefNqMLEqkgHjv25Txk=;
  b=NyPg14MwjuQVMfERntWIV4uEU1DKVA1KEClxbtlnnvZepNfDTfZBPQ1F
   dSntBSphNB141eTjwHgN5c/pu0Sm0/vxK/EjhnROV02ADZLtqV8GAs3D2
   6Pr6dJsvXxdeveKG0G11ga791JyIKFgl1vr7vjAckxDdupqbzjkPHD3oQ
   dTzILUcsVMHLbVZzdAMI1shBC8fJzZjBxs9P1hk67GtHvqWR9SZcqjfIZ
   P/xZY3RXP2eOi7OwIYTsAzrWD5amr9xSjchqkUQ6IalVm2Qcb3+X5Y93m
   cWYhycq1IFQQ5VfbdB8aIHVANR+u8OIEJV0Yy+A6mixOsWV6BAXAfa2JD
   w==;
X-CSE-ConnectionGUID: JOHdsuPGSY6TxC0r0iJj5A==
X-CSE-MsgGUID: vGa7GotjTXOVRQhE+SEb0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15487045"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="15487045"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 02:51:09 -0700
X-CSE-ConnectionGUID: f65id6e2QqyTh9LqZCIFTA==
X-CSE-MsgGUID: OZNKEXkXTH+WPsWTdYZigA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30700220"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2024 02:51:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6ooK-000BLv-2p;
	Tue, 14 May 2024 09:51:04 +0000
Date: Tue, 14 May 2024 17:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 32/33] mm/damon/acma.c:62:14: error: use of
 undeclared identifier 'max_mem'
Message-ID: <202405141712.IN8VzCy4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   8babfaa14bfc8f45e2c3d093952ab737fd0db1d5
commit: 9c0c2a5550718fd72b4384589be3b4c470a85502 [32/33] mm/damon/acma: implement scale up feature
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240514/202405141712.IN8VzCy4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405141712.IN8VzCy4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405141712.IN8VzCy4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/damon/acma.c:16:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/damon/acma.c:16:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/damon/acma.c:16:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from mm/damon/acma.c:16:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   mm/damon/acma.c:55:14: error: use of undeclared identifier 'min_mem'
      55 | module_param(min_mem, ulong, 0600);
         |              ^
   mm/damon/acma.c:55:14: error: use of undeclared identifier 'min_mem'
>> mm/damon/acma.c:62:14: error: use of undeclared identifier 'max_mem'
      62 | module_param(max_mem, ulong, 0600);
         |              ^
>> mm/damon/acma.c:62:14: error: use of undeclared identifier 'max_mem'
   mm/damon/acma.c:190:22: error: too few arguments to function call, expected 6, have 5
     182 |         return damon_new_scheme(
         |                ~~~~~~~~~~~~~~~~
     183 |                         pattern,
     184 |                         action,
     185 |                         /* work for every second */
     186 |                         1000000,
     187 |                         /* under the quota. */
     188 |                         &quota,
     189 |                         /* (De)activate this according to the watermarks. */
     190 |                         &damon_acma_wmarks);
         |                                           ^
   include/linux/damon.h:770:15: note: 'damon_new_scheme' declared here
     770 | struct damos *damon_new_scheme(struct damos_access_pattern *pattern,
         |               ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     771 |                         enum damos_action action,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
     772 |                         unsigned long apply_interval_us,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     773 |                         struct damos_quota *quota,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~
     774 |                         struct damos_watermarks *wmarks,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     775 |                         int target_nid);
         |                         ~~~~~~~~~~~~~~
   mm/damon/acma.c:205:3: error: must use 'enum' tag to refer to type 'damos_quota_goal_metric'
     205 |                 damos_quota_goal_metric goal_metric)
         |                 ^
         |                 enum 
   mm/damon/acma.c:209:2: error: use of undeclared identifier 'goal'
     209 |         goal = damos_new_quota_goal(goal_metric, quota_mem_pressure_us);
         |         ^
   mm/damon/acma.c:210:7: error: use of undeclared identifier 'goal'
     210 |         if (!goal)
         |              ^
   mm/damon/acma.c:212:39: error: use of undeclared identifier 'goal'
     212 |         damos_add_quota_goal(&scheme->quota, goal);
         |                                              ^
   mm/damon/acma.c:245:52: error: use of undeclared identifier 'KB'
     245 |         start_limit = monitor_region_start + min_mem_kb * KB;
         |                                                           ^
   mm/damon/acma.c:248:45: error: use of undeclared identifier 'MB'
     248 |         for (end = end_limit; end >= start_limit + SCALE_WINDOW;
         |                                                    ^
   mm/damon/acma.c:220:29: note: expanded from macro 'SCALE_WINDOW'
     220 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:249:11: error: use of undeclared identifier 'MB'
     249 |                         end -= SCALE_WINDOW) {
         |                                ^
   mm/damon/acma.c:220:29: note: expanded from macro 'SCALE_WINDOW'
     220 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:250:7: error: call to undeclared function 'damon_alloced_bytes'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     250 |                 if (damon_alloced_bytes(end, end - SCALE_WINDOW)
         |                     ^
   mm/damon/acma.c:250:38: error: use of undeclared identifier 'MB'
     250 |                 if (damon_alloced_bytes(end, end - SCALE_WINDOW)
         |                                                    ^
   mm/damon/acma.c:220:29: note: expanded from macro 'SCALE_WINDOW'
     220 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:251:8: error: use of undeclared identifier 'MB'
     251 |                                 != SCALE_WINDOW)
         |                                    ^
   mm/damon/acma.c:220:29: note: expanded from macro 'SCALE_WINDOW'
     220 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:254:52: error: use of undeclared identifier 'MB'
     254 |         filter->addr_range.start = max(start_limit, end - SCALE_WINDOW);
         |                                                           ^
   mm/damon/acma.c:220:29: note: expanded from macro 'SCALE_WINDOW'
     220 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:276:41: error: use of undeclared identifier 'KB'
     276 |         end_limit = start_limit + max_mem_kb * KB;
         |                                                ^
   mm/damon/acma.c:279:49: error: use of undeclared identifier 'MB'
     279 |         for (start = start_limit; start <= end_limit - SCALE_WINDOW;
         |                                                        ^
   mm/damon/acma.c:220:29: note: expanded from macro 'SCALE_WINDOW'
     220 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   mm/damon/acma.c:280:13: error: use of undeclared identifier 'MB'
     280 |                         start += SCALE_WINDOW) {
         |                                  ^
   mm/damon/acma.c:220:29: note: expanded from macro 'SCALE_WINDOW'
     220 | #define SCALE_WINDOW    (128 * MB)
         |                                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.


vim +/max_mem +62 mm/damon/acma.c

    56	
    57	/*
    58	 * Maximum amount of memory to be guaranteed to the system.  In other words,
    59	 * the upper limit of the scaling.
    60	 */
    61	static unsigned long max_mem_kb __read_mostly;
  > 62	module_param(max_mem, ulong, 0600);
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
