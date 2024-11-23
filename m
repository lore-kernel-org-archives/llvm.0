Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF52AE90;
	Sat, 23 Nov 2024 03:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732331521; cv=none; b=ozNHV1CBRUbc9HXqK4rJWRC5kFu89UpS+uGvoDiUuJOfpT3eLNV9xR1zCPEVuyy49mg1p4/kzBAJgStYHdo2IX0DPrrVp3omw/XsxxzoFmmjcBeLAGWZ5K24qSdOjgeWhb1dqZ47bPgDzIdKRcAtAKbf1Z4lvgLXUsYaKYswdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732331521; c=relaxed/simple;
	bh=yR3P5F5hSDlLZrFWh4o9BRpqxlOR0gk+HeGh7rkUKCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KDGirX/7FAGoC0JQYBkjVM310diLYKBpv0vzRFsu5rIqa6ElAkS9AIsBtGaSRrno64JR+RA65DtFsbYy8pDENEKFf/2o7CTGGELvzCTlRSMUlgSQbWJir9UVqR5Hnor+hXpvLWUSbU0vmsAku2ob1r6ExxWL2Zpo/uH4S+L+oFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gr4U97Wz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gr4U97Wz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732331519; x=1763867519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yR3P5F5hSDlLZrFWh4o9BRpqxlOR0gk+HeGh7rkUKCg=;
  b=Gr4U97WzNZPE7q4uUjx/jaIBBFxx4g7e7RDU0Vhw6Je1PrrpkzXJ239x
   1PWG3qJEdyql1P0+3uZ9vDxjKpi0nCS46v4U58C3lu3S2mWKLABxG9wAa
   1Paf6/9FDL83+2woLTgFhK6VxxBdHUE08FdQ24MHmeQzqFOu84kV5PDnD
   DyZRdvw+KVBHt0pksxDcfQpnJvH+NGpeYDA8nB4h5qqeLQf58COWnAomV
   rxnDJJfC06gVOqu3UIGubXsX6Q4D525970vVVM4iIwWhnSE1FO0iZB0b7
   7BZhkTtf9V6Jf4Mxlq6H4no9Qrv8mIfNRC85gVih1DuVN1xI3v9D4TPSh
   w==;
X-CSE-ConnectionGUID: SJ/aS3tyRx68dfwbzWRoeQ==
X-CSE-MsgGUID: Bh3LzHuyR+GwkTk/lF61Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="50015378"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="50015378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 19:11:58 -0800
X-CSE-ConnectionGUID: uMfvE+D1SPa/q2caFalmWA==
X-CSE-MsgGUID: T6LYPPWZQouWcEehD2k4fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95804545"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2024 19:11:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEgYs-0004NP-2G;
	Sat, 23 Nov 2024 03:11:54 +0000
Date: Sat, 23 Nov 2024 11:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-defer-tw 8/8] io_uring/io_uring.c:1212:7:
 error: call to undeclared function 'wq_cmpxchg_list'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202411231105.ZzhsQXcO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-defer-tw
head:   3fe10ec9996723e6abc1b8e5b2b9d4ecf9eaf1b8
commit: 3fe10ec9996723e6abc1b8e5b2b9d4ecf9eaf1b8 [8/8] io_uring: add lockless LIFO list implementation for task_work
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241123/202411231105.ZzhsQXcO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231105.ZzhsQXcO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231105.ZzhsQXcO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/io_uring.c:82:
   In file included from io_uring/io_uring.h:12:
   io_uring/slist.h:91:7: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      91 |         bool ret = false;
         |              ^
>> io_uring/io_uring.c:1212:7: error: call to undeclared function 'wq_cmpxchg_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1212 |                 if (wq_cmpxchg_list(&l->list_ptr, &old.list_ptr, new.list_ptr)) {
         |                     ^
   io_uring/io_uring.c:1212:7: note: did you mean 'xa_cmpxchg_irq'?
   include/linux/xarray.h:748:21: note: 'xa_cmpxchg_irq' declared here
     748 | static inline void *xa_cmpxchg_irq(struct xarray *xa, unsigned long index,
         |                     ^
   io_uring/io_uring.c:1247:8: error: call to undeclared function 'wq_cmpxchg_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1247 |                 if (!wq_cmpxchg_list(&l->list_ptr, &dst->list_ptr, new.list_ptr))
         |                      ^
   2 warnings and 2 errors generated.


vim +/wq_cmpxchg_list +1212 io_uring/io_uring.c

  1197	
  1198	static void wq_ll_add_tail(struct io_wq_work_node *n, struct io_wq_work_list *l)
  1199	{
  1200		n->next = NULL;
  1201		do {
  1202			struct io_wq_work_list new = {
  1203				.first	= READ_ONCE(l->first) ?: n,
  1204				.last	= n
  1205			};
  1206			struct io_wq_work_list old = {
  1207				.first	= READ_ONCE(l->first),
  1208				.last	= READ_ONCE(l->last)
  1209			};
  1210			struct io_wq_work_node *old_last = READ_ONCE(l->last);
  1211	
> 1212			if (wq_cmpxchg_list(&l->list_ptr, &old.list_ptr, new.list_ptr)) {
  1213				if (old_last)
  1214					WRITE_ONCE(old_last->next, n);
  1215				break;
  1216			}
  1217		} while (1);
  1218	}
  1219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
