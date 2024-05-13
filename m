Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D5F6AC0;
	Mon, 13 May 2024 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715613535; cv=none; b=VsH0DUjXk+wqrE06Haz7SM9xEjmJ5eUEUii7WnR+zzFsxds5AYQ0g3/9Vv9xAo1D33ohmzB3X8Ae9+zFw3Y04hFRU2bJH7hoUDboqdHiPB+NnUCaWbX0d16qgzxiFhL/pCSGcnidNgBsjqT6Mhw1exnWtN/Z8/BZd80gZltyj80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715613535; c=relaxed/simple;
	bh=lik5r2c+wqkSKBDC45HAKwNAuBOJg6Gkv8/sSAPw+2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dX/dvpku4G/DaV1g6VWNbkHbdkZX3nc//Xcb15+tJTukso4+aaMxJZ/kw7lSqro73v/XkspYH9CA1bZidKzREKeuiasqDdIc/bvqb/7N6TG+1P7Bu+72LqB4+bxVjVLH2Gg3hOGQlQ8nxNJ+kivzCHbWFUV9RmdakVomi2HoDzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSz/rpLJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSz/rpLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715613534; x=1747149534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lik5r2c+wqkSKBDC45HAKwNAuBOJg6Gkv8/sSAPw+2U=;
  b=PSz/rpLJ2sX0qzdOjHDdeAyrP0yfQ29IOAGLnTCWjY401Wv0uNyNJ6Fh
   78sPe1bsthAs9bQeh6SytJ1yEwuyGwnQ0xqI+SlPkjBmqmvBNu11TBeQS
   JaE8Ad6K038pwQ33cANSljyxA3g7keAN6HlT8xLCtX6mMGjRmBJExRb8/
   lGLPLFIsAxN7+sXGrwEzfOgnA09HbmVh30wqo2sJqfjPyj/SBLfxk5WPe
   QToUi+eQB0Z/5gudso5S4TlK72GIuTaVEJvROxz3uW/ljJwuPZ8Ml+mtS
   9tc9Z/RTT2T1JiHF7Qof9vqKGOAVcaAcWvl4gh0Bl7WmAIoA/ikgmXOpX
   Q==;
X-CSE-ConnectionGUID: qBHESlZbTXSQTf4cJA7EfQ==
X-CSE-MsgGUID: k/y7v7NxS3equ73vqQvoQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="15373286"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="15373286"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 08:17:43 -0700
X-CSE-ConnectionGUID: atJ33oOBRY2JHY8/OHAPHw==
X-CSE-MsgGUID: p5QPv+oVTbaTRlPYYZtGlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="35240081"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 May 2024 08:17:41 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6XQo-000APX-01;
	Mon, 13 May 2024 15:17:38 +0000
Date: Mon, 13 May 2024 23:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 29/33] mm/damon/acma.c:154:22: error: too few
 arguments to function call, expected 6, have 5
Message-ID: <202405132331.x5eUBFEP-lkp@intel.com>
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
commit: 1465b25a340a8aa09800ddcf3d4aef185ea6c84c [29/33] mm/damon: add the initial part of access/contiguity-aware memory auto-scaling module
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240513/202405132331.x5eUBFEP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405132331.x5eUBFEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405132331.x5eUBFEP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/damon/acma.c:19:
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
   In file included from mm/damon/acma.c:19:
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
   In file included from mm/damon/acma.c:19:
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
   In file included from mm/damon/acma.c:19:
   In file included from include/linux/damon.h:11:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/damon/acma.c:154:22: error: too few arguments to function call, expected 6, have 5
     146 |         return damon_new_scheme(
         |                ~~~~~~~~~~~~~~~~
     147 |                         pattern,
     148 |                         action,
     149 |                         /* work for every second */
     150 |                         1000000,
     151 |                         /* under the quota. */
     152 |                         &quota,
     153 |                         /* (De)activate this according to the watermarks. */
     154 |                         &damon_acma_wmarks);
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
>> mm/damon/acma.c:169:3: error: must use 'enum' tag to refer to type 'damos_quota_goal_metric'
     169 |                 damos_quota_goal_metric goal_metric)
         |                 ^
         |                 enum 
>> mm/damon/acma.c:173:2: error: use of undeclared identifier 'goal'
     173 |         goal = damos_new_quota_goal(goal_metric, quota_mem_pressure_us);
         |         ^
   mm/damon/acma.c:174:7: error: use of undeclared identifier 'goal'
     174 |         if (!goal)
         |              ^
   mm/damon/acma.c:176:39: error: use of undeclared identifier 'goal'
     176 |         damos_add_quota_goal(&scheme->quota, goal);
         |                                              ^
   mm/damon/acma.c:206:27: warning: unused variable 'goal' [-Wunused-variable]
     206 |         struct damos_quota_goal *goal;
         |                                  ^~~~
   mm/damon/acma.c:303:8: error: use of undeclared identifier 'DAMOS_LRU_RECLAIM'; did you mean 'DAMOS_LRU_DEPRIO'?
     303 |                 case DAMOS_LRU_RECLAIM:
         |                      ^~~~~~~~~~~~~~~~~
         |                      DAMOS_LRU_DEPRIO
   include/linux/damon.h:131:2: note: 'DAMOS_LRU_DEPRIO' declared here
     131 |         DAMOS_LRU_DEPRIO,
         |         ^
   mm/damon/acma.c:314:1: error: function definition is not allowed here
     314 | {
         | ^
   mm/damon/acma.c:319:1: error: function definition is not allowed here
     319 | {
         | ^
   mm/damon/acma.c:335:13: error: use of undeclared identifier 'damon_acma_init'
     335 | module_init(damon_acma_init);
         |             ^
   mm/damon/acma.c:335:30: error: expected '}'
     335 | module_init(damon_acma_init);
         |                              ^
   mm/damon/acma.c:297:1: note: to match this '{'
     297 | {
         | ^
   8 warnings and 10 errors generated.


vim +154 mm/damon/acma.c

   140	
   141	static struct damos *damon_acma_new_scheme(
   142			struct damos_access_pattern *pattern, enum damos_action action)
   143	{
   144		struct damos_quota quota = damon_acma_quota;
   145	
   146		return damon_new_scheme(
   147				pattern,
   148				action,
   149				/* work for every second */
   150				1000000,
   151				/* under the quota. */
   152				&quota,
   153				/* (De)activate this according to the watermarks. */
 > 154				&damon_acma_wmarks);
   155	}
   156	
   157	static void damon_acma_copy_quota_status(struct damos_quota *dst,
   158			struct damos_quota *src)
   159	{
   160		dst->total_charged_sz = src->total_charged_sz;
   161		dst->total_charged_ns = src->total_charged_ns;
   162		dst->charged_sz = src->charged_sz;
   163		dst->charged_from = src->charged_from;
   164		dst->charge_target_from = src->charge_target_from;
   165		dst->charge_addr_from = src->charge_addr_from;
   166	}
   167	
   168	static int damon_acma_set_scheme_quota(struct damos *scheme, struct damos *old,
 > 169			damos_quota_goal_metric goal_metric)
   170	{
   171		if (old)
   172			damon_acma_copy_quota_status(&scheme->quota, &old->quota);
 > 173		goal = damos_new_quota_goal(goal_metric, quota_mem_pressure_us);
   174		if (!goal)
   175			return -ENOMEM;
   176		damos_add_quota_goal(&scheme->quota, goal);
   177		return 0;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
