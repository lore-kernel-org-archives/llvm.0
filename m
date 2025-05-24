Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F437E9;
	Sat, 24 May 2025 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748074898; cv=none; b=P4FAh6MTa7EL6CQ+AUyrqTUgOUP5CZB3QB6eS2GlwaZjPQFffyN0msazCbE0P8POA7mxzN6hSQUQ4+xctPJkaebRQPj3wU9J+HYiI6SIglxUDxx3KYFa4TZaAiZONk4U/nYKFE1IXCO+3Ir3+MNTSdGnA8d+rqTgiAtDUWpTio8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748074898; c=relaxed/simple;
	bh=2HfHbAFa+MA/nfQ79YxX2caqzVg8CqZ+O+es5dEUMe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iSUdZFA0bJZcYgiOYFU8uPC3ABbSeyXANhcgQGiADjwE2J/BOjZmK7hhI4ckB2FAQ1ctM+XLzxGn+pQrM8ZXU+6tsDywH8rgz6yIYK7XhVAcSaD3oaZozvm4Lgoje8W9M5cuNPwS0JEx3ex4Uc406XRlFi97ksNX0DxcBBLXCPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g91w2Trv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g91w2Trv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748074896; x=1779610896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2HfHbAFa+MA/nfQ79YxX2caqzVg8CqZ+O+es5dEUMe4=;
  b=g91w2TrvM4N6OKn9DHXQBV5y4e8/BZdMnj/1P1D5n4K+tYrDNCIvNRzY
   PRr1vK4WEsjchcZCpDmmMBqgnqAGSO8R8OawLK0RT6ygmKNoBL3F4VlCG
   o36p4IMt4KAWG4foLVNoH9D1RkaqiaAGRI7zyrM7jPFnhwcsthTWz7n6i
   lRNTH9VsOaDY2KOFv+Fg2VwejBkhuChYE4rBTJU+F4eOQh0TQUhMP/5x6
   7dV2imaR4W12Zq/mxl9zky5qKUZZPd4wfGLw08BqTO5EGlUqWszDnxyzO
   s+7ywyRapZZEntUtQiAVGHXgIchk+SlkkRRJtr6KoMTu3qBCSgfYDqtBV
   Q==;
X-CSE-ConnectionGUID: Brj/P39VR923P47ERvnCpQ==
X-CSE-MsgGUID: LfOu+ax2R+Gf82Sf7027bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50005308"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50005308"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 01:21:36 -0700
X-CSE-ConnectionGUID: VJ3VjTwARASe5w6kfFfGHA==
X-CSE-MsgGUID: 1+ZJHOCkSPu91eJWyBvGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146205957"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 May 2025 01:21:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIk8K-000R3K-0f;
	Sat, 24 May 2025 08:21:32 +0000
Date: Sat, 24 May 2025 16:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LUCI Bot <vijayendra.suman@oracle.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [jlayton:uek-localio 2037/2262] fs/dcache.c:1531:15: error: call to
 undeclared function 'get_nr_dentry'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202505241641.cjNXyGVb-lkp@intel.com>
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
commit: fbc8f7ca2ebf9db96aa3263c657ea2840840bdec [2037/2262] fs/dcache: Estimate the number of negative dentries to prune per filesystem
config: hexagon-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241641.cjNXyGVb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241641.cjNXyGVb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241641.cjNXyGVb-lkp@intel.com/

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
   fs/dcache.c:1530:19: error: call to undeclared function 'get_nr_dentry_negative'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1530 |         long count_neg = get_nr_dentry_negative();
         |                          ^
>> fs/dcache.c:1531:15: error: call to undeclared function 'get_nr_dentry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1531 |         long count = get_nr_dentry();
         |                      ^
   fs/dcache.c:1531:15: note: did you mean 'retain_dentry'?
   fs/dcache.c:944:20: note: 'retain_dentry' declared here
     944 | static inline bool retain_dentry(struct dentry *dentry, bool locked)
         |                    ^
   fs/dcache.c:1616:10: error: call to undeclared function 'get_nr_dentry_negative'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1616 |         count = get_nr_dentry_negative();
         |                 ^
   fs/dcache.c:1610:7: warning: variable 'last_n_neg' set but not used [-Wunused-but-set-variable]
    1610 |         long last_n_neg, excess, count;
         |              ^
   1 warning and 4 errors generated.


vim +/get_nr_dentry +1531 fs/dcache.c

  1521	
  1522	/*
  1523	 * Prune dentries from a super block.
  1524	 */
  1525	static void prune_negative_one_sb(struct super_block *sb, void *arg)
  1526	{
  1527		unsigned long freed = 0, scan_once = 0, this_sb_freed = 0;
  1528		long limit, lower_limit, this_sb_dentries, excess, prune_this_sb = 0;
  1529		int this_sb_pc = 0;
  1530		long count_neg = get_nr_dentry_negative();
> 1531		long count = get_nr_dentry();
  1532		struct prune_negative_ctrl *ctrl = arg;
  1533		LIST_HEAD(dispose);
  1534	
  1535		limit = neg_dentry_nfree_init + ctrl->prune_ncpus * neg_dentry_percpu_limit;
  1536	
  1537		/*
  1538		 * If the -ve dentry count is within the limit
  1539		 * and a prune is not on then do nothing.
  1540		 */
  1541		if (limit >= count_neg && !(ndblk.nprune_on))
  1542			return;
  1543	
  1544		/*
  1545		 * Set the prune on when the -ve
  1546		 * dentry count crosses the limit.
  1547		 */
  1548		if (!(ndblk.nprune_on) && (count_neg > limit))
  1549			ndblk.nprune_on = 1;
  1550	
  1551		/*
  1552		 * Add extra 30% so that once pruning starts,
  1553		 * it continues until we reach 70% of the limit.
  1554		 */
  1555		lower_limit = ctrl->prune_ncpus * (neg_dentry_percpu_limit -
  1556					((neg_dentry_percpu_limit * 30)/ 100));
  1557		/*
  1558		 * Set the prune off when the -ve dentry
  1559		 * count reaches the lower limit.
  1560		 */
  1561		if (count_neg <= lower_limit) {
  1562			ndblk.nprune_on = 0;
  1563			return;
  1564		}
  1565	
  1566		/*
  1567		 * Dentry to prune from this super block's LRU should be
  1568		 * proportional to the ratio of dentries present in this
  1569		 * SB's LRU to the total dentries present in the system.
  1570		 * Also, try to skip inmemory filesystems.
  1571		 */
  1572		this_sb_dentries = list_lru_elems(&sb->s_dentry_lru);
  1573		if (!this_sb_dentries)
  1574			return;
  1575		this_sb_pc = (this_sb_dentries * 100) / count;
  1576		if (!this_sb_pc)
  1577			this_sb_pc = 1;
  1578	
  1579		excess = count_neg - lower_limit;
  1580		prune_this_sb = (excess * this_sb_pc) / 100;
  1581		if (!prune_this_sb)
  1582			return; /* Negligible, skip this sb */
  1583	
  1584		if (ctrl->prune_percent) {
  1585			if (prune_this_sb > NEG_WALKING_CAP)
  1586				scan_once = NEG_WALKING_CAP;
  1587			else
  1588				scan_once = prune_this_sb;
  1589	
  1590			freed = list_lru_walk_all_nodes(&sb->s_dentry_lru,
  1591						dentry_negative_lru_isolate,
  1592						&dispose, this_sb_dentries, scan_once);
  1593			if (freed) {
  1594				shrink_dentry_list(&dispose);
  1595				this_sb_freed += freed;
  1596			}
  1597			ctrl->prune_count += this_sb_freed;
  1598		}
  1599	}
  1600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
