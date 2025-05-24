Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234214AD2D;
	Sat, 24 May 2025 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748071714; cv=none; b=tbSuMgFDcDKwqDk+MexaHS6XBdbyZZFv8vXnV74beINwR3XQLzUAOmiSbAxRQcNv0s9oZkxiMQCA/OycFNOQJMob87V1askhyWpWyn5grSoMlZf9pk1NySJ/oTHGzAhFui0sjiWhYENmfi++OKekWHzYzwpo18mWZ+dJqPrtUwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748071714; c=relaxed/simple;
	bh=CCBGy39Ite/sXX18GB/h4Kkhg+kNyDou21OusBlurOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KhhBwC4K2IWL+d+KDoUWA4RmF303Qrqmx/E86bLIbhz9SX3dbxMpANO4F07tQzQcknKc/UCW4Rl6daJK+aVuiRfcy6iZo8wlOaD4lSMLL34XrXOS1SqwFNFiaOZgUsCnNVKq9KYfBejRtXp/quYh5Y3oJ0oMV5YgcPtxh03RdYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSzva/k8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSzva/k8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748071713; x=1779607713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CCBGy39Ite/sXX18GB/h4Kkhg+kNyDou21OusBlurOM=;
  b=lSzva/k8wV2R0AH7gtabE4W4BJ/KEpVicNByQClfE1aSHzxQRbhmJSNb
   01NNgoHA3zyiQgD4jijagF76IhyxwvbsyzkooOLzTRiEZ+UL0Cr3z30tb
   Yxsi0n9zqPvfkXTHFXh5jA+tL0itp4dXIBgYhcjAy6jawQizWeYuElbjk
   xUWc5p8DeDHRUCp5GvvyNCAXmB+O50cR4ZhXvdVp6QGWtZWuB6IQxn7WQ
   VNyGM3RBSwuuUM/uWDnKg72dwxULimfZHeJF0OULJv2lHRoSkliLZhcki
   IHC40QYEYTzx1QgpKon80v6vjwO0qx/CQqn6HohWEA+3eGuVQy1Nxl1oN
   Q==;
X-CSE-ConnectionGUID: P5+C08nKSOy/I4CPoeUjTw==
X-CSE-MsgGUID: 4eLaoyfEQvq6iHUOWbU8dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50271783"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50271783"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 00:28:32 -0700
X-CSE-ConnectionGUID: Rvg0zNqPTFa2KvaLSSu/kQ==
X-CSE-MsgGUID: jprCS8/CROufPBuFvuERyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141381352"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 May 2025 00:28:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIjIx-000R1M-34;
	Sat, 24 May 2025 07:28:27 +0000
Date: Sat, 24 May 2025 15:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LUCI Bot <vijayendra.suman@oracle.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [jlayton:uek-localio 2035/2262] fs/dcache.c:1524:15: error: call to
 undeclared function 'get_nr_dentry_negative'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202505241556.znrmDJD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: e1acd9346cb93ba4b4d1547147c6815e229bdbdb [2035/2262] fs/dcache: schedule only one instance of negative dentry shrinker
config: hexagon-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241556.znrmDJD9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241556.znrmDJD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241556.znrmDJD9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/dcache.c:31:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   include/linux/highmem.h:265:2: error: call to undeclared function 'clear_user_page_uncached'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     265 |         clear_user_page_uncached(addr, vaddr, page);
         |         ^
   include/linux/highmem.h:265:2: note: did you mean 'clear_user_highpage_uncached'?
   include/linux/highmem.h:261:20: note: 'clear_user_highpage_uncached' declared here
     261 | static inline void clear_user_highpage_uncached(struct page *page, unsigned long vaddr)
         |                    ^
     262 | {
     263 |         void *addr = kmap_atomic(page);
     264 | 
     265 |         clear_user_page_uncached(addr, vaddr, page);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~
         |         clear_user_highpage_uncached
>> fs/dcache.c:1524:15: error: call to undeclared function 'get_nr_dentry_negative'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1524 |         long count = get_nr_dentry_negative();
         |                      ^
   fs/dcache.c:1584:10: error: call to undeclared function 'get_nr_dentry_negative'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1584 |         count = get_nr_dentry_negative();
         |                 ^
   fs/dcache.c:1577:7: warning: variable 'last_n_neg' set but not used [-Wunused-but-set-variable]
    1577 |         long last_n_neg, excess, count;
         |              ^
   fs/dcache.c:1578:16: warning: variable 'start' set but not used [-Wunused-but-set-variable]
    1578 |         unsigned long start;
         |                       ^
   2 warnings and 3 errors generated.


vim +/get_nr_dentry_negative +1524 fs/dcache.c

  1516	
  1517	/*
  1518	 * Prune dentries from a super block.
  1519	 */
  1520	static void prune_negative_one_sb(struct super_block *sb, void *arg)
  1521	{
  1522		unsigned long freed, scan;
  1523		long limit;
> 1524		long count = get_nr_dentry_negative();
  1525		struct prune_negative_ctrl *ctrl = arg;
  1526		LIST_HEAD(dispose);
  1527	
  1528		/*
  1529		 * Try to spread the scan over 5 iterations if the number is
  1530		 * reasonable. If the overshoot is less than 25%, spread the
  1531		 * spread the pruning across 5 iterations, not to impact
  1532		 * the performance. Otherwise, prune aggrressively.
  1533		 * Add an extra 1% as a minimum and to increase the chance
  1534		 * that the after operation dentry count stays below the limit.
  1535		 */
  1536		limit = neg_dentry_nfree_init + ctrl->prune_ncpus * (neg_dentry_percpu_limit -
  1537					(neg_dentry_percpu_limit / 100));
  1538	
  1539		if (limit >= count || limit < 4) /* Haven't crossed the limit yet */
  1540			return;
  1541	
  1542		if ((count-limit) < (limit / 4))
  1543			scan = (count - limit) / (ctrl->prune_nsupers * 5);
  1544		else
  1545			scan = (count - limit) / ctrl->prune_nsupers;
  1546	
  1547		if (ctrl->prune_percent) {
  1548			freed = list_lru_walk(&sb->s_dentry_lru, dentry_negative_lru_isolate,
  1549				&dispose, scan);
  1550	
  1551			if (freed) {
  1552				shrink_dentry_list(&dispose);
  1553				ctrl->prune_count += freed;
  1554			}
  1555		}
  1556	}
  1557	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
