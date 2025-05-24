Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5603199FA2;
	Sat, 24 May 2025 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748093102; cv=none; b=hUvmuwXuBjOu0+xeVCZ/ouGo9akQ1k8ij9wwEOekBdNy58/hjMIQQYggZWjwU8GF38GHSbimwgKEfUDwSOvS6eZe7bDzvnMrwnqzMs7WEfDOdGEhBdtBDTfZOsooL6fD3n/3IIdWUIqWAVv53bKIzjvMBX/Zc4fUoYsMSnZXfWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748093102; c=relaxed/simple;
	bh=h1RtYF+5zEs27YqMEDsmMOWHEKpU9TcG8Q8KhjVJbSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pvrsjs2Eqec5a/jffRJ+ADAXDPLYsJJp72dlQgRVFAwsObzYo3z30wVuNGAqOqgNMPNOz+xliTNqW3che3Dqd38eE5fds6jJWivgP9yZbaoQIE7tHNlMFSPKF146oUr0Y4mCZ6ife0jzsQTtcE0UUuf8CZuif/bKrmZixKjgJrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fufhJtsf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fufhJtsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748093101; x=1779629101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1RtYF+5zEs27YqMEDsmMOWHEKpU9TcG8Q8KhjVJbSI=;
  b=fufhJtsfYQnygmSSoHkKtQUuozk1m18KvnE/+IYsf/PbREeWqqn3rKaZ
   BbuNNSMJPeuYaQn5mxQiOlyKT0iAKwYx1LsMGqy0Y3IcXqCXL8EmdZ4kt
   6wX5ZUGR5XSLANC+3oNh/acRMsjyuiIfG2vy/Bkp41rGzqu+RQ0mDZp5r
   Vznb7Uz/1iAgkqiogSZpOvltDWt48Tz/pqi/WnxEDQBHpFVxbU6dgdbNB
   tvXN2o0SSDRAjkmWYAg0BPuoLEddq7bzFbgP9xSDMWoPabesbdf1YDMY0
   4lVvdGRh7V5nvD6xsxmkSu+6PnB4vTM/vREIbWIpTPYAEOGS9bEokSoza
   A==;
X-CSE-ConnectionGUID: JzuQzWY/Q7uYsnhYHY8wSw==
X-CSE-MsgGUID: bxqLwgo3RAW/T154LbCA4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="61182284"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="61182284"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 06:25:00 -0700
X-CSE-ConnectionGUID: 7ZHrI35ISTqb5+399QgsBA==
X-CSE-MsgGUID: 3iGCelAERKS7eSmyhnMR1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="164795810"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 May 2025 06:24:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIorv-000RDg-39;
	Sat, 24 May 2025 13:24:55 +0000
Date: Sat, 24 May 2025 21:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LUCI Bot <vijayendra.suman@oracle.com>,
	Konrad Wilk <Konrad.wilk@oracle.com>
Subject: [jlayton:uek-localio 2182/2262] kernel/auditsc.c:827:13: warning:
 unknown pragma ignored
Message-ID: <202505242111.ChHzvXBl-lkp@intel.com>
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
commit: ea8c1ee70f911f6b6fb7f9a0c99f02e6e515e67f [2182/2262] audit: Re-apply special optimizations
config: arm-randconfig-003-20250524 (https://download.01.org/0day-ci/archive/20250524/202505242111.ChHzvXBl-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505242111.ChHzvXBl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505242111.ChHzvXBl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/auditsc.c:48:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
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
>> kernel/auditsc.c:827:13: warning: unknown pragma ignored [-Wunknown-pragmas]
     827 | #pragma GCC optimize("unswitch-loops", "align-loops=16", "align-jumps=16")
         |             ^
   kernel/auditsc.c:848:13: warning: unknown pragma ignored [-Wunknown-pragmas]
     848 | #pragma GCC reset_options
         |             ^
   2 warnings and 1 error generated.


vim +827 kernel/auditsc.c

   812	
   813	/**
   814	 * __audit_filter_op - common filter helper for operations (syscall/uring/etc)
   815	 * @tsk: associated task
   816	 * @ctx: audit context
   817	 * @list: audit filter list
   818	 * @name: audit_name (can be NULL)
   819	 * @op: current syscall/uring_op
   820	 *
   821	 * Run the udit filters specified in @list against @tsk using @ctx,
   822	 * @name, and @op, as necessary; the caller is responsible for ensuring
   823	 * that the call is made while the RCU read lock is held. The @name
   824	 * parameter can be NULL, but all others must be specified.
   825	 * Returns 1/true if the filter finds a match, 0/false if none are found.
   826	 */
 > 827	#pragma GCC optimize("unswitch-loops", "align-loops=16", "align-jumps=16")
   828	static int __audit_filter_op(struct task_struct *tsk,
   829				   struct audit_context *ctx,
   830				   struct list_head *list,
   831				   struct audit_names *name,
   832				   unsigned long op)
   833	{
   834		struct audit_entry *e;
   835		enum audit_state state;
   836	
   837		list_for_each_entry_rcu(e, list, list) {
   838			if (unlikely(audit_in_mask(&e->rule, op))) {
   839				if (audit_filter_rules(tsk, &e->rule, ctx, name,
   840							&state, false)) {
   841					ctx->current_state = state;
   842					return 1;
   843				}
   844			}
   845		}
   846		return 0;
   847	}
   848	#pragma GCC reset_options
   849	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
